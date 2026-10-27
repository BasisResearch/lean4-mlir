module
public import LeanMlir.Jaxpr.Native.Call

@[expose] public section
namespace LeanMlir.Jaxpr.Native

def stripPC (s : RegisterState) : RegisterState := { s with rip := 0 }

theorem rebase_of_strip (h : stripPC a = stripPC b) : { a with rip := b.rip } = b := by
  have hh := congrArg (fun s : RegisterState => { s with rip := b.rip }) h
  cases b
  exact hh

theorem register_transition_rebase (h : RegisterTransition i s final) (pc : UInt64) :
    RegisterTransition i { s with rip := pc } { final with rip := pc } := by
  cases h with
  | fixed hf =>
    have hn : floatingResult i ({ s with rip := pc } : RegisterState).data = none := hf
    have hh := RegisterTransition.fixed hn
    cases i <;> exact hh
  | floating ready hf bits repr status sticky =>
    exact RegisterTransition.floating (s := { s with rip := pc }) ready hf bits repr status sticky

theorem abi_transition_rebase (h : ABITransition i s final) (pc : UInt64) :
    ∃ rebased, ABITransition i { s with rip := pc } rebased ∧
      stripPC rebased = stripPC final ∧ (i = .ret → rebased = final) := by
  cases h with
  | core hc =>
    exact ⟨_, .core (register_transition_rebase hc pc), rfl, by intro h; cases h⟩
  | fixed hn =>
    refine ⟨i.effect { s with rip := pc }, .fixed hn, ?_, ?_⟩
    · cases i with
      | core i => exact False.elim (hn i rfl)
      | _ => rfl
    · intro heq
      subst i
      rfl

/-- The register effect and the architectural instruction pointer update are
    separate: ordinary instructions advance; RET takes its target from memory. -/
def advancePC (i : ABIInstruction) (s effects : RegisterState) : RegisterState :=
  match i with
  | .ret => effects
  | _ => { effects with rip := s.rip + UInt64.ofNat i.encode.length }

inductive PCStep : ABIInstruction → RegisterState → RegisterState → Prop where
  | step : ABITransition i s effects → PCStep i s (advancePC i s effects)

inductive PCExecution : List ABIInstruction → RegisterState → RegisterState → Prop where
  | nil : PCExecution [] s s
  | cons : PCStep i s mid → PCExecution rest mid final → PCExecution (i :: rest) s final

theorem pc_step_refines (h : PCStep i s final) (hm : stripPC model = stripPC s) :
    ∃ modelFinal, ABITransition i model modelFinal ∧ stripPC modelFinal = stripPC final ∧
      (i = .ret → modelFinal = final) := by
  cases h with
  | @step effects hs =>
    obtain ⟨rebased,hr,hstrip,hret⟩ := abi_transition_rebase hs model.rip
    rw [rebase_of_strip hm.symm] at hr
    refine ⟨rebased,hr,?_,?_⟩
    · rw [hstrip]
      cases i <;> rfl
    · intro heq
      subst i
      exact hret rfl

theorem pc_execution_refines (h : PCExecution code s final) (hm : stripPC model = stripPC s) :
    ∃ modelFinal, ABIExecution code model modelFinal ∧ stripPC modelFinal = stripPC final := by
  induction h generalizing model with
  | nil => exact ⟨model,.nil,hm⟩
  | cons hs ht ih =>
    obtain ⟨mid,hs',hm',_⟩ := pc_step_refines hs hm
    obtain ⟨last,ht',hl⟩ := ih hm'
    exact ⟨last,.cons hs' ht',hl⟩

theorem pc_execution_append (a b : List ABIInstruction) :
    PCExecution (a ++ b) s final ↔ ∃ mid, PCExecution a s mid ∧ PCExecution b mid final := by
  induction a generalizing s with
  | nil =>
    constructor
    · intro h; exact ⟨s,.nil,h⟩
    · rintro ⟨mid,h,ht⟩; cases h; exact ht
  | cons i rest ih =>
    constructor
    · intro h
      cases h with
      | cons hs ht =>
        obtain ⟨mid,hr,hb⟩ := ih.mp ht
        exact ⟨mid,.cons hs hr,hb⟩
    · rintro ⟨mid,h,hb⟩
      cases h with
      | cons hs hr => exact .cons hs (ih.mpr ⟨mid,hr,hb⟩)

theorem pc_return_refines (h : PCExecution (precode ++ [.ret]) s final) :
    ABIExecution (precode ++ [.ret]) s final := by
  obtain ⟨mid,hp,hr⟩ := (pc_execution_append _ _).mp h
  obtain ⟨model,hmodel,heq⟩ := pc_execution_refines hp (model := s) rfl
  cases hr with
  | cons hret hnil =>
    cases hnil
    obtain ⟨result,hs,_,hresult⟩ := pc_step_refines hret heq
    have he := hresult rfl
    subst result
    exact (abi_execution_append _ _ _ _).mpr ⟨model,hmodel,.cons hs .nil⟩

