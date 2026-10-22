# book_copy_audit_2026-10-21.md — Appendix B rethink, dev-history language, front matter

First-pass findings from a read-only session on 2026-10-21 (nothing in `content.tex` was edited).
Line numbers are `blueprint/src/content.tex` at `eb6b5f13`; they will drift, so search by quote.
Three parts: (1) Appendix B simplification, (2) every passage that narrates development history
rather than describing the shipped state, (3) Foundations and "How this book is organized".
A fourth section records a RunPod cost estimate for the owed ImageNet runs.

Goal of the follow-up session: the book describes one known-good, tested state. Prose that only
makes sense if you know what the project used to do goes, or is restated as a property.

---

## 1. Appendix B (On Verification, ~L19643–20450)

**Diagnosis.** Two layers: the shipped story (proofs → `SHlo` / `StableHLO.Pretty` render →
verified-path oracle → float layer) and the history of getting there (`Back`/`IRPrint`,
`MlirCodegen` oracles, cross-backend traces). With the verified-path oracle green (2026-10-19), most
of the second layer can shrink.

### Drop / demote

1. **`IRPrint.lean`, the "legacy printer"** — L19840–44, L20072–73, L20226–27. "Kept as a
   demonstration that nothing imports"; it survives only because the IREE-vs-NumPy oracle
   (`LeanMlir/Proofs/check_ir_codegen.py`, line 58 runs `IRPrint.lean`) still renders from it.
   Decide: retarget that oracle at the `Pretty` artifacts and delete IRPrint from the book, or drop
   the oracle row + paragraph. Either way "three generators produce StableHLO" (L20069–76) → two.
2. **"Inside a bridge theorem" (L19958–20059) teaches the ancestor IR** (`Back`, `emitDenseBack`,
   `mlp_whole_bridge`). Closing paragraph: "A printer walks it with names in place of its values …
   the chapter listings are committed renders built this way" — that's IRPrint, not how the shipped
   listings are made. Redo on `SHlo`, or keep `Back` and label it the per-operator teaching form.
3. **Cross-backend traces / "The JAX parallel pipeline" (L20150–81).** Old `MlirCodegen` runs,
   MNIST MLP/CNN, `historical/traces/`. The verified-path oracle supersedes it. Shrink to ~2
   sentences ("the reference path also agrees with JAX across two vendors; traces in …"); drop the
   ~4400-line Codegen detail.
4. **"Two asymmetries, stated plainly" (L20183–203)** exists to apologise that the oracles didn't
   run the proven text. Restructure Cross-checked to lead with the verified-path oracle; present the
   `MlirCodegen` oracles as checks on the reference path. Most of the paragraph goes.
5. **"Not XLA" argued twice** — L20096–104 ("IREE is kept because it is not XLA") near-duplicates
   Appendix A's *The second lowerer*. Keep one.
6. **Margin probe described twice** — §exec_oracle (L20237–43) and "Measured against proven"
   (L20419–27). Keep the latter; oracle section keeps only the table row.
7. **Axiom audit meta/history** — "two smooth-point forms that global theorems superseded" (L19710),
   "quoted here deliberately as a property rather than a number" (L19724). Cut both.

### Simplify

8. **Comparator (L19735–97)**: the 13 / 39 / 58 three-file split is good but ~60 lines; L19789–97
   restates the opening. Cut ~⅓.
9. **"The one conditional" (L19928–56)**: stem-pool twin-window material (`StemPoolTwinAt`,
   `r34Stem_select_grads_eq`) is ResNet-specific; move to Ch 5, leave one sentence.
10. **Finite precision (L20256–449)**, longest section. "How far the model reaches" and "the honest
    summary is three sentences" overlap; "Keeping them apart is the honest part" framing. Oddities:
    L20273–74 "The certified backward ties say each net's hand-written gradient chain is the
    certified one" (stray); L20406 "not for want of effort" (defensive).
