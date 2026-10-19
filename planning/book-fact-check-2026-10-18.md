# Book fact-check — `blueprint/src/content.tex` (2026-10-18, at e9e59edc)

22 agents fact-checked the whole book: 21 line-range slices plus one cross-cutting pass. They checked
`\lean{}` statements against the Lean source, every number against `runs/` and `jax/runs/`,
commands and paths against the repo, papers and baselines against the web, and the math by hand.
They only reported; the repo was not edited.

**Raw tally: 45 high · 177 medium · 341 low (~563 findings).** Some appear more than once, because
a systemic issue shows up in several slices. Those repeats are collapsed into the themes in §1. The
full per-slice reports, in book order, follow in §3. Each finding has a line number and says what
the book claims, what is actually true with evidence, and a suggested fix. Each slice also ends with
a "Checked and fine" coverage list.

Line numbers are relative to e9e59edc. Fix bottom-up in the file, or re-grep the quoted text.

---

## 1. Systemic themes (fix once, everywhere)

1. **Odd-kernel hypothesis dropped.** Several places say conv and depthwise backward "is the
   reversed-kernel conv, unconditionally / no hypotheses":
   3277–3281, 3995, 4013, 7671–7676, 7685, 8436–8439, 19414, and 103.
   - `IR.conv_back_bridge` and the depthwise ties all carry `hkH`/`hkW` oddness.
     `EvenKernelConvBack.lean` says the statement is *false* without it.
   - ConvNeXt's even 4×4 and 2×2 kernels go through `padOdd`, which the book never mentions.
   - The cited `conv_back_bridge_1to2` / `_2to2` no longer exist (3949, 3956, 19320); the current
     name is `conv_back_bridge`, general over odd kernels. The text "by expansion at the concrete
     shape" (3953, 19505) is also stale.
   *(slices 05, 10, 20, 22)*
2. **Proof sketches that describe deleted proofs.** About 14 `\leanok` sketches walk through
   sum / const / finset-sum / product / reindex. Commit 998f2c70 replaced all of them with
   `pdiv_of_affine` / `pdiv_of_linear`, and neither name appears anywhere in the book. The list is
   in slice 22: dense ×3, conv ×3, BN affine and centered, depthwise ×3, matmul ×2, patch embed,
   and scalarScale. Also: "every foundation rule fires exactly once" (1385), and a set of smaller
   lemma-name drifts (pdiv_comp, softmax, rowIndep, pdiv_gelu, istd).
   *(02, 05, 06, 14, 13, 22)*
3. **`MLIR: <operator>` listings come from legacy `IRPrint.lean`.** The book presents them as the
   emitted, denoted, bridged graph. IRPrint's own header says "the text is trusted … nothing
   imports this file". Its SSA names appear in no `verified_mlir/` file. Residual, depthwise,
   attention and layer-scale have no `Back` node or bridge at all. "Single printer" (19366) and
   "checks on the GPU" (1977) are wrong too.
   Affected listings: 1952, 2876–2927 (Dense), 3955, 5385, 6252, 8401, 9993, 11507, 13785, 19323.
   *(03, 04, 05, 07, 08, 15, 20, 22)*
4. **pdiv at a kink.** The book says pdiv takes "the standard / framework convention" at kinks
   (574–585, 2475, 2964, 3463). In fact pdiv = fderiv, which is 0 *everywhere* when any coordinate
   or any pool window is at a kink. The codegen convention differs there, and the Lean docstrings
   say so. *(01, 04, 05)*
5. **"BatchNorm" in the CIFAR chapter is per-example InstanceNorm-style.** It reduces over
   dims [2,3] only, `runningBN` is false, and there are no running stats. The chapter explains it
   as batch statistics and says stats are "threaded through bnChannels" (4085, 4999). Related: the
   five "same-seed" runs actually use seeds 1–5 (4847). *(06, 07)*
6. **Label-smoothing floor is wrong in three places** (6221, 6356, 8385).
   −0.9 log 0.9 − 0.1 log(0.1/9) = 0.545, not 0.485. The code uses ε/K, which gives 0.500, and that
   matches the observed 0.502. 15277 also states the wrong ε/(K−1) convention.
   *(08, 09, 10, 16)*
7. **Listings presented "as the run trained it" include post-run lines.**
   - `f32StemHead` appears in the MNv2, MNv4 and ConvNeXt references, so the classifier-head
     precision rows in the paths tables are wrong for MNv4.
   - MNv4 `dropDenom 26` (the run used 25).
   - `bnChannels :=` is shown as a spec field, but it is derived; the spec sets `runningBN`
     (R34, MNv2, B0).
   - ViT CLS/pos init kind is 2 vs 5.
   - EfficientNet's JAX listing.
   - `book_listings.py` reports 6 DRIFT listings and is not in CI.
   *(08, 10, 11, 12, 13, 15, 22)*
8. **Hand-maintained counts that are stale or contradict each other.**
   - Comparator: 88 vs 87 vs 35, while the configs actually hold 13 + 39 + 55 = 107.
   - AuditAxioms: "1,751" vs 1,950, quoted right after promising not to quote a number.
   - Theorem-budget Steps column: Ch1–4 are missing their `*_loss_grad` certificates.
   - Bestiary: 45 vs 46/47. Demo groups: eleven vs twelve. ViT theorem counts: 37/16/21 vs 40/13/27.
   - Tier wall-clocks: CIFAR is ~19 min measured, not ~5 min.
   - README.md quotes ViT-Tiny 72.42 and MNv4 76.68; the book says 71.61 and 77.35.
   *(01, 14, 20, 22)*
9. **Visible bold `[TODO: …]` markers in the rendered book.** At least 7 of them: 7361, 7378,
   8730, 9228, 10399, 11800–11837, 12068, 14325. There are also dated process notes, the Colophon
   skeleton, a leftover `% TODO Phase 4`, and the orphaned line-8 comment plus unused macros.
10. **Statements over ℝ, one example, one replica, read as being about the trained artifact.**
    - The `*_fold` theorems are B=1 and drop "single example".
    - "the gradient this trainer computes is a theorem" ignores float32.
    - The DP all-reduce is a trusted carve-out.
    - Descent theorems cover one parameter group with the others fixed, and the CIFAR one covers
      only the no-BN net.
    - "The one open gap is ℝ vs float" (2283).
    - Float budgets are claimed "for every summation order" and "every operator"; in fact they
      cover the left fold only, the tree bound file was deleted, and there are no GELU/LN/attention
      budgets.
    - `e_exp` is said to be "measured by the margin probe"; it is assumed.
    *(03, 04, 06, 07, 14, 20)*

## 2. Overclaims — fix before anyone reads the results again

Ranked roughly by how much a reader would wrongly believe.

1. **App. B 19629/19636.** The JAX-pipeline VJP oracles are said to check the "Lean-proved
   backward" and "the proven text". They actually check the unverified run-time `MlirCodegen`
   path (VjpOracleNets.lean:8-14).
2. **Conv/depthwise "unconditional".** See theme 1.
3. **MLIR listings "the emitted, bridged graph".** See theme 3.
4. **14108ff / 13256–13312, ViT.** "ViT-Tiny/Base/Large are instances" of a *weight-tied,
   scalar-LN* tower, and "the full ViT backbone". The real per-block theorem is a separate
   `vitForwardKV` fold. The ladder "each step composes the previous" breaks. The Recap's "proved at
   every depth (vitTinyHasVJP_correct)" cites a fixed-depth theorem.
5. **CIFAR "BatchNorm".** See theme 5.
6. **10633–10666, ConvNeXt.** It says the paper concluded the gap "was mostly the training recipe…
   architecture was never the variable". The paper has the recipe at +2.7 and the architecture at
   +3.2.
7. **Ch 5 R34 "matched pair".** It says "same data loader … the only difference is who wrote the
   StableHLO". In fact the verified run used TF `sample_distorted_bounding_box` and the reference
   used torchvision RRC (6603).
8. **MNv4 side quest.** The pair is said to be "the full recipe … everything exercised". It ran
   /25 with no crop fallback, the head row is wrong, and `lake run mnv4-full-e100-4gpu` doesn't
   exist (8940, 9171, 9200).
9. **Data availability 19956.** "Every top-1 follows timm's RSB protocol" is false for MNv2,
   EfficientNet and MNv4, which use their papers' crop-then-resize.
10. **VisDrone 15585 / tab:visdrone_results.** "+54% over the PyTorch replica … isolates
    implementation quality" mixes decodes and recipes. At a matched recipe the stack ties the
    replica (0.1526 vs 0.1532). The table rows mix argmax and multilabel decodes.
11. **GW 17575.** "Each network is best on the noise it trained on" is false: the real-trained net
    wins on both. "The filter sits on its closed form" (17543) is false for the search statistic.
12. **App. B float tier.** The margin probe measuring `e_exp`, "every summation association", and
    "FloatBridge budgets every operator" (theme 10). Also "the entire MLP / CNN descends in float".
13. **Ch 1–2 Recaps.** "the whole chain closes", "the one open gap is ℝ", "two witnesses" (2297,
    2283, 2972). Both witnesses are reduced or uncertified nets, and neither is in the chapter.
14. **Ch 7 "MobileNetV2 with two changes / the lift is SE + Swish".** B0 is a NAS net with
    different widths, depths and 5×5 kernels. The SE MLP accounts for 0.64M of the 1.78M gap.
15. **Ch 6 7499 "never recurs".** The val-accuracy dip recurs at epochs 10, 12, 22 and 25 at full
    learning rate. Ch 7 has the same claim.
16. **Ch 4 4054–4063.** "exists and is bounded" and "needs ε>0 to stay bounded". No bound is
    proved; ε>0 is shown sufficient, not necessary. "machinery none of the previous chapters
    needed".
17. **Ch 5 5726.** "the gradient floor that makes ResNets trainable". The Lean docstring says no
    lower bound is claimed. The degradation is also attributed to gradient flow, which He et al.
    explicitly rule out.
18. **Smaller "exactly/every/only" claims.** "Twenty-five constructors exist only for the bestiary"
    (three don't); "no training runs" (the bestiary has demos); Pong "against its exact solution";
    Swin "exactly" 28.6M vs 28M; "ImageNet wants 16 GB cards" (most runs used 12 GB 3060s); and
    others. These are in the slices.

## 3. Highest-value single fixes (high severity, not covered by a theme)

- **3033/3035.** CNN transcript compile times 2566/210 ms; the log says 2700/402.
- **6986.** Reference A3−2018 delta +0.99; it is +0.85.
- **9311–9346.** The EfficientNet transcript is spliced from two runs, and the cited directory holds
  the other run. Also 9945: +0.71 should be +0.79.
- **829–835, Fig 1.1 caption.** "ViT-Tiny alone reaches Ch 9, longest by 2×": ConvNeXt has 71 vs
  ViT's 64. "This chapter's row is the only one every column crosses" is also false.
- **15043, Bestiary.** ResNet-34 "21.3M (paper 21.8M)": 21.3M is the 10-class net; at 1000
  classes it is exactly 21.8M.
- **17808/17815, NQS.** The mean-field Var(E_loc) is printed as 0; the true values are 0.75 and 4.0.
- **18563, 18432, Deep CFR.** "its Leduc experiments": the paper has none. "No exact best response
  in FHP": the paper reports 37 mbb/g.
- **8660.** A two-run difference is compared against one run's Wilson half-width (√2 missing).
  1.2 / 796 has the same pattern.
- **19983.** "runs in 168" is missing its unit. **download_visdrone.sh:62** calls a moved script,
  so the fetch path the book describes is broken.

## 4. Gate gaps (from slice 22)

CI checks `\lean` names, `\uses` and floats. It does not check:
- listings (`book_listings.py` is not in CI and currently reports 6 drifts);
- Lean names in prose `\texttt` (this is how `conv_back_bridge_1to2` survived);
- the hand-maintained counts (budget table, comparator, AuditAxioms, README/TRUST/PLATFORMS numbers);
- log excerpts (`verify_excerpt.py` is manual only).

Adding the first two to CI, and generating the counts, would stop most of theme 8 from recurring.

---

## Per-slice reports

| # | lines | scope |
|---|---|---|
| 01 | 1–723 | preamble, Intro, How organized, Foundations |
| 02 | 724–1726 | Ch1 run, how it works, theorems |
| 03 | 1727–2307 | Ch1 example, MLIR, .train, Recap |
| 04 | 2308–2984 | Ch2 MLP |
| 05 | 2985–4032 | Ch3 CNN |
| 06 | 4033–4789 | Ch4 BN theory |
| 07 | 4790–5469 | Ch4 CIFAR experiments |
| 08 | 5470–6296 | Ch5 R34 theorems / Imagenette |
| 09 | 6297–7389 | Ch5 recipe, ablation, ImageNet, RSB |
| 10 | 7390–8443 | Ch6 MNv2 |
| 11 | 8444–9267 | Ch6 ImageNet, MNv4 |
| 12 | 9268–10614 | Ch7 EfficientNet |
| 13 | 10615–12093 | Ch8 ConvNeXt |
| 14 | 12094–13517 | Ch9 ViT theorems |
| 15 | 13518–14371 | Ch9 ViT runs |
| 16 | 14372–15505 | Bestiary primitives → Swin |
| 17 | 15506–16568 | Bestiary detection / inspection / people / agri / RS / BraTS / seg |
| 18 | 16569–17693 | Bestiary NLP / generative / physics / GW |
| 19 | 17694–18745 | Bestiary NQS / CASP16 / games |
| 20 | 18746–19856 | App A Getting started, App B On Verification |
| 21 | 19857–20543 | App C Data availability, Ack, Colophon |
| 22 | whole book | cross-cutting |


---

## Slice 01

I couldn't write /tmp/claude-1000/-home-skoonce-lean-lean4-mlir-worker/72b5c474-dbba-4182-a591-530e6f22d959/scratchpad/findings-01.md because the harness refuses report files from subagents. The full findings are below; if a file is needed, save this text there.

**Counts:** 26 findings: high 1, medium 9, low 16.

**Top three:**
1. **l.574-585, high:** the kink convention is described wrongly. `pdiv` is `fderiv` by definition, so at a kink it takes Mathlib's default of 0. For ReLU that zeroes the whole vector's gradient. The codegen uses a different value there (relu'(0)=0, first tied cell), so "the same convention" is false. The Lean docstrings at MLP.lean:205-223 and CNN.lean:780-787 say it differs at the kinks.
2. **l.106-108, medium:** BN and LayerNorm Jacobians are a diagonal plus a rank-2 correction, not rank-1. The book's own three-term formula shows two correction terms.
3. **l.323-335, medium:** stale or wrong front-matter facts:
   - "Forty-five" bestiary architectures: there are now 46 files and 47 entries, since DeepCFR was added on 10-08.
   - "eleven" demo groups: there are twelve, since Structure/CASP16 was added.
   - Pong is not "against its exact solution".
   - Appendix B is "On Verification", not "the complete proof framework".

# Findings 01: content.tex 1–723 (preamble, Introduction, How this book is organized, Foundations) + print.tex / web.tex / macros

### content.tex:574-585: the kink convention is described wrongly
**Kind:** statement-mismatch. **Severity:** high
**Says:** "Wherever $f$ is smooth, pdiv agrees with fderiv, and that agreement is proved. At the non-smooth points pdiv takes the standard convention by definition." … "The codegen then substitutes the same subgradient and argmax convention every framework already uses. The benefit isn't a different numerical result." Also l.559-560: "Mathlib's fderiv correctly declines to return a value at these points".
**Actually:**
- `pdiv f x i j := fderiv ℝ f x (basisVec i) j` (Foundation/Tensor.lean:101-103). It is fderiv everywhere by definition, so the smooth-point agreement needs no proof. At a non-differentiable point fderiv returns its default, 0.
- **ReLU:** `relu n` is not differentiable at any x where some coordinate is 0. So the whole Jacobian is 0 there, and the canonical backward zeroes every coordinate's gradient. MLP.lean:205-223 says the codegen "emits the standard subgradient formula … agrees … at smooth points and differs at the kinks."
- **maxPool:** CNN.lean:780-787 says the canonical witness is 0 at a tie, "where the render routes the cotangent to the first tied cell". It adds that the generic `MlirCodegen` walk "routes the cotangent to every tied cell". Chapter 3 says the same at l.3463-3466.

**Fix:** Say that fderiv returns 0 at a kink, so the pdiv-derived backward is 0 there for the whole vector. Say the codegen emits the framework convention instead. Agreement off the kink is proved (`relu_codegen_matches_canonical`, `maxPool2_codegen_matches_canonical`); the kink itself is the codegen trust boundary. Replace "declines to return a value".

### content.tex:576-579: the depthwise input VJP is not pdiv-derived with an `rfl` proof
**Kind:** statement-mismatch. **Severity:** medium
**Says:** "ReLU, maxPool and the depthwise input VJP each get a HasVJP whose backward is built from pdiv and whose correct is rfl."
**Actually:**
- `depthwiseHasVJP3` (Architectures/Depthwise.lean:139) has a closed-form backward and a real multi-step proof. Depthwise conv is affine, so it has no kink.
- The canonical `rfl` witnesses are `reluHasVJP` (MLP.lean:224), `mlpHasVJP` (MLP.lean:324) and `maxPool2HasVJP3` (CNN.lean:788).

**Fix:** "ReLU, maxPool and the MLP composition".

### content.tex:667-674: the codegen does not "read off the backward field"
**Kind:** overclaim. **Severity:** medium
**Says:** "codegen reads off the backward field and emits a single fused StableHLO kernel".
**Actually:**
- `.backward` is a noncomputable function over ℝ, so it cannot be printed.
- The emitters render a separate IR (`Back`/`Hlo`/`SHlo`). Bridge and tie theorems prove that IR's denotation equals `.backward`, and the printer is trusted (Codegen/IRPrint.lean:12-28).
- The book's own "step certificate" definition at l.354-358 describes exactly this tie.
- "Single fused kernel" is also loose. Fusion is XLA's job, and Ch1 at l.2233 says so.

**Fix:** "emits a StableHLO graph for the closed form, and a theorem ties its denotation to backward".

### content.tex:106-108: BN/LN is a rank-2 correction to the diagonal, not rank-1
**Kind:** math. **Severity:** medium
**Says:** "Softmax, batch norm, and layer norm … each one is a diagonal plus a rank-1 outer product."
**Actually:** Softmax, diag(p) − ppᵀ, is rank-1. BN/LN is (istd/n)(nI − 11ᵀ − x̂x̂ᵀ), which is rank-2. The book's own three-term formula at l.4245 has two correction terms.
**Fix:** "low-rank (rank-1 for softmax, rank-2 for the norms)". Grep the rest of the book for the "rank-1" wording.

### content.tex:323-330: stale bestiary counts
**Kind:** stale. **Severity:** medium
**Says:** "Forty-five further architectures … eleven of the groups carry a demo".
**Actually:**
- There are 46 `Bestiary/*.lean` files and 47 `\subsubsection*` entries (Inception.lean holds two).
- 45 was checked in a0ee11c6 (09-29), and DeepCFR.lean was added in f1b85f65 (10-08).
- There are 12 "--- demo:" subsections. Structure/CASP16 was added after "eleven" was written in 086beab0.
- The example list of groups omits several groups that carry demos: inspection, people, agriculture, remote sensing, quantum, structure.

**Fix:** forty-six (or 47, whichever unit is meant); twelve.

### content.tex:331: Pong is not trained against an exact solution
**Kind:** overclaim. **Severity:** medium
**Says:** "trains three games --- Pong, Leduc poker, tic-tac-toe --- against their exact solutions".
**Actually:** The section intro (l.18230-18234) says the ceiling is exact "where the game allows it". For Pong the comparison is a twin fed the six-number state, and the table is "against the scripted opponent".
**Fix:** "scored against exact solutions where they exist and, for Pong, against a state-fed twin".

### content.tex:334-335: wrong description of Appendix B
**Kind:** wrong-ref. **Severity:** medium
**Says:** "the complete proof framework as a reference (B)".
**Actually:** Appendix B is `\chapter{On Verification}` (app:verification, l.19169). The appendices are Getting started, On Verification, Data availability (commit 187a2da8). Line 397 of this same chapter describes B correctly.
**Fix:** "how the claims are verified (B)".

### content.tex:114-124 and 212-215: "There is no ninth" conflicts with Part 2
**Kind:** overclaim/inconsistency. **Severity:** medium
**Says:** Every bestiary architecture decomposes into the eight rules and tricks; "There is no ninth"; "kept working without needing new primitives". Line 212: "Each one adds exactly one new structural primitive".
**Actually:**
- Line 326-327 says bestiary entries need up to three new primitives.
- l.14531 says 25 `Layer` constructors exist only for the bestiary.
- The bestiary intro (l.14402) says "no training runs, no VJP commitments", so the decomposition is unproved.
- The table contradicts "exactly one": Ch3 adds conv and maxPool; Ch8 adds GELU, LN, layer-scale and patchify; Ch1 adds dense and softmax-CE.

**Fix:** Say there are no new rules or tricks but there are new bundled constructors, whose VJPs are argued, not proved. Soften "exactly one".

### content.tex:601-608 and 650-651: Jacobian indices are transposed relative to pdiv
**Kind:** math. **Severity:** medium
**Says:** "For f: ℝⁿ→ℝᵐ, that's the m×n matrix … J_{i,j} = pdiv f x i j … J_h = J_g·J_f".
**Actually:**
- In `pdiv`, i indexes the input and j the output. So [pdiv f x i j] is n×m, the transpose of the standard Jacobian, and the chain-rule order would flip.
- The HasVJP bullet (dy ∈ ℝⁿ → ℝᵐ) uses Lean's `Vec m → Vec n` convention, while the section set up f: ℝⁿ→ℝᵐ.

**Fix:** Write J_{j,i} = pdiv f x i j, and use one m/n convention in the section.

### content.tex:363-387: step counts for Ch 1-4 break the stated rule (lead)
**Kind:** inconsistency. **Severity:** medium
**Says:** The stated rule counts "a gradient node is the loss's derivative" as a step certificate. The table gives Ch1-3 two steps each, Ch4 five, total 37.
**Actually:**
- Ch5-9 count gradient-node theorems; Ch1-4 omit theirs.
- Ch1 `LinFold.linear_net_lossGrad`, Ch2 `MlpFold.mlp_net_lossGrad`, Ch3 `CnnFold.cnn_net_lossGrad`, and Ch4 `CifarFold.cifar_net_lossGrad`, `Cifar8TieG/BnTieG` lossGrad and tiedG (l.4708-4724).
- By the stated rule that gives ≥41, not 37. The table likely predates 5b639217 (09-28), which added the loss-grad blocks.
- Contract counts are also hard to reproduce: Ch3's conv input, weight and bias, maxPool and the whole net are separate records.
- No script gates this table.

**Fix:** Recount with the stated rule, or restate the rule. Keep Appendix B's "44 / 37" in sync.

### content.tex:587-590: Chapter 1 has no ReLU or maxPool
**Kind:** inconsistency. **Severity:** low
**Says:** "invoked by ReLU, by maxPool and by ReLU6, which is to say by Chapters 1--6".
**Actually:** Chapter 1 has no ReLU or maxPool; `pdiv_relu` first appears in Ch2.
**Fix:** "Chapters 2--6".

### content.tex:624-626: "Read this right-to-left" contradicts the procedure
**Kind:** math. **Severity:** low
**Says:** "Read this right-to-left. Start with one m-dimensional vector. Multiply on the right by J_L…"
**Actually:** Starting at the left vector and multiplying by J_L is left-to-right evaluation. It is right-to-left only in the network's layer order.
**Fix:** "Evaluate left to right, which walks the network from last layer to first."

### content.tex:611: FLOP count off by 2×
**Kind:** wrong-number. **Severity:** low
**Says:** "~1.3×10⁸ flops".
**Actually:** 512³ = 1.34e8 multiply-adds, which is about 2.7e8 FLOPs.
**Fix:** Say "multiply-adds", or give 2.7e8.

### content.tex:423-424: "Adds one theorem on top of CNN+BN" (ResNet target)
**Kind:** inconsistency. **Severity:** low
**Actually:** The table row lists 9 contracts, 3 witnesses and 7 steps, and Ch5 has 12 theorem blocks: residual(+proj), GAP, stride-2 conv, stem pool, etc.
**Fix:** "Adds the residual VJP (plus GAP, stride-2 conv, stem pool)".

### content.tex:429-431: reading list starts at Ch 2
**Kind:** inconsistency. **Severity:** low
**Says:** "Ch~2--5 is a complete reading list".
**Actually:** l.409 says every target reads Ch1, and l.423 lists Ch~1--5.
**Fix:** "Ch~1--5".

### content.tex:453: "(it's short)"
**Kind:** inconsistency. **Severity:** low
**Actually:** l.297 calls Ch1 "the book's densest chapter". At 1,584 source lines it is longer than Ch2, Ch3, Ch4, Ch7 and Ch8.
**Fix:** Drop "(it's short)".

### content.tex:414-416: MLP target's dependencies
**Kind:** statement-mismatch. **Severity:** low
**Says:** "uses chain rule, additive fan-in, identity, and the Dense Jacobians, all of them Chapter 1's".
**Actually:** thm:mlpHasVJPAt uses `\uses{ax:pdiv, ax:pdiv_comp, ax:pdiv_relu, def:hasvjp, thm:denseHasVJP}`. There is no fan-in or identity, and the ReLU Jacobian is Ch2's.
**Fix:** List the chain rule and dense VJP from Ch1, plus Ch2's ReLU Jacobian.

### content.tex:419-421: "proved from this chapter's foundation"
**Kind:** typo. **Severity:** low
**Actually:** "This chapter" here is the organization chapter, not Chapter 1.
**Fix:** "from Chapter 1's foundation rules".

### content.tex:405-407: not every block carries `\uses{}`
**Kind:** overclaim. **Severity:** low
**Says:** "Every theorem and definition in the book carries a \uses{} annotation".
**Actually:** 32 of 169 blocks have none:
- the Part-1 roots (ax:pdiv, conv2d, maxPool2, depthwiseConv2d, geluScalar, geluErfScalar);
- 3 theorems: ax:bnIstdBroadcast_differentiable, ax:patchEmbedFlat_differentiable, ax:rowSoftmax_flat_differentiable;
- the 23 bestiary `layer:*` definitions.

**Fix:** Qualify the sentence, or add `\uses` to the 3 theorems.

### content.tex:719-720: "compiles it to one GPU kernel"
**Kind:** overclaim. **Severity:** low
**Actually:** Ch1 (l.2239-2245) says one compiled function and a single dispatch of a 27-op graph. XLA typically emits several kernels.
**Fix:** "one GPU dispatch".

### content.tex:549-551 and table row l.385: the axiom exemplar is the weight-tied ViT (lead)
**Kind:** lead. **Severity:** low
**Actually:**
- `vitFullHasVJP` is "a weight-tied ViT" with scalar γ/β LayerNorms (Attention.lean:2179-2224).
- ViT-Tiny's certificate is the untied tower, thm:vitTinyHasVJP_correct (l.13075-13081, 14333).
- The axiom claim itself is true: it is in tests/AuditAxioms.lean:302, and there is no sorry or axiom anywhere in the repo.
- Row 9's "every depth k (ViT-Tiny is k = 12), vitFull" blurs the same distinction.

**Fix:** Cite the ViT-Tiny certificate, or say "weight-tied".

### content.tex:253-254: DAWNBench "won"
**Kind:** external-fact. **Severity:** low
**Actually:**
- The fast.ai post "Training Imagenet in 3 hours for USD 25; and CIFAR10 for USD 0.26" (fast.ai/posts/2018-04-30-dawnbench-fastai.html) names Koonce for the CIFAR-10 hyperparameters.
- CIFAR-10 was won outright.
- The ImageNet wins were qualified: fastest on public infrastructure, on GPUs, and on a single machine. Officially fast.ai placed third on cost and fourth on time (insidehpc 2018-05).

**Fix:** Qualify "won", e.g. "won CIFAR-10 outright and trained ImageNet in 3 h for $25".

### content.tex:491-494: first book's single SGD recipe
**Kind:** external-fact. **Severity:** low
**Says:** One recipe, SGD(0.002, momentum 0.9), held constant across architectures.
**Actually:** In the Apress repo that recipe covers VGG, ResNet-34/50, MobileNetV1/2/3 and EfficientNet. MNIST and CIFAR use SGD lr 0.1 with no momentum. SqueezeNet uses 0.0001, with Adam and RMSProp variants.
**Fix:** "its ImageNet-scale networks".

### content.tex:8: orphaned comment
**Kind:** stale. **Severity:** low
**Actually:** "% The one marker every BatchNorm pair carries until its sync-BN re-run lands." has no macro after it.
**Fix:** Delete it.

### content.tex:22-31: unused side-quest macros
**Kind:** stale. **Severity:** low
**Actually:**
- `\sqstatus` and `\evalckptnote` are defined but never used, so the comment that the size sections "close with these two" is false.
- "MobileNetV4's has run once … the rest will run eventually" is dated status prose.
- Related, outside my slice: a visible "[TODO: … neither has run]" in the published text at l.~14325.

**Fix:** Remove the macros and comment, or use them.

### content.tex:1-6: header comment
**Kind:** stale. **Severity:** low
**Says:** "Every axiom, definition, and theorem in the suite is annotated below".
**Actually:** The suite has no axioms. The audit covers 1,751 declarations, against 169 blocks in the book.
**Fix:** "The headline definitions and theorems …".

### print.tex:57-59: "in a 100-section book"
**Kind:** wrong-number. **Severity:** low
**Actually:** content.tex has 71 numbered `\section`s.
**Fix:** "70-section", or drop the number.

### content.tex:45-46: "MLIR was a research project" (lead)
**Kind:** lead. **Severity:** low
**Actually:** MLIR was upstreamed into LLVM in Dec 2019 and was used in TensorFlow by 2020.
**Fix:** e.g. "had only just landed in LLVM".

### Cross-slice note, outside my range
l.19269 says comparator "runs 88 theorems" while l.19285-19287 say "The 87". The a0ee11c6 commit message says 87.

## Checked and fine
- The `HasVJP` verbatim block matches Tensor.lean:279-282 exactly; the `dense` snippet matches MLP.lean:25-26; the pdiv formulas at l.343, 534 and 653 match the Lean.
- No sorry, admit or axiom in LeanMlir/ or Bestiary/. `vitFullHasVJP` is in the AuditAxioms list.
- Mathlib FDeriv/Basic is ©2019 Avigad (authors Avigad, Gouëzel, Kudryashov); ContDiff is ©2019 Gouëzel. arXiv:2509.04922 is Gouëzel, "Higher order differential calculus in mathlib", Sept 2025.
- ViT appeared on arXiv in October 2020. The first book is the Apress S4TF title (2021). Lean 4 v4.0.0 came out in 2023. The PJRT C API, XLA under JAX/TF, and the IREE second runtime are all correct.
- `lake run mnist`, `cifar`, `imagenette` and `imagenet` all exist (lakefile.lean:2218, 2232, 2253, 2435).
- The budget table's columns sum to 44, 9 and 37, with a total of 90 (arithmetic only).
- Chapter titles and order are correct, and every ref in the slice resolves to what the prose says (fig:spines, sec:matrix_machinery in Ch9, sec:mlp_inside_train, sec:mlir_training_step, app:verification).
- "First three of twenty-seven operations" matches Ch1 (l.2239, 2277), and the five-line loop has five lines.
- Ch7 is the first fold over every input. There is no max-pool after Ch5.
- Bestiary primitive counts: at most three; VGG and AlphaZero need zero, Mamba one. The intro's bestiary name list is all present.
- ResNet-34 at about 90% on Imagenette (89.99 ± 0.32). The recipe is ablated in Ch5. ViT-Tiny was trained on ImageNet on 4× RTX 3060.
- The depgraph legend's "eight or more" matches HUB = 8, and every chapter's theorems section has its depgraph input.
- Title and "Version 0.7.2" match README and CHANGELOG. book_floats.py exists.
- PyTorch and JAX relu'(0)=0 and first-index max-pool tie-breaking are consistent with the book. This is from library knowledge; I did not run either library.

Tally: 26 findings: high 1, medium 9, low 16.

---

## Slice 02

I could not write findings-02.md. The Write tool refused it ("Subagents should return findings as text, not write report files"), so the full findings file is inlined below for you to save at /tmp/claude-1000/-home-skoonce-lean-lean4-mlir-worker/72b5c474-dbba-4182-a591-530e6f22d959/scratchpad/findings-02.md.

**Counts:** 3 high, 7 medium, 13 low (23 findings).

**Top 3:**
1. **l. 829-831:** the Fig 1.1 caption says "ViT-Tiny alone reaches Ch 9" and "its chain is the longest by a factor of two". spines.tex shows ConvNeXt with 21 Ch 9 statements and 71 total against ViT's 64. It was never 2× (53 vs 35 when written).
2. **l. 834-835:** "this chapter's row is the only one every column crosses" is false. The Ch 4 and §9.2 rows are also crossed by all five columns, and the caption says so itself.
3. **l. 850 vs the dense, bias and finset proofs:** the claim "each step mirrors one tactic block" is stale. pdiv_dense, pdiv_dense_W and pdiv_dense_b now go through `pdiv_of_affine` (998f2c70), which content.tex never mentions. pdiv_finset_sum is `fderiv_fun_sum` with no induction.

---

# Findings 02: content.tex 724–1726 (Ch 1 MNIST linear: Run it first, How it works, The theorems)

Plus `figures/depgraph/spines.tex` and `figures/depgraph/ch1.tex`.

### content.tex:829-831 — Fig 1.1 caption: "ViT-Tiny alone reaches Ch 9" and "longest by a factor of two" are both false per the figure
**Kind:** inconsistency
**Severity:** high
**Says:** "ViT-Tiny alone reaches Chapter~\ref{chap:attention}'s attention proofs, and its chain is the longest in the book by a factor of two."
**Actually:** spines.tex (regenerated today in 5429b4f9) puts a **21** circle in the ConvNeXt-T column on the "Ch 9 Vision Transformer" row (`at (358.1pt,7.5pt) {21}`). The totals are ConvNeXt-T **71** statements and ViT-Tiny **64**, so ViT is not the longest. It was never 2× longer: at 875d3335, when the caption was written, the counts were ViT 53 vs ConvNeXt 35 (1.5×), and just before today's regen they were 54 vs 37. The ConvNeXt column already had a {1} on the Ch 9 row before today.
**Fix:** "ConvNeXt-T and ViT-Tiny both reach Chapter 9; ConvNeXt-T's chain is the longest (71), ViT-Tiny's next (64)." Consider having scripts/book/blueprint_depgraph_tikz.py gate these caption claims.

### content.tex:834-835 — "this chapter's row is the only one every column crosses" is false
**Kind:** inconsistency
**Severity:** high
**Says:** "this chapter's row is the only one every column crosses."
**Actually:** spines.tex has circles in all five columns on the Ch 4 row (7, 7, 7, 7, 7 at y=98.1) and on the §9.2 row (3, 3, 3, 14, 14 at y=22.6). The caption (l. 825-827) itself says all five reach Ch 4 and §9.2.
**Fix:** "this chapter's row, Chapter 4's and §9.2's are the three every column crosses". Or drop the clause.

### content.tex:848-853, 1044-1077, 1373-1525 — structured proofs describe Lean proofs that no longer exist
**Kind:** stale
**Severity:** high
**Says:** (l. 850) "Each step mirrors one tactic block of the corresponding Lean proof, so the informal argument can be audited against the formal one step by step." The proofs of pdiv_dense and pdiv_dense_W (sum rule, finite-sum rule, product rule, reindex, Finset.sum_ite_eq), denseBiasGrad step 1 ("sum rule, constant rule, identity Jacobian… pdiv_dense_b") and pdiv_finset_sum ("induction on S… Finset.induction_on… Finset.sum_insert") all describe that older route.
**Actually:**
- MLP.lean:31-40 (pdiv_dense), :43-55 (pdiv_dense_W) and :105-110 (pdiv_dense_b) are each one `rw [show … from rfl, pdiv_of_affine …]` followed by simp. None uses pdiv_add, pdiv_const, pdiv_finset_sum, pdiv_mul, pdiv_reindex or pdiv_id. This dates from commit 998f2c70.
- Tensor.lean:230-238 (pdiv_finset_sum) is `rw [… fderiv_fun_sum hdiff]; simp`. It has no induction (commit 306f9d5c).
- `pdiv_of_affine` (Tensor.lean:262) appears nowhere in content.tex.
**Fix:** Either rewrite these proofs to the pdiv_of_affine route and add a block for pdiv_of_affine with \uses, or drop the "mirrors one tactic block" promise for them.

### content.tex:1385-1386 — "Every foundation rule from Chapter 1 except the chain rule fires exactly once"
**Kind:** inconsistency
**Severity:** medium
**Says:** as quoted.
**Actually:** In the book's own steps, pdiv_const fires twice (steps 1 and 3) and pdiv_id never fires. In Lean none of them fires. The sentence is also inside Chapter 1, so "from Chapter~1" is a self-reference.
**Fix:** Delete the sentence or replace it with the pdiv_of_affine account.

### content.tex:1306-1325 — HasGradAt.comp/.param stated without their differentiability hypotheses
**Kind:** overclaim
**Severity:** medium
**Says:** "If G has gradient dy at f(x) and f has a VJP at x, then G∘f has gradient backward x dy at x". The `.param` reading is stated the same way.
**Actually:** ParamGrad.lean:79-81 (HasGradAt.comp) also needs `hf : DifferentiableAt ℝ f x`, and it takes a HasVJPAt. :120-122 (`.param`) needs `hl : DifferentiableAt ℝ layer θ`. `param_batchMap` needs `hper`. A VJP witness does not imply differentiability, because HasVJP.canonical exists for every f, as l. 1100 says.
**Fix:** "…and f is differentiable at x with a VJP there…". Likewise "an op differentiable in θ".

### content.tex:1633-1650 — linear_fold stated about the emitted .mlir without "single example"
**Kind:** overclaim
**Severity:** medium
**Says:** "\Prove{} the two update operations of §…'s linear_train_step.mlir … denote … the emitted step is the certified gradient step".
**Actually:** The LinearFold.lean header says: "certifies that renderer for a single example x… The committed module batch-contracts over B examples, which this file does not state". The tie from committed bytes to linTrainStepText "is enforced in CI…, not here". The book discloses N=1 only at l. 2269-2271.
**Fix:** Add "for a single example (N=1); the batch sum and α/N are the render's", and say that the file-to-renderer tie is a CI check.

### content.tex:1698-1720 — binary32 descent: "η … rather than an assumption" understates what is still assumed
**Kind:** overclaim
**Severity:** medium
**Says:** "The same holds with the binary32 gradient in place of g, its η the rounding budget of §precision rather than an assumption."
**Actually:** SgdDescent/Linear.lean:332-342 (linear_float_sgd_descends) still assumes:
- hδ, the float vs. real logit drift, which the file calls "the FloatModel → kernel trust boundary";
- hfexp and heexp (exp accuracy);
- hρ1;
- the small-step and dominance conditions at the float η.

η is computed from those assumed δ and eexp. The update itself is "taken in ℝ — only the gradient is float-modelled". The theorem covers one example, with weights only and the bias fixed.
**Fix:** "…its η computed from the binary32 rounding model (given bounds on exp error and logit drift), the update itself still in ℝ."

### content.tex:799-807 — "Trained five times over": the artifact is thirty runs
**Kind:** wrong-number
**Severity:** medium
**Says:** "Trained five times over, the linear model finishes at 92.10% every time… a single image at epochs 3 and 9".
**Actually:** runs/2026-09-01-mnist-n30/linear_s1..s30.log hold **30** runs, and no five-run linear artifact exists. At epochs 3 and 9, 22 runs give 9123/9199 and 8 give 9124/9198. All 30 end at 9210, so the qualitative claim holds. The trainer (Train.lean:3239ff) also does not shuffle: batches come in file order and there is no seed anywhere.
**Fix:** "Trained thirty times over (runs/2026-09-01-mnist-n30/)…". Optionally add that the batch order is fixed too.

### content.tex:744-751 — "Four commands" omits the required PJRT plugin/venv
**Kind:** command/path
**Severity:** medium
**Says:** "Four commands and about three seconds of GPU time".
**Actually:** ffi/pjrt_ffi.c:518-541 dlopens $PJRT_PLUGIN or `.venv/lib/python3.12/site-packages/jax_plugins/xla_cuda12/xla_cuda_plugin.so` etc. Otherwise it exits with "no PJRT plugin found". None of the four commands creates it. Nothing before l. 724 mentions a venv, plugin or Getting started, and the first pointer to app:getting_started is l. 2144.
**Fix:** Add "(with the toolchain and JAX CUDA PJRT plugin from Appendix~\ref{app:getting_started})".

### content.tex:791-792 — LeCun 1998's linear classifier was ~88%, not ~92%
**Kind:** external-fact
**Severity:** medium
**Says:** "LeCun's original 1998 benchmark put a comparable model at around 92%."
**Actually:** The LeCun et al. 1998 results table (yann.lecun.com/exdb/mnist) lists "linear classifier (1-layer NN)" at 12.0% error, i.e. 88%. Only the deskewed variant (8.4%) and the pairwise linear classifier (7.6%) are near 92%. This is from memory; I did not re-fetch the table.
**Fix:** "a plain linear classifier at 88% (about 92% with deskewing)", or cite the pairwise/deskewed row.

### content.tex:727-743 — "foundation here" includes HasVJPMat and HasVJP3, which are defined elsewhere
**Kind:** inconsistency
**Severity:** low
**Says:** "built by composing the foundation here. That foundation is … (HasVJP, HasVJPMat, HasVJP3, one per tensor rank) … we build all of it here".
**Actually:** Only HasVJP is defined in this chapter. HasVJP3 is at l. 3257 (Ch 3) and HasVJPMat at l. 12341 (§9.2).
**Fix:** Name where the rank-2 and rank-3 records live.

### content.tex:1302-1304 — HasGradAt is not only for "the ImageNet chapters"
**Kind:** inconsistency
**Severity:** low
**Says:** "used by the ImageNet chapters' loss-gradient theorems".
**Actually:** It is \uses'd by thm:linear_loss_grad (this chapter, l. 1666), and by mlp (2550), cnn (3536), cifar (4617, 4735) and every later chapter.
**Fix:** "used by every chapter's loss-gradient theorem, starting with this one's".

### content.tex:1327-1331 — proof sketch swaps inner and outer
**Kind:** math
**Severity:** low
**Says:** "…then the gradient hypothesis for the inner factor."
**Actually:** hG is about the outer function G. The inner f contributes `vf.correct` (ParamGrad.lean:85).
**Fix:** "…the VJP's correctness for the inner factor and the gradient hypothesis for the outer one."

### content.tex:1688-1712 — SGD-descends block omits scope and sign hypotheses
**Kind:** statement-mismatch
**Severity:** low
**Says:** It lists hx, hgh, hsmall, h1 and h2 as the hypotheses.
**Actually:** Lean also requires ha : 0 ≤ a, hlr : 0 ≤ lr and hη : 0 ≤ η. The theorem covers one example, weights only, bias fixed (docstring around l. 205). The block never restates L.
**Fix:** Add "α, η, a ≥ 0" and "(one example, bias fixed)".

### content.tex:879-884 vs 1219-1226 — pdiv(i,j) called "the (i,j)-entry of the Jacobian", but it is the transpose of the prose's Jacobian
**Kind:** inconsistency
**Severity:** low
**Says:** (Def) "pdiv f x i j is the (i,j)-entry of the Jacobian". (Prose) "an m×n table … one per (output, input) pair … pdiv above is one entry of it at a chosen (i,j)".
**Actually:** pdiv f x i j = ∂f_j/∂x_i, input index first (Tensor.lean:101). That is the (j,i) entry of the prose's output-major table. The prose also swaps m and n relative to f : Vec m → Vec n.
**Fix:** Define it as ∂f_j/∂x_i explicitly.

### content.tex:1335-1344 — the convention note covers only dx; dW also flips
**Kind:** inconsistency
**Severity:** low
**Says:** l. 1298 gives "dW = dy⊗x" and l. 1475 gives "dW = x⊗dy". The convention paragraph mentions only the dx transpose.
**Actually:** Both are right under their own conventions, but the change is unexplained.
**Fix:** Add "and dW = dy⊗x becomes x⊗dy".

### content.tex:1189-1196 — elemwiseProductHasVJP is square-only in Lean
**Kind:** statement-mismatch
**Severity:** low
**Says:** It proves HasVJP(f⊙g) without stating dimensions; the neighbouring blocks use f : Vec m → Vec n.
**Actually:** Tensor.lean:398-400 has `(f g : Vec n → Vec n)`.
**Fix:** State f, g : ℝⁿ → ℝⁿ.

### content.tex:1043-1047 — pdiv_reindex block has no statement
**Kind:** statement-mismatch
**Severity:** low
**Says:** "Covers permutations, reshapes, slicing. Generalizes pdiv_id." There is no formula, yet l. 1415 and l. 1453 use one.
**Actually:** Tensor.lean:132-135 states `pdiv (fun y k => y (σ k)) x i j = if i = σ j then 1 else 0`.
**Fix:** State the formula.

### content.tex:935-938 — pdiv_comp step 4 cites map_sum/map_smul
**Kind:** stale
**Severity:** low
**Actually:** Tensor.lean:175-179 is one rw chain: fderiv_comp, ContinuousLinearMap.comp_apply, LinearMap.pi_apply_eq_sum_univ, Finset.sum_apply. Steps 3-4 together are LinearMap.pi_apply_eq_sum_univ.
**Fix:** Cite LinearMap.pi_apply_eq_sum_univ.

### content.tex:796-798 — "first three digits are real" / "half a point" overstate precision
**Kind:** math
**Severity:** low
**Actually:** The Wilson half-width is ±0.53 pt (recomputed: 91.555–92.613), so the tenths digit is not real either. For a gap between two independent accuracies the 95% half-width is about √2·0.53 ≈ 0.75 pt.
**Fix:** "first two digits … a gap under about three-quarters of a point".

### spines.tex:12 — ResNet-34's double circle is empty
**Kind:** typo/render
**Severity:** low
**Actually:** `circle … double] at (165.6pt,83.0pt) {}` has no number. The column sums to 25 without it, so its count is 0. That clashes with the caption: "the circle at a chapter is how many of that chapter's statements it reaches".
**Fix:** Print 0, or explain it in the caption.

### content.tex:1633 — notation pdiv(L)(flatten W)(i,j)
**Kind:** typo/render
**Severity:** low
**Actually:** Lean (LinearFold.lean:96-100) differentiates `v ↦ CE(dense(unflatten v) b x)` lifted to Vec 1 at index finProdFinEquiv(i,j). The book's L takes a matrix.
**Fix:** pdiv(L∘unflatten)(flatten W) φ(i,j) 0.

## Checked and fine
- All 30 \lean names exist with correct namespaces (Proofs.*, Proofs.LinFold.*). That includes every name the prose cites: pdiv_dense_b, poc_*_den_eq, linear_grad_close, HasVJP.canonical.
- No sorry in Tensor, MLP, ParamGrad, Softmax, Nets/Small/Linear* or SgdDescent/*, so every \leanok holds.
- These statements match Lean: chain, sum, product, id, const and finset_sum; HasVJP; vjpComp, biPath and elemwise hypotheses; the identity backward; HasGradAt; pdiv_dense = W_ij; pdiv_dense_W = δ·x_i; denseHasVJP = Mat.mulVec W dy; the weight and bias grads; softmaxCE = p − onehot; the linear_fold W′/b′ formulas; linear_net_lossGrad; the SGD h1, h2 and hsmall hypotheses, with D = stepRadius (Basic.lean:131).
- Derivations hand-checked:
  - the chain-rule steps;
  - vjpComp's sum swap;
  - biPath and elemwise step 3;
  - pdiv_dense_W φ-injectivity;
  - the weight and bias δ-collapses;
  - softmax-CE steps 4-5;
  - the dense prose dx = Wᵀdy, dW = dy⊗x, db = dy.
- The run transcript matches runs/2026-09-01-linear-verified-xla-cuda/linear-verified-xla.log verbatim.
  - The mean epoch is 2684/12 = 223.7 ms, which is "about 224".
  - Wilson recomputes to 91.555–92.613, printed as 91.56–92.61, and wilson95 is in Train.lean:262.
  - Zero init is at Train.lean:3259. 12 epochs and bs 128 are in MainMnistLinearVerified.lean.
- The commands are real:
  - the lake target mnist-linear-verified (lakefile:475);
  - download_mnist.sh, which writes ~11.6 MB of .gz to data/mnist;
  - verified_mlir/linear_{train_step,fwd}.mlir.
- ch1.tex agrees with every \uses line. All 26 arrows parsed and matched, and "pdiv → 23 boxes here" is correct. pdiv_softmax is dashed and tagged ch 9, matching l. 12729.
- spines.tex column sums are correct (25, 26, 30, 71, 64). Double circles sit on the proving chapter. The "all five reach Ch 1, Ch 4 and §9.2" and "EfficientNet and ConvNeXt reach Ch 5" claims are right.
- The cross-refs resolve correctly: sec:mlir_training_step, sec:precision, sec:matrix_machinery, chap:bn, chap:residual, chap:attention. The intro's dense listing (l. 232) matches MLP.lean:25-26.
- The Lamport title and URL are correct. "Used for residual connections" and "Used for Squeeze-and-Excitation" are confirmed (Residual.lean, SE.lean). Ch 2-4 each have fold, loss_grad and sgd_descends blocks.

**Tally:** 23 findings: 3 high, 7 medium, 13 low.

---

## Slice 03

I could not write the findings file: the harness refused the write to /tmp/claude-1000/-home-skoonce-lean-lean4-mlir-worker/72b5c474-dbba-4182-a591-530e6f22d959/scratchpad/findings-03.md with "Subagents should return findings as text". The full findings for content.tex 1727–2307 are below; save them to that path if you need the file.

**Counts:** 3 high, 11 medium, 11 low (25 findings, one of them a lead).

**Top 3:**
1. **2283 and the Recap at 2301:** "The one open gap is ... over ℝ" is false. LinearFold's own docstring lists three gaps, and the same section concedes one of them.
2. **2297:** the Recap's "the whole chain closes" overstates both theorems. The fold covers one example, and descent covers weights only, one example, under extra conditions.
3. **1951–1975:** the `@linear_back` listing comes from IRPrint.lean, a legacy printer whose text is trusted, not machine-checked.

# Findings 03 — content.tex 1727–2307

### content.tex:2283 (and Recap 2301–2303) — "The one open gap is ... over ℝ"
**Kind:** overclaim **Severity:** high
**Says:** "every architecture in Part~I trained end-to-end under one machine-checked scheme. The one open gap is that the theorems are over ℝ and the GPU runs a finite precision". The Recap says: "What it leaves open is stated once here ... theorems are over ℝ ... The other limit is the network's."
**Actually:** `LeanMlir/Proofs/Nets/Small/LinearFold.lean:36-47` lists three scope limits:
- per-op `den` ⇄ MLIR text is "trusted op-level modelling";
- "Single example (B = 1) ... the emitted module batch-contracts", which the file "does not state" (lines 16-17);
- ℝ → Float32.

It also says the committed-bytes tie is enforced by a CI regenerate-and-diff, not proven (lines 33-35). The section itself admits the batch gap at 2269–2271 ("the batch sum and the α/N scale are the render's"). The appendix (~19626–19632) adds another: the oracles lower through IREE, while the default training path uses XLA.
**Fix:** Write "The main open gap is ..." and name the others (one example rather than the batch, the trusted text modelling, the compiler) with a pointer to app:verification. Make the same change in the Recap.

### content.tex:2297–2299 — Recap: "the whole chain closes"
**Kind:** overclaim **Severity:** high
**Says:** "Theorem linear_fold says the emitted step is the certified step, and Theorem linear_sgd_descends says the step goes downhill."
**Actually:**
- `poc_train_step_tail_certified` covers one example (B=1); the emitted step contracts over 128 examples and scales by α/N.
- `linear_sgd_descends` (`LeanMlir/Proofs/Training/SgdDescent/Linear.lean:205-235`) is "Stated at one example `(x, label)`, weights only (the bias `b` is fixed)". It holds only under `hsmall`, `h1`, `h2` and η-accuracy.
**Fix:** "per example, the emitted step is the certified step; under its small-step conditions one SGD step on the weights decreases that example's loss."

### content.tex:1951, 1963–1966, 1975 — `@linear_back` is a trusted legacy printer, not a checked render
**Kind:** overclaim **Severity:** high
**Says:** "Here is what the code generator emits ... by a machine-checked theorem that is the linear layer's exact reverse-mode derivative"; "the printer emits the identical graph at production scale".
**Actually:**
- It is `linearModule` in `LeanMlir/Proofs/Codegen/IRPrint.lean:144-148`.
- That file's header (lines 6-11) says: "Legacy printers ... The text is trusted. The verified renderers are `StableHLO.Pretty` and the `*Render*` files; nothing imports this file."
- IRPrint.lean contains no theorem tying this text to `denseHasVJP`.
- No `verified_mlir/` file contains this function, and the training step never computes dx.
- The listing also drops the `precision = [DEFAULT, DEFAULT]` attribute and the `module` wrapper that the printer emits.

**Fix:** Call it the trusted IRPrint rendering of the IR node that `dense_at_bridge` proves. Alternatively, show %v9 from `linear_train_step.mlir` instead.

### content.tex:2139–2143, 1911–1913, heading 1982 — "the same driver" for every chapter
**Kind:** inconsistency **Severity:** medium
**Says:** "Every chapter after this one hands a different VerifiedNetSpec to the same driver."
**Actually:** Train.lean:3233-3237 says "Only the linear classifier uses this". Train.lean:3324-3325 says "Chapter 1's linear model is the ONE book trainer that does not route through `VerifiedNet.train`". Later chapters use `VerifiedNet.train` or `trainAdamSched`, which have packed parameters and mkParam init. The heading also says `.train` but the section shows `trainLinear`.
**Fix:** Name `VerifiedNet.train` as the later chapters' driver, the packed-parameter sibling of this loop, or retitle the section.

### content.tex:1796 — init code 0 is not "He(fan-in)"
**Kind:** statement-mismatch **Severity:** medium
**Actually:**
- `Spec.lean:219-226` says: "0 = random weight (conv He fan-out, dense Glorot ...)".
- `mkParam` (Train.lean:630-632) uses rank-4 `2/(dims[0]·k²)` ("He, fan-OUT") and rank-2 `2/(in+out)` ("Glorot").
- Fan-in applies only under the `heFanIn` gate flag (Train.lean:616-624).
- Related wording at 2099: "rather than He-initialised".
- The source comment `NetsCore.lean:89` "(He)" and the "He init" banner at Train.lean:1358 are wrong the same way.

**Fix:** "0 is a random weight (He fan-out for convs, Glorot for dense)". At 2099, say "rather than randomly initialised".

### content.tex:1805–1807 — d0 is not derived from the parameter list
**Kind:** statement-mismatch **Severity:** medium
**Actually:** `Spec.lean:350` defines `d0 s := s.inC * s.imageH * s.imageW`, from separately declared fields, not from `toSpecs`. The docstring at Spec.lean:291 makes the same wrong claim.
**Fix:** "d0 is derived from inC·imageH·imageW".

### content.tex:1835, 1838–1840, 1850 — "54 lines" and "all of it" are stale
**Kind:** stale **Severity:** medium
**Actually:** `apps/mnist/MainMnistLinearVerified.lean` is now 58 lines. Commit c206b1d0 (2026-10-15, modules slice 4) added `module`, `public import`, and `@[expose] public section`. The version before that commit was exactly 54 lines.
**Fix:** Say 58 lines, and either print the module header or say it is omitted.

### content.tex:2239 — "27 operations where 19 would do"
**Kind:** wrong-number **Severity:** medium
**Actually:** The file has %v0–%v26, which is 27 ops. The duplicate band %v13–%v21 is 9 ops, so 18 remain; 17 if %v22's `constant 0.0 : f32` reuses %v4. Counting `return` gives 28 vs 19, which does not match either.
**Fix:** "where 18 would do".

### content.tex:2224–2226 — %v9 is not "exactly the move" from MLIR: Linear
**Kind:** inconsistency **Severity:** medium
**Actually:** The MLIR: Linear move is `dot_general %dy, %W0` contracting [1]x[1], i.e. dy·Wᵀ. %v9 is `dot_general %x, %v8` contracting [0]x[0], i.e. xᵀ·dy, a batch contraction. Operands, axes and result all differ.
**Fix:** "the same op with different operands, contracting the batch axis".

### content.tex:1948–1950 — "The backward pass is one operation"
**Kind:** overclaim **Severity:** medium
**Actually:** This net's training backward is the weight gradient (`dot_general` %v9) plus the bias gradient (`reduce` %v23). dx is never computed in `linear_train_step.mlir`. The op shown is only the input-gradient VJP.
**Fix:** "The layer's input-gradient VJP is one operation".

### content.tex:1761, 1865 vs 1805, 1824, 1927 — W orientation flips
**Kind:** inconsistency/math **Severity:** medium
**Actually:** The section uses two conventions:
- 1761 and 1865: W ∈ ℝ^{10×784}, z = Wx, ∇_W = (ŷ−e_t)⊗x.
- 1805 says 784×10; the Lean uses `Mat 784 10`; the MLIR uses `W0: 784x10` with z = xW.
- thm:denseWeightGrad_correct states dW = x⊗dy, and thm:denseHasVJP's backward "W dy" needs W to be 784×10.

**Fix:** Use one convention: W ∈ ℝ^{784×10}, z = Wᵀx + b, ∇_W = x⊗(ŷ−e_t).

### content.tex:2252–2253 — "an rsqrt appears" under AdamW
**Kind:** wrong-number **Severity:** medium
**Actually:** `cifar8w_bn_sgd_train_step.mlir` already has 24 `stablehlo.rsqrt` (from BatchNorm). The adam render has the same 24 rsqrt plus 38 `stablehlo.sqrt`, and 172 divides vs 58.
**Fix:** "a sqrt and a divide appear per tensor".

### content.tex:2257–2259 — "Adam cannot have [a descent theorem] because it is not monotone ... the AMSGrad counterexample"
**Kind:** external-fact/overclaim **Severity:** medium
**Actually:** Reddi, Kale & Kumar (ICLR 2018) show Adam can fail to converge on an online convex problem. That is about convergence, not one-step monotonicity. SGD is not monotone in general either; the book's SGD descent holds only under `hsmall`, `h1`, `h2`. A conditional Adam descent is not excluded. What is defensible: m̂/√v̂ need not be a descent direction.
**Fix:** Reword along those lines.

### content.tex:1917–1919 — "Nothing between the theorem and the GPU rewrites it"
**Kind:** overclaim **Severity:** medium
**Actually:** XLA rewrites the HLO (fusion, CSE). The book's own line 2235 says CSE "is the compiler's business", and Pretty.lean:4942 says "iree CSEs it". The text→den link is trusted (LinearFold.lean:38-41), and the bytes tie is CI-enforced only.
**Fix:** "Nothing between the theorem and the compiler rewrites it."

### content.tex:2155–2158 — "Nothing else is removed" (train-step listing)
**Kind:** inconsistency **Severity:** low
**Actually:** The listing also drops the `module @m{}` wrapper and the file's header comment "// ── linear train step: every op is pretty(verified AST node) ──". It adds book-authored comments such as `// softmax`, `// dy` and the band headers, which read as if they were in the file. The ops, names, shapes and constants all match exactly. At 1922, "exactly as committed" for the forward listing is also wrapped.
**Fix:** Disclose that the wrapper is dropped and the band comments are added.

### content.tex:2247–2249 — "the listing's last band is the entire optimizer"
**Kind:** inconsistency **Severity:** low
**Actually:** The W update (%v10–12) sits in band 2. The last band also contains the bias-gradient reduce (%v22–23).
**Fix:** "%v10–%v12 and %v24–%v26 are the entire optimizer".

### content.tex:1890–1906 — "One new operator" bullets undercount
**Kind:** inconsistency **Severity:** low
**Actually:**
- CNN also adds MaxPool (line 419).
- ConvNeXt (`chap:layernorm`) adds LayerNorm and GELU (line 443; `thm:layerNormHasVJP` and `thm:geluHasVJP`), plus layer scale. The bullet omits LayerNorm.
- EfficientNet adds swish.

**Fix:** Add the missing operators to each bullet.

### content.tex:1967–1971 — the "MLIR: operator" list omits Dense
**Kind:** wrong-ref **Severity:** low
**Actually:** `\section{MLIR: Dense}` exists at line 2872. The sections also do not "close" their chapters; for example, Layer Scale (11501) is followed by two more sections.
**Fix:** Add dense to the list, and change "closes with" to "includes".

### content.tex:2096–2097 — "loadData mmaps ... into F32Array buffers"
**Kind:** statement-mismatch **Severity:** low
**Actually:** `ffi/f32_helpers.c:144-167` uses `fopen`/`fread` and normalises with /255; there is no mmap anywhere in `ffi/`. The return type is `ByteArray` (F32Array.lean:254; Train.lean:1216).
**Fix:** "reads the IDX files into normalised f32 ByteArrays".

### content.tex:2091–2094 — "which is the 604 ms"
**Kind:** inconsistency **Severity:** low
**Actually:** There are two sessions. The log shows the train step compiling in 604 ms and the forward in 116 ms.
**Fix:** Give both times.

### content.tex:2122–2125 — "packed is the authoritative copy"
**Kind:** statement-mismatch **Severity:** low
**Actually:** Under residency, `packed` is also an unwritten buffer until `readParams` runs. Train.lean:3290-3294 says the epoch boundary is what makes it authoritative.
**Fix:** "the device holds the parameters; readParams makes packed authoritative".

### content.tex:2019–2087 — trainLinear listing comments are the book's own
**Kind:** inconsistency **Severity:** low
**Actually:** The code lines match Train.lean:3239-3328 apart from the disclosed omissions. The comments, however, are rewritten: "-- 1. One session per committed render", "-- W0 and b0 stay on the device", and "-- ceil: last eval batch is zero-padded" (the source says "the last partial batch is zero-padded, not dropped"). This is not disclosed.
**Fix:** Add it to the list of changes.

### content.tex:1994–1997 — pseudocode signature
**Kind:** statement-mismatch **Severity:** low
**Actually:** The function takes a `VerifiedNet` (after `toNet`), not a `VerifiedNetSpec`, and returns `IO Unit`. Parameters are dumped only under `LEAN_MLIR_DUMP_PARAMS`.
**Fix:** Adjust the Input and Output lines.

### content.tex:2282–2283 — "Part~I"
**Kind:** typo **Severity:** low
**Actually:** The rest of the book, including 1886 in this slice, writes "Part~1" or "Part 1".
**Fix:** "Part~1".

### content.tex:2250–2252 — 1,001 / 2,293 op counts
**Kind:** lead **Severity:** low
**Actually:** I could not reproduce these counts. In `cifar8w_bn_{sgd,adam}_train_step.mlir`:
- all `%x = stablehlo.*` definitions: 1,009 / 2,301;
- top-level only: 997 / 2,289;
- region-body ops: 12 per file.

The 2.3× ratio holds under every count.
**Fix:** State the counting rule or update the numbers.

### content.tex:1873 — "emits exactly these as fused StableHLO"
**Kind:** overclaim **Severity:** low
**Actually:** The render emits the batched, α/N-scaled form, and nothing in the text is fused.
**Fix:** "emits their batched form as one StableHLO function".

## Checked and fine
- The `linearVerified` listing matches NetsCore.lean:79-87; the `#guard` confirms the toSpecs result.
- The toSpecs dense arm matches; init codes 1 (ones) and 2 (zeros) are correct.
- The `linearVerifiedHasVJP` listing matches SpecVJP.lean:63-65.
- 7,850 = 784·10 + 10.
- `linearConfig` and `main` match the app; lr is not in the config.
- The `linear_fwd.mlir` listing matches the committed file.
- The `linear_train_step.mlir` listing: all 27 ops, operands, dims, constants and shapes match; the band boundaries are correct; %v13–21 duplicates %v0–8 verbatim.
- 0.00078125 = 0.1/128, set at ChapterArtifacts.lean:28.
- `@linear_back` shapes and dims match `IRPrint.linearModule 2 4 3`.
- The forward render equals the train step's %v0–%v2.
- `lossCotGraph` and `lossCotGraph_isCEgrad` exist as described.
- Run numbers match `runs/2026-09-01-linear-verified-xla-cuda/linear-verified-xla.log`: 89.77 → 92.10, flat from epoch 9, 604 ms compile, mean epoch 223.7 ms.
- 468 batches per epoch; 16 images would be dropped without the ceil.
- MLP 97.81% matches `runs/2026-09-01-mlp-verified-xla-cuda`; the gap is 5.71.
- The trainLinear code lines match; `LEAN_MLIR_PERTURB_R` and `LEAN_MLIR_MAX_EPOCHS` behave as described; all named FFI functions and helpers exist.
- Zero init gives a seed-free run.
- The dlopen backend claim is correct.
- All `\ref` targets in the slice exist and are apt.
- The N=1 wording at 2269–2271 is accurate.
- The Foundations loop is five lines (content.tex:696-700).
- The AdamW render is AdamW; `adamW_triple_faithful` exists.
- The Recap's chain, sum and product rules exist (ax:pdiv_comp, ax:pdiv_add, ax:pdiv_mul).

---

## Slice 04

I could not write the findings file: the Write tool refused it ("Subagents should return findings as text, not write report files"). I did not route around that with Bash, so `/tmp/claude-1000/-home-skoonce-lean-lean4-mlir-worker/72b5c474-dbba-4182-a591-530e6f22d959/scratchpad/findings-04.md` does not exist. The full findings are below; save them to that path if you need the file.

**Counts:** 2 high, 6 medium, 14 low (22 findings).

**Top 3:**
1. **2876–2927, the "MLIR: Dense" section is stale.** It shows the legacy `IRPrint.lean` Hlo printer, and that file's own header says "nothing imports this file". The trained `mlp_train_step.mlir` actually comes from the `SHlo`/`pretty` renderer (`MlpRender`), which has den theorems. So the caveat "checked by reading side by side, not by a theorem" describes the old path.
2. **2475–2478 and the 2964 Recap, the ReLU record does not agree with the emitted mask at a kink.** `reluHasVJP` is `HasVJP.canonical`. At any x with a zero coordinate it is the zero vector in every coordinate, while the emitted `select(x>0, dy, 0)` still passes dy where x_i > 0. The Lean docstring says the two "differ at the kinks".
3. **2972, the Recap's "two witnesses" overclaim.** Neither witness appears in the chapter body. The "trained weights" one is a reduced 49→8→10 net, not this chapter's net. The hand-built one (`MlpConcrete`, all-ones 2×2) has no theorem that its gradient is non-zero.

# Findings 04: content.tex 2308–2984 (Chapter 2, MNIST: 1D MLP)

### content.tex:2876–2927: "MLIR: Dense" shows a legacy printer that nothing imports, not the emitter that produced the trained artifact
**Kind:** stale **Severity:** high
**Says:** "The emitted backward is a value of a Lean datatype, `Back` … Here is what `IRPrint.lean` prints for that graph … the printer walks a mirror of it, `Hlo` … that the mirror matches is checked by reading the two definitions side by side, not by a theorem"
**Actually:** `LeanMlir/Proofs/Codegen/IRPrint.lean:7-11` says of itself: "Legacy printers … The text is trusted. The verified renderers are `StableHLO.Pretty` and the `*Render*` files; nothing imports this file." No `.lean` file in the repo imports it (`grep -rn "import.*IRPrint"` finds nothing). The trained `verified_mlir/mlp_train_step.mlir` comes from `mlpTrainStepText` (`Codegen/MlpRender.lean:35`). That renderer prints `SHlo` `dotOut`/`selectPos` nodes, and theorems prove what they denote (`MlpFold.cot1_den`/`cot0_den`, `MlpFold.lean:44-62`). The real file has the same op pattern at %v19–%v26. The chapter's own spec section names `mlpTrainStepText` as the emitter, so the two sections contradict each other.
**Fix:** Show %v19–%v26 from `mlp_train_step.mlir`. Name SHlo/`pretty` as the emitter, with `cot*_den` and `MlpFold` as the bridge. Keep `Back`/`mlp_whole_bridge` only as the math-level bridge. Narrow the trusted surface to per-op `pretty` lexing.

### content.tex:2475–2478 and 2964–2966: the ReLU record does not agree with the emitted mask at a kink
**Kind:** statement-mismatch **Severity:** high
**Says:** "at the kink it is zero, as the emitted mask [x > 0] is" and (Recap) "built directly from pdiv under the convention every framework uses, zero at the kink"
**Actually:** `reluHasVJP n := HasVJP.canonical _` (`MLP.lean:224`). If any x_k = 0, `relu n` is not differentiable at x, `fderiv` returns its junk value 0, and every `pdiv` entry is 0. The backward is then the zero vector in all coordinates, including those where x_i > 0, while the emitted mask passes dy there. The docstring at `MLP.lean:210-221` says the codegen "agrees … at smooth points and differs at the kinks". The only agreement theorem, `relu_codegen_matches_canonical`, requires `h_smooth`.
**Fix:** State that the pdiv record is the zero vector at any point with a zero coordinate, and that it equals the emitted mask only at smooth points. Remove "convention every framework uses" from the Recap.

### content.tex:2972–2973: the Recap's two witnesses are not what it says, and the chapter never presents them
**Kind:** overclaim **Severity:** medium
**Says:** "Two witnesses, one hand-built and one at the trained weights, show the gradient is not the zero function."
**Actually:**
- Neither witness is stated or `\lean`-cited anywhere in 2308–2984.
- `Trained/MlpWitness.lean` has the banner "REDUCED CERTIFICATE MODEL … 49-dim … width-8 hidden … NOT the canonical 784→512→512→10". It is a one-hidden-layer 49→8→10 net.
- The hand-built `MlpConcrete.mlpConcreteHasVJPAt` (`Nets/Small/MnistCNN.lean:282-315`, all-ones 2×2) only discharges the smoothness hypotheses. No theorem proves its gradient is non-zero.
- The only non-zero-gradient theorem is `trainedMlp_backward_nontrivial`, and it is for the reduced net.

**Fix:** Add both witnesses to the theorems section with `\lean{}`, and describe them accurately.

### content.tex:2376–2380: "holds for the rest of the book" is contradicted in this same chapter
**Kind:** inconsistency **Severity:** medium
**Says:** "it holds for the rest of the book: changing the seed moves these numbers less than a single run can pin them down."
**Actually:** At 8→4096 the five seeds have sd 0.56 and range 93.14–94.53 (`runs/2026-09-01-mlp-grid-8x4096-seeds`). Seed 4 (94.53) lies outside seed 1's printed CI [92.63–93.62]. Lines 2867–2874 themselves say three runs would mislead there. Chapter 3 has a 97.39% CNN outlier.
**Fix:** Limit the claim to this configuration, or drop "it holds for the rest of the book".

### content.tex:2372–2375: the five-seed numbers have no cited source, and other five-seed sets differ
**Kind:** wrong-ref / inconsistency **Severity:** medium
**Says:** "five seeds … averages 97.73% with a spread of 0.06"
**Actually:** Only `runs/2026-08-31-small-seeds-wide/mnist_mlp_s1-5` matches (97.732, sd 0.063). `runs/2026-08-31-small-seeds/` gives 97.746 ± 0.065. `runs/2026-09-01-mnist-n30` seeds 1–5 give 97.738 ± 0.085, and the 30-run set that Chapter 3 plots gives 97.76 ± 0.11.
**Fix:** Cite small-seeds-wide, or use the 30-run figures so the two chapters agree.

### content.tex:2533–2541 (thm:mlp_fold): the statement drops the per-example scope and "the output layer" overreaches
**Kind:** overclaim **Severity:** medium
**Says:** "`mlp_train_step.mlir` emits six update operations … each denotes θ−α∂L/∂θ: the output layer's against the gradient of the whole loss, the two hidden layers' against the certified per-layer VJP"
**Actually:** MlpFold's "Scope" note says: one example (the module contracts a batch of 128, and `den` is per-example), per-op `pretty` lexing trusted, ℝ→Float32. Only W₂ is stated against the whole loss (`mlp_W2_tied_totalloss`). b₂, W₀, b₀, W₁ and b₁ are stated against the per-layer Jacobian at the chain cotangent, so "two hidden layers" misses the input layer and b₂. The Recap at 2970 repeats "exactly that".
**Fix:** Add the per-example scope. Say "the output weight against ∂CE/∂W₂; the other five against the certified per-layer Jacobian at the chain cotangent".

### content.tex:2408–2413: "the object later chapters name" is false
**Kind:** overclaim **Severity:** medium
**Says:** "`mlpHasVJP` … is the object later chapters name"
**Actually:** `mlpHasVJP` appears in the book only at 2411, 2484, 2513 and 2798. No Lean file outside `MLP.lean` uses it. It is the canonical record, correct by `rfl`. Later code consumes `mlpHasVJPAt` (SpecVJP, the IR bridge, MlpParamGrad).
**Fix:** Name `mlpHasVJPAt` as the object later work builds on.

### content.tex:2797–2799: the width argument cites the content-free record
**Kind:** overclaim **Severity:** low
**Says:** "`mlpHasVJP` is polymorphic … so one theorem covers every width"
**Actually:** `mlpHasVJP` is a canonical `def`, not a theorem. The polymorphic results with content are `mlpHasVJPAt`/`_correct` and `MlpFold`; the `mlpG` docstring cites `mlpHasVJPAt`.
**Fix:** Cite `mlpHasVJPAt` (and MlpFold).

### content.tex:2978: the kink hypothesis is not "discharged" by Chapter se
**Kind:** overclaim / wrong-ref **Severity:** low
**Says:** "rides along until Chapter~\ref{chap:se} discharges it"
**Actually:** `chap:se` is EfficientNet. There the activations are smooth, so the hypothesis is absent (content.tex:590-597, 9562). The MLP's hypothesis is never discharged in general.
**Fix:** Say the hypothesis disappears from Chapter se on, because the activations are smooth.

### content.tex:2678–2683: "the one line … not pretty" is twelve ops plus a hand-written signature
**Kind:** overclaim **Severity:** low
**Says:** "the one line of `mlp_train_step.mlir` that is not `pretty` of a proven graph node"
**Actually:** The report-only block is 12 ops (`mlp_train_step.mlir:59-70`). The signature, including the unused `%lslot` input, and the `return` are also hand-written (MlpRender docstring).
**Fix:** Call it "the one output", with a 12-op hand-written block.

### content.tex:2570–2575 (thm:mlp_sgd_descends): the single-example scope is dropped and the `\lean` list is incomplete
**Kind:** statement-mismatch **Severity:** low
**Actually:**
- The Lean conclusion is one example's loss with the other parameters fixed (`SgdDescent/Mlp.lean:700-710`).
- `mlp_hidden_float_sgd_descends` (:1032) and `mlp_output_float_sgd_descends` (:819) exist but are missing from `\lean{}`.
- There is no b₂ descent theorem, so "at the biases" means b₀ and b₁ only.
- The float version carries many unlisted hypotheses: bounds on W₀ and all biases, `hfexp`, `hρ1`, rounding margins.

**Fix:** Add "one example, other parameters fixed". Fix the `\lean` list and the bias wording.

### content.tex:2518: "five times" should be four
**Kind:** math **Severity:** low
**Actually:** Five stages compose with four `vjpCompDiffAt` applications (`MLP.lean:349-357`).
**Fix:** "four times".

### content.tex:2844: 755× should be 756×
**Kind:** wrong-number **Severity:** low
**Actually:** 20,037,642 / 26,506 = 755.97.
**Fix:** "756×".

### content.tex:2862: "about a point and a half" is 1.7 points
**Kind:** wrong-number **Severity:** low
**Actually:** 93.70 − 91.99 = 1.71.
**Fix:** "about 1.7 points".

### content.tex:2828–2835: the plotted bars are not the Wilson interval, and 512 shows 97.83 against 97.81 elsewhere
**Kind:** inconsistency **Severity:** low
**Actually:** The bars are symmetric ±h, but Wilson is asymmetric (91.99 → [91.44, 92.51]), so "the same interval the transcripts print" is not quite true. The 512 point plots 97.83 from the sweep tsv, while the chapter, Chapter 3 and Chapter 4 quote 97.81 for the same config.
**Fix:** Use asymmetric bars or say "approximately". Note that the sweep's 512 point is a separate run.

### content.tex table at 378 versus 2490–2575: Chapter 2's step-certificate count does not match (lead; the table is outside the slice)
**Kind:** inconsistency **Severity:** low
**Actually:** The table says Steps = 2 and "SGD descends on W₀". By the book's own definition (lines 355-361) the chapter has three step certificates: mlp_fold, mlp_loss_grad and mlp_sgd_descends. The descent theorem also covers W₁ and the biases.
**Fix:** Recount, or say which theorem is folded into which.

### content.tex:2958 and 2975: kink-set wording ("measure-zero", "permitted to fail")
**Kind:** lead / math **Severity:** low
**Actually:** The bridge has hypotheses; it does not "fail". Whether the second hypothesis fails only on a null set depends on the weights. With zero-init biases and an open region where every first-layer pre-activation is negative, `dense W₁ b₁ (relu …) k = b₁ k = 0` on that whole region, which has positive measure. No theorem in the repo proves a measure-zero claim.
**Fix:** "null for generic weights", and "does not apply" instead of "permitted to fail".

### content.tex:2425 and 2450–2455: the proof sketch differs from the Lean proof and breaks at n=0; the title says "subgradient"
**Kind:** statement-mismatch **Severity:** low
**Actually:** The Lean proof uses `Filter.eventually_all` sign persistence, not an explicit ball. `r := min_k |x_k|` is not > 0 when n = 0. The statement is the classical Jacobian at smooth points, not a subgradient.
**Fix:** Retitle to "ReLU Jacobian at smooth points" and rephrase step 2 as sign persistence near x.

### content.tex:2334–2336: the transcript edit note undercounts what was removed and wrapped
**Kind:** inconsistency **Severity:** low
**Actually:** 21 `ptxas` spill-warning lines were also removed. Three lines are wrapped, not two: both `compiled` lines and the `train 60000` line.
**Fix:** "XLA's startup banner and ptxas spill warnings are removed and three long lines are wrapped."

### content.tex:2745–2754: the printed "whole program" is not verbatim
**Kind:** inconsistency **Severity:** low
**Actually:** `apps/mnist/MainMnistMlpVerified.lean` starts with `module` and uses `public import` and `@[expose] public section`. The listing drops these silently.
**Fix:** Print them, or note "(module header elided)".

### content.tex:2370 and 2753: run IDs in body prose
**Kind:** process-narrative **Severity:** low
**Actually:** `runs/2026-09-01-linear-verified-xla-cuda/` appears inline twice in body sentences.
**Fix:** Move it to a footnote or caption.

## Checked and fine
- The transcript at 2338–2363 matches `runs/2026-09-01-mlp-verified-xla-cuda/mlp-verified-xla.log` exactly: 12 epochs, CIs, times, compile 2123/157 ms, 7 outputs, 669706 floats.
- Parameter count: 669,706 = 784·512+512+512·512+512+512·10+10. "6 params" holds because `| relu => #[]` at `Spec.lean:235`.
- Derived numbers:
  - Epoch times: MLP mean 848 ms (book ~850); linear mean 223.7 ms (book 224).
  - ~12 s total: 12 epochs × ~0.85 s plus ~2.3 s compile.
  - 5.71-point gain over linear.
  - Loss falls 14.2×.
- The linear model is zero-initialized, and its 30 n30 runs are all 92.10.
- ±0.29 is half of [97.50, 98.08], and all five seeds (97.67–97.80) sit inside it.
- Sweep vs `runs/mlp_grid_results_xla.tsv`:
  - Points and Wilson half-widths match.
  - Params 6442, 26506 (27K), 55050 (55K), 269322, 20037642.
  - Ratios 364× and 74×; gains +5.03 and +0.99.
  - Overlap claims hold: d ≥ 256 all overlap; 64 and 4096 are disjoint.
- 8×4096 seeds: 93.14, 93.70, 93.23, 94.53, 93.89, giving mean 93.70 and sd 0.56. The prose about the first three and the fourth holds.
- `mnist-mlp-grid` exists (lakefile:953) and defaults to 12 epochs.
- `download_mnist.sh` exists (~11.6 MB gz); `lean_exe mnist-mlp-verified` is at lakefile:486.
- Code listings:
  - `mlpVerified` matches `NetsCore.lean:97-106`.
  - The REPORT-ONLY comment matches line 58 of the emitted file.
  - `mlpConfig` is 12 epochs, batch 128.
  - `.train` vs `.trainLinear` holds.
  - `mlpVerifiedHasVJPAt` matches `SpecVJP.lean:92`.
- Statements matching Lean:
  - `pdiv_relu`.
  - `mlpHasVJPAt` and `_correct`.
  - `vjpComp` (global differentiability) and `vjpCompAt`.
  - `mlp_net_lossGrad` and `_CE`.
  - `mlp_input_sgd_descends`: hypotheses and conclusion.
  - `emitMlpBack`, `Back.denote` and `mlp_whole_bridge`.
- `IRPrint` `mlpModule 2 4 3 3 2` reproduces the book's `@mlp_back` op for op.
- All `\lean{}` declarations exist, and all `\uses`/`\ref` labels resolve. `figures/depgraph/ch2.tex` exists.
- MNIST facts (60k/10k, 28×28, 10 classes, 1998) are correct.

---

## Slice 05

I couldn't write findings-05.md: the harness blocks report files from subagents. The full findings are below instead. Slice: content.tex 2985–4032 (Chapter 3, MNIST 2D CNN). Tally: 1 high, 6 medium, 16 low (23 findings).

The three most serious:
- **High:** the conv bridge at 3947–3958 cites `conv_back_bridge_1to2` and `conv_back_bridge_2to2`. Neither exists any more. The current theorem is `Proofs.IR.conv_back_bridge`, which holds at every shape for odd kernels.
- **Medium:** the caveat that "the convolution bridge is unconditional" is wrong: it needs odd kernels.
- **Medium:** the max-pool definition misdescribes the pdiv-derived backward. It is zero everywhere once any window ties, not just at the tied window.

## Findings, most serious first

### content.tex:3947–3958 and 4006–4007: the bridge names two theorems that no longer exist
- **Kind / severity:** stale / missing-decl, high.
- **Says:** "`conv_back_bridge_1to2` … discharged here by expansion at the concrete shape (and again at the 2→2 shape, by `conv_back_bridge_2to2`)". The caveat adds "Representative scale. 1→2 channels at 4×4 (production: 1→32 at 28×28)".
- **Actually:**
  - Neither name exists in any .lean file.
  - Commit 1dcbcb58 (2026-09-30) says "IR.lean's four fixed-shape conv bridges are three general ones over odd kernels".
  - The current theorem is `Proofs.IR.conv_back_bridge` (LeanMlir/Proofs/Foundation/IR.lean:278). It holds for all `ic oc h w kH kW` given `hkH`/`hkW`, and is proved via `convBackDenote_eq_input_grad_formula` / `reverseSlab_eq_gradSlab` (`Finset.sum_bij'`), not by expansion.
  - So the "representative scale" caveat is also stale: the bridge now covers the production shape.
  - content.tex:19320, outside this slice, cites the deleted name too.
- **Fix:** name `conv_back_bridge`, state it as shape-general for odd kernels, and rewrite the caveat (the printed example is 1→2 at 4×4; the bridge is general).

### content.tex:3995–3996, also 3282–3284 and 3303–3307: "unconditional" / "No hypotheses"
- **Kind / severity:** overclaim, medium.
- **Says:** "The convolution bridge is unconditional." The input-VJP theorem says the backward "is the reversed-kernel convolution. No hypotheses."
- **Actually:**
  - `conv_back_bridge` takes `hkH : 2*((kH-1)/2)+1 = kH` and the matching `hkW`. IRPrint.lean:426 says the same: it takes "the two oddness hypotheses".
  - `conv2dHasVJP3`'s backward is `conv2dInputGradFormula`, a direct sum (CNN.lean:233).
  - That sum equals the reversed-kernel convolution only for odd kernels. Proof step 1's "under the substitution k_h ↔ k_H−1−k_h" is likewise odd-only.
- **Fix:** say it holds at every input, for odd kernel sizes.

### content.tex:3463–3466: the pdiv-derived max-pool backward
- **Kind / severity:** math, medium.
- **Says:** "at a window with a strict maximum the cotangent goes to that cell, and at a tied window it is zero".
- **Actually:**
  - `pdiv f x i j := fderiv ℝ f x (basisVec i) j` (Tensor.lean:101) is the derivative of the whole flattened map.
  - If any window anywhere ties, `maxPool2` is not differentiable at x. `fderiv` then returns Mathlib's junk 0, and the entire backward is zero, strict windows included.
  - Real MNIST post-ReLU activations nearly always contain an all-zero window, so on real inputs this backward is zero everywhere.
  - The Lean docstring (CNN.lean ~777) has the same per-window misreading.
- **Fix:** say the per-window routing holds only where every window has a strict maximum; at any tie the whole backward is zero.

### content.tex:3985–3991: "whole CNN backward is covered, op by op … exactly as in Chapter 2"
- **Kind / severity:** overclaim, medium.
- **Actually:**
  - The CnnFold module docstring, Scope section (CnnFold.lean:47–60), says the chain cotangents "are not pinned to the emitted `selectPos`/`dotOut`/`convBack`/`maxPoolBack` SHlo subgraph (as `MlpFold.cot0_den`/`cot1_den` do for the MLP)".
  - The capstone's preamble adds: "the correspondence between the hand-written conv-backward SSA values and `cnnChainCotW1/W2` is the per-op trust".
- **Fix:** state the gap. Each op type has a bridge, but the composed CNN chain is tied to IR `Back`/`Back3` denotations, not to the emitted subgraph as the MLP's is.

### content.tex:4012–4013: "the first whole-network theorem with a hypothesis in it"
- **Kind / severity:** inconsistency, medium.
- **Actually:** Chapter 2's "MLP VJP at smooth inputs" (`mlpHasVJPAt_correct`, around content.tex:2492–2505) already assumes `h_smooth_0` and `h_smooth_1`.
- **Fix:** "the first whose hypothesis can fail on a positive-measure set / that real data violates".

### content.tex:3287–3343, 3365–3411, 3424–3448: the three conv proof sketches are stale
- **Kind / severity:** stale, medium.
- **Says:** sum rule, finite-sum rule ×3, product rule (`pdiv_mul`), reindex, and `Finset.sum_eq_single` ×3.
- **Actually:**
  - Commit 998f2c70 (2026-09-18, "pdiv_of_affine … −2.4k lines") rewrote `conv2dHasVJP3`, `conv2dWeightGradHasVJP` and `conv2dBiasGradHasVJP` (CNN.lean:230, 619, 692).
  - They now go through `pdiv_of_affine` (Tensor.lean:254) plus `padTap_indicator`, `sum_fin_ite_add_eq`, `sum_finProdFinEquiv₃` and `sum_ite_eq'`.
  - None of the cited rules or `sum_eq_single` appears in these proofs, and the book never names `pdiv_of_affine`.
- **Fix:** rewrite the sketches around "affine in v ⇒ `pdiv_of_affine` reads entries off a basis vector". It is worth checking whether the Chapter 1 dense sketches (ax:pdiv_dense, ax:pdiv_dense_W) went stale in the same commit; this chapter's sketch says it reuses them.

### content.tex:3033 and 3035: transcript compile times
- **Kind / severity:** wrong-number, medium.
- **Says:** 2566 ms and 210 ms.
- **Actually:**
  - runs/2026-09-01-cnn-verified-xla-cuda/cnn-verified-xla.log says "in 2700 ms" and "in 402 ms".
  - The log has not changed since 8ce7a1a8, the commit that wrote 2566/210 and claimed "byte-verified".
  - Every other transcript line matches byte-for-byte. "2566 ms" appears only in n30/mlp_s21.log.
- **Fix:** 2700 and 402.

### content.tex:3062–3064: "from the same seed … between 92.5 and 94.8%"
- **Kind / severity:** lead, low.
- **Actually:**
  - No same-seed repeat artifact exists.
  - runs/2026-09-01-mnist-n30 is 30 different seeds (PLATFORMS.md says "(30 seeds)"); its epoch-1 range is 91.98–96.42.
  - The one same-seed pair I found: seed 1 gave 92.95 in the canonical run and 94.04 in n30/cnn_s1.
- **Fix:** cite the source of 92.5–94.8, or restate from these artifacts.

### content.tex:3600–3601: "Witness: a trained reduced-width network and a real MNIST test image"
- **Kind / severity:** overclaim, low.
- **Actually** (Trained/CnnDescent.lean docstring):
  - The input is 12×12 (24×24 crop with 2×2 block sums), with 2 channels, a bias-free conv1 and an 8-wide head.
  - lr is 2⁻⁴², and the theorem instantiated is the exact-gradient `cnn_conv2_exact_sgd_descends`.
  - It covers the conv2 rung only, and the file says the decrease is "not shown positive".
- **Fix:** say all of that.

### content.tex:3138–3147 and 3158–3161: conv formula and "centered"
- **Kind / severity:** math, low.
- **Actually:** the formula x_{i+k_h, j+k_w} has no −p padding offset, so its window is anchored at (i, j), not centered. Definition ax:conv2d and the Lean `conv2d` (CNN.lean:117) are SAME-padded, x[h+kh−p]. The backward formula at 3179–3185 inherits the missing p.
- **Fix:** add −p (and +p in the backward), or drop "centered".

### content.tex:3215–3216: "same convention as ReLU's kink"
- **Kind / severity:** inconsistency, low.
- **Actually:** ReLU's kink gets `compare GT`, which zeroes the gradient (cnn_train_step.mlir:57–61). A pool tie gets `select_and_scatter` with GE, which sends the whole cotangent to the first maximal cell (lines 67–74). These are different conventions.

### content.tex:3724–3731: "%loss … the one line"
- **Kind / severity:** overclaim, low.
- **Actually:**
  - The report-only %loss is a 12-op block (cnn_train_step.mlir:160–172).
  - "CnnFold proves … the certified … loss-descent step" overstates it. `cnn_train_step_tied_certified` proves θ − lr·(certified VJP · chain cotangent).
  - The loss gradient is `cnn_net_lossGrad`, and descent is a separate theorem.

### content.tex:3954: "reversed-kernel identity that `mnistCnnNoBnHasVJPAt` only asserts"
- **Kind / severity:** low.
- **Actually:** it neither asserts nor uses that identity. It composes `conv2dHasVJP3`'s proved direct-sum backward.

### content.tex:3928: "IR-level chain rule `vjpCompAt`"
- **Kind / severity:** low.
- **Actually:** `vjpCompAt` lives in Foundation/Tensor.lean:508, not in `Proofs.IR`.

### content.tex:3962–3976: the MLIR listing
- **Kind / severity:** low.
- **Actually:**
  - `convOp` (IRPrint.lean:368–375) also emits `{batch_group_count = 1 : i64, feature_group_count = 1 : i64}`, and `convBackModule` wraps the function in `module @m`.
  - `convBackModule` is a fixed template, which doesn't fit "the printer walks the graph" (3956).
- **Fix:** add the attribute line or mark the listing "abridged".

### content.tex:3670–3698: the listing presented as "the spec §3.1 actually ran"
- **Kind / severity:** low.
- **Actually:**
  - The real file (apps/mnist/MainMnistCnnVerified.lean) starts with `module` / `public import` / `@[expose] public section`.
  - The blurb is a single line (NetsCore.lean:158). The book splits the string literal across two lines, which in Lean would embed a newline in the banner.

### Other low findings
- **3756:** "Pooling and flattening are pure reshapes": `maxPool2` is a max reduction (CNN.lean:748).
- **3713:** "`.conv2d`": the constructor is `.conv`.
- **3882:** the CNN grid tsvs come from 8620eb80 (2026-08-11) at 10 epochs; `mnist-cnn-grid` still defaults to 10 (MainMnistCnnGrid.lean:51), while the MLP grid defaults to 12. The d=512 grid median is 98.49 vs the 98.78 30-run median. Add "10 epochs" to the caption.
- **3887–3893:** d=512 has two low runs (96.66 and 97.94), not "one falls away".
- **3097:** the median is 98.785, which rounds to 98.79, not 98.78.
- **3829–3835 (lead):** the Chapter 4 CIFAR net flattens to 128 before a 2×512 head, so "ResNet is the first architecture without a fat head" depends on how "fat" is defined.

### Side notes outside the book
- apps/mnist/MainMnistCnnVerified.lean's docstrings say "10 epochs at batch 128" (the config says 12) and "Chapter 4" (it is Chapter 3).

## Checked and fine
- **Transcript and timings:** the transcript matches the log except the compile times. Mean epoch is 4.92 s and the total is 59 s.
- **Accuracy comparison:** 98.77% vs 97.81% is about a point.
- **Parameter counts:**
  - 3,489,130 and 669,706 (both logs), 5.2×.
  - Conv 9,568, which is 0.27%. The 6272→512 layer is 3,211,776, and the totals add up.
  - The ≈20M dense-equivalent and the 320-parameter conv are right.
- **Thirty-run figure:** the n30 dot lists match the logs exactly.
  - Stats: mean 98.73, sd 0.27, quartiles 98.72 and 98.85, trimmed sd 0.07.
  - Five-of-thirty coverage simulates to 79.9% (CNN) and 92.4% (MLP).
- **Loss figure:** both loss series and every loss-curve claim (epochs 5, 7 and 11; the 7.6× jump; best accuracy at epoch 12) are correct.
- **Grid figure:** every median and whisker matches the rep1–5 tsvs, and the MLP points match their tsv. The 8-wide head reaches 98.2% at 59,914 params, and ±0.22 is right.
- **Spec and config:** the spec fields, cnnConfig, toSpecs arms and `#guard` all match. The eleven/five/seven counts are right, and the lr is baked into the MLIR (0.00078125 = 0.1/128).
- **Lean declarations:**
  - Every `\lean{}` name exists in its stated namespace, as do convBackDenote, reverseSwap, maxpool_back_bridge, MaxPool2Smooth, vjpCompAt and cnnTrainStepText.
  - There is no `sorry` in the eight relevant files.
- **Statements vs Lean:** these match:
  - HasVJP3 and pdiv3.
  - The weight- and bias-VJP formulas.
  - The mnistCnnNoBnHasVJPAt hypotheses.
  - The hypotheses and conclusions of thm:cnn_fold, thm:cnn_loss_grad and thm:cnn_sgd_descends, including the float rung's strict pool margin.
  - MaxPool2Smooth's semantics.
- **References and commands:** all `\uses`/`\ref` labels resolve, the depgraph file exists, the download script and lake targets exist, and the ResNet-18 ≈11M and AlexNet/VGG/YOLOv1 facts are correct.

---

## Slice 06

I checked lines 4033–4789 plus the line-8 comment and found 20 problems: 1 high, 6 medium, 13 low. The harness refused to let me write `/tmp/claude-1000/-home-skoonce-lean-lean4-mlir-worker/72b5c474-dbba-4182-a591-530e6f22d959/scratchpad/findings-06.md` ("Subagents should return findings as text"), so the full report is below and that file does not exist.

The three most serious:
1. **(high, 4085–4096)** The layer the chapter calls BatchNorm takes its statistics per image, not over the batch, and the chapter never says so.
2. **(medium, 4778)** The lead-in calls the first CIFAR net "two-convolution"; the theorem right after it says four convolutions.
3. **(medium, 4054–4063)** "exists and is bounded" and "ε>0 needed to stay bounded": no theorem proves a bound, and the cited theorem only proves differentiability.

# Findings 06: content.tex 4033–4789 (Ch 4 CIFAR with BatchNorm) plus line 8

### content.tex:4085–4096 (and the chapter's framing) — the "BatchNorm" here normalizes each image's channel, not the batch
**Kind:** overclaim / inconsistency. **Severity:** high
**Says:** "BatchNorm (Ioffe & Szegedy, 2015) takes a batch of activations … Compute the batch mean … the batch variance". The bullets and theorems call the trained layer BatchNorm and talk about "BN's payoff".
**Actually:** The trained net takes its statistics per example and per channel, over the spatial cells only. The batch axis is never reduced, so the layer is InstanceNorm with a learned per-channel scale and shift.
- `verified_mlir/cifar8w_bn_mom_train_step.mlir:25,30`: `stablehlo.reduce … across dimensions = [2, 3] : (tensor<128x16x32x32xf32>) -> tensor<128x16xf32>`, then a divide by `dense<1024.0>`.
- `cifar8w_bn_fwd.mlir:15,20` does the same at eval (no running statistics), and so do the batched-family `cifar8wb_bn_*` files.
- The Lean matches the MLIR, not the prose. `Cifar8BnTie.cifar8Bn_train_step_tied_certified` takes a single `x : Tensor3` and uses `bnPerChannelTensor3`, whose statistics are over the h·w cells of one image.
- `LeanMlir/Proofs/Architectures/PerChannelBN.lean:389` says so outright: "EfficientNet uses batch-norm, not the per-example instance-norm above."
- Nothing in 4033–5470 tells the reader. The "per-example" mentions at 5186/5189/5240 are about the conv op family.

The theorems still hold, because `bnForward` works on any group of values `Vec n`. What is wrong is the prose around them, and it changes how the BN-vs-no-BN measurements should be read.
**Fix:** State it in "What BN actually is" or "Run it first". Suggested wording: "here the statistics are taken per image and per channel, over the spatial cells, which keeps every op per-example; the math is the same for any group, and Chapter 7's `bnBatchTensor4` enlarges the group to N·H·W." Or rename the layer, or re-render with batch statistics.

### content.tex:4055, 4062–4063 — "exists and is bounded" / "needs ε>0 to stay bounded (Thm bnIstdBroadcast_differentiable)"
**Kind:** overclaim / statement-mismatch. **Severity:** medium
**Actually:** `bnIstdBroadcast_differentiable` (BatchNorm.lean:526) proves only `0<ε → Differentiable`. No theorem in the chapter bounds the backward pass. The theorem also shows ε>0 is sufficient, not that it is needed; the book itself says "sufficient" correctly at 4178–4180.
**Fix:** "is differentiable everywhere once ε>0". Drop "and is bounded".

### content.tex:4054–4057, 4180–4184 — "machinery none of the previous chapters needed" / "first place beyond chain-sum-product … everything else reduces to those three rules"
**Kind:** overclaim. **Severity:** medium
**Actually:**
- Ch 1's softmaxCE_grad proof already uses `HasFDerivAt.log`, fderiv and exp (1588–1610).
- Ch 2's ReLU proof uses the "diagonal indicator CLM (reluLinearPart)" and `HasFDerivAt.congr_of_eventuallyEq` (2452–2462).
- `Foundation/Tensor.lean` has `reindexCLM` and the CLM-based `pdiv_of_affine`/`pdiv_of_linear`, which the BN affine and centering proofs themselves use.
- "Everything else reduces to those three rules" leaves out LayerNorm in ConvNeXt/ViT (the same sqrt/inverse machinery), sigmoid/swish (exp) and the log in cross-entropy.

**Fix:** "the first place the book differentiates through √ and (·)⁻¹". Drop the two absolute clauses, or list the other cases.

### content.tex:4519–4572 — the proofs of pdiv_bnAffine and pdiv_bnCentered describe a proof Lean no longer has
**Kind:** stale. **Severity:** medium
**Says:** The steps cite pdiv_add, pdiv_const, pdiv_mul, pdiv_id, pdiv_finset_sum, pdiv_reindex and Finset.sum_ite_eq.
**Actually:** Both are now one-step proofs. `pdiv_bnAffine` (BatchNorm.lean:457) applies `pdiv_of_affine`, and `pdiv_bnCentered` (:508) applies `pdiv_of_linear`. Commit 998f2c70 ("pdiv_of_affine — fourteen Jacobians of affine maps…") made the change. Neither lemma appears anywhere in the book.
4211–4213 also calls these "essentially corollaries of the dense theorems (ax:pdiv_dense)". They don't use pdiv_dense; they share pdiv_of_affine with the dense Jacobian.
**Fix:** Rewrite each proof as (1) the map is affine/linear, (2) pdiv_of_affine/pdiv_of_linear reads the Jacobian off e_i.

### content.tex:4778 — the lead-in says "two-convolution CIFAR net"; thm:cifar_fold says "the two-stage CIFAR net's four convolutions"
**Kind:** inconsistency. **Severity:** medium
**Actually:** `cifar_train_step_tied_certified` (CifarFold.lean:189) has W₁ through W₄ plus three dense layers, which is where the 14 updates come from.
**Fix:** "the two-stage (four-convolution) CIFAR net".

### content.tex:4066–4069 — "five runs … land two to three times closer together"
**Kind:** wrong-number. **Severity:** medium
**Actually:** Epoch-40 max−min over `runs/2026-09-01-cifar8w-6arm-constlr/{nobn,bn}_s1..5.log`:

| optimizer | no BN | BN | ratio |
|---|---|---|---|
| SGD | 2.70 | 1.07 | 2.5× |
| momentum | 3.31 | 0.98 | 3.4× |
| AdamW | 2.78 | 0.22 | about 13× |

The chapter's own tab:cifar_optimizers shows the same.
**Fix:** "2.5 to more than ten times closer". Or: "within about a point with BN, about three without".

### content.tex:4196–4201 — "Every production BN implementation (PyTorch, JAX, TensorFlow…) computes this exact expression … the Lean kernel … verifies we are computing the right thing at every training step"
**Kind:** overclaim. **Severity:** medium
**Actually:**
- JAX has no BN backward kernel; Flax gets the gradient by autodiff of the forward pass. PyTorch computes the mean form.
- The repo's own `bnSyncGradInput` (BatchNorm.lean:376) is the mean form, shown equal to this one by `field_simp`.
- The proof is over ℝ and happens once. The run is float32, and the ties carry "ℝ → Float32" and hand-written-backward trust (Cifar8BnStepTie.lean, Scope section).

**Fix:** "this expression or an algebraically equivalent one". Say the proof checks once, over the reals, that the formula the renderer emits is the derivative.

### content.tex:4150–4153 — the stated chain is x ↦ x² ↦ mean ↦ √(·+ε) ↦ 1/·
**Kind:** math. **Severity:** low
**Actually:** That chain differentiates 1/√(mean(x²)+ε), which gives x_i/n, not (x_i−μ)/n. The centering step is missing. Lean goes through `bnCenterCLM`, as does the book's own proof step 3.
**Fix:** x ↦ x−μ ↦ (·)² ↦ mean ↦ √(·+ε) ↦ 1/·.

### content.tex:4098–4103 — "three steps, so the chain rule gives three Jacobians … exactly that product"
**Kind:** math / inconsistency. **Severity:** low
**Actually:** Lean composes two maps, `bnAffine ∘ bnNormalize` (`bnForward_eq_compose`). Inside normalize, centering and istd combine by the product rule (`pdiv_mul`), not by chaining. The book's own "Putting it together" section says two.
**Fix:** "the chain rule joins normalize and affine, and the product rule joins centering and istd".

### content.tex:4186–4194 — "Three terms, one per forward step's indirect effect", then "n·dy: the direct effect"
**Kind:** math. **Severity:** low
**Actually:** The sentence contradicts itself. The terms are direct / through μ / through istd; the affine step contributes only the γ prefactor, not a term.
**Fix:** Reword along those lines.

### content.tex:4166 — "That istd³ is what makes the BN backward expensive"
**Kind:** lead. **Severity:** low
**Actually:** The consolidated backward that actually runs (`bnNormalizeHasVJP`, BatchNorm.lean:677) has no cube: s³(x_i−μ)(x_j−μ) = s·x̂_i·x̂_j. The real cost is the two extra per-channel reductions.

### content.tex:4053, 4079–4081 — "structurally the hardest chapter" / "ResNet-34 is the easiest chapter in the book"
**Kind:** lead. **Severity:** low
**Actually:** These are judgement calls stated as fact. Ch 5 runs about 1,900 lines and includes ResNet-50, sync-BN twins and batched ties (content.tex:381). Ch 1–2 are plausibly easier.
**Fix:** "adds no new analytic machinery".

### content.tex:4093 — "Output has unit variance"
**Kind:** math. **Severity:** low
**Actually:** The variance is σ²/(σ²+ε), which is below 1.
**Fix:** "(almost exactly) unit variance".

### content.tex:4205 — "∂(γv+β)/∂v_i = γδ_ij"
**Kind:** typo / statement-mismatch. **Severity:** low
**Actually:** The left side is missing the output index j. Also, `bnAffine` in these theorems has a single scalar γ, not per-channel parameters "broadcast across spatial dimensions"; the per-channel version is `bnPerChannelMat`.
**Fix:** ∂(γv_j+β)/∂v_i.

### content.tex:4477–4480 — the istd proof cites `fderiv_apply`
**Kind:** statement-mismatch. **Severity:** low
**Actually:** Lean uses the repo lemma `pdiv_eq_fderiv_coord` (BatchNorm.lean:610).
**Fix:** Cite that.

### content.tex:4669–4682 — thm:cifar_bn_fold
**Kind:** statement-mismatch. **Severity:** low
**Says:** The γ and β updates are typeset identically as "Σ pdiv(bn)·c", described as "the gradient of Thm bnHasVJP's forward".
**Actually:** `SgdNode.bnSgdPairTied_holds` (SgdNodes.lean:131) uses Jacobians with respect to the parameter (γ′ or β′ varied) of the per-channel `bnPerChannelFlat`, evaluated at the saved conv output v. `bnHasVJP` is the input VJP of the scalar-γ `bnForward`.
**Fix:** Subscript the parameter, and say "per-channel".

### content.tex:4752–4776 — thm:cifar8_sgd_descends
**Kind:** overclaim. **Severity:** low
**Actually:** `cifar8_lastConv_sgd_descends` is about the no-BN `cifarCnn8Forward`, one example's cross-entropy, and an η-accurate oracle gradient `gh`. In a BN chapter this is easy to misread. The hypothesis list also omits ha, hw₉/hW₉, hwa/hWa, hwb/hWb, hlr and hη (only loosely covered by "the bounds").
**Fix:** "the un-normalized net's loss on one example".

### content.tex:4733 — thm:cifar8_loss_grad's \lean{} leaves out the cross-entropy instantiations
**Kind:** statement-mismatch. **Severity:** low
**Actually:** The theorem says "Instantiated at the softmax cross-entropy", but `cifar8_net_lossGrad_CE` (Cifar8ParamGrad.lean:579) and `cifar8Bn_net_lossGrad_CE` (Cifar8BnParamGrad.lean:1230) are not listed. The parallel thm:cifar_loss_grad does list its `_CE` sibling.
**Fix:** Add both names.

### content.tex:8 — orphaned comment "% The one marker every BatchNorm pair carries until its sync-BN re-run lands."
**Kind:** stale. **Severity:** low
**Actually:** Commit 184ca7d6 added this comment above `\globalbntodo` ("[TODO: run with global BN.]"). Commit 3bc91118 removed the macro and its last use. `grep -rn "globalbntodo\|TODO: run with global BN" blueprint/` now finds nothing. The comment now sits directly above the `\depgraphlegend` comment and reads as if it describes that.
**Fix:** Delete line 8. So, on your question: no such markers remain in the book.

### content.tex:4119–4122 — the log excerpt's description of what was removed is incomplete
**Kind:** lead. **Severity:** low
**Actually:** In `runs/2026-09-01-cifar8w-bn-xla-cuda/cifar8w-bn.log`:
- "[pjrt_ffi] XLA backend" is line 6, at the start of the whole run, not with the momentum arm (whose compile lines are 391–392).
- "command buffers: enabled" (line 7) is dropped.
- The SGD arm's "done" line, interleaved at 393, is dropped.

All the numbers match the log.
**Fix:** Optionally mention the moved line.

### content.tex:4074 — path "Proofs/Architectures/BatchNorm.lean"
**Kind:** command/path. **Severity:** low
**Actually:** From the repo root it is `LeanMlir/Proofs/…`. The book uses both forms (`LeanMlir/Proofs/SpecVJP.lean` twice, the bare `Proofs/…` form four times).
**Fix:** Use the full path, or state the convention once.

## Checked and fine
- **BN backward, checked by hand:**
  - The variance divides by n (biased) in both Lean `bnVar` and the MLIR (÷1024). ε sits inside the square root in both (`rsqrt(var+1e-5)` in the MLIR).
  - ∂(x_j−μ)/∂x_i = δ_ij−1/n.
  - ∂istd/∂x_i = −s³(x_i−μ)/n.
  - The Jacobian (s/n)(nδ_ij−1−x̂_i x̂_j) and the backward (s/n)(n·dx̂_i−Σdx̂−x̂_i·Σx̂·dx̂) both check out. With dx̂ = γ·dy this is the prose formula.
- The pdiv index convention (i = input, j = output; Tensor.lean:101) is used consistently.
- **All seven BN `\lean{}` declarations exist with no sorry, and their statements match the book:** pdiv_bnAffine, pdiv_bnCentered, bnIstdBroadcast_differentiable, pdiv_bnIstdBroadcast, bnNormalizeHasVJP, bnAffineHasVJP, bnHasVJP. The supporting lemmas cited in prose (pdiv_bnNormalize, bnXhat_eq_product, bnForward_eq_compose) and `emitConvBnBackward` exist.
- The istd proof sketch (centering CLM, variance derivative, HasFDerivAt.sqrt, hasDerivAt_inv, Σ(x_k−μ)=0) matches the Lean.
- **All 11 CIFAR tie and descent declarations exist in the stated namespaces with no sorry.** Parameter counts 14 / 22 / 38 are correct. The loss-gradient hypotheses (hkH, hkW, hq, hx, the pool selections, hL) match.
- **Commands:** `lake exe cache get`, `download_cifar.sh` (about 170 MB), `lake build cifar8w-bn-ablation` (lakefile:516), the binary's default `data` argument and default XLA lowerer, and `lake run cifar` = the two binaries all check out.
- **Log excerpt:** every number in it (compile ms, 117 outputs, all nine epoch lines, CIs) matches the log. RTX 4060 Ti on CUDA 12.9 is confirmed.
- **Timing:** about 13 min and about 6 s per epoch agree with timing.txt (wall time 757 s for 120 epochs).
- **Five-run claims:** the momentum runs land at 75.75–76.73, matching "75.8–76.7". The "fewer epochs" claim holds: 72% at epoch 8 with BN versus epochs 25/33 without.
- **Cross-references and externals:** the ch3 2×512 head, the 128→512→512→10 head, all `\ref` targets, figures/depgraph/ch4.tex, and Ioffe & Szegedy 2015 are correct.

Tally: 1 high, 6 medium, 13 low (20 findings).

---

## Slice 07

I couldn't write findings-07.md: the harness refused the Write ("Subagents should return findings as text"), so the full findings file is below. Please save it to /tmp/claude-1000/-home-skoonce-lean-lean4-mlir-worker/72b5c474-dbba-4182-a591-530e6f22d959/scratchpad/findings-07.md.

**Counts:** 25 findings: 2 high, 6 medium, 17 low (one of the lows is a lead).

**Top 3:**
1. **l.4847:** the book says every run is "the same command at the same seed". Actually `seed_sweep.sh` sets a different `LEAN_MLIR_SEED` per run, which moves the init, shuffle and flips, and the step-0 losses differ by seed.
2. **l.4999–5005 and the whole section:** the CIFAR "BatchNorm" is per-example, per-channel normalization (InstanceNorm-style). The graph reduces over dims [2,3] only, `runningBN` is false, and `bnChannels` is empty. So the sentence about running stats threaded through `bnChannels` is false for this net, and the book never tells the reader this isn't batch statistics.
3. **l.5149:** "the binary32 SGD step provably decreases the loss" overclaims. The CIFAR-8 descent theorem covers one step at the last conv, no-BN net only, with an abstract η-accurate gradient. The binary32 form is proved only for the MNIST CNN.

All table cells, curve points, medians, ranges and deltas were recomputed from the logs and are correct, apart from the 76.35 → 76.3 rounding.

---

# Findings 07: content.tex 4790–5469 (Ch 4: training dynamics on CIFAR, MLIR: BatchNorm, Recap)

### content.tex:4845–4851, 5101 — The "same seed" claim is false: the five runs use five different seeds
**Kind:** wrong-number / inconsistency
**Severity:** high
**Says:** "Every accuracy in this section is therefore the median of five independent runs of the same command at the same seed" (justified by XLA picking conv algorithms per process).
**Actually:**
- `scripts/sweeps/seed_sweep.sh:155` sets `LEAN_MLIR_SEED="$seed"`. Per `LeanMlir/Train.lean:651`, that variable "moves the He-init, the per-epoch shuffle and the augmentation draws".
- The step-0 losses differ by seed: `6arm-constlr/bn_s1` 2.412922, `bn_s2` 2.391508, `bn_s3` 2.370763.
- `bnprec-seeds` s2 and s3 reproduce 2.391508 and 2.370763 exactly, so the seed sets the init and data order, not XLA.
- The section contradicts itself: `tab:cifar_bf16` says "per seed" and l.5205 says "five seeds".

**Fix:** "median of five runs at seeds 1–5 (`LEAN_MLIR_SEED`: init, shuffle, flips)". The spread is seed-to-seed variance plus nondeterminism.

### content.tex:4999–5005 (and section-wide) — The "BatchNorm" here is per-example normalization, and the running-stats sentence is false for this net
**Kind:** overclaim / stale
**Severity:** high
**Says:** "the running mean and variance … are threaded separately through `bnChannels`". The section also calls the layer BatchNorm throughout and explains it with Ioffe & Szegedy's covariate shift.
**Actually:**
- `cifar8wBnVerified` leaves `runningBN` false. `Spec.lean:303-306` says it is "Off … for the per-example-BN CIFAR-8 renders, whose BN keeps no running statistics", so `bnChannels` is `#[]`.
- `verified_mlir/cifar8w_bn_fwd.mlir:15,20` reduces over `dimensions = [2, 3]` (`tensor<128x16x32x32> -> tensor<128x16>`): per example, per channel.
- `apps/cifar/MainCifar8WideBnAblation.lean` says "Per-channel BN is per-example ⇒ train=eval".
- So this is InstanceNorm-style normalization, while the chapter intro (l.4083ff) describes batch mean and variance. Nothing in the slice tells the reader.

**Fix:** State that the CIFAR nets normalize per example over H×W, with no batch statistics, no running stats, and train = eval. Reword the `bnChannels` sentence and qualify the BN findings.

### content.tex:4983 — "That spread is about a point"
**Kind:** inconsistency
**Severity:** medium
**Says:** "That spread is about a point".
**Actually:** The no-BN ranges are 2.70, 3.31 and 2.78 (the book itself says 2.7–3.3 at l.4818 and l.5121). Only the BN ranges are about 1 (1.07, 0.98, 0.22).
**Fix:** "about a point with BN, about three without".

### content.tex:4823–4827 — "The optimizer moves the ceiling most … more than anything else here"
**Kind:** overclaim
**Severity:** medium
**Says:** momentum over SGD "is worth about two points … more than anything else here".
**Actually:**
- BN is worth +5.75 under SGD and +4.20 under momentum.
- Without BN, SGD to momentum is +3.40, not about two.
- About two (+1.85) holds only in the BN row.

**Fix:** Restrict the claim to the BN row and drop "more than anything else".

### content.tex:5149–5151 — "the binary32 step actually decreases the loss is itself a proved theorem"
**Kind:** overclaim
**Severity:** medium
**Actually:**
- `cifar8_lastConv_sgd_descends` (`SgdDescent/Cifar.lean:108`) covers one step on the last conv only, with seven convs frozen and many margin hypotheses.
- It is for the no-BN `cifarCnn8Forward` and uses an abstract η-accurate gradient.
- The binary32 descent is proved only for the MNIST CNN (`SgdDescent/CnnFloat.lean`, book l.3598).

**Fix:** Scope the sentence to what is proved.

### content.tex:5028–5030 — Wrong tie file
**Kind:** wrong-ref
**Severity:** medium
**Says:** `Proofs/Nets/Small/Cifar8BnStepTie.lean` "carries that through to the emitted training step".
**Actually:** That file's header says "**Not the trained artifact.** … `cifar8w_bn_*` arms … are tied in `Cifar8BnTieG.cifar8Bn_train_step_tiedG`" (lines 19-21). It ties the narrow `cifar8_bn` step.
**Fix:** Cite `Cifar8BnStepTieG.lean` / `thm:cifar8_step_tieG`, and note that the optimizer update is outside that statement.

### content.tex:5012–5016 — The `#guard` doesn't compare against the render
**Kind:** overclaim
**Severity:** medium
**Says:** the `#guard` "pins that layout against the one the renderer emits, so a spec that drifts from its render fails the build".
**Actually:** `NetsCore.lean:368` compares `toSpecs` to a hand-written literal array. Nothing in it reads the renderer's output.
**Fix:** Say "against a literal copied from the render's signature", or cite the real spec-vs-render gate if one exists.

### content.tex:5251–5255 — fp8 description is wrong for the arm in the cited run directory
**Kind:** inconsistency / stale
**Severity:** medium
**Says:** fp8 "render rounds the forward convolutions only … a lowering probe rather than a trainable arm … a comparison that was never run".
**Actually:**
- The cited `runs/2026-09-01-cifar8w-6arm-constlr/` contains `fp8_s1..s5.log`: trained, 40 epochs, 5 seeds × 3 optimizers. Medians: SGD 71.24, mom 73.42, AdamW 73.03.
- That arm is `cifar8w-fp8-ablation`, which is host-side E4M3 on weights and input with an f32 graph, so it affects forward and backward (`apps/ablation/MainCifar8WideFp8Ablation.lean:15`).
- The "forward-convs-only" render is a different artifact, the narrow `cifar8b_fp8_adam_train_step.mlir` (`CnnRender.lean:698`, `convF8`).

**Fix:** Describe the fp8 arm accurately and give the real reason for leaving it out.

### content.tex:4834–4836 — "leaves the optimizer ordering exactly where it was"
**Kind:** overclaim
**Severity:** low
**Actually:** fp32 medians are mom 76.72 > AdamW 74.48 > SGD 74.39; bf16 medians are mom 76.70 > SGD 74.70 > AdamW 74.15. SGD and AdamW swap places, within noise, but "exactly" is false.
**Fix:** "momentum stays on top; SGD and AdamW stay level, within noise".

### content.tex:4834, 5191–5197 — Only the convolutions are bf16
**Kind:** overclaim
**Severity:** low
**Says:** "Recomputing the normalized ladder in bf16"; "low precision through the convolutions and the dense layers".
**Actually:** In `cifar8wb_bn_bf16sgd_train_step.mlir`, all 9 `dot_general`s are f32 (e.g. line 325). Only the 23 convolutions are bf16.
**Fix:** "the ladder's convolutions in bf16 (dense head, BN and optimizer stay f32)".

### content.tex:5068–5070 — "roughly ten epochs behind"
**Kind:** wrong-number
**Severity:** low
**Actually:**
- No-BN reaches ~58% six epochs after BN (epoch 10 vs 4).
- It reaches ~64% eleven epochs after (16 vs 5).
- It reaches ~68% eighteen epochs after (26 vs 8).
- It never reaches BN's epoch-10 70.38 (its maximum is 70.15).

**Fix:** "falls further behind as it goes".

### content.tex:5124–5129 — "the next epoch's loss came back finite"
**Kind:** wrong-number
**Severity:** low
**Actually:** `nobn_s4` AdamW has NaN at epochs 39 and 40 and ends on a NaN epoch. (The 3-of-5 count is right.)
**Fix:** Reword so it doesn't claim every NaN epoch was followed by a finite one.

### content.tex:5092–5096 — "gap is wider than the spread within any cell"
**Kind:** overclaim
**Severity:** low
**Actually:** The gaps are 1.85 and 2.06, but the no-BN cells spread 2.7–3.3.
**Fix:** "any BN cell".

### content.tex:5088, 5093 — Inconsistent rounding
**Kind:** wrong-number
**Severity:** low
**Actually:** The medians are 76.35 (shown as 76.3) and 72.15 (shown as 72.2). These are half-way cases rounded in opposite directions.
**Fix:** Use 76.4, or show two decimals.

### content.tex:5359–5363 — Collapse cause stated as fact
**Kind:** overclaim
**Severity:** low
**Says:** a longer momentum step "is also what let one low-precision momentum run collapse".
**Actually:** The evidence is a single seed (`bf16_s1`, 10.00%), and nothing in the runs isolates step length as the cause.
**Fix:** Hedge the claim.

### content.tex:4838–4842 — "it is fragile in fp32 too"
**Kind:** overclaim
**Severity:** low
**Actually:** No fp32 no-BN run diverges at the constant rate (0/15). The only fp32 symptom is wider spread.
**Fix:** "less repeatable in fp32 too".

### content.tex:4973–4975 — "Every run below shares one proof-rendered backward pass"
**Kind:** inconsistency
**Severity:** low
**Actually:**
- Lever 3 uses the batched `cifar8wb_bn` render, which by itself moves no-BN results by about +2.
- The head-width sweep uses per-width renders under cosine with warmup for 25 epochs, as single runs (not medians of five).

**Fix:** Scope the sentence to Levers 1–2.

### content.tex:5424–5428, 5455–5458 — "very same emitted graph" in residual/depthwise/ConvNeXt; ConvNeXt/attention "add no normalization proof of their own"
**Kind:** overclaim
**Severity:** low
**Actually:**
- `bn_back_bridge` (`Proofs/Foundation/IR.lean:424`) is about a scalar-γ `Back` term.
- The trained nets emit BN through `bnPerChannelBack`.
- The later chapters do carry `layerNormPerTokenHasVJPMat` (l.13043) and the vector-γ `layerNormVecHasVJP` (l.13061).

**Fix:** "the same three-term formula", and "no new normalization analysis".

### content.tex:5408–5409, 5384 — "The bridge theorem is precisely the claim that this text computes…"
**Kind:** overclaim
**Severity:** low
**Actually:** The bridge is about the IR term `bnNormalizeBackOf`. The listing is printed by the hand-written string function `bnBackModule` (`IRPrint.lean:673`), and no theorem links the string to the term.
**Fix:** "the IR term this text is printed from"; the printing step is trusted.

### content.tex:5450 — Recap "with descent at the last convolution"
**Kind:** overclaim
**Severity:** low
**Actually:** `cifar8_lastConv_sgd_descends` covers the no-BN net only.
**Fix:** "for the net without BN".

### content.tex:5462–5464 — Recap overgeneralizes
**Kind:** overclaim
**Severity:** low
**Says:** "number format is not measurable against seed noise"; "Eight is also about where a plain stack stops helping".
**Actually:** The first holds only on the normalized net; without BN, bf16 moves SGD by −1.40 and collapses a seed. The chapter has no depth sweep to support the second.
**Fix:** Add "on the normalized net", and drop or support the depth sentence.

### content.tex:4793–4797 — "keeps that exact head"
**Kind:** inconsistency
**Severity:** low
**Actually:** The MNIST head's first layer is `dense 6272 512` (`NetsCore.lean:157`); here it is 128→512. The book admits this at l.4859.
**Fix:** "keeps that head's 512→512→10 shape".

### content.tex:5039–5041 — "a schedule is a fourth thing changing and this section is about the third"
**Kind:** typo/render
**Severity:** low
**Actually:** This is Lever 1 (normalization), not the third lever, and it is unclear which three things are meant.
**Fix:** Reword.

### content.tex:5366 — "every image architecture since 2015 bakes a normalization layer in"
**Kind:** external-fact
**Severity:** low
**Actually:** SqueezeNet (2016) and NFNets (2021) are exceptions.
**Fix:** "nearly every".

### content.tex:5175 — bf16 "roughly three significant decimal digits"
**Kind:** external-fact
**Severity:** low
**Actually:** An 8-bit significand gives about 2.4 decimal digits.
**Fix:** "two to three".

### content.tex:5048 — "each at its own tuned learning rate"
**Kind:** lead
**Severity:** low
**Actually:** The rates are hard-coded in `MainCifar8WideBnAblation.lean`. I found no lr-tuning run for the wide net in `runs/`.
**Fix:** Cite the tuning, or say "conventional".

## Checked and fine
- Figure `fig:cifar_bn_curves`: all 80 coordinates equal the per-epoch medians of `6arm-constlr` SGD. The final spreads 74.1–75.2 and 68.0–70.7 are right.
- 41% vs 13% at epoch 1; BN ahead at every epoch; final 74.5 vs 68.8 = +5.8.
- `tab:cifar_optimizers`: all medians and ranges correct, except the 76.35 rounding. Hyperparameters match the app and the logs. BN deltas +5.8, +4.2 and +1.5 are right.
- NaN in 3 of 5 no-BN AdamW seeds. The report-only loss is `log(softmax)·onehot` without an LSE guard (`cifar8w_adam_train_step.mlir:161-168`), and the gradient path takes no log.
- `tab:cifar_bf16`: all 30 cells and 6 medians match `bnprec-seeds/sweep.log`. Deltas +0.31, −0.02 and −0.33 and fp32 ranges 1.89, 0.75 and 1.18 are right. 0 NaN, none collapsed.
- No-BN precision deltas −1.40, −0.56 and −0.09, with one bf16 momentum seed at 10.00%.
- Op-family deltas: +2.0 and +1.7 without BN; −0.11, +0.37 and +0.19 with BN.
- 23 bf16 convs (8 forward, 8 weight-gradient, 7 input-gradient). BN stays f32.
- Spec listings match `NetsCore.lean:318,353`. The `bnPerChannel` arm matches `Spec.lean:240`.
- Parameter counts:
  - 2×512 head: 333,834. Whole net: 373,626, or 374,010 with BN.
  - 64-wide head: 13,066. Whole net: 52,858, or 53,242 with BN.
  - Ratios: 25× and 7×.
  - d=4096 classifier: 17.35M. 4096/32 = 128×.
- Head-width figure: all 10 points and 20 whiskers match `results.tsv`.
  - Plateau and interval claims are right.
  - Final train loss 0.39 vs 0.52.
  - 22-minute run on 3 cards.
  - Wall clock 9.3×.
  - d=512 is within 0.20 of the AdamW cell.
- Lean declarations, exes and `verified_mlir` files all exist. `cifarCnnBn8HasVJPAt` is generic in d1.
- The Nesterov formula matches `momParam`.
- The BN backward MLIR listing matches `bnBackModule 2 4`; the three-term formula and the γ-folding are correct.
- `layernorm_back_bridge` is literally `bn_back_bridge`.
- All `\ref` labels resolve.
- Santurkar 2018 and Ioffe & Szegedy 2015 are correctly attributed.

---

## Slice 08

I couldn't save findings-08.md: the Write tool refused it ("Subagents should return findings as text"), so the full findings are below instead of in a file. I made no repo edits.

**Counts:** 1 high, 7 medium, 15 low (23 findings, 2 of them leads).

**Top 3:**
1. **6218–6224, label-smoothing floor is wrong (high).** The formula −0.9 log 0.9 − 0.1 log(0.1/9) actually equals 0.545, not 0.485. The code's smoothing is (1−α)t + α/K (`SmoothedLossCot.lean:108-110`), which gives targets of 0.91 and 0.01, so the real floor is 0.500. The logged final loss of 0.502 sits right on it. The same error is at 6352–6356 (also gives a ε/(K−1) convention the code doesn't use) and at 8385.
2. **6060, figure draws the stem max-pool as 2×2 (medium).** The net uses `.maxPool 3 2`, a 3×3 stride-2 overlapping pool (`NetsCore.lean:408`).
3. **5476–5485 and 5726–5728, gradient claims (medium).** The intro blames depth degradation on "gradient flow", but He et al. §4.1 explicitly rule out vanishing gradients (BN, "healthy norms"). The proof's "the gradient floor that makes ResNets trainable" contradicts the `residualHasVJP` docstring: "the two terms can still cancel; no lower bound on dx is claimed".

---

# Findings 08: content.tex 5470–6296

### 6218–6224: label-smoothing floor formula and value wrong
- **Kind / severity:** math, high.
- **Says:** "$-0.9\log0.9 - 0.1\log(0.1/9)\approx0.485$".
- **Actually:** That expression is 0.5448. The code's target is (1−α)t+α/K (`LeanMlir/Proofs/Foundation/SmoothedLossCot.lean:108-110`), i.e. 0.91 and 0.01, whose entropy is 0.5003. The log's epoch-80 loss is 0.502085 (`full_s2.log:666`). The same errors appear at 6352–6356 (ε/(K−1) convention) and 8385.
- **Fix:** "target 0.91/0.01, minimum CE ≈ 0.500; the final 0.502 sits on that floor." Fix 6352–6356 and 8385 to match.

### 6060: figure shows maxPool 2×2
- **Kind / severity:** inconsistency, medium.
- **Actually:** The spec uses `.maxPool 3 2`, 3×3 stride-2 overlapping (`NetsCore.lean:408`). The run banner and the conventions table in `ResNet34StepTieB.lean` say "not 2×2".
- **Fix:** "maxPool 3×3, /2".

### 5634–5636: "Each stage starts with a stride-2 downsample"
- **Kind / severity:** wrong-number, medium.
- **Actually:** Stage 1 is `.residualStage 64 64 3 1`: stride 1, no downsample. Only stages 2–4 downsample.
- **Fix:** "Stages 2–4 each open with a stride-2 projection block; stage 1 stays at 56×56."

### 5651–5654: "The stem is one big conv that gets us from 224×224 to 56×56 in a single step"
- **Kind / severity:** inconsistency, medium.
- **Actually:** The conv takes 224→112 and the max-pool takes 112→56. The book's own listing comments say so.
- **Fix:** "a 7×7/s2 conv plus a /2 max-pool take 224 to 56".

### 5476–5485 (also 6280–6282): degradation attributed to "gradient flow"
- **Kind / severity:** external-fact, medium.
- **Actually:** He et al. (arXiv:1512.03385 §4.1): "unlikely to be caused by vanishing gradients… backward propagated gradients exhibit healthy norms with BN". They conjecture slow convergence instead.
- **Fix:** Say the deeper plain net was harder to optimize, and that it was not vanishing gradients.

### 5726–5728: "the gradient floor that makes ResNets trainable"
- **Kind / severity:** overclaim, medium.
- **Actually:** The `residualHasVJP` docstring (`Residual.lean:57-60`) says "the two terms can still cancel; no lower bound on dx is claimed". 6280–6282 ("gradient survives… instead of attenuating away") is a milder version.
- **Fix:** "the upstream gradient reaches x directly, without passing through f's Jacobian."

### 5705–5718: ladder statement (ii) never given for ResNet-34
- **Kind / severity:** inconsistency, medium.
- **Says:** "every ImageNet chapter proves the same six statements… first time all six appear".
- **Actually:** The only "rendered backward is the VJP" theorem in the section is ResNet-50's (`thm:resnet50_whole_back`). The ResNet-34 peers exist but nothing in the book cites them: `Proofs.r34InputGradB_eq_r34B_full_vjp` (`ResNet34BackCertifiedTieB.lean:271`), `r34InputGradB_correct` (:354) and `resnet34ForwardBFull_eq_slots` (:431). Grepping content.tex for `r34InputGradB` finds nothing.
- **Fix:** Add a ResNet-34 rendered-backward theorem block citing those three.

### 5873 (trainer listing): stale `bnChannels := #[64, 64,64, ...]`
- **Kind / severity:** stale, medium.
- **Says:** "`bnChannels` drives BN statistic threading", and shows `bnChannels` as a field.
- **Actually:** `resnet34Verified` (`NetsCore.lean:399-420`) has no such field. It sets `runningBN := true`, and `bnChannels` is a derived function read off `layers` (`Verified/Spec.lean:370-371`).
- **Fix:** Show `runningBN := true` and update the header comment.

### 5741ff: ResNet-50 theorems appear before ResNet-50 is introduced
- **Kind / severity:** inconsistency, low.
- **Actually:** Six ResNet-50 theorems (161 gradients, q, BCE) come about 1,100 lines before ResNet-50 and the bottleneck block are described at 6883–6887.
- **Fix:** Add one sentence introducing them before the ladder.

### 5672–5698: hypothesis names a "ReLU of the pooled features"
- **Kind / severity:** statement-mismatch, low.
- **Says:** "no ReLU pre-activation of the stem, of any residual block or of the pooled features is zero".
- **Actually:** `R34SmoothAtB` (`ResNet34FullBVJP.lean:276-298`) has a stem clause, a pool clause and 16 block clauses. Its docstring says "The head has none (GAP and dense are smooth)".
- **Fix:** Drop "of the pooled features".

### 6232–6235: MLIR comments say "Ch. 4-5"
- **Kind / severity:** wrong-ref, low.
- **Actually:** CNN is Chapter 3 and BN is Chapter 4; ResNet-34 is Chapter 5. Both comments are affected.
- **Fix:** "Ch. 3-4".

### 5513–5517: log edits understated
- **Kind / severity:** inconsistency, low.
- **Says:** "epochs 5 through 75 are elided".
- **Actually:** Epochs 77 and 78 are also elided (`full_s2.log:642-651`). Also removed without mention: the "════ resnet34 ablation — arm `full` (fp32) ════" header, the BN "decay 0.990000…" line, the per-step "step k/295" lines and the ptxas warnings.
- **Fix:** List all of these removals, or show epochs 76–80 in full.

### 5658–5667: GAP savings numbers
- **Kind / severity:** wrong-number, low.
- **Says:** the CIFAR 128→512 layer "held most of the network's parameters"; the alternative was a "~200M-parameter AlexNet-era spec".
- **Actually:** 128·512 = 65.5k of about 370k parameters, roughly 18%; the 512→512 layer holds most. A flatten of 25,088 features into a VGG/AlexNet head (4096, 4096, 10) adds about 120M, for about 141M total. With the book's own 2×512 head it is about 34M. Neither is ~200M (AlexNet is about 61M).
- **Fix:** Say "dense head", and "~140M VGG-style".

### 5627: "ResNet-34 (the smallest 'deep' variant in the original paper)"
- **Kind / severity:** external-fact, low.
- **Actually:** ResNet-18 is in He et al. Table 1, so ResNet-34 is not the smallest.
- **Fix:** "the deepest basic-block variant, and the one used for the plain-vs-residual comparison".

### 5584–5592: "with randomly-small f, each block is approximately the identity"
- **Kind / severity:** overclaim, low.
- **Actually:** This net uses He init with BN γ = 1. `zeroGammaInit` defaults to false (`Verified/Train.lean:197-208`), and no zero-γ line appears in `full_s2.log`. The post-add ReLU also makes the block non-identity. He et al. 2015 did not zero-init either.
- **Fix:** Soften the sentence.

### 5604–5606: "'18 layers is about as deep as we can go'"
- **Kind / severity:** external-fact, low.
- **Actually:** VGG-19, GoogLeNet-22 and Highway Networks (100 layers) all predate ResNet.
- **Fix:** Rephrase.

### 6188–6190: "By 2015 it [GAP] was standard equipment"
- **Kind / severity:** external-fact, low.
- **Actually:** VGG (ICLR 2015) kept three FC layers.
- **Fix:** Soften.

### 6264–6295: displayed MLIR has no bridge theorem (lead)
- **Kind / severity:** lead, low.
- **Says:** the emitted backward is "shown equal to residualHasVJPAt's backward", followed by the snippet.
- **Actually:** The snippet is IRPrint's `resBlockBackModule 2 4 4 3 3` (`IRPrint.lean:1240-1257`), written by an `#eval` to `/tmp` (:1912). Its f uses whole-tensor `renderLN`/`renderLNBack` with a scalar γ, not per-channel batch BN. I found no theorem tying this text to `residualHasVJPAt`. The bridge that exists is for the batched graph (`ResNet34BackB0.lean`). Also, "%dadd appears twice in the last two lines" is off: the last two lines are `%dx = …` and `return`.
- **Fix:** Label the snippet as illustrative and point to the batched graph's theorem.

### 5564 and 6205: "89.99 ± 0.32" without saying what ± is
- **Kind / severity:** inconsistency, low.
- **Actually:** It is the 95% CI; the sd is 0.26 (RESULTS.md).
- **Fix:** Add "(95% CI)".

### 5689ff and depgraph ch5: forward dependency on Chapter 9
- **Kind / severity:** inconsistency, low.
- **Actually:** Every ResNet theorem `\uses` `def:hasvjpmat` (content.tex:12340) and `thm:rowwiseHasVJPMat` (:12675), both in the ViT chapter. The generated graph shows "statements of ch 1, 2, 3, 4, 9".
- **Fix:** Explain the forward reference or relocate those definitions.

### 5864, 5886, 6010: `\lean{}` lists miss the loss-instantiation declarations
- **Kind / severity:** missing-decl, low.
- **Actually:** The prose claims the label-smoothed instantiations, and these exist but are unlisted: `ResNet34TieB.r34_lossCot_is_smoothedCE_grad` (`ResNet34StepTieB.lean:510`), `ResNet50TieB.r50_lossCot_is_smoothedCE_grad` (`ResNet50StepTieB.lean:593`), `ResNet50SyncTieB.r50_net_syncTiedB_smoothedCE` (`ResNet50SyncStepTieB.lean:1009`).
- **Fix:** Add them to the lists.

### 6199–6203: "That is the going rate for a scratch-trained ResNet-34" (lead)
- **Kind / severity:** lead, low.
- **Actually:** No source is given. The fast.ai Imagenette leaderboard (xresnet50) is roughly 92–95% at 80 epochs. I did not find a ResNet-34-specific baseline.
- **Fix:** Cite a baseline or soften.

### 6087–6089: inset label vs drawing
- **Kind / severity:** inconsistency, low.
- **Actually:** The inset draws a ReLU after the sum but labels the block "y = f(x) + x". The block computes relu(f(x)+x).
- **Fix:** Correct the label.

## Checked and fine
- **Citations:** He et al. 1512.03385, NIN 1312.4400 (Lin 2013), GoogLeNet 1409.4842 (Szegedy 2014) with its ~0.6% top-1 GAP gain, and option-B shortcuts are all correct.
- **Architecture numbers:**
  - Parameter count is 21,289,802, i.e. 21.3M.
  - 34 weight layers; 36 BN layers; 17,024 stat floats.
  - Gradient-node counts are 110 (ResNet-34) and 161 (ResNet-50).
- **Run log and timings:**
  - Banner, compile times, train 9469 / val 3925, and epochs 1–4, 76, 79, 80 are verbatim from `full_s2.log`.
  - 90.06% top-1 and 98.32% top-5 match.
  - Timings hold: 2813 s ≈ 47 min, about 35 s/epoch, 120 ms/step, 295 steps.
- **Ablation:** nocos −5.00 ± 2.60. It exceeds optimizer + warmup + wd + LS combined (3.53).
- **FLOPs:** a stage-1 conv is 1.16e8 MACs.
- **Commands and files:**
  - The `resnet34-verified-adam` lake target exists.
  - The download script fetches imagenette2-320 (~330 MB); the unpacked data is 2.45 GB.
  - `LEAN_MLIR_SEED=2` is set by the ablation driver.
  - The `runResnet34Adam` listing matches the source.
  - All verified_mlir artifacts named exist.
- **Lean statements:**
  - All 38+ cited declarations exist in the stated namespaces, and there is no `sorry` in `Nets/ResNet` or `Residual.lean`.
  - These statements match the book: `residualHasVJP`, the R34/R50 FullBVJP correctness theorems, `r50InputGradB_correct`, `r34_net_tiedB`, `r34_net_lossGrad`, both seals (batch 2; 0<q≤7) and `r34_net_syncTiedB`.
- **Labels:** all `\uses` and `\ref` labels in the slice resolve.
- **Chapter 4 consistency:** its constant learning rate and three optimizers on one net match the claim.

Tally: 23 findings (1 high, 7 medium, 15 low).

---

## Slice 09

I couldn't write the findings file: the Write tool refused it ("Subagents should return findings as text"). The full findings are below instead, so save them to findings-09.md if you need the file.

Tally: 3 high, 7 medium, 17 low (27 findings, 2 of them leads). Most serious:
1. The R34 pair is described as having the same data loader, but it didn't. The verified run (09-22) used TF's `sample_distorted_bounding_box`; the reference run (10-07) used torchvision's random-resized crop.
2. The label-smoothing loss floor is wrong. The book's arithmetic gives 0.545, not 0.485. The code's ε/K target gives 0.500, which is the observed floor.
3. Line 6986 quotes the reference's A3−2018 delta as +0.99. It is +0.85; +0.99 is the verified path's.

# Findings 09: content.tex 6297–7389 (Ch 5: recipe, ablation, ImageNet R34/R50, A2/A1, Recap)

### content.tex:6603–6608, 6582–6587, 6710–6713 — The R34 "matched pair" used different crop samplers
**Kind:** overclaim/stale. **Severity:** high
**Says:** "Same architecture, same recipe, same data loader, same compiler; the only difference is who wrote the StableHLO." Also: "the same shim the reference consumes … matched pair". The recipe text says "random-resized-crop through TensorFlow's sampler ($10$--$100\%$ of the image area…)".
**Actually:**
- The verified R34 run (`runs/2026-09-22-r34-syncbn-bf16-90ep`) predates `aa974a95` (2026-10-06, "torchvision's RandomResizedCrop on the torchvision-side recipes").
- It trained on the old shim: `tf.image.sample_distorted_bounding_box(min_object_covered=0.1, area_range=(0.08,1.0))` (`git show aa974a95^:jax/generated/generated_resnet34_imagenet_shim.py`:56–59).
- The reference run (`runs/2026-10-07-r34-jax-bf16-90ep`) used `_torchvision_rrc`. Its RESULTS.md says the precheck "asserts the torchvision crop".
- aa974a95 also added `pc_crop … torchvision bilinear` to `r34-default-bf16-4gpu.conf`.
- So the two columns trained on different crop samplers. The resize kernel may also differ.
- "10–100%" is wrong for both samplers: the area range is 8–100%, and 0.1 is `min_object_covered`.

**Fix:** Either rerun verified R34 on the current shim, or state the sampler difference. Drop "same data loader / only difference" for R34. Change "10–100%" to "8–100%" and drop "TensorFlow's sampler".

### content.tex:6355–6356 — The label-smoothing floor is computed wrong, with the wrong target form
**Kind:** math. **Severity:** high
**Says:** The target is "(ε/(K−1), …, 1−ε, …)" and "0.50 loss floor: −0.9 log 0.9 − 0.1 log(0.1/9) ≈ 0.485".
**Actually:**
- That expression equals 0.0948 + 0.4500 = **0.545**. No log base gives 0.485.
- The code uses Szegedy's ε/K form: `smoothTarget K α t k = (1−α)·t k + α/K` (`LeanMlir/Proofs/Foundation/SmoothedLossCot.lean`:109).
- With that form the floor is −0.91 ln 0.91 − 0.09 ln 0.01 = **0.500**. That matches the observed floor (`full_s1.log`: loss=0.5026).
- The same 0.485 appears at lines 6221 and 8385, outside this slice.

**Fix:** Write the target as (1−ε)·onehot + ε/K and the floor as ≈0.500. Fix 6221 and 8385 too.

### content.tex:6986–6987 — The reference A3−2018 delta is quoted as +0.99; it is +0.85
**Kind:** inconsistency/stale. **Severity:** high
**Says:** (after the reference-only Fig. r50_jax_curves) "the endpoints are what the $+0.99$ is measured from."
**Actually:** On the reference it is 77.61 − 76.76 = +0.85, as the book itself says at 6939 and 7139. +0.99 is the verified path's delta, and also the old 10-07 reference pair's (`runs/2026-10-12-r50-a3-jax/RESULTS.md`).
**Fix:** "+0.85".

### content.tex:6555–6559 — The momentum/SGD conclusion contradicts its own numbers
**Kind:** overclaim/math. **Severity:** medium
**Says:** "The −2.27 charged to 'removing AdamW' is almost entirely the 10× momentum supplies for free: hold the effective step fixed and the gap closes to −1.86 ± 0.57."
**Actually:** With the step matched, 1.86 of the 2.27 (82%) remains (`runs/2026-09-12-…-fp32-seeds/RESULTS.md`). What the 10× step explains is momentum versus plain SGD, not the AdamW gap.
**Fix:** "momentum's advantage over plain SGD is its 10× step (matched, SGD is +0.40 better); the AdamW gap barely moves (−2.27 → −1.86)".

### content.tex:6574–6576 — "three times the next-largest knob" is wrong
**Kind:** wrong-number. **Severity:** medium
**Actually:** The next-largest is cosine at −5.00 (fp32) and −4.78 (bf16), so augmentation is about 1.5× it. 3× holds only against AdamW (−2.27).
**Fix:** "half again the cosine schedule's, three times the optimizer's".

### content.tex:6886–6889 vs 6937–6938 — The architecture lever is quoted as 2.7 and as 2.62
**Kind:** inconsistency/stale. **Severity:** medium
**Actually:** 76.76 − 74.14 = 2.62, which rounds to 2.6. The 2.7 looks left over from the old pair (76.95 − 74.16 = 2.79).
**Fix:** "2.6".

### content.tex:6731–6738 — The IREE/XLA one-image agreement was not measured on "this artifact"
**Kind:** stale/overclaim. **Severity:** medium
**Says:** "the IREE and XLA lowerings of this artifact scored 17,312 and 17,313 correct at epoch 5".
**Actually:** This comes from commit c332289a (2026-08-12). It was the August fp32, per-replica-BN, 30-epoch run (`runs/r34in_verified_30ep_2026-08-05/`), scored out of 49,920. It was not `resnet34in_momdp64bf16` sync-BN, and I found no IREE run of the current artifact.
**Fix:** "of the earlier fp32 render … out of 49,920", or rerun the comparison on the current artifact.

### content.tex:7297–7303, 7366 — "Soft" BCE targets contradict the 0.2 binarization
**Kind:** inconsistency. **Severity:** medium
**Says:** Label-smoothing row: "BCE over soft mixup labels already softens targets". Mixup row: "soft multi-hot targets". Loss row: "matches mixed soft targets". A1/A2 scope table: "BCE … over Mixup/CutMix soft labels".
**Actually:** The shim binarizes the targets: `to = (to > 0.2)` (`generated_resnet50_imagenet_rsbfaithful_shim.py`:554). The targets are hard multi-hot, and the book itself says "binarized at 0.2".
**Fix:** Say "binarized multi-hot". Re-justify dropping label smoothing without relying on soft labels.

### content.tex:6313–6320 — Cosine is credited as DAWNBench's winning recipe
**Kind:** external-fact. **Severity:** medium
**Actually:** The cited fast.ai post (2018-04-30) describes Smith's super-convergence (1cycle) schedule plus progressive resizing, not cosine (checked by WebFetch).
**Fix:** Separate the two claims: fast.ai won with 1cycle and progressive resizing; cosine was popularized by Bag of Tricks.

### content.tex:6597–6600 — The speed-gap explanation is wrong and points at a table without times
**Kind:** wrong-ref/inconsistency. **Severity:** medium
**Says:** bf16 "is why its column is the faster of the two in Table r34_paths".
**Actually:** Both paths are bf16 (tab:r34_pjrt and the r34_paths precision row). tab:r34_paths has no timing row.
**Fix:** Drop the clause, or give the real cause (per-step feed/overhead), and reference tab:r34_jax and tab:r34_pjrt.

### content.tex:7378–7383 — A visible bold "[TODO: …]" in the published text
**Kind:** process-narrative. **Severity:** medium
**Fix:** Remove it or turn it into prose. It also duplicates the scope table's "Still out" column.

### content.tex:7336 — BN-decay row may hide accumulation compensation on A3 (lead)
**Kind:** lead. **Severity:** low
**Actually:** The A3 reference compensates BN momentum for K=4 accumulation (`generated_resnet50_imagenet_rsbfaithful.py`:466), so "0.9 / 0.9 held equal" may not be exact. I did not check whether the verified render matches.

### content.tex:6488–6511 — The trajectory curves can't be traced to any run on disk (lead)
**Kind:** lead. **Severity:** low
**Actually:**
- AdamW's curve ending at 90.42 matches `runs/2026-09-01-r34-ablation` full.
- The momentum curve (ends 88.13) and the SGD .1 curve (ends 87.82, i.e. 3447/3925) match no log under `runs/`.
- They are not from the seed logs either: e.g. sgd10_s1 epoch 1 is 16.46, against the curve's 16.89.

**Fix:** Commit the source logs or replot from seed logs.

### content.tex:6609–6611 — The listing is presented as one file but spans two
**Kind:** command/path. **Severity:** low
**Actually:** The spec and the three `#guard`s live in `LeanMlir/Verified/NetsCore.lean`:438–464. Only the config and entry point are in `apps/imagenette/MainResnet34Imagenet.lean`.

### content.tex:6336–6342 — `TrainConfig.weightDecay` is only decoupled under Adam
**Kind:** overclaim. **Severity:** low
**Actually:** Under SGD the field is coupled L2 (`ResNet34RenderB.lean`:990–998, "COUPLED L2"), and the chapter's ImageNet recipe itself says ℓ2.
**Fix:** "decoupled under AdamW, coupled L2 under SGD".

### content.tex:6886 — "2018 recipe … unchanged" contradicts the next paragraph
**Kind:** inconsistency. **Severity:** low
**Actually:** 6899 adds two settings of its own (zero-γ, BN decay 0.9).

### content.tex:7144–7146 — The last of the "twenty-epoch windows" is ten epochs
**Kind:** wrong-number. **Severity:** low
**Actually:** The fifth window is e81–90. The values (+0.22, −0.52, −0.19, +0.07, +0.24) are recomputed and correct.

### content.tex:7147–7148 — The A3 widest gap goes the other way
**Kind:** wrong-number. **Severity:** low
**Actually:** The widest gap is 11.71 at e34 with the reference ahead (56.30 vs 44.59). The verified path's widest lead is 11.36 at e30. The run README's "widest single-epoch gap (11.36)" is also wrong.
**Fix:** "gaps of up to eleven points either way".

### content.tex:7123–7125 — "eight to nine percent" understates 2018
**Kind:** wrong-number. **Severity:** low
**Actually:** 2018 disagrees on 9.2%, A3 on 8.1% (R34: 10.8%).

### content.tex:7023–7024 — The unused fraction is 0.09%, not 0.08%
**Kind:** wrong-number. **Severity:** low
**Actually:** 1,281,167 − 625×2048 = 1,167 images, which is 0.091%. The 0.08% counts only the two dropped micro-batches.

### content.tex:6327–6331 — Goyal's warmup does not start from zero
**Kind:** external-fact. **Severity:** low
**Actually:** Goyal ramps from η to kη over 5 epochs. This repo's A3 warmup starts at 1e-4.

### content.tex:6575–6577 — "Most of what the rest of the recipe gets credit for is augmentation" is unsupported
**Kind:** overclaim. **Severity:** low
**Actually:** Leave-one-out arms can't attribute credit across components; that would need interaction arms.

### content.tex:6585–6587 — RRC, label smoothing and warmup predate the 2018 "bag of tricks"
**Kind:** external-fact. **Severity:** low
**Actually:** RRC dates to GoogLeNet (2014) and was the PyTorch example default by 2016–17 (RSB's "PyTorch" column uses it). Label smoothing is 2015/16 and warmup 2017.
**Fix:** "collected/popularized by Bag of Tricks".

### content.tex:7307–7308 — "200× stronger" weight decay compares unlike things
**Kind:** overclaim. **Severity:** low
**Actually:** The 2018 value is coupled L2 under SGD at lr 0.1; A3's is decoupled decay inside LAMB at lr 0.008. lr·λ is 1e-5 against ~1.6e-4 (before the trust ratio), about 16×.
**Fix:** "nominally 200×".

### content.tex:7388 — "a ninth of the parameters"
**Kind:** wrong-number. **Severity:** low
**Actually:** Ch 6 (line 7477) says ResNet-34 has 9.5× MobileNetV2's parameters, which is nearer a tenth. Against ResNet-50 it is about 1/7.

### content.tex:7346 — The tier-table caption says "in both precisions"
**Kind:** inconsistency. **Severity:** low
**Actually:** The table has no precision column, and the timings and confs are bf16 only.

### content.tex:6313 — "Howard et al., 2018" cites a blog post
**Kind:** external-fact. **Severity:** low
**Fix:** "(fast.ai, 2018)".

## Checked and fine

**Ablation (Imagenette)**
- Figure values match both seed RESULTS.md exactly. Full recipe 89.99±0.32 / 89.98±0.15.
- Interval cross-containment holds for all 12 checks. "Four arms resolved in both", label smoothing resolved in fp32 only, and "ten runs" all hold.
- nocos spread 82.04–86.83 (sd 1.93) and 82.60–87.90 (sd 2.18) match the original, non-`_resumed` logs.
- sgd10 − noadam = +0.403 ± 0.162, with all 5 seeds positive.
- noadam is heavy-ball at lr 0.01; sgd10 is plain SGD at 0.1.
- Imagenette 9,469 / 3,925 images; 21.29M parameters at 10 classes.

**ResNet-34 ImageNet**
- Reference: 74.14/91.83, 9.9 min/epoch, 14.8 h.
- Verified: 74.17/91.89, 15.8 min/epoch, 23.7 h.
- Wilson intervals [73.75,74.52] and [73.78,74.55]; McNemar 5,398 / 2,692 / 2,706, p = 0.86.
- Epoch table and deltas; largest swing 5.96; last-15 means within 0.013 top-1 and 0.024 top-5.

**ResNet-50 ImageNet**
- 2018: 76.76/93.39 reference (17.2 min, 25.8 h) and 77.09/93.36 verified (21.1 min, 31.6 h).
- A3: 77.61/93.61 reference (8.0 min, 13.4 h) and 78.08/93.84 verified (13.1 min, 21.9 h).
- Both McNemar results; deltas +0.85 and +0.99; A3 window averages.
- A3 epoch-1 accuracy 0.10% with a 1e-4 start (peak/80); A3 leads first at e41 and outright from e89; the ±0.37 interval.

**RSB paper and A2/A1**
- RSB Table 2 hyperparameters and A1/A2/A3 accuracies (80.4/79.8/78.1) match the book.
- A2/A1 time-table arithmetic recomputed and correct.

**Code, commands and references**
- These all exist: `clipFactor_accum`, the seven-variant optimizer tie at ~1e-7, and `pdiv_bnNormalize`.
- So do all the lake targets, job scripts and confs, and the three render files.
- All `\ref` and `\label` targets resolve, and the chapter numbering is right.
- The ten arXiv IDs are correct.

---

## Slice 10

I could not write /tmp/claude-1000/-home-skoonce-lean-lean4-mlir-worker/72b5c474-dbba-4182-a591-530e6f22d959/scratchpad/findings-10.md: the harness blocks subagents from writing report files. The full findings are below, in the brief's format, so please save them there.

**Counts:** 1 high, 4 medium, 12 low (2 of the low are leads). 17 findings total.

**Top 3:**
1. Line 7499 says the epoch-2 accuracy dip "never recurs", but the log shows the same dip at epochs 10, 12, 22 and 25, at full learning rate.
2. Lines 7517 and 8351: the run executed an older render than the 1,070,905-char artifact the chapter describes, and the 1.07 MB figure is not "from the log".
3. Line 8385: the label-smoothing floor is 0.500, not 0.485. The same wrong number is at lines 6221 and 6356.

# Findings: content.tex 7390–8443 (Ch. 6 MobileNetV2: intro, Run it first, theorems, Imagenette example, MLIR depthwise)

### content.tex:7499 — "never recurs" is false: validation accuracy collapses again at epochs 10, 12, 22 and 25

**Kind:** wrong-number / overclaim
**Severity:** high
**Says:** "Epoch 2 is worth a glance … Validation accuracy falls, from 24.1% to 17.3%, while the training loss drops … That is the warmup … It corrects itself by epoch 3 and never recurs."
**Actually:** The same log shows the same pattern (val top-1 drops sharply while train loss keeps falling) many times after warmup, at peak LR:
- epoch 9→10: 74.93% → 63.75% (loss 1.120 → 1.081)
- epoch 11→12: 73.12% → 62.19% (loss 1.059 → 1.019)
- epoch 21→22: 79.62% → 72.20%
- epoch 24→25: 81.78% → 73.99% (loss 0.796 → 0.776)
- smaller drops at 8, 19, 30, 33, 38.

Source: `runs/2026-08-12-mnv2-imagenette-xla-cuda/mnv2-imagenette-xla.log` (grep `val_acc`). Because it recurs at full learning rate, warmup alone does not explain the epoch-2 dip. The likely cause is running-stat BN eval noise.
**Fix:** Drop "and never recurs". Say instead that val accuracy swings by up to ~11 points epoch to epoch through the first ~40 epochs (BN running statistics lagging fast-moving weights) and settles only as the cosine LR decays. Either reword the warmup explanation or show one of the later dips too.

### content.tex:7517-7523 / 8351-8356 — the run executed an older render than the 1,070,905-char artifact the chapter describes and the theorems tie

**Kind:** stale
**Severity:** medium
**Says:** "That run … executed `verified_mlir/mobilenetv2_adam_train_step.mlir`, which is `pretty(provenGraph)`". Also: "From the log: 2.24M parameters, and 1.07 MB of MLIR (1 070 905 chars)".
**Actually:** The run is from 2026-08-12. After that date the file was rewritten by f4e4172e (2026-08-29, "perf(render): pointwise ops at their 4-D shape", 23,257 lines changed), b71a5968 (2026-08-29), 83e1085d and c4a8ee2c (2026-09-27).
- At f9e81447, the version the run used, the file was 1,047,308 chars. Today it is 1,070,905.
- The log has neither a parameter count nor a size line.
- The 90 ms/step was measured on the pre-perf-change render with PJRT 0.112. The ResNet-34 comparison runs (2026-09-12) used PJRT 0.114 and the post-change renderer.
**Fix:** Change "From the log" to "from the artifact" for the size bullet. Either rerun MNV2 on the current render, or say the run used the 2026-08-12 render (1.05 MB) and that the 90 vs 120 ms comparison spans a renderer change.

### content.tex:8385 — the label-smoothing floor is 0.500, not 0.485

**Kind:** math / wrong-number
**Severity:** medium
**Says:** "The label-smoothing floor at ε = 0.1 over ten classes is about 0.485"
**Actually:** The repo's smoothing is `smoothTarget K α t = (1−α)·t + α/K` (`LeanMlir/Proofs/Foundation/SmoothedLossCot.lean:109`). That gives 0.91 on the true class and 0.01 on each of the other nine. The minimum CE is the target's entropy: −0.91 ln 0.91 − 9·0.01 ln 0.01 = **0.5003**. The formula at lines 6221 and 6356, −0.9 log 0.9 − 0.1 log(0.1/9), evaluates to 0.545, so 0.485 matches neither convention. The final training loss of 0.517 sits 0.017 above the true floor.
**Fix:** "about 0.50". Also fix lines 6221 and 6356 (Ch. 5).

### content.tex:7411-7417 — which half is made cheap is backwards

**Kind:** math / overclaim
**Severity:** medium
**Says:** "only paid the full cost of one of them? The spatial mixing is locally information-rich and benefits from a real 3×3 neighborhood. The channel mixing can be approximated by a much cheaper operation."
**Actually:** A separable conv keeps the full C_in×C_out cost for channel mixing: the pointwise 1×1 is 4,096 of the 4,672 weights in the chapter's own example at line 7608. The spatial 3×3 is the part made cheap (576 weights). The chapter's own later text ("depthwise does the spatial half"; "depthwise is so cheap") contradicts this sentence.
**Fix:** "The spatial mixing can be done per channel, cheaply; the channel mixing keeps its full cost but loses the k² factor."

### content.tex:8170-8176 / 7466-7475 — the spec listing shows a `bnChannels` field that does not exist

**Kind:** stale / statement-mismatch
**Severity:** medium
**Says:** The listing has `bnChannels := #[32, 32,16, 96,96,24, ... ]  -- all 52, in order`. The prose says "only the layers list and the bnChannels that follows from it are new" and "That is the kind of detail bnChannels exists to get right … an off-by-one there misaligns every frozen statistic".
**Actually:**
- `VerifiedNetSpec` has no `bnChannels` field (`LeanMlir/Verified/Spec.lean:296-345`). `bnChannels` is a derived function read off `layers` when `runningBN` is set (Spec.lean:371).
- The real spec sets `runningBN := true` (`LeanMlir/Verified/NetsCore.lean:734`). The docstring says the layout "cannot drift from the layer list", so a hand-written off-by-one is impossible by construction.
- The listing also omits the required `blurb` field, so it would not compile as written.
**Fix:** Replace the `bnChannels := …` line with `runningBN := true  -- bnChannels (52) is read off layers`, and reword the off-by-one sentence.

### content.tex:8022-8027 — the single-device step tie is credited with a data-parallel render

**Kind:** statement-mismatch
**Severity:** low
**Says:** "(`mobilenetv2_adam_train_step.mlir` at N = 32, `mobilenetv2in_rmsdp64` at N = 64)"
**Actually:** `mobilenetv2in_rmsdp64_train_step.mlir` contains 315 `all_reduce` ops, so it is the DP render. `mnv2_net_tiedB`'s docstring says "One device … the per-replica statement is `mnv2_net_syncTiedB`" (`MobileNetV2StepTieB.lean:796-823`). The book's sync-tie theorem (line 8113) already claims rmsdp64 correctly.
**Fix:** Cite a single-device render here (`mobilenetv2in_rms64` or `adam64`), or say the DP renders are covered through `thm:mobilenetv2_sync_tie`.

### content.tex:7519-7523 — "Those per-operation theorems are unconditional"

**Kind:** overclaim
**Severity:** low
**Says:** "every BatchNorm by Theorem bnHasVJP … Those per-operation theorems are unconditional and hold at any width or depth"
**Actually:**
- `thm:bnHasVJP` assumes ε > 0 (content.tex:4554-4556).
- `depthwiseHasVJP3` is stride-1 only (`Depthwise.lean:64`). The four stride-2 depthwise convs (blocks 2, 4, 7, 14) use `decimate ∘ depthwise` with a composed VJP (`Depthwise.lean:263-293`).
**Fix:** Add the ε > 0 qualifier, and say the strided depthwise convs use it composed with the decimation VJP.

### content.tex:7685-7689 — the reversed-kernel form is stated as proved for general kernels

**Kind:** statement-mismatch
**Severity:** low
**Says:** It proves "the per-channel reversed-kernel backward dx = Σ W_{c,kH−1−kh,kW−1−kw} · dy_{c,h+kh−p,w+kw−p}", for general kH, kW and a single p.
**Actually:** The Lean backward is `depthwiseConv2dInputGradFormula`, the Σ_{ho,wo} form (`Depthwise.lean:109-141`). It equals the reversed-kernel form only for odd kernels: `depthwiseConv2d_dwReverse_eq_input_grad_formula` takes `hkH`/`hkW` oddness hypotheses (`DepthwiseBackCertifiedTie.lean:37`). The code also has separate p_H and p_W.
**Fix:** State the Σ_{h_o,w_o} form, and add "(= the reversed-kernel form for odd kernels)".

### content.tex:8438-8439 — "The depthwise convolution bridge is unconditional"

**Kind:** overclaim
**Severity:** low
**Says:** "The depthwise convolution bridge is unconditional, because it is linear."
**Actually:** All three bridge theorems in `DepthwiseBackCertifiedTie.lean:37-64` carry odd-kernel hypotheses. The bridge is also never named in the prose.
**Fix:** "unconditional for odd kernels (all MobileNetV2 kernels are 3×3)", and name `depthwiseFlatBack_eq_vjp_backward`.

### content.tex:7492-7497 — the "two epochs old" BN explanation does not match the EMA

**Kind:** math
**Severity:** low
**Says:** "the BatchNorm running statistics are two epochs old"
**Actually:** The running stats are an EMA updated every step with `bnMomentum := 0.99` (`LeanMlir/Verified/Train.lean:247, 296`). After 295 steps, anything older than one epoch keeps only about 5% of the weight (0.99^295), so the stats reflect roughly the last 100 steps.
**Fix:** "an exponential average over the last hundred or so steps of a network whose weights are moving fast".

### content.tex:7529-7531 — "from two blocks to seventeen" points back to something this chapter never shows

**Kind:** inconsistency
**Severity:** low
**Says:** "The axis that moved here was the depth, from two blocks to seventeen"
**Actually:** The two-block net is `mobilenetv2HasVJPAt` in `Nets/MobileNet/MobileNetV2.lean` (scalar-γ BN, stride 1 only). This chapter never states or cites it.
**Fix:** Name it, or drop the clause.

### content.tex:7790-7793 — the smoothness assumption described per block does not fit block 1, the stem or the head

**Kind:** statement-mismatch
**Severity:** low
**Says:** "an expand clause and a depthwise clause per block, none after the residual add [MNV2SmoothAtB]"
**Actually:** `MNV2SmoothAtB` (`MobileNetV2FullBVJP.lean:322-342`) has a stem clause, block 1 with no expand clause (t=1, `IVNoExpSmoothAtB`), blocks 2-17, and a head clause. That is 35 in all.
**Fix:** "a stem clause, a head clause, and per block a depthwise clause plus an expand clause where t ≠ 1 (35 in all)".

### content.tex:8284-8285 — the block VJP is said to compose "dense" theorems; the block contains no dense layer

**Kind:** inconsistency
**Severity:** low
**Says:** "composed with the dense, BN and biPath theorems"
**Actually:** Expand and project are 1×1 convs (`Kernel4 … 1 1`) and go through `conv2dHasVJP3` (`MobileNetV2.lean:74`), as the chapter itself says at 7516 and 7631.
**Fix:** "the conv2d (ax:conv2dHasVJP3), BN and residual theorems".

### content.tex:7439-7441 — the edits to the log excerpt go beyond what the note discloses

**Kind:** inconsistency
**Severity:** low
**Says:** "XLA's startup banner is removed, the network description line is wrapped, and the middle of the run is elided"
**Actually:** Also removed, without mention:
- the three `xla/pjrt verified_mlir/…` lines (log lines 14-16)
- the RESIDENT lines (474 tensors, 25.6 MB)
- every `step k/295` line, including those inside the epochs that are shown

There is also no `...` marker in the verbatim block between epoch 4 and epoch 79.
**Fix:** Add a `...` line and mention that the per-step and residency lines were dropped.

### content.tex:7473 / 8359-8362 — the 26 s/epoch, 90 ms/step and 47-minute figures cannot be traced to a run artifact

**Kind:** lead
**Severity:** low
**Says:** "about 26 seconds each, thirty-five minutes"; "90 ms … against ResNet-34's 120 ms … forty-seven"
**Actually:** Neither the MNV2 log nor the R34 ablation logs have per-step or per-epoch timing; only the start time is logged. The numbers are internally consistent (295 × 90 ms ≈ 26.5 s, ×80 ≈ 35 min; 295 × 120 ms × 80 ≈ 47 min), but I found no source. See also the stale-render finding above.
**Fix:** Record wall time in the run directory, or cite where the figures came from.

### content.tex:7466-7475 (code side) — the current spec blurb prints "GAP → LN → dense", but the net has no LayerNorm

**Kind:** lead
**Severity:** low
**Says:** The book's log line ends "→ GAP → dense", which matches the 2026-08-12 log.
**Actually:** The current `mobilenetv2Verified.blurb` says "→ GAP → LN → dense" (`LeanMlir/Verified/NetsCore.lean:728`), but `layers` has no LN. A reader who reruns the four commands gets a different description line from the book's, and it misdescribes the net. The bug is in the code, outside the slice.
**Fix:** Remove "→ LN" from the blurb.

### content.tex:7411-7414 — attribution of the factorization to MobileNetV1/V2

**Kind:** external-fact
**Severity:** low
**Says:** Howard 2017 and Sandler 2018 "asked: what if we factored those two responsibilities"
**Actually:** Depthwise-separable convolution predates MobileNet: Sifre & Mallat (2013/2014), and Xception (Chollet, arXiv:1610.02357). MobileNetV1 itself cites Sifre for it.
**Fix:** "building on depthwise-separable convolution (Sifre 2014; Xception 2016), …"

## Checked and fine

- The arXiv IDs 1704.04861 (Howard 2017) and 1801.04381 (Sandler 2018) and their authors are correct. The paper's optimizer is RMSProp. ReLU6 = clamp to [0,6].
- The paper's Table 2 [t,c,n,s] matches the spec and the figure: 17 blocks, depths 1,2,3,4,3,3,1, widths 16→320, 1×1 to 1280, spatial 112→7.
- The spec `layers` matches `NetsCore.lean:709-726`; the x2/x3 comments are right. The `runMobilenetV2Adam` and config listing matches the app file verbatim. The `toSpecs` arm matches `Spec.lean:244-247`.
- Parameter count recomputed from the spec: 2,236,682 (2.24M); 3,504,872 at 1000 classes. 21.29M / 2.24M = 9.5×.
- 52 BatchNorms and 34,112 stat floats both match the log. ReLU6 sites = 35. 158 emitted tensors (474 resident = 3 × 158). 210 tie slots.
- Every log line quoted (compile times, 581 outputs, train 9469 / val 3925, lr values, epochs 1-4 and 79-80) matches verbatim. 295 steps per epoch. Final 89.25 / 98.68; best epoch 89.32.
- R34: 89.99 ± 0.32. Its top-5 mean is 98.46, so +0.22 is "a fifth of a point"; the 0.74 top-1 gap is "three quarters"; the binomial 95% half-width for one run is 0.97.
- Weight arithmetic: 576 vs 36,864 (64×); separable 4,672 (≈7.9×, "eight times").
- The download script, the 330 MB archive and ~2.4 GB of .bin files, and the `mobilenetv2-verified-adam` lean_exe all check out.
- Current artifact sizes match the book: 1,070,905 / 152,793 / 120,698 chars. R34's 753,534 bytes is 754 KB. The rms render exists.
- Every `\lean{}` name exists in its stated namespace. There are no `sorry`s in Depthwise.lean or Nets/MobileNet/*. All the declarations the prose names exist, including `FwdGraphTextTies.lean`.
- The theorem hypotheses match the boxes: the full VJP (PosB + SmoothAtB, generic N and nCls), the step tie (no smoothness needed), the loss-grad theorem, the sync tie (hR, hN, hgs), and the seal (N = 2, 35 weight-only clauses).
- The depthwise weight and bias VJP formulas match the Lean. `DepthwiseKernel` is definitionally Tensor3.
- The `@dw_back` listing matches `depthwiseBackM 2 4 4 3 3` up to line wrapping. Ch. 3's `conv_back` does begin with the transpose. `feature_group_count = c` is the correct grouped-conv semantics.
- The MNV4 counts (233 gradients, 18 skip rows, 38 seal clauses) match the docstrings.
- Every `\ref` target exists and says what the prose claims. `figures/depgraph/ch6.tex` exists.

Tally: 17 findings: 1 high, 4 medium, 12 low (2 of the low are leads).

---

## Slice 11

# Findings 11 — content.tex 8444–9267 (Ch.6 ImageNet recipe, MobileNetV4 side quest, Recap)

Tally: 4 high, 10 medium, 9 low (23; incl. 1 outside-slice, 2 leads)

### content.tex:9200-9204 (tab:mnv4_paths), 9228-9230 — MNv4 reference's classifier head was fp32, not bf16
**Kind:** wrong-number / inconsistency · **Severity:** high
**Says:** Above-the-rule row "classifier head & bf16 & fp32"; "Above the rule… sit the precision of the classifier head and the depthwise initialization".
**Actually:** Commit 559a05b3 (2026-10-05, X3) set `f32StemHead := true` on the MNv4 JAX base config; `mobilenetV4ConvMImagenetConfigFull` inherits it (jax/MainMobilenetV4Imagenet.lean:95). The pair ran 2026-10-14; the trainer (`jax/generated/generated_mobilenet_v4_imagenet_full100.py` at 078ad53f) computes `x = jnp.matmul(x, params[77][0].T) + params[77][1]` in fp32, not via the bf16 `mm`/`DT` path.
**Fix:** Move "classifier head fp32 / fp32" below the rule as held-equal; prose at 9228 keeps only depthwise init as the unshared input. (MNv2 table is right — predates X3.)

### content.tex:8940-8946, 9104-9105, 9156-9158 — MNv4 prose claims the pair ran the full recipe; TODO + logs say it predates two rows
**Kind:** overclaim / inconsistency · **Severity:** high
**Says:** "`full` is that file: … drop-path 0.075 ramped as (i+3)/26 … tf-models' crop sampler with its centre-crop fallback … The pair … is that recipe with only the length cut … Everything the recipe asks of the code is exercised by it"; listing shows `dropDenom := 26`; "stochastic depth reaching the 18 skip UIBs at tf-models' ramp over its 26-entry block list".
**Actually:** TODO at 9256-9260 says the pair ran /25 and no fallback. `runs/2026-10-14-mnv4-full-e100/full.log`: "keeps #[0.988000, 0.982000, … 0.931000]"; 0.988 = 1 − 0.075·4/25 (/26 would give 0.98846). 263da67a set `dropDenom 25`; 3333bbd5 (post-run) moved it to 26.
**Fix:** Describe the recipe as run (/25, whole-image fallback); label the listing "today" or show `dropDenom := 25`; drop "Everything … is exercised".

### content.tex:9171 — `lake run mnv4-full-e100-4gpu` does not exist
**Kind:** command/path · **Severity:** high
**Actually:** lakefile.lean:2410-2423 scripts only exist for `imagenetRows` jobs; MNv4 has `mnv4-full-4gpu`; `runJobScript` would reject e100 as "not an imagenetRows entry". The run used `scripts/supervise.sh mnv4-full-e100-4gpu` (runs/2026-10-14-mnv4-full-e100/launch.sh). Conf exists.
**Fix:** Print the supervise.sh command, or add the lake script + row.

### content.tex:8505-8528 — MNv2 reference listing ("as the run below trained it") includes a post-run line
**Kind:** stale / inconsistency · **Severity:** high
**Actually:** At a611a2a4 the file has no `f32StemHead` line; added by 559a05b3 after the 2026-09-27 run. tab:mnv2_paths itself says reference head bf16.
**Fix:** Remove `f32StemHead := true` from the listing; also 8836-8837 "bf16 convolution under an fp32 classifier head" carries over — for this run the reference head was bf16.

### content.tex:8660-8662 — two-run difference compared to one run's Wilson half-width
**Kind:** math / overclaim · **Severity:** medium
**Says:** "differ by 0.51 … and 0.42 on top-5, outside the 95% Wilson interval (±0.40 …)"
**Actually:** ±0.40 is one proportion's half-width. For the difference of two independent runs, half-width ≈ √2·0.40 ≈ 0.56; 0.51 is inside, top-5 0.42 well inside. Paired McNemar impossible (no JAX bitmaps).
**Fix:** ~1.3 SE of the difference (not significant unpaired), or argue from the persistent window offset.

### content.tex:8666-8668 — "sampled accuracies stay level through epoch 100" hides a gap
**Kind:** overclaim · **Severity:** medium
**Actually:** Sampled epochs 10/50/100 happen to have verified ahead (+0.26, +0.76, +0.23), but 25-epoch window means from CSVs: −0.34 (26–50), −0.74 (51–75), −0.64 (76–100); verified run's RESULTS.md has the same table.
**Fix:** Say windows part by 0.3–0.7 from epoch 26 on.

### content.tex:8551-8555 — LR arithmetic uses stale exponent (5-epoch-warmup era)
**Kind:** math / stale · **Severity:** medium
**Says:** "0.045 × 0.98^85 ≈ 8.1×10⁻³ … past 300 … 10⁻⁵ range (0.045 × 0.98^345 ≈ 4.2×10⁻⁵ at 350)"
**Actually:** Staircase starts at step 0, no warmup. mnv2_jax_curve.csv: epoch 90 lr = 0.007453 (0.98^89), epoch 350 lr = 3.9e-05 (0.98^349). Epoch 300 = 1.1e-4; 1e-5 not until ~epoch 417.
**Fix:** "0.98^89 ≈ 7.5×10⁻³ … 0.98^349 ≈ 3.9×10⁻⁵"; "~10⁻⁴ by 300".

### content.tex:8578-8581 — "a factor of two or three" over R34 contradicts the book's own tables
**Kind:** wrong-number · **Severity:** medium
**Actually:** R34 ImageNet on same 4×3060: 9.9 min/ep (JAX), 15.8 (verified); MNv2 6.7 and 9.6 → 1.48×, 1.65×.
**Fix:** "about 1.5×", or attribute 2–3× to the small-scale §mnv2_runit measurement.

### content.tex:8734-8738 — mnv2RmsSchedule / mnv2ImagenetRmsSchedule described stale in present tense
**Kind:** stale · **Severity:** medium
**Actually:** NetsCore.lean:62 `mnv2ImagenetRmsSchedule := { lr := 0.12, decayRate := 0.98, decayEpochs := 2.5, warmup := 0, staircase := true }` is a free-standing literal, not derived from `mnv2RmsSchedule` (0.045); docstring says "Until 2026-10-12…". "the two cannot carry different values" is false today.
**Fix:** Past tense, or describe the current split.

### content.tex:9175-9176 vs tab:mnv4_paths — "the initialization is timm's" on both paths contradicts the depthwise row
**Kind:** inconsistency · **Severity:** medium
**Actually:** timm's goog init: depthwise fan-out k² → 2/k²; verified `mkParam` uses 2/(Ck²) (the table shows this).
**Fix:** "the JAX init is timm's; the verified path matches it except the depthwise kernels (√C narrower)".

### content.tex:8902 — "timm also publishes the 224 variant this book trains at"
**Kind:** stale / inconsistency · **Severity:** medium
**Actually:** Both reported MNv4 runs are the 256² paper tier; only the detuned `default` tier is 224.
**Fix:** "the book's `default` tier trains at 224; the reported paper tier at 256".

### content.tex:8904, 8913-8920 — EMA listed as part of converged recipe; RandAugment called "learned"
**Kind:** inconsistency / external-fact · **Severity:** medium
**Actually:** Table row says EMA "none"; paper Table 10 EMA "–"; 8947 "no EMA". RandAugment is not a learned policy.
**Fix:** Drop EMA from the list; "heavy learned augmentation" → "heavy random augmentation".

### content.tex:9268-9269 (Recap), 8956-8958 — "the one job … that has not [run]"
**Kind:** overclaim · **Severity:** medium
**Actually:** MNv2 TODO (8640-8655) lists the TF-slim README rerun of both halves (~49+63 h) as not run; MNv4 TODO also lists /26 ramp + crop fallback as not run.
**Fix:** Name both outstanding jobs.

### content.tex:8905 / tab:mnv4_vs_mnv2 — 9.7M is timm's count, not the paper's
**Kind:** external-fact · **Severity:** low
**Actually:** arXiv:2404.10518 Table 6: MNv4-Conv-M 79.9 top-1, 9.2M params, 1.0G MACs. 9,715,512 is timm's. MNv2 paper: 3.4M.
**Fix:** "(as built / timm; paper 9.2M)".

### content.tex:8940-8941 — "`full` is that file" vs the weight-decay mask
**Kind:** inconsistency · **Severity:** low
**Actually:** TODO (9263-9264): yaml exempts BatchNorm only; ours exempts every bias. Table row "0.1, skip norm/bias" given as the paper's recipe.
**Fix:** "except where noted"; "BN excluded" in the paper column.

### content.tex:8911 — drop-path ramp "over the 21 UIB blocks"
**Kind:** inconsistency · **Severity:** low
**Actually:** Paper tier ramps (i+3)/26 over tf-models' block list (run used /25); i/20 over 21 blocks is the 224 tier's.

### content.tex:8556-8558 — "the length Tan & Le state" (350 epochs)
**Kind:** lead · **Severity:** low
**Actually:** (not fetched) EfficientNet paper likely gives no epoch count; 350 is the TPU reference code's `train_epochs`.
**Fix:** "the length Tan & Le's reference code uses".

### content.tex:8714, 9118 — spec listings attributed to app files
**Kind:** command/path · **Severity:** low
**Actually:** `mobilenetv2ImagenetVerified` is at NetsCore.lean:757; `mnv4ImagenetVerified` + four `#guard`s at NetsCore.lean:1508-1560. "That is apps/imagenette/MainMobilenetV4Imagenet.lean" is wrong for that listing.

### content.tex:9216 — "a tenth of one run's ±0.37" fits top-1 only
**Kind:** wrong-number · **Severity:** low
**Actually:** +0.07 on top-5 ≈ 0.19 of 0.37; top-5 half-width at 93.5% is only ~±0.22.

### content.tex:8881-8883 — "to ∼10⁻⁵ in the training forward"
**Kind:** lead · **Severity:** low
**Actually:** mnv4_timm_parity.py defaults to rtol 1e-3 (lines 25, 97); no artifact recording ~1e-5 found.
**Fix:** Cite the measured value with its artifact.

### content.tex:8693-8694 — "byte-identical" BN layout
**Kind:** overclaim · **Severity:** low
**Actually:** Guard checks `bnChannels` list equality, not bytes.

### content.tex:8642 — "last 50 epochs move top-1 by 0.14"
**Kind:** wrong-number · **Severity:** low
**Actually:** Unrounded 71.486 → 71.634 = 0.148 (0.15). Optional.

### Outside slice: jax/runs/mnv2_imagenet_bf16_90ep/RESULTS.md banner stale
**Kind:** stale · **Severity:** low
**Actually:** Quotes reference "71.90% / 90.41%"; current reference 71.63 / 90.46 (runs/2026-09-27-mnv2-jax-bf16-350ep). Book doesn't cite this file.

## Checked and fine
- MNv2 JAX run 71.63/90.46, 38.8 h, 6.7 min/ep, 4×64, 5,004 steps/ep, 3,504,872 params; verified 71.12/90.04, 55.8 h, 9.6 min/ep, `rmsdp64wxdols0eps0001bf16`, eps0001 eval render, 52 BNs.
- Every point of both MNv2 figures and every cell/Δ of tab:mnv2_paths_epochs match CSVs; Wilson [71.24, 72.03] correct, contains 72.0; tail mean 71.54; 94% of final at epoch 100.
- Train-loss story (verified lower e1–25, ~+0.02 from e26, never negative).
- 2.24M Imagenette count; 6.2× and 1/6 param ratios.
- MNv2 paper / TF-slim facts: RMSProp 0.9/0.9, wd 4e-5, lr 0.045, ×0.98, 16 async workers × 96, 72.0%, lr inside momentum, 0.12 = 0.045·256/96, σ 0.09.
- MNv2 JAX listing matches a611a2a4 except `f32StemHead`; full and app now 420 epochs.
- Lake targets + `mnv2-default-4gpu` script exist; job confs exist.
- All `\ref` labels exist and match; MNv2 sync theorem covers the run's render; MNv4 sync theorem at 224 as disclosed.
- `mnv4FwdGraphBFullEval_faithful`, `mnv4FwdGraphBFullDo_faithful`, FwdGraphTextTies exist; mnv4in/mnv4in256 renders exist.
- MNv4 spec listings match NetsCore; 9,715,512 arithmetic; 21 UIBs, 18 skips, 77 BNs.
- MNv4 runs 77.39/93.46 and 77.35/93.53, 2.55 s and 214 ms/step, 22.2 h and 15.6 h (6.6 h apart), AER restart (e48, resumed from e47 after 20 s); every curve point, epoch-60 counts, last-five means, all Δs, +5.76, 2.77×, 2.5 points to 79.9.
- MNv4 paper Table 10 hyperparameters, 256px, 79.9%, four UIB instantiations, Qin et al. 2024, arXiv:2404.10518.
- 2500× wd ratio, 312 steps/ep, Imagenette ~9.5K, 17 MNv2 blocks.


---

## Slice 12

Findings 12 (content.tex 9268–10614, Ch 7 EfficientNet). The harness refused to let me write `/tmp/claude-1000/-home-skoonce-lean-lean4-mlir-worker/72b5c474-dbba-4182-a591-530e6f22d959/scratchpad/findings-12.md` ("subagents should return findings as text"), so the full report is below and the file does not exist.

Counts: 30 findings: 2 high, 10 medium, 18 low (3 of the low ones are leads).

Top 3:
1. **9311–9346, high.** The run transcript is two runs spliced together, and the directory it cites holds the other run. The epoch lines and 90.04/98.29 come from `runs/2026-10-12-enet-imagenette-d3/`. The header (PJRT 0.112, 10603/635/454 ms) comes from the cited `runs/2026-08-12-enet-imagenette-xla-cuda/`, whose log actually ends at 89.96/98.45.
2. **9945–9949, high.** "+0.71 top-1 … seven tenths" is left over from the old run. 90.04 − 89.25 = 0.79, and the chapter says "eight tenths" twice elsewhere.
3. **10539, medium.** "No gradient clipping, unlike every later recipe in this ladder" is false. ConvNeXt and all ViT ImageNet configs set `gradClipNorm := 0.0` ("official recipe does not clip"; "DeiT does NOT clip").

---

### HIGH
- **9311–9346 Spliced transcript, wrong directory.**
  - The cited `enet-imagenette-xla.log` reads: epoch 80 3531/3925 = 89.961783%, top-5 98.445860%; epochs 1–4 are 17.8/34.5/39.0/64.2; losses 0.504021/0.504361.
  - Every epoch line in the book comes from `runs/2026-10-12-enet-imagenette-d3/efficientnet-verified-adam.log`, lines 38–66 and 740–750.
  - The d3 log's header says PJRT 0.114 and 11166/717/469 ms.
  - The note says only the XLA banner, the wrapped description line and the middle were changed. It doesn't mention three dropped lines (command buffers, residency, BN decay) or the "[95% CI …]" suffix removed from every val line.
  - Fix: cite d3 and take its header lines.
- **9945 "+0.71 / seven tenths"** should be +0.79 / eight tenths. 0.71 = 89.96 − 89.25, from the superseded run.

### MEDIUM
- **9945–9948 "The cost is the two-layer MLP in every block."** I summed the SE tensors: 636,540 params. That is 0.64M of the 1.78M difference; the rest is B0's different widths, repeats and 5×5 kernels. So the gain can't be credited to SE and Swish alone.
- **9460–9476, 9707 "MobileNet-V2 with two changes", "lift is essentially SE plus Swish".**
  - B0 came from a NAS search. Its widths are 16/24/40/80/112/192/320 with repeats 1,2,2,3,3,4,1; MNV2's are 16/24/32/64/96/160/320 with repeats 1,2,3,4,3,3,1.
  - B0 also uses 5×5 depthwise kernels.
  - MNV2's activation is ReLU6, not ReLU (9466).
- **10539 grad clipping** (top 3 above).
- **9413 SE parameter formula.** The book has C²/r + C/r + C; it should be 2C²/r + C/r + C (two weight matrices).
- **10141 crop area "10–100%".**
  - TF EfficientNet uses `area_range=(0.08,1)`; the repo matches (`cropAreaMin := 0.08`, Types.lean:782).
  - The 0.1 is `min_object_covered` (`cropMinCovered`), a different parameter.
- **10052–10113 JAX listing called "its recipe as the run below trained it".**
  - The next paragraph says the run predates seven of its lines.
  - It is not today's file either: the file has `augBicubic := false` (nearest geometry) and adds `rmspropTf`, `wdDecayBiases`, `initHeadTfUniform`, `autoAugmentTf`, `augNearest`, `resizeLegacyTf1`, `evalCropTf*` and `evalF32`.
  - The listing comment "no decay on BN or biases (TF, timm)" is wrong by the repo's own commit dedb34f5: TF exempts only BN and decays biases.
- **10188, 10299–10304, 10077 recipe items credited to the paper.**
  - The paper (§5.2) has no EMA, no epoch count (350), no batch 4096 and no RMSProp ε. Those come from the TF/TPU code.
  - The paper also early-stops on a 25K minival, which the book's final-epoch comparison doesn't mention.
- **9294–9296 "three years ahead of attention's arrival in vision".** Attention was already in vision: Show-Attend-Tell 2015, STN 2015, Residual Attention 2017, Non-local 2017/18. What arrived in 2020 was the transformer (ViT).
- **9880–9884 "b1 no-expand, b2/b4/b6/b12 strided, the remaining nine residual".** 1 + 4 + 9 = 14, not 16. b9 and b16 are stride-1 blocks without a skip (EfficientNetRender/Basic.lean:294 and :422).
- **10372–10374 verified per-epoch time vs total.**
  - 11.7 min × 350 = 68.3 h, not 73.4 h.
  - RESULTS.md gives 704 s/epoch for clean epochs but 754 s = 12.6 min for the whole run; the gap is the loader defect (~4.6 h).
  - The reference "~92 ms/step" differs from its RESULTS.md, which says 94.5 ms differenced; 92 is train-only.

### LOW
- **9383 the 740 outputs.** 213×3 + 98 + loss = 738. The MLIR's result list also has the Adam bias-correction scalars `%bc1` and `%bc2`.
- **9862–9870 spec arm listing.** It shows SE kinds as 0; Spec.lean:256 now has kind 7 (`seFanOutInit`).
- **9816 and 9777 `bnChannels :=` shown as a field the spec sets.** It is derived (`VerifiedNetSpec.bnChannels`, Spec.lean:371); the spec sets `runningBN := true`. The listing also silently leaves out `dropSites/dropDenom/dropRate/dropoutKeep`.
- **9992 vs 10030 swish and sigmoid bridges.** No earlier chapter proves swish or sigmoid, and there is no swish/sigmoid theorem block in this chapter either; the two sentences ("previous chapters" vs "this chapter's") contradict each other.
  - Related, outside the slice: the table at line 383 credits ch 7 with swish, sigmoid and a representative-depth whole-net, and 5 + 4 = 9 theorems, but the chapter has 6 blocks.
- **10215 "level on top-1, within 0.03 on top-5".** It is backwards: top-5 is exactly level (93.30 vs 93.3) and top-1 is +0.05.
- **10589 EfficientNetV2 "at low resolution".** Fused-MBConv is for the early, high-resolution stages.
- **10581 EfficientDet "per-anchor MLP" head.** It has convolutional class and box networks shared across BiFPN levels.
- **9357–9362 epoch 1–4 BN explanation.** No measurement supports it, and "never recurs" is false: the d3 log dips at epochs 6, 16 and 43.
- **9942 "the one place the larger model does not win".** ResNet-34 also beats B0 on top-5 (98.46 vs 98.29).
- **10399–10411, 10122 status notes in the body.** There is a visible bold TODO with dates and ETAs, and "It will be re-run". The 67 h ETA in the conf is for 4060 Ti, while the pair ran on 3060s.
- **10319 vs 10391 two "current" renders named.** `…wxeps0001bf16` at 10319 and `emarmstf…wneps0001bf16` at 10391. The heading "known and open" then says the difference is closed.
- **9601 step-tie theorem.** The `\Assume` with `hεw` is missing; `efficientnet_net_tiedG` takes `(hεw : w.EpsPos)`.
- **10529 stochastic depth "per step".** The mask is per example.
- **10527 weight-decay row "BN and biases excluded".** TF decays biases and exempts only BN (dedb34f5; `wdDecayBiases := true`).
- **Lead, 10179 "up to ~30×".** That bound comes from ε placement alone (√ε/ε = 31.6). The zero accumulator init adds a first-step factor of about 3/|g| on top.
- **Lead, 9452 "Most post-2018 conv architectures carry SE".** It is unsourced; ConvNeXt (in this book) and RegNetX carry no SE.
- **Lead, code-side: NetsCore.lean:832.** The blurb prints "GAP → LN → dense" for B0, and the d3 log shows it, but B0 has no LayerNorm. It looks copied from ConvNeXt. Fix the code; the book's line is correct.
- **Lead, 10510 "every row a one-line change to VerifiedNetSpec/VerifiedConfig".** On the verified path the optimizer, EMA and drop come from the variant name (a different rendered MLIR). AutoAugment is in the shim. The verified ResNet-34 ImageNet path is AdamW, not the SGD in the table's column.

### Checked and fine
- **Imagenette d3 run:** 90.04/98.29, best 90.17, 30 s/epoch, 40.7 min, 103 ms/step.
- **Parameter and structure counts:** 4,020,358 / 5,288,548 / 8.42M recomputed; 213 tensors; 49 BN; r = ic/4.
- **Ratios:** 5.3×, 1.80×, 6 min.
- **ResNet-34:** 89.99 ± 0.32 (95% CI) and top-5 98.46.
- **MNV2:** 89.25/98.68.
- **MLIR sizes:** 1317/1071/754 KB.
- **JAX 350-epoch run:**
  - 77.15/93.30, 77.18 in-training, EMA +0.82, 46.6 h, 5004 steps/epoch, final LR 2e-4.
  - All 156 figure points match `reference_curve.tsv`.
- **Verified run:**
  - 76.878/93.154; Wilson interval [76.51, 77.25]; 300/300 evaluations below the reference after epoch 51; gap −0.32 with sd 0.07; curve sds 0.11/0.14.
  - Every window mean, every Δ, and all 36 figure points match.
  - 134 ms/step on 3060s; 147 splats of 1.0e-5 at d6af4213; 178 logistic, 0 maximum.
- **Paper facts:** B0 77.1/93.3 and §5.2 settings; B7 84.3% SOTA. The arXiv IDs 1905.11946, 1709.01507, 1911.04252 (88.4%), 1911.09070 and 2104.00298 are correct.
- **Lean:**
  - All 14 `\lean` names exist with the stated namespaces.
  - The `seBlockHasVJP` statement and backward match.
  - The full-VJP takes only `hεw`, and the sync-tie hypotheses match.
  - 213 = 3 + 10 + 195 + 5.
  - All `\uses` labels resolve, and the depgraph file exists.
- **Code and paths:**
  - Lake targets and scripts exist.
  - The Imagenette driver listing matches the code.
  - `enet_timm_parity.py --pad hybrid` gives 0.37/0.048.
  - `depthwiseStride2FlatXla` and `.fusedMbConvNB` exist.
  - The `#guard` against the hand-list is present.
  - EMA warmup is min(0.9999, (1+t)/(10+t)).
  - The seven pre-run listing lines count correctly.
- **ResNet-34 2018 column:** SGD 0.1, 90 epochs, wd 1e-4, cosine.

---

## Slice 13

**Chapter 8 (ConvNeXt), content.tex 10615–12093: 25 findings, 1 high, 10 medium, 14 low, plus 2 out-of-slice code-doc notes.** The harness refused to let me write `findings-13.md` (subagents can't create report files), so the full findings are below instead of at the path you gave.

Top 3:
1. (high, 10633-10666 and 11483-11488) The book misreports the paper's conclusion: the recipe gave +2.7 points and the architecture +3.2, so "mostly the training recipe" and "the architecture was never the variable" are wrong.
2. (medium, 11725-11727) `tests/TestConvNeXtDpCheck.lean` does not pin the forward bit-exactly. It checks loss and gradient to 1e-4 on the old Imagenette render.
3. (medium, 11753-11758) `lake run cnx-default-4gpu` now runs the exact-GELU twin with a torchvision crop, not the artifact the reported run trained.

# Findings 13 — Chapter 8 ConvNeXt (content.tex 10615–12093)

Paper checked against the arXiv:2201.03545 PDF (pdftotext: §2.1–2.6, Table 5). Lean checked by grep and read. Run artifacts checked: `runs/2026-09-13-convnext-imagenette-ls1e-6-resident/`, `runs/2026-08-30-convnext-imagenette-headln/`, `runs/2026-09-18-cnx-verified-300ep/`, `jax/runs/convnext_tiny_imagenet_bf16_300ep/`, `runs/2026-10-12-cnx{s,b}-*`, `verified_mlir/`.

### content.tex:10633-10666, 11483-11488 — The paper's conclusion is misreported
**Kind:** external-fact / overclaim · **Severity:** high
**Says:** "It's 'the architectural gap between ResNet and Swin was mostly the training recipe, not the receptive field.'" Also "ConvNeXt's paper argues the modernization lives in the training recipe … The architecture was never the variable."
**Actually:**
- Paper §2.1: the recipe alone took ResNet-50 from 76.1 to 78.8 (+2.7), and the paper says a significant portion of the gap "may be" due to training.
- The architecture steps then take it from 78.8 to 82.0 (+3.2), ending "82.0%, significantly exceeding Swin-T's 81.3%".
- Architecture therefore contributed more than the recipe. The paper's closing remark is that a pure ConvNet "can outperform the Swin Transformer".
- The chapter itself also credits the Imagenette shortfall to layer-scale init and data scale.
**Fix:**
- Say about half the gain (+2.7 of +5.9) came from the recipe.
- Drop "the architecture was never the variable".
- Reword the Results bullet so it no longer credits the paper with "the modernization lives in the recipe".

### content.tex:10639-10660 — The "full list" is not the paper's list
**Kind:** external-fact · **Severity:** medium
**Missing steps:**
- "Separate downsampling layers", the final step (81.5→82.0). This is the source of the chapter's own `.convNextDownsample` LN + 2×2/s2.
- "Moving up the depthwise conv layer" (80.6→79.9).
**Misattributions:**
- Item 3: the replaced ResNet stem is a 7×7/s2 conv *followed by a max pool*.
- Item 4: the depthwise step is the paper's "ResNeXt-ify" (grouped conv), not "as in MobileNetV2".
- Item 1 omits Random Erasing from the §2.1 list.
**Fix:** Call it "the main steps", add the two missing steps, and correct the stem and depthwise attributions.

### content.tex:10807-10811 — Depthwise "at the wide point … exactly the MobileNetV2 inverted residual"
**Kind:** math / external-fact · **Severity:** medium
**Actually:**
- The block displayed just above, the figure inset, and `convNextBlock = residual(layerScale∘project∘gelu∘expand∘LN∘depthwise)` (IRPrint.lean:1757) all put the depthwise before the expand, at width c.
- That is the paper's "moving up depthwise" step, so the block is not MobileNetV2's.
**Fix:** "like MobileNetV2's, except the depthwise is moved up before the expand".

### content.tex:11510-11512 — MLIR sizes in the prose disagree with the table
**Kind:** wrong-number · **Severity:** medium
**Says:** "below MobileNetV2's 1,047 and EfficientNet-B0's 1,316".
**Actually:** The table says 1,071 and 1,317. The files are 1,070,923 B and 1,316,743 B.
**Fix:** 1,071 / 1,317.

### content.tex:11587-11619 — Reference spec quoted "as the run trained it" includes a later field
**Kind:** stale / inconsistency · **Severity:** medium
**Actually:**
- `f32StemHead := true -- classifier head in fp32` was added in 559a05b3 on 2026-10-05.
- The run went 09-04 → 09-07, and the run-era config (86206f3b) has no `f32StemHead`. It also had `useAdam := true`, not `optimizer := .adam`.
- The quote contradicts Table cnx_paths, which gives the reference's classifier head as bf16.
- `augBicubic` and `erasingPixel` are tagged "(after the run below)"; this line is not.
**Fix:** Drop the line or tag it the same way.

### content.tex:11753-11758 — `lake run cnx-default-4gpu` no longer runs the run's artifact
**Kind:** command / stale · **Severity:** medium
**Actually:**
- `scripts/jobs/cnx-default-4gpu.conf` now sets `VARIANT=adamdpwxclipdroperfbf16` (erf, since 2026-10-06).
- Its precheck requires the torchvision crop and the exact GELU.
- The conf's own comment says the landed run trained the tanh twin `adamdpwxclipdropbf16`.
**Fix:** Note the change, or give the `LEAN_MLIR_VARIANT=adamdpwxclipdropbf16` override plus a reproduction commit.

### content.tex:11725-11727 — The DP gate does not pin the forward bit-exactly
**Kind:** overclaim · **Severity:** medium
**Actually:**
- The test's docstring (lines 27-33) says "there is no bnstat region pinning the forward bit-exactly".
- It gates `%loss` and gradient (via m) at norm-rel ≤ 1e-4 (lines 196-200), on a duplicated batch.
- It runs the old Imagenette `convnext_adamdp_train_step.mlir` ("44 of the 180 collectives … scalar LayerNorm γ/β"), not a convnextin bf16 render.
**Fix:** Describe it as a train-step check of loss and gradient to 1e-4, and name the artifact.

### content.tex:11585-11586, 11813-11817 — "Both are the paper's recipe" and "two-variable pair"
**Kind:** overclaim / inconsistency · **Severity:** medium
**Actually:**
- Both arms used batch 256 at a scaled LR, a 1.0 global-norm clip and the tanh GELU. The book's own TODO lists these as departures from the paper.
- The pairing is raw vs raw, so the reference's EMA is not a variable in it.
- Table cnx_paths itself lists other differences: eval forward and head bf16 vs fp32, mask source, and seed.
**Fix:** Caption it "this book's 2.5e-4/bs-256 rendition". Replace the two-variable sentence with the actual list of differences.

### content.tex:11668-11692 (+ Optimizer row of tab:cnx_vs_2018) — "Learning-rate robustness" was not tested
**Kind:** overclaim · **Severity:** medium
**Actually:** It was one run at one LR (the paper's value, scaled). That shows stability at that LR, not robustness. No LR sweep exists in `runs/` or `jax/runs/`.
**Fix:** "At the recipe's 2.5e-4 peak, with the clip, it trained without divergence."

### content.tex:11800-11811, 11829 (and 11657) — Bold TODO markers in the published body
**Kind:** process-narrative / render · **Severity:** medium
**Actually:** They render as "[TODO: …]" with dated status lines ("in code since 2026-10-12", "neither has run", "~76+109 h"). Line 11657 points readers to "the marker".
**Fix:** Replace with plain prose listing the remaining departures.

### content.tex:11658-11667 — "What is left is the recipe departures … not the architecture"
**Kind:** overclaim · **Severity:** low
**Actually:** Line 11653 admits the GELU as an architectural deviation (tanh vs erf), and the run is a single seed.
**Fix:** "…the recipe departures, the tanh GELU and seed variance".

### content.tex:10842-10850, 10953-10956 — Exact GELU credited to "the ImageNet pairs" of this chapter
**Kind:** inconsistency · **Severity:** low
**Actually:** The landed ConvNeXt pair trained tanh on both paths (line 11654, run README, and no `geluExact` at 86206f3b). Only the queued pairs and the ViT pairs use erf.
**Fix:** Say so.

### content.tex:11392-11402 — "Level through epoch 10", "three to four points apart"
**Kind:** wrong-number · **Severity:** low
**Actually:** From the run README:
- Epoch 5: 66.52 vs 62.22 (4.3 apart, not level).
- Epoch 40: 4.15 apart, quoted in the same sentence as "three to four".
- Epoch 50: 84.79 vs 79.82 (4.97 apart).
**Fix:** "level at epoch 10; three to five points apart from epoch 20".

### content.tex:11633-11640, 11648-11652 — "+0.03" vs printed 81.53/81.51, and 95.50 vs plotted 95.51
**Kind:** inconsistency · **Severity:** low
**Actually:**
- 81.53 − 81.51 = 0.02 as printed. The +0.03 comes from a different eval path: RESULTS §2 has EMA 40,769 = 81.54 vs raw 40,753.
- The JAX log's epoch-300 line is `val_top5=0.9551`.
- `cnx-default-4gpu.conf` itself flags this: "The book prints 81.53 / 95.50 where the reference log's last epoch is 95.51. Resolve that".
**Fix:** Use one eval path for both arms.

### content.tex:11779 — Table cnx_pjrt "Total 91.3 hr" is computed, not measured
**Kind:** wrong-number (presentation) · **Severity:** low
**Actually:** 91.3 h = 300 × the pre-crash 1,096 s/epoch. The wall clock was 95.63 h, including the e263 DIMM crash downtime and 1,178 s/epoch afterwards (RESULTS §1, §4–5).
**Fix:** Label it as computed.

### content.tex:11800, 11914 — Reference ms/step 179
**Kind:** wrong-number · **Severity:** low
**Actually:**
- The reference RESULTS.md says "Steady state 180.0 ms/step" (898 s / 5,004); the log average is 183.
- 179 appears only in a conf comment.
**Fix:** Use 180 and state its derivation. The 41 and 26 ms splits shift by 1.

### content.tex:11525-11533 — Layer Scale listing is the demo emitter's per-element γ
**Kind:** stale · **Severity:** low
**Actually:**
- The listing is from IRPrint.lean:1772-1825, the single-block demo: `%gls: tensor<1,c,H,W>` per element, with the flat scalar LN.
- The production render's γ is `[c]` (Spec.lean:273), which needs a broadcast.
**Fix:** Say so, or show the production render's ops.

### content.tex:10909-10933 — pdiv_gelu proof sketch doesn't match Lean
**Kind:** stale / statement-mismatch · **Severity:** low
**Actually:**
- `pdiv_gelu` is one line, `pdiv_elementwise geluScalar …`.
- That lemma (Foundation/Tensor.lean:199) uses `hasFDerivAt_pi` + `comp_hasFDerivAt` on `proj` + `pdiv_eq_of_hasFDerivAt`.
- None of `fderiv_apply`, `fderiv_comp` or `fderiv_eq_smul_deriv` appears.
**Fix:** Rewrite the sketch to match.

### content.tex:11041 — Garbled step "The forward is 2 times x"
**Kind:** typo · **Severity:** low
**Fix:** "The forward is \(x\) times step 2's Φ; …" (also "with Φ by step 2").

### content.tex:11651-11653, 11631 — Uncited micro-benchmark claims
**Kind:** lead · **Severity:** low
**Actually:**
- "∼2.3× faster in bf16" for the 7×7 depthwise: `planning/archive/imagenet_sweep.md` has no 2.3 figure, and its cited microbench note is not in the repo.
- "drop-path + EMA together <5%": the same doc (line 22) gives the EMA tax alone as ~4–5%.
**Fix:** Cite the measurement or soften.

### content.tex:12018-12024 — S/B graph times predate the head-LN restore and have no artifact
**Kind:** stale / lead · **Severity:** low
**Actually:**
- The times appear only in commit message 694e47b0 (2026-08-29), when the counts were 50,222,152 / 88,589,416.
- The head LN was restored 08-30; the counts were updated, the times were not re-measured.
- No `runs/` file holds the times.
**Fix:** Commit the probe output or footnote the date.

### content.tex:10699-10703 — Transcript elision note is incomplete
**Kind:** inconsistency · **Severity:** low
**Actually:** The per-step `step k/295: loss=` lines and `E0913 cuda_timer` warnings were also removed from the epochs shown.
**Fix:** Add "and the per-step loss lines".

### content.tex:11446 — `\label{sec:convnext_results}` after `\subsection*`
**Kind:** render · **Severity:** low
**Actually:** It resolves to the number of the "Example: ConvNeXt-T on Imagenette" section. Same issue for `sec:convnext_phase4` after a `\prosesection`.
**Fix:** Use a numbered subsection, or write "the Results below".

### content.tex:12081-12086 — Recap
**Kind:** inconsistency · **Severity:** low
**Actually:**
- "compared only where the schedule has annealed": the final pairing is raw vs raw, and the curves are compared at every epoch with a caveat.
- "LayerNorm is BatchNorm along the channel axis" is muddled. In Lean, LN is the same 1-D normalization as BN (`layerNormForward = bnForward`) applied to a different slice.
**Fix:** Reword both.

### Out of slice (code docstrings), low
- `ConvNeXtStepTieGB.lean` (header and `cnx_net_tiedGB` doc) calls `convnextin_adamdpwxclipdroperfbf16` "the book's run". The run was `adamdpwxclipdropbf16`.
- The `lakefile.lean` doc for convnext-s says "342 param tensors / 50,222,152". The guards say 344 / 50,223,688.

## Checked and fine
- **Lean names:** every `\lean{}` and prose-named declaration exists with matching statements and no sorry or axiom. This covers the GELU tanh/erf defs and derivatives, `GeluForm.*`, `layerNormHasVJP` (definitionally BN's), `chanLNTensor3HasVJP` (five-piece vjpComp), `geluErf_back_bridge` (rfl), and the whole-back, step-tie and loss-grad theorems. Also `convNextForwardTChHasVJP(_correct)`, `layerScaleHasVJP`, `convNextBlockHasVJP`.
- **Theorem structure:** the twelve-stage chain is right; the 23 ε hypotheses are named hsε, h1–h4, hd1–hd3 and hhε; 22 channel LNs + 1 head LN.
- **GeluForm:** the tanh/erf instances reduce to `gelu`/`geluErf` and `geluHasVJP`/`geluErfHasVJP` by rfl. Only `scalar`/differentiability case on the form.
- **erf math:** the erf/erfc algebra checks. JAX's `approximate=False` is `0.5*x*erfc(-x*sqrt_half)`, and tanh is JAX's default. Mathlib has no `erf`. `intervalIntegral.integral_comp_div` exists.
- **Param counts recomputed:** 27,827,818; 28,589,128 (matches timm); 50,223,688; 88,591,464; 182/344 tensors. All #guards exist, including the 3 T/ImageNet guards and `== ConvNeXtLayout.specs`.
- **Code listings:** the spec arm and trainer listings match `Spec.lean`, `NetsCore.lean` and `MainConvNeXtVerifiedAdam.lean`.
- **Imagenette run:** the transcript matches the log. 82.27/96.51, best 82.32@77, 4430 s, 55.4 s/epoch, 188 ms. The γ=1 run numbers (85.45, ±1.2, 80.87/77.43, 84.18/80.03) match the README.
- **MLIR files:** `convnext_adam_train_step.mlir` is 1,019 KB; there is no `convnext_fwd_eval`; the other three nets have `_fwd_eval`.
- **ImageNet runs and pairing:**
  - Reference: 81.53/95.50 (EMA) and 81.51 (raw); 15.3 min/epoch, 76.5 h, 5,004 steps.
  - Verified: 81.30/95.61, best 81.39@291, 18.3 min/epoch.
  - The Δ row of the epochs table, the lead at e3–17 (max 2.83), the trail of 4.06 at e33 (LR ≈ peak), and the −0.28 last-50 mean all recompute.
  - McNemar: the cells sum to 50,000 and p = 0.1004 recomputes. 92.6% agree vs 69.7% expected, 7.4% discordant, Wilson ±0.34, and `scripts/demos/mcnemar.py` exists.
  - The 15 ms feed (6.8%), the EMA render landing after the run, and the shard check predating the generic one all check.
- **External facts:** arXiv IDs and authors for ViT, Swin, ConvNeXt, LN, GELU, Mixup, CutMix, RE and RandAugment are right. ConvNeXt-T 82.1 vs Swin-T 81.3 is right. The paper's recipe values (lr 4e-3 @ 4096 → 2.5e-4, wd 0.05, 20-epoch warmup, aug values, drop-path 0.1/0.4/0.5, layer scale 1e-6, EMA 0.9999, no clip) are right.
- **2018 comparison and other chapters:** the R34 2018 recipe (SGD 0.1, 90 epochs, 5-epoch warmup, wd 1e-4) and the 500× wd ratio check. RSB-A3 77.61, B0 77.15, R34 74.14 match their chapters, and ViT-Tiny ImageNet 71.64 is below 81.53.
- **Side quest:** the timings (247/323/352/491 ms; 106/144/151/219 h; days), 3–7 ms starvation, 7.21/10.42 GiB and 312 updates/epoch check. The S/B renders, `_fwd_s288` forwards and job names exist; drop-path 0.4/0.5 is right.
- **Cross-refs:** every `\ref`/`\uses` label resolves, and `figures/depgraph/ch8.tex` exists.

**Tally:** 1 high, 10 medium, 14 low, plus 2 out-of-slice notes.

---

## Slice 14

I could not write the findings file: the harness blocks subagents from writing report files, so the full report is below. Nothing exists at /tmp/claude-1000/-home-skoonce-lean-lean4-mlir-worker/72b5c474-dbba-4182-a591-530e6f22d959/scratchpad/findings-14.md. Save this text there if you want it on disk.

Tally: 1 high, 4 medium, 12 low (17 findings).

The three most serious:
1. **13256–13312 (high):** the tower and "ViT body" theorems are the weight-shared, scalar-LayerNorm tower, yet the book says "ViT-Tiny/Base (k=12) and Large (k=24) are instances" and calls the body "the full ViT backbone". Attention.lean:1631–1638 says per-block parameters are not formalized there.
2. **12285–12295 / 12111 (medium):** the "each step composes the previous step" ladder breaks. `vitForwardKVHasVJP` never uses the tower or body theorems; it folds `transformerBlockVHasVJPMat` with `vjpComp`.
3. **12266 / 12276 / 12282 / 12120 (medium):** the theorem counts (37 total, 16 matrix, 21 attention) are wrong. The slice has 13 theorems plus 1 definition, and 27 theorems: 40 in all.

# Findings — slice 14: content.tex 12094–13517 (Ch 9 ViT)

### content.tex:13256–13312 — Tower and "ViT body" are the weight-shared, scalar-LN tower, but are presented as ViT-Tiny/Base/Large and "the full ViT backbone"

**Kind:** overclaim
**Severity:** high
**Says:** "\Prove{} \(\HasVJPMat\) of the \(k\)-block tower, for every \(k\) --- ViT-Tiny/Base (\(k = 12\)) and Large (\(k = 24\)) are instances." Also, under "ViT body: the grand finale": "\Prove{} the full ViT transformer backbone … is one \(\HasVJPMat\)."
**Actually:** `transformerTower` (LeanMlir/Proofs/Architectures/Attention.lean:1643) is `Nat.rec` over one shared parameter tuple, with scalar-affine LayerNorms (`γ1 β1 γ2 β2 γF βF : ℝ`). Attention.lean:1631–1638 says: "uses a single shared parameter tuple across all `k` blocks … with scalar-affine LayerNorms; in practice every block has its own weights and a per-feature LN. Per-block parameters are not formalized in this file." The `vitBodyHasVJPMat` docstring says "depth-k weight-tied backbone". ViT-Tiny/Base/Large are therefore not instances. The real network is `vitForwardKV`/`BlockParamsV` (ViTDepthK.lean), and the `\uses` of thm:vitForwardKVHasVJP lists neither of these two theorems.
**Fix:** Say "weight-tied k-block tower (one shared parameter tuple, scalar-affine LN)". Drop "ViT-Tiny/Base/Large are instances", or point that claim at Theorem vitForwardKVHasVJP. Retitle "grand finale".

### content.tex:12285–12295 (also 12111–12115, 13308–13310) — The "each step is a composition of the previous step" ladder breaks

**Kind:** overclaim
**Severity:** medium
**Says:** "…then a k-deep transformer tower, then the ViT body, then the whole network at its real shape. Each step is one or two compositions of the previous step." Also: "The proof composes everything this chapter introduces … into a tower of vjpMatComp applications with vjpComp at the joins."
**Actually:**
- `vitForwardKVHasVJP` (ViTDepthK.lean:183) is built from `transformerBlockVHasVJPMat` (ViTVecLN.lean:165), bridged per block with `HasVJPMat.toHasVJP` and folded with `vjpComp` (`vitBodyKVFlatHasVJP`, ViTDepthK.lean:136–157).
- So the tower is a `vjpComp` fold, and `vjpMatComp` appears only inside a block.
- It does not use the scalar-LN `layerNormPerTokenHasVJPMat`, `transformerBlockHasVJPMat`, the tower or the body. `vitBodyHasVJPMat` feeds only the weight-tied `vitFullHasVJP`.

**Fix:** Describe the fork honestly: the weight-tied scalar-LN rung on one side, the vector-LN distinct-parameter block folded by `vjpComp` on the other. Write "a vjpComp fold over blocks, each block a vjpMatComp chain".

### content.tex:12266, 12276, 12282, 12120 — Theorem counts are wrong

**Kind:** wrong-number
**Severity:** medium
**Says:** "thirty-seven theorems"; "Matrix-level machinery, sixteen theorems"; "Attention proofs, twenty-one theorems"; "plus the sixteen matrix-machinery lemmas".
**Actually:**
- Matrix-level machinery (12315–12707) has 13 theorems plus 1 definition.
- Attention proofs (12728–13481) has 27 theorems.
- Total: 40.
- vitTinyHasVJP_correct's `\uses` cites only 4 of the matrix-machinery blocks.

**Fix:** "forty", "thirteen theorems (plus the matrix VJP definition)", "twenty-seven". At 12120, drop "sixteen".

### content.tex:13233–13245, 13256–13265, 13286–13296 — Block, tower and body statements drop ε > 0

**Kind:** statement-mismatch
**Severity:** medium
**Says:** These three theorems have no `\Assume`.
**Actually:** `transformerBlockHasVJPMat` (Attention.lean:1603), `transformerTowerHasVJPMat` (1682) and `vitBodyHasVJPMat` (1774) all take `(hε : 0 < ε)`. The sublayer theorems at 13178 and 13208 do state ε > 0. `thm:layerNormPerTokenHasVJPMat` (13041) has no statement at all.
**Fix:** Add `\Assume{} ε > 0 [hε]` to the three theorems, and give the per-token LN theorem a one-line statement.

### content.tex:12234–12239 — "the gradient computed by this trainer is the mathematically correct one … is a theorem"

**Kind:** overclaim
**Severity:** medium
**Says:** "…the sentence 'the gradient computed by this trainer is the mathematically correct one' is no longer a hope … It is a theorem…"
**Actually:** Both theorems are over ℝ. ViTWholeBackCertifiedTieB.lean:16 says "in exact arithmetic", and ViTStepTieGB reads the f32/bf16 nodes "over ℝ at the identity rounding". The trainer runs in f32 on XLA. The AdamW update is also outside the statement (ViTStepTieGB.lean:16–18).
**Fix:** "…the gradient graph this trainer runs denotes, over the reals, the correct gradient", with a pointer to the floating-point discussion.

### content.tex:12318–12331, 12276–12280 — "Each theorem is a matrix lift … via the row-projection CLM"

**Kind:** overclaim
**Severity:** low
**Says:** "Each theorem below is the matrix lift of a vector-level theorem … proved by composing the vector version with the row-projection ContinuousLinearMap."
**Actually:** Only `pdivMat_rowIndep` uses a row projection (`reindexCLM`, Tensor.lean:921). The others:
- matmul: `pdiv_of_linear` (Tensor.lean:897–918)
- transpose: `pdiv_reindex` (1010)
- scalarScale: `pdiv_const_smul` (998)
- chain/sum/identity: the flatten bijection

Matmul and transpose have no vector counterpart to lift.
**Fix:** "…each transfers a Chapter-1 rule through the row-major flatten bijection; row-independence also uses the row-projection CLM."

### content.tex:12541–12588 — Matmul Jacobian proof sketches are stale

**Kind:** stale
**Severity:** low
**Says:** Finite-sum rule, product rule with constant C, and reindex Jacobian. The right-const proof says "the same three steps".
**Actually:** Each is one `rw [pdivMat, pdiv_of_linear …]` plus `by_cases`/`simp` (Tensor.lean:897–918). None of the cited rules is used, and `pdiv_of_linear`/`pdiv_of_affine` has no block in the book.
**Fix:** "linear map ⇒ the Jacobian entry is C·E_ij read at (k,l) (`pdiv_of_linear`)".

### content.tex:12996–13021 — Patch-embedding VJP proof steps 3–4 are stale

**Kind:** stale
**Severity:** low
**Says:** Step 4 cites the sum, constant, finite-sum ×3, product and reindex rules.
**Actually:** The proof uses `rw [hsplit, pdiv_of_affine]` (Attention.lean:2033–2041 and the proof body). The `Fin.sum_univ_succ` split in step 5 is accurate.
**Fix:** "affine in the image ⇒ `pdiv_of_affine`".

### content.tex:13059–13089 — The "Vector LayerNorm VJP" block's `\lean{}` includes `transformerBlockV` and the weight-tied `vitFullHasVJP`

**Kind:** statement-mismatch
**Severity:** low
**Says:** `\lean{…layerNormVecHasVJP, layerNormVecPerTokenHasVJPMat, transformerBlockV, vitFullHasVJP}`. Its `\uses` includes `thm:vitBodyHasVJPMat` (which comes 9 theorems later), `ax:patchEmbedFlatHasVJP` and others.
**Actually:** `vitFullHasVJP` (Attention.lean:2224) is the weight-tied scalar-LN whole net and unrelated to vector LN; `transformerBlockV` is a forward def. These two names create the forward dependency and the unexplained depgraph edges.
**Fix:** Move `vitFullHasVJP` to `thm:vitBodyHasVJPMat` or give it its own block. Drop `transformerBlockV` or cite `transformerBlockVHasVJPMat`. Re-run `blueprint_uses.py --fix`.

### content.tex:13481–13510 — The smoothed-CE instantiation has hidden hypotheses

**Kind:** statement-mismatch
**Severity:** low
**Says:** The only assumptions are ε > 0 and hL, then "Instantiated at the label-smoothed cross-entropy."
**Actually:** `vit_net_lossGrad_smoothedCE` (ViTParamGrad.lean:1675) and `vit_net_tied_lossGrad` (1692) also need `hK : 0 < nC` and `ht` (each target row sums to 1). The file header at 51–52 says so.
**Fix:** "(for targets whose rows sum to one, and nC > 0)".

### content.tex:13345–13365 — The all-ones-mask clause rests on a lemma not in `\lean{}`

**Kind:** statement-mismatch
**Severity:** low
**Says:** "…at all-ones masks, vitForwardKV on every example."
**Actually:** `vitFwdGraphBDrop_faithful` (ViTFwdDrop.lean:445) concludes `vitForwardKVDropB`. The reduction to `vitForwardKV` is `vitForwardKVDrop_ones`/`vitForwardKVDropB_ones` (ViTFwdDrop.lean:160; header at 26–28).
**Fix:** Add that lemma to `\lean{}`.

### content.tex:12203–12215 — "every softmax in it backpropagates by Theorem softmaxHasVJP"

**Kind:** lead
**Severity:** low
**Says:** "every softmax in it backpropagates by Theorem softmaxHasVJP"
**Actually:** The artifact is `vitAdamTrainStepBText .tanh` (ViTRenderB.lean:1065). The tie to the emitted graph is the step tie (`vit_net_tiedGB`): parameter nodes plus chain cotangents, not a per-softmax-node tie. The claim is reasonable shorthand. I did not search for a per-node softmax tie.
**Fix:** Optional: "…through the step tie (Theorem vit_step_tie)".

### content.tex:12253–12257 — "exactly the same template as ConvNeXt's blocks … layout came from transformers in 2017"

**Kind:** external-fact
**Severity:** low
**Says:** "…exactly the same template as ConvNeXt's blocks…, and the layout that transferred to convnets in 2022 actually came from transformers in 2017"
**Actually:** The 2017 Transformer is post-norm, `LN(x + Sublayer(x))`. The pre-norm `x + F(LN x)` proved here came later (GPT-2 2019, Xiong et al. 2020, ViT 2020). The ConvNeXt block is `x + γ·pw2(GELU(pw1(LN(dwconv x))))`: one residual, LN after the depthwise conv. So it is not "exactly" this template.
**Fix:** "the same LN-inside-the-residual-branch idea ConvNeXt (2022) borrowed from transformers".

### content.tex:12142–12145 — Elided log lines not disclosed

**Kind:** inconsistency
**Severity:** low
**Says:** "XLA's startup banner is removed, the network description line is wrapped, the per-step lines are dropped, and the middle of the run is elided"
**Actually:** The log (runs/2026-08-12-vit-imagenette-xla-cuda/vit-imagenette-xla.log) also has two "  xla/pjrt verified_mlir/…" lines and a per-epoch "[pjrt_ffi] RESIDENT: @vit_fwd holds 200 parameter tensors (21.1 MB)" line. Both are silently dropped. Every quoted line is verbatim.
**Fix:** Mention these edits.

### content.tex:12186–12187 — "Top-1 climbs the whole run"

**Kind:** overclaim
**Severity:** low
**Says:** "Top-1 climbs the whole run, 35.2 to 68.7."
**Actually:** It is not monotone (epoch 2 41.25, epoch 3 40.54), and the peak (68.92 at epoch 76) is above the final value.
**Fix:** "rises over the run … (peak 68.9)".

### content.tex:12370–12397, 12466–12488, 12728–12795 — Lemma names in proof sketches that the Lean proofs don't use

**Kind:** stale
**Severity:** low
**Says / Actually:**
- pdivMat_rowIndep: book cites `differentiableAt_pi`; Lean uses `hasFDerivAt_pi` (Tensor.lean:932).
- identity: book cites `Finset.sum_eq_single` twice; Lean uses `simp [ite_and]` (Tensor.lean:841).
- softmax Jacobian: book cites `fderiv_apply`; Lean uses `pdiv_eq_fderiv_coord` (Softmax.lean:62).
- softmax VJP: book cites `Finset.sum_ite`; Lean uses `Finset.sum_ite_eq` (Softmax.lean:146).
- rowSoftmax smoothness: book cites `Differentiable.inv`/`differentiable_pi`; Lean uses `softmax_differentiable` + `fun_prop` with `positivity`.

**Fix:** Update the names or drop them.

### content.tex:12935–12940 — The MHSA proof cites densePerTokenHasVJPMat, which Lean inlines

**Kind:** stale
**Severity:** low
**Says:** "the dense factors are per-token lifts (Theorem densePerTokenHasVJPMat)"
**Actually:** `mhsaComposedHasVJPMat` inlines `rowwiseHasVJPMat (denseHasVJP …)` because densePerToken is defined later (Attention.lean:1268). The `\uses` correctly omits densePerToken.
**Fix:** Cite rowwiseHasVJPMat at g = dense.

## Checked and fine

- **Lean names and labels:** all 49 `\lean{}` names exist in the right namespaces (`Proofs`, `Proofs.StableHLO`, `Proofs.ViTTieGB`). No `sorry` and no `axiom` anywhere in LeanMlir. Every `\ref`/`\uses` label resolves, and `blueprint_uses.py --check` reports in sync (169 blocks, 1239 edges).
- **Matrix machinery statements match Lean:**
  - HasVJPMat definition; vjpMatComp and biPathMat with their everywhere-differentiable flat hypotheses; identityMat.
  - Jacobians: scalarScale `[i=k∧j=l]s`, transpose `[j=k∧i=l]`, matmul left `[l=j]C_ki`, matmul right `[i=k]D_jl`.
  - VJP backwards: Cᵀ dY, dY Dᵀ, s·dY, dYᵀ.
  - rowwiseHasVJPMat and pdivMat_rowIndep (with `Differentiable g`).
- **Softmax:** pdiv_softmax and softmaxHasVJP formulas match Softmax.lean, and the algebra checks.
- **SDPA:** the definition, the Q chain (4 links, 3 vjpMatComp), the K chain (5 links, 4 vjpMatComp, mul_comm), and V via `sdpa_eq_mul_weights` all match.
- **MHSA and patch embedding:** the MHSA factorization and colIndep / colSlabwise lift, the backward/correct split, the patch-embed statement, the CLS row contributing 0 and `Fin.sum_univ_succ` all match.
- **LayerNorm:** layerNormVecHasVJP = (+β)∘layerScale γ∘LN(1,0) via vjpComp.
- **Whole-network theorems:**
  - vitForwardKVHasVJP: only `0 < ε`, distinct per-block params.
  - vitTinyHasVJP_correct: 3×224×224, P=16, 196+CLS, D=192=3×64, MLP 768, 12 blocks, any nCls.
  - Batched versions: every B, and every depth for `vitInputGradKB_correct`.
  - vit_net_tiedGB: 200 params (12×16 + 4 + 2 + 2), CLS summed in-node, one replica, bf16 flag, stochastic-depth semantics.
  - vitNetB_eq_vitForwardKV at `none`.
  - Graph faithfulness theorems and the "no text check" caveat.
- **Run log, all verbatim:** compile times 6104/1644 ms, 603 outputs, train 9469 / val 3925, bs 32, LR 3e-4, 600 tensors / 63.2 MB, and the epoch lines for epochs 1, 2, 3, 30, 79, 80. The p2/p3 logs are identical.
- **Derived numbers:** best top-1 68.92 (epoch 76); top-5 peak 94.88 at epoch 25; drop 4.46 points. 18 s × 80 = 24 min, consistent with 61 ms × 295 steps. Parameters recomputed: 5,526,346 (5.53M). 63.2 MB = 3 × params × 4 B (Adam state).
- **Repo facts:** no `vit_fwd_eval` or `convnext_fwd_eval` artifact; the BN nets have `_fwd_eval`. The `vit-verified-adam` exe exists. The download script exists. `vit_adam_train_step.mlir` is `pretty(provenGraph)` (ViTRenderB.lean:1065).
- **Depgraph figures:** all three ch9 files exist and cover all 14 + 27 blocks. "→ 8 boxes" is correct. I could not regenerate them because pygraphviz is not installed.
- **External facts:** ViT-B has 12 layers and ViT-L 24; the 1/√d_h scaling rationale; Imagenette 9,469 / 3,925.

---

## Slice 15

I couldn't write the findings file: the harness blocked the write to /tmp/claude-1000/-home-skoonce-lean-lean4-mlir-worker/72b5c474-dbba-4182-a591-530e6f22d959/scratchpad/findings-15.md ("Subagents should return findings as text"). The full findings are below; save them to that path if you need the file. Slice covered: content.tex lines 13518–14371. 19 findings: 1 high, 5 medium, 13 low.

Top 3:
1. **Line 13708 (high).** The book says the patch embed "reuses the conv2d backward (`conv2dHasVJP3`) and needs nothing new". It doesn't: `conv2dHasVJP3` only covers stride 1 with unchanged spatial size. The ViT proof uses its own `patchEmbedFlatHasVJP`, and the codegen has dedicated `patchEmbedBias*`/`patchEmbedWeightSgd` nodes.
2. **Lines 13975–13977 (medium).** The patch-embed bias disclosure is backwards. Both paths set the bias to zero. DeiT/timm leaves the Conv2d at PyTorch's default init, so DeiT's bias *is* PyTorch's default and ours is not.
3. **Lines 13696–13699 (medium).** The verified-trainer listing shows `.param #[192] 2` / `.param #[197,192] 2`. The code has kind `5` (σ 0.02 under `vitInit`); kind 2 means zeros.

# Findings 15: content.tex 13518–14371 (Ch. 9 ViT)

### content.tex:13708 — Patch embed does not reuse `conv2dHasVJP3`, and it is not "nothing new"
**Kind:** statement-mismatch / overclaim. **Severity:** high
**Says:** "a patch embedding is a strided convolution whose kernel equals its stride, so it reuses the conv2d backward (Theorem~\ref{ax:conv2dHasVJP3}) and needs nothing new."
**Actually:** `Proofs.conv2dHasVJP3` (LeanMlir/Proofs/Architectures/CNN.lean:230) covers `conv2d W b : Tensor3 ic h w → Tensor3 oc h w`. That is stride-1 SAME padding with the same spatial size, so it cannot express a 16×16/s16 patch embed. The ViT proof uses `Proofs.patchEmbedFlatHasVJP` (Attention.lean:2043; the book's own Theorem ax:patchEmbedFlatHasVJP at content.tex:12975, cited at 13392). The codegen also has dedicated `patchEmbedBiasGrad`, `patchEmbedBiasSgd` and `patchEmbedWeightSgd` nodes (StableHLO/Basic.lean:582ff; ViTFold.lean:23).
**Fix:** Cite Theorem~\ref{ax:patchEmbedFlatHasVJP} (the strided-conv adjoint plus CLS prepend and positional add). Drop "reuses conv2d backward / needs nothing new".

### content.tex:13975–13977 — Patch-embedding bias disclosure is backwards
**Kind:** statement-mismatch / external-fact. **Severity:** medium
**Says:** "the patch-embedding bias sits at PyTorch's default rather than DeiT's."
**Actually:** Both paths set the bias to zero:
- JAX: `generated_vit_tiny_imagenet.py:544-545` uses `jnp.zeros(192)`.
- Verified: the `.conv` bias has initKind 2, which is zeros (Spec.lean:236, 222).

DeiT's timm `_init_weights` touches only Linear and LayerNorm, so the PatchEmbed Conv2d bias stays at PyTorch's default, U(±1/√fan_in). planning/imagenet_parity.md:717 frames the gap the same way: "Not done: the patch-embed bias at PyTorch's default".
**Fix:** "the patch-embedding bias starts at zero rather than at PyTorch's Conv2d default, which DeiT keeps."

### content.tex:13696–13699 — Listing shows the wrong init kind for the CLS/pos `.param`s
**Kind:** stale. **Severity:** medium
**Says:** `.param #[192] 2` and `.param #[197, 192] 2`
**Actually:** NetsCore.lean:1201-1202 has kind `5`. Kind 2 means zeros. Kind 5 means "embedding: σ 0.02 under vitInit, else zeros" (Spec.lean:220-226). The change came in commit 44abf272. The ImageNet section's "CLS + position init σ = 0.02" depends on kind 5.
**Fix:** Change both to `5`.

### content.tex:13870–13872 — "59 initialization sites" is wrong
**Kind:** wrong-number. **Severity:** medium
**Says:** "differ in exactly one function: init_params, 59 initialization sites"
**Actually:** The two generated files differ only inside `init_params` (I diffed everything outside it). That function has 76 random-init sites in both `generated_vit_tiny_imagenet.py` and `_xavier.py`:
- 1 patch conv, CLS, pos
- 48 of [192,192], 12 of [192,768], 12 of [768,192]
- the head

74 of them differ; CLS and pos are 0.02 in both. Nothing in the repo produces 59.
**Fix:** "74 of its 76 initialization sites", or re-derive the intended number.

### content.tex:13874–13877 — The patch embed "~6× too narrow" figure does not hold at ViT-Ti
**Kind:** math. **Severity:** medium
**Says:** "the patch embed came out ~6× too narrow (...output fan d·p² rather than input fan c·p²). The smallest model was the worst case."
**Actually:**
- The Xavier arm uses `sqrt(6/49152)`, std 0.00638.
- The default (timm/DeiT) arm uses PyTorch's default, U(±1/√768), std 0.0208.
- Against that, the Xavier arm is 3.3× too narrow at Ti, 4.6× at S and 6.5× at B. Against an input-fan-only Xavier it would be 8×.

No reading gives ~6× at Ti, and for the patch embed the smallest model is the mildest case, not the worst. The same "~6x" is in the `jax/MainVitImagenet.lean` docstring.
**Fix:** "~3× at ViT-Ti (~6.5× at ViT-B) against PyTorch's Conv2d default". Restrict "worst case" to the Linears.

### content.tex:14327–14329 — Visible `[TODO: ...]` marker in the printed book
**Kind:** process-narrative. **Severity:** medium
**Actually:** It renders as bold "[TODO: as Tiny's; neither has run — ...]". The status is still true: no 300-epoch ViT-S/B runs exist in runs/.
**Fix:** Turn it into a sentence, or remove it. "What is queued" already carries the same content.

### content.tex:14175–14180, 14143 — Reference and verified ms/step use different bases
**Kind:** inconsistency. **Severity:** low
**Says:** 463 vs 573 ms/step, "The every-epoch evaluation is the rest."
**Actually:**
- 463 = the 579 s epoch (eval every fifth epoch, amortized) ÷ 1,251. The JAX RESULTS.md:85 gives about 457 ms of training per step (571.6 s ÷ 1,251).
- 573 must be training-only: 751 s ÷ 1,251 = 600 ms, and log_ts.log shows about 580 ms per training step.

**Fix:** Use the same basis for both: 457 vs ~573 (training only), or 463 vs 600 (epoch ÷ steps).

### content.tex:13786–13790 — The attention listing comes from a string template with no `den` semantics
**Kind:** lead / overclaim. **Severity:** low
**Says:** "The emitted graph denotes transformerAttnSublayerHasVJPMat's backward. Here is..."
**Actually:**
- The snippet is `attnSublayerBackModule` (IRPrint.lean:1073-1109), a hand-built String written by `#eval` to /tmp/attn_back.mlir (IRPrint.lean:1906).
- It has no `den` semantics and uses scalar LN γ/β (`%g1: tensor<f32>`).
- The printer also emits `precision = [DEFAULT, DEFAULT]`, which the listing omits.
- The denoted path is the SHlo AST in ViTRender/ViTRenderB.

**Fix:** Label it as the representative-scale IRPrint demo, or quote the fan-in from `vit_adam_train_step.mlir`.

### content.tex:13828–13830 — "The attention bridge is unconditional"
**Kind:** overclaim. **Severity:** low
**Actually:** `transformerAttnSublayerHasVJPMat` takes `hε : 0 < ε` (Attention.lean:1533). The Recap itself says "assuming only ε > 0".
**Fix:** "No smooth-point clause; the only hypothesis is LayerNorm's ε > 0."

### content.tex:14053–14058 — The smx tie caveat omits the 4-replica carve-out
**Kind:** lead / overclaim by omission. **Severity:** low
**Actually:** thm:vit_step_tie is "Stated at one replica". The scored run is the 4-replica `emadp256x4` render with 200 all_reduces, which the code calls a "declared trusted carve-out". The prose lists only the EMA tail as outside the theorem.
**Fix:** Add "and the four-way all-reduce (gated numerically, not proved)".

### content.tex:14247–14249 — "S and B have no single-device render at all"
**Kind:** stale. **Severity:** low
**Actually:** True for S (every `vitsin_*` render is dp; lakefile.lean:676 says "FOUR-REPLICA ONLY"). False for B: `verified_mlir/vitbin_adam128wxclipdrop{,bf16,erf,erfbf16}_train_step.mlir` are single-device.
**Fix:** Reword for S only, or just say "measured at four replicas, as the jobs run".

### content.tex:13753–13755 — Bold top-1 marks the wrong row in tab:imagenette_five
**Kind:** inconsistency. **Severity:** low
**Actually:** ResNet-34's 89.99 is bolded, but EfficientNet-B0's 90.04 is higher. The caption doesn't explain the bolding. Table tab:imagenette_three (line 9927, another slice) has the same issue.
**Fix:** Bold 90.04, or bold both and explain in the caption.

### content.tex:13754 — "MobileNet V2" vs "MobileNetV2"
**Kind:** typo. **Severity:** low
**Actually:** The same table at lines 9928 and 11460 spells it "MobileNetV2".

### content.tex:13916–13918, 14141 — "±0.39 points either way"
**Kind:** wrong-number (rounding). **Severity:** low
**Actually:** At p = 0.716 and n = 50k, 1.96·√(p(1−p)/n) = 0.395. The verified run's own CI is 71.22–72.01 around 71.612, which is −0.39/+0.40.
**Fix:** "about ±0.4", or "−0.39/+0.40".

### content.tex:13741 — "bit-identical on three different cards"
**Kind:** lead. **Severity:** low
**Actually:**
- Bit-identity is confirmed: the 160 Epoch/val lines md5-match across runs/2026-08-12-vit-imagenette-xla-cuda/*.log.
- Every log prints `StreamExecutor [0] RTX 4060 Ti`. p2 and p3 started the same second, so they were on separate cards. Nothing records which card run 1 used.

### content.tex:14262–14264, 14013, 14304 — Dated process narrative
**Kind:** process-narrative. **Severity:** low
**Says:** "(the 2026-10-11 smokes, on the 4060 Ti box)", "now covers ... does not yet cover vitin", "What is queued".
**Actually:** The S/B verified ms/step figures (650 and 859) come from the unshifted `…eps0000001erfbf16` renders (runs/2026-10-11-vit{s,b}-default-emabf16-4gpu/RESULTS.md). The prose names the smx renders as the jobs.
**Fix:** Cite the run directories instead of dates, and note the timing is pre-smx.

### content.tex:13809–13811 — "three branches instead of one"
**Kind:** math (wording). **Severity:** low
**Actually:** The residual fan-in sums two branches (skip + F), so it should be "three instead of two".

### content.tex:13818–13821 — "covers every operator in the modern vision stack"
**Kind:** overclaim. **Severity:** low
**Actually:** The list omits LayerNorm, GELU, pooling, the patch embed and softmax-CE. The 4-replica all-reduce used by every ImageNet run is a trusted carve-out, not verified codegen.
**Fix:** "every operator Part 1's nets use", and exclude the collectives explicitly.

### content.tex:13704, 14000 — "kernel-#guard"
**Kind:** lead / terminology. **Severity:** low
**Actually:** `#guard` (NetsCore.lean:1233, 1399-1401) runs the Bool through the compiled evaluator, not kernel reduction (that would be `decide`/`rfl`).
**Fix:** "#guarded at build time".

## Checked and fine
- **ViT paper (2010.11929):** smallest model ViT-Base; 21k (14M) and JFT-300M pretraining.
- **DeiT (2012.12877):** DeiT-Ti 72.2 (91.1 top-5 from the repo/timm); distilled 74.5 (+2.3).
- **DeiT recipe rows all match `jax/MainVitImagenet.lean`:** lr 5e-4·B/512 = 1e-3 at 4×256; warmup 1e-6 and min 1e-5; per-epoch cosine; wd 0.05 skipping norms/bias/pos/cls; mixup 0.8 / cutmix 1.0 at p 0.5; smoothing 0.1; m9-mstd0.5-inc1; reprob 0.25 pixel; RA×3; drop path 0.1; EMA 0.99996; LN eps 1e-6; no clip.
- **Parameter counts, recomputed:** 5,526,346, 5,717,416, 22,050,664 and 86,567,656; 200 tensors. The `#guard`s exist.
- **`transformerBlock` arm and drop-path:** the arm matches Spec.lean:275-280; drop sites, denominator, rate and the keep formula match.
- **`runViTAdam` listing:** matches MainViTVerifiedAdam.lean.
- **Imagenette run:** 68.738854 / 90.420382; 9,469 images and 295 steps; 80×18 s ≈ 24 min; 1.5× faster; 13.5 points below ConvNeXt.
- **MLIR sizes:** 754, 1,071, 1,317, 1,019 and 1,282 KB; MLP 6.6 KB. 435 `dot_general`s and 2 convolutions.
- **smx render:** 831 operands, 200 all_reduces, 72 row-max ops, exactly +288 lines; 36 softmaxes; score 90.0 against the 88.72 exp limit; 2.9e-4 / 3.0e-4 errors (commit 2170bd9f). `softmax_sub_const`, `rowSoftmaxShiftFlat_eq` and `den_softmaxRowBackShiftB_eq` exist.
- **ImageNet tables and curves:**
  - JAX 71.638/90.980 at 9.65 min/epoch and 48.25 h; verified 71.612/90.948 at 751 s/epoch and 62.55 h.
  - 35,819 vs 35,806 correct; e280–300 means 71.48 / 71.44; live weights 71.87/91.12 and 71.73/91.08.
  - McNemar 2,347/2,327 (p = 0.78) and live p = 0.30.
  - All 180 plotted points and the tab:vit_paths_epochs deltas match the CSVs; the max lead is +1.40 at e30.
- **EMA fractions** 78/29/5/<1% at e5/25/60/100 and the 20-epoch time constant; 1,251 steps/epoch; ~617 MB/step feed.
- **Xavier width ratios** 3.6/2.6/1.8×; the generated trainers differ only in `init_params`.
- **bf16 arithmetic** 1.47× and 624→919 img/s. The script exists; the source run for those two numbers wasn't found.
- **Graph times:** 171.6→96.4, 464.0→245.5 and 1295.6→745.3 (planning/archive/verified_side_quest_counterparts.md).
- **S/B smoke timings and memory:** 648/650, ~1,700/1,718 ms; 9/5 ms starvation; 10.75/11.68 GiB; 13.83/15.11 GiB at 0.97.
- **Paths, confs and checks:** all job confs, lake scripts and exes exist; the Ti conf variant is the smx one; the shard check covers `vit` but not `vitin`.
- **Labels and declarations:** all `\ref` labels resolve; every cited declaration exists; there are no `axiom`s in LeanMlir.
- **Recap bestiary list:** every architecture named has a file in Bestiary/.

---

## Slice 16

I could not create the findings file at /tmp/claude-1000/-home-skoonce-lean-lean4-mlir-worker/72b5c474-dbba-4182-a591-530e6f22d959/scratchpad/findings-16.md: the harness refused the write ("Subagents should return findings as text"). The full findings are below; you'll need to save them to that path if you want the file.

**Counts:** 28 findings: 1 high, 9 medium, 18 low (5 of the low ones are leads I couldn't fully verify).

**Most serious three:**
1. **content.tex:15043 (high):** The ResNet-34 row says "21.3M (paper 21.8M)". 21.3M is Ch 5's 10-class Imagenette net; with the 1000-class head the count is exactly 21,797,672, so the implied gap doesn't exist. `Bestiary/ResNet.lean` also has no ResNet-34.
2. **content.tex:15060-15075 (medium):** The ResNet listing `def resnet50Imagenet` comes from `jax/MainResnet50Imagenet.lean`, not from `Bestiary/ResNet.lean`, which defines `resNet50` with no `convPadStyle`.
3. **content.tex:14530 (medium):** "Twenty-five Layer constructors exist only for the bestiary" is false for three of them. `.pairTile` is in no Bestiary file. `.separableConv` and `.fireModule` are trained by `jax/MainMobilenet.lean` and `jax/MainSqueezeNet.lean`.

**How I checked:** every NetSpec listing in the slice was diffed against the `Bestiary/*.lean` def of the same name, comparing code only (comments and whitespace stripped); all 14 match. I re-implemented the repo's parameter counting in Python and recomputed every variant in the 14 files; all agree with `tests/bestiary_params.yml`. The Xception parameter count was read off the arXiv PDF.

# Findings — slice 16: content.tex 14372–15505 (Bestiary intro, primitives, LeNet → Swin)

### content.tex:15043 — ResNet-34 row: the 10-class Imagenette count, and no such Bestiary variant
**Kind:** wrong-number / inconsistency
**Severity:** high
**Says:** "ResNet-34 & basic & (3, 4, 6, 3) & 21.3M (paper 21.8M)"
**Actually:**
- `Bestiary/ResNet.lean` has no ResNet-34. Its variants are R18/50/101/152/tiny, and `tests/bestiary_params.yml:164-169` has no R34 row.
- 21.3M is Ch 5's Imagenette net with a `dense 512 10` head (content.tex:5620).
- With the repo's own counting, the R34 body plus a 1000-class head is 21,797,672; with the 10-class head it is 21,289,802.
- Every other row in the table uses the 1000-class head. On that footing R34 is 21.8M, which is exactly the torchvision number.

**Fix:** Write "21.8M (paper 21.8M)", or drop the row and point to Ch 5 / `LeanMlir/ReferenceNets.lean`.

### content.tex:15060-15075 — ResNet listing is not from Bestiary/ResNet.lean
**Kind:** command/path
**Severity:** medium
**Says:** The heading names `Bestiary/ResNet.lean`; the listing is `def resnet50Imagenet` with `name := "ResNet-50 (ImageNet)"` and `convPadStyle := .symmetric`.
**Actually:** That def is at `jax/MainResnet50Imagenet.lean:14`. The Bestiary's def is `resNet50` (`Bestiary/ResNet.lean:89`): its name is "ResNet-50" and it has no `convPadStyle`.
**Fix:** Show the Bestiary def, or attribute the listing to the JAX trainer file.

### content.tex:14530-14538 — "Twenty-five Layer constructors exist only for the bestiary" is false for three of them
**Kind:** overclaim
**Severity:** medium
**Actually:**
- `.pairTile` appears in no Bestiary file. It is used only by `demos/MainDistogramCasp.lean`.
- `.separableConv` and `.fireModule` are lowered by the JAX emitter (`LeanMlir/Types.lean:110-112, 133-135`).
- They are trained by `jax/MainMobilenet.lean:13` and `jax/MainSqueezeNet.lean:14`, both registered at `jax/lakefile.lean:31,49`.
- The count of 23 bundled constructors is correct.

**Fix:** Reword to something like "appear in no Part 1 chapter". Note the JAX lowering for those two, and say `pairTile` is the structure demo's, not a bestiary entry's.

### content.tex:14403-14406 — "no training runs, no VJP commitments" contradicts the chapter itself
**Kind:** inconsistency
**Severity:** medium
**Actually:**
- The R50 entry reports the 77.61% and 78.08% ImageNet runs (15081-15089).
- `.unetDown`, `.unetUp` and `.pairTile` are trained through the codegen (14535).
- `.pairTile` has proved VJPs in `LeanMlir/Proofs/Foundation/PairTile.lean`.
- The section intro (14862-14868) promises demos with datasets and baselines.

**Fix:** Qualify it: most entries are pure NetSpec values, and the demo entries are the exception.

### content.tex:14621-14624 — Darknet weight comparison is backwards
**Kind:** math
**Severity:** medium
**Says:** "Lighter than a standard ResNet bottleneck; heavier than a ResNet-18 basic block."
**Actually:** At the same channel width c:
- Darknet block (1×1 c→c/2, then 3×3 c/2→c): 5c², per the code comment.
- ResNet bottleneck: about 1.06c².
- Basic block (two 3×3 convs): 18c².

**Fix:** "Heavier than a bottleneck, lighter than a basic block."

### content.tex:15329-15331 — Xception "paper-exact at 22M"
**Kind:** wrong-number
**Severity:** medium
**Actually:**
- The Xception paper (arXiv:1610.02357, Table 3) gives 22,855,952 parameters.
- The spec has 21,924,976, which is 0.93M (4%) low.
- The gap is the four 1×1 residual-projection convs: 64·128 + 128·256 + 256·728 + 728·1024 ≈ 0.97M. The prose calls these residuals "implicit", but they carry parameters.

**Fix:** "21.9M; paper 22.9M, without the four 1×1 residual projections."

### content.tex:15492-15494 — Swin-T "28.6M against the paper's 28M … exactly"
**Kind:** wrong-number / overclaim
**Severity:** medium
**Actually:**
- 28.6 is not 28, so "exactly" contradicts the sentence's own numbers.
- The 0.3M excess comes from `.patchEmbed`'s CLS token plus a learned [3137, 96] absolute position embedding: 301,248 params. Swin uses neither (`ape=False`, relative bias only).
- Subtracting those gives 28,287,970, within 384 of timm's `swin_tiny` count of 28,288,354.

**Fix:** Explain the extra 0.3M, or give Swin a patch embed without the position embedding.

### content.tex:14925-14928 — AlexNet "combines convnets with KNN sampling"
**Kind:** external-fact
**Severity:** medium
**Actually:** The ILSVRC-2012 winning entry averaged seven CNNs (five, plus two pre-trained on Fall 2011). The 10-crop averaging is correct. There was no KNN in the submission; the paper's nearest-neighbour use is a qualitative probe of feature similarity (§6.1, Fig. 4).
**Fix:** "The winning submission averaged seven CNNs, each with 10-crop test-time averaging."

### content.tex:14941 — AlexNet listing comment "~95% of params live here"
**Kind:** wrong-number
**Severity:** medium
**Actually:**
- The first FC holds 37.75M of 62.38M parameters, about 60%.
- All three FCs together hold about 94%.
- The Lean source's comment reads differently ("fan-in pinned to the paper's 6×6"), so the book's version introduced this error.

**Fix:** "~60%; the three FCs ~94%", or restore the Lean comment.

### content.tex:15277-15282 — label smoothing formula matches neither the paper nor the code
**Kind:** external-fact / inconsistency
**Severity:** medium
**Says:** "0.9 on the true class and 0.1/(nClasses−1) elsewhere", citing "our own `TrainConfig.labelSmoothing`".
**Actually:**
- Szegedy et al. §7 mixes with the uniform distribution over all K classes: q′ = (1−ε)δ + ε/K.
- The repo's emitter does the same: `jax/Jax/Codegen.lean:2860-2862` computes `tgt*(1-s) + s/nClasses`, which is also timm's convention.
- Ch 5 (content.tex:6351-6356, outside this slice) uses the same ε/(K−1) form, and its 0.485 loss floor is derived from it.

**Fix:** Use ε/K, and recheck Ch 5's loss-floor arithmetic.

### content.tex:15300-15301 — Inception-v4 "stem-A / stem-B / stem-C blocks" (low)
The v4 paper has a single Stem (Fig. 3). The A/B/C lettering belongs to the Inception-A/B/C modules, with Reduction-A/B blocks between them.

### content.tex:14904-14905 — AlexNet "paper-exact at 60M" (low)
The spec has 62.4M, 4% over the paper's 60M. That is expected, because the paper's figure is the two-GPU model with grouped convs and this spec is ungrouped. Drop "paper-exact".

### content.tex:15040-15052 — "(paper …)" ResNet counts, and "All three" (low)
- He et al. Table 1 lists FLOPs, not parameter counts; the "paper" numbers are torchvision's.
- The table has five rows, so "All three share the same stem" points at nothing.
- The 256→512→1024→2048 channel layout is true only of the bottleneck variants. The Lean docstring correctly says "All four … basic tops out at 512".

### content.tex:15076-15083 — SqueezeNet 1.1 "~2× fewer FLOPs" (low)
The official v1.1 release notes say "2.4x less computation".

### content.tex:15326-15329 — Xception "every conv is depthwise-separable"; "made MobileNet possible a year later" (low)
- The stem is two regular convs, as the listing itself shows, and the residual projections are regular 1×1 convs.
- MobileNets (Apr 2017) came about six months after Xception (Oct 2016), and it credits depthwise-separable convs to Sifre 2014.

### content.tex:15012-15013 — Highway → ResNet "six months later" (low)
Highway was posted 3 May 2015 and ResNet 10 Dec 2015, about seven months apart.

### content.tex:14990-14993 — VGG "those FC features" (low)
Perceptual loss (Johnson et al.) and style transfer (Gatys et al.) use conv-layer activations, not FC features.

### content.tex:15353, 15405-15411 — DenseNet signature spelled `growth_rate n_layers` (low)
The constructor is `denseBlock (ic growthRate nLayers : Nat)` (`Types.lean:269`), and the book's own definition at 14571 uses that spelling.

### content.tex:15265 vs 6349 — Inception v3 cited as 2015 here and 2016 in Ch 5 (low)
It is the same paper (arXiv:1512.00567); pick one convention.

### content.tex:15280-15283 — label smoothing "standard in every modern recipe" (low)
- RSB, the R50 recipe cited at 15078, uses 0, and so does the repo: `jax/MainResnet50Imagenet.lean:62` sets `labelSmoothing := 0.0`.
- The "improves calibration" claim is not in the Inception-v3 paper; it is from Müller et al. 2019.

### Figure, content.tex:14512-14521 — inventory chips (low)
- "1×1 conv" is coloured as first appearing in ch 6–7, but the ResNet-34 projection shortcut (ch 5) already uses 1×1 conv-BN.
- `tokenEmbed` is TinyGPT's layer and is not in ch 1–9; ViT uses `patchEmbed`.
- The Part 2 column omits `structureModule` and `pairTile`, although the caption calls the figure "the inventory".

### content.tex:14389-14391 — atomic ops "(Ch 2–5)" (low)
`.dense` is introduced in Ch 1 (`chap:tensor`), and line 14415 itself says "Ch 1".

### content.tex:14919-14922 — comma splice (low)
"for ∼6 days, the two-tower model is…" is a run-on; split it with a semicolon. The paper says "five to six days".

### content.tex:14734-14735 — path missing its root (low)
`Proofs/Foundation/PairTile.lean` should be `LeanMlir/Proofs/Foundation/PairTile.lean`.

### Leads (low, not fully verified)
- **14680:** ASPP is called "DeepLab v3+'s marquee module". It was introduced in DeepLab v2; the form described here is from v3 (2017), and v3+ reuses it.
- **15219:** GoogLeNet's auxiliary classifiers as "a precursor to deep supervision". DSN (arXiv:1409.5185) was posted one day after GoogLeNet, so the two are concurrent.
- **15386:** ShuffleNet v2 "measured MAC directly". The paper measured speed; MAC is an analytic count. Also, "all widths within 2%": 0.5× is 2.1% under the rounded 1.4M.
- **15302:** "paper 23M / paper 42M" for Inception v3/v4. The only published v3 count I found is the Xception paper's 23.6M, and I found no count in the v4 paper (42.7M is the timm/Keras figure).

## Checked and fine
- **Listings:** all 14 (leNet5, alexNet, vgg16, highway50Main/Gate, wrn28_10, squeezeNet1_1, googLeNet, xception, denseNet121, shuffleNet1x, shuffleV2_1_0, mobileViTS, swinT) match `Bestiary/*.lean` code token for token. All entry files exist and are registered as `bestiary-*` executables in `lakefile.lean`.
- **Parameter counts:** the Python recount matches `tests/bestiary_params.yml` for every variant in the 14 files.
- **LeNet:** 61K and 266K are correct.
- **AlexNet:** "~58M of 62M in the FCs" is correct; the GTX 580 3GB and 10-crop facts are right.
- **VGG:** the table's counts and per-stage convs match; the first FC is 102.8M; the 28% saving is right; arXiv ID correct.
- **Highway:** width 50, the blend formula, arXiv ID and authors are right. The theorem and chapter labels it cites all exist.
- **ResNet:** R18/50/101/152 match torchvision exactly. RSB A2 79.8 and A3 78.1 are right, as is the arXiv ID. 77.61/93.61 matches `runs/2026-10-12-r50-a3-jax/rescore_f32.log:22`, and 78.08 matches `runs/2026-10-12-r50-a3-rsb-bf16/RESULTS.md:3`. The 0.49 gap is correct.
- **WRN:** 36.5/2.2/17.2M match the paper, as do the 6n+4 rule, the WRN-40-4 vs ResNet-1001 claim, the dropout gap and the arXiv ID.
- **SqueezeNet:** 1.25/1.24M and the Fire widths are right; arXiv ID correct.
- **GoogLeNet:** all nine inception configs match the paper's table; 7.0M (~20× under VGG-16) and the arXiv ID are right.
- **Inception v3/v4 and Xception:** arXiv IDs are right; 7×1 + 1×7 ≈ 1/3.5 the FLOPs is right.
- **DenseNet:** counts, block counts, k=32 and arXiv ID are right.
- **ShuffleNet v1/v2:** stage widths and units match; v2 counts are within rounding of the paper's; guidelines G1–G4 are right; arXiv IDs correct.
- **MobileViT:** S/XS/XXS 5.6/2.3/1.3M and the layout match the paper; arXiv ID correct.
- **Swin:** heads, depths, window size and MLP ratio match; arXiv ID correct.
- **Primitives section:**
  - The 23 bundled definitions are counted correctly.
  - Every `\lean{Layer.X}` names a real constructor.
  - The codegen's no-emitter list matches the shape-only set, and the codegen refuses specs containing them.
  - unetDown/unetUp/pairTile are codegen-backed, as stated.
  - NeRF is 593,924, so "under 600K" holds.
  - The primitive descriptions agree with the `Types.lean` docstrings and the papers.
- **Primitive-count examples:** the AlphaZero, DETR and Stable Diffusion examples use the constructors claimed.

Tally: 28 findings (1 high, 9 medium, 18 low including 5 leads).

---

## Slice 17

The harness blocked writing `findings-17.md` ("Subagents should return findings as text"), so the full findings are below; please save them to /tmp/claude-1000/-home-skoonce-lean-lean4-mlir-worker/72b5c474-dbba-4182-a591-530e6f22d959/scratchpad/findings-17.md. Slice is content.tex 15506–16568. No repo files were edited.

**Counts:** 37 findings — 2 high, 9 medium, 26 low (4 of the low are leads).

**Three most serious:**
1. **:15585, the "54% over the PyTorch replica" claim (high).** It compares the 30-epoch augmented arm scored with the multilabel decode against the replica's 12-epoch, no-augmentation, argmax score. At matched recipe and decode the stack ties the replica (0.1526 vs 0.1532). The planning doc says decodes must never be mixed. So the number does not show implementation quality.
2. **tab:visdrone_results and :15563–15571 (high).** The table mixes argmax and multilabel decodes and changes the loss settings between rows (class weights and class focal). "12 epochs beats 50 at that strength" is confounded by those changes. "Photometric" augmentation also includes a horizontal flip.
3. **:15568, :15574 and :15594, three VisDrone numbers that are wrong or unsourced (medium).**
   - "44%" is measured against the unannealed epoch-12 checkpoint of the same 30-epoch run; a real 12-epoch run gives +34%.
   - "43×" appears in no artifact; the baseline the same sentence uses gives 25×.
   - "one item closes 31%" spans several changes; the true one-item delta closes 21%.

---

# Findings — content.tex 15506–16568 (Bestiary: detection / inspection / ArASL / plant / remote sensing / BraTS / segmentation entries)

### content.tex:15585 — "beats the PyTorch replica by 54%" compares different decodes and different recipes, then calls it implementation quality

**Kind:** overclaim
**Severity:** high
**Says:** "The stack beats the hand-written PyTorch replica of this same architecture by $54\%$ ... The replica, not YOLOv8, is the yardstick: it isolates implementation quality from architecture"
**Actually:** 0.2363/0.1532 = 1.54, but 0.2363 is the 30-epoch, HSV+hflip+affine, `FPN_CLSW=none`, class-focal γ=2 arm scored with the **multilabel** decode (`--multilabel --topk 3000`). The replica's 0.1532 is a 12-epoch, no-aug run scored with **argmax**. `planning/archive/visdrone_detector.md` (§"Multilabel decode is worth +7.6% for free") says: "⚠ Do not mix decodes in a comparison. The PyTorch replica's 0.1532 and every number recorded before today are argmax. Replica-to-Lean, like for like, is 0.1532 vs 0.1774 = +15.8%." At matched recipe *and* decode (`ctrl12`, 12 ep, no aug, argmax) the stack scores 0.1526, which is 99.6% of the replica (`runs/2026-08-28-visdrone-fpn-rebuild/README.md`: "now 99.6% of the twin"). So the 54% is recipe and decode. It says nothing about implementation quality, and at a matched recipe the stack ties the replica. Also, the replica is "ultralytics, matched" in that README, which doesn't fit "hand-written".
**Fix:** Say the stack ties the replica at a matched recipe (0.1526 vs 0.1532), and that the 30-epoch recipe is +54% over that baseline. Or drop the "isolates implementation quality" sentence. Check what "hand-written" refers to (`demos/visdrone/train_baseline.py`).

### content.tex:15539–15546, 15563–15571 — Table tab:visdrone_results mixes argmax and multilabel decodes and changes loss settings between rows, but the prose reads the rows as aug×schedule cells

**Kind:** inconsistency
**Severity:** high
**Says:** "Augmentation and schedule length are one decision ... the top five rows only mean something together ... Photometric augmentation recovers it, but at that strength 12 epochs still beats 50."
**Actually:** Per the ladder in `planning/archive/visdrone_detector.md` (≈ lines 748–763):
- "12 ep, +photometric aug 0.1961" is `cfoc2`: aug, `clsw=none`, class focal γ=2, **multilabel** decode.
- "50 ep, +photometric aug 0.1674", "12 ep no aug 0.1526" and "50 ep no aug 0.1243" are `aug50`/`ctrl12`/`long50`: `clsw=sqrt`, γ=0, **argmax** decode.
- The PyTorch row is also argmax.

So "12 beats 50 at that strength" (0.1961 vs 0.1674) is confounded by the loss changes and by a +7.6% free decode change. The like-for-like comparison is `aug12` (best e10) 0.1798 argmax vs `aug50` 0.1674, so the direction holds but the size does not. The same doc warns: "⚠ Never mix decodes in a comparison." Also, the "photometric" pack is HSV jitter **+ horizontal flip** (`demos/MainYolov1VisdroneFpn.lean:259–260`: "horizontal flip (geometric"), so the label is partly wrong.
**Fix:** Re-score the argmax rows with the multilabel decode, or add a decode/loss column. Replace the 0.1961 row with the matched argmax `aug12`/`clswnone` numbers. Call the pack "HSV + flip" rather than "photometric".

### content.tex:15568 — "makes 30 epochs worth 44% more than 12" is measured against an unannealed mid-schedule checkpoint

**Kind:** wrong-number
**Severity:** medium
**Says:** "Augmentation that changes object scale inverts the ordering again: it makes 30 epochs worth $44\%$ more than 12."
**Actually:** 0.2363 / 0.1641 = 1.44, but 0.1641 is the **e12 checkpoint of the same 30-epoch cosine run** (`runs/2026-09-01-visdrone-affine/README.md` epoch curve). The LR has not annealed by then, so this is not a 12-epoch run. The planning doc itself warns that intermediate checkpoints are not annealed and that "only the finals are comparable" (08-28 README). The real 12-epoch affine arm (`aff50`, annealed at 12) scored 0.1763, which gives +34%. Against the 12-epoch photometric best (0.1961) the gain is +20.5%, the figure the planning doc headlines in §13a-bis.
**Fix:** Use +34% (vs `aff50` e12), or say "+20% over the best 12-epoch arm". Or explicitly call 0.1641 the run's own epoch-12 point.

### content.tex:15574–15575 — "narrowed it from 43×": no source gives 43×

**Kind:** wrong-number
**Severity:** medium
**Says:** "Per-class AP runs from car down to bicycle, a spread of $19\times$, and scale augmentation narrowed it from $43\times$"
**Actually:** After (aff30 e28): car 0.6851 / bicycle 0.0356 = 19.2× ✓. Before, on the baseline the same sentence uses for the +59/+41/+40/+7% figures (`cfoc2`, `runs/2026-09-01-visdrone-affine/README.md`): car 0.6428 / bicycle 0.0253 = **25.4×**. `ctrl12` gives 0.573/0.015 = 38× (the 08-28 README says "38x"). I found 43× in no artifact.
**Fix:** "from 25×" (same baseline as the per-class deltas). Or name the arm that gives 43× and cite it.

### content.tex:15594–15597 — "one item of that recipe closes 31% of it"

**Kind:** overclaim
**Severity:** medium
**Says:** "The distance to the field is recipe, not architecture, and one item of that recipe closes $31\%$ of it."
**Actually:** 31% only comes out of (0.2363−0.1674)/(0.391−0.1674) = 30.8%, i.e. measured from `aug50`. Between `aug50` and `aff30` the class weights changed (sqrt→none), class focal was added (γ=2), the decode switched from argmax to multilabel (+7.6% by itself), the schedule went 50→30, and box-aware affine was added. That is several items, not one. Measured from `cfoc2` (the true one-item delta: affine + schedule) the closure is (0.2363−0.1961)/(0.391−0.1961) = 21%.
**Fix:** "scale augmentation and a 30-epoch schedule close a fifth of it". Or state the baseline explicitly.

### content.tex:15907–15911 / 15842–15844 — "95.7% of those neighbours carry the test image's own label": the figure is over all test images, not the within-6 subset

**Kind:** statement-mismatch
**Severity:** medium
**Says:** "Under \texttt{random}, $92.3\%$ of test images have a training image within $6$ grey levels and $95.7\%$ of those neighbours carry the test image's own label; under \texttt{blocked}, $6.4\%$ and $28.6\%$."
**Actually:** In `runs/2026-09-17-arasl/README.md` the 95.7% / 28.6% row is "nearest train image has the same label (= 1-NN accuracy)", computed over **all** test images. It is the same number as the table's "1-NN on 16×16 thumbnails 95.65 / 28.60". "Of those neighbours" makes it sound like the share among the 92.3% / 6.4% near-duplicates. Among the 6.4% leaked blocked images the label agreement is far higher than 28.6%: the net is 98.46% accurate on them.
**Fix:** "...within 6 grey levels, and the nearest training image of every test image carries its label 95.7% of the time (blocked: 6.4% and 28.6%)."

### content.tex:15959–15962 — "except by the last two rows" points at the published rows

**Kind:** wrong-ref
**Severity:** medium
**Says:** "PlantDoc is never seen in training except by the last two rows of Table~\ref{tab:plantvillage_results}, which learn from it five-fold"
**Actually:** The last two rows of tab:plantvillage_results are "published, PlantVillage random split" and "published, on images from elsewhere". The rows that train on PlantDoc are the **three** field-label rows: "+ 250 field labels", "+ all field labels", and "+ backgrounds, then 250 / all".
**Fix:** "except by the three field-label rows".

### content.tex:16138–16141 — "Near infrared alone buys four of the ten points" (it buys two)

**Kind:** wrong-number
**Severity:** medium
**Says:** "Near infrared alone buys four of the ten points and the red edge and short-wave infrared buy the rest"
**Actually:** Table 16120: rgb 87.4, rgbn 89.3 in the Amazon, so +1.9 points of the 9.6. Same in `runs/2026-09-29-rs-phase3/README.md` (87.37 → 89.30). "Four" matches only pasture *recall* (74.4 → 78.1). The phase-3 README has the same error ("NIR alone (`rgbn`) buys four points").
**Fix:** "Near infrared alone buys two of the ten points; the red edge and short-wave infrared buy the other eight."

### content.tex:16172–16173 — "the arm without them travels best" is false in the Amazon and in September

**Kind:** overclaim
**Severity:** medium
**Says:** "They had learned Europe's sky, which is why the arm without them travels best."
**Actually:** `ms10` (no atmospheric bands) vs `all`:
- Amazon: 96.95 vs **97.02**
- Cerrado September: 32.76 vs **35.39**
- Cerrado March: **59.21** vs 53.82

`runs/2026-09-29-rs-phase3/tables_final.txt` / README Table 1. `ms10` travels best only in March. The README's "ms10 ... is the best zero-shot arm in the Amazon" is also wrong (the book's table bolds both at 97.0).
**Fix:** "...which is why the arm without them is the one that holds up in March" or "ties `all` in the Amazon and beats it by five points in March".

### content.tex:16134–16136 — the published band ordering "was the ImageNet pretraining, not the spectrum": asserted, not measured

**Kind:** overclaim
**Severity:** medium
**Says:** "the published ordering --- RGB 98.6, colour-infrared 98.3, short-wave infrared 97.1 --- was the ImageNet pretraining, not the spectrum."
**Actually:** No arm here uses ImageNet pretraining, and no pretrained-vs-scratch comparison of band orderings was run (`runs/2026-09-29-rs-phase1/README.md` states it as a reading, not a measurement). The difference could equally come from architecture (ResNet-50 vs a 0.57M CNN), split (random 80/20 vs torchgeo test list) or schedule.
**Fix:** "...probably reflects the ImageNet pretraining (ResNet-50 fine-tuned on three bands at a time) rather than the spectrum; a from-scratch net reverses it."

### content.tex:16239 — tab:brats_dice reports the from-scratch arm without saying so

**Kind:** inconsistency
**Severity:** low
**Says:** "ResNet-34 UNet (\texttt{unet-brats-r34}) & 0.741 & 0.910 & 0.867 & 0.856"
**Actually:** These are the **scratch** (He-init) arm's numbers. The ImageNet-bootstrap `r34` arm is 0.743 / 0.912 / 0.869 / 0.856 (`runs/2026-09-25-brats-r34-xla/README.md`). The per-patient table's first row, "ResNet-34 UNet, ImageNet bootstrap", is the r34 arm, so the two tables silently switch arms. The skips table, which needs the scratch arm, is consistent.
**Fix:** Label the row "from scratch", or add the bootstrap row.

### content.tex:16276–16279 — "the same `useSeg` flag in `TrainConfig`" is stale

**Kind:** stale
**Severity:** low
**Says:** "This rides the same \texttt{useSeg} flag in \texttt{TrainConfig} that the NLP subsection's TinyGPT uses"
**Actually:** `TrainConfig` has no `useSeg` field. `useSeg` is a local computed by `let useSeg := lossKind.isSeg` in `LeanMlir/Train.lean:182`, from `cfg.lossKindFor`. TinyGPT sets `lossKind := some .perPixelCE` (`demos/MainTinyGptShakespeare.lean:141`).
**Fix:** "the same per-pixel CE loss (\texttt{lossKind := .perPixelCE} in \texttt{TrainConfig}) that TinyGPT uses".

### content.tex:16298–16300 — "a small C colormap routine": the colormap is Lean

**Kind:** stale
**Severity:** low
**Says:** "same artifact the trainer produced, plus a small C colormap routine."
**Actually:** The overlay colours and blending are `regionColor` and the alpha-blend in `demos/MainBratsPredict.lean:105–118` (Lean). Grepping `ffi/*.c` finds no colormap.
**Fix:** "plus a small colormap routine in the Lean driver".

### content.tex:16053–16061 — field gains are measured from different baselines

**Kind:** inconsistency
**Severity:** low
**Says:** "In the field it buys three and a half points, $17.8\pm1.8$ to $21.5\pm1.3$ ... Field labels are what work: ten per class buy seven points, all two thousand buy twenty-seven"
**Actually:**
- 21.48 − 17.80 = 3.7 (the README says "+3.7"), so "three and a half" undersells it slightly.
- The field rows are fine-tuned from a single base checkpoint (README: "from base"; per the run dirs, seed 1, PlantDoc 15.79).
- "Seven" = 22.69 − 15.79 is measured from seed 1, while "twenty-seven" = 45.00 − 17.80 is measured from the 3-seed mean (from seed 1 it is 29.2, the README's "+29"). Against the 3-seed mean, ten per class buys 4.9, not 7.
- "Ten per class" is 250/28 ≈ 9. One PlantDoc class has only 2 images.

**Fix:** Pick one baseline. From seed 1: +7 and +29. From the mean: +5 and +27. Say "nearly four points" for the background fix.

### content.tex:16027–16029 — "Both explainers say ... 85% of it"

**Kind:** statement-mismatch
**Severity:** low
**Says:** "Both explainers say the same reassuring thing: the evidence is the leaf, $85\%$ of it."
**Actually:** Only Shapley says 85%. The CAM says 71% (tab:plantvillage_probes, row 3 of the lower block).
**Fix:** "the evidence is mostly the leaf: 85% by Shapley, 71% of the CAM's heat."

### content.tex:16008 / 16030 — the "leaves on black" probe is reported as 60 with no spread, but seeds run 49–72

**Kind:** lead
**Severity:** low
**Says:** "the same leaves on a black background & \textbf{60}" / "Put the same leaf on black and the net loses forty points"
**Actually:** `runs/2026-09-17-plant/diagnostics_summary.json`: base seeds 49.08 / 58.69 / 72.01 (mean 59.9, sd 11.5). The loss is 28–50 points depending on seed. Other cells mix the 3-seed mean (60, 25, 4.4) with seed 1 (+backgrounds: leaf-on-median 99 = 98.62 s1, CAM 79 = s1).
**Fix:** Add "(49–72 over three seeds)" or ± sd. Mark which cells are single-seed.

### content.tex:16093–16096 / 16180–16182 — "Rondônia in June" and "in March" don't cover all the scene dates

**Kind:** inconsistency
**Severity:** low
**Says:** "Sentinel-2 scenes of 2023 over Rond\^onia in June, and over western Bahia in September and again ... in March"
**Actually:** `runs/2026-09-29-rs-phase2/README.md` §2: the Amazon tile 20LMP is 2023-07-04. The "March" Cerrado scenes are 2023-01-31, 02-10, 03-10, 03-25, 04-01 and 04-27; the README's own band-mean table calls them "Feb–Apr".
**Fix:** "in June–July" and "in the wet season (January–April)". Or keep "March" with a footnote.

### content.tex:16156–16158 — "A Cerrado pasture's red and short-wave reflectance doubles"

**Kind:** wrong-number
**Severity:** low
**Says:** "A Cerrado pasture's red and short-wave reflectance doubles between March and September"
**Actually:** The source is the band means over **all** Cerrado chips, most of them savanna (phase-2 README §4): red 0.065 → 0.121 (×1.9), SWIR1 0.217 → 0.322 (×1.5), SWIR2 0.104 → 0.196 (×1.9). The figures are not pasture-specific, and SWIR1 is only ×1.5.
**Fix:** "A Cerrado chip's red and SWIR-2 reflectance nearly doubles (SWIR-1 rises by half)".

### content.tex:16163–16166 — the fine-tune rows: "every arm" and "on all of them"

**Kind:** statement-mismatch
**Severity:** low
**Says:** "Fine-tuned from the European weights on 300 Brazilian labels, every arm recovers about 90, the thirteen-band arm a point more; on all of them the European start is worth nothing over scratch."
**Actually:** Only rgb / all / ir were fine-tuned. `ms10` and `rgbn` were not (phase-3 README Table 3). "Worth nothing over scratch" holds only with **all** labels; there is no scratch row at 300 labels. "On all of them" reads as "on all arms".
**Fix:** "...the three fine-tuned arms recover about 90 ...; with all the labels, the European start is worth nothing over scratch."

### content.tex:16100–16105 — "the stem's input channels as the only change"

**Kind:** overclaim
**Severity:** low
**Says:** "Chapter~\ref{chap:bn}'s CIFAR CNN with the stem's input channels as the only change"
**Actually:** At 64×64 the flatten is 4·4·32 = 512 wide, not the chapter's 128, so the first dense layer's fan-in also changes (128 → 512). Same pattern in ArASL at 15848 ("Two numbers change in the network"): there it is three (stem, flatten fan-in, output), though that paragraph does mention the 512 flatten.
**Fix:** "...the stem's input channels (and the flatten width the 64×64 input implies)".

### content.tex:16368 — "+0.17 on ET" compares across arms

**Kind:** wrong-number
**Severity:** low
**Says:** "The skips are worth more per patient than per pixel, $+0.17$ on ET against $+0.12$."
**Actually:** The no-skip arm is from scratch. Like-for-like is scratch 0.783 − no-skip 0.620 = **0.163** (≈ +0.16). 0.17 only comes from the ImageNet-bootstrap row (0.790 − 0.620). The pooled +0.12 is scratch vs scratch.
**Fix:** "+0.16".

### content.tex:16414–16415 — "Rank-5 convolution itself runs at 77% of the 2D per-voxel rate"

**Kind:** wrong-number
**Severity:** low
**Says:** "Rank-5 convolution itself runs at 77\% of the 2D per-voxel rate through XLA on this card"
**Actually:** `runs/2026-09-29-brats-25d/gate0.log`: 3D 4.64–4.75 Mvox/s vs 2D 5.95 Mvox/s, which is **78–80%** (4.68/5.95 = 78.7%). 77% is 1/1.3, taken from the rounded "1.3× slower". The measurement is also the whole 3D UNet (23.5M) fwd+bwd+update in JAX against a 7.8M 2D UNet, not "rank-5 convolution itself".
**Fix:** "The whole 3D UNet step runs at about 79% of the 2D UNet's per-voxel rate".

### content.tex:16381 — "this section's UNet with $3^3$ kernels"

**Kind:** inconsistency
**Severity:** low
**Says:** "a 3D UNet --- this section's UNet with $3^3$ kernels and $2^3$ pools, 23.5M parameters"
**Actually:** It is `unetBrats`'s shape (the from-scratch 240² UNet, 7.8M in 2D; `gate0.log`, brats-25d README). It is not the section's ResNet-34 UNet (24.5M), which "this section's UNet" most naturally means.
**Fix:** "the from-scratch BraTS UNet (\texttt{unetBrats}) with $3^3$ kernels...".

### content.tex:16377–16378 — "ties the 2D anchor within 0.004 on every metric, pooled and per patient"

**Kind:** lead
**Severity:** low
**Says:** "it ties the 2D anchor within $0.004$ on every metric, pooled and per patient."
**Actually:** brats-25d README pooled table: 2.5D r34 TC 0.874 vs the 2D peak 0.869, a difference of 0.005 at the printed precision. Per patient, ET 0.788 vs 0.790 and TC 0.824 vs 0.821 are fine. It may be within 0.004 unrounded.
**Fix:** Check the unrounded log values, or say "within 0.005".

### content.tex:15519 — "a median image holds seventy objects" (70.7 is the mean)

**Kind:** wrong-number
**Severity:** low
**Says:** "drone-altitude imagery where a median image holds seventy objects"
**Actually:** 38,759 val boxes / 548 images = 70.7, the **mean** (`planning/archive/visdrone_detector.md:193`: "val averages 70.7 boxes/img"). No median is recorded.
**Fix:** "an average image holds seventy objects".

### content.tex:15802–15805 — "Photometric augmentation's $+0.007$" has the wrong sign

**Kind:** typo/render
**Severity:** low
**Says:** "Photometric augmentation's $+0.007$ is one run against one run"
**Actually:** Turning augmentation **off** scored +0.007 (0.630 vs 0.623, tab:neudet_results; README: "off is +0.007 on test"). The effect of augmentation is −0.007.
**Fix:** "Photometric augmentation's $-0.007$" or "turning photometric augmentation off gains $0.007$".

### content.tex:15810–15811 — "both arms are still rising at epoch 30"

**Kind:** overclaim
**Severity:** low
**Says:** "and both arms are still rising at epoch 30."
**Actually:** Val sweep (`runs/2026-09-17-neudet-fpn-run1/README.md`): the FPN recipe peaks at e28 (0.636) and is 0.631 at e30. The grid arm peaks at e28 (0.642), then 0.636. The no-bootstrap arm peaks at e26. Only the noaug arm is highest at e30.
**Fix:** "both arms are still near their peak at epoch 30" or "have not plateaued long".

### content.tex:15771–15774, 15791–15794 — the VisDrone "same two heads" table pairs unequal recipes

**Kind:** overclaim
**Severity:** low
**Says:** "same backbone, same bootstrap, same scorer, same lowerer in all four cells."
**Actually:** The VisDrone grid arm is the archived 12-epoch recipe, with none of the FPN arm's affine, class focal, `clsw=none` or 30 epochs (`runs/2026-09-17-neudet-fpn-run1/README.md` Table 2, "archived recipe"). The conclusion survives (even the 12-epoch no-aug FPN, 0.1526, is 4× the grid), but "six times behind" mixes head and recipe.
**Fix:** Add "(recipes differ: 30 ep + scale aug vs the archived 12-ep grid recipe)", or compare against FPN `ctrl12` 0.1526 (4×).

### content.tex:15653 vs 15689–15691 — Mask R-CNN counts `.bottleneckBlock` as new, DETR calls it "existing"

**Kind:** inconsistency
**Severity:** low
**Says:** Mask R-CNN: "\emph{Two} new primitives (\texttt{.bottleneckBlock} + \S~\ref{layer:fpnModule})" ... and later "The FPN cross-scale add is the one thing that demanded a new bundled primitive". DETR: "reuses existing \texttt{bottleneckBlock}".
**Actually:** `.bottleneckBlock` is introduced at the ResNet-50 entry (content.tex:15021, "\emph{One} new primitive (\texttt{.bottleneckBlock})"). Mask R-CNN's own paragraph contradicts its "Two". Related: SegFormer's "One new primitive (patchMerging)" was already introduced by Swin (15483), and SAM's "One new primitive (transformerDecoder)" by DETR (15687). Under the counting convention at 14420–14432 ("not in Part 1") they are defensible, but then DETR's "reuses existing" is the odd one out.
**Fix:** Make Mask R-CNN "One new primitive (fpnModule); reuses bottleneckBlock". Or settle on one convention throughout.

### content.tex:15642 — YOLOv1 listing comment "two 3×3 at 7×7" contradicts the prose

**Kind:** inconsistency
**Severity:** low
**Says:** listing "-- Block 6: two 3×3 at 7×7"; prose (15607): "the spec's own body ends at $28 \times 28$"
**Actually:** With stride-1 `conv2d` and four `maxPool 2 2`, the spec's Block 6 runs at 28×28 (448/16). The comment is copied from `Bestiary/YOLO.lean:145` and describes the paper, not this spec.
**Fix:** "-- Block 6: two 3×3 (7×7 in the paper; 28×28 in this spec)", in both the book and `YOLO.lean`.

### content.tex:16510–16519 — SegFormer decoder: "1M" and "~3M" in the same paragraph

**Kind:** inconsistency
**Severity:** low
**Says:** "shared MLP decoder (1M single-scale approx)" ... "SegFormer's decoder is $\sim$3M params across all sizes"
**Actually:** `segformerDecoder.totalParams` = 1,099,926 (evaluated from `Bestiary/SegFormer.lean`). The paper's decoder is 0.4M for B0 and 3.3M for B1–B5, so "across all sizes" is also wrong for B0. The "paper 3.7M / 25M / 82M" encoder figures match the HF/timm ImageNet-classifier checkpoints (mit-b0 3.7M, b2 25.4M, b5 82M), not the paper's Table 1 encoder column (3.4 / 24.2 / 81.4M).
**Fix:** "the paper's decoder is ~3.3M (0.4M for B0); ours approximates it at 1.1M". Cite the encoder counts as checkpoint sizes, or use the paper's numbers.

### content.tex:16552–16553 — "image encoder accounts for ~99% of each variant's parameter budget"

**Kind:** wrong-number
**Severity:** low
**Says:** "The image encoder accounts for $\sim$99\% of each variant's parameter budget"
**Actually:** Lean counts: ViT-B 88.79M / (88.79 + 3.29) = 96.4%; ViT-L 98.9%; ViT-H 99.5%. With the paper's totals (91M total), ViT-B's encoder is about 98% at most.
**Fix:** "96–99%".

### content.tex:15662 — Mask R-CNN "~63M in total, matching paper"

**Kind:** lead
**Severity:** low
**Says:** "$\sim$63M in total, matching paper."
**Actually:** The sum of the Lean counts is 45.84 + 14.31 + 2.64 + 0.59 = 63.4M ✓. However, He et al. 2017 does not report a parameter count as far as I know. ~63M matches common R101-FPN implementations (Detectron2), not the paper.
**Fix:** "matching the reference R101-FPN implementation".

### content.tex:15954 — PlantDoc size and classes differ from the paper

**Kind:** external-fact
**Severity:** low
**Says:** "PlantDoc (Singh et al.\ 2020; CC~BY~4.0) is $2{,}578$ photographs ... in 28 classes"
**Actually:** The paper (CoDS-COMAD 2020, arXiv:1911.10317) reports 2,598 images, 13 species and 27 classes. 2,578 images in 28 folders is the GitHub classification release as downloaded (`runs/2026-09-17-plant/README.md` Gate 0).
**Fix:** "the public release's 2,578 photographs (2,598 in the paper)".

### content.tex:15606–15611 — YOLOv5/v8 counts are far below the real models; the "single-scale" caveat is easy to miss

**Kind:** lead
**Severity:** low
**Says:** "YOLOv5s/m (3M/8M single-scale), YOLOv8n/s (0.7M/2.9M single-scale)"
**Actually:** Verified against Lean (3.03M / 8.10M / 0.74M / 2.88M) ✓. The real models are 7.2M / 21.2M / 3.2M / 11.2M (Ultralytics). The labels say "single-scale" but don't say these are a third to a quarter of the published sizes, which matters given the paper-count comparisons elsewhere in this section.
**Fix:** Optionally add "(published 7.2M / 21.2M / 3.2M / 11.2M with the full neck and heads)".

## Checked and fine

- VisDrone: 6,471 train images; 548 val; 38,759 uncapped val boxes; 56-box cap drops 34.9% (`visdrone_detector.md:193`).
- VisDrone: DIoU box loss, focal objectness and class focal in the FPN loss (`MlirCodegen.lean` `emitAnchorYoloLoss`).
- VisDrone: largest anchor 0.181×0.149 (`MainYolov1VisdroneFpn.lean:46`).
- VisDrone table values: 0.2363 / 0.769 / 0.487; 0.1961 / 0.749 / 0.441; 0.1674 / 0.703 / 0.429; 0.1526 / 0.682 / 0.393; 0.1243 / 0.669 / 0.369; 0.1532 / 0.677 / 0.400; YOLOv8s 0.140 (random init, 448 squash, 12 ep; `yolo_scoring.md:54`); 0.391 / 0.400.
- VisDrone derived numbers: −19% (0.1243/0.1526); per-class +59 / +41 / +40 / +7%; 19.2× after; "8× the epochs" (100 vs 12).
- VisDrone speed: 65 fps (548 images in 8.35 s); Orin Nano 55.9 fps, 25 W, TensorRT, u8, clocks pinned (`deploy/DETECTOR.md:165`).
- Figure files exist: `visdrone_fpn.jpg`, `neudet_fpn.png`, `arasl_signs.png`, `plant_lab_to_field.png`, `remote_sensing_wavelengths.jpg`, `brats_r34_unet.png`. The VisDrone figure shows the GT/prediction rows, the legend and the counts.
- NEU-DET data: 1,800 images, 6 classes, 200×200, VOC boxes; split 1,080/360/360 (180/60/60, seed 0); 2.35 boxes/img; 53% span more than half the frame; P5 98.1%, P3 0%.
- NEU-DET table: e28 0.623 / 0.992 / 0.625; noaug e30 0.630; noboot e26 0.555; grid e28 0.607 / 0.917 / 0.609; val-peak epochs match.
- NEU-DET published rows: 0.73–0.78 at 640 px / 300 ep on 1,440/180/180; ≈0.83 improved (Zhou et al. 2025).
- NEU-DET derived: per-class crazing 0.29, RS 0.41, others 0.66–0.84; 4,050 steps (135×30); ~24k VisDrone steps; six times (0.236/0.039); P5 anchors mean IoU 0.52; +0.07 bootstrap.
- NEU-DET citations: Song & Yan 2013; He et al. 2020 boxes.
- ArASL data: 54,049 images, 32 classes, 1,293–2,114 per class; 3.3 vs 33 grey levels; 14,336 chains of 3.8; 92.3 / 6.4%; 306-file median gap; 37.5% val leak.
- ArASL table: 98.62 ± 0.10 / 77.94 ± 0.80; Wilson ±0.2 / ±0.6 on ~16,200 trials; 99.73 / 98.46; 85.26 / 76.53; n = 416; 98.21 / 71.03; 94.86 / 42.09; 53.20 / 15.37; 95.65 / 28.60.
- ArASL derived: losses 38 / 53 / 21 points; 0.58M params (581,424 recomputed); per class fa 16.5, sheen 100, al 94, seen 100; fa→gaaf 181 over three runs (60.7 per run × 3 = 182 = 181 + 1); taa↔thaa both directions; recipe (Adam 1e-3, warmup + cosine, batch 64, 30 ep, no aug, ~5.5 min).
- ArASL citations: arXiv:2410.00681 (Balat et al. 2024, ViT/Swin up to 99.6% on ArSL2018) and arXiv:2501.08169 (EfficientNet-B2, 99.48%) both support "99.3–99.6, ViT, EfficientNet-B2, 2024–25".
- PlantVillage data: 54,305 images, 38 classes; 10,709 test; 2,062 per fold; chance 3.6% / 2.6%.
- Plant table: 99.57 ± 0.06 / 17.80 ± 1.77; 99.72 / 16.56; 99.07 / 11.60; 99.44 ± 0.15 / 21.48 ± 1.25; 99.62 / 19.24; 22.69; 45.00; 26.57 / 42.05.
- Plant probe table: Shapley 85 / 96%; bg helps 88 / 71%; CAM 71 / 79%, uniform 59%; flat 4.4 / 2.6; bg-only 25 / 14; 40 min / 10 epochs.
- Plant citation: Mohanty 2016 99.35% and ~31% on images from elsewhere.
- Remote sensing table: every cell matches `runs/2026-09-29-rs-phase3/README.md` Table 1.
- Remote sensing Brazil training: 94.2 / 95.8; fine-tunes ~90.
- Remote sensing Shapley: 33–35% visible; SWIR 13 → 22%; −2.96 nats; 32 coalitions.
- Remote sensing derived: 666 of 884; grass-merged 76 and 65–73; savanna→forest 42%; 3,620 chips; 2,000 savanna; 24–41% same answer; pasture recall 74 / 95; forest ≥99.8.
- Remote sensing data: EuroSAT 27,000 chips / 34 countries / 13 bands 443–2190 nm / 10 classes; Helber ResNet-50 98.57 / 98.30 / 97.05; 80 epochs, 3 seeds, dihedral aug, ~5 min.
- BraTS data and model: 24,515,652 params; 14,415 / 2,569 slices; 411 / 73 patients (= 484 MSD Task01); MSD modality order and labels; BraTS 2021 1,251.
- BraTS results: skips table 0.633 / 0.871 / 0.814 / 0.733; +0.108 mIoU, +0.123 ET; per-patient table rows; 0.0004 agreement; every-slice within 0.003; sd 0.07–0.19.
- BraTS 3D: tab:brats_3d (min-ET 200) all 16 cells and false-alarm % (8,060 slices); paired 0.009 / 0.009 / 0.004; 2.5D stem only change.
- BraTS executables: `unet-brats-r34`, `brats-predict`, `brats-eval` in the lakefile; the bit-identical tap-path probe is described in `MainUnetBratsR34.lean`.
- Bestiary listings match source exactly: `yolo`, `maskRCNNBackboneR101`, `detrR50`, `unet`, `deeplabv3plusResnet101`, `segformerB2`, `samEncoderH`.
- Bestiary param counts, evaluated in Lean with `totalParams`:
  - YOLO: v1 271.7M; v3 40.8M; v5s/m 3.0 / 8.1M; v8n/s 0.74 / 2.88M.
  - Mask R-CNN: 45.8 / 14.3 / 2.6 / 0.6M.
  - DETR: R50 41.7M, R101 60.7M (paper 41 / 60M).
  - UNet: 31.4M.
  - DeepLab v3+: 59.2M / 5.7M.
  - SegFormer: B0 2.6M, B2 18.9M, B5 61.2M (~25% under).
  - SAM: 88.8 / 307.3 / 635.9M.
  - ASPP ≈15M (by hand).
- arXiv IDs and years: YOLO 1506.02640; Mask R-CNN 1703.06870; DETR 2005.12872; UNet 1505.04597; DeepLab v3+ 1802.02611; SegFormer 2105.15203; SAM 2304.02643; EfficientSAM 2312.00863 (Xiong et al. 2023).

Tally: 37 findings — 2 high, 9 medium, 26 low (including 4 leads).

---

## Slice 18

I could not write findings-18.md: the Write tool refused report files for subagents. The full findings for content.tex lines 16569–17693 are below instead, so you will need to save them yourself if you want the file.

**Counts:** 1 high, 10 medium, 25 low (36 findings).

**Top 3:**
1. **17575 (high):** "Each network is best on the noise it trained on" is false. On Gaussian test data the real-trained CNN (ρ½ 6.65) beats the Gaussian-trained one (6.80).
2. **17543 (medium):** "The filter sits on its closed form" is wrong. The PyCBC search (5.27) runs 0.36 SNR above its Q₂ closed form (5.63); the gate1 log says "above it at low SNR".
3. **17020 (medium, stale):** the CIFAR / sinusoidal-time / attention DDPM variants are not "archived beside it". Commit fe04682b deleted them, so "the CIFAR variant embeds it with … NeRF" points at code that is gone.

# Findings — content.tex 16569–17693 (Bestiary: beyond recognition)

### content.tex:17575 — "Each network is best on the noise it trained on" is false
**Kind:** wrong-number / overclaim. **Severity:** high
**Says:** "Each network is best on the noise it trained on, by a few tenths."
**Actually:** `runs/2026-09-11-gw-gate1/table2_cifar8w.log` and the book's own table: tested on Gaussian, the Gaussian-trained CNN gets 6.80 and the **real-trained CNN gets 6.65**, which is better. The real-trained net wins on both test sets. Only the real column supports the sentence (6.91 vs 7.17).
**Fix:** "The network trained on real strain is better on both noises: by a few tenths at 10⁻², and by a wide margin at 10⁻³."

### content.tex:17543 — "The filter sits on its closed form"
**Kind:** overclaim. **Severity:** medium
**Actually:** The book's own table has the closed form at ρ½ 5.63 and the search at 5.27. At ρ = 4 they are 0.14 vs 0.26, and at ρ = 6 they are 0.80 vs 0.90. `gate1_pfa1e-2.log` says: "matched filter network rho50 5.27 vs theorem 5.63 (d 0.36) … search statistic, above it at low SNR". Only the known-time rows sit on their theorem.
**Fix:** Say the search runs above its closed form at low SNR, because maximising over time and delay lets noise help. Give the CNN gap against both the theorem (1.2) and the search (1.5).

### content.tex:17020–17024 — CIFAR DDPM variants "archived beside it"
**Kind:** stale. **Severity:** medium
**Actually:** `demos/archive/` contains only `MainYolov1VisDrone448.lean`. Commit fe04682b deleted `MainCifarDdpm{Train,Sample,SincosTrain,SincosSample,AttnTrain,AttnSample}.lean`. The line "the CIFAR variant embeds it with the positional-encoding primitive NeRF introduced" also refers to the deleted code.
**Fix:** Drop the parenthetical or say "removed; see git history". Point the NeRF remark at `Bestiary/Diffusion.lean`'s `ddpmTimeEmbed`.

### content.tex:17369–17371 — "recovers the quadrature row to the last digit"
**Kind:** overclaim. **Severity:** medium
**Actually:** `table1.txt`: quadrature 0.806/0.129/0.065, ⟨U⟩ −113.6, ΔF −36.6. Reweighted: 0.805/0.129/0.066, ⟨U⟩ −112.8, ΔF −36.7.
**Fix:** "…populations to within 0.001 and ΔF to 0.1."

### content.tex:17418–17420 — reflow one step "where the independent coupling needs ten"
**Kind:** wrong-number. **Severity:** medium
**Actually:** The independent coupling is at 8.6× at NFE 10. It reaches 4.9× only somewhere between NFE 10 and 50.
**Fix:** "…4.9×, better than the independent coupling at ten steps (8.6×)."

### content.tex:17508–17510 — "Half the windows carry an IMRPhenomD chirp"
**Kind:** wrong-number. **Severity:** medium
**Actually:** `preprocess_gw.py:465` sets `p_inject=dict(train=0.5, val=1/3)`. Validation is 4,051 injected and 8,177 noise-only windows.
**Fix:** "Half the training windows and a third of the validation windows…"

### content.tex:17586–17589 — FNO "the paper's ∼926k model"
**Kind:** external-fact. **Severity:** medium
**Actually:** Li et al. 2021 (arXiv:2010.08895), Table 1 (Navier–Stokes 64×64), lists FNO-2D at **414,517** parameters and FNO-3D at 6,558,537 (checked in the PDF text). The book's 926,177 is right for this spec: it counts complex weights as two reals and assumes a 3-channel (a, x, y) input, whereas the paper's NS FNO-2D takes 10 past timesteps plus coordinates. `Bestiary/FNO.lean:37,125` repeats the claim.
**Fix:** Call 926k this config's real-parameter count and cite the paper's 414,517 separately.

### content.tex:17457–17459 — FourCastNet "MLPs, three quarters of a block either way"
**Kind:** math. **Severity:** medium
**Actually:** The MLP is 4.72M. In the attention block (≈7.09M) that is 67%; in the AFNO block (≈5.02M) it is 94%. Neither is ¾. `Bestiary/FourCastNet.lean:34,112` has the same "¾".
**Fix:** "two thirds of the attention block, nearly all of the AFNO one".

### content.tex:16858 — QANet "3--4× training speedup"
**Kind:** external-fact. **Severity:** medium
**Actually:** The arXiv:1804.09541 abstract says "3x to 13x faster in training and 4x to 9x faster in inference". `Bestiary/QANet.lean:13` repeats the error.
**Fix:** "3–13× faster training".

### content.tex:16685–16690 — "a flag (`useSeg` in `TrainConfig`)"
**Kind:** command/path. **Severity:** medium
**Actually:** `TrainConfig` has no `useSeg` field. The demo sets `lossKind := some .perPixelCE` (`demos/MainTinyGptShakespeare.lean:141`). `useSeg` is derived from it (`LeanMlir/Train.lean:182`, `let useSeg := lossKind.isSeg`) and is a codegen parameter.
**Fix:** "through a loss kind (`lossKind := .perPixelCE` in `TrainConfig`)".

### Low-severity findings

1. **16936 — Pix2Pix "same lab 9 months earlier".** The arXiv dates are Nov 2016 (1611.07004) and Mar 2017 (1703.10593), about 4 months apart. `Pix2Pix.lean` contradicts itself: "a few months" at l.11, "9 months" at l.63.
2. **16943–16946 — 1080 Ti batch size explains InstanceNorm.** This is speculation. The 1080 Ti launched Mar 2017, after pix2pix, and the paper chose batch 1 deliberately.
3. **16899 — DCGAN "Eight design guidelines".** The paper's guideline box has five, and the parenthesis lists five. The extra three come from `DCGAN.lean`, which also says z ~ N(0, I) where the paper uses uniform z.
4. **16903–16905 — DCGAN "paper ∼12M" / "paper-exact".** I found no parameter counts in Radford et al. 2015 (lead).
5. **16958 — PatchGAN "5 strided convs".** Only 3 are strided; `CycleGAN.lean:146` itself marks `-- stride 1!`.
6. **16748–16752 — WaveNet "foundation of … PixelCNN".** PixelCNN (1601.06759, 1606.05328) predates WaveNet (1609.03499).
7. **16655–16658 — "QUEEN MARGARET" as a sampled name.** In `figures/tinygpt/prompt_suite_nano.txt` it appears only as the prompt and its echo. NORTHUMBERLAND, MERCUTIO (l.121) and BRUTUS (l.150) are genuinely generated; EDWARD could replace it.
8. **16605/16642 — causal-mask figure's "sampler's own first eight characters" `ROMEO:\nI`.** This comes from the May 2026 `tinygpt_sample.txt`; the current sample starts `ROMEO:\nO heaven`. Also, 7 of the 8 characters are prompt.
9. **16671 — "The first layer of every NLP spec is `.tokenPositionEmbed`".** BERT, GPT and Nyströmformer start with `.dense vocab→D`, and Mamba with `.mambaBlock`.
10. **16719–16722 — "all reduce to GPT shape or BERT shape".** This contradicts the section's own three shapes (Mamba, QANet).
11. **16709 — sampler "∼30 lines".** `runTinyGptSample` is about 65 lines (355–419).
12. **16804–16818 — gpt2Small listing.** It omits `(causalMask := true)`, which `Bestiary/GPT.lean` has.
13. **16795–16797 — GPT param counts truncated rather than rounded.** The specs give 123.65M, 353.77M and 772.72M (so 124, 354, 773), while XL is rounded up to 1.56B. `GPT.lean` also says GPT-1 is 117M where its spec is 116.1M.
14. **16758–16762 — RoBERTa "none of which lives in the NetSpec".** The 50K byte-level BPE vocabulary does live in the spec, and it accounts for the whole 109M→124M difference.
15. **16848 — QANet "One new primitive (`.separableConv`)".** Xception (15282) already introduced it, and `QANet.lean:211` says ZERO.
16. **16852 / 16862 — QANet timeline.** ConvNeXt is not a conv+attention hybrid, and MobileViT is from Oct 2021. "BERT 7 months later" is really about 5½ months (Apr→Oct 2018).
17. **17207 — SD 1.5 UNet "865M".** It is 859.5M (≈860M). `StableDiffusion.lean` says ~200M backbone / ~650M missing against the book's 190M / 675M, and the missing part is more than cross-attention.
18. **17210–17213 — SD components.** The sentence counts the text encoder and CLIP as two components; "constrained-frozen" is muddled.
19. **17492 — "Neyman–Pearson optimum".** That holds only for a known signal; a search over time and phase is a GLRT. The demo's search beating its own closed form shows this.
20. **17487 / 17535 — "PyCBC's coherent search".** The statistic is a quadrature sum of |z_H|² + |z_L|² maximised over t and delay (`preprocess_gw.py:342`), which is not phase-coherent.
21. **17546 — Gabbard "ten times the training set".** Unverified (lead).
22. **17110–17114 — SDE "highest confidence in this section".** Its 99.08% is below real MNIST's 99.40% in the same section. The 2.90 pixel mean and 2/10 coverage are NFE-10 figures only.
23. **17044 — real-as-generated row printed "1×".** It is 0.00196 / 0.00159 = 1.2× the floor that the other rows divide by.
24. **17052–17056 — bug-history narrative** (uncentred, 3-epoch checkpoint) in body text.
25. **17591 — leftover `% TODO Phase 4` comment** in the source.

## Checked and fine
- **TinyGPT:** 212,545 params; T/D/layers/heads; 2.279 bits/char, bigram 3.56, log₂65; 173 s on a 4060 Ti through XLA; 2080 of 4096 mask scores.
- **Labels and figures:** every `\ref`/`\label` in the slice resolves, and the three figure files exist. chap:bn is Ch 4 and chap:cnn is Ch 3.
- **DDPM tables:** every cell of `tab:ddpm_scores` and `tab:ddpm_samplers` matches the runs from 2026-08-28 and 2026-09-28. The η-monotonicity claim holds at all budgets, and 0.0188 / 0.0067 = 2.8× ("nearly 3×"). The VP-SDE score formula and the DDIM / Score-SDE citations are correct.
- **Diffusion2d net:** 18,178 params, matching interpolant and Euler sampler; the log|det| implementation matches `flowOde`.
- **Boltzmann tables:** all three match `table1.txt`, `transfer_table.txt` and `table_coupling.txt`. ΔF, the 36-unit B barrier, the 70 drawn paths and gradient-descent basin assignment all check out, as do the Noé, Lipman, Liu and Tong citations. RealNVP conditioner ≈ 25k.
- **PINN:** 3,021 params; there is no tanh in the Activation enum.
- **FNO / FourCastNet arithmetic:** FNO 4,577 + 921,600; FourCastNet 16,200 tokens, 1280 head, 2.36M attention, 0.30M AFNO.
- **GW data and training:** the data-pipeline facts, the 0.83M CNN, the 6-epoch Adam 1e-3 warm-up + cosine run, and every cell of `tab:gw_gaussian` and `tab:gw_real` match the code and logs. The 5.86→10.40 and 417 thresholds and the ApJS 267, 29 citation are right.
- **Bestiary listings:** all match their files (except gpt2Small, above).
- **Recomputed parameter counts:** BERT / RoBERTa / Nyströmformer, the Whisper encoders and the 238M vs 244M total, DCGAN, CycleGAN, PatchGAN and the SD 64× claim are all correct.
- **Citations:** all arXiv IDs in the slice are correct.

Tally: 1 high, 10 medium, 25 low.

---

## Slice 19

The harness blocked writing the findings file (`Write` refused with "Subagents should return findings as text"), so findings-19.md does not exist. The full report is below; please save it to /tmp/claude-1000/-home-skoonce-lean-lean4-mlir-worker/72b5c474-dbba-4182-a591-530e6f22d959/scratchpad/findings-19.md.

**Counts:** 2 high, 10 medium, 17 low (29 findings).

**Most serious three:**
1. Lines 17808 and 17815: the mean-field rows give Var(E_loc) = 0. The true value is 0.75 at N=12 (I enumerated it, and the run README's own step-0 gate says so) and 4.0 at N=64. The book calls variance "zero for an eigenstate", so the 0 implies something false.
2. Line 18563: "its Leduc experiments and ours use three dense layers of 64". The Deep CFR paper has no Leduc experiments; the 3×64 Leduc nets are Steinberger's.
3. Line 18432: "no exact best response exists" in heads-up flop hold'em. The Deep CFR paper reports exact FHP exploitability (37 mbb/g).

# Findings, slice 19: content.tex 17694–18745

### content.tex:17808,17815 — Mean-field rows give Var(E_loc) = 0, but the true value is 0.75 at N=12 (4.0 at N=64)
**Kind:** wrong-number / math. **Severity:** high
**Says:** "mean field (floor) & 0 & 2.1e-2 & 0 & 0.5000 & 0.7500" (and the same 0 in the N=64 block). Line 17766 says the variance is "zero for an eigenstate".
**Actually:** The product state is not an eigenstate.
- runs/2026-09-11-nqs-ising/README.md, Gates: "Step 0 of every run: E = −15.000000 at h = J, N = 12 … Var(E_loc) = 0.75".
- I enumerated it: E = −15.000, Var = 0.7500.
- Analytically Var = 0.0625·N at h=J, so 4.0 at N=64. That puts the MLP's 3.7 barely below the floor, which the 0 hides.
- The README tables carry the same 0, so the error comes from there.
**Fix:** Mean-field Var column: 0.75 (N=12), 4.0 (N=64).

### content.tex:18563-18564 — "its Leduc experiments": the Deep CFR paper has no Leduc experiments
**Kind:** external-fact. **Severity:** high
**Says:** "98,948 parameters for heads-up flop hold'em; its Leduc experiments and ours use three dense layers of 64."
**Actually:** The paper (arXiv:1811.00164 PDF, §5) runs only FHP and HULH. Leduc appears only in a footnote about NFSP (37 mbb/g). The repo agrees: runs/2026-10-08-deep-cfr-leduc/README.md says "Brown et al. 2019 has no Leduc curve for Deep CFR … its experiments are in FHP / HULH", as does planning/leduc_deep_cfr_demo.md:315.
**Fix:** "Single Deep CFR's Leduc experiments (Steinberger 2019) and ours use three dense layers of 64."

### content.tex:18432-18435 — "no exact best response exists" for heads-up flop hold'em: the Deep CFR paper measured exact FHP exploitability
**Kind:** external-fact. **Severity:** medium
**Says:** "heads-up flop and limit hold'em, where no exact best response exists to score against and the paper's numbers are against abstractions and head-to-head"
**Actually:** Deep CFR §6 / Fig. 2: "Deep CFR reaches an exploitability of 37 mbb/g while NFSP converges to 47 mbb/g" in FHP. Only HULH is head-to-head.
**Fix:** Separate the two games: FHP has exploitability; HULH is head-to-head only.

### content.tex:18339-18340 — "the three games around it" is left over from the four-game version
**Kind:** stale. **Severity:** medium
**Says:** "Two things change relative to the three games around it:"
**Actually:** There are three games in total (Pong, Leduc, tic-tac-toe), so only two are around Leduc. Commit c4b3599b changed the intro from "Four games" to "Three games" and missed this sentence.
**Fix:** "relative to the two games around it".

### content.tex:18401-18402, 18424-18425 — SD-CFR bluff column shows 0%, but that is seed 1 only
**Kind:** inconsistency / overclaim. **Severity:** medium
**Says:** The SD-CFR row lists three seeds for exploitability and a single "0%" for the bluff.
**Actually:** J-private / Q-public raise at round 2 after check-check, from runs/2026-10-08-deep-cfr-leduc/r3_s{1,2,3}_sdcfr.txt:
- SD-CFR seeds 1 / 2 / 3: 0.0002 / 0.0553 / 0.0632.
- Strategy nets: 0.016 / 0.008 / 0.064.
**Fix:** Table "0 / 6 / 6%"; in the prose say "seed 1".

### content.tex:17827-17830 — N=64 sweep claims don't match the sweep
**Kind:** wrong-number / overclaim. **Severity:** medium
**Says:** "[the GPT] holds 10^-5 to 10^-4 at every field but the critical point, while the ViT on Metropolis chains is ten to a thousand times worse"
**Actually (README N=64 sweep):**
- GPT at h=2.0 is 9.6e-4, worse than at the critical point (1.7e-4). Figure panel (c) plots that sweep value (nqs_figure.py loads n64/); only the lr 1e-3 rerun fixes it.
- Several GPT fields are well below 1e-5: h=0.2 2.0e-6, h=0.6 −3.5e-6, h=1.8 1.7e-8.
- ViT/GPT ratios: h=0.2 2.9×, h=0.4 2.8×, h=1.8 ~3×10⁴, h=2.0 0.08× (the ViT is better there).
**Fix:** Reword the GPT range, noting h=2 needs a lower learning rate, and say "up to a thousand times worse".

### content.tex:17794-17796 — The standard error is not below five percent of every entry
**Kind:** wrong-number / overclaim. **Severity:** medium
**Says:** "whose Monte Carlo standard error is below five percent of every entry"
**Actually:**
- GPT 1.7e-4 ± 1.9e-5 is 11%; MLP is 4.4% and ViT 4.5%.
- The README also says the ± is "a lower bound for the chains", because Metropolis samples are correlated. The book drops that caveat.
**Fix:** "below twelve percent … (a lower bound for the Metropolis chains)".

### content.tex:17843-17844 — The ViT's h=0.8 variance is not "three times lower than its neighbours'"
**Kind:** wrong-number. **Severity:** medium
**Actually (N=12 sweep):**
- ViT Var at h=0.6 / 0.8 / 1.0 is 3.0e-4 / 1.1e-3 / 2.5e-3: higher than the h=0.6 neighbour, 2.3× lower than h=1.0.
- At the same h, the MLP is 3.4e-3 (3.1× higher) but the GPT is 2.2e-4 (lower).
**Fix:** "three times lower than the MLP's at the same field".

### content.tex:18176 — "full (76M)" is a rough formula count; AlphaFold 2 has about 93M parameters
**Kind:** wrong-number / inconsistency. **Severity:** medium
**Actually:**
- LeanMlir/Spec.lean:260-283 uses an approximate formula: 48 × 1,572,864 = 75.5M, plus 0.9M for the structure module.
- Bestiary/Evoformer.lean:96 says "~70M … ~10M in structure module", which disagrees with Spec.lean.
- Real AF2 is about 93M.
**Fix:** Label 76M as the spec's approximate count and reconcile the docstring.

### content.tex:18587-18588 — AlphaGo policy net trained on 30M positions, not 30M games
**Kind:** external-fact. **Severity:** medium
**Actually:** Silver et al. 2016 used 30M positions from KGS (about 160k games). Bestiary/AlphaGo.lean:23 already says "positions".
**Fix:** "30M positions from human games".

### content.tex:18594 — "5185 Elo vs 3140" compares AlphaGo Zero with AlphaGo Fan, not the Lee Sedol system the entry describes
**Kind:** external-fact. **Severity:** medium
**Actually:** The AlphaGo Zero paper gives AlphaGo Fan 3,144, AlphaGo Lee 3,739, Master 4,858, AlphaGo Zero 5,185. The same 3140 is in Bestiary/AlphaGo.lean:52 and :195.
**Fix:** "5,185 against AlphaGo Lee's 3,739", or name AlphaGo Fan and use 3,144.

### content.tex:17927, 17936-17937 — LLaVA's LLM is not "(mostly) frozen"; stage 2 fine-tunes it
**Kind:** external-fact / overclaim. **Severity:** medium
**Says:** "(mostly) frozen LLaMA/Vicuna … the entire interesting work … ~21M of trainable bolt-on"
**Actually:** LLaVA and LLaVA-1.5 stage 2 updates the projector and the full LLM; only the vision encoder stays frozen. The book's own "joint instruction fine-tune" says the same.
**Fix:** Call the projector the only new module (0.3% of parameters), not the only trainable one.

### content.tex:18108 — "A second seed moves any arm by at most 0.002" does not hold for every seeded arm
**Kind:** overclaim. **Severity:** medium
**Actually:** planning/casp16_distogram_demo.md:347: the 35M 64-ch arm, headline vs seed 2, is 0.585 vs 0.597 (a 0.012 move). The 0.002 holds for the 650M (0.836 vs 0.838) and 3B+plane seeds.
**Fix:** "moves the 650M and 3B arms by at most 0.002".

### content.tex:18345-18346 — "fold onto them one-to-one": 936 → 288 cannot be one-to-one
**Kind:** math. **Severity:** low
**Actually:** The wording comes from planning/leduc_deep_cfr_demo.md:283.
**Fix:** "each maps to exactly one of them".

### content.tex:18459-18462 — Value-slot gradient is that of ½(z−v)², not (z−v)²
**Kind:** math. **Severity:** low
**Actually:** d/dv (z − tanh v)² = 2(tanh v − z)(1 − tanh² v). The code (ffi/f32_helpers.c:3872-3873) uses factor 1, the same scale as the policy slots.
**Fix:** Write the loss as ½(z−v)² − πᵀ log p, or say the value term is halved.

### content.tex:18497-18499 — Caption's "24% on each" diagonal reply is the 200-sim run's number
**Kind:** inconsistency. **Severity:** low
**Actually:** The figure reads n5_policy.csv (the quoted 400-sim run): p6/p8/p16/p18 = 0.230 / 0.267 / 0.244 / 0.216. README run2 says 27/24/23/22%; "24/24/24/23" was run1.
**Fix:** "22–27% on each".

### content.tex:17856-17861 — J1–J2 sentence generalises from one arm and rounds the numbers
**Kind:** overclaim. **Severity:** low
**Actually (README Table 3):**
- Only the MLP learns the Marshall signs from scratch (0.9985). The ViT without the prior reaches 0.7485.
- The Majumdar–Ghosh errors are 2.4–5.2e-6, so "to 3e-6" is not true of every arm.
- Width is ×4 for the MLP but ×2 for the ViT. The ViT reaches 0.537; only the MLP reaches 0.58.
- "Past that point" rests on the single J2 = 0.75 point.
**Fix:** Name the MLP, use "≤ 5e-6", and say "0.54–0.58".

### content.tex:18233-18234 vs 18305-18306 — Intro calls the Pong state twin the ceiling; the section says it is not
**Kind:** inconsistency. **Severity:** low
**Fix:** Call the twin "the bracket" in the intro.

### content.tex:18308-18309 — Opponent-speed comparison mixes a 3-seed mean with a single seed
**Kind:** inconsistency. **Severity:** low
**Actually:** At speed 1.5 the state figure is the 3-seed mean (13.45) but the pixel figure is seed 1 (15.60). The 3-seed pixel mean, 15.47, is quoted one sentence earlier.
**Fix:** Use matching statistics, or say "seed 1".

### content.tex:18246-18248 — "five million raw frames a second" has no artifact; paddle and delay wording
**Kind:** lead. **Severity:** low
**Actually:**
- Only demos/MainPongEnv.lean:31 prints frames/s; no run log, RESULTS.md or planning doc records the number.
- Paddles are 2 × 12 px (Pong.lean:120-121), so "two-pixel paddles" undersells them.
- The opponent's "four-frame delay" is a sample-and-hold target refreshed every 4 frames (Pong.lean:75), i.e. a 0–3 frame lag.
**Fix:** Record the pong-env throughput or drop it; say "2 × 12-pixel paddles".

### content.tex:18412-18413 — Comparison with the Single Deep CFR curve drops the units caveat
**Kind:** overclaim. **Severity:** low
**Actually:** The run README warns that the paper's total-vs-average convention is unstated: "if it is total, halve it before comparing". If the figure is total, ours sits above the curve.
**Fix:** Add the caveat.

### content.tex:18419-18420 — "all but a set or two"; the README says coverage is 1.000
**Kind:** inconsistency. **Severity:** low
**Fix:** "visits every set".

### content.tex:17996-17998 — The training set is not "every protein chain the PDB released"
**Kind:** overclaim. **Severity:** low
**Actually:** scripts/datasets/casp16_chain_list.py:6-7 keeps only X-ray/EM at ≤ 3.0 Å with 40–512 residues.
**Fix:** Add those filters.

### content.tex:17993-17996 — φ is not an angle "between the two residues' Cα–Cβ bonds", and θ involves N
**Kind:** math. **Severity:** low
**Actually:** casp16_labels.py:86 defines θ = dihedral N_i–Cα_i–Cβ_i–Cβ_j and φ = angle Cα_i–Cβ_i–Cβ_j. Only ω is defined by the two Cα–Cβ bonds.
**Fix:** Describe θ and φ separately from ω.

### content.tex:18137-18138 — "recall at P > 0.5 is 0.49" is the 78-unit figure, attributed to the 62
**Kind:** wrong-ref. **Severity:** low
**Actually:** Plan :495 gives 0.49 "over the 78"; there is no figure for the 62 alone.
**Fix:** Compute it over the 62, or say "over the 78".

### content.tex:18109-18111 — Energy-gap and ensemble claims come from the 650M arms, presented as the book run's
**Kind:** lead. **Severity:** low
**Actually:**
- The 78-of-78 energy gap was diagnosed at 650M (plan :420-427).
- The five-member ensemble is 650M arms, and it does beat its best member by 0.002 (0.852 vs 0.850, plan :361), within seed noise.
- "the two correlate at 0.90" is corr(TM, map lDDT) (plan :492), not lDDT against lDDT.
**Fix:** Say "at 650M" and "by no more than seed noise", and name the correlated quantities.

### content.tex:18206-18207 — "seven stacked operations" while listing nine
**Kind:** inconsistency. **Severity:** low
**Actually:** The list counts nine when the "two triangle …" pairs are counted.
**Fix:** "nine operations" or "seven kinds of operation".

### content.tex:18715-18717 — MuZero prediction "with two fewer ResBlocks"
**Kind:** inconsistency. **Severity:** low
**Actually:** AlphaZero's heads have no ResBlocks; the spec below adds two.
**Fix:** "AlphaZero's two heads behind a small two-block body".

### content.tex:18674-18676 — "Five NetSpec values per variant" while Atari is representation-only
**Kind:** inconsistency. **Severity:** low
**Fix:** "Five for Go".

### content.tex:18589-18591 — 3×3 stone patterns are rollout-policy features, not among the 48 planes
**Kind:** external-fact. **Severity:** low
**Actually:** The 48 planes (AlphaGo Extended Data Table 2) are stone colour, ones, turns since, liberties, capture size, self-atari size, liberties after move, ladder capture/escape, sensibleness and zeros. The 3×3 patterns belong to the rollout and tree policies (Extended Data Table 4).
**Fix:** Drop "3×3 stone arrangements" or move it to the rollout policy.

## Checked and fine

**NQS (Ising chain)**
- TFIM E0 by −2/sin(π/2N): N=12 −15.3225, N=64 −81.4956.
- Mean field: E_MF/N = −1.25, ⟨σˣ⟩ = 0.5, C = 0.75; rel. errors 2.1e-2 / 1.8e-2.
- E_loc formula, VMC gradient, target out − Mw/2, the B·N flip forward.
- Params: MLP 5,057 / 8,385 recomputed; ViT and GPT deltas (704 / 1,100) recomputed.
- Every table cell matches the run README. The GPT is best at every N=12 field.
- Ablation (3.0e-5 vs 1.6e-8; 45× at 0.4; 1× at J); ViT h=0.8 Δ/2 0.00760 vs 0.00759; symref 2.0e-5; h=1.4 rerun diverges.
- Timings: 50–330 s at N=12; GPT N=64 980 s.
- Sampler gate (16,384 draws, 0.1 s.e., eight seeds pooled); Pfeuty/enumeration agree to 7e-15; MainNqsIsing.lean and nqs_metrics.py exist.
- Citations: Carleo–Troyer Science 355, 602; 2211.05504; 1902.04057; Sorella PRL 80, 4558.

**NeRF / CLIP / LLaVA**
- NeRF 593,924 params recomputed.
- CLIP B/32 151M, L/14 427M, 49 patches.
- LLaVA projector 20.98M (0.3% of 7B), 576 tokens, 4M LLaVA-1 projector, ~23% SwiGLU undercount plausible.
- arXiv IDs correct.

**CASP16**
- Params 5,418,244 and 26,310 chains are in train.log; 75,501 s = 21.0 h.
- 64 bins 2–22 Å; 66+26+26+14 = 132 head channels; 15° bins; stride 32 with logits summed and averaged; 40% clusters; 2024-05-01 cutoff; 82 purged chains.
- Every table row and every ladder/lever number matches demos/README.md or the plan, including the 100- vs 30-epoch paired differences, OpenComplex 0.768, the per-class field medians, the 16/62 split and the ESMFold paired numbers.
- Receptive field 65 (32 3×3 convs).
- PairTile.lean, the smoke mode and the casp16 scripts exist; T1271s6-D1 is 93 aa.
- Citations: AF1 / trRosetta / ESM-2 correct.

**Pong**
- Every table cell and first-positive step matches RESULTS.md; averages 15.47 / 13.45.
- 1.70M params recomputed; hyperparameters match MainPongDqn.lean.
- 27.3 min; 24 → 14.6 ms; Chapter 3 is the CNN chapter; the exes exist.

**Leduc**
- Rules correct; 6r+30r² = 288 / 1,116 / 5,148; OpenSpiel's 936; 10,499 params recomputed.
- 25 ms / 0.75 s; CFR+ 2.38e-4.
- Every exploitability and head-to-head figure matches the run README; 3.1× / 2.0× / 1.0×.
- CFR+ J/Q 19.5% and seed-1 J/K 12% confirmed from the tables.
- Deep CFR 98,948 params; arXiv IDs correct.

**Tic-tac-toe**
- 5,478 / 4,520 / 9,722,011 / 9,062,619; 78k / 155k params.
- Every table cell and every timing; unbeaten from 5/4; 1.2% visited; 92.1% opening.
- 3×3 corners 81%; (5,5,4) is a draw.
- Target y = out − (n_out/2)g gives g/B; conv-BN diverged at iteration 11.

**AlphaGo family**
- AlphaGo Zero spec; chess 4672 = 8 × 8 × 73; AlphaGo policy ~3.9M recomputed; MuZero 16 blocks.

---

## Slice 20

I couldn't write the findings file. The harness blocked the Write to /tmp/claude-1000/-home-skoonce-lean-lean4-mlir-worker/72b5c474-dbba-4182-a591-530e6f22d959/scratchpad/findings-20.md ("Subagents should return findings as text"), so the full report is below. Save it to that path if you want the file.

Slice: content.tex 18746–19856. 40 findings: 6 high, 13 medium, 21 low.

Top 3:
1. 19629 / 19636: the JAX-pipeline oracles (cross-backend traces, tests/vjp_oracle) don't exercise the proven text. Their Lean side is the unverified run-time MlirCodegen path; VjpOracleNets.lean:8-14 says the oracle checks "not against the verified_mlir/ artifacts or a theorem".
2. 19714: "e_exp is the constant the margin probe pins on the device at 1–2 ULP" is false. margin_probe.py is a NumPy CPU f32/f64 twin with no exp measurement, and mnist_cot_budget's docstring says the exp accuracy is "assumed … not measured in the repo".
3. 18809/19269/19286: the comparator counts are stale and contradict each other (88 vs 87, tier 35). The configs actually hold 13 + 39 + 55 = 107. The other highs are float budgets claimed for every summation order (left fold only; the tree bound file was deleted), "FloatBridge budgets every operator" (no GELU/LayerNorm/attention budgets), and `conv_back_bridge_1to2`, which no longer exists.

---

# Findings: content.tex 18746–19856 (Appendix: Getting started; Appendix: On Verification)

Repo HEAD e9e59edc; paths relative to /home/skoonce/lean/lean4-mlir-worker.

### content.tex:19629 — The JAX-pipeline oracles don't exercise the proven text; the Lean side is the unverified MlirCodegen path
**Kind:** overclaim
**Severity:** high
**Says:** "it is IREE's translation of the proven text that these oracles exercise directly … both lowerers consume the identical proven StableHLO" (19629–19634). "compares each Lean-proved backward pass against JAX's value_and_grad" (19636–19639). Also 19599–19611 and 19151–19158.
**Actually:**
- LeanMlir/VjpOracleNets.lean:8-14 says the oracle trains through "`NetSpec.train`, which lowers the `NetSpec` to MLIR at run time through `MlirCodegen` … Both backwards are hand-written: the oracle checks them against each other, not against the verified_mlir/ artifacts or a theorem."
- lakefile.lean:324-327 calls MlirCodegen "unverified".
- historical/traces/CROSS_BACKEND_RESULTS.md:56 says "The hand-derived backward in `MlirCodegen.lean`".
- So the asymmetry paragraph's premise is false for both oracles.
**Fix:** Describe these oracles as checking the reference (run-time MlirCodegen) pipeline against JAX autodiff. Drop "Lean-proved backward". Rewrite the asymmetry paragraph.

### content.tex:19714 — The margin probe doesn't measure e_exp, and nothing else in the repo does
**Kind:** overclaim
**Severity:** high
**Says:** "e_exp is precisely the constant the margin probe pins on the device at 1--2 ULP (Measured against proven, below)"
**Actually:**
- scripts/certs/margin_probe.py is a NumPy CPU f32/f64 twin. It measures logit drift, cotangent, W2 step, ReLU flips and max|W|. It measures no exp accuracy and runs on no device.
- MlpFloatBridge.lean:586-587 (mnist_cot_budget): "eexp ≤ 10⁻⁶ (an assumed accuracy for GPU exp, not measured in the repo)".
- kernel_faithfulness_probe, which once did this, was deleted.
- The table below has no exp row.
- 19659 and 19831 also say the probe "re-runs a real training trajectory". It trains its own NumPy twin (seed 0).
**Fix:** Say e_exp is assumed (≤ 10⁻⁶). Describe the probe as a CPU NumPy twin.

### content.tex:19706 — The dot budgets aren't stated "for every summation association", and the tree-reduction bound is gone
**Kind:** stale / overclaim
**Severity:** high
**Says:** "the dot-product budgets are stated in the classical compounded form valid for every summation association … and the tree-reduction bound below recovers log₂n·u under a named balance hypothesis"
**Actually:**
- FloatBridge.lean:33-38: "dot_close / sum_close are stated for that fold only [left fold] … only the left fold is formalized here". The only order-parametric form is bnMean_close_of.
- dotMixed is built on M.dot, the left fold.
- TreeReduceBridge.lean (tree_close, dot_tree_close) was deleted in 0de261e8. No tree or log₂ theorem remains, and nothing "below" in the section states one.
**Fix:** Say the bounds are proved for the left fold only and a backend that reassociates is outside the statement. Delete the tree-reduction clause.

### content.tex:19688 — "FloatBridge.lean budgets every operator the networks are built from"
**Kind:** overclaim / stale
**Severity:** high
**Says:** "FloatBridge.lean budgets every operator the networks are built from"
**Actually:**
- Float/ has budgets for dense, ReLU, conv (incl. mixed), depthwise, maxpool, GAP, residual, BN and softmax-CE.
- There is no float budget for GELU, LayerNorm, swish/sigmoid, SE or attention. The ConvNeXt/EfficientNet/ViT budget files were deleted in 0de261e8.
- Several of the existing budgets live in other files (Bn/Conv/Depthwise bridges), not FloatBridge.lean.
**Fix:** List the operators that are covered and say which are not.

### content.tex:18809 — Comparator counts are stale and contradict each other
**Kind:** wrong-number / inconsistency
**Severity:** high
**Says:** "over 88 theorems" (18809), "The last 35 are ChallengeTier.lean" (18834), "88 … the 35-theorem tier" (19269, 19276), "The 87 are not …" and "What the 87 add" (19286, 19290), "the three certificate theorems" (18837).
**Actually:**
- The configs hold 13 + 39 + 55 = 107 (config-tier.json has 55, generated by gen_comparator_tier.py).
- The book's own parts sum to 13 + 39 + 35 = 87, not 88. Consecutive paragraphs say 88 and 87.
- The tier's certificates bucket has 4 entries, including shampoo_eq_muon.
- tests/comparator/README.md (87) is also stale.
**Fix:** Use 107 / 55, or generate the counts from the configs. Fix README.md too.

### content.tex:19320 — `conv_back_bridge_1to2` doesn't exist; the conv bridge is no longer at a concrete shape
**Kind:** missing-decl / stale
**Severity:** high
**Says:** "Examples are conv_back_bridge_1to2, bn_back_bridge, and relu_back_bridge" (19320). The conv bridge is "discharged by expansion at the concrete tensor shape" (19504–19507).
**Actually:**
- No such declaration exists. Commit 1dcbcb58: "IR.lean's four fixed-shape conv bridges are three general ones over odd kernels".
- Now IR.lean:278 `conv_back_bridge` covers all dims with odd kH/kW. It is proved via reverseSlab_eq_gradSlab and Finset.sum_bij', not by expansion.
**Fix:** Cite conv_back_bridge. Say it holds at every shape with odd kernels.

### content.tex:19287 — The AuditAxioms count is stale and contradicts the "property, not a number" sentence
**Kind:** stale / inconsistency
**Severity:** medium
**Says:** "prints the axiom closure of 1,751 declarations"
**Actually:** The file has 1,949 `#print axioms` lines (1,948 unique), plus 68 in AuditAxiomsHeavy. At 19245 the book says this count is quoted "as a property rather than a number".
**Fix:** Drop the number, or update it and generate it.

### content.tex:19045 — Not all eight side quests ride in `lake run imagenet`; "fourteen rows" doesn't match the tables
**Kind:** command/path / inconsistency
**Severity:** medium
**Says:** "All eight have job configs, launch like any Track-4 row and ride in lake run imagenet right after their chapter's row". Also "its fourteen rows" (19028).
**Actually:** lakefile.lean imagenetRows has 7 + 7 = 14 rows. mnv4-full-e100-4gpu is not one of them and has no lake script, so `lake run mnv4-full-e100-4gpu` doesn't exist. The book's two tables give 7 + 8 = 15.
**Fix:** Add the row and script, or say "seven of the eight" and point the eighth at scripts/supervise.sh.

### content.tex:18963 — "Every row has run and is the one behind its chapter's numbers"
**Kind:** stale / overclaim
**Severity:** medium
**Actually:**
- mnv2-default-4gpu.conf was rewritten 2026-10-12 to a 420-epoch TF-slim recipe (smoke only). It says the chapter's 71.12 came from the "retired arm … 350 epochs".
- enet-default-4gpu.conf now points at the TF-recipe render (probed 2026-10-12). The published run is runs/2026-09-12-enet-verified-350ep.
- Separately, the header of r34-default-bf16-4gpu.conf still calls r34-default-4gpu "the lakefile's Ch. 5 row", which is stale.
**Fix:** Re-verify each row against its chapter's run directory.

### content.tex:18869 — The shim searches python3.12 only, not python3.*
**Kind:** command/path
**Severity:** medium
**Says:** "The shim looks under .venv/lib/python3.*/site-packages/jax_plugins/"
**Actually:** pjrt_ffi.c:54-55 hard-codes .venv/lib/python3.12/… for xla_cuda12 and xla_rocm7 (plus a /home/skoonce absolute path). A venv on any other Python minor version isn't found, and neither is a cuda13 plugin.
**Fix:** Say python3.12 and point readers at $PJRT_PLUGIN, or glob the minor version as the Mac list does.

### content.tex:19087 — Orin "Tracks 1–3 on record" overstates PLATFORMS.md
**Kind:** overclaim
**Severity:** medium
**Actually:** The PLATFORMS.md Orin row shows mnist (mnist-cnn only), cifar, and Imagenette ViT-Tiny only, with "the six-row imagenette-orin tier is the next run". orinRows is six nets: ConvNeXt is absent and R50 uses acc2x16.
**Fix:** List exactly what is on record.

### content.tex:19108 — PLATFORMS.md doesn't record the Mac row the table claims
**Kind:** inconsistency
**Severity:** medium
**Says:** Mac "MNIST tier … on record, matching CUDA (92.10/97.79/98.71%)", and "PLATFORMS.md is the record of every platform's last run of every tier".
**Actually:** The PLATFORMS.md Mac row is all "-"; the numbers exist only in deploy/MAC.md:78-80 (marked TODO). Also 98.71 vs the CUDA median of 98.78.
**Fix:** Regenerate PLATFORMS.md, or cite MAC.md.

### content.tex:19239 — The Bestiary is listed among what the suite "proves"
**Kind:** overclaim
**Severity:** medium
**Actually:** Bestiary/*.lean contains 0 theorems. The Bestiary README calls the entries "pure NetSpec values … read-only fixture".
**Fix:** Move it out of the "proves" list.

### content.tex:19582 — The FD script can't catch prose/theorem typos
**Kind:** overclaim
**Severity:** medium
**Says:** "the FD test runs against the formula the prose published and would diverge"
**Actually:** check_jacobians.py encodes its own NumPy formulas and reads neither the prose nor the Lean statements. At 19255 the book itself lists this gap as uncaught.
**Fix:** Reword, or drop the claim.

### content.tex:19799 — "the entire MLP" and "the entire Chapter-3 CNN"
**Kind:** overclaim
**Severity:** medium
**Actually:**
- Float descent exists for MLP weights W0–W2 only; the MLP bias descents (MlpBias.lean) are ℝ-side, not float.
- The CNN's float descents are conv1/conv2 plus `cnn_conv{1,2}_bias_float_sgd_descends`. The dense head W3–W5 has none.
- Each rung moves one parameter group with all others fixed.
**Fix:** Say "each weight matrix / each conv layer, one group at a time", and cite the _bias_ names.

### content.tex:19323 — The printer story mixes the legacy IRPrint with the trainers' printer
**Kind:** stale / inconsistency
**Severity:** medium
**Actually:**
- IRPrint.lean:5-11: "Legacy printers … and plain String builders … The verified renderers are StableHLO.Pretty and the *Render* files; nothing imports this file."
- No printer "walks the Back value" (19526–19529); the book admits at 19323 that Back can't be printed.
- There are two printers, and the trainers' one (StableHLO/Pretty.lean) is 4,957 lines, so "a single printer" (19368) is misleading.
- check_ir_codegen.py regenerates from IRPrint, so the IREE-vs-NumPy oracle tests the legacy printer, not the verified_mlir artifacts.
**Fix:** Name StableHLO.Pretty / emitTok as the trusted printer and describe IRPrint as the legacy demo printer.

### content.tex:18976 — "provably the augmentation its JAX reference trains on"
**Kind:** overclaim
**Severity:** medium
**Actually:** gen_shims.sh:13-14 says the pairing is gated by scripts/shim_wiring_gate.py, which is a script check, not a Lean proof.
**Fix:** "by construction, and gated by shim_wiring_gate.py".

### content.tex:19613 — Step-1 agreement tests only the forward pass
**Kind:** overclaim
**Severity:** medium
**Actually:**
- tests/vjp_oracle/README.md: "Step 1 is forward-only; step 2 is the first step whose value depends on the backward pass".
- CROSS_BACKEND_RESULTS: MLP step-2 Δ is 2.50e-5 / 1.27e-4. The ares MLP step-1 is 3.38e-6, not ULP. CNN step-1 is 1.08e-5 / 1.14e-4 and step-2 6.88e-3 / 1.44e-4.
**Fix:** Say step 1 checks the forward, and quote the step-2 Δs as the backward evidence.

### content.tex:18773 — "Only the ImageNet tier needs an interpreter"
**Kind:** overclaim
**Severity:** medium
**Also:** the Track table's "Lean + one plugin file".
**Actually:** download_imagenette.sh:8-28 makes .venv and installs Pillow and numpy. The plugin itself comes via `python3 -m venv` + pip, and the shim build needs gcc.
**Fix:** "No Python at training time".

### content.tex:19600 — Codegen.lean line count
**Kind:** stale
**Severity:** low
**Says:** "~3700 lines". `wc -l` gives 4,389.

### content.tex:19640 — vjp_oracle range and attribution
**Kind:** wrong-number / inconsistency
**Severity:** low
**Says:** Δ "between 2×10⁻⁷ and 10⁻⁴", with the wider ones due to "summation order".
**Actually:** The README's max is 1.18e-4 (conv-pool). It attributes max-pool to argmax tie-breaks and BN (2.18e-6) to reduction order. "per-axiom" (19636) is legacy wording in a book that claims zero axioms.

### content.tex:18999 — "Three more knobs" omits LEAN_MLIR_EPOCHS
**Kind:** inconsistency
**Severity:** low
**Actually:** MainResnet34Imagenet.lean:67 reads LEAN_MLIR_EPOCHS (MAX_EPOCHS only caps). Make it four knobs.

### content.tex:18788 — `Proofs` isn't "the whole suite"; `Certs` isn't "every certificate CI checks"
**Kind:** command/path
**Severity:** low
**Actually:** lakefile.lean:36-44, 74-79: Certs subsumes Proofs. CertsHeavy is a separate CI lib. ScorecardSDPFull{,Uncon} are in no lib and their audit lines are commented out.

### content.tex:19117 — The IREE missing-shim error doesn't name libiree_ffi.so
**Kind:** command/path
**Severity:** low
**Actually:** lowerer.c:150-154 prints "(wanted: iree)" plus the pjrt gcc hint.

### content.tex:18898 — The device-variable list misses ZE_AFFINITY_MASK (Arc)
**Kind:** inconsistency
**Severity:** low
**Actually:** scripts/platform/env.sh:105.

### content.tex:19085 — CUDA 13 pin
**Kind:** wrong-number
**Severity:** low
**Actually:** PLATFORMS.md shows jax_cuda13_pjrt==0.11.1, not 0.11. The pins sentence (19093) omits CUDA 13; it has no lock file and comes from _box.sh.

### content.tex:18910 — "Adam" vs "AdamW"
**Kind:** inconsistency
**Severity:** low
**Actually:** The verbatim block says "SGD/momentum/Adam" while the itemize says AdamW. The lakefile says SGD / Nesterov-momentum / AdamW.

### content.tex:18909 — Tier times disagree with PLATFORMS.md and the lakefile
**Kind:** inconsistency
**Severity:** low
**Actually:** The book says ~30 s / ~5 min / ~6 h. PLATFORMS.md says "a minute" / ~6 min / ~5½ h, and lakefile.lean:2111 says 5½ h.

### content.tex:19161 — "every Track 3 tier has an -iree twin"
**Kind:** overclaim
**Severity:** low
**Actually:** imagenette-iree runs 5 of the 7 nets; R50 and MNv4 have no IREE driver (lakefile.lean:2177-2192).

### content.tex:19693 — Module file names
**Kind:** command/path
**Severity:** low
**Says:** "SgdDescent{Linear,Mlp,Cnn,CnnFloat,Cifar}.lean" (19693) and "SgdDescentLinear" (18794).
**Actually:** The files are LeanMlir/Proofs/Training/SgdDescent/{Linear,…}.lean.

### content.tex:19722 — "p-bit-significand grid" with p = 23
**Kind:** math
**Severity:** low
**Actually:** p counts fraction bits; Binary32Instance.lean:53 says "(24-bit significand)". A 23-bit significand would give u = 2⁻²³.

### content.tex:19555 — FD check count
**Kind:** wrong-number
**Severity:** low
**Says:** "30 checks". The script reports 31/31, one of which (pdiv_id) is a hard-coded True.

### content.tex:18964 — Axis-sibling list incomplete; "never in the recipe" isn't true of every sibling
**Kind:** inconsistency
**Severity:** low
**Actually:**
- scripts/jobs also has cnx-default-emabf16, cnxs/cnxb-default-4gpu, vits/vitb-g512, mnv4-default, chunktest, the run_*_verified.sh scripts and 14 *-jax confs.
- vit-default-4gpu also differs in EMA.
- r50-a3-4gpu lacks wx+clip.

### content.tex:18894 — Residency claims (lead)
**Kind:** lead
**Severity:** low
**Actually:**
- pjrt_ffi.c:293-297 gives 1.3–3× and a default flip on 2026-09-29.
- No source found for "about 5× on MNIST and CIFAR".
- Pre-residency runs exist (r34in_verified_30ep_2026-08-05). "Every transcript" is unverified.

### content.tex:19008 — 695 ms/step unsourced (lead)
**Kind:** lead
**Severity:** low
**Actually:** The arithmetic holds (86.9 h). No run or conf records 695 ms; r34-default-4gpu.conf has 625 / 386 ms.

### content.tex:19242 — "re-checks every theorem in the suite"
**Kind:** overclaim
**Severity:** low
**Actually:** AuditAxioms pins ~1,948 declarations against 8,467 theorem/lemma lines; the rest are covered only transitively.

### content.tex:19522 — mlp_whole_bridge description
**Kind:** statement-mismatch
**Severity:** low
**Says:** "this one substitution, chaining its five per-operator bridges"
**Actually:** It is four nested substs, proved by simp + rfl without invoking the per-op bridge theorems.

### content.tex:19846 — 29.5M is per layer
**Kind:** wrong-number
**Severity:** low
**Actually:** margin_probe.py:25 says "0/29.5M per layer" (two layers, 59M in all).

### content.tex:19188 — "the code cannot drift from the math"
**Kind:** overclaim
**Severity:** low
**Actually:** The section itself says the printed mirror is "read, not proved" and that emitTok is trusted.

### content.tex:19682 — Dating prose
**Kind:** process-narrative
**Severity:** low
**Says:** "Until recently … It is now a theorem layer", "Earlier drafts axiomatized" (19250), "is now a conditional theorem" (19359).

## Checked and fine
- **Lean and comparator setup:**
  - Toolchain v4.35.0; run.sh uses `lake comparator --paranoid` with the five checkers and the 3-axiom allowlist in all three configs.
  - Challenge.lean imports only Mathlib (13 theorems, chk_pdiv_is_fderiv); ChallengeArch 39; the three smooth-point variants are in config-arch; "minus the four" matches gen_comparator_tier.py.
  - No sorry, axiom or native_decide anywhere. ProofsMinimal has exactly two roots.
- **Track 2:** lock pins jax-cuda12-pjrt and jax-rocm7-pjrt at 0.11.0, CUDA 12.9, cuDNN 9.23.2.1. The gcc line and both error strings exist. PJRT_FFI_RESIDENT=0 semantics are right. The dataset scripts exist, and Imagenette is 320 px / 330 MB.
- **Track 3:** tiers and bundled exes match the lakefile; run.sh tees to runs/<date>-<trainer>/.
- **Track 4:**
  - The 7 row confs and lake scripts exist, as do the 8 side-quest confs and selftest.
  - plan / once / bare modes map to DRY_RUN / ONCE / supervised; imagenet is plan-only without `start`; gen_shims and the refuse-on-missing-shim behaviour exist; the "OLDER than the render" precheck exists and a bare lake run builds first.
- **R34 ImageNet driver:**
  - Defaults are mom256 / 256 / 0.1 / 90, and BASE_LR_U is in micro-units.
  - R50 defaults to 0.001, so the ~100× under-step claim holds.
  - The 0.75 → 11.68 GiB and 0.97 → 15.11 GiB figures are right; PJRT_REPLICAS, LEAN_MLIR_REPLICAS and the "compiled for N replicas" error all exist.
- **Platforms:** the Orin, Mac and Arc plugin versions and specs match deploy/*.md. The Arc numbers (92.10/97.83/98.74, 76.77, bf16, the SYCL workaround) match. ROCm 7.2 and check.sh `--backend rocm` and its goldens tier exist.
- **IREE:** LEAN_MLIR_LOWERER=iree, ffi/libiree_ffi.so and historical/IREE_BUILD.md exist. 2.3× and ~392× match historical/CUDA.md, and 505/392 ≈ 1.29 MB.
- **Proof counts and IR:**
  - 44 / 9 / 37 match tab:theorem_budget; vitFullHasVJP is audited.
  - Back's 8 constructors and the denote equations match; dense_back_bridge is rfl; the relu_back_bridge statement matches; denote_subst is by induction; bn_back_bridge takes 0 < ε.
  - Back3, Fwd, Hlo, emitTok and roundtrip (tokens) exist.
  - All named tie, loss-grad and stem declarations exist; the 13 *_net_lossGrad match "thirteen nets"; certs.yml's capstone column exists.
- **Float tier:**
  - FloatModel, exactModel, binary32 (2⁻²⁴) and fp8E4M3 (2⁻⁴) match; dotMixed and dot_close_mixed match their statements.
  - The Conv/Depthwise mixed bridges, ConvMixedComposeBridge, Bf16GradNodes, Bf16Erasure, Bf16Fold (three names), E4M3Fold and the fp8 artifact exist.
  - All the chain theorem names exist, and the 2a²/(1−2aD) constant matches.
  - The table constants 5100, 21/1000 and 5/4, the measured values, 97.8%, |W| ≤ 3/5 vs 0.52, 1/u ≈ 1.7e7 and 4608 all check out.
- **Oracles:** the FD script's ε and coverage list match; vjp_oracle has 14 cases; MLP step-1 is 1.97e-7 and ROCm/CUDA are bit-identical, as stated.
- **Cross-refs:** all \ref labels and the depgraph macros exist.

Tally: 6 high, 13 medium, 21 low (40 findings).

---

## Slice 21

# Fact-check: content.tex 19857–20543 (Data availability, Demo datasets, Acknowledgments, Colophon)

### content.tex:19956–19998 — "Every top-1 and top-5 follows timm's RSB protocol" is false for MobileNetV2, EfficientNet-B0 and MobileNetV4
**Kind:** overclaim / inconsistency
**Severity:** high
**Says:** "Every top-1 and top-5 in this book faithfully follows the validation protocol of `timm`'s 'ResNet Strikes Back'" and "The resampler is `timm`'s. Validation resizes the whole image … which is `timm`'s order rather than the Google/TPU 'Inception' crop-then-resize; and both that resize and the training RandomResizedCrop run antialiased".
**Actually:** Three ImageNet trainers set `evalCropTf := true` and so use the paper's own crop-then-resize protocol, not timm's:
- `jax/MainMobilenetV2Imagenet.lean:109-110` uses `evalCropSlim`: TF-slim `central_crop(0.875)` of both sides, then `resize_bilinear`.
- `jax/MainEfficientNetImagenet.lean:99-100` uses `evalCropTfEfficientNet`: TPU `_decode_and_center_crop`, then bicubic.
- `jax/MainMobilenetV4Imagenet.lean:137` uses tf-models: crop of the shorter side, then resize bilinear.

The emitter is `jax/Jax/Codegen.lean:738-775`; the timm form is kept only under `PROTOCOL=timm` / `SHIM_EVAL_SIZE`. The book's own chapters say so too: MNv2 at l.8739 ("validation crop (0.875 of both sides, then 224²)"), and MNv4 at l.8933 ("bilinear resize without antialiasing").
**Fix:** Limit the claim to the ResNet/ConvNeXt/ViT recipes. Say that MNv2, EfficientNet and MNv4 are scored under their papers' protocols, and that the timm-resolution scorer is available for all of them.

### content.tex:19952–19953 — ImageNet TFDS sizes are really the raw tarball sizes; units are mixed
**Kind:** wrong-number
**Severity:** medium
**Says:** "~138 GB" and "~6.3 GB" for the torrents; TFDS output "1,281,167 training images across 1024 tfrecord shards (147.90 GB) and 50,000 validation images across 64 shards (6.74 GB)"; "raw tarballs (~144 GB) plus the 5.1.0 output (~155 GB)".
**Actually:**
- Academic Torrents lists `ILSVRC2012_img_train.tar` at **147.90 GB** and `ILSVRC2012_img_val.tar` at **6.74 GB**. Those are exactly the figures the book gives for the TFDS shards. The book's "~138/~6.3 GB" are the same tarballs in GiB.
- The local `~/tensorflow_datasets/imagenet2012/5.1.0/dataset_info.json` gives train numBytes = 146,999,114,192 (147.0 GB / 136.9 GiB) and validation = 6,711,099,535 (6.71 GB).
- So the raw total is ≈154.6 GB (144 GiB) and the TFDS output is ≈153.7 GB (143 GiB). Shard counts 1024/64 are correct.
**Fix:** Use one unit throughout. Torrents: 147.9 GB + 6.74 GB. Output: ≈147.0 GB + 6.71 GB (≈154 GB). Recheck the "155 GB page cache" and "~500 GB" lines against those figures.

### content.tex:19946–19953 + 19968–19971 — Field-of-view bullet contradicts the resampler bullet and the code
**Kind:** inconsistency / stale
**Severity:** medium
**Says (bullet 2):** "We decode a centred square of side crop_pct·min(h,w) and resize it … timm resizes the whole image … The two orders end on the same pixels." **Bullet 4:** "Validation resizes the whole image so its shorter side is img_size/crop_pct and only then centre-crops, which is timm's order."
**Actually:** The timm-protocol shim resizes first, then crops (`jax/generated/generated_resnet50_imagenet_shim.py:378-390`, emitted from `jax/Jax/Codegen.lean:725-737`). Bullet 2 describes the old (or the tf-models) order.
**Fix:** Rewrite bullet 2 so it says the shim uses timm's resize-then-crop, with the 0.02–0.04 figure as the measured gap to the crop-then-resize form. Or merge bullets 2 and 4.

### content.tex:20024–20027 + 20183 — VisDrone paper's volume and year are wrong
**Kind:** external-fact
**Severity:** medium
**Says:** "IEEE TPAMI 43, 2021" (and "Zhu et al., 2021" in the table).
**Actually:** IEEE Xplore 9573394: TPAMI **vol. 44, no. 11**, pp. 7380–7399, Nov **2022**. It was published online on 14 Oct 2021.
**Fix:** "IEEE TPAMI 44(11), 2022".

### content.tex:20005–20010 — The demo intro ("five other task families", "past image classification") is stale
**Kind:** stale / inconsistency
**Severity:** medium
**Says:** "The demos/ trainers step past image classification into the five other task families in the book, which are detection, segmentation, language, signal processing and physics".
**Actually:** The list that follows has eleven entries. ArASL, PlantVillage and EuroSAT are image classification (people watching, agriculture, remote sensing). The Ising chain is "science" and CASP16 is "structure". l.329 says eleven groups carry a demo.
**Fix:** Name the actual groups, or drop the count and the "past image classification" framing.

### content.tex:19860–19861, 19889–19890 — MNIST path is stale, and the scripts are not "in the repository root"
**Kind:** stale / command/path
**Severity:** medium
**Says:** "fetched or built by a script in the repository root that drops it under data/"; the table has "download_mnist.sh → data/".
**Actually:** Commit 65a923aa moved all download scripts to `scripts/datasets/`; the table header says so itself. Commit cc7e8fa8 moved MNIST to `data/mnist/` (`scripts/datasets/download_mnist.sh:6,16`).
**Fix:** Change the prose to "by a script in scripts/datasets/" and the table cell to "→ data/mnist/".

### content.tex:20178–20181 (with scripts/datasets/download_visdrone.sh:62) — download_visdrone.sh calls a script that no longer exists
**Kind:** command/path
**Severity:** medium
**Says:** `download_visdrone.sh` pulls the mirror, and the table pairs the script with the preprocessed path `data/visdrone/`.
**Actually:** The script runs `python3 "$REPO_ROOT/preprocess_visdrone.py"`, but there is no `preprocess_visdrone.py` at the repo root. It moved to `scripts/datasets/` in 65a923aa, and this line was not updated, so the preprocessing step fails. This is a bug in the script rather than the prose, but the book's fetch path is broken.
**Fix:** In the script, use `$REPO_ROOT/scripts/datasets/preprocess_visdrone.py`.

### content.tex:20488 (CASP16 build) — the purge searches the 62 target sequences, not "the 85 unit sequences"
**Kind:** statement-mismatch
**Severity:** medium
**Says:** "MMseqs2 then searches the 85 unit sequences against them at 30 % identity over half the chain and finds 84 hits on 15 targets".
**Actually:** `scripts/datasets/casp16_chain_list.py` `cmd_purge` (l.168-176, docstring l.13) queries `raw/casp16.T1.seq.txt`, which holds the 62 Phase-1 target sequences. The log line reports "of 62 targets". `planning/casp16_distogram_demo.md:182-183` agrees: "84 hits for 15 of the 62 targets".
**Fix:** "searches the 62 Phase-1 target sequences …".

### content.tex:20283–20287 — PlantVillage's "grouped" split is not 80/10/10
**Kind:** wrong-number
**Severity:** medium
**Says:** "PlantVillage is split twice, 80/10/10 per class: random … and grouped, whose test set is the maintainers' 10,709 exactly".
**Actually:** `runs/2026-09-17-plant/README.md:21-23` gives grouped as 38,112 / 5,484 / 10,709. That is ≈70/10/20 and is not per class. Random is 43,447 / 5,428 / 5,430 (80/10/10).
**Fix:** "random, 80/10/10 per class; and grouped, the maintainers' leaf-grouped 80/20 with a validation tenth carved from its training side by leaf (≈70/10/20)".

### content.tex:20375–20377 — "uint8 … matching the on-disk convention of every other dataset here" is false
**Kind:** inconsistency
**Severity:** medium
**Says:** "Volumes are quantized to uint8 … and the C loader inverts it, matching the on-disk convention of every other dataset here."
**Actually:** The same appendix says ArASL is "written as f32 in [0,1]" (l.20249). EuroSAT and the Brazil chips are f32 (`preprocess_rs_eurosat.py:12`; rs-phase2 README §6). GW is f32 `[N,2,64,128]`. Boltzmann and toy2d are f32. Shakespeare is int32.
**Fix:** "matching the uint8 convention of the image datasets (MNIST, CIFAR, Imagenette, VisDrone)".

### content.tex:19983 — "runs in 168" is missing its unit
**Kind:** typo/render
**Severity:** low
**Says:** "wants ~190 GB of RAM … and runs in $168$ with the difference streaming from disk".
**Fix:** "runs in 168 GB".

### content.tex:20160, 20164 — abbreviation "MB" is used for two datasets
**Kind:** inconsistency
**Severity:** low
**Says:** MapBiomas Collection 4 is "MB", and Müller-Brown density is also "MB".
**Fix:** Give one of them another abbreviation (e.g. "MuB" or "MBio").

### content.tex:20160, 20342–20344 — "MapBiomas Collection 4 (Souza et al. 2020) … at 10 m" names the wrong product
**Kind:** external-fact
**Severity:** low
**Says:** "MapBiomas Collection 4 (Souza et al. 2020; CC BY 4.0), Brazil's annual land-cover map at 10 m"
**Actually:** The file used is the Sentinel-based 10 m product: `lulc_10m/collection4/…/brazil_coverage-col4_10m_2023.tif`, labelled "MapBiomas Collection 4 (Sentinel, 10 m)" in `runs/2026-09-29-rs-phase2/README.md`. Souza et al. 2020 (Remote Sens. 12(17):2735) describes the 30 m Landsat Collection 4.1, 1985–2018. "Collection 4" alone reads as that older Landsat product, which has no 2023 map.
**Fix:** "MapBiomas 10 m (Sentinel) Collection 4, 2023 map", keeping Souza 2020 as the project's citation.

### content.tex:20330–20331 — "six tiles over Rondônia … in June": one scene is July
**Kind:** wrong-number
**Severity:** low
**Actually:** In the rs-phase2 README table, tile 20LMP is dated 2023-07-04. The other five Amazon scenes are 16–19 June.
**Fix:** "in June and early July", or "in the June–July dry season".

### content.tex:20418–20420 — GW download size does not add up; "at 1.7 GB each" is unclear
**Kind:** wrong-number (lead)
**Severity:** low
**Says:** "134 MB each: 26 file pairs from H1 and L1, 6.6 GB"; "7 GB, eleven minutes on eight cores at 1.7 GB each".
**Actually:** 26 × 2 × 134 MB = 6.97 GB, not 6.6 (6.6 would be roughly GiB, or a smaller average file). `planning/gw_detection_demo.md:314` gives "26 pairs, 14 GB, 11 min". 7 GB matches two noise sets × 52,988 windows × 64 KiB. "1.7 GB each" has no clear referent (per worker RAM?).
**Fix:** Settle on 6.97 GB (or "≈7 GB"), and say what "1.7 GB each" refers to.

### content.tex:20052–20056 — "Each also has a preprocess_*.py step … before the first lake exe run" is not accurate for every row
**Kind:** inconsistency
**Severity:** low
**Actually:** CASP16 and PDB use `casp16_*.py`, not `preprocess_*`. Most `download_*.sh` scripts already run their preprocessor (NEU, ArASL, Plant, RS, BraTS, VisDrone, Imagenette), so it is not a separate reader step.
**Fix:** "each download script runs (or is followed by) its preprocessor".

### content.tex:20005–20108 — the 2-D diffusion demo's dataset is missing from the list
**Kind:** inconsistency (completeness)
**Severity:** low
**Actually:** `demos/MainDiffusion2d.lean` reads `data/toy2d`, which `scripts/datasets/preprocess_toy2d.py` generates (sec:bestiary_diffusion, l.16997). It is neither in the list nor in Table `tab:datasets_demo`, yet the Boltzmann entry (also generated) is.
**Fix:** Add a "2-D toy targets (generated)" row, or say that generation demos without data are omitted.

### content.tex:20179 — "byte-identical Ultralytics release-asset mirror" (lead)
**Kind:** lead
**Severity:** low
**Actually:** The only source for this is the script comment ("Same bytes, same split sizes"). Nothing in the repo shows a hash comparison against the official Drive zips.
**Fix:** Soften to "a mirror with the official split sizes", or record the check.

### content.tex:19975–19976 — "the 2018 torchvision weights (tv_in1k)" (lead)
**Kind:** lead
**Severity:** low
**Actually:** torchvision's original ResNet-50 (IMAGENET1K_V1) weights date from about 2017. "2018" appears to come from the repo's run name `resnet50_imagenet_2018`, not the weights' release date.
**Fix:** Check the date, or write "the original torchvision weights".

### content.tex:20529–20530 — Colophon names Qwen, but nothing in the repo shows it (lead)
**Kind:** lead
**Severity:** low
**Actually:** "qwen" appears nowhere in the repo except content.tex and one commit message. Every co-author trailer is Claude. The author knows the truth here; flagging only because nothing in the repo supports it.

### content.tex:20513–20543 — Colophon is a skeleton, and its last sentence is garbled
**Kind:** process-narrative / typo
**Severity:** low
**Says:** "blame not the compiler nor the models but the author, not the tools." The source comments mark the chapter "SKELETON" with a "TODO: the four threads".
**Fix:** "blame the author, not the compiler or the models." Finish or trim the essay before release.

### content.tex:20211–20213 / 20214 — the census claim is attributed to the wrong script
**Kind:** inconsistency
**Severity:** low
**Says:** "The download checks the census before anything else: 1,800 images with 1,800 matching XMLs and exactly the six class names".
**Actually:** `download_neu.sh` checks only the counts (`*.jpg`/`*.xml` = 1800). The six-class-name check is in `preprocess_neu_det.py` (l.60-107), which `neu_anchors.py` runs first through `load_split`. The overall claim holds; the attribution to the download script is loose.

## Checked and fine
- Dataset references and homepages: MNIST (LeCun 1998), CIFAR-10 (Krizhevsky 2009), Imagenette (Howard 2019), ImageNet (Deng 2009). All 13 homepage URLs return HTTP 200 (NEU, MSD, MapBiomas, Zenodo, CASP16, fastai, LeCun, academictorrents, lecopivo, PlantDoc, PlantVillage, VisDrone, Mendeley).
- The MNIST CVDF mirror URL, the CIFAR URL and `data/cifar-10/`, Imagenette `imagenette2-320` → `data/imagenette/`, and tiny-shakespeare from karpathy/char-rnn → `data/shakespeare/` all match the scripts.
- ImageNet: 1,281,167 train and 50,000 val (TFDS catalog plus local `dataset_info.json`); 1024/64 shards; version 5.1.0; the torrent hashes; train tar of 1000 per-class tars.
- The RAM arithmetic (155 + 4×(5–8) + 2.5 ≈ 178–190 GB). `SHIM_WORKERS` is 4 for most nets and 8 for the RandAugment ones in `scripts/jobs/*.conf`.
- timm crop/test sizes from `jax/timm_eval_protocols.json`: a1/a2/a3 crop 0.95; tv_in1k 0.875; A1/A2 and ConvNeXt at 288/1.0; MNv4-M at 256/1.0; A3 at 160 → 224. RSB is arXiv:2110.00476.
- NEU-DET: 1,800 images, 300 per class, six classes, 4,189 boxes (`runs/2026-09-17-neudet-fpn-run1/README.md:24`); 26 MB Drive copy; split 1080/360/360 stratified 180/60/60 with a fixed seed; anchors fitted on train; outputs `neu_det_fpn` and `neu_det448`; Song & Yan 2013 and He et al. TIM 69(4) 2020.
- ArASL: every census, burst, split and audit number matches `runs/2026-09-17-arasl/README.md`. Data in Brief 23 (2019), CC BY 4.0, "more than 40 people" (Mendeley wording), API sha256 check.
- PlantVillage/PlantDoc: 54,305 images, 38 classes, 152–5,507 per class, 7,946 leaves, 10,709 test list, 2,578 PlantDoc images in 28 classes with 10 PV classes unmatched, CC BY-SA 3.0 / CC BY 4.0, 0.1% and 1.3% audit; arXiv:1511.08060; Front. Plant Sci. 7:1419.
- EuroSAT: Zenodo 7711810 licence MIT (Zenodo API); 27,000 chips; 34 countries; band order B01–B12 then B8A; Neumann split 16,200/5,400/5,400; JSTARS 12(7) 2019.
- Brazil chips: 3,826 / 3,620 / 3,620; offset −1000; s2cloudless max < 0.2; purity 0.8; cap 2,000; class map. All from the rs-phase2 README.
- BraTS: MSD Task01 has 484 volumes and a 7.6 GB tar over S3; BraTS 2021 has 1,251 cases; ±5σ uint8; "83% zero"; 14,415 training slices; default seed 0; 240 = 16·15; 8-px crop border; Antonelli, Nat Commun 13, 4128 (2022).
- GW: CBC_CAT3 with no CBC/burst/detchar/stochastic hardware injections and CW deliberately not required (`scripts/demos/gw_common.py:170-176`); `[N,2,64,128]` f32 with int32 labels; `requirements-gw-lock.txt` exists; snippets stopped with GWTC-4 (per the code comment); ApJS 267, 29 (2023).
- CASP16: 62 / 159 / 50,157 / 230,942 / 27,690 / 26,310 / 26,228 / 1,380 / 3BVF / 21 entries / 12 of 37,672 / ~3.6 GB / 85-84-83 units all match `planning/casp16_distogram_demo.md`; cutoff 2024-05-01 in code; US-align and OST docker in the download script; three featured targets. Berman NAR 28, 235 (2000); Lin, Science 379, 1123 (2023).
- All eleven `lake exe` names named in the slice exist in `lakefile.lean`. Every `\ref` target (sec:residual_r34_example, bestiary_* sections, layer:fpnModule, app:verification) exists and is on topic.
- Chapter ranges (tensor–cnn = MNIST chapters 1–3, bn = CIFAR chapter 4, residual–attention = Imagenette chapters 5–9). ViT-Tiny has an ImageNet section.
- Acknowledgments: the comparator approach is in app:verification (l.19260). The Skřivan link matches `historical/mnist-lean4/README.md`.

**Tally:** 22 findings: 1 high, 9 medium, 12 low (four of them leads).

---

## Slice 22

# Cross-cutting fact-check: blueprint/src/content.tex (whole book)

Scope: things that only show up across the whole book. I scripted the checks for refs and labels, \uses, \lean names (namespace-aware index of about 15.9k decls), sorry in \leanok decls, \texttt Lean names in prose, depgraph node sync, and the scripts/book gates. I also compared the book against README.md, TRUST.md, PLATFORMS.md and CHANGELOG.md. No repo files were modified. Helper scripts are in /tmp/claude-1000/-home-skoonce-lean-lean4-mlir-worker/72b5c474-dbba-4182-a591-530e6f22d959/scratchpad/s/.

---

### content.tex:3995, 4013, 8436, 19415, 19505, 3277-3281, 7671-7676, 103 — "The convolution backward is a reversed-kernel convolution, unconditionally": false at even kernels; the cited bridge names no longer exist

**Kind:** overclaim / statement-mismatch / stale / missing-decl
**Severity:** high
**Says:**
- 3995: "The convolution bridge is unconditional. A convolution is linear, so it holds at every input."
- 4013 (Recap): "The convolution is a linear map, so its backward is unconditional: a convolution of the cotangent against the kernel with its channel axes swapped and its spatial axes flipped."
- 8436: "The depthwise convolution bridge is unconditional, because it is linear."
- 3277-3281 (thm ax:conv2dHasVJP3): "the input backward of a convolution is the reversed-kernel convolution. No hypotheses."
- 7671-7676 (thm ax:depthwiseHasVJP3) states the backward as \(\sum W_{c,k_H-1-k_h,k_W-1-k_w}\,dy_{c,h+k_h-p,\dots}\) for every kernel.
- 3949/3956/19320 name `conv_back_bridge_1to2` and `conv_back_bridge_2to2`. 3953-3956 and 19505-19507 say the bridge is "discharged here by expansion at the concrete shape".
- 19414-19416, under "The one conditional", lists only smooth-point clauses.
- 103 (intro): "the backward pass is another convolution with a reversed kernel."

**Actually:**
- `IR.conv_back_bridge` (LeanMlir/Proofs/Foundation/IR.lean:278) carries `hkH : 2*((kH-1)/2)+1 = kH` and `hkW`, i.e. odd kernels only. So do `convBackDenote_eq_input_grad_formula` (IR.lean:267), `convFlatBack_eq_vjp_backward` (ConvBackCertifiedTie.lean:33) and `depthwiseConv2d_dwReverse_eq_input_grad_formula` / `depthwiseFlatBack_eq_vjp_backward` (DepthwiseBackCertifiedTie.lean:37,50).
- EvenKernelConvBack.lean:1-30 says outright: "That hypothesis is not a convenience: the statement is false without it… At kH = 4 the reversed-kernel conv is the adjoint of a conv shifted one pixel." ConvNeXt-T has four even kernels (the 4×4/s4 stem and three 2×2/s2 downsamples). They are repaired by `padOdd` (ConvNeXtWholeBackCertifiedTie.lean:15-29). The book never mentions `padOdd` or even kernels.
- The Lean `conv2dHasVJP3` / `depthwiseHasVJP3` backward is the general `conv2dInputGradFormula` / `depthwiseConv2dInputGradFormula` (CNN.lean:168, Depthwise.lean:106), which uses index \(h_i+p-h_o\). The book's depthwise formula matches it only when \(k_H-1-p=p\), i.e. odd \(k_H\).
- `conv_back_bridge_1to2` and `_2to2` exist nowhere in the tree. Commit 1dcbcb58 changed IR.lean's "four fixed-shape conv bridges" into "three general ones over odd kernels", so "by expansion at the concrete shape" is stale too.
- "Linear" is not the reason the bridge holds. Kernel oddness, together with the symmetric SAME pad, is the precondition.

**Fix:** Name the hypothesis everywhere: "for odd kernels (`hkH`, `hkW`), the reversed-kernel conv is the VJP; ConvNeXt's even 4×4 and 2×2 kernels use the kernel zero-extended to odd size (`padOdd`), which is what the emitter's asymmetric pad computes."
- Replace `conv_back_bridge_1to2`/`_2to2` with `conv_back_bridge`.
- State the conv and depthwise theorem bodies as the gradient formula, with the reversed-kernel form as the odd-kernel corollary.
- Add kernel oddness to "The one conditional" (19414), or retitle it.

---

### content.tex:1371-1449, 1531-1537, 3288-3334, 3394-3399, 3439-3442, 4324-4368, 7699-7701, 7743-7747, 7774-7776, 12508-12509, 12558-12562, 12583-12587, 13009-13014 — fourteen \leanok proof sketches describe the term-by-term route that commit 998f2c70 deleted; `pdiv_of_affine` and `pdiv_of_linear` never appear in the book

**Kind:** stale
**Severity:** high
**Says:** Each sketch distributes the sum rule (ax:pdiv_add), constant rule (ax:pdiv_const), finite-sum rule ×1/×2/×3 (thm:pdiv_finset_sum), product rule (ax:pdiv_mul) and reindex (ax:pdiv_reindex). 1372-1374 (pdiv_dense): "Every foundation rule from Chapter~1 except the chain rule fires exactly once."

**Actually:** Commit 998f2c70 ("pdiv_of_affine — fourteen Jacobians of affine maps from ContinuousLinearMap.fderiv, −2.4k lines") rewrote every one of these proofs. Current proofs and the book sketches that are now stale:

| Book line | Theorem | Current Lean proof |
|---|---|---|
| 1369-1400 | `pdiv_dense` | pdiv_of_affine (MLP.lean:35) |
| 1424-1450 | `pdiv_dense_W` | pdiv_of_affine (MLP.lean:50) |
| 1531-1537 | `denseBiasGrad_correct` | its inner lemma `pdiv_dense_b` is pdiv_of_affine (MLP.lean:110) |
| 3288-3334 | `conv2dHasVJP3` | `rw [hsplit, pdiv_of_affine]` (CNN.lean:268) |
| 3394-3399 | `conv2dWeightGradHasVJP` | CNN.lean:663 |
| 3439-3442 | `conv2dBiasGradHasVJP` | CNN.lean:706 |
| 4324-4332 | `pdiv_bnAffine` | BatchNorm.lean:461 |
| 4356-4368 | `pdiv_bnCentered` | pdiv_of_linear (BatchNorm.lean:511) |
| 7699-7701 | `depthwiseHasVJP3` | Depthwise.lean:176 |
| 7743-7747 | `depthwiseWeightGradHasVJP3` | Depthwise.lean:382 |
| 7774-7776 | `depthwiseBiasGradHasVJP` | Depthwise.lean:448 |
| 12558-12562 | `pdivMat_matmul_left_const` | pdiv_of_linear (Tensor.lean:901) |
| 12583-12587 | `pdivMat_matmul_right_const` | Tensor.lean:914 |
| 13009-13014 | `patchEmbedFlatHasVJP` | Attention.lean:2106 |
| 12508-12509 | `pdivMat_scalarScale` (says product + constant + identity) | `pdiv_const_smul` + `pdiv_id` (Tensor.lean:1004) |

- The generated \uses lines of these blocks already read just {ax:pdiv}. Each sketch therefore cites theorems that its own \uses line does not list.
- `pdiv_of_affine`, `pdiv_of_linear` and `pdiv_clm` (Tensor.lean:254, 264) have zero occurrences in content.tex. The proofs that are not affected (biPathHasVJP's sum rule, elemwiseProduct, bnNormalize's product rule, pdivMat_transpose's reindex) are correct.

**Fix:** Add `pdiv_of_affine` and `pdiv_of_linear` to Chapter 1 as foundation theorems with \lean blocks: "an additive, homogeneous f on Vec m is a continuous linear map, so the Jacobian of v ↦ f v + c is f on the basis vector". Rewrite the 14 sketches as "affine in the variable; pdiv_of_affine reads entry (i,j) off f(e_i)_j; collapse the indicator". Delete the "fires exactly once" sentence.

---

### content.tex:1952-1977, 3955-3960, 5385-5390, 6252-6258, 8401-8403, 9993-9996, 11507-11509, 13785-13787, 13814-13817, 19366 — the toy "MLIR: operator" listings come from the legacy IRPrint.lean but are presented as the emitted, denoted, bridged graph

**Kind:** overclaim / stale
**Severity:** high
**Says:**
- 1915-1918: "The StableHLO in this section is the artifact the proofs are about… Nothing between the theorem and the GPU rewrites it."
- 1952: "Here is what the code generator emits" (`@linear_back`).
- 1967-1971: "the printer emits the identical graph at production scale."
- 1974-1977: "…the printer that turns it into the text above, and the execution oracle that checks the result on the GPU."
- 3955: "The printer walks the graph and emits one stablehlo op per node."
- 5389: "Here is what the printer emits" (BN).
- 6252-6255: residual "emitted backward is given a denotation… shown equal to residualHasVJPAt's backward."
- 8401-8402: "The emitted graph is denoted and shown equal to depthwiseHasVJP3's backward."
- 9993: SE "The emitted graph realizes seBlockHasVJP's product-rule backward in full."
- 13785: "The emitted graph denotes transformerAttnSublayerHasVJPMat's backward."
- 13814-13817: "Each is emitted as the rendering of a machine-checked derivative, from the same three pieces: denoted IR, bridge theorem, printer."
- 19366: "the unproven surface here is a single printer."

**Actually:**
- LeanMlir/Proofs/Codegen/IRPrint.lean:5-11 says of itself: "Legacy printers from Hlo/HloF terms and plain String builders… The verified renderers are StableHLO.Pretty and the *Render* files; nothing imports this file."
- The listings' SSA names (`%bk0`/`%dxhat`/`%gls`/`%dadd`/`%daQK`/`%We`/`%Wt`, and `@linear_back`, `@conv_back`, `@dw_back`, `@bn_back`) come from IRPrint (lines 147, 431, 403-407, 675, 1241) and occur in no verified_mlir/*.mlir file. conv_back is a hand string builder (IRPrint:431), not a walk of `Back`.
- IR.lean has no residual, depthwise, attention or layer-scale `Back` node or bridge. The only `*_bridge` theorems are dense/relu/conv/maxpool/bn/layernorm/gelu/swish/sigmoid/softmax/se/mlp plus the grad bridges.
- The oracle (check_ir_codegen.py:47) uses `llvm-cpu` as the correctness gate; the GPU leg is ROCm-only and best-effort. Appendix 19336-19339 says this correctly, which contradicts 1977.
- Two printers exist (IRPrint and StableHLO.Pretty/emitTok), not "a single printer".
- The only listings that really are emitted artifacts are linear_fwd (1925) and linear_train_step (2160). The MLP section (2905-2911) and Appendix 19323-19329 do describe IRPrint honestly, which contradicts the sentences above.

**Fix:** Retitle these listings as "the IRPrint illustration of the bridged graph (a hand-written mirror, read not proved; the trainer's own text is `verified_mlir/<net>_train_step.mlir`)". Drop "the printer emits the identical graph at production scale". For residual, depthwise, attention and layer scale, either cite the trainer-tier tie (e.g. `depthwiseFlatBack_eq_vjp_backward`, which needs odd kernels) or remove "denoted and shown equal". Change "single printer" to "the verified renderer's printer (plus the illustrative IRPrint mirror)".

---

### README.md:57 (vs content.tex:9120/9163, 14108/14149) — README's ImageNet numbers for MobileNetV4 and ViT-Tiny disagree with the book

**Kind:** inconsistency
**Severity:** high
**Says (README):** "MNv4-Conv-M 76.68 (side quest) … ViT-Tiny 72.42 % on the verified path, none more than 0.51 from its JAX reference."
**Actually:**
- Book MNv4 verified is 77.35% (reference 77.39%) at 9120, 9163 and 9192.
- Book ViT-Tiny verified is 71.61% (reference 71.64%) at 14108 and 14149, and 13753 says "71.6%". "72.42" appears nowhere in content.tex.
- The README's numbers are CHANGELOG v0.7.2's (CHANGELOG.md:20, "ViT-Tiny 72.42% against 72.07"), which the book has since replaced.
- The other README tier-4 values (74.17, 78.08, 77.09, 71.12, 76.878→76.88, 81.30) match the book.

**Fix:** Update README to MNv4 77.35 and ViT-Tiny 71.61, and recheck the "none more than 0.51" clause (currently MNv2 at 0.51).

---

### content.tex:18809, 19269-19288 (and TRUST.md:11, tests/comparator/README.md:3) — comparator theorem counts disagree with each other and with the configs

**Kind:** wrong-number / inconsistency
**Severity:** high
**Says:**
- 18809: "over 88 theorems". 18815/18826/18834 break that down as 13 + 39 + "The last 35".
- 19269: "It runs 88 theorems… and the 35-theorem tie / faithfulness / certificate tier". Then 19286-19290, two paragraphs later: "The 87 are not the whole proof suite… What the 87 add…"
- TRUST.md:11 says "87 re-checked".
**Actually:** tests/comparator/config.json has 13 names, config-arch.json 39, config-tier.json 55 (107 distinct; ChallengeTier.lean has 55 `theorem`s). 13+39+35 = 87, not 88, and the tier is now 55, not 35. Nothing currently agrees with the configs.
**Fix:** Say 107 (13 + 39 + 55), or better, generate the number. Fix TRUST.md and tests/comparator/README.md to match.

---

### content.tex:376-379, 343-357 table, 19231-19236 — theorem budget: the Steps column undercounts Chapters 1–4

**Kind:** stale / wrong-number
**Severity:** medium
**Says:** "44 contracts, 9 witnesses and 37 step certificates". Ch1 steps = 2, Ch2 = 2, Ch3 = 2, Ch4 = 5. The definition at 367-369 counts "that a gradient node is the loss's derivative in its parameter" as a step certificate.
**Actually:**
- Ch1 has linear_fold, linear_loss_grad and linear_sgd_descends (3). Ch2 has mlp_fold, mlp_loss_grad and mlp_sgd_descends (3). Ch3 has cnn_fold, cnn_loss_grad and cnn_sgd_descends (3).
- Ch4 has cifar_fold, cifar_loss_grad, cifar_bn_fold, cifar8_step_tie, cifar8bn_step_tie, cifar8_step_tieG, cifar8_loss_grad and cifar8_sgd_descends (up to 8).
- The table (commit 5b639217, Sep 28) predates every `*_loss_grad` theorem in Ch1–4 (all added in 72067060, Oct 1). Chapters 5–9 do list "the gradient nodes are the loss's derivative"; rows 1–4 don't.
- No script maintains this table, and the appendix at 19231-19236 repeats it.
**Fix:** Recount the Steps column (at least +1 each in Ch1–3 and +1 or +2 in Ch4), update the total, and consider generating the table.

---

### content.tex:19287 — AuditAxioms count is stale, and it is quoted right after saying it won't be

**Kind:** wrong-number / stale
**Severity:** medium
**Says:** "tests/AuditAxioms.lean prints the axiom closure of 1,751 declarations". Ten lines earlier (19245-19247): "that file is the live count, quoted here deliberately as a property rather than a number".
**Actually:** `grep -c '#print axioms' tests/AuditAxioms.lean` = 1950 (plus 68 in AuditAxiomsHeavy.lean). Commit 998f2c70's message reported "1773/1773".
**Fix:** Drop the number, as 19247 promises, or generate it.

---

### content.tex:18909-18911, README.md:57, PLATFORMS.md:13 — tier wall-clocks contradict the book's own per-epoch numbers and the measured run

**Kind:** inconsistency / wrong-number
**Severity:** medium
**Says:**
- Book: `lake run mnist … (~30 s)` and `lake run cifar … (~5 min)`.
- README: mnist "~1 min", cifar "~5 min".
- PLATFORMS: mnist "a minute", cifar "~6 min", imagenette "~5½ h" (book and README say ~6 h).
**Actually:**
- MNIST: the book's own figures give linear 12×224 ms + MLP 12×850 ms + CNN 12×4.9 s ≈ 72 s (787, 2366, 3056). lakefile benchTable estimates 3+8+41 s.
- CIFAR: six arms at 40 epochs and "about six seconds each" (4171) for the BN arms. runs/2026-08-26-cifar8w-6arm-timing/timing.txt measures 374 s + 757 s = 1131 s ≈ 19 min.
**Fix:** mnist ~1 min. Cifar ~20 min, or re-measure resident and cite the run dir. Make all three files say the same thing.

---

### content.tex:333-334 — the appendix list describes the wrong Appendix B

**Kind:** stale
**Severity:** medium
**Says:** "Toolchain setup (A), the complete proof framework as a reference (B), and data availability (C)."
**Actually:** The appendices (after \appendix at 18746) are A Getting started (app:getting_started), B On Verification (app:verification: audits, bridges, oracles, precision) and C Data availability. No "complete proof framework reference" appendix exists. Commit 187a2da8 reordered the appendices.
**Fix:** "Getting started (A), On Verification: how each claim is checked (B), and data availability (C)."

---

### content.tex:113-115 (with 4199-4240, 5445-5450 context) — BN/LN Jacobian is called "diagonal plus a rank-1 outer product"

**Kind:** math
**Severity:** medium
**Says:** "Softmax, batch norm, and layer norm all have dense Jacobians with a clean closed form, because each one is a diagonal plus a rank-1 outer product." The ViT recap (14352) repeats "rank-1 correction" as one of the "five tricks".
**Actually:** The book's own BN Jacobian (4466-4480, thm:bnNormalizeHasVJP) is \(\tfrac{s}{n}(n\delta_{ij}-1-\hat x_i\hat x_j)\): a diagonal minus \(\mathbf 1\mathbf 1^\top\) minus \(\hat x\hat x^\top\), which is a rank-2 correction. The Ch4 recap (5448-5449) itself names two corrections, centering and rank-one normalization. Only softmax, \(\mathrm{diag}(p)-pp^\top\), is rank-1.
**Fix:** "a diagonal plus a low-rank (softmax: rank-1; batch/layer norm: rank-2) correction."

---

### content.tex:19094-19096 — "ImageNet wants 16 GB cards: every row trains on four of them" contradicts the book's own ImageNet runs

**Kind:** inconsistency
**Severity:** medium
**Says:** "ImageNet (Track 4) wants 16 GB cards: every row trains on four of them, and a 12 GB card runs all but ConvNeXt-B and ViT-B."
**Actually:** 11 ImageNet result tables in the book read "4× 3060 (CUDA)" (12 GB cards), e.g. 8563, 13958 and 14108. PLATFORMS.md's 3060 box carries the R50/R34/MNv2/MNv4 ImageNet runs. Only 4 tables are on 4× 4060 Ti.
**Fix:** "Every Track 4 row except ConvNeXt-B and ViT-B fits 12 GB cards, and most of the book's ImageNet runs used 4× RTX 3060."

---

### content.tex:323-328, 14404-14407, 19239 (vs README.md:46-47) — bestiary and demo counts

**Kind:** wrong-number / inconsistency
**Severity:** medium
**Says:**
- 323: "Forty-five further architectures".
- 19239: "the bestiary's 45 architecture families".
- 326-327: "eleven of the groups carry a demo".
- 14406: the bestiary is "pure NetSpec values, no training runs, no VJP commitments".
**Actually:**
- The chapter has 47 `\subsubsection*{… (Bestiary/X.lean)}` entries, and Bestiary/ has 46 .lean files (all cited). README says "46 read-only NetSpec catalogue entries".
- The subsections with "--- demo:" in their titles number 12: detection, inspection, people, agriculture, remote sensing, segmentation, NLP, diffusion, physics, signal, beyond vision and structure. README counts "fifteen demos" (12 + 3 games).
- "No training runs" contradicts the chapter's own demos.
**Fix:** Use 46 (or 47) consistently, say "twelve", and limit "no training runs" to the catalogue entries.

---

### content.tex:14341-14345 (Ch9 Recap) — "proved at every depth (Theorem vitTinyHasVJP_correct)"

**Kind:** inconsistency / overclaim
**Severity:** medium
**Says:** "the whole ViT-Tiny is proved at every depth (Theorem~\ref{thm:vitTinyHasVJP_correct})".
**Actually:** thm:vitTinyHasVJP_correct (13383-13389) is stated "at ViT-Tiny's shape… twelve blocks". The any-depth results are thm:transformerTowerHasVJPMat (13256) and thm:vitForwardKVHasVJP (13314).
**Fix:** "the tower is proved at every depth (Theorem~\ref{thm:vitForwardKVHasVJP}), and ViT-Tiny, at k = 12, end to end (Theorem~\ref{thm:vitTinyHasVJP_correct})."

---

### content.tex:5451-5454 (Ch4 Recap) — "Chapters 8 and 9 add no normalization proof of their own"

**Kind:** inconsistency
**Severity:** low
**Says:** "which is why Chapters~\ref{chap:layernorm} and~\ref{chap:attention} add no normalization proof of their own."
**Actually:**
- Ch8 proves thm:layerNormHasVJP (11004) and thm:chanLNTensor3HasVJP (11030); Ch9 proves thm:layerNormVecHasVJP (13059).
- The budget table counts "LayerNorm" (Ch8) and "vector LayerNorm and its block" (Ch9) as contracts, and line 444 says LayerNorm is "proved from Ch 1 foundation rules".
- IR.lean has a separate `layernorm_back_bridge`.
**Fix:** "…add no new normalization analysis: their LayerNorm proofs reduce to Theorem~\ref{thm:bnHasVJP}."

---

### content.tex:19086 — Orin "Tracks 1–3 on record"

**Kind:** overclaim
**Severity:** low
**Says:** "Tracks 1--3 on record; lake run imagenette-orin is the Imagenette tier".
**Actually:** PLATFORMS.md's Orin row records only "ViT-Tiny 80 epochs; the six-row lake run imagenette-orin tier is the next run".
**Fix:** "Tracks 1–2 and the MNIST/CIFAR tiers on record; of the Imagenette tier, ViT-Tiny."

---

### content.tex:19088-19089 — Mac and Arc "matching CUDA"

**Kind:** overclaim
**Severity:** low
**Says:** "matching CUDA (92.10 / 97.79 / 98.71%)" for the Mac and "(92.10 / 97.83 / 98.74%)" for the Arc.
**Actually:** CUDA is 92.10 / 97.81 / 98.77 (787, 2366, 3056). The values are close, not equal.
**Fix:** Say "within seed noise of CUDA (…)".

---

### content.tex:1974-1977 — the oracle is said to check "on the GPU"

**Kind:** inconsistency
**Severity:** low
**Says:** "the execution oracle that checks the result on the GPU".
**Actually:** check_ir_codegen.py:47 and :65 use `llvm-cpu` as the gate; ROCm is best-effort (Appendix 19336-19339 agrees).
**Fix:** "…checks the result on IREE's CPU backend (and on ROCm where available)".

---

### content.tex:18792 — `SgdDescentLinear` is not a module or decl

**Kind:** command/path
**Severity:** low
**Says:** "\texttt{SgdDescentLinear} (the step decreases the loss)"
**Actually:** The ProofsMinimal roots (lakefile.lean:323) are `LeanMlir.Proofs.Nets.Small.LinearFold` and `LeanMlir.Proofs.Training.SgdDescent.Linear`. The file is LeanMlir/Proofs/Training/SgdDescent/Linear.lean.
**Fix:** `SgdDescent.Linear`.

---

### content.tex:15191, 15250, 15395, … 18224 (39 refs) — `\S~\ref{layer:…}` points at definitions, not sections

**Kind:** typo/render
**Severity:** low
**Says:** e.g. "\emph{One} new primitive (\S~\ref{layer:inceptionModule})".
**Actually:** layer:* labels sit in `definition` environments. The theorem counter is global (macros/common.tex:12-22, no per-chapter numbering), so the ref prints a bare definition number after "§". It reads as a section that doesn't exist.
**Fix:** Use "Definition~\ref{…}", or `\bestiaryref`.

---

### content.tex:7361, 8730, 9228, 10399, 11837, 12068, 14325 — seven visible "[TODO: …]" markers in the printed text

**Kind:** process-narrative
**Severity:** low
**Says:** e.g. "\textbf{[TODO: \texttt{timm}'s index-level \texttt{RASampler} for …"
**Actually:** These render in bold in the PDF and web book. CHANGELOG v0.7.2 describes them as rerun placeholders.
**Fix:** Turn them into dated "Not yet run:" notes or LaTeX comments before publication.

---

### content.tex:405-406, 459-460, 422-425 — reading-plan contradictions in "How this book is organized"

**Kind:** inconsistency
**Severity:** low
**Says:**
- 408-409: "Chapter~1 is the one chapter every target reads in full".
- 422-423: "Ch~2--\ref{chap:residual} is a complete reading list".
- 459: "read Ch~1 carefully (it's short)".
- 297-300: Ch1 "is the book's densest chapter".
- 416-417: ResNet-34 "Adds one theorem on top of CNN+BN".
**Actually:**
- The ResNet reading list omits Ch1, which contradicts 408.
- Ch1 is lines 724-2307, about 1,580 lines and longer than Chapters 2, 3 and 4 (677, 1,048 and 1,437 lines), so it isn't short.
- The table credits Ch5 with 9 contracts and 7 step certificates, not one theorem.
**Fix:** "Ch 1–5"; drop "(it's short)"; "adds the residual fan-in VJP (plus GAP, stride-2 and full-depth results)".

---

### content.tex:5375-5380 (Ch5 Recap) — "four cards … at four times the batch"

**Kind:** overclaim (narrowing)
**Severity:** low
**Says:** "the data-parallel twins (Theorem resnet34_sync_tie) say four cards computing a synchronised step compute one card's step at four times the batch."
**Actually:** The theorem (5981) is stated for R ≥ 1 replicas of N ≥ 1 images.
**Fix:** "R cards … at R times the batch (four in the runs)."

---

### content.tex:386-388 (and others) — "Every theorem and definition carries a \uses{} annotation"

**Kind:** overclaim
**Severity:** low
**Actually:** 32 environments have no \uses: 8 root definitions (ax:pdiv, ax:conv2d, ax:maxPool2, ax:depthwiseConv2d, ax:geluScalar, ax:geluErfScalar and others) and the 24 bestiary layer:* definitions.
**Fix:** "Every theorem…".

---

### content.tex (whole) — terminology drift

**Kind:** typo/render
**Severity:** low
**Actually:**
- "MobileNetV2" 91 times, "MobileNet V2" 4, "MobileNet-V2" 5 (e.g. table row 13737 "MobileNet V2" vs 9928/11460 "MobileNetV2").
- "MobileNet V4" once vs "MobileNetV4" 30 times.
- "vector--Jacobian" 4 times vs "vector-Jacobian" 3.
- "Batchnorm" once (318) vs "BatchNorm" 140.
**Fix:** Normalise.

---

### content.tex — 23 unused section labels

**Kind:** inconsistency
**Severity:** low
**Actually:** Never \ref'd: app:data, chap:introduction, sec:bestiary_{detection,entries,inspection,nlp,primitives}, sec:cnn_mnist_example, sec:convnext_example, sec:convnext_phase4, sec:depthwise_mnv2_example, sec:enet_phase4, sec:enet_side_quests, sec:game_ttt, sec:getting_started_platforms, sec:getting_started_track3, sec:inside_bridge, sec:mlp_mnist_example, sec:mnv4_pjrt, sec:r34_recipe, sec:vit_phase4, sec:vit_results, plus layer:denseBlock and layer:transitionLayer. (Some, like sec:bestiary_detection, are used as README anchors, so these are harmless.)

---

### scripts/book/ gates — what they don't cover (lead)

**Kind:** lead
**Severity:** medium
**Actually:** CI (.github/workflows/blueprint.yml:93, 364, 374) runs `book_floats.py --strict`, `blueprint-checkdecls` (\lean names exist) and `blueprint_uses.py --check`. Not covered:
1. **Listings.** `book_listings.py` is not in CI, and running it now reports 6 DRIFT listings:
   - L8460: MNv2 JAX config, book `learningRate := 0.045`, `expLRDecayEpochs := 1.0`, `epochs := 350`; file has 0.12, 2.5 and 420.
   - L11550: ConvNeXt JAX config, `learningRate := 2.5e-4` vs 0.004.
   - L16775: GPT spec is missing `(causalMask := true)`.
   - L8233, L9067, L13594: the trainer bodies are spliced from NetsCore.
   - It also cannot match any of the 11 MLIR listings, which is how the IRPrint provenance above went unnoticed.
2. **\leanok vs sorry.** Not checked. There are no `sorry`s today; I checked every \leanok decl body.
3. **Prose names.** \texttt Lean names are not checked, which is how `conv_back_bridge_1to2`/`_2to2` survived. A script over all \texttt identifiers found only those two plus `SgdDescentLinear` unresolved.
4. **Depgraph figures.** Not regenerated or verified in CI (pygraphviz missing). They are in sync today: identical node sets, and no \uses edits since 5429b4f9.
5. **Numbers.** The budget table, comparator counts, AuditAxioms count, tier times and README/TRUST/PLATFORMS numbers are all hand-maintained, with no cross-file check.
6. **Training-log excerpts.** `verify_excerpt.py` is manual only.
7. **Cross-refs.** `book_xrefs.py` is a census, not a gate.

**Fix:** Add `book_listings.py` (with an allowlist), a prose-identifier resolver and a README/TRUST number cross-check to blueprint.yml. Generate the budget, comparator and AuditAxioms numbers.

---

## Checked and fine
- All 342 \ref/\hyperref/\bestiaryref targets resolve; no duplicate labels (395 labels).
- All 1,240 \uses entries resolve to labels.
- All 281 \lean names resolve (namespace-aware index), including the 24 `Layer.*` constructors in LeanMlir/Types.lean.
- No `axiom` declarations, and no `sorry` in any \leanok-cited decl or anywhere under LeanMlir/Proofs (hits are comments only).
- depgraph figures: node set equals the current theorem/definition set; no \uses changes since the last regeneration (5429b4f9).
- README tier-3 numbers match the book: 92.10/97.81/98.77, CIFAR 76.3 (median of five), R34 89.99, MNv2 89.25, B0 90.04, ConvNeXt 82.27, ViT 68.74.
- README tier-4 numbers match: R34 74.17, R50 78.08/77.09, MNv2 71.12, B0 76.88, ConvNeXt 81.30.
- Imagenette comparison table (9927 = 11459 = 13736): params, KB, ms/step and minutes are mutually consistent; ms × 295 matches each "Run it first" per-epoch figure; 47+35+41+74+24 min ≈ 3.7 h (18917). MLIR sizes match verified_mlir (754 KB, 1,071 KB = 1,070,905 chars, 1,317 KB, 1,019 KB, 1,282 KB). "7 KB to 1,317 KB" holds for the plain Adam steps.
- Parameter counts are consistent across chapters and tables: R34 21.3M (Imagenette) / 21.8M (ImageNet), MNv2 2.24M/3.5M, B0 4.02M/5.3M, ConvNeXt-T 27.83M/28.6M, ViT-Tiny 5.53M, MNIST CNN 3.5M, MLP 670K. The 6272→512 layer is 3,211,776.
- Dataset sizes are consistent: Imagenette 9,469/3,925; ImageNet 1,281,167/50,000; MNIST and CIFAR 10,000 test.
- ImageNet "two paths" tables vs Recaps: ViT 0.03-point tie, R50 A3 78.08 vs the paper's 78.1, MNv4 100 epochs tied. Wilson CI and 1.28M usage are consistent.
- Budget table column sums: 44, 9 and 37 add correctly (it is the per-chapter counts that are stale).
- cifar8w SGD/Adam op counts are about 1,009/2,301, close to the stated 1,001/2,293; the ratio of 2.3 holds.
- comparator `chk_reluHasVJPAt_correct`, `chk_mlpHasVJPAt_correct` and `chk_maxPool2HasVJPAt3_correct` exist as the book says.
- `check_ir_codegen.py`, `IR.mlp_whole_bridge`, `denote_subst`, `bn_back_bridge`, `relu_back_bridge`, `maxpool_back_bridge` and `se_back_bridge` exist.
- The Platforms table has six rows, matching PLATFORMS.md. TRUST.md's "no axiom, no implemented_by" holds.
- The ViT arXiv date (October 2020) is correct.

**Tally:** 5 high, 9 medium, 12 low (26 findings, including 1 lead).


---

## Status (2026-10-19, working tree, nothing committed)

Done, all gates green (`book_listings.py --check`, `book_prose_idents.py`, `book_counts.py`,
`blueprint_uses.py --check`, `book_floats.py --strict`, `book_xrefs.py`):

- Theme 1 (odd kernel): every conv/depthwise bridge sentence carries the hypothesis; `padOdd` for
  ConvNeXt's even kernels; Affine-rule block `thm:pdiv_of_affine`.
- Theme 2 (stale proof sketches): 15 rewritten.
- Theme 3 (`MLIR: <operator>` from IRPrint): all nine sections now excerpt the committed
  `verified_mlir/<net>_train_step.mlir` at the trained shape (artifact SSA names, default
  `precision` dropped, lines wrapped), name the leaf tie and the whole-step tie, and state the
  hypothesis honestly ("holds at every input", "smooth-point", "Shape") instead of
  "unconditional" / "representative scale". `book_listings.py` now compares MLIR blocks op by op
  against the artifact the prose names and fails any StableHLO block that is in no artifact (the
  book has no illustrative StableHLO); `scripts/book/mlir_excerpt.py` cuts gate-compatible
  excerpts. Appendix B: the printer bullet describes `StableHLO.Pretty` over the theorem's own
  `SHlo` term; IRPrint is a legacy demo the execution oracle still runs; "single printer" →
  "one printer's per-token text"; "Read, not proved" → "Re-rendered, not proved" (CI diffs every
  quoted artifact except `cifar8w_bn_sgd`, still on `render_guard_baseline.txt`).
- Theme 5 (label-smoothing floor), the CIFAR BN prose (per-image statistics; re-render plan in
  `planning/cifar-batch-bn-rerender.md`), the counts (46 / 12 / 110 / 58), the listing drifts.
- Chapters 1–3 restated at batch N (`LinearFoldB`, `MlpFoldB`, `CnnFoldB`; `convBackP`
  descriptor; `tests/TestSmallNetsBatchedEmit.lean`); the verified-path VJP oracle
  (`tests/vjp_oracle/run_verified.sh`, CI `iree.yml`), numbers pending CI.
- §4 gate gaps: listings, prose `\texttt` names and counts are in `blueprint.yml`.

- Theme 4 (pdiv at a kink): the book now says what `pdiv` is at a non-smooth point — `fderiv`'s
  zero map, so the pdiv-derived ReLU / max-pool backward is the zero vector there — and that the
  codegen emits the framework convention instead, agreeing off the kink by theorem
  (`relu_codegen_matches_canonical`, `maxPool2_codegen_matches_canonical`). "Declines to return a
  value", "takes the standard convention", "permitted to fail", "measure-zero" (→ "null for generic
  weights"), "discharged by Chapter se", "same convention as ReLU's kink", "depthwise … rfl" and the
  "guarded subgradient" title/sketch are gone. Uncommitted.

Open: theme 9 (visible TODO markers), theme 10 (ℝ-scoping sentences
beyond Ch 1), §2 overclaims, §3 single fixes, the budget-table Steps column, other historical
listing labels.
