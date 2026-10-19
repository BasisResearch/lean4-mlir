# `tests/` — the gates behind the verified renders

| what | files |
|---|---|
| independent kernel re-check | [`comparator/`](comparator/): the headline theorems re-checked by Lean's kernel outside this project's build; `Challenge.lean` imports only Mathlib |
| differential oracle | [`vjp_oracle/`](vjp_oracle/): each backward checked against JAX autodiff, with the Lean side lowered through IREE |
| axiom audit | `AuditAxioms.lean`, `AuditAxiomsHeavy.lean`: `#audit_axioms` ([`AxiomAudit.lean`](AxiomAudit.lean)) over every pinned theorem: `#print axioms` that errors outside propext / Classical.choice / Quot.sound, so the file elaborating is the audit |
| citation gates | `BlueprintCheckDecls.lean`, `DocstringCheckRefs.lean`: every name the book or a docstring cites resolves |
| ties and checks | `Test*.lean`, one `lake exe` each: a committed render against the proven math (`*Tie`), data-parallel and sync-BN equivalence (`*DpCheck`, `*SyncBnCheck`, `*ShardCheck`), and regression guards for specific bugs |
| `#guard` scripts | `TestAxiomAudit.lean`, `TestVariantPredicates.lean`, `TestDropPathRamp.lean`, `TestBatchedEmitTie.lean`, `TestSmallNetsBatchedEmit.lean`, `TestR50Contract.lean`, `TestXlaPadOps.lean`: no exe; each fails by failing to elaborate. `lake test` builds their imports and runs them all (`lake test -- --audit` adds `AuditAxioms.lean`), and `certs.yml` does so on every run; the list is `guardScripts` in the lakefile |
| Bestiary | `bestiary_params.yml`, `verify_bestiary_timm.py`: the catalogue's parameter counts against timm |

The exe names are in [`lakefile.lean`](../lakefile.lean) under `tests/`. The proofs themselves
are in [`LeanMlir/Proofs/`](../LeanMlir/Proofs/); `lake build Certs` checks them.

`lake lint` runs the source-only gates in `scripts/gates/` (target names, naming, comment numbers,
module citations, the manifest, repo shape, audit and render coverage, train-step arity, implied
imports) with no Lean build, about a minute.
