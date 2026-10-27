module
public import Init.Data.Float
public import Std.Tactic.BVDecide

@[expose] public section
namespace LeanMlir.Jaxpr.Native
open Float.Model
open Float.Model.UnpackedFloat

private theorem sign_roundtrip (s : Sign) : Sign.ofBitVec s.toBitVec = s := by
  cases s <;> decide

private theorem unpackSign_components (s : Sign) (e : BitVec 8) (m : BitVec 23) :
    unpackSign (packComponents Format.binary32 s e m) = s.toBitVec := by
  cases s <;> simp only [unpackSign, packComponents, Sign.toBitVec, Format.binary32] <;> bv_normalize <;> simp_all

/-- Packing a decoded binary32 value preserves all non-NaN bits. NaNs use
    the canonical representation of Lean's public Float32 model. -/
theorem pack_unpack_components (s : Sign) (e : BitVec 8) (m : BitVec 23) :
    pack Format.binary32 (unpack Format.binary32 (packComponents Format.binary32 s e m)) =
      if e = 255#8 ∧ m ≠ 0#23 then packedNaN Format.binary32
      else packComponents Format.binary32 s e m := by
  have hm := m.isLt
  have he := e.isLt
  have normal_mantissa : (1#1 ++ m).toNat = 8388608 + m.toNat := by
    simp only [BitVec.toNat_append, BitVec.toNat_ofNat]
    rw [← Nat.shiftLeft_add_eq_or_of_lt hm]
    simp [Nat.shiftLeft_eq]
  have normal_log : (1#1 ++ m).toNat.log2 = 23 := by
    apply (Nat.log2_eq_iff (by omega)).2
    omega
  have normal_bits : BitVec.ofNat 23 (1#1 ++ m).toNat = m := by
    apply BitVec.eq_of_toNat_eq
    simp only [BitVec.toNat_ofNat, normal_mantissa]
    omega
  simp only [UnpackedFloat.unpack, unpackMantissa_packComponents, unpackExponent_packComponents,
    unpackSign_components, sign_roundtrip]
  by_cases hmax : e = 255#8
  · by_cases hz : m = 0#23
    · subst e; subst m; simp [UnpackedFloat.pack, packedInfinity]
    · simp [hmax, hz, UnpackedFloat.pack]
  · by_cases hez : e = 0#8
    · by_cases hmz : m = 0#23
      · subst e; subst m; simp [UnpackedFloat.pack, packedZero]
      · have hmpos : m.toNat ≠ 0 := fun h => hmz (BitVec.eq_of_toNat_eq h)
        have hlog : m.toNat.log2 < 23 := (Nat.log2_lt hmpos).2 hm
        subst e
        simp [hmz, UnpackedFloat.pack, Format.binary32, Format.exponentBias,
          Format.mantissaBits, show m.toNat.log2 + 1 ≠ 24 by omega]
    · have hen : e.toNat ≠ 0 := fun h => hez (BitVec.eq_of_toNat_eq h)
      have hem : e.toNat ≠ 255 := by
        intro h
        apply hmax
        exact BitVec.eq_of_toNat_eq h
      simp [hmax, hez, UnpackedFloat.pack, Format.binary32,
        Format.exponentBias, Format.mantissaBits, normal_log, normal_bits]
      have bias : (e.toNat : Int) - 150 + 127 + 23 = e.toNat := by omega
      simp [bias, show ¬ 255 ≤ e.toNat by omega]

theorem components_roundtrip (b : BitVec 32) :
    packComponents Format.binary32 (Sign.ofBitVec (unpackSign (spec := Format.binary32) b))
      (unpackExponent b) (unpackMantissa b) = b := by
  have hs (v : BitVec 1) : (Sign.ofBitVec v).toBitVec = v := by
    rcases BitVec.eq_zero_or_eq_one v with h | h <;> simp [h, Sign.ofBitVec, Sign.toBitVec]
  simp only [packComponents, hs, unpackSign, unpackExponent, unpackMantissa, Format.binary32]
  rw [BitVec.extractLsb'_append_extractLsb'_eq_extractLsb' (by decide)]
  exact BitVec.extractLsb'_append_extractLsb'

theorem pack_unpack_valid (b : BitVec 32) (h : Format.binary32.Valid b) :
    pack Format.binary32 (unpack Format.binary32 b) = b := by
  have hc := pack_unpack_components (Sign.ofBitVec (unpackSign (spec := Format.binary32) b))
    (unpackExponent (spec := Format.binary32) b) (unpackMantissa (spec := Format.binary32) b)
  rw [components_roundtrip] at hc
  rw [hc]
  split
  · next hn => exact (h.eq_packedNaN hn.1 hn.2).symm
  · rfl

theorem unpack_pack_unpack (b : BitVec 32) :
    unpack Format.binary32 (pack Format.binary32 (unpack Format.binary32 b)) =
      unpack Format.binary32 b := by
  have hc := pack_unpack_components (Sign.ofBitVec (unpackSign (spec := Format.binary32) b))
    (unpackExponent (spec := Format.binary32) b) (unpackMantissa (spec := Format.binary32) b)
  rw [components_roundtrip] at hc
  rw [hc]
  split
  · next hn => simp [UnpackedFloat.unpack, hn.1, hn.2, packedNaN,
      unpackExponent_packComponents, unpackMantissa_packComponents, Format.binary32]
  · rfl

/-- The representation bridge used after native arithmetic and memory stores. -/
@[simp] theorem ofBits_toBits (x : Float32) : Float32.ofBits x.toBits = x := by
  cases x with
  | ofModel x =>
    cases x with
    | mk bits valid =>
      unfold Float32.toBits Float32.ofBits Float32.Model.ofBits Float32.Model.pack
      simp only [pack_unpack_valid bits.toBitVec valid]

private theorem unpack_xor_sign (b : BitVec 32) :
    unpack Format.binary32 (b ^^^ 2147483648#32) =
      (unpack Format.binary32 b).neg := by
  have he : unpackExponent (spec := Format.binary32) (b ^^^ 2147483648#32) =
      unpackExponent (spec := Format.binary32) b := by
    simp only [unpackExponent, Format.binary32]; bv_normalize <;> simp_all
  have hm : unpackMantissa (spec := Format.binary32) (b ^^^ 2147483648#32) =
      unpackMantissa (spec := Format.binary32) b := by
    simp only [unpackMantissa, Format.binary32]; bv_normalize <;> simp_all
  have hs : Sign.ofBitVec (unpackSign (spec := Format.binary32) (b ^^^ 2147483648#32)) =
      -Sign.ofBitVec (unpackSign (spec := Format.binary32) b) := by
    simp only [Sign.ofBitVec, unpackSign, Format.binary32]
    by_cases h0 : (b ^^^ 2147483648#32).extractLsb' 31 1 = 0#1 <;>
      by_cases h1 : b.extractLsb' 31 1 = 0#1 <;>
      simp only [show 23 + 8 = 31 from rfl, h0, h1, ite_true, ite_false] <;>
      first | rfl | exfalso; bv_normalize <;> simp_all
  by_cases h0 : unpackExponent (spec := Format.binary32) b = 0#8 <;>
    by_cases h1 : unpackExponent (spec := Format.binary32) b = 255#8 <;>
    by_cases h2 : unpackMantissa (spec := Format.binary32) b = 0#23 <;>
    simp [UnpackedFloat.unpack, he, hm, hs, h0, h1, h2, UnpackedFloat.neg]

private theorem unpack_and_abs (b : BitVec 32) :
    unpack Format.binary32 (b &&& 2147483647#32) =
      (unpack Format.binary32 b).abs := by
  have he : unpackExponent (spec := Format.binary32) (b &&& 2147483647#32) =
      unpackExponent (spec := Format.binary32) b := by
    simp only [unpackExponent, Format.binary32]; bv_normalize <;> simp_all
  have hm : unpackMantissa (spec := Format.binary32) (b &&& 2147483647#32) =
      unpackMantissa (spec := Format.binary32) b := by
    simp only [unpackMantissa, Format.binary32]; bv_normalize <;> simp_all
  have hs : unpackSign (spec := Format.binary32) (b &&& 2147483647#32) = 0#1 := by
    simp only [unpackSign, Format.binary32]; bv_normalize <;> simp_all
  by_cases h0 : unpackExponent (spec := Format.binary32) b = 0#8 <;>
    by_cases h1 : unpackExponent (spec := Format.binary32) b = 255#8 <;>
    by_cases h2 : unpackMantissa (spec := Format.binary32) b = 0#23 <;>
    simp [UnpackedFloat.unpack, he, hm, hs, h0, h1, h2, UnpackedFloat.abs, Sign.ofBitVec]

theorem ofBits_xor_sign (bits : UInt32) :
    Float32.ofBits (bits ^^^ 2147483648) = Float32.neg (Float32.ofBits bits) := by
  change Float32.ofModel (Float32.Model.ofBits (bits ^^^ 2147483648)) =
    Float32.ofModel (Float32.Model.neg (Float32.Model.ofBits bits))
  simp [Float32.Model.ofBits, Float32.Model.neg,
    Float32.Model.unpack, Float32.Model.pack, unpack_pack_unpack, unpack_xor_sign]

theorem ofBits_and_abs (bits : UInt32) :
    Float32.ofBits (bits &&& 2147483647) = Float32.abs (Float32.ofBits bits) := by
  simp [Float32.ofBits, Float32.abs, Float32.Model.ofBits, Float32.Model.abs,
    Float32.Model.unpack, Float32.Model.pack, unpack_pack_unpack, unpack_and_abs]

end LeanMlir.Jaxpr.Native
