module
public import LeanMlir.Jaxpr.Native.Select

@[expose] public section
namespace LeanMlir.Jaxpr.Native

/-- Architectural RAX update. Writing EAX clears RAX's upper 32 bits. -/
def nextRax (i : Instruction) (rax : UInt64) : UInt64 :=
  match i with
  | .movEax bits => bits.toUInt64
  | _ => rax

def indexed : Instruction → Bool
  | .load0 | .load1 | .store0 => true
  | _ => false

def ZeroExtended (rax : UInt64) : Prop := rax = rax.toUInt32.toUInt64

theorem zeroExtended_mov (bits : UInt32) : ZeroExtended bits.toUInt64 := by
  simp [ZeroExtended]

theorem nextRax_preserves (i : Instruction) (rax : UInt64) (h : ZeroExtended rax) :
    ZeroExtended (nextRax i rax) := by
  cases i <;> first | exact h | exact zeroExtended_mov _

def finalRax : List Instruction → UInt64 → UInt64
  | [], rax => rax
  | i :: rest, rax => finalRax rest (nextRax i rax)

/-- Every indexed instruction executes with a zero-extended RAX. -/
def IndexSafe : List Instruction → UInt64 → Prop
  | [], _ => True
  | i :: rest, rax => (indexed i = true → ZeroExtended rax) ∧ IndexSafe rest (nextRax i rax)

theorem indexSafe_of_zeroExtended (code : List Instruction) (rax : UInt64)
    (h : ZeroExtended rax) : IndexSafe code rax := by
  induction code generalizing rax with
  | nil => trivial
  | cons i rest ih => exact ⟨fun _ => h, ih _ (nextRax_preserves i rax h)⟩

theorem indexSafe_append (a b : List Instruction) (rax : UInt64) :
    IndexSafe (a ++ b) rax ↔ IndexSafe a rax ∧ IndexSafe b (finalRax a rax) := by
  induction a generalizing rax with
  | nil => simp [IndexSafe, finalRax]
  | cons i rest ih => simp [IndexSafe, finalRax, ih, and_assoc]

theorem indexSafe_mov (bits : UInt32) (rest : List Instruction) (rax : UInt64) :
    IndexSafe (.movEax bits :: rest) rax := by
  exact ⟨by simp [indexed], indexSafe_of_zeroExtended rest _ (zeroExtended_mov bits)⟩

theorem selectOperation_indexSafe (op : Operation) (rax : UInt64) :
    IndexSafe (selectOperation op) rax := by
  cases op with
  | copy a => cases a <;> exact indexSafe_mov _ _ _
  | unary op a => cases a <;> exact indexSafe_mov _ _ _
  | binary op a b => cases a <;> exact indexSafe_mov _ _ _

theorem selectEquation_indexSafe (e : Equation) (rax : UInt64) :
    IndexSafe (selectEquation e) rax := by
  apply (indexSafe_append _ _ _).mpr
  exact ⟨selectOperation_indexSafe e.operation rax, indexSafe_mov _ _ _⟩

/-- No entry assumption on RAX. The compiler establishes the invariant itself. -/
theorem selectEquations_indexSafe (eqs : List Equation) (rax : UInt64) :
    IndexSafe (selectEquations eqs) rax := by
  induction eqs generalizing rax with
  | nil => trivial
  | cons e rest ih =>
    change IndexSafe (selectEquation e ++ selectEquations rest) rax
    exact (indexSafe_append _ _ _).mpr ⟨selectEquation_indexSafe e rax, ih _⟩

/-- Native SIB addressing equals the data projection at indexed instructions. -/
theorem indexed_address_correct (base rax : UInt64) (h : ZeroExtended rax) :
    base + rax * 4 = slotAddress base rax.toUInt32 := by
  change base + rax * 4 = base + rax.toUInt32.toUInt64 * 4
  exact congrArg (fun r => base + r * 4) h

end LeanMlir.Jaxpr.Native
