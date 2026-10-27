module
public import Init.Data.Float
public import Std

@[expose] public section
namespace LeanMlir.Jaxpr

/-- IEEE operations with kernel-visible definitions in Lean 4.35. -/
inductive Unary where
  | neg | abs | sqrt
  deriving DecidableEq, Repr

inductive Binary where
  | add | sub | mul | div
  deriving DecidableEq, Repr

def Unary.eval : Unary → Float32 → Float32
  | .neg => Float32.neg
  | .abs => Float32.abs
  | .sqrt => Float32.sqrt

def Binary.eval : Binary → Float32 → Float32 → Float32
  | .add => Float32.add
  | .sub => Float32.sub
  | .mul => Float32.mul
  | .div => Float32.div

/-- Scalar Jaxpr arithmetic after resolving SSA references. Constants retain
    their IEEE bits. No algebraic rewrites or reassociation are performed. -/
inductive Expr where
  | input (slot : UInt32)
  | literal (bits : UInt32)
  | unary (op : Unary) (arg : Expr)
  | binary (op : Binary) (lhs rhs : Expr)
  deriving Repr

abbrev Env := UInt32 → Float32

def Expr.eval (env : Env) : Expr → Float32
  | .input i => env i
  | .literal bits => Float32.ofBits bits
  | .unary op a => op.eval (a.eval env)
  | .binary op a b => op.eval (a.eval env) (b.eval env)

/-- Target stack instructions. Execution is independent of the source AST. -/
inductive Instr where
  | load (slot : UInt32)
  | constant (bits : UInt32)
  | unary (op : Unary)
  | binary (op : Binary)
  deriving Repr

abbrev Stack := List Float32

def Instr.exec (env : Env) : Instr → Stack → Option Stack
  | .load i, stack => some (env i :: stack)
  | .constant bits, stack => some (Float32.ofBits bits :: stack)
  | .unary op, a :: stack => some (op.eval a :: stack)
  | .binary op, b :: a :: stack => some (op.eval a b :: stack)
  | _, _ => none

def exec (env : Env) : List Instr → Stack → Option Stack
  | [], stack => some stack
  | i :: code, stack => (i.exec env stack).bind (exec env code)

def compile : Expr → List Instr
  | .input i => [.load i]
  | .literal bits => [.constant bits]
  | .unary op a => compile a ++ [.unary op]
  | .binary op a b => compile a ++ compile b ++ [.binary op]

theorem exec_append (env : Env) (a b : List Instr) (stack : Stack) :
    exec env (a ++ b) stack = (exec env a stack).bind (exec env b) := by
  induction a generalizing stack with
  | nil => rfl
  | cons i code ih =>
    simp only [List.cons_append, exec]
    cases h : i.exec env stack <;> simp [ih]

/-- Universal compiler correctness, including every Float32 exceptional value.
    This is a compiler theorem, not validation of a selected execution. -/
theorem compile_correct (e : Expr) (env : Env) (stack : Stack) :
    exec env (compile e) stack = some (e.eval env :: stack) := by
  induction e generalizing stack with
  | input i => rfl
  | literal bits => rfl
  | unary op a ih => simp [compile, exec_append, ih, exec, Instr.exec, Expr.eval]
  | binary op a b iha ihb =>
    simp [compile, exec_append, iha, ihb, exec, Instr.exec, Expr.eval]

/-- Wordcode tags: constant 0, load 1, unary 2..4, binary 5..8. -/
def Instr.encode : Instr → List UInt32
  | .constant bits => [0, bits]
  | .load i => [1, i]
  | .unary .neg => [2]
  | .unary .abs => [3]
  | .unary .sqrt => [4]
  | .binary .add => [5]
  | .binary .sub => [6]
  | .binary .mul => [7]
  | .binary .div => [8]

def encode (code : List Instr) : List UInt32 := code.flatMap Instr.encode

/-- Decode exactly one instruction, rejecting truncation and unknown tags. -/
def decode : List UInt32 → Option (Instr × List UInt32)
  | tag :: tail =>
    if tag = 0 then match tail with
      | bits :: rest => some (.constant bits, rest)
      | [] => none
    else if tag = 1 then match tail with
      | i :: rest => some (.load i, rest)
      | [] => none
    else if tag = 2 then some (.unary .neg, tail)
    else if tag = 3 then some (.unary .abs, tail)
    else if tag = 4 then some (.unary .sqrt, tail)
    else if tag = 5 then some (.binary .add, tail)
    else if tag = 6 then some (.binary .sub, tail)
    else if tag = 7 then some (.binary .mul, tail)
    else if tag = 8 then some (.binary .div, tail)
    else none
  | [] => none

theorem decode_encode (i : Instr) (tail : List UInt32) :
    decode (i.encode ++ tail) = some (i, tail) := by
  cases i with
  | load i => simp [Instr.encode, decode]
  | constant bits => simp [Instr.encode, decode]
  | unary op => cases op <;> simp [Instr.encode, decode]
  | binary op => cases op <;> simp [Instr.encode, decode]

/-- Executable wordcode interpreter. Exhausted fuel is an error, never success. -/
def runWords (env : Env) : Nat → List UInt32 → Stack → Option Stack
  | _, [], stack => some stack
  | 0, _ :: _, _ => none
  | fuel + 1, words@(_ :: _), stack => do
    let (i, rest) ← decode words
    let next ← i.exec env stack
    runWords env fuel rest next

theorem encode_nonempty (i : Instr) : i.encode ≠ [] := by
  cases i with
  | constant _ => simp [Instr.encode]
  | load _ => simp [Instr.encode]
  | unary op => cases op <;> simp [Instr.encode]
  | binary op => cases op <;> simp [Instr.encode]

private theorem runWords_step (env : Env) (fuel : Nat) (i : Instr)
    (words : List UInt32) (stack : Stack) :
    runWords env (fuel + 1) (i.encode ++ words) stack =
      (i.exec env stack).bind (runWords env fuel words) := by
  have hn : i.encode ++ words ≠ [] := List.append_ne_nil_of_left_ne_nil (encode_nonempty i) words
  cases he : i.encode ++ words with
  | nil => exact False.elim (hn he)
  | cons w ws =>
    simp only [runWords]
    have hd := decode_encode i words
    rw [he] at hd
    simp [hd]

theorem runWords_encode (env : Env) (code : List Instr) (extra : Nat) (stack : Stack) :
    runWords env (code.length + extra) (encode code) stack = exec env code stack := by
  induction code generalizing stack with
  | nil => simp [encode, runWords, exec]
  | cons i code ih =>
    simp only [encode, List.flatMap_cons, List.length_cons]
    rw [show code.length + 1 + extra = (code.length + extra) + 1 by omega, runWords_step]
    change (i.exec env stack).bind (fun s => runWords env (code.length + extra) (encode code) s) = _
    simp [ih, exec]

/-- Lower source arithmetic all the way through the serialized target executor. -/
theorem backend_correct (e : Expr) (env : Env) (stack : Stack) (extra : Nat) :
    runWords env ((compile e).length + extra) (encode (compile e)) stack =
      some (e.eval env :: stack) := by
  rw [runWords_encode, compile_correct]

end LeanMlir.Jaxpr
