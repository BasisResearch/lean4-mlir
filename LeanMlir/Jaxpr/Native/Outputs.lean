module
public import LeanMlir.Jaxpr.Native.ABIInstructions

@[expose] public section
namespace LeanMlir.Jaxpr.Native

def atomBits (a : Atom) (s : RegisterState) : UInt32 :=
  match a with
  | .var slot => readWord s.memory (slotAddress s.gpr.rdi slot)
  | .literal bits => bits

theorem ofBits_atomBits (a : Atom) (s : RegisterState) :
    Float32.ofBits (atomBits a s) = a.eval s.data.env := by
  cases a <;> rfl

def emitOutput (a : Atom) : List ABIInstruction :=
  (selectAtom0 a).map ABIInstruction.core ++ [.storeOutput, .advanceOutput]

def compileOutputs : List Atom → List ABIInstruction
  | [] => []
  | a :: rest => emitOutput a ++ compileOutputs rest

def outputStep (a : Atom) (s : RegisterState) : RegisterState := runABI (emitOutput a) s

@[simp] theorem outputStep_memory (a : Atom) (s : RegisterState) :
    (outputStep a s).memory = writeWord s.memory s.gpr.rsi (atomBits a s) := by
  cases a <;> simp [outputStep, emitOutput, selectAtom0, runABI,
    ABIInstruction.effect, Instruction.registerStep, atomBits, slotAddress]

@[simp] theorem outputStep_rsi (a : Atom) (s : RegisterState) :
    (outputStep a s).gpr.rsi = s.gpr.rsi + 4 := by
  cases a <;> rfl

@[simp] theorem outputStep_rdi (a : Atom) (s : RegisterState) :
    (outputStep a s).gpr.rdi = s.gpr.rdi := by cases a <;> rfl

@[simp] theorem outputStep_rsp (a : Atom) (s : RegisterState) :
    (outputStep a s).gpr.rsp = s.gpr.rsp := by cases a <;> rfl

@[simp] theorem outputStep_mxcsr (a : Atom) (s : RegisterState) :
    (outputStep a s).mxcsr = s.mxcsr := by cases a <;> rfl

theorem outputStep_env (a : Atom) (s : RegisterState)
    (h : ∀ slot, WordSeparate s.gpr.rsi (slotAddress s.gpr.rdi slot)) :
    (outputStep a s).data.env = s.data.env := by
  funext slot
  simp only [DataState.env, RegisterState.data, outputStep_rdi, outputStep_memory]
  rw [writeWord_separate (h slot).symm]

theorem runOutputs_cons (a : Atom) (rest : List Atom) (s : RegisterState) :
    runABI (compileOutputs (a :: rest)) s =
      runABI (compileOutputs rest) (outputStep a s) := by
  exact runABI_append _ _ _

theorem output_word_frame (atoms : List Atom) (s : RegisterState) (address : UInt64)
    (h : ∀ i : Fin atoms.length, WordSeparate address (outputAddress s.gpr.rsi i.val)) :
    readWord (runABI (compileOutputs atoms) s).memory address = readWord s.memory address := by
  induction atoms generalizing s with
  | nil => rfl
  | cons a rest ih =>
    rw [runOutputs_cons, ih]
    · rw [outputStep_memory]
      apply writeWord_separate
      simpa using h ⟨0, by simp⟩
    · intro i
      simpa using h ⟨i.val + 1, by simp⟩

