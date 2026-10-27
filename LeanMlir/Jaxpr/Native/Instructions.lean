module
public import LeanMlir.Jaxpr.SSA
public import LeanMlir.Jaxpr.Native.FloatBits
public import LeanMlir.Jaxpr.Native.Memory

@[expose] public section
namespace LeanMlir.Jaxpr.Native

/-- Concrete x86-64 encodings used by instruction selection. Register allocation
    uses EAX for an immediate/index and the low lanes of XMM0 and XMM1 for values.
    Memory operands are `[rdi + rax*4]`. -/
inductive Instruction where
  | movEax (immediate : UInt32)
  | movd0 | movd1
  | load0 | load1 | store0
  | addss | subss | mulss | divss | sqrtss
  | xorps | andps
  deriving Repr

def Instruction.encode : Instruction → List UInt8
  | .movEax w => 0xb8 :: bytes32 w
  | .movd0 => [0x66, 0x0f, 0x6e, 0xc0]
  | .movd1 => [0x66, 0x0f, 0x6e, 0xc8]
  | .load0 => [0xf3, 0x0f, 0x10, 0x04, 0x87]
  | .load1 => [0xf3, 0x0f, 0x10, 0x0c, 0x87]
  | .store0 => [0xf3, 0x0f, 0x11, 0x04, 0x87]
  | .addss => [0xf3, 0x0f, 0x58, 0xc1]
  | .subss => [0xf3, 0x0f, 0x5c, 0xc1]
  | .mulss => [0xf3, 0x0f, 0x59, 0xc1]
  | .divss => [0xf3, 0x0f, 0x5e, 0xc1]
  | .sqrtss => [0xf3, 0x0f, 0x51, 0xc0]
  | .xorps => [0x0f, 0x57, 0xc1]
  | .andps => [0x0f, 0x54, 0xc1]

/-- Decode from bytes, without a source program or compiler-generated certificate. -/
def decodeInstruction : List UInt8 → Option (Instruction × List UInt8)
  | 0xb8 :: rest => do
    let (w, tail) ← read32 rest
    return (.movEax w, tail)
  | 0x66 :: 0x0f :: 0x6e :: 0xc0 :: tail => some (.movd0, tail)
  | 0x66 :: 0x0f :: 0x6e :: 0xc8 :: tail => some (.movd1, tail)
  | 0xf3 :: 0x0f :: 0x10 :: 0x04 :: 0x87 :: tail => some (.load0, tail)
  | 0xf3 :: 0x0f :: 0x10 :: 0x0c :: 0x87 :: tail => some (.load1, tail)
  | 0xf3 :: 0x0f :: 0x11 :: 0x04 :: 0x87 :: tail => some (.store0, tail)
  | 0xf3 :: 0x0f :: 0x58 :: 0xc1 :: tail => some (.addss, tail)
  | 0xf3 :: 0x0f :: 0x5c :: 0xc1 :: tail => some (.subss, tail)
  | 0xf3 :: 0x0f :: 0x59 :: 0xc1 :: tail => some (.mulss, tail)
  | 0xf3 :: 0x0f :: 0x5e :: 0xc1 :: tail => some (.divss, tail)
  | 0xf3 :: 0x0f :: 0x51 :: 0xc0 :: tail => some (.sqrtss, tail)
  | 0x0f :: 0x57 :: 0xc1 :: tail => some (.xorps, tail)
  | 0x0f :: 0x54 :: 0xc1 :: tail => some (.andps, tail)
  | _ => none

theorem decodeInstruction_encode (i : Instruction) (tail : List UInt8) :
    decodeInstruction (i.encode ++ tail) = some (i, tail) := by
  cases i <;> simp [Instruction.encode, decodeInstruction]

/-- Data projection of SSE execution. This is not yet the full ISA state:
    RIP, permissions, upper vector lanes, MXCSR and exception flags must be
    related by a separate machine refinement. Arithmetic here canonicalizes NaNs.
    No hardware conformance is asserted by this definition. -/
