module
public import LeanMlir.Jaxpr.Native.Registers
public import LeanMlir.Jaxpr.Native.Regions

@[expose] public section
namespace LeanMlir.Jaxpr.Native

def readQword (memory : Memory) (address : UInt64) : UInt64 :=
  UInt64.ofBitVec ((readWord memory (address + 4)).toBitVec ++ (readWord memory address).toBitVec)

/-- The scalar native entry uses the SysV arguments RDI (source slots) and
    RSI (output buffer). MXCSR scratch words occupy the callee's red zone. -/
inductive ABIInstruction where
  | core (i : Instruction)
  | storeOutput
  | advanceOutput
  | saveMXCSR
  | initialiseMXCSR
  | loadDefaultMXCSR
  | restoreMXCSR
  | ret

def ABIInstruction.encode : ABIInstruction → List UInt8
  | .core i => i.encode
  | .storeOutput => [0xf3, 0x0f, 0x11, 0x06]
  | .advanceOutput => [0x48, 0x8d, 0x76, 0x04]
  | .saveMXCSR => [0x0f, 0xae, 0x5c, 0x24, 0xf8]
  | .initialiseMXCSR => [0xc7, 0x44, 0x24, 0xfc, 0x80, 0x1f, 0x00, 0x00]
  | .loadDefaultMXCSR => [0x0f, 0xae, 0x54, 0x24, 0xfc]
  | .restoreMXCSR => [0x0f, 0xae, 0x54, 0x24, 0xf8]
  | .ret => [0xc3]

def decodeABI : List UInt8 → Option (ABIInstruction × List UInt8)
  | 0xf3 :: 0x0f :: 0x11 :: 0x06 :: tail => some (.storeOutput, tail)
  | 0x48 :: 0x8d :: 0x76 :: 0x04 :: tail => some (.advanceOutput, tail)
  | 0x0f :: 0xae :: 0x5c :: 0x24 :: 0xf8 :: tail => some (.saveMXCSR, tail)
  | 0xc7 :: 0x44 :: 0x24 :: 0xfc :: 0x80 :: 0x1f :: 0x00 :: 0x00 :: tail => some (.initialiseMXCSR, tail)
  | 0x0f :: 0xae :: 0x54 :: 0x24 :: 0xfc :: tail => some (.loadDefaultMXCSR, tail)
  | 0x0f :: 0xae :: 0x54 :: 0x24 :: 0xf8 :: tail => some (.restoreMXCSR, tail)
  | 0xc3 :: tail => some (.ret, tail)
  | bytes => do
    let (i, tail) ← decodeInstruction bytes
    return (.core i, tail)

theorem decodeABI_encode (i : ABIInstruction) (tail : List UInt8) :
    decodeABI (i.encode ++ tail) = some (i, tail) := by
  cases i with
  | core i => cases i <;> simp [ABIInstruction.encode, Instruction.encode, decodeABI, decodeInstruction]
  | _ => simp [ABIInstruction.encode, decodeABI]

/-- Register effects. Normal instructions leave RIP to the fetch layer;
    RET updates RIP and RSP from the actual return-stack bytes. -/
def ABIInstruction.effect (i : ABIInstruction) (s : RegisterState) : RegisterState :=
  match i with
  | .core i => i.registerStep s
  | .storeOutput => { s with memory := writeWord s.memory s.gpr.rsi (low32 s.vector.xmm0) }
  | .advanceOutput => { s with gpr.rsi := s.gpr.rsi + 4 }
  | .saveMXCSR => { s with memory := writeWord s.memory (s.gpr.rsp - 8) s.mxcsr }
  | .initialiseMXCSR => { s with memory := writeWord s.memory (s.gpr.rsp - 4) 8064 }
  | .loadDefaultMXCSR => { s with mxcsr := readWord s.memory (s.gpr.rsp - 4) }
  | .restoreMXCSR => { s with mxcsr := readWord s.memory (s.gpr.rsp - 8) }
  | .ret => { s with rip := readQword s.memory s.gpr.rsp, gpr.rsp := s.gpr.rsp + 8 }

inductive ABITransition : ABIInstruction → RegisterState → RegisterState → Prop where
  | core : RegisterTransition i s final → ABITransition (.core i) s final
  | fixed (notCore : ∀ i, instruction ≠ .core i) :
      ABITransition instruction s (instruction.effect s)

