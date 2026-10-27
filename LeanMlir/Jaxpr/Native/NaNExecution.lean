module
public import LeanMlir.Jaxpr.Native.Select

@[expose] public section
namespace LeanMlir.Jaxpr.Native

/-- IEEE result specification for scalar arithmetic. Raw NaN payloads are not
    chosen here: the transition relation permits every representation of NaN.
    Control/status flags are outside this data-level relation. -/
def floatingResult (i : Instruction) (s : DataState) : Option Float32 :=
  match i with
  | .addss => some (Float32.add (Float32.ofBits s.xmm0) (Float32.ofBits s.xmm1))
  | .subss => some (Float32.sub (Float32.ofBits s.xmm0) (Float32.ofBits s.xmm1))
  | .mulss => some (Float32.mul (Float32.ofBits s.xmm0) (Float32.ofBits s.xmm1))
  | .divss => some (Float32.div (Float32.ofBits s.xmm0) (Float32.ofBits s.xmm1))
  | .sqrtss => some (Float32.sqrt (Float32.ofBits s.xmm0))
  | _ => none

/-- Raw-bit data transitions, including noncanonical NaN results. -/
inductive DataTransition : Instruction → DataState → DataState → Prop where
  | fixed (h : floatingResult i s = none) : DataTransition i s (i.dataStep s)
  | floating (h : floatingResult i s = some value)
      (bits : UInt32) (repr : Float32.ofBits bits = value) :
      DataTransition i s { s with xmm0 := bits }

inductive DataExecution : List Instruction → DataState → DataState → Prop where
  | nil : DataExecution [] s s
  | cons : DataTransition i s mid → DataExecution rest mid final →
      DataExecution (i :: rest) s final

/-- The relation has an execution for every program and initial state. -/
theorem canonical_transition (i : Instruction) (s : DataState) :
    DataTransition i s (i.dataStep s) := by
  cases i <;> first
    | exact .fixed rfl
    | exact .floating rfl _ (ofBits_toBits _)

theorem canonical_execution (code : List Instruction) (s : DataState) :
    DataExecution code s (runData code s) := by
  induction code generalizing s with
  | nil => exact .nil
  | cons i rest ih => exact .cons (canonical_transition i s) (ih _)

/-- Relational byte execution. Arithmetic steps may choose any NaN payload.
    Every instruction is decoded from target bytes during the execution. -/
inductive ByteDataExecution : List UInt8 → DataState → DataState → Prop where
  | nil : ByteDataExecution [] s s
  | step (decoded : decodeInstruction bytes = some (i, rest)) :
      DataTransition i s mid → ByteDataExecution rest mid final →
      ByteDataExecution bytes s final

theorem byte_execution_encode_iff (code : List Instruction) (s final : DataState) :
    ByteDataExecution (encodeInstructions code) s final ↔ DataExecution code s final := by
  induction code generalizing s with
  | nil =>
    constructor
    · intro h
      cases h with
      | nil => exact .nil
      | step hd _ _ => simp [encodeInstructions, decodeInstruction] at hd
    · intro h; cases h; exact .nil
  | cons i rest ih =>
    have hd : decodeInstruction (encodeInstructions (i :: rest)) =
        some (i, encodeInstructions rest) := by
      exact decodeInstruction_encode i (encodeInstructions rest)
    constructor
    · intro h
      generalize hb : encodeInstructions (i :: rest) = bytes at h hd
      cases h with
      | nil => simp [decodeInstruction] at hd
      | step dec hs ht =>
        rw [hd] at dec
        cases Option.some.inj dec
        exact .cons hs ((ih _).mp ht)
    · intro h
      cases h with
      | cons hs ht => exact .step hd hs ((ih _).mpr ht)

theorem execution_append_iff (a b : List Instruction) (s final : DataState) :
    DataExecution (a ++ b) s final ↔
      ∃ mid, DataExecution a s mid ∧ DataExecution b mid final := by
  induction a generalizing s with
  | nil =>
    constructor
    · intro h; exact ⟨s, .nil, h⟩
    · rintro ⟨mid, h, ht⟩; cases h; exact ht
  | cons i rest ih =>
    constructor
    · intro h
      cases h with
      | cons hi ht =>
        obtain ⟨mid, hr, hb⟩ := (ih _).mp ht
        exact ⟨mid, .cons hi hr, hb⟩
    · rintro ⟨mid, h, hb⟩
      cases h with
      | cons hi hr => exact .cons hi ((ih _).mpr ⟨mid, hr, hb⟩)

theorem fixed_execution (code : List Instruction)
    (fixed : ∀ i ∈ code, ∀ s, floatingResult i s = none)
    (h : DataExecution code s final) : final = runData code s := by
  induction h with
  | nil => rfl
  | @cons i s mid rest final hi ht ih =>
    have hfixed := fixed i (by simp) s
    cases hi with
    | fixed _ => exact ih (by intro j hj; exact fixed j (by simp [hj]))
    | floating hp bits repr => simp [hfixed] at hp

theorem atom0_execution (a : Atom) (h : DataExecution (selectAtom0 a) s final) :
    final = runData (selectAtom0 a) s := by
  apply fixed_execution _ _ h
  cases a <;> simp [selectAtom0, floatingResult]

