module
public import LeanMlir.Jaxpr.Native.Outputs
public import LeanMlir.Jaxpr.Native.CodeMemory

@[expose] public section
namespace LeanMlir.Jaxpr.Native

theorem data_execution_word_frame (h : DataExecution code s final)
    (sep : ∀ slot, WordSeparate address (slotAddress s.rdi slot)) :
    readWord final.memory address = readWord s.memory address := by
  induction h with
  | nil => rfl
  | cons hs ht ih =>
    have hb := transition_preserves_base hs
    rw [ih (by simpa [hb] using sep)]
    cases hs with
    | fixed hf =>
      cases ‹Instruction› <;> first
        | rfl
        | exact writeWord_separate (sep _) _ _
    | floating hf bits repr => rfl

theorem register_execution_frame (h : RegisterExecution code s final) :
    CalleeFrame s final ∧ final.gpr.rsi = s.gpr.rsi ∧
      final.gpr.rsp = s.gpr.rsp ∧ final.gpr.rdi = s.gpr.rdi := by
  induction h with
  | nil => simp [CalleeFrame]
  | cons hs ht ih =>
    obtain ⟨hf,hi,hp,hd⟩ := register_transition_frame hs
    exact ⟨hf.trans ih.1, ih.2.1.trans hi, ih.2.2.1.trans hp, ih.2.2.2.trans hd⟩

def prologue : List ABIInstruction := [.saveMXCSR, .initialiseMXCSR, .loadDefaultMXCSR]
def epilogue : List ABIInstruction := [.restoreMXCSR, .ret]
def enter (s : RegisterState) : RegisterState := runABI prologue s

@[simp] theorem enter_gpr (s : RegisterState) : (enter s).gpr = s.gpr := rfl
@[simp] theorem enter_vector (s : RegisterState) : (enter s).vector = s.vector := rfl
@[simp] theorem enter_rflags (s : RegisterState) : (enter s).rflags = s.rflags := rfl
@[simp] theorem enter_memory (s : RegisterState) :
    (enter s).memory = writeWord (writeWord s.memory (s.gpr.rsp - 8) s.mxcsr)
      (s.gpr.rsp - 4) 8064 := rfl
@[simp] theorem enter_mxcsr (s : RegisterState) : (enter s).mxcsr = 8064 := by
  simp [enter, prologue, runABI, ABIInstruction.effect]

