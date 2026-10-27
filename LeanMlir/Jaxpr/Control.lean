module
public import LeanMlir.Jaxpr.Compiler

@[expose] public section
namespace LeanMlir.Jaxpr

inductive Pred where
  | le (a b : Expr)
  | lt (a b : Expr)
  | finite (a : Expr)
  | and (a b : Pred)
  | not (a : Pred)

def Pred.eval (env : Env) : Pred → Bool
  | .le a b => Float32.le (a.eval env) (b.eval env)
  | .lt a b => Float32.lt (a.eval env) (b.eval env)
  | .finite a => (a.eval env).isFinite
  | .and a b => a.eval env && b.eval env
  | .not a => !(a.eval env)

structure Code where
  words : List UInt32
  fuel : Nat

def compileCode (e : Expr) : Code := ⟨encode (compile e), (compile e).length⟩

def Code.eval (code : Code) (env : Env) : Option Float32 := do
  let [value] ← runWords env code.fuel code.words [] | none
  return value

theorem compileCode_correct (e : Expr) (env : Env) :
    (compileCode e).eval env = some (e.eval env) := by
  unfold Code.eval compileCode
  have h := backend_correct e env [] 0
  simp only [Nat.add_zero] at h
  simp [h]

inductive Test where
  | le (a b : Code)
  | lt (a b : Code)
  | finite (a : Code)
  | and (a b : Test)
  | not (a : Test)

def Test.eval (env : Env) : Test → Option Bool
  | .le a b => do return Float32.le (← a.eval env) (← b.eval env)
  | .lt a b => do return Float32.lt (← a.eval env) (← b.eval env)
  | .finite a => do return (← a.eval env).isFinite
  | .and a b => do return (← a.eval env) && (← b.eval env)
  | .not a => do return !(← a.eval env)

def compilePred : Pred → Test
  | .le a b => .le (compileCode a) (compileCode b)
  | .lt a b => .lt (compileCode a) (compileCode b)
  | .finite a => .finite (compileCode a)
  | .and a b => .and (compilePred a) (compilePred b)
  | .not a => .not (compilePred a)

theorem compilePred_correct (p : Pred) (env : Env) :
    (compilePred p).eval env = some (p.eval env) := by
  induction p with
  | le a b => simp [compilePred, Test.eval, compileCode_correct, Pred.eval]
  | lt a b => simp [compilePred, Test.eval, compileCode_correct, Pred.eval]
  | finite a => simp [compilePred, Test.eval, compileCode_correct, Pred.eval]
  | and a b ia ib => simp [compilePred, Test.eval, ia, ib, Pred.eval]
  | not a ia => simp [compilePred, Test.eval, ia, Pred.eval]

def store (env : Env) (slot : UInt32) (value : Float32) : Env :=
  fun i => if i = slot then value else env i

/-- Imperative control IR after bounded-loop unrolling and SSA destruction.
    The lowering of raw Jaxpr to this IR is a separate compiler pass. -/
inductive Stmt where
  | skip
  | assign (slot : UInt32) (value : Expr)
  | seq (first second : Stmt)
  | branch (condition : Pred) (yes no : Stmt)

def Stmt.eval (env : Env) : Stmt → Env
  | .skip => env
  | .assign slot value => store env slot (value.eval env)
  | .seq a b => b.eval (a.eval env)
  | .branch p yes no => if p.eval env then yes.eval env else no.eval env

inductive Block where
  | halt
  | write (slot : UInt32) (value : Code)
  | seq (first second : Block)
  | branch (condition : Test) (yes no : Block)

def Block.exec (env : Env) : Block → Option Env
  | .halt => some env
  | .write slot code => do return store env slot (← code.eval env)
  | .seq a b => do b.exec (← a.exec env)
  | .branch p yes no => do if ← p.eval env then yes.exec env else no.exec env

def compileStmt : Stmt → Block
  | .skip => .halt
  | .assign slot value => .write slot (compileCode value)
  | .seq a b => .seq (compileStmt a) (compileStmt b)
  | .branch p yes no => .branch (compilePred p) (compileStmt yes) (compileStmt no)

theorem compileStmt_correct (s : Stmt) (env : Env) :
    (compileStmt s).exec env = some (s.eval env) := by
  induction s generalizing env with
  | skip => rfl
  | assign slot value => simp [compileStmt, Block.exec, compileCode_correct, Stmt.eval]
  | seq a b ia ib => simp [compileStmt, Block.exec, ia, ib, Stmt.eval]
  | branch p yes no iy inn =>
    simp only [compileStmt, Block.exec, compilePred_correct, Stmt.eval]
    cases p.eval env <;> simp_all

/-- Fuel here is the source iteration limit. Once the guard is false no
    further iterations execute. This models an explicitly bounded while. -/
def boundedWhile (limit : Nat) (p : Pred) (body : Stmt) (env : Env) : Env :=
  match limit with
  | 0 => env
  | n + 1 => if p.eval env then boundedWhile n p body (body.eval env) else env

def unroll : Nat → Pred → Stmt → Stmt
  | 0, _, _ => .skip
  | n + 1, p, body => .branch p (.seq body (unroll n p body)) .skip

theorem unroll_correct (limit : Nat) (p : Pred) (body : Stmt) (env : Env) :
    (unroll limit p body).eval env = boundedWhile limit p body env := by
  induction limit generalizing env with
  | zero => rfl
  | succ n ih => simp [unroll, Stmt.eval, boundedWhile, ih]

/-- Universal bounded-loop compiler theorem through the arithmetic wordcode
    executor, including IEEE guard decisions and memory updates. -/
theorem compile_boundedWhile_correct (limit : Nat) (p : Pred) (body : Stmt) (env : Env) :
    (compileStmt (unroll limit p body)).exec env = some (boundedWhile limit p body env) := by
  rw [compileStmt_correct, unroll_correct]

end LeanMlir.Jaxpr
