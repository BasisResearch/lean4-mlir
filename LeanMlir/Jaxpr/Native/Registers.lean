module
public import LeanMlir.Jaxpr.Native.Addressing
public import LeanMlir.Jaxpr.Native.NaNExecution

@[expose] public section
namespace LeanMlir.Jaxpr.Native

/-- General registers in the native calling convention. -/
structure GPR where
  rax : UInt64
  rbx : UInt64
  rcx : UInt64
  rdx : UInt64
  rsi : UInt64
  rdi : UInt64
  rbp : UInt64
  rsp : UInt64
  r8 : UInt64
  r9 : UInt64
  r10 : UInt64
  r11 : UInt64
  r12 : UInt64
  r13 : UInt64
  r14 : UInt64
  r15 : UInt64

/-- Legacy SSE changes the low vector registers only. The remaining vector
    state is retained explicitly as a frame. -/
structure VectorRegisters where
  xmm0 : BitVec 128
  xmm1 : BitVec 128
  others : Fin 14 → BitVec 128
  upper : Fin 16 → BitVec 384

def low32 (x : BitVec 128) : UInt32 := UInt32.ofBitVec (x.extractLsb' 0 32)

def zeroVector (x : UInt32) : BitVec 128 := 0#96 ++ x.toBitVec

def replaceLow (x : BitVec 128) (bits : UInt32) : BitVec 128 :=
  x.extractLsb' 32 96 ++ bits.toBitVec

@[simp] theorem low32_zeroVector (x : UInt32) : low32 (zeroVector x) = x := by
  have h : (0#96 ++ x.toBitVec).extractLsb' 0 32 = x.toBitVec :=
    BitVec.extractLsb'_append_eq_right
  exact congrArg UInt32.ofBitVec h

@[simp] theorem low32_replaceLow (x : BitVec 128) (bits : UInt32) :
    low32 (replaceLow x bits) = bits := by
  have h : (x.extractLsb' 32 96 ++ bits.toBitVec).extractLsb' 0 32 = bits.toBitVec :=
    BitVec.extractLsb'_append_eq_right
  exact congrArg UInt32.ofBitVec h

@[simp] theorem low32_xor (x y : BitVec 128) : low32 (x ^^^ y) = low32 x ^^^ low32 y := by
  simp [low32, BitVec.extractLsb'_xor]

@[simp] theorem low32_and (x y : BitVec 128) : low32 (x &&& y) = low32 x &&& low32 y := by
  simp [low32, BitVec.extractLsb'_and]

/-- Registers and byte memory. Address permissions and processor mode are
    supplied by the execution layer, not hidden in the data projection. -/
structure RegisterState where
  gpr : GPR
  vector : VectorRegisters
  rip : UInt64
  rflags : UInt64
  mxcsr : UInt32
  memory : Memory

def RegisterState.data (s : RegisterState) : DataState where
  eax := s.gpr.rax.toUInt32
  xmm0 := low32 s.vector.xmm0
  xmm1 := low32 s.vector.xmm1
  rdi := s.gpr.rdi
  memory := s.memory

/-- MXCSR control bits: RNE, masked exceptions, gradual underflow, no DAZ.
    Sticky exception status occupies the remaining low bits. -/
def MXCSRReady (word : UInt32) : Prop := word.toNat / 64 = 126

def setStatus (word : UInt32) (status : Fin 64) : UInt32 :=
  UInt32.ofNat (64 * (word.toNat / 64) + status.val)

theorem setStatus_controls (word : UInt32) (status : Fin 64) :
    (setStatus word status).toNat / 64 = word.toNat / 64 := by
  have hw := word.toNat_lt
  have hs := status.isLt
  simp only [setStatus, UInt32.toNat_ofNat']
  omega

theorem setStatus_ready (h : MXCSRReady word) (status : Fin 64) :
    MXCSRReady (setStatus word status) := by
  unfold MXCSRReady at *
  rw [setStatus_controls]
  exact h

def currentStatus (word : UInt32) : Fin 64 := ⟨word.toNat % 64, Nat.mod_lt _ (by decide)⟩

@[simp] theorem setStatus_current (word : UInt32) : setStatus word (currentStatus word) = word := by
  apply UInt32.toNat_inj.mp
  have hw := word.toNat_lt
  simp only [setStatus, currentStatus, UInt32.toNat_ofNat']
  omega

def Instruction.registerStep (i : Instruction) (s : RegisterState) : RegisterState :=
  let addr := s.gpr.rdi + s.gpr.rax * 4
  match i with
  | .movEax bits => { s with gpr.rax := bits.toUInt64 }
  | .movd0 => { s with vector.xmm0 := zeroVector s.gpr.rax.toUInt32 }
  | .movd1 => { s with vector.xmm1 := zeroVector s.gpr.rax.toUInt32 }
  | .load0 => { s with vector.xmm0 := zeroVector (readWord s.memory addr) }
  | .load1 => { s with vector.xmm1 := zeroVector (readWord s.memory addr) }
  | .store0 => { s with memory := writeWord s.memory addr (low32 s.vector.xmm0) }
  | .addss => { s with vector.xmm0 := (replaceLow s.vector.xmm0
      (Float32.add (Float32.ofBits (low32 s.vector.xmm0)) (Float32.ofBits (low32 s.vector.xmm1))).toBits) }
  | .subss => { s with vector.xmm0 := (replaceLow s.vector.xmm0
      (Float32.sub (Float32.ofBits (low32 s.vector.xmm0)) (Float32.ofBits (low32 s.vector.xmm1))).toBits) }
  | .mulss => { s with vector.xmm0 := (replaceLow s.vector.xmm0
      (Float32.mul (Float32.ofBits (low32 s.vector.xmm0)) (Float32.ofBits (low32 s.vector.xmm1))).toBits) }
  | .divss => { s with vector.xmm0 := (replaceLow s.vector.xmm0
      (Float32.div (Float32.ofBits (low32 s.vector.xmm0)) (Float32.ofBits (low32 s.vector.xmm1))).toBits) }
  | .sqrtss => { s with vector.xmm0 := (replaceLow s.vector.xmm0
      (Float32.sqrt (Float32.ofBits (low32 s.vector.xmm0))).toBits) }
  | .xorps => { s with vector.xmm0 := s.vector.xmm0 ^^^ s.vector.xmm1 }
  | .andps => { s with vector.xmm0 := s.vector.xmm0 &&& s.vector.xmm1 }

/-- Relational SSE register effects. Arithmetic preserves controls and may set
    sticky status bits. The exact exception-status computation is abstracted;
    values use the kernel-visible IEEE model, with arbitrary NaN representation. -/
inductive RegisterTransition : Instruction → RegisterState → RegisterState → Prop where
  | fixed (h : floatingResult i s.data = none) :
      RegisterTransition i s (i.registerStep s)
  | floating (ready : MXCSRReady s.mxcsr)
      (h : floatingResult i s.data = some value) (bits : UInt32)
      (repr : Float32.ofBits bits = value) (status : Fin 64)
      (sticky : s.mxcsr.toNat % 64 ||| status.val = status.val) :
      RegisterTransition i s { s with vector.xmm0 := replaceLow s.vector.xmm0 bits, mxcsr := setStatus s.mxcsr status }

theorem registerStep_data (i : Instruction) (s : RegisterState)
    (hindex : indexed i = true → ZeroExtended s.gpr.rax) :
    (i.registerStep s).data = i.dataStep s.data := by
  cases i <;> simp only [Instruction.registerStep, Instruction.dataStep, RegisterState.data,
    low32_zeroVector, low32_replaceLow, low32_xor, low32_and, UInt32.toUInt32_toUInt64]
  all_goals first
    | rfl
    | have haddr := indexed_address_correct s.gpr.rdi s.gpr.rax (hindex rfl)
      rw [haddr]

theorem register_transition_data (h : RegisterTransition i s final)
    (hindex : indexed i = true → ZeroExtended s.gpr.rax) :
    DataTransition i s.data final.data := by
  cases h with
  | fixed hf => rw [registerStep_data i s hindex]; exact .fixed hf
  | floating ready hf bits repr status sticky =>
    simpa [RegisterState.data] using
      (DataTransition.floating hf bits repr)

theorem register_transition_rax (h : RegisterTransition i s final) :
    final.gpr.rax = nextRax i s.gpr.rax := by
  cases h with
  | fixed hf => cases i <;> rfl
  | floating ready hf bits repr status sticky =>
    cases i <;> simp [floatingResult] at hf <;> rfl

theorem register_transition_controls (h : RegisterTransition i s final) :
    final.mxcsr.toNat / 64 = s.mxcsr.toNat / 64 := by
  cases h with
  | fixed hf => cases i <;> rfl
  | floating ready hf bits repr status sticky => exact setStatus_controls _ _

inductive RegisterExecution : List Instruction → RegisterState → RegisterState → Prop where
  | nil : RegisterExecution [] s s
  | cons : RegisterTransition i s mid → RegisterExecution rest mid final →
      RegisterExecution (i :: rest) s final

theorem canonical_register_transition (i : Instruction) (s : RegisterState)
    (ready : MXCSRReady s.mxcsr) : RegisterTransition i s (i.registerStep s) := by
  cases i <;> first
    | exact .fixed rfl
    | simpa [Instruction.registerStep, RegisterState.data] using
        (RegisterTransition.floating ready (i := _) rfl _ (ofBits_toBits _)
          (currentStatus s.mxcsr) (by simp [currentStatus]))

def runRegisters : List Instruction → RegisterState → RegisterState
  | [], s => s
  | i :: rest, s => runRegisters rest (i.registerStep s)

theorem canonical_register_execution (code : List Instruction) (s : RegisterState)
    (ready : MXCSRReady s.mxcsr) : RegisterExecution code s (runRegisters code s) := by
  induction code generalizing s with
  | nil => exact .nil
  | cons i rest ih =>
    have hs := canonical_register_transition i s ready
    apply RegisterExecution.cons hs
    apply ih
    unfold MXCSRReady at *
    rw [register_transition_controls hs]
    exact ready

def CalleeFrame (s final : RegisterState) : Prop :=
  final.gpr.rbx = s.gpr.rbx ∧ final.gpr.rbp = s.gpr.rbp ∧
  final.gpr.r12 = s.gpr.r12 ∧ final.gpr.r13 = s.gpr.r13 ∧
  final.gpr.r14 = s.gpr.r14 ∧ final.gpr.r15 = s.gpr.r15 ∧
  final.vector.others = s.vector.others ∧ final.vector.upper = s.vector.upper ∧
  final.rflags = s.rflags ∧ final.mxcsr.toNat / 64 = s.mxcsr.toNat / 64

theorem register_transition_frame (h : RegisterTransition i s final) :
    CalleeFrame s final ∧ final.gpr.rsi = s.gpr.rsi ∧ final.gpr.rsp = s.gpr.rsp ∧
      final.gpr.rdi = s.gpr.rdi := by
  cases h with
  | fixed hf => cases i <;> simp [Instruction.registerStep, CalleeFrame]
  | floating ready hf bits repr status sticky => simp [CalleeFrame, setStatus_controls]

theorem register_execution_refines (h : RegisterExecution code s final)
    (hsafe : IndexSafe code s.gpr.rax) : DataExecution code s.data final.data := by
  induction h with
  | nil => exact .nil
  | cons step rest ih =>
    exact .cons (register_transition_data step hsafe.1)
      (ih (by simpa [register_transition_rax step] using hsafe.2))

/-- Every generated program preserves its Jaxpr outputs under the wider
    register relation, including upper vector lanes and full native addresses. -/
theorem jaxpr_register_execution (p : Jaxpr)
    (h : RegisterExecution (selectEquations p.equations) s final) :
    p.outputs.map (Atom.eval final.data.env) = p.eval s.data.env := by
  exact jaxpr_execution p (register_execution_refines h (selectEquations_indexSafe _ _))

end LeanMlir.Jaxpr.Native
