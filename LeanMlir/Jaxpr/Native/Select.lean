module
public import LeanMlir.Jaxpr.Native.Instructions

@[expose] public section
namespace LeanMlir.Jaxpr.Native

def selectAtom0 : Atom → List Instruction
  | .var slot => [.movEax slot, .load0]
  | .literal bits => [.movEax bits, .movd0]

def selectAtom1 : Atom → List Instruction
  | .var slot => [.movEax slot, .load1]
  | .literal bits => [.movEax bits, .movd1]

def selectUnary : Unary → List Instruction
  | .neg => [.movEax 2147483648, .movd1, .xorps]
  | .abs => [.movEax 2147483647, .movd1, .andps]
  | .sqrt => [.sqrtss]

def selectBinary : Binary → Instruction
  | .add => .addss
  | .sub => .subss
  | .mul => .mulss
  | .div => .divss

def selectOperation : Operation → List Instruction
  | .copy a => selectAtom0 a
  | .unary op a => selectAtom0 a ++ selectUnary op
  | .binary op a b => selectAtom0 a ++ selectAtom1 b ++ [selectBinary op]

def selectEquation (e : Equation) : List Instruction :=
  selectOperation e.operation ++ [.movEax e.result, .store0]

def selectEquations (eqs : List Equation) : List Instruction :=
  eqs.flatMap selectEquation

theorem selectAtom0_correct (a : Atom) (s : DataState) :
    Float32.ofBits (runData (selectAtom0 a) s).xmm0 = a.eval s.env ∧
    (runData (selectAtom0 a) s).env = s.env := by
  cases a <;> simp [selectAtom0, runData, Instruction.dataStep, Atom.eval, DataState.env] <;> rfl

theorem selectAtom1_correct (a : Atom) (s : DataState) :
    Float32.ofBits (runData (selectAtom1 a) s).xmm1 = a.eval s.env ∧
    (runData (selectAtom1 a) s).xmm0 = s.xmm0 ∧
    (runData (selectAtom1 a) s).env = s.env := by
  cases a <;> simp [selectAtom1, runData, Instruction.dataStep, Atom.eval, DataState.env] <;> rfl

theorem selectUnary_correct (op : Unary) (s : DataState) :
    Float32.ofBits (runData (selectUnary op) s).xmm0 = op.eval (Float32.ofBits s.xmm0) ∧
    (runData (selectUnary op) s).env = s.env := by
  cases op <;> simp [selectUnary, runData, Instruction.dataStep, Unary.eval,
    ofBits_toBits, ofBits_xor_sign, ofBits_and_abs] <;> rfl

theorem selectBinary_correct (op : Binary) (s : DataState) :
    Float32.ofBits ((selectBinary op).dataStep s).xmm0 =
      op.eval (Float32.ofBits s.xmm0) (Float32.ofBits s.xmm1) ∧
    ((selectBinary op).dataStep s).env = s.env := by
  cases op <;> simp [selectBinary, Instruction.dataStep, Binary.eval, ofBits_toBits] <;> rfl

theorem selectOperation_correct (op : Operation) (s : DataState) :
    Float32.ofBits (runData (selectOperation op) s).xmm0 = op.eval s.env ∧
    (runData (selectOperation op) s).env = s.env := by
  cases op with
  | copy a => exact selectAtom0_correct a s
  | unary op a =>
    have ha := selectAtom0_correct a s
    have ho := selectUnary_correct op (runData (selectAtom0 a) s)
    simpa [selectOperation, runData_append, Operation.eval, ha.1, ha.2] using ho
  | binary op a b =>
    have ha := selectAtom0_correct a s
    have hb := selectAtom1_correct b (runData (selectAtom0 a) s)
    have ho := selectBinary_correct op (runData (selectAtom1 b) (runData (selectAtom0 a) s))
    simpa [selectOperation, runData_append, runData, Operation.eval,
      hb.1, hb.2.1, hb.2.2, ha.1, ha.2] using ho

theorem store0_env (s : DataState) :
    (Instruction.store0.dataStep s).env = store s.env s.eax (Float32.ofBits s.xmm0) := by
  funext slot
  by_cases h : slot = s.eax
  · subst slot
    simp [Instruction.dataStep, DataState.env, store, readWord_writeWord]
  · simp [Instruction.dataStep, DataState.env, store, h,
      readWord_writeWord_other s.memory s.rdi slot s.eax h s.xmm0]

theorem selectEquation_correct (e : Equation) (s : DataState) :
    (runData (selectEquation e) s).env = store s.env e.result (e.operation.eval s.env) := by
  have ho := selectOperation_correct e.operation s
  simp only [selectEquation, runData_append, runData]
  rw [store0_env]
  change store (runData (selectOperation e.operation) s).env e.result
    (Float32.ofBits (runData (selectOperation e.operation) s).xmm0) = _
  rw [ho.1, ho.2]

/-- Universal instruction-selection theorem. No finite corpus or per-program
    check is a premise. The remaining ISA refinement must lift this data-state
    theorem to the full architectural execution relation. -/
theorem selectEquations_correct (eqs : List Equation) (s : DataState) :
    (runData (selectEquations eqs) s).env = evalEquations eqs s.env := by
  induction eqs generalizing s with
  | nil => rfl
  | cons eq rest ih =>
    simp only [selectEquations, List.flatMap_cons, runData_append]
    change (runData (selectEquations rest) (runData (selectEquation eq) s)).env = _
    rw [ih, selectEquation_correct]
    rfl

/-- Composition includes actual emitted bytes, decoder, register operations,
    byte loads/stores and all source equations. It still targets the data
    projection, not full architectural execution. -/
theorem selectedBytes_correct (p : Jaxpr) (s : DataState) (extra : Nat) :
    (runDataBytes ((selectEquations p.equations).length + extra)
      (encodeInstructions (selectEquations p.equations)) s).map
        (fun final => p.outputs.map (Atom.eval final.env)) = some (p.eval s.env) := by
  rw [runDataBytes_encode]
  simp [selectEquations_correct, Jaxpr.eval]

end LeanMlir.Jaxpr.Native