structure DataState where
  eax : UInt32
  xmm0 : UInt32
  xmm1 : UInt32
  rdi : UInt64
  memory : Memory

def DataState.env (s : DataState) : Env :=
  fun i => Float32.ofBits (readWord s.memory (slotAddress s.rdi i))

def Instruction.dataStep (i : Instruction) (s : DataState) : DataState :=
  match i with
  | .movEax w => { s with eax := w }
  | .movd0 => { s with xmm0 := s.eax }
  | .movd1 => { s with xmm1 := s.eax }
  | .load0 => { s with xmm0 := readWord s.memory (slotAddress s.rdi s.eax) }
  | .load1 => { s with xmm1 := readWord s.memory (slotAddress s.rdi s.eax) }
  | .store0 => { s with memory := writeWord s.memory (slotAddress s.rdi s.eax) s.xmm0 }
  | .addss => { s with xmm0 := (Float32.add (Float32.ofBits s.xmm0) (Float32.ofBits s.xmm1)).toBits }
  | .subss => { s with xmm0 := (Float32.sub (Float32.ofBits s.xmm0) (Float32.ofBits s.xmm1)).toBits }
  | .mulss => { s with xmm0 := (Float32.mul (Float32.ofBits s.xmm0) (Float32.ofBits s.xmm1)).toBits }
  | .divss => { s with xmm0 := (Float32.div (Float32.ofBits s.xmm0) (Float32.ofBits s.xmm1)).toBits }
  | .sqrtss => { s with xmm0 := (Float32.sqrt (Float32.ofBits s.xmm0)).toBits }
  | .xorps => { s with xmm0 := s.xmm0 ^^^ s.xmm1 }
  | .andps => { s with xmm0 := s.xmm0 &&& s.xmm1 }

def runData : List Instruction → DataState → DataState
  | [], s => s
  | i :: rest, s => runData rest (i.dataStep s)

theorem runData_append (a b : List Instruction) (s : DataState) :
    runData (a ++ b) s = runData b (runData a s) := by
  induction a generalizing s with
  | nil => rfl
  | cons i rest ih => simp [runData, ih]

def encodeInstructions (code : List Instruction) : List UInt8 :=
  code.flatMap Instruction.encode

/-- Byte execution of the data projection, with instruction decoding at every step. -/
def runDataBytes : Nat → List UInt8 → DataState → Option DataState
  | _, [], s => some s
  | 0, _ :: _, _ => none
  | n + 1, bytes@(_ :: _), s => do
    let (i, rest) ← decodeInstruction bytes
    runDataBytes n rest (i.dataStep s)

private theorem runDataBytes_step (i : Instruction) (tail : List UInt8) (n : Nat) (s : DataState) :
    runDataBytes (n + 1) (i.encode ++ tail) s = runDataBytes n tail (i.dataStep s) := by
  have hn : i.encode ≠ [] := by cases i <;> simp [Instruction.encode]
  have hn' := List.append_ne_nil_of_left_ne_nil hn tail
  cases he : i.encode ++ tail with
  | nil => exact False.elim (hn' he)
  | cons b bs =>
    have hd := decodeInstruction_encode i tail
    rw [he] at hd
    simp [runDataBytes, hd]

theorem runDataBytes_encode (code : List Instruction) (s : DataState) (extra : Nat) :
    runDataBytes (code.length + extra) (encodeInstructions code) s = some (runData code s) := by
  induction code generalizing s with
  | nil => simp [encodeInstructions, runDataBytes, runData]
  | cons i rest ih =>
    simp only [encodeInstructions, List.flatMap_cons, List.length_cons]
    rw [show rest.length + 1 + extra = (rest.length + extra) + 1 by omega]
    rw [runDataBytes_step]
    exact ih (i.dataStep s)

end LeanMlir.Jaxpr.Native