theorem call_pc_execution_correct (p : Jaxpr) (layout : CallLayout p s)
    (h : PCExecution (compileCall p) s final) :
    (readOutputBits final.memory s.gpr.rsi p.outputs.length).map Float32.ofBits = p.eval s.data.env ∧
    final.rip = readQword s.memory s.gpr.rsp ∧ final.gpr.rsp = s.gpr.rsp + 8 ∧
    final.mxcsr = s.mxcsr ∧ CalleeFrame s final := by
  apply call_execution_correct p layout
  have he : compileCall p = (prologue ++ compileBody p ++ [.restoreMXCSR]) ++ [.ret] := by
    simp [compileCall, epilogue, List.append_assoc]
  rw [he] at h ⊢
  exact pc_return_refines h

inductive BytePCExecution : List UInt8 → RegisterState → RegisterState → Prop where
  | nil : BytePCExecution [] s s
  | step (decoded : decodeABI bytes = some (i, rest)) :
      PCStep i s mid → BytePCExecution rest mid final → BytePCExecution bytes s final

theorem byte_pc_execution_iff (code : List ABIInstruction) :
    BytePCExecution (encodeABI code) s final ↔ PCExecution code s final := by
  induction code generalizing s with
  | nil =>
    constructor
    · intro h
      cases h with
      | nil => exact .nil
      | step hd _ _ => simp [encodeABI, decodeABI, decodeInstruction] at hd
    · intro h; cases h; exact .nil
  | cons i rest ih =>
    have hd : decodeABI (encodeABI (i :: rest)) = some (i, encodeABI rest) :=
      decodeABI_encode i _
    constructor
    · intro h
      generalize hb : encodeABI (i :: rest) = bytes at h hd
      cases h with
      | nil => simp [decodeABI, decodeInstruction] at hd
      | step dec hs ht =>
        rw [hd] at dec
        cases Option.some.inj dec
        exact .cons hs (ih.mp ht)
    · intro h
      cases h with
      | cons hs ht => exact .step hd hs (ih.mpr ht)

theorem call_byte_pc_execution_correct (p : Jaxpr) (layout : CallLayout p s)
    (h : BytePCExecution (encodeABI (compileCall p)) s final) :
    (readOutputBits final.memory s.gpr.rsi p.outputs.length).map Float32.ofBits = p.eval s.data.env ∧
    final.rip = readQword s.memory s.gpr.rsp ∧ final.gpr.rsp = s.gpr.rsp + 8 ∧
    final.mxcsr = s.mxcsr ∧ CalleeFrame s final := by
  exact call_pc_execution_correct p layout ((byte_pc_execution_iff _).mp h)

theorem lift_abi_execution (h : ABIExecution code s final)
    (hm : stripPC physical = stripPC s) :
    ∃ physicalFinal, PCExecution code physical physicalFinal ∧ stripPC physicalFinal = stripPC final := by
  induction h generalizing physical with
  | nil => exact ⟨physical,.nil,hm⟩
  | @cons i s mid rest final hs ht ih =>
    obtain ⟨rebased,hr,hstrip,_⟩ := abi_transition_rebase hs physical.rip
    rw [rebase_of_strip hm.symm] at hr
    have heq : stripPC (advancePC i physical rebased) = stripPC mid := by
      cases i <;> exact hstrip
    obtain ⟨last,hrest,hl⟩ := ih heq
    exact ⟨last,.cons (.step hr) hrest,hl⟩

theorem call_byte_pc_execution_exists (p : Jaxpr) (s : RegisterState) (layout : CallLayout p s) :
    ∃ final, BytePCExecution (encodeABI (compileCall p)) s final ∧
      (readOutputBits final.memory s.gpr.rsi p.outputs.length).map Float32.ofBits = p.eval s.data.env ∧
      final.rip = readQword s.memory s.gpr.rsp ∧ final.gpr.rsp = s.gpr.rsp + 8 ∧
      final.mxcsr = s.mxcsr ∧ CalleeFrame s final := by
  obtain ⟨model,hmodel,_⟩ := call_execution_exists p s layout
  obtain ⟨final,hfinal,_⟩ := lift_abi_execution hmodel (physical := s) rfl
  have hb := (byte_pc_execution_iff _).mpr hfinal
  exact ⟨final,hb,call_byte_pc_execution_correct p layout hb⟩

end LeanMlir.Jaxpr.Native
