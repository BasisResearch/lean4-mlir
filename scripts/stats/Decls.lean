import Lean
open Lean

/-! Count the declarations each module adds, by kind, from the elaborated environment rather
    than by grepping source. `private`, `protected`, attributes on the same line, `lemma`,
    and macro-generated declarations all land here as what Lean made of them.
    `lake env lean --run scripts/stats/Decls.lean <modules.txt> <out.tsv>`.
    Driven by `scripts/stats/summary.py`, which passes the proof modules a lib built.

    Kept: constants with a declaration range (the ones a user wrote), minus internal names
    (`match_`, `proof_`, `eq_1`, `_`-prefixed), auxiliary recursors, `noConfusion`, structure
    projections, constructors and recursors. Output, one row per module:
    `module  theorems  defs  instances  types  axioms`. -/

def kindOf (env : Environment) (c : Name) : ConstantInfo → Option String
  | .thmInfo _ => some "thm"
  | .axiomInfo _ => some "axiom"
  | .inductInfo _ => some "type"
  | .defnInfo _ | .opaqueInfo _ =>
    if Meta.isInstanceCore env c then some "inst"
    else if env.isProjectionFn c then none
    else some "def"
  | .ctorInfo _ | .recInfo _ | .quotInfo _ => none

unsafe def main (args : List String) : IO Unit := do
  let modsFile := args[0]!
  let outFile := args[1]!
  initSearchPath (← findSysroot)
  let mods := (← IO.FS.lines modsFile).filter (· ≠ "") |>.map String.toName
  enableInitializersExecution
  let env ← importModules (mods.map fun m => { module := m }) {} (loadExts := true)
  let wanted : Std.HashSet Name := .ofArray mods
  let ctx : Core.Context := { fileName := "<decls>", fileMap := default, options := {} }
  let st : Core.State := { env }
  let mut counts : Std.HashMap (Name × String) Nat := {}
  for (c, ci) in env.constants.map₁.toList do
    let some idx := env.getModuleIdxFor? c | continue
    let m := env.header.moduleNames[idx.toNat]!
    unless wanted.contains m do continue
    if (privateToUserName c).isInternalDetail then continue
    if isAuxRecursor env c || isNoConfusion env c then continue
    let some k := kindOf env c ci | continue
    let (r?, _) ← (findDeclarationRanges? c : CoreM _).toIO ctx st
    if r?.isNone then continue
    counts := counts.alter (m, k) fun n => some (n.getD 0 + 1)
  let h ← IO.FS.Handle.mk outFile .write
  for m in mods do
    let get k := counts.getD (m, k) 0
    h.putStrLn s!"{m}\t{get "thm"}\t{get "def"}\t{get "inst"}\t{get "type"}\t{get "axiom"}"
  IO.println s!"counted declarations in {mods.size} modules"
