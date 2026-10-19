import tests.AxiomAudit

/-! # `#audit_axioms` can fail

The negative control for tests/AxiomAudit.lean: a gate that has never been seen to fail is not
known to be a gate. Each verdict is pinned by `#guard_msgs` — the passing forms, a decl on an axiom
outside the three, and a name that does not resolve. The decl outside the three rests on `sorryAx`,
not a declared `axiom`: the repo holds none (proofs.yml's zero-axiom-declaration guard), tests
included. `lake env lean tests/TestAxiomAudit.lean` exits 0 exactly when every pinned message is
what Lean prints. -/

theorem axiomAuditFree : 1 + 1 = 2 := rfl
theorem axiomAuditClassical (p : Prop) : p ∨ ¬p := Classical.em p
set_option warn.sorry false in
theorem axiomAuditSorry : (1 : Nat) = 2 := sorry

/-- info: 'axiomAuditFree' does not depend on any axioms -/
#guard_msgs in
#audit_axioms axiomAuditFree

/-- info: 'axiomAuditClassical' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#audit_axioms axiomAuditClassical

/--
info: 'axiomAuditSorry' depends on axioms: [sorryAx]
---
error: 'axiomAuditSorry' leaves the three-axiom closure: [sorryAx]
-/
#guard_msgs in
#audit_axioms axiomAuditSorry

/-- error: Unknown constant `axiomAuditMissing` -/
#guard_msgs in
#audit_axioms axiomAuditMissing
