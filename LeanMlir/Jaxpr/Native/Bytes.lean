module
public import Std

@[expose] public section
namespace LeanMlir.Jaxpr.Native

/-- Little-endian bytes, shared by instruction immediates and data memory. -/
def bytes32 (w : UInt32) : List UInt8 :=
  [UInt8.ofNat w.toNat, UInt8.ofNat (w.toNat / 256),
   UInt8.ofNat (w.toNat / 65536), UInt8.ofNat (w.toNat / 16777216)]

def word32 (a b c d : UInt8) : UInt32 :=
  UInt32.ofNat (a.toNat + 256 * b.toNat + 65536 * c.toNat + 16777216 * d.toNat)

def read32 : List UInt8 → Option (UInt32 × List UInt8)
  | a :: b :: c :: d :: rest => some (word32 a b c d, rest)
  | _ => none

theorem word32_bytes32 (w : UInt32) :
    word32 (UInt8.ofNat w.toNat) (UInt8.ofNat (w.toNat / 256))
      (UInt8.ofNat (w.toNat / 65536)) (UInt8.ofNat (w.toNat / 16777216)) = w := by
  apply UInt32.toNat_inj.mp
  have hw := w.toNat_lt
  simp only [word32, UInt32.toNat_ofNat', UInt8.toNat_ofNat']
  omega

@[simp] theorem read32_bytes32 (w : UInt32) (rest : List UInt8) :
    read32 (bytes32 w ++ rest) = some (w, rest) := by
  simpa only [bytes32, List.cons_append, List.nil_append, read32] using
    congrArg (fun v => some (v, rest)) (word32_bytes32 w)

end LeanMlir.Jaxpr.Native
