module
public import LeanMlir.Jaxpr.Native.CodeMemory

@[expose] public section
namespace LeanMlir.Jaxpr.Native

/-- Execution of a loaded code fragment. PC advances by decoded instruction
    length; every fetch reads the current memory. The byte budget denotes the
    fragment boundary, not a machine RET. Architectural faults and permissions
    are still outside this relation. -/
inductive FetchedExecution : Nat → UInt64 → DataState → UInt64 → DataState → Prop where
  | done : FetchedExecution 0 pc s pc s
  | step (decoded : decodeInstruction (readBytes s.memory pc count) = some (i, tail))
      (progress : tail.length < count) (transition : DataTransition i s mid)
      (rest : FetchedExecution tail.length (pc + UInt64.ofNat (count - tail.length)) mid endpc final) :
      FetchedExecution count pc s endpc final

private theorem instruction_bytes_positive (i : Instruction) : 0 < i.encode.length := by
  cases i <;> simp [Instruction.encode, bytes32]

/-- Lifts every data execution to fetches from a persistent instruction image.
    No step assumes that its code bytes survived the previous store. -/
theorem lift_data_execution (h : DataExecution instructions s final)
    (hc : CodeAt s.memory pc (encodeInstructions instructions))
    (sep : CodeSeparate pc (encodeInstructions instructions).length s.rdi) :
    FetchedExecution (encodeInstructions instructions).length pc s
      (pc + UInt64.ofNat (encodeInstructions instructions).length) final := by
  induction h generalizing pc with
  | @nil state => simpa [encodeInstructions] using (FetchedExecution.done (pc := pc) (s := state))
  | @cons i s mid rest final step tail ih =>
    have hmem := transition_preserves_code step hc sep
    have hb := transition_preserves_base step
    have hcode : CodeAt mid.memory (pc + UInt64.ofNat i.encode.length) (encodeInstructions rest) :=
      codeAt_suffix hmem
    have hsep : CodeSeparate (pc + UInt64.ofNat i.encode.length)
        (encodeInstructions rest).length mid.rdi := by
      rw [hb]
      exact codeSeparate_suffix sep
    have ht := ih hcode hsep
    have hd : decodeInstruction (readBytes s.memory pc (encodeInstructions (i :: rest)).length) =
        some (i, encodeInstructions rest) := by
      rw [readBytes_codeAt hc]
      exact decodeInstruction_encode i _
    have hp : (encodeInstructions rest).length < (encodeInstructions (i :: rest)).length := by
      have := instruction_bytes_positive i
      simp only [encodeInstructions, List.flatMap_cons, List.length_append] at *
      omega
    apply FetchedExecution.step hd hp step
    simpa [encodeInstructions, List.length_append, UInt64.ofNat_add, UInt64.add_assoc] using ht

/-- Every fetched execution of the loaded image refines the instruction-list
    relation, including every raw NaN choice. -/
theorem fetched_execution_refines (instructions : List Instruction)
    (hc : CodeAt s.memory pc (encodeInstructions instructions))
    (sep : CodeSeparate pc (encodeInstructions instructions).length s.rdi)
    (h : FetchedExecution (encodeInstructions instructions).length pc s endpc final) :
    DataExecution instructions s final := by
  induction instructions generalizing s pc with
  | nil =>
    cases h with
    | done => exact .nil
    | step _ hp _ _ => simp [encodeInstructions] at hp
  | cons i rest ih =>
    have hpositive : 0 < (encodeInstructions (i :: rest)).length := by
      have := instruction_bytes_positive i
      simp only [encodeInstructions, List.flatMap_cons, List.length_append]
      omega
    have hd : decodeInstruction (readBytes s.memory pc (encodeInstructions (i :: rest)).length) =
        some (i, encodeInstructions rest) := by
      rw [readBytes_codeAt hc]
      exact decodeInstruction_encode i _
    generalize hn : (encodeInstructions (i :: rest)).length = n at h hd hpositive
    cases h with
    | done => omega
    | @step pc n s actual bytes mid endpc final decoded hp transition tail =>
      rw [hd] at decoded
      cases Option.some.inj decoded
      have hc' := transition_preserves_code transition hc sep
      have hb := transition_preserves_base transition
      have hsub : n - (encodeInstructions rest).length = i.encode.length := by
        simp only [encodeInstructions, List.flatMap_cons, List.length_append] at hn
        change n - (rest.flatMap Instruction.encode).length = i.encode.length
        omega
      rw [hsub] at tail
      apply DataExecution.cons transition
      apply ih (codeAt_suffix hc') _ tail
      rw [hb]
      exact codeSeparate_suffix sep

theorem jaxpr_fetched_execution (p : Jaxpr)
    (hc : CodeAt s.memory pc (encodeInstructions (selectEquations p.equations)))
    (sep : CodeSeparate pc (encodeInstructions (selectEquations p.equations)).length s.rdi)
    (h : FetchedExecution (encodeInstructions (selectEquations p.equations)).length pc s endpc final) :
    p.outputs.map (Atom.eval final.env) = p.eval s.env := by
  exact jaxpr_execution p (fetched_execution_refines _ hc sep h)

/-- Native-byte execution exists for every source program with a loaded,
    separated instruction image. This still ends at the fragment boundary. -/
theorem jaxpr_fetched_execution_exists (p : Jaxpr) (s : DataState) (pc : UInt64)
    (hc : CodeAt s.memory pc (encodeInstructions (selectEquations p.equations)))
    (sep : CodeSeparate pc (encodeInstructions (selectEquations p.equations)).length s.rdi) :
    ∃ final, FetchedExecution (encodeInstructions (selectEquations p.equations)).length pc s
      (pc + UInt64.ofNat (encodeInstructions (selectEquations p.equations)).length) final ∧
      p.outputs.map (Atom.eval final.env) = p.eval s.env := by
  have hx := canonical_execution (selectEquations p.equations) s
  exact ⟨_, lift_data_execution hx hc sep, jaxpr_execution p hx⟩

end LeanMlir.Jaxpr.Native