inductive ABIExecution : List ABIInstruction → RegisterState → RegisterState → Prop where
  | nil : ABIExecution [] s s
  | cons : ABITransition i s mid → ABIExecution rest mid final →
      ABIExecution (i :: rest) s final

def encodeABI (code : List ABIInstruction) : List UInt8 := code.flatMap ABIInstruction.encode

def runABI : List ABIInstruction → RegisterState → RegisterState
  | [], s => s
  | i :: rest, s => runABI rest (i.effect s)

theorem runABI_append (a b : List ABIInstruction) (s : RegisterState) :
    runABI (a ++ b) s = runABI b (runABI a s) := by
  induction a generalizing s with
  | nil => rfl
  | cons i rest ih => simp [runABI, ih]

theorem abi_execution_append (a b : List ABIInstruction) (s final : RegisterState) :
    ABIExecution (a ++ b) s final ↔
      ∃ mid, ABIExecution a s mid ∧ ABIExecution b mid final := by
  induction a generalizing s with
  | nil =>
    constructor
    · intro h; exact ⟨s, .nil, h⟩
    · rintro ⟨mid, h, rest⟩; cases h; exact rest
  | cons i rest ih =>
    constructor
    · intro h
      cases h with
      | cons hi ht =>
        obtain ⟨mid, hr, hb⟩ := (ih _).mp ht
        exact ⟨mid, .cons hi hr, hb⟩
    · rintro ⟨mid, h, hb⟩
      cases h with
      | cons hi hr => exact .cons hi ((ih _).mpr ⟨mid, hr, hb⟩)

theorem core_execution_iff (code : List Instruction) :
    ABIExecution (code.map ABIInstruction.core) s final ↔ RegisterExecution code s final := by
  induction code generalizing s with
  | nil => constructor <;> intro h <;> cases h <;> constructor
  | cons i rest ih =>
    constructor
    · intro h
      cases h with
      | cons hs ht =>
        cases hs with
        | core hi => exact .cons hi (ih.mp ht)
        | fixed hn => exact False.elim (hn i rfl)
    · intro h
      cases h with
      | cons hs ht => exact .cons (.core hs) (ih.mpr ht)

theorem runABI_core (code : List Instruction) (s : RegisterState) :
    runABI (code.map ABIInstruction.core) s = runRegisters code s := by
  induction code generalizing s with
  | nil => rfl
  | cons i rest ih => simp [runABI, runRegisters, ABIInstruction.effect, ih]

theorem ret_effect (s : RegisterState) :
    (ABIInstruction.ret.effect s).rip = readQword s.memory s.gpr.rsp ∧
    (ABIInstruction.ret.effect s).gpr.rsp = s.gpr.rsp + 8 ∧
    (ABIInstruction.ret.effect s).memory = s.memory := by exact ⟨rfl, rfl, rfl⟩

def FixedEffect : ABIInstruction → Prop
  | .core i => ∀ s : RegisterState, floatingResult i s.data = none
  | _ => True

theorem fixed_transition_iff (hf : FixedEffect i) :
    ABITransition i s final ↔ final = i.effect s := by
  constructor
  · intro h
    cases h with
    | core h =>
      cases h with
      | fixed h => rfl
      | floating ready h bits repr status sticky =>
        have hn := hf s
        rw [hn] at h
        contradiction
    | fixed hn => rfl
  · intro heq
    subst final
    cases i with
    | core i => exact .core (.fixed (hf s))
    | _ => exact .fixed (by intro i h; cases h)

theorem fixed_execution_iff (hf : ∀ i ∈ code, FixedEffect i) :
    ABIExecution code s final ↔ final = runABI code s := by
  induction code generalizing s with
  | nil => constructor <;> intro h <;> cases h <;> constructor
  | cons i rest ih =>
    have hi := hf i (by simp)
    have hr : ∀ j ∈ rest, FixedEffect j := by intro j hj; exact hf j (by simp [hj])
    constructor
    · intro h
      cases h with
      | cons hstep hrest =>
        have heq := (fixed_transition_iff hi).mp hstep
        subst heq
        exact (ih hr).mp hrest
    · intro heq
      subst final
      exact .cons ((fixed_transition_iff hi).mpr rfl) ((ih hr).mpr rfl)

end LeanMlir.Jaxpr.Native
