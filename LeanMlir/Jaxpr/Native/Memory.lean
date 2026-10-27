module
public import LeanMlir.Jaxpr.Native.Bytes
public import Std.Tactic.BVDecide

@[expose] public section
namespace LeanMlir.Jaxpr.Native

/-- Byte-addressed, wrapping 64-bit memory. Mapped-region permissions and
    canonical-address checks belong to the machine execution relation. -/
abbrev Memory := UInt64 → UInt8

def readWord (m : Memory) (a : UInt64) : UInt32 :=
  word32 (m a) (m (a + 1)) (m (a + 2)) (m (a + 3))

def writeWord (m : Memory) (a : UInt64) (w : UInt32) : Memory :=
  fun p => if p = a then UInt8.ofNat w.toNat
    else if p = a + 1 then UInt8.ofNat (w.toNat / 256)
    else if p = a + 2 then UInt8.ofNat (w.toNat / 65536)
    else if p = a + 3 then UInt8.ofNat (w.toNat / 16777216)
    else m p

/-- Address selected by `[rdi + rax*4]` after `mov eax, slot`. -/
def slotAddress (base : UInt64) (slot : UInt32) : UInt64 :=
  base + slot.toUInt64 * 4

@[simp] theorem readWord_writeWord (m : Memory) (a : UInt64) (w : UInt32) :
    readWord (writeWord m a w) a = w := by
  have h10 : a + 1 ≠ a := by bv_normalize
  have h20 : a + 2 ≠ a := by bv_normalize
  have h21 : a + 2 ≠ a + 1 := by bv_normalize
  have h30 : a + 3 ≠ a := by bv_normalize
  have h31 : a + 3 ≠ a + 1 := by bv_normalize
  have h32 : a + 3 ≠ a + 2 := by bv_normalize
  simp only [readWord, writeWord, h10, h20, h21, h30, h31, h32,
    ite_false, ite_true, word32_bytes32]

/-- Distinct source slots never alias, including at wrapping addresses. -/
theorem slot_bytes_disjoint (base : UInt64) (i j : UInt32) (hi : i ≠ j)
    (a b : UInt64) (ha : a < 4) (hb : b < 4) :
    slotAddress base i + a ≠ slotAddress base j + b := by
  intro heq
  have hnat := congrArg UInt64.toNat heq
  have hbase := base.toNat_lt
  have hi' := i.toNat_lt
  have hj' := j.toNat_lt
  have hij : i.toNat ≠ j.toNat := fun h => hi (UInt32.toNat_inj.mp h)
  have ha' : a.toNat < 4 := ha
  have hb' : b.toNat < 4 := hb
  simp only [slotAddress, UInt64.toNat_add, UInt64.toNat_mul,
    UInt32.toNat_toUInt64, UInt64.toNat_ofNat] at hnat
  omega

theorem readWord_writeWord_other (m : Memory) (base : UInt64) (i j : UInt32)
    (hij : i ≠ j) (w : UInt32) :
    readWord (writeWord m (slotAddress base j) w) (slotAddress base i) =
      readWord m (slotAddress base i) := by
  have hn (a b : UInt64) (ha : a < 4) (hb : b < 4) :=
    slot_bytes_disjoint base i j hij a b ha hb
  have hz (a : UInt64) (ha : a < 4) : slotAddress base i + a ≠ slotAddress base j := by
    simpa using hn a 0 ha (by decide)
  have h00 : slotAddress base i ≠ slotAddress base j := by simpa using hz 0 (by decide)
  have h0 (b : UInt64) (hb : b < 4) : slotAddress base i ≠ slotAddress base j + b := by
    simpa using hn 0 b (by decide) hb
  simp only [readWord, writeWord]
  simp [h00, hz 1 (by decide), hz 2 (by decide), hz 3 (by decide),
    h0 1 (by decide), h0 2 (by decide),
    h0 3 (by decide), hn 1 1 (by decide) (by decide),
    hn 1 2 (by decide) (by decide), hn 1 3 (by decide) (by decide),
    hn 2 1 (by decide) (by decide), hn 2 2 (by decide) (by decide),
    hn 2 3 (by decide) (by decide), hn 3 1 (by decide) (by decide),
    hn 3 2 (by decide) (by decide), hn 3 3 (by decide) (by decide)]

theorem writeWord_frame (m : Memory) (a p : UInt64) (w : UInt32)
    (h0 : p ≠ a) (h1 : p ≠ a + 1) (h2 : p ≠ a + 2) (h3 : p ≠ a + 3) :
    writeWord m a w p = m p := by simp [writeWord, h0, h1, h2, h3]

end LeanMlir.Jaxpr.Native
