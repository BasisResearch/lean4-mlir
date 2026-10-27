module
public import LeanMlir.Jaxpr.Control

@[expose] public section
namespace LeanMlir.Jaxpr

/-- Restricted scalar-f32 Jaxpr atoms. Dtypes and singleton shapes are checked
    at the parser boundary; variable identifiers are 32-bit slot indices. -/
inductive Atom where
  | var (slot : UInt32)
  | literal (bits : UInt32)
  deriving Repr

def Atom.eval (env : Env) : Atom → Float32
  | .var i => env i
  | .literal bits => Float32.ofBits bits

def Atom.toExpr : Atom → Expr
  | .var i => .input i
  | .literal bits => .literal bits

@[simp] theorem Atom.toExpr_correct (a : Atom) (env : Env) :
    a.toExpr.eval env = a.eval env := by cases a <;> rfl

inductive Operation where
  | copy (a : Atom)
  | unary (op : Unary) (a : Atom)
  | binary (op : Binary) (a b : Atom)
  deriving Repr

def Operation.eval (env : Env) : Operation → Float32
  | .copy a => a.eval env
  | .unary op a => op.eval (a.eval env)
  | .binary op a b => op.eval (a.eval env) (b.eval env)

def Operation.toExpr : Operation → Expr
  | .copy a => a.toExpr
  | .unary op a => .unary op a.toExpr
  | .binary op a b => .binary op a.toExpr b.toExpr

@[simp] theorem Operation.toExpr_correct (o : Operation) (env : Env) :
    o.toExpr.eval env = o.eval env := by
  cases o <;> simp [toExpr, Expr.eval, eval]

structure Equation where
  result : UInt32
  operation : Operation
  deriving Repr

structure Jaxpr where
  equations : List Equation
  outputs : List Atom
  deriving Repr

def evalEquations : List Equation → Env → Env
  | [], env => env
  | eq :: rest, env => evalEquations rest (store env eq.result (eq.operation.eval env))

def Jaxpr.eval (p : Jaxpr) (env : Env) : List Float32 :=
  p.outputs.map (Atom.eval (evalEquations p.equations env))

def lowerEquations : List Equation → Stmt
  | [] => .skip
  | eq :: rest => .seq (.assign eq.result eq.operation.toExpr) (lowerEquations rest)

theorem lowerEquations_correct (eqs : List Equation) (env : Env) :
    (lowerEquations eqs).eval env = evalEquations eqs env := by
  induction eqs generalizing env with
  | nil => rfl
  | cons eq rest ih => simp [lowerEquations, Stmt.eval, evalEquations, ih]

structure Executable where
  body : Block
  outputs : List Code

def evalOutputs (env : Env) : List Code → Option (List Float32)
  | [] => some []
  | code :: rest => do return (← code.eval env) :: (← evalOutputs env rest)

def Executable.run (exe : Executable) (env : Env) : Option (List Float32) := do
  let final ← exe.body.exec env
  evalOutputs final exe.outputs

def compileJaxpr (p : Jaxpr) : Executable :=
  ⟨compileStmt (lowerEquations p.equations), p.outputs.map (fun a => compileCode a.toExpr)⟩

private theorem evalOutputs_correct (outputs : List Atom) (env : Env) :
    evalOutputs env (outputs.map (fun a => compileCode a.toExpr)) = some (outputs.map (Atom.eval env)) := by
  induction outputs with
  | nil => rfl
  | cons a rest ih => simp [evalOutputs, compileCode_correct, ih]

/-- Compiler correctness for every restricted Jaxpr and every input environment.
    The actual target executor's outputs are the conclusion. -/
theorem compileJaxpr_correct (p : Jaxpr) (env : Env) :
    (compileJaxpr p).run env = some (p.eval env) := by
  simp [compileJaxpr, Executable.run, compileStmt_correct, lowerEquations_correct,
    evalOutputs_correct, Jaxpr.eval]

end LeanMlir.Jaxpr