theorem compileOutputs_correct (atoms : List Atom) (s : RegisterState)
    (layout : OutputLayout s.gpr.rsi atoms.length s.gpr.rdi) :
    (readOutputBits (runABI (compileOutputs atoms) s).memory s.gpr.rsi atoms.length).map
      Float32.ofBits = atoms.map (Atom.eval s.data.env) := by
  induction atoms generalizing s with
  | nil => rfl
  | cons a rest ih =>
    rw [runOutputs_cons, List.length_cons, readOutputBits_succ, List.map_cons, List.map_cons]
    have hs : ∀ slot, WordSeparate s.gpr.rsi (slotAddress s.gpr.rdi slot) := by
      intro slot
      simpa using layout.slotsSeparate ⟨0, by simp⟩ slot
    have hframe : readWord (runABI (compileOutputs rest) (outputStep a s)).memory s.gpr.rsi =
        readWord (outputStep a s).memory s.gpr.rsi := by
      apply output_word_frame
      intro i
      have hne : (⟨0, by simp⟩ : Fin (rest.length + 1)) ≠ ⟨i.val + 1, by omega⟩ := by
        intro heq
        have := congrArg Fin.val heq
        simp at this
      simpa using layout.wordsSeparate ⟨0, by simp⟩ ⟨i.val + 1, by simp⟩ hne
    rw [hframe, outputStep_memory, readWord_writeWord, ofBits_atomBits]
    congr 1
    have htail : OutputLayout (outputStep a s).gpr.rsi rest.length (outputStep a s).gpr.rdi := by
      simpa using layout.tail
    simpa [outputStep_env a s hs] using ih (outputStep a s) htail

theorem compileOutputs_fixed (atoms : List Atom) :
    ∀ i ∈ compileOutputs atoms, FixedEffect i := by
  induction atoms with
  | nil => simp [compileOutputs]
  | cons a rest ih =>
    cases a <;> simpa [compileOutputs, emitOutput, selectAtom0, FixedEffect, floatingResult] using ih

theorem outputs_execution_iff (atoms : List Atom) :
    ABIExecution (compileOutputs atoms) s final ↔ final = runABI (compileOutputs atoms) s :=
  fixed_execution_iff (compileOutputs_fixed atoms)

theorem outputs_execution_correct (atoms : List Atom)
    (layout : OutputLayout s.gpr.rsi atoms.length s.gpr.rdi)
    (h : ABIExecution (compileOutputs atoms) s final) :
    (readOutputBits final.memory s.gpr.rsi atoms.length).map Float32.ofBits =
      atoms.map (Atom.eval s.data.env) := by
  rw [(outputs_execution_iff atoms).mp h]
  exact compileOutputs_correct atoms s layout

theorem outputStep_frame (a : Atom) (s : RegisterState) : CalleeFrame s (outputStep a s) := by
  cases a <;> simp [CalleeFrame, outputStep, emitOutput, selectAtom0, runABI,
    ABIInstruction.effect, Instruction.registerStep]

theorem CalleeFrame.trans (h : CalleeFrame a b) (h' : CalleeFrame b c) : CalleeFrame a c := by
  rcases h with ⟨h1,h2,h3,h4,h5,h6,h7,h8,h9,h10⟩
  rcases h' with ⟨h1',h2',h3',h4',h5',h6',h7',h8',h9',h10'⟩
  exact ⟨h1'.trans h1,h2'.trans h2,h3'.trans h3,h4'.trans h4,h5'.trans h5,
    h6'.trans h6,h7'.trans h7,h8'.trans h8,h9'.trans h9,h10'.trans h10⟩

theorem runOutputs_frame (atoms : List Atom) (s : RegisterState) :
    CalleeFrame s (runABI (compileOutputs atoms) s) ∧
    (runABI (compileOutputs atoms) s).gpr.rdi = s.gpr.rdi ∧
    (runABI (compileOutputs atoms) s).gpr.rsp = s.gpr.rsp ∧
    (runABI (compileOutputs atoms) s).mxcsr = s.mxcsr := by
  induction atoms generalizing s with
  | nil => simp [compileOutputs, runABI, CalleeFrame]
  | cons a rest ih =>
    rw [runOutputs_cons]
    obtain ⟨hf,hd,hp,hm⟩ := ih (outputStep a s)
    exact ⟨(outputStep_frame a s).trans hf,
      hd.trans (outputStep_rdi a s), hp.trans (outputStep_rsp a s),
      hm.trans (outputStep_mxcsr a s)⟩

end LeanMlir.Jaxpr.Native
