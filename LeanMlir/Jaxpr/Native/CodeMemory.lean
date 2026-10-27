module
public import LeanMlir.Jaxpr.Native.NaNExecution

@[expose] public section
namespace LeanMlir.Jaxpr.Native

def readBytes (memory : Memory) (pc : UInt64) (length : Nat) : List UInt8 :=
  List.ofFn (fun i : Fin length => memory (pc + UInt64.ofNat i.val))

def CodeAt (memory : Memory) (pc : UInt64) (code : List UInt8) : Prop :=
  ∀ i : Fin code.length, memory (pc + UInt64.ofNat i.val) = code[i.val]

theorem readBytes_codeAt (h : CodeAt memory pc code) :
    readBytes memory pc code.length = code := by
  calc
    readBytes memory pc code.length = List.ofFn (fun i : Fin code.length => code[i.val]) := by
      apply congrArg List.ofFn
      funext i
      exact h i
    _ = code := List.ofFn_getElem

/-- No byte of the instruction image overlaps a source data slot. -/
def CodeSeparate (pc : UInt64) (length : Nat) (base : UInt64) : Prop :=
  ∀ (i : Fin length) (slot : UInt32) (offset : Fin 4),
    pc + UInt64.ofNat i.val ≠ slotAddress base slot + UInt64.ofNat offset.val

theorem codeAt_writeWord (h : CodeAt memory pc code)
    (sep : CodeSeparate pc code.length base) (slot : UInt32) (value : UInt32) :
    CodeAt (writeWord memory (slotAddress base slot) value) pc code := by
  intro i
  rw [writeWord_frame]
  · exact h i
  · simpa using sep i slot ⟨0, by decide⟩
  · simpa using sep i slot ⟨1, by decide⟩
  · simpa using sep i slot ⟨2, by decide⟩
  · simpa using sep i slot ⟨3, by decide⟩

theorem codeAt_suffix (h : CodeAt memory pc (precode ++ suffix)) :
    CodeAt memory (pc + UInt64.ofNat precode.length) suffix := by
  intro i
  have hi : precode.length + i.val < (precode ++ suffix).length := by simp
  have hh := h ⟨precode.length + i.val, hi⟩
  simpa [UInt64.ofNat_add, UInt64.add_assoc, List.getElem_append_right] using hh

theorem codeSeparate_suffix {precode suffix : List UInt8}
    (h : CodeSeparate pc (precode ++ suffix).length base) :
    CodeSeparate (pc + UInt64.ofNat precode.length) suffix.length base := by
  intro i slot offset
  have hi : precode.length + i.val < (precode ++ suffix).length := by simp
  have hh := h ⟨precode.length + i.val, hi⟩ slot offset
  simpa [UInt64.ofNat_add, UInt64.add_assoc] using hh

theorem transition_preserves_base (h : DataTransition instruction s final) : final.rdi = s.rdi := by
  cases h with
  | fixed _ => cases instruction <;> rfl
  | floating _ _ _ => rfl

theorem transition_preserves_code (h : DataTransition instruction s final)
    (hc : CodeAt s.memory pc code) (sep : CodeSeparate pc code.length s.rdi) :
    CodeAt final.memory pc code := by
  cases h with
  | fixed _ =>
    cases instruction <;> first
      | exact hc
      | exact codeAt_writeWord hc sep _ _
  | floating _ _ _ => exact hc

/-- The compiler's memory updates preserve the loaded instruction image.
    The proof covers all target data executions, including NaN choices. -/
theorem execution_preserves_code (h : DataExecution instructions s final)
    (hc : CodeAt s.memory pc code) (sep : CodeSeparate pc code.length s.rdi) :
    CodeAt final.memory pc code ∧ final.rdi = s.rdi := by
  induction h with
  | nil => exact ⟨hc, rfl⟩
  | cons step rest ih =>
    have hb := transition_preserves_base step
    have hn := transition_preserves_code step hc sep
    have hr := ih hn (by simpa [hb] using sep)
    exact ⟨hr.1, hr.2.trans hb⟩

/-- A concrete layout supplies separation. The data arena covers every UInt32
    slot; code starts above it, with the size bound stated in the theorem.
    This supplies only address separation, not OS mappings or permissions. -/
theorem separated_layout (length : Nat) (h : length ≤ 4294967296) :
    CodeSeparate 17179869184 length 0 := by
  intro i slot offset heq
  have hi := i.isLt
  have ho := offset.isLt
  have hs := slot.toNat_lt
  have hn := congrArg UInt64.toNat heq
  simp only [slotAddress, UInt64.toNat_add, UInt64.toNat_mul,
    UInt64.toNat_ofNat, UInt64.toNat_ofNat', UInt32.toNat_toUInt64] at hn
  omega

end LeanMlir.Jaxpr.Native