theorem atom1_execution (a : Atom) (h : DataExecution (selectAtom1 a) s final) :
    final = runData (selectAtom1 a) s := by
  apply fixed_execution _ _ h
  cases a <;> simp [selectAtom1, floatingResult]

theorem unary_execution (op : Unary) (h : DataExecution (selectUnary op) s final) :
    Float32.ofBits final.xmm0 = op.eval (Float32.ofBits s.xmm0) ∧ final.env = s.env := by
  cases op with
  | neg =>
    have heq := fixed_execution _ (by simp [selectUnary, floatingResult]) h
    subst final; exact selectUnary_correct .neg s
  | abs =>
    have heq := fixed_execution _ (by simp [selectUnary, floatingResult]) h
    subst final; exact selectUnary_correct .abs s
  | sqrt =>
    cases h with
    | cons hs ht =>
      cases ht
      cases hs with
      | fixed hf => simp [floatingResult] at hf
      | floating hf bits repr =>
        simp only [floatingResult, Option.some.injEq] at hf
        exact ⟨repr.trans hf.symm, rfl⟩

theorem binary_transition (op : Binary) (h : DataTransition (selectBinary op) s final) :
    Float32.ofBits final.xmm0 = op.eval (Float32.ofBits s.xmm0) (Float32.ofBits s.xmm1) ∧
      final.env = s.env := by
  cases op <;> cases h with
  | fixed hf => simp [selectBinary, floatingResult] at hf
  | floating hf bits repr =>
    simp only [selectBinary, floatingResult, Option.some.injEq] at hf
    exact ⟨repr.trans hf.symm, rfl⟩

/-- Every execution of generated operations has the source value, including
    executions choosing different NaN payloads at every arithmetic instruction.
    This does not assert NaN equivalence for arbitrary bitwise programs. -/
theorem operation_execution (op : Operation)
    (h : DataExecution (selectOperation op) s final) :
    Float32.ofBits final.xmm0 = op.eval s.env ∧ final.env = s.env := by
  cases op with
  | copy a =>
    have heq := atom0_execution a h
    subst final; exact selectAtom0_correct a s
  | unary op a =>
    obtain ⟨mid, ha, ho⟩ := (execution_append_iff _ _ _ _).mp h
    have heq := atom0_execution a ha
    subst mid
    have hv := selectAtom0_correct a s
    simpa [Operation.eval, hv.1, hv.2] using unary_execution op ho
  | binary op a b =>
    obtain ⟨mid, hab, ho⟩ := (execution_append_iff _ _ _ _).mp h
    obtain ⟨first, ha, hb⟩ := (execution_append_iff _ _ _ _).mp hab
    have hea := atom0_execution a ha
    subst first
    have heb := atom1_execution b hb
    subst mid
    have hva := selectAtom0_correct a s
    have hvb := selectAtom1_correct b (runData (selectAtom0 a) s)
    cases ho with
    | cons hs ht =>
      cases ht
      simpa [Operation.eval, hvb.1, hvb.2.1, hvb.2.2, hva.1, hva.2]
        using binary_transition op hs

theorem equation_execution (e : Equation) (h : DataExecution (selectEquation e) s final) :
    final.env = store s.env e.result (e.operation.eval s.env) := by
  obtain ⟨mid, hop, hs⟩ := (execution_append_iff _ _ _ _).mp h
  have hv := operation_execution e.operation hop
  have hf := fixed_execution _ (by simp [floatingResult]) hs
  subst final
  simp only [runData]
  rw [store0_env]
  change store mid.env e.result (Float32.ofBits mid.xmm0) = _
  rw [hv.1, hv.2]

theorem equations_execution (eqs : List Equation)
    (h : DataExecution (selectEquations eqs) s final) :
    final.env = evalEquations eqs s.env := by
  induction eqs generalizing s with
  | nil => cases h; rfl
  | cons e rest ih =>
    change DataExecution (selectEquation e ++ selectEquations rest) s final at h
    obtain ⟨mid, he, hr⟩ := (execution_append_iff _ _ _ _).mp h
    rw [ih hr, equation_execution e he]
    rfl

/-- All programs and all raw-bit data traces, not one certificate per execution. -/
theorem jaxpr_execution (p : Jaxpr)
    (h : DataExecution (selectEquations p.equations) s final) :
    p.outputs.map (Atom.eval final.env) = p.eval s.env := by
  rw [equations_execution p.equations h]
  rfl

/-- Universal preservation through bytes for every target NaN choice. -/
theorem jaxpr_byte_execution (p : Jaxpr)
    (h : ByteDataExecution (encodeInstructions (selectEquations p.equations)) s final) :
    p.outputs.map (Atom.eval final.env) = p.eval s.env := by
  exact jaxpr_execution p ((byte_execution_encode_iff _ _ _).mp h)

/-- Adequacy accompanies preservation: compilation never rejects a source
    program, and emitted bytes have a data execution for every initial state. -/
theorem jaxpr_byte_execution_exists (p : Jaxpr) (s : DataState) :
    ∃ final, ByteDataExecution (encodeInstructions (selectEquations p.equations)) s final ∧
      p.outputs.map (Atom.eval final.env) = p.eval s.env := by
  have hex := (byte_execution_encode_iff _ _ _).mpr (canonical_execution (selectEquations p.equations) s)
  exact ⟨_, hex, jaxpr_byte_execution p hex⟩

end LeanMlir.Jaxpr.Native
