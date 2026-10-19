import tests.AxiomAudit

/-! # `#audit_axioms` can fail

The negative control for tests/AxiomAudit.lean: a gate that has never been seen to fail is not
known to be a gate. Each verdict is pinned by `#guard_msgs` — the passing forms, a decl on an axiom
outside the three, `sorryAx`, and a name that does not resolve. `lake env lean
tests/TestAxiomAudit.lean` exits 0 exactly when every pinned message is what Lean prints. -/

theorem axiomAuditFree : 1 + 1 = 2 := rfl
theorem axiomAuditClassical (p : Prop) : p ∨ ¬p := Classical.em p
axiom axiomAuditStray : False
theorem axiomAuditLeak : (1 : Nat) = 2 := axiomAuditStray.elim
set_option warn.sorry false in
theorem axiomAuditSorry : (1 : Nat) = 2 := sorry

/-- info: 'axiomAuditFree' does not depend on any axioms -/
#guard_msgs in
#audit_axioms axiomAuditFree

/-- info: 'axiomAuditClassical' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#audit_axioms axiomAuditClassical

/--
info: 'axiomAuditLeak' depends on axioms: [axiomAuditStray]
---
error: 'axiomAuditLeak' leaves the three-axiom closure: [axiomAuditStray]
-/
#guard_msgs in
#audit_axioms axiomAuditLeak

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