11. **"Why it is tractable" (L19885–94)** argues from build chronology ("before any code generation
    existed"). Say it structurally: per-operator and generic.

### Known limitations — confirm they're still true before ship

- IREE 3.11 `llvm-cpu` miscompile → vmvx (L20230–36).
- `e_exp` "nothing in the repository measures it" (L20302).

---

## 2. Development-history language, whole book

Sweep by four parallel readers; a few entries spot-checked, not all. Strong hits first per group.
Appendix B hits are in §1.

**Policy calls to make once, not line by line:**
- Dated run directories (`runs/2026-09-01-*`, …) cited as provenance throughout. Probably keep.
- `[TODO: … rerun is owed]` markers on stale pairs (Ch 5–9): each resolves by a rerun or by prose
  describing the run that exists. These are the real finish-line list; see
  `planning/imagenet_finish_line.md` "Runs owed".

### Ch 1–4 (mostly clean)
- L366 "a smooth-point form that a later global theorem superseded" (also in front matter, §3).
- L5369–77 AdamW `loss=NaN` episode ("turned out to be the diagnostic") → state that the logged loss
  is report-only and can read NaN while the gradient is fine.
- L5358 "this time it recovers it everywhere".
- L5434–37 "until it moved across there was no bf16 arm".
- L5522 "hard-wired to 64 is now a parameter".
- Borderline: L2203 ("silently truncated"), L4183–90 ("so that the printed text does not change"),
  L5486, L5494–98 (fp8 arm "exists in the repository").
- Comments only: L8 (orphaned "until its sync-BN re-run lands"), L22–24.

### Ch 5 ResNet
- L6888–96 2026-10-06 crop change, "now crops with torchvision's too".
- L6904; TODOs L7129–42, L7444–50, L7737–43.
- **Real inconsistency (checked):** `tab:r34_paths` L7107–09 says every-parameter decay / γ=1 / 0.99;
  recipe text L6884–87 says no bias decay / zero-γ / 0.9; L7258 then says "against ResNet-34's
  0.99". Table is the old run's recipe (TODO already admits it). Same for R50 at L7350, L7424.
- L7686–88 "the 2026-10-07 re-probe … after … entered the shims".
- Borderline: L7036–39, L7467–74 (rescoring narrative), L7717 ("emalamb twins stay on disk unused").
- Comments only: L6701–03, L6800–06.

### Ch 6 MobileNetV2
- L8643 "Lines marked x2 or x3 …" — listing has no such markers now (dangling).
- L8854–82 ticket IDs (D11/D12/D13/F8) in the *rendered* listing.
- L8916–21 "originally ran in fp32".
- L9143–49 "The pair this replaces …".
- L9493–95; L9573–76 (McNemar "is owed"); TODO L9623–37.
- Borderline: L9087 / L9364 (PCIe restart — legitimate disclosure), L9449, L9520.

### Ch 7 EfficientNet
- **L10496–524 rendered listing** carries dates, a `planning/recipe_prep.md §7` pointer, ticket IDs,
  "no lowered LR, no grad clip". Worst listing in the book.
- L10716 "the count the correctly-sized squeeze restores".
- L10291 "every row now a measurement".
- L10801 "no rescoring gap this time".
- Borderline (RMSProp / squeeze-sizing debugging echoes): L10229–33, L10546–50, L10594–611,
  L10624–30, L10737–59, L10918–22.

### Ch 8 ConvNeXt (densest)
- L11791–804 "Until 2026-09-13 the verified path initialised layer scale to ones …".
- L11955–57 "the file today carries …"; L11989 "(was 5)"; L11994 / 12001 / 12005 "after the run below".
- L12040–44; L12168–71 "where the shard check was written before being generalized".
- L12180–83 "landed after this run"; L12193–96 "no longer that job".
- TODOs L12249–61, L12471–85; L12451 dated smokes.
- L11337–39 tanh "trained" vs exact "train".
- Borderline: L11149–52, L11863, L12093, L12278, L12378.

### Ch 9 ViT
- L14516 "now covers … not yet cover vitin"; L14550–53 "tie has not been restated".
- L14735–40 "on the first renders …"; L14745 dated smokes; TODO L14767–90.
- Borderline: L14123, L14145 ("now a measurement"), L14176 ("measured three times before being
  printed"), L14392–97.

### Bestiary
- L15622 "what the first book trained" (reader has no first book in context here).
- L17463 "archived beside it" while L17482 still cites the CIFAR variant as live.
- L17512–15 "Its first run caught a broken checkpoint …".
- L18769–72 "An update was 24 ms … it is 14.6".
- L18924–27 "The first run used … and diverged at iteration 11".
- L19039–40 "it was dead — returned instead of dropped".
- Borderline: L14899, L15983, L18306, L18765, L18993–95 (orphaned "was expected to take a day"),
  L19097.

### Appendices A / C / D, back matter
- L19556–58 Platforms rows: "next run", "full runs to come".
- **L20504–06** "rather than falling back to another net's, because an earlier fallback silently gave
  every net ResNet-34's augmentation" (the example that started this).
- L20481 "an earlier conf than the row trains today".
- L21091 `rs-phase2` path.
- Comments only: Colophon SKELETON / TODO (L21249–83).

---

## 3. Front matter

### Foundations — what it should establish before Ch 1

1. **The five parked concepts** (2026-10-18; see memory "foundations-cover-section-parked") are
   still unaddressed and still the main gap:
   - parameter gradients — `HasVJP` is in *x*; the weight gradient is the same record along the
     flattened-weights axis (Foundations never shows ∂L/∂θ);
   - ℝ vs the GPU (bf16 under an fp32 head) — today only Appendix B says it;
   - per-example theorems summed at 1/N, BatchNorm the exception (why Ch 4 proves it twice);
   - the gradient is where the proofs stop; SGD is the only update proven about;
   - the two trainers + "rows above the rule differ" — first explained at Ch 5 but used from Ch 1's
     "Run it first".
2. **Shape-convention flip.** Prose: *f* : Vec n → Vec m, m×n Jacobian, J_{i,j} = pdiv f x i j — but
   pdiv's definition makes *i* the input index; the Lean `HasVJP` block uses Vec m → Vec n. Pick one.
3. **"Cotangent" never defined** — first appears in the `HasVJP` bullet; used everywhere after.
4. Maybe: two sentences on reading the Lean (`Vec n`, `Fin n`), unless "Who this book is for"
   already covers it.

### How this book is organized

**Drifted:**
- Chapter bullets list only the primitive. Missing: Ch 5 ResNet-50 / ablation / ImageNet recipe;
  Ch 6 MobileNetV4; Ch 8 & 9 S/B side quests; that Ch 5+ carry an ImageNet pair on two trainers.
- Ch 8 bullet "Data augmentation strategies" — augmentation is assembled in Ch 5. Casing:
  "Batchnorm".
- Roadmap "ResNet-34 … Adds one theorem on top of CNN+BN" vs budget table (9 contracts, 7 step
  certificates).
- Roadmap chains are linear guesses ("EfficientNet subset + Ch 8"). Does ConvNeXt need Ch 7 (SE)?
  Check every target against the `\uses` graph / chapter-map figure.

**Wording:**
- Ch 1 "the book's densest chapter" vs Roadmap "read Ch 1 carefully (it's short)".
- "Ch~2–5 is a complete reading list" → Ch 1–5.
- CNN target: "proved from this chapter's foundation" — no referent.
- "It reads most naturally once you've been through the Foundations chapter, so it's safe to skip
  on a first pass" — non sequitur (probably "once you've been through a few chapters").
- "the GOAT" — tone call.
- Spines figure "five chapter networks" vs Appendix B "all thirteen chapter networks are tied" —
  probably both true; reconcile in a phrase.

**Structure:**
- Budget paragraph is the heaviest block before Ch 1 (definitions + counting rules before a reader
  has seen `HasVJP`). Keep the three definitions and the totals; move counting rules (incl. the
  "superseded smooth-point form" clause) to a table note or Appendix B.
- "For readers of the first book": "Training recipe upgraded" says Adam; Ch 5's ImageNet recipe is
  SGD. One clause.
- Hand-typed counts: "twelve of the groups carry a demo", "Forty-six further architectures" —
  verify, or macro them like the depgraph counts.
- Budget table totals verified: 44 / 9 / 37 ✓.

---

## 4. RunPod cost estimate for the owed ImageNet runs (2026-10-21)

**Inputs.**
- Runs owed: `planning/imagenet_finish_line.md` "Runs owed" — ~2,160 box-hours excluding landed
  MNv2, plus ~100 for the R34 / R50-2018 Bag-of-Tricks reruns (both halves) → **~2,260 box-hours**
  on ares (4× RTX 4060 Ti, 32 threads). Since landed (d1d16acc, f1d2ece4): the R34 Bag-of-Tricks
  pair, ~40 h off that; the book's Ch 5 R34 table/TODO hasn't moved to it yet.
- A100 anchor: 2026-07-08 RunPod A100-SXM4-80GB, R50 @224 fp32 1,239–1,277 img/s, saturated from
  bs192 (`planning/archive/mi300x_rental_program.md` run-0a). bf16 ×1.6 → ~2,000 img/s.
- ares R50-2018 verified bf16: 222 ms/step at bs256 = ~1,150 img/s, 31.6 h for 90 ep
  (`runs/2026-10-10-r50-2018-verified-bf16-90ep/`).
- GPU-side ratio, A100 ÷ ares ≈ 1.75, matching the memory-bandwidth ratio (2.0 TB/s vs 4 × 288 GB/s).
- **Host feed:** ares tops out ~1,650–1,760 img/s on the heavy-aug recipes with all 32 threads busy
  (`runs/2026-10-05-shim-feed-bench/`); MNv4 is CPU-bound there, ViT held 29 / 32 threads.

**Estimate.**
- *If the feed keeps up* (light-aug R34 / R50-2018; or heavy aug with ≥32 fast cores): ~1,300 A100-h
  × $1.79 ≈ **$2,300** (range $2.0–2.9k for ratio 1.4–2.0).
- *As the code is today on a 16-vCPU A100 pod*: the heavy-aug recipes (B0, ConvNeXt T/S/B, ViT S/B,
  MNv4-500, A2, A1 — ~95% of the hours) are feed-bound at roughly ⅓–½ of ares → slower than the
  home box; ~$6–8k. Don't.
- The bottleneck to buy is CPU per image, not GPU bandwidth.

**Before buying credits:** one ~$5–20 probe pod running the side-quest ETA probe
(`runs/2026-10-06-sidequest-probe-3060/` method) plus a feed bench on the pod's vCPUs; and check
whether a 1-GPU 80 GB pod needs a 1×256 render (confs are 4×64; one device at 256 = global BN, same
math as sync-BN, but a different render). ImageNet on a network volume: ~$10/mo + upload.

---

## 5. Trainium probe (trn1.2xlarge, ~$1.34/h) — build + Imagenette

Not ImageNet: trn1.2xlarge is 1 Trainium1 chip (2 NeuronCores, 32 GB HBM, ~820 GB/s ≈ 0.7 of an
ares box GPU-side) and only 8 vCPU, so heavy-aug ImageNet would be feed-starved. Imagenette's bins
are pre-decoded, so the feed is not the question there. The point is software: does Neuron take
our StableHLO, match the goldens, and how do convs fare vs ViT.

Why it is cheap to try: the verified trainers dlopen any PJRT plugin via `$PJRT_PLUGIN`
(`ffi/pjrt_ffi.c`); Neuron ships `libneuronpjrt.so` (libneuronxla). Adding a platform is one `case`
arm in `scripts/platform/env.sh` + one `scripts/platform/expected/<backend>-<gpu>.txt` + a runbook.

1. Neuron DLAMI; pin `jax-neuronx` / `libneuronxla`. Mathlib cache; build only the trainer exes
   (8 vCPU / 32 GB — not the proof tree).
2. `neuron` arm in `env.sh`: detect via `neuron-ls`, plugin path, slug; check whether the shim
   needs `LEAN_MLIR_PJRT_PLATFORM`; two NeuronCores show up as two devices — pin one.
3. `scripts/platform/check.sh` vs XLA:CPU goldens — the real result. Watch `select_and_scatter`,
   depthwise, BN reductions.
4. `lake run imagenette` at short epochs: ms/step + neuronx-cc compile time per net; ViT-Ti vs R34
   is the comparison that matters.
5. PLATFORMS.md row + `deploy/TRAINIUM.md`, pass or dated xfail list.

Budget ~4–8 h ≈ $5–15; compile time across seven nets is the unknown. Only if conv numbers are sane
does a trn1.32xlarge (16 chips, 128 vCPU, ~$21.50/h) for ViT-S/B become worth pricing.

---

## 6. Proposal: flip Imagenette ConvNeXt / ViT to the exact GELU (reverses 2026-10-06 §5(a))

Motive: one GELU in the book instead of two (fewer concepts). 2026-10-06 kept Imagenette at tanh
(`planning/gelu_erf_and_torchvision_crop.md` §5(a)); the machinery since makes the flip cheap.

Already done: proofs (`GeluErf.lean`), the `erf` variant marker + driver (`VerifiedVariant.erfOn`,
`fwdStem`), `checkGeluWorld`, `pc_gelu_render`, `tests/TestVariantPredicates.lean`; `vit-fwd-b-tie`
and `convnext-fwd-b-tie` already run the exact form at Imagenette shapes chain to chain ("no
Imagenette artifact at it").

To do:
1. Exact twins of the Imagenette `convnext_*` / `vit_*` renders the chapters use; point the two
   Imagenette app mains at them; `geluExact` on in the two Imagenette JAX reference configs.
2. Tie gates' exact arm becomes against-committed-bytes.
3. Rerun both Imagenette pairs (ConvNeXt, ViT) — hours on one card each; re-measure ViT's
   bit-exact claim (§9.4).
4. Book: exact form becomes *the* GELU definition; tanh → one-line remark or Lean-only; drop the
   two-forms passage (~L11146–53) and the `geluForm` choice from prose; audit hits L11337–39 and
   L12040–44 disappear rather than being reworded.

Catch: the published ConvNeXt-T ImageNet pair is the pre-erf one-shot (tanh). Do this in the same
push as the official ConvNeXt-T rerun (`cnx-default-*`) so tanh leaves the chapters entirely.
