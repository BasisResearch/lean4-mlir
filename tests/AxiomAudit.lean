module

public meta import Lean.Elab.Command

public section

/-! # `#audit_axioms` — the three-axiom closure, checked by Lean

`#audit_axioms foo` is `#print axioms foo` that also fails: it logs the same
`'foo' depends on axioms: [...]` line, and an error when the list leaves
`{propext, Classical.choice, Quot.sound}`. A subset passes in any order (a toolchain bump can
shrink a list, and an axiom-free decl prints `does not depend on any axioms`). A name that does not
resolve is an elaboration error, as under `#print axioms`.

So `lake env lean tests/AuditAxioms.lean` exiting 0 IS the audit: the shell grep that once turned
an elaboration failure into a green run (`Proofs.dw_sum_pair`, eight days) has nothing left to miss. -/

open Lean Elab Command

namespace AxiomAudit

/-- The closure every audited declaration must stay inside. -/
meta def allowed : List Name := [``propext, ``Classical.choice, ``Quot.sound]

/-- `#audit_axioms foo` — `#print axioms foo`, failing outside `allowed`. -/
syntax (name := auditAxioms) "#audit_axioms " ident : command

@[command_elab auditAxioms] meta def elabAuditAxioms : CommandElab
  | `(#audit_axioms%$tk $id) => do
    let c ← liftCoreM <| realizeGlobalConstNoOverloadWithInfo id
    let axs := (← liftCoreM <| collectAxioms c).qsort Name.lt
    if axs.isEmpty then
      logInfoAt tk m!"'{c}' does not depend on any axioms"
    else
      logInfoAt tk m!"'{c}' depends on axioms: {axs.toList}"
    let bad := axs.filter (!allowed.contains ·)
    unless bad.isEmpty do
      logErrorAt id m!"'{c}' leaves the three-axiom closure: {bad.toList}"
  | _ => throwUnsupportedSyntax

end AxiomAudit