theorem adjacent_words_separate (base : UInt64) : WordSeparate base (base + 4) := by
  intro i j heq
  have hn := congrArg UInt64.toNat heq
  have hi := i.isLt
  have hj := j.isLt
  have hb := base.toNat_lt
  simp only [UInt64.toNat_add, UInt64.toNat_ofNat', UInt64.toNat_ofNat] at hn
  omega

theorem enter_saved (s : RegisterState) :
    readWord (enter s).memory (s.gpr.rsp - 8) = s.mxcsr := by
  rw [enter_memory, writeWord_separate, readWord_writeWord]
  have heq : s.gpr.rsp - 4 = (s.gpr.rsp - 8) + 4 := by bv_normalize
  rw [heq]
  exact adjacent_words_separate _

theorem enter_word_frame (s : RegisterState)
    (hs : WordSeparate address (s.gpr.rsp - 8))
    (hd : WordSeparate address (s.gpr.rsp - 4)) :
    readWord (enter s).memory address = readWord s.memory address := by
  rw [enter_memory, writeWord_separate hd, writeWord_separate hs]

theorem enter_env (s : RegisterState)
    (hs : ∀ slot, WordSeparate (slotAddress s.gpr.rdi slot) (s.gpr.rsp - 8))
    (hd : ∀ slot, WordSeparate (slotAddress s.gpr.rdi slot) (s.gpr.rsp - 4)) :
    (enter s).data.env = s.data.env := by
  funext slot
  change Float32.ofBits (readWord (enter s).memory (slotAddress s.gpr.rdi slot)) = _
  rw [enter_word_frame s (hs slot) (hd slot)]
  rfl

def compileBody (p : Jaxpr) : List ABIInstruction :=
  (selectEquations p.equations).map ABIInstruction.core ++ compileOutputs p.outputs

def compileCall (p : Jaxpr) : List ABIInstruction := prologue ++ compileBody p ++ epilogue

theorem body_execution_correct (p : Jaxpr)
    (layout : OutputLayout s.gpr.rsi p.outputs.length s.gpr.rdi)
    (h : ABIExecution (compileBody p) s final) :
    (readOutputBits final.memory s.gpr.rsi p.outputs.length).map Float32.ofBits = p.eval s.data.env ∧
    CalleeFrame s final ∧ final.gpr.rsp = s.gpr.rsp ∧ final.gpr.rdi = s.gpr.rdi := by
  obtain ⟨mid,hcore,hout⟩ := (abi_execution_append _ _ _ _).mp h
  have hc := (core_execution_iff _).mp hcore
  obtain ⟨hf,hi,hp,hd⟩ := register_execution_frame hc
  have hl : OutputLayout mid.gpr.rsi p.outputs.length mid.gpr.rdi := by simpa [hi, hd] using layout
  have hv := outputs_execution_correct p.outputs hl hout
  have heq := (outputs_execution_iff _).mp hout
  have houtframe := runOutputs_frame p.outputs mid
  rw [← heq] at houtframe
  exact ⟨(by rw [hi, jaxpr_register_execution p hc] at hv; exact hv),
    hf.trans houtframe.1, houtframe.2.2.1.trans hp, houtframe.2.1.trans hd⟩

theorem body_word_frame (p : Jaxpr)
    (h : ABIExecution (compileBody p) s final)
    (hs : ∀ slot, WordSeparate address (slotAddress s.gpr.rdi slot))
    (ho : ∀ i : Fin p.outputs.length, WordSeparate address (outputAddress s.gpr.rsi i.val)) :
    readWord final.memory address = readWord s.memory address := by
  obtain ⟨mid,hcore,hout⟩ := (abi_execution_append _ _ _ _).mp h
  have hc := (core_execution_iff _).mp hcore
  have hi := (register_execution_frame hc).2.1
  have hd := register_execution_refines hc (selectEquations_indexSafe _ _)
  rw [(outputs_execution_iff _).mp hout, output_word_frame]
  · exact data_execution_word_frame hd hs
  · simpa [hi] using ho

/-- Memory separation for the native call. Source slots, outputs and the saved
    return state have distinct byte footprints. Scratch storage is in the red zone. -/
structure CallLayout (p : Jaxpr) (s : RegisterState) : Prop where
  outputs : OutputLayout s.gpr.rsi p.outputs.length s.gpr.rdi
  sourceScratch : ∀ slot, WordSeparate (slotAddress s.gpr.rdi slot) (s.gpr.rsp - 8) ∧
    WordSeparate (slotAddress s.gpr.rdi slot) (s.gpr.rsp - 4)
  protectedSlots : ∀ address ∈ [s.gpr.rsp - 8, s.gpr.rsp, s.gpr.rsp + 4],
    ∀ slot, WordSeparate address (slotAddress s.gpr.rdi slot)
  protectedOutputs : ∀ address ∈ [s.gpr.rsp - 8, s.gpr.rsp, s.gpr.rsp + 4],
    ∀ i : Fin p.outputs.length, WordSeparate address (outputAddress s.gpr.rsi i.val)
  returnScratch : ∀ address ∈ [s.gpr.rsp, s.gpr.rsp + 4],
    WordSeparate address (s.gpr.rsp - 8) ∧ WordSeparate address (s.gpr.rsp - 4)

theorem prologue_execution_iff : ABIExecution prologue s final ↔ final = enter s := by
  exact fixed_execution_iff (by simp [prologue, FixedEffect])

theorem epilogue_execution_iff :
    ABIExecution epilogue s final ↔ final = runABI epilogue s := by
  exact fixed_execution_iff (by simp [epilogue, FixedEffect])

/-- The result is read from the actual output bytes after the generated RET.
    Quantification includes every source program and every permitted NaN choice. -/
theorem call_execution_correct (p : Jaxpr) (layout : CallLayout p s)
    (h : ABIExecution (compileCall p) s final) :
    (readOutputBits final.memory s.gpr.rsi p.outputs.length).map Float32.ofBits = p.eval s.data.env ∧
    final.rip = readQword s.memory s.gpr.rsp ∧ final.gpr.rsp = s.gpr.rsp + 8 ∧
    final.mxcsr = s.mxcsr ∧ CalleeFrame s final := by
  obtain ⟨mid,hpb,he⟩ := (abi_execution_append _ _ _ _).mp h
  obtain ⟨entry,hp,hb⟩ := (abi_execution_append _ _ _ _).mp hpb
  have hentry := prologue_execution_iff.mp hp
  subst entry
  have hfinal := epilogue_execution_iff.mp he
  subst final
  have hl : OutputLayout (enter s).gpr.rsi p.outputs.length (enter s).gpr.rdi := by
    simpa using layout.outputs
  obtain ⟨hv,hf,hsp,hdi⟩ := body_execution_correct p hl hb
  have henv := enter_env s (fun slot => (layout.sourceScratch slot).1)
    (fun slot => (layout.sourceScratch slot).2)
  have hsaved : readWord mid.memory (s.gpr.rsp - 8) = s.mxcsr := by
    rw [body_word_frame p hb]
    · exact enter_saved s
    · exact layout.protectedSlots _ (by simp)
    · exact layout.protectedOutputs _ (by simp)
  have hr (address : UInt64) (ha : address ∈ [s.gpr.rsp, s.gpr.rsp + 4]) :
      readWord mid.memory address = readWord s.memory address := by
    rw [body_word_frame p hb]
    · exact enter_word_frame s (layout.returnScratch address ha).1 (layout.returnScratch address ha).2
    · exact layout.protectedSlots address (by simp_all)
    · exact layout.protectedOutputs address (by simp_all)
  have hq : readQword mid.memory s.gpr.rsp = readQword s.memory s.gpr.rsp := by
    simp only [readQword]
    rw [hr _ (by simp), hr _ (by simp)]
  simp only [enter_gpr] at hsp hv
  rw [henv] at hv
  refine ⟨hv, ?_, ?_, ?_, ?_⟩
  · simpa [epilogue, runABI, ABIInstruction.effect, hsp] using hq
  · simp [epilogue, runABI, ABIInstruction.effect, hsp]
  · simpa [epilogue, runABI, ABIInstruction.effect, hsp] using hsaved
  · rcases hf with ⟨h1,h2,h3,h4,h5,h6,h7,h8,h9,h10⟩
    simp only [CalleeFrame, epilogue, runABI, ABIInstruction.effect]
    exact ⟨h1,h2,h3,h4,h5,h6,h7,h8,h9, by rw [hsp, hsaved]⟩

theorem call_execution_exists (p : Jaxpr) (s : RegisterState) (layout : CallLayout p s) :
    ∃ final, ABIExecution (compileCall p) s final ∧
      (readOutputBits final.memory s.gpr.rsi p.outputs.length).map Float32.ofBits = p.eval s.data.env ∧
      final.rip = readQword s.memory s.gpr.rsp ∧ final.gpr.rsp = s.gpr.rsp + 8 ∧
      final.mxcsr = s.mxcsr ∧ CalleeFrame s final := by
  have hp := (prologue_execution_iff (s := s)).mpr rfl
  have ready : MXCSRReady (enter s).mxcsr := by simp [MXCSRReady]
  have hc := (core_execution_iff _).mpr (canonical_register_execution
    (selectEquations p.equations) (enter s) ready)
  have ho := (outputs_execution_iff p.outputs (s := runRegisters (selectEquations p.equations) (enter s))).mpr rfl
  have hb := (abi_execution_append _ _ _ _).mpr ⟨_, hc, ho⟩
  have he := (epilogue_execution_iff (s := runABI (compileOutputs p.outputs)
    (runRegisters (selectEquations p.equations) (enter s)))).mpr rfl
  have hpb := (abi_execution_append _ _ _ _).mpr ⟨_, hp, hb⟩
  have hall := (abi_execution_append _ _ _ _).mpr ⟨_, hpb, he⟩
  exact ⟨_, hall, call_execution_correct p layout hall⟩

end LeanMlir.Jaxpr.Native
