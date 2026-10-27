module
public import LeanMlir.Jaxpr.Native.Memory

@[expose] public section
namespace LeanMlir.Jaxpr.Native

def WordSeparate (a b : UInt64) : Prop :=
  ∀ i j : Fin 4, a + UInt64.ofNat i.val ≠ b + UInt64.ofNat j.val

theorem WordSeparate.symm (h : WordSeparate a b) : WordSeparate b a := by
  intro i j heq
  exact h j i heq.symm

theorem readWord_congr (h : ∀ i : Fin 4,
    first (a + UInt64.ofNat i.val) = second (a + UInt64.ofNat i.val)) :
    readWord first a = readWord second a := by
  have h0 := h ⟨0, by decide⟩
  have h1 := h ⟨1, by decide⟩
  have h2 := h ⟨2, by decide⟩
  have h3 := h ⟨3, by decide⟩
  have hz : first a = second a := by simpa using h0
  change first (a + 1) = second (a + 1) at h1
  change first (a + 2) = second (a + 2) at h2
  change first (a + 3) = second (a + 3) at h3
  simp only [readWord]
  rw [hz, h1, h2, h3]

theorem writeWord_separate (h : WordSeparate a b) (memory : Memory) (value : UInt32) :
    readWord (writeWord memory b value) a = readWord memory a := by
  apply readWord_congr
  intro i
  apply writeWord_frame
  · simpa using h i ⟨0, by decide⟩
  · simpa using h i ⟨1, by decide⟩
  · simpa using h i ⟨2, by decide⟩
  · simpa using h i ⟨3, by decide⟩

def outputAddress (base : UInt64) (index : Nat) : UInt64 := base + UInt64.ofNat (4 * index)

@[simp] theorem outputAddress_zero (base : UInt64) : outputAddress base 0 = base := by
  simp [outputAddress]

@[simp] theorem outputAddress_succ (base : UInt64) (n : Nat) :
    outputAddress base (n + 1) = outputAddress (base + 4) n := by
  simp only [outputAddress, Nat.mul_add, Nat.mul_one, UInt64.ofNat_add]
  change base + (UInt64.ofNat (4 * n) + 4) = (base + 4) + UInt64.ofNat (4 * n)
  rw [UInt64.add_comm (UInt64.ofNat (4 * n)) 4, UInt64.add_assoc]

def readOutputBits (memory : Memory) (base : UInt64) (length : Nat) : List UInt32 :=
  List.ofFn (fun i : Fin length => readWord memory (outputAddress base i.val))

@[simp] theorem readOutputBits_zero : readOutputBits memory base 0 = [] := rfl

theorem readOutputBits_succ (memory : Memory) (base : UInt64) (n : Nat) :
    readOutputBits memory base (n + 1) =
      readWord memory base :: readOutputBits memory (base + 4) n := by
  simp [readOutputBits, List.ofFn_succ, outputAddress_succ]

/-- Output buffers may contain arbitrary initial bits. Their distinct words
    must be disjoint from each other and from every live source slot. -/
structure OutputLayout (base : UInt64) (count : Nat) (slots : UInt64) : Prop where
  slotsSeparate : ∀ (i : Fin count) (slot : UInt32),
    WordSeparate (outputAddress base i.val) (slotAddress slots slot)
  wordsSeparate : ∀ (i j : Fin count), i ≠ j →
    WordSeparate (outputAddress base i.val) (outputAddress base j.val)

theorem OutputLayout.tail (h : OutputLayout base (count + 1) slots) :
    OutputLayout (base + 4) count slots := by
  constructor
  · intro i slot
    simpa using h.slotsSeparate ⟨i.val + 1, by omega⟩ slot
  · intro i j hij
    have hi : i.val + 1 < count + 1 := by omega
    have hj : j.val + 1 < count + 1 := by omega
    have hne : (⟨i.val + 1, hi⟩ : Fin (count + 1)) ≠ ⟨j.val + 1, hj⟩ := by
      intro heq
      apply hij
      apply Fin.ext
      have := congrArg Fin.val heq
      change i.val + 1 = j.val + 1 at this
      omega
    simpa using h.wordsSeparate ⟨i.val + 1, hi⟩ ⟨j.val + 1, hj⟩ hne

end LeanMlir.Jaxpr.Native
