# Book theorem blocks vs the Lean at HEAD — check of 2026-10-21 (at aeafa548)

The 170 `theorem` / `definition` blocks of `blueprint/src/content.tex` (131 + 39) read against
the Lean sources after the 2026-10-19/20 landings (batched ch 1–3 folds, the snake_case rename of
the batched weight ties, the cifar8 batch-BN tie, the grind pass, the R34 bag-of-tricks renders,
the MNv2 TF-slim recipe, MuZero). Report only; nothing in the book was edited.

## 0. What is clean (mechanical, run on atlas)

| check | result |
|---|---|
| every `\lean{}` name resolves in the built environment (`lake exe blueprint-checkdecls`, 288 names) | all resolve; the 2477 dependency edges are byte-identical to `blueprint/lean_deps` |
| `scripts/book/blueprint_uses.py --check` | in sync, 170 blocks, 1304 edges |
| `scripts/book/book_prose_idents.py` | 426 / 426 `\texttt` identifiers resolve |
| every `\leandocref{}` target (63) | resolves |
| every bracketed hypothesis name in an `\Assume{}` item | is a binder of a cited declaration (after mapping `h\(_1\)` → `h₁`, `h\(\varepsilon\)` → `hε`) |
| `scripts/gates/audit_only_mentions.py` | 72 unreached, unchanged shape |
| `scripts/book/book_counts.py` | bestiary / demo / comparator / budget-table counts agree |
| `tests/AuditAxioms.lean` over the rebuilt `Certs` | 1,959 declarations, every one under `{propext, Classical.choice, Quot.sound}` or a subset; no `sorryAx`, no `ofReduceBool` |
| the 2026-10-18 fact-check themes (odd kernels, deleted proof sketches, label-smoothing floor, pdiv at a corner) | fixed in 5729af20 / fa46f254 / 5429b4f9; one residual below (`ax:maxPool2HasVJP3`) |

So no block cites a name that moved, and nothing the book calls proved has stopped being proved.
What follows is statement-level drift: hypotheses the Lean takes that the block does not list,
glosses that name the wrong artifact, and four places where the book is behind the Lean.

## 1. Fix first (high — a block states less or more than its Lean)

1. **`thm:efficientnet_step_tie` (L9879) has no `\Assume{}`**; `efficientnet_net_tiedG` takes
   `hεw : w.EpsPos` — all 49 BatchNorm ε > 0 — and every chain cotangent uses it
   (`EfficientNetStepTieG.lean:449-493`). ConvNeXt's `cnx_net_tiedGB` genuinely has no positivity
   (`ConvNeXtStepTieGB.lean:499-502`), so that block is right to have none.
2. **Three ViT blocks are empty** — label, `\lean{}`, `\uses{}` and no statement:
   `thm:layerNormPerTokenHasVJPMat` (L13308; Lean takes `hε : 0 < ε`),
   `thm:densePerTokenHasVJPMat` (L13358), `thm:geluPerTokenHasVJPMat` (L13374; `gf : GeluForm`).
3. **The three attention-tower blocks omit ε > 0 and overstate the object**:
   `thm:transformerBlockHasVJPMat` (L13499), `thm:transformerTowerHasVJPMat` (L13522),
   `thm:vitBodyHasVJPMat` (L13552). Each Lean theorem takes `hε : 0 < ε`
   (`Attention.lean:1603, 1682, 1774`), and the tower/body are the *weight-tied* `Nat.rec` tower
   with one parameter tuple and scalar-affine LayerNorms ("Per-block parameters are not
   formalized in this file"). "ViT-Tiny/Base (k = 12) and Large (k = 24) are instances" is not
   true of these theorems; ViT-Tiny is `vitForwardKVHasVJP`. `vitFullHasVJP` (weight-tied whole
   net) belongs in `\lean{}` of `thm:vitBodyHasVJPMat`, not of `thm:layerNormVecHasVJP` (L13326).

## 2. The book is behind the Lean (new or uncited rungs)

1. **Chapter 8 has no rung (i).** `convNextForwardTChHasVJP_correct` (`ConvNeXtFullT.lean:397`),
   `StableHLO.convNextFwdGraphTCh_faithful` (`:552`) and `convnextVerified_fwd_faithful`
   (`SpecVJP.lean:413`) exist and are cited nowhere; chapters 5–7 and 9 each have a "whole net has
   the VJP / the graph denotes the forward" block. The lead-in says "Three rungs"; it would be four.
   (`convnextHasVJP_correct` is the two-block scalar-LN toy — not the whole net.)
2. **Chapter 4 does not mention `cifar8Bbn_train_step_tiedB`** (`Cifar8BbnStepTieB.lean:79`,
   5c4b5bc9, 2026-10-19): the 38 `*GradB` nodes of the eight `cifar8wb_bbn_*` artifacts, BN over
   `[0,2,3]`, `N` free, `bf16` flag — the first chapter-4 statement at the ResNet chapters'
   BatchNorm (the one the 10-18 fact-check's theme 5 said the chapter lacked). Header says the
   whole-net-VJP half and a loss-gradient theorem are *not* stated. The front table (L385)
   already advertises "BN at batch statistics" for ch 4; the chapter prose has nothing. Side notes:
   `tests/AuditAxioms.lean` does not import it (every other cited tie is imported), and
   `tests/TestCifar8BbnGradCheck.lean:15` still says the tie "is not yet stated".
3. **No block anywhere cites an optimizer lemma.** `rmsPropTf_triple_faithful`
   (`Codegen/StableHLO/Basic.lean:3566`) and `rmsProp_triple_faithful` (`:3540`) are what the MNv2
   and B0 recipes train on; the prose names the optimizer correctly (L8818, L8968). A gloss or a
   block in ch 6's "RMSProp in TensorFlow's form" section.
4. **ViT's graph rung is uncited.** `thm:vit_whole_back` (L13685) is titled "The rendered backward
   is the VJP" but ties the Lean-defined chain `vitInputGradKB`, not a graph; the graph theorem
   `vitNetBackGraph_faithful` (`ViTBackNet.lean:296`, every depth, one example) exists uncited.
   Also `vitForwardKVDrop_ones` (the "at all-ones masks" clause of `thm:vitFwdGraphKMHV_faithful`)
   and `mobilenetv4ForwardBFullDrop_ones` (same clause in `thm:mobilenetv4FullHasVJP`) are not in
   their blocks' `\lean{}`.
5. **Chapter 4's folds are still per-example** while chapters 1–3 got `*FoldB`
   (`cifar_train_step_tied_certified` at one `x : Tensor3`; the artifact is batch 128). And the
   three ch 1–3 fold blocks' `\leandocref` still point at the one-example theorem while their
   `\Prove{}` is the batched one (`lin_train_step_tiedB`, `mlp_train_step_tiedB`,
   `cnn_train_step_tiedB`); `w5B_tied` (W₅ folded to the whole-loss gradient at batch N) is
   unmentioned in `thm:cnn_fold`.

## 3. Medium — hypotheses and glosses that do not match

* `thm:hasGradAt_comp` (L1382): no `\Assume{}`; all three Lean readings take a
  `DifferentiableAt` binder the book omits, and `comp` is pointwise (`vf.backward dy`, not
  `backward x dy` — that is `comp_global`). Plan §7.5, still open.
* `thm:mlp_sgd_descends` (L2657) and `thm:cnn_sgd_descends` (L3682): "the small-step and dominance
  conditions of Theorem linear_sgd_descends" — the constants are the net's own
  (`hsmall : 2·w₂·d₂·w₁·a·D < 1`, Lipschitz `2·d₃·d₂²·w₁²·w₂²·a²/(1−…)`; conv adds `4hw` and the
  locality factor). Also the float rungs for the other layers (`mlp_output_float_sgd_descends`,
  `mlp_hidden_float_sgd_descends`) and the bias rungs (`linear_bias_sgd_descends`,
  `cnn_conv{1,2}_bias_sgd_descends` + their trained witnesses) exist uncited; every descent block
  omits `0 ≤ a, lr, η`.
* `ax:conv2dHasVJP3` (L3375): "the emitter zero-extends the kernel to the next odd size first
  (padOdd)" — the emitter pads asymmetrically; `padOdd` is the proof device of the ConvNeXt ties
  (`EvenKernelConvBack.lean:22-30, 61`).
* `ax:maxPool2HasVJP3` (L3562): "at a tied window it is zero" — pdiv is one `fderiv` of the whole
  map, so a tie in *any* window zeroes the backward in *every* window (theme-4 residual; the ReLU
  block at L2547 says it right).
* `thm:resnet34FullHasVJP` (L5914) Assume 2: `R34SmoothAtB` has per block `hmid` and `hout` (two
  ReLUs each) and no clause on the pooled features ("the head takes no hypothesis",
  `ResNet34FullBVJP.lean:70-87, 465`); the book says "of the pooled features".
* `thm:mobilenetv2FullHasVJP` (L8062) Assume 2 omits the stem and head ReLU6 clauses of
  `MNV2SmoothAtB` (35 sites, the seal's count; "the head is not hypothesis-free", `:415`).
* `thm:resnet34_step_tie` (L6010): α = 0.1 is a binder (`(α B : ℝ)`; `ls0` twins at 0);
  `r34_lossCot_is_smoothedCE_grad` uncited while the R50/MNv2/MNv4 twins cite theirs.
  `thm:resnet50_step_tie` likewise omits `r50_lossCot_is_smoothedCE_grad`; `thm:resnet50_sync_tie`
  omits `r50_net_syncTiedB_smoothedCE` and the `hq : 0 < q` binder.
* `thm:mobilenetv2_step_tie` / `thm:mobilenetv2_sync_tie` (L8198, L8371) name
  `mobilenetv2in_rmsdp64wxdols0eps0001bf16`; the chapter's run (L8968) trains from
  `mobilenetv2in_emarmstfdp64wxdwdoeps0001bf16`. The theorems cover it (generic in the optimizer);
  the example is the wrong artifact. Same drift, lower stakes: `thm:efficientnet_step_tie`'s
  `emarmsdp64dropdowxeps0001bf16` vs the reported `emarmsdp64dropdobf16` / today's
  `emarmstfdp64dropdowneps0001bf16` (L10694); the R34 blocks name `momdp64bf16` while the
  bag-of-tricks rerun is queued on `momdp64wxbf16` (427d8cda, aeafa548 — fix when it lands). The
  Lean file headers carry the same stale run names.
* `ax:depthwiseHasVJP3` (L7946): "every depthwise kernel in this book is 3×3 or 5×5" — ConvNeXt's
  is 7×7.
* Every `_smoothedCE` instance (R34, R50, MNv2, MNv4, B0, ConvNeXt, ViT loss gradients) takes
  `0 < nCls` and target rows summing to one; the glosses say "instantiated at the label-smoothed
  cross-entropy" with no side condition. One clause each.
* `thm:vit_loss_grad` and the ViT ladder: no block says "at either GELU form" though every cited
  theorem carries `gf : GeluForm` (ConvNeXt's `thm:convnext_whole_back` is missing the same
  clause its step tie has). `thm:vit_step_tie`'s proof sentence leans on `vitBlockCotInB_eq_vjp`,
  which takes ε > 0, while the tie itself has none — say "(at ε > 0)" there.
* Ch 9 prose counts (L12427, L12530–12545): "thirty-seven theorems", "sixteen", "twenty-one" —
  actual 40 + 1 definition; 13 + 1; 27. Recap L14654: "ViT-Tiny proved at every depth
  (vitTinyHasVJP_correct)" — that one is depth 12; every-depth is `vitForwardKVHasVJP_correct`.
* `thm:cifar_loss_grad` (L4779): "fourteen gradient nodes" that no two-conv artifact emits (only
  the fused step exists).

## 4. Low (wording; the four slice reports below have the exact lines and fixes)

`ax:pdiv_reindex` "the affine rule's" (it is `reindexCLM`); `thm:elemwiseProductHasVJP` is square
only; `thm:reluHasVJP` is a definition under a `thm:` label; `thm:mlpHasVJPAt` "five times" is four
`vjpCompDiffAt`s over five stages; `thm:cnn_loss_grad` "weights" → "weights and biases";
`thm:vitForwardKVHasVJP` "tower" → "network", three `vjpComp`s over four factors; `ax:pdiv_geluErf`
"four steps" → three; `thm:geluHasVJP` "each by rfl" is `GeluForm.hasVJP_tanh/erf`, uncited;
`def:geluForm` "two files" → three; the seals' `j₀` is an (example, class) coordinate and R50's is
"the same construction", not witness; `layer:inceptionModule` argument names; `layer:pairTile`
"two weights, no bias"; L14848 "Twenty-five Layer constructors exist only for the bestiary" is not
checkable (51 constructors, 13 in neither list); `ax:mhsaHasVJPMat` step 3 inlines
`rowwiseHasVJPMat (denseHasVJP …)`; `ax:rowSoftmax_flat_differentiable` has a case split the Lean
does not; the sublayer proofs are one `preLNResHasVJPMat`.

## 5. Not verified

`thm:vitFwdGraphKMHV_faithful`'s "not tied to this graph by a text check" (whether the printed
batched term in `tests/TestViTFwdBTie.lean` is the den-bearing `vitFwdGraphBDrop`); the final
render name of the R34 bag-of-tricks rerun (queued, not landed).

---

# Slice reports (verbatim)


---

# Fact-check: content.tex lines 738–4197 (ch 1–3), 43 blocks, vs Lean at HEAD (2026-10-21)

Every `\lean{}` name in the slice resolves; every `\texttt{}` identifier in the block bodies exists
(Lean or Mathlib); every count (two/six/ten updates, five/six stages, N = 128, α = 0.1/128, 3×3)
matches. Findings below are drift in hypotheses, glosses and proof descriptions. Themes already
fixed in 5729af20 / fa46f254 (odd kernels, pdiv_of_affine sketches, batched folds, "zero map at a
corner") were checked against the current text and are not re-reported, except one residual.

## Findings

L1382 thm:hasGradAt_comp — [medium]
Book says: "If G has gradient dy at f(x) and f has a VJP at x, then G∘f has gradient backward x dy
at x (HasGradAt.comp). Read at a parameterised op … (HasGradAt.param); at a batched op …
(HasGradAt.param_batchMap)." No `\Assume{}` list.
Lean says: all three take a differentiability hypothesis the book omits —
`HasGradAt.comp … (hf : DifferentiableAt ℝ f x) (vf : HasVJPAt f x)` (ParamGrad.lean:79–81),
`HasGradAt.param … (hl : DifferentiableAt ℝ layer θ)` (:120–121),
`HasGradAt.param_batchMap … (hper : ∀ y, DifferentiableAt ℝ (fun θ' => per θ' y) θ)` (:131–135).
Also `comp` is pointwise: the VJP is `HasVJPAt f x` and the cotangent is `vf.backward dy`, not
`backward x dy` (that spelling is `HasGradAt.comp_global`, :91).
Fix: give the block the template's `\Assume{}` enumerate: (1) G has gradient dy at f(x) [hG];
(2) f is differentiable at x [hf]; (3) a VJP of f at x [vf]; and write the cotangent as the
pointwise backward of dy. Proof sentence: "the chain rule at the composite, then the correctness
field of the VJP and the gradient hypothesis for G" (the Lean rewrites `pdiv_comp`, `vf.correct`,
`hG.pdiv_eq`; "inner factor" in the current text is G, the outer one).

L2657 thm:mlp_sgd_descends — [medium]
Book says: Assume 3 "an η-accurate gradient oracle, and the small-step and dominance conditions of
Theorem linear_sgd_descends [hgh, hsmall, h1, h2]".
Lean says: the conditions have the MLP's own constants, not the linear theorem's.
`mlp_input_sgd_descends` (SgdDescent/Mlp.lean:711–760): `hsmall : 2·w₂·d₂·w₁·a·D < 1` and
`h2 : (2·d₃·d₂²·w₁²·w₂²·a² / (1 − 2·w₂·d₂·w₁·a·D))·D² ≤ lr‖∇L‖₂²/4`, vs the linear
`2aD < 1` and `2a²/(1−2aD)` (SgdDescent/Linear.lean:216–236). Same for
`mlp_hidden_sgd_descends` (:414: `2·w₂·a·D < 1`, `2·d₃·w₂²·a²/(1−2·w₂·a·D)`).
Fix: "the small-step and dominance conditions in the shape of Theorem linear_sgd_descends, with
the Lipschitz constant 2·d₃·d₂²·w₁²·w₂²·a²/(1 − 2·w₂·d₂·w₁·a·D) in place of 2a²/(1−2aD)" — or
say "with constants that carry the layer widths and weight bounds" and leave the formula to the
docstring.

L2657 thm:mlp_sgd_descends — [medium]
Book says: "and with the binary32 gradient in place of g for the weights".
Lean says: `\lean{}` cites only `mlp_input_float_sgd_descends` (Mlp.lean:1394). The other two
weight layers' float rungs exist and are uncited: `mlp_output_float_sgd_descends` (Mlp.lean:819)
and `mlp_hidden_float_sgd_descends` (Mlp.lean:1032). The input float rung also carries two
rounding margins (`hmargin0_round`, `hmargin1_round`) and bounds on every W and b (:1394–1420)
that "its η the rounding budget" does not mention.
Fix: add the two names to `\lean{}`; gloss "for all three weight layers, each with a forward
rounding margin at every ReLU in addition to the step margin".

L2657 thm:mlp_sgd_descends — [low]
Book says: "The same holds at W₁ and at the biases."
Lean says: the cited bias rungs are `mlp_input_bias_sgd_descends` (b₀) and
`mlp_hidden_bias_sgd_descends` (b₁); the output bias is `linear_bias_sgd_descends`
(MlpBias.lean:109), uncited here and in ch 1. Also missing from every descent block's Assume
list: the sign hypotheses `ha : 0 ≤ a`, `hw₁ hw₂ : 0 ≤ w`, `hlr : 0 ≤ lr`, `hη : 0 ≤ η`.
Fix: cite `linear_bias_sgd_descends` (here or at thm:linear_sgd_descends) and add "with the
bounds, rate and η non-negative" to Assume 1 or 3.

L3375 ax:conv2dHasVJP3 — [medium]
Book says: "at an even kernel the reversed-kernel convolution is the adjoint of a convolution
shifted by one pixel, and the emitter zero-extends the kernel to the next odd size first
(padOdd, Chapter layernorm)."
Lean says: the emitter does not use `padOdd`. EvenKernelConvBack.lean:22–30: "The emitter
already pads correctly. The `.convStridedBack` emitter … pads asymmetrically `[[kH-1-pH, pH]]`
… Its `den` is `(flatConvStride2HasVJP W b).backward`, the certified VJP." `padOdd` (:61) is
the proof's device: the `BackwardMaps.lean` spelling `flatConvStride2Back` is correct only at
odd kernels, "so the leaf ties below apply it to `padOdd W` instead." `padOdd` is used only in
EvenKernelConvBack and the three ConvNeXt tie files.
Fix: "… shifted by one pixel; the emitter pads an even kernel asymmetrically, which is the odd
kernel `padOdd W` with symmetric padding, and the ConvNeXt ties are stated through that
zero-extension (Chapter layernorm)."

L3562 ax:maxPool2HasVJP3 — [medium]
Book says: "at a window with a strict maximum the cotangent goes to that cell, and at a tied
window it is zero."
Lean says: `maxPool2HasVJP3` is `HasVJP3.canonical` with `backward := Σ pdiv3 · dy`
(CNN.lean:786–792); `pdiv3` is `pdiv` of the flattened map (Tensor.lean:1123), i.e. one
`fderiv ℝ` of the whole map. A tie at the maximum of ANY window makes that output coordinate,
hence the whole map, non-differentiable, so `fderiv = 0` and the backward is the zero tensor in
every window, strict ones included. The per-window reading holds only when every window is
strict (`maxPool2_codegen_matches_canonical`, conditional on `MaxPool2Smooth`). This is the
theme-4 residual: the ReLU block at L2547 already says "the zero vector in every coordinate".
Fix: "At a point where every window has a strict maximum, each window's cotangent goes to that
cell (maxPool2_codegen_matches_canonical); at a point where any window ties at its maximum the
backward is the zero tensor in every window. The emitted backward routes a tied window to its
first maximal cell."

L3682 thm:cnn_sgd_descends — [medium]
Book says: Assume 4 "the small-step and dominance conditions of Theorem linear_sgd_descends".
Lean says: `cnn_conv2_sgd_descends` (SgdDescent/Cnn.lean:1451–1500):
`hsmall : 2·w₅·d₄·w₄·d₃·w₃·(4hw)·a·D < 1`,
`h2 : (2·nC·(4hw)²·d₃²·d₄²·w₃²·w₄²·w₅²·a² / (1 − …))·D² ≤ …`; conv1 (:2360) adds the
locality factor `c·kH·kW·w₂`. Same drift as the MLP block.
Fix: as for thm:mlp_sgd_descends.

L3682 thm:cnn_sgd_descends — [low]
Book says: "The same holds at the first convolution, and with the binary32 gradient …"
Lean says: the bias rungs `cnn_conv2_bias_sgd_descends` (Cnn.lean:2691) and
`cnn_conv1_bias_sgd_descends` (:3050), and the witnesses
`trained_cnn_conv2_bias_sgd_descends_concrete`, `trained_cnn_conv1{,_bias}_sgd_descends_concrete`
(Trained/CnnDescent.lean, Trained/CnnDescentConv1.lean; commit 90cdc235) exist and are uncited.
The witness cited goes through `cnn_conv2_exact_sgd_descends` (Cnn.lean:1582, η = 0), at
c = 2, h = w = 6, d₃ = d₄ = 8 ("reduced-width" is right). Sign hypotheses as above.
Fix: "The same holds at the first convolution and at both convolutions' biases"; cite the bias
rungs and the conv1 witness.

L1657 thm:linear_fold — [low]
Book says: proof — "the weight half is Theorem denseWeightGrad_correct composed with Theorem
softmaxCE_grad by the chain rule, the bias half Theorem denseBiasGrad_correct likewise; see
poc_train_step_tail_certified".
Lean says: weight half: `lossWeightGrad_eq_sum` (SmoothedLossCot.lean:266) is `pdiv_comp` +
`softmaxCE_grad` ✓. Bias half (`linBiasDen_is_certified`, LinearTrainStep.lean:122) is the
bias Jacobian contracted with softmax − onehot, no composition — "likewise" overstates. The
batched statement the `\Prove{}` makes is `weightSgdB_tied` / `biasSgdB_tied` /
`lin_train_step_tiedB` (LinearFoldB.lean:120–174), by `denseWeightSgdB_den_slices` +
`dense_jacW_collapse`; the `\leandocref` points at the single-example theorem. The mean-loss
clause needs `hN : 0 < N` (:176), unstated.
Fix: "the bias half is Theorem denseBiasGrad_correct at that cotangent"; `\leandocref` →
`Proofs.LinFoldB.lin_train_step_tiedB`; "for every N ≥ 1". Optionally cite
`weightSgdB_tied`, `biasSgdB_tied`.

L1726 thm:linear_sgd_descends — [low]
Book says: "The same holds with the binary32 gradient in place of g, its η the rounding budget."
Lean says: `linear_float_sgd_descends` (Linear.lean:332) adds `heexp0 heexp1 hfexp hρ1 hδ hδ0`
(exp accuracy and logit drift of the float forward). Sign hypotheses `ha hlr hη` missing from
the Assume list. `linear_bias_sgd_descends` (MlpBias.lean:109) is the uncited bias rung.
Fix: one clause "under the float forward's exp-accuracy and logit-drift bounds"; add the
non-negativity; cite the bias rung.

L1051 ax:pdiv_reindex — [low]
Book says: "the proof is the affine rule's (Theorem pdiv_of_affine)".
Lean says: `pdiv_reindex` (Tensor.lean:132) rewrites to `reindexCLM σ` and
`ContinuousLinearMap.fderiv` directly; it does not call `pdiv_of_affine` (same idea, different
lemma).
Fix: "the same argument as the affine rule's: the gather is a continuous linear map
(reindexCLM), so it is its own derivative".

L1257 thm:elemwiseProductHasVJP — [low]
Book says: f, g unrestricted (same letters as thm:biPathHasVJP, `Vect{m} → Vect{n}`).
Lean says: `elemwiseProductHasVJP {n} (f g : Vec n → Vec n)` (Tensor.lean:429) — square only.
Fix: "f, g : Vect{n} → Vect{n}".

L2547 thm:reluHasVJP — [low]
Label prefix `thm:` on a `\begin{definition}` block (the MLP one is `ax:mlpHasVJP`, the pool
one `ax:maxPool2HasVJP3`). Content matches `reluHasVJP := HasVJP.canonical _` (MLP.lean:224) and
`relu_codegen_matches_canonical` (:235).
Fix: rename label or leave (cosmetic; check `\ref`s).

L2562 ax:mlpHasVJP — [low]
Book says: "The composed per-layer backward of Theorem mlpHasVJPAt agrees with it at smooth
inputs."
Lean says: true, but by no named declaration — it is `HasVJPAt.backward_unique`
(Tensor.lean:479) applied to `mlpHasVJPAt` and `(mlpHasVJP …).toHasVJPAt x`.
Fix: "(any two pointwise witnesses have the same backward)" or cite
`Proofs.HasVJPAt.backward_unique`.

L2572 thm:mlpHasVJPAt — [low]
Book says: proof "Chain rule at a point, five times".
Lean says: four `vjpCompDiffAt` applications over five stages (MLP.lean:334–356).
Fix: "Chain rule at a point across the five stages".

L2602 thm:mlp_fold — [low]
Proof `\leandocref` points at `mlp_train_step_tied_certified` (one example) while the
`\Prove{}` is the batched `mlp_train_step_tiedB` (MlpFoldB.lean:266); its six components are
`w2B_tied, b2B_tied, w1B_tied, b1B_tied, w0B_tied, b0B_tied` (renamed a5837400).
Fix: `\leandocref{Proofs.MlpFoldB.mlp\_train\_step\_tiedB}`.

L3606 thm:cnn_fold — [low]
Same `\leandocref` drift (→ `Proofs.CnnFoldB.cnn\_train\_step\_tiedB`). Newer fact not
mentioned: `w5B_tied` (CnnFoldB.lean:318) folds the output weight to the whole-loss gradient
`W₅ − α Σₖ ∂L_k/∂W₅` at batch N, as the MLP block states for W₂.
Fix: add the W₅ clause and cite `w5B_tied`.

L3641 thm:cnn_loss_grad — [low]
Book says: twins are "cells equal at every value of both convolutions' weights".
Lean says: `CnnPoolTwin` quantifies over `W₁ b₁ W₂ b₂` and the channel (CnnParamGrad.lean:58–61)
— weights and biases.
Fix: "at every value of both convolutions' weights and biases".

Scope note (theme 10, already recorded): thm:linear_loss_grad, thm:mlp_loss_grad,
thm:cnn_loss_grad, and all three SGD blocks are one-example statements (`den` per example;
"Scope. One example" in LinearParamGrad/MlpParamGrad/CnnParamGrad headers and the descent
docstrings), and the descent blocks move one parameter with the rest fixed. None of the six
says so.

## Checked and fine

ax:pdiv (L886) · ax:pdiv_comp (L897; `fderiv_comp`, `LinearMap.pi_apply_eq_sum_univ`,
`Finset.sum_apply` all in the proof) · ax:pdiv_add (L947) · ax:pdiv_mul (L981; `fderiv_mul`,
`Pi.normedAlgebra` is Mathlib `Analysis/Normed/Module/Basic`, closes with `ring`) ·
ax:pdiv_id (L1024) · ax:pdiv_const (L1037) · thm:pdiv_finset_sum (L1072; `fderiv_fun_sum`) ·
thm:pdiv_of_affine (L1107; hadd/hsmul match; `LinearMap.continuous_on_pi`, `fderiv_add_const`,
`ContinuousLinearMap.fderiv`; the "every linear layer goes through it" list is backed —
MLP.lean dense ×3, CNN.lean conv ×3, Depthwise.lean, TokenParamGrad.lean patch embed,
BatchNorm.lean:459/507 affine and centered, Attention.lean matmul) · def:hasvjp (L1153;
`HasVJP.canonical`) · thm:vjpComp (L1173; hf hg hf_diff hg_diff; proof via `vjpCompAt`,
`Finset.mul_sum`, `Finset.sum_comm`) · thm:biPathHasVJP (L1219; `Finset.sum_add_distrib`,
`ring`) · thm:identityHasVJP (L1300) · def:hasgradat (L1369; matches the structure's two
fields) · ax:pdiv_dense (L1413; `pdiv_of_affine`, no hypotheses) · ax:pdiv_dense_W (L1448;
binders and `finProdFinEquiv` indexing match) · thm:denseHasVJP (L1490; `Mat.mulVec W dy`) ·
thm:denseWeightGrad_correct (L1517) · thm:denseBiasGrad_correct (L1545; `pdiv_dense_b` via
`pdiv_of_affine (fun w => w)`) · ax:softmaxCE_grad (L1599; `pdiv_eq_fderiv_coord`,
`HasFDerivAt.log` with `softmax_pos`, `pdiv_softmax`, `oneHot_apply`, `field_simp` — all five
steps as described) · thm:linear_loss_grad (L1700; `hL : HasGradAt L (mnistLinear W b x) g`,
`LinNetLossTied` = both nodes, `_CE` instantiation, `denseW/B_hasGradAt` via `HasGradAt.param`) ·
ax:pdiv_relu (L2499; `h_smooth : ∀ k, x k ≠ 0`, `reluLinearPart`, `Filter.eventually_all`,
`HasFDerivAt.congr_of_eventuallyEq`) · thm:mlp_loss_grad (L2630; h₀ h₁ hL; six `HasGradAt`
conjuncts at `mlpCotOut1`/`mlpCotOut0`/g; `hasGradAt_relu`, `hasGradAt_dense`) · ax:conv2d
(L3344) · def:hasvjp3 (L3353; `pdiv3` and `HasVJP3.correct` as written) · ax:conv2dWeightGradHasVJP
(L3454; `Vec (oc*ic*kH*kW)`, backward formula, `Kernel4.flatten`, `sum_finProdFinEquiv₃`) ·
ax:conv2dBiasGradHasVJP (L3518; `Finset.sum_ite_eq'`) · ax:maxPool2 (L3555) ·
thm:mnistCnnNoBnHasVJPAt (L3578; h1 h2 h3 h4 as "no coordinate … is zero", `h_mp :
MaxPool2Smooth`, six stages, five `vjpCompAt`) · thm:cnn_fold body (L3606; ten nodes in the
stated order, `dhc2B_slice` unconditional, `dhc1B_slice` with hkH hkW, N = 128 and 3×3 from
`tests/TestSmallNetsBatchedEmit.lean:159–163`) · thm:cnn_loss_grad body (L3641; hkH hkW,
`CnnLossSmoothAt` = z1 z2 pool-up-to-twins sel z3 z4 with "dead" = all cells ≤ 0
(`WindowSmoothUpTo`, WindowMax.lean:171–179), `cnnChainCotW2_eq_sel`,
`cnnPoolTwin_of_convPatchEq2`, germ via `HasGradAt.congr_of_eventuallyEq`; gloss "the chain is
Theorem cnn_fold's … ties included" backed) · thm:cnn_sgd_descends body (L3682; hx hW₃ hW₄ hW₅
hm2 hm3 hm4 `hmq : MaxPool2MarginQUpTo … T` + `hT : T p q → ConvPatchEq`, conv1 via
`ConvPatchEq2`, float rung's `MaxPool2MarginQ` is strict as stated, witness shape
c=2/h=w=6/d=8).

---

# Fact-check: content.tex 4198–9575 (ch 4 CIFAR+BN, ch 5 ResNet, ch 6 MobileNet) against LeanMlir at HEAD (2026-10-21)

43 blocks read; all 95 `\lean{}` names resolve to a declaration. Findings first, then the clean list.

## Findings

### Chapter 4 — CIFAR with BatchNorm

**L4852 / L4875 `thm:cifar8bn_step_tie`, `thm:cifar8_step_tieG` — [medium] the batch-statistics tie is missing from the chapter.**
- Book says: the eight-conv BN step is tied (fused, 38 updates) and the packed `cifar8w_bn_*` gradient nodes are tied; chapter 4 prose never mentions `bbn` / `cifar8wb` (only the appendix, L20089). The theorem-budget row L385 already advertises "BN at batch statistics" for chapter 4.
- Lean says: `Proofs.Cifar8BbnTieB.cifar8Bbn_train_step_tiedB` (LeanMlir/Proofs/Nets/Small/Cifar8BbnStepTieB.lean:79, commit 5c4b5bc9 2026-10-19, in the lakefile at :245): all 38 `*GradB` nodes of `cifar8wb_bbn_{sgd,mom,adam,bf16sgd,bf16mom,bf16adam}_train_step.mlir` (eight artifacts in verified_mlir/) denote the certified batched Σ_n gradient at the render's own chain, `N` a binder, `bf16` a flag, BN reducing over `[0,2,3]`, loss cotangent the plain mean softmax-CE at a general target (no label smoothing). Explicitly NOT stated (file header): that this chain is the certified whole-net backward (no `_eq_vjp` half) and no loss-gradient theorem.
- Fix: it belongs on rung (iii) — it is the first chapter-4 statement at the BatchNorm the ResNet chapters use (closes the 2026-10-18 theme-5 gap "chapter 4 BN is per-image"). Add a block after `thm:cifar8_step_tieG` ("The batch-statistics step's gradient nodes are the certified batch gradients", `\lean{Proofs.Cifar8BbnTieB.cifar8Bbn_train_step_tiedB}`, Prove: 38 nodes at batch N, bf16 flag; one gloss: "the chain's identity with the whole-net VJP is not stated"), and update the lead-in at L4749–4754.

**L4759 `thm:cifar_fold` (and L4831, L4852, L4875, L4779, L4897) — [low] per-example scope not stated.**
- Book says: "all fourteen parameter updates `cifar_train_step.mlir` emits … denote the certified step"; no batch qualifier.
- Lean says: `cifar_train_step_tied_certified` (CifarFold.lean:189) takes one `x : Tensor3 ic …`; `den` is per-example (Cifar8ParamGrad.lean header: "Scope. One example (the emitted module batch-contracts; den is per-example)"). The artifact is batched: `verified_mlir/cifar_train_step.mlir` opens with `tensor<128x3072xf32>`. Chapters 1–3 got batched ties (`CnnFoldB`, `MlpFoldB`, `LinearFoldB`, commit 0da70269); chapter 4 has none.
- Fix: one clause in `thm:cifar_fold` ("per example; the emitted module batch-contracts") carried by reference in the cifar8 blocks — or a `CifarFoldB`.

**L4779 `thm:cifar_loss_grad` — [low] "fourteen gradient nodes" that no committed two-conv artifact emits.**
- Book says: "each of the fourteen gradient nodes … is ∂L/∂θ".
- Lean says: `CifarNetLossTied` (CifarParamGrad.lean:~140–175) states `den (SHlo.weightGrad …)` / `SHlo.convWeightGrad …` ops. verified_mlir/ holds only `cifar_fwd.mlir` and `cifar_train_step.mlir` (fused SGD; `grep -c 'weight_grad\|convWeightGrad'` = 0). The cifar8 variants do have packed `*Grad` renders; the two-conv net does not.
- Fix: "the fourteen certified gradients the fused updates of Theorem~\ref{thm:cifar_fold} subtract" (or say the nodes are the un-fused form of those updates).

### Chapter 5 — ResNet-34 / ResNet-50

**L5914 `thm:resnet34FullHasVJP`, Assume 2 — [medium] the ReLU clause is misdescribed.**
- Book says: "no ReLU pre-activation of the stem, of any residual block or of the pooled features is zero, and every stem-pool window is entirely zero or has one maximal cell [R34SmoothAtB]".
- Lean says: `R34SmoothAtB` (ResNet34FullBVJP.lean:279–300) = `stem : R34StemSmoothAt` (one clause), `pool : StemPoolSmoothAt` (= `MaxPool3s2SmoothOrDead` per example: unique maximum or every cell ≤ 0, MaxPool3s2.lean), and per block `R34IdSmoothAt`/`R34DownSmoothAt` with TWO fields `hmid` (the body's mid ReLU) and `hout` (the post-residual-add ReLU) (:70–87). There is no ReLU on the pooled features; the docstring at :465 says "The head takes no hypothesis at all". 32 + 1 relu clauses, as the seal file header counts.
- Fix: "the stem's ReLU and both ReLUs of each of the sixteen blocks — the body's mid ReLU and the one after the residual add — are off their corners, and every stem-pool window is entirely ≤ 0 or has one maximal cell".

**L6010 `thm:resnet34_step_tie` — [medium] "α_ls = 0.1" is a binder; the smoothed-CE identification is uncited.**
- Book says: "at the chain cotangent of the label-smoothed cross-entropy (α_ls = 0.1, any target)".
- Lean says: `r34_net_tiedB` (ResNet34StepTieB.lean:437–439) takes `(α B : ℝ)` and `t : Vec (N * (1 * nCls))`; the file header says the renders bake α at 0.1 "and the `ls0` variants at 0". The cotangent in the statement is `den (smoothedLossCotGraph …)`; that it is the smoothed CE's gradient is `r34_lossCot_is_smoothedCE_grad` (ResNet34StepTieB.lean:510), which this block does not list while `thm:mobilenetv2_step_tie`, `thm:mobilenetv4_step_tie` and `thm:resnet50_step_tie` list theirs.
- Fix: "(any α — 0.1 in the renders, 0 in the `ls0` twins — and any target)"; add `Proofs.ResNet34TieB.r34_lossCot_is_smoothedCE_grad` to `\lean{}`.

**L6010 / L6179 `thm:resnet34_step_tie`, `thm:resnet34_sync_tie` — [low, pending] render names vs the bag-of-tricks rerun.**
- Book says: the renders are `resnet34in_momdp64` / `resnet34in_momdp64bf16`; L6955 says `momdp64bf16` "for the run below".
- Lean/repo says: commit 427d8cda (2026-10-19) adds `verified_mlir/resnet34in_momdp64wxbf16_train_step.mlir` (no bias decay, zero-γ, BN decay 0.9) and aeafa548 queues the rerun on it. The tie still covers it (`wx`, zero-γ init and BN decay are the optimizer / init / running-stat stage, outside the gradient nodes; `ResNet34RenderB` emits the same chain), so no statement is wrong today, but once the rerun lands the scope sentences and L6955 name the superseded render. The Lean docstrings (StepTieB/ParamGrad/SyncStepTieB headers) also still say the book's run is `resnet34in_momdp64bf16`.
- Fix: when the rerun is reported, "…and the `wx` twin `resnet34in_momdp64wxbf16`".

**L6041 `thm:resnet34_loss_grad` (also L6107, L8233, L8298, and the step-tie glosses) — [low] the smoothed-CE instantiation carries two unlisted hypotheses.**
- Book says: "Instantiated at the batched label-smoothed cross-entropy".
- Lean says: `r34_net_lossGrad_smoothedCE` (ResNet34ParamGrad.lean:1028) needs `hK : 0 < nCls` and `ht : ∀ n, ∑ k, targetRow N nCls t n k = 1`; same in `r50_net_lossGrad_smoothedCE` (:820), `mnv2_net_lossGrad_smoothedCE` (:839), `mnv4_net_lossGrad_smoothedCE` (:1360). The BCE corollary (`r50_net_lossGrad_bce`, :835) takes no target hypothesis — the R50 block could say so.
- Fix: "…cross-entropy, for targets that sum to one".

**L6081 `thm:resnet50_step_tie` — [low] `\lean{}` lists `r50_lossCot_is_bce_grad` but not `Proofs.ResNet50TieB.r50_lossCot_is_smoothedCE_grad` (ResNet50StepTieB.lean, just above :615), though the text instantiates at both losses.**

**L6210 `thm:resnet50_sync_tie` — [low] `\lean{}` lists `r50_net_syncTiedB_bce` but not `Proofs.ResNet50SyncTieB.r50_net_syncTiedB_smoothedCE` (ResNet50SyncStepTieB.lean:1009); the Lean also takes `hq : 0 < q`, which "the same for ResNet-50" inherits silently from a block that has no q.**

**L6141 / L6162 `thm:resnet34_seal`, `thm:resnet50_seal` — [low] wording.**
- "there is a class j₀ and a pixel i₀": `j₀ : Fin (2 * nCls)` is an (example, class) output coordinate (ResNet34FullBSeal.lean:827); `0 < nCls` is a hypothesis (`hn`). "the same witness for ResNet-50": `R50FullBSeal.sealW` is a different witness (five carrier BatchNorms, a stride-1 projection; the `q ≤ 7` bound is the β = 160 margin, header :20–40) — "the same construction".

**L5898–5910 ladder paragraph — [low]** "(i), (ii) and (iv) take the smooth-point hypotheses — … every pool tie": (iv) takes the twin-tolerant pool clause (`StemPoolTwinAt`), not "every pool tie"; (ii) takes only the stem/head clauses plus opaque block witnesses. The per-block statements say this correctly; the summary is a shade too strong.

### Chapter 6 — MobileNetV2 / V4

**L7930 `ax:depthwiseHasVJP3` — [medium] "every depthwise kernel in this book is 3×3 or 5×5" is false.**
- Lean/book say: ConvNeXt's block depthwise is 7×7 (`DepthwiseKernel c 7 7`, LeanMlir/Proofs/Nets/ConvNeXt/ConvNeXtStepTie.lean:92, :143, :310; book L10959 "depthwise 7×7 instead of 3×3", L11006). The claim matters because it is the odd-kernel hypothesis of `depthwiseFlatBack_eq_vjp_backward` (DepthwiseBackCertifiedTie.lean:50, `hkH hkW`).
- Fix: "every depthwise kernel in this book is odd — 3×3, 5×5 or 7×7".

**L8062 `thm:mobilenetv2FullHasVJP`, Assume 2 — [medium-low] the stem's and head's ReLU6 clauses are omitted.**
- Book says: "every ReLU6 is off both its corners — an expand clause and a depthwise clause per block, none after the residual add [MNV2SmoothAtB]".
- Lean says: `MNV2SmoothAtB` (MobileNetV2FullBVJP.lean:322–342) has `stem : MNV2StemSmoothAtB`, `head : MNV2HeadSmoothAtB` and `b1 : IVNoExpSmoothAtB` (depthwise clause only, the t = 1 block); 16 × 2 + 1 + 1 + 1 = 35 sites (the count the seal block at L8331 uses). The docstring at :415 stresses "Unlike r34's, the head is not hypothesis-free".
- Fix: "every ReLU6 — the stem's, the expand and depthwise ones in each block (the first block has no expand), the head's — is off both its corners; none sits after a residual add".

**L8198 / L8371 `thm:mobilenetv2_step_tie`, `thm:mobilenetv2_sync_tie` — [medium] the named `do` render is not the one the chapter trains.**
- Book says: "the `do` renders' — `mobilenetv2in_rmsdp64wxdols0eps0001bf16` among them" (L8219); sync tie: "`mobilenetv2in_rmsdp64`, its bf16 twin and their `do` renders" (L8385). The chapter's run (L8968–8975) trains from `mobilenetv2in_emarmstfdp64wxdwdoeps0001bf16` (TF-1 RMSProp `rmstf`, `wx`+`dw`, `do`, label smoothing 0.1, bf16; the 2026-10-12 recipe, `MobileNetV2RenderB.lean:1419–1429`).
- Lean says: `mnv2_net_tiedB` (MobileNetV2StepTieB.lean:826) and `mnv2_net_syncTiedB` (:968) are generic in the optimizer (RMSProp/EMA/decay sit after the gradient nodes), take `cd : Option` for the dropout site, `bf16`, and α as a binder, so they DO cover the new render — but the block's example is a superseded artifact. The Lean headers (StepTieB, ParamGrad, SyncStepTieB) also still say "the book's ImageNet run trains from `mobilenetv2in_rmsdp64wxdols0eps0001bf16`" (stale docstrings, side note).
- Fix: name `mobilenetv2in_emarmstfdp64wxdwdoeps0001bf16` in both blocks (and L8968's list is the authority).

**Chapter 6 optimizer-step theorem — [medium, gap]** There is none: no block in the slice (or in the book — no `\lean{}` anywhere cites an optimizer lemma) states the RMSProp step. `rmsPropTf_triple_faithful` (LeanMlir/Proofs/Codegen/StableHLO/Basic.lean:3566: `sgdParamF` at lr = 1 applied to the `rmsBufNextTfF` output, mean-square `adamVNextF` at β₂ := ρ, equals `rmsPropTfStep`) and `rmsProp_triple_faithful` (:3540) are uncited. The prose does call the trained optimizer the right thing — "TF 1's RMSProp, with the learning rate folded into the momentum buffer and the mean-square started at 1" (L8818), "TF~1's RMSProp (`rmstf`) … the rate inside the momentum term" (L8968) — matching `rmsBufNextTf`. Fix: a block "The rendered RMSProp step is the TF-1 RMSProp step" citing `Proofs.StableHLO.rmsPropTf_triple_faithful` (and the Imagenette `rms` render's `rmsProp_triple_faithful`), or one gloss sentence on `thm:mobilenetv2_step_tie`.

**L8270 `thm:mobilenetv4_step_tie` (and L8298, L8353, L8403) — [low, disclosed]** The blocks name `mnv4in_adamdp64`; the chapter's reported run (L9398) is `mnv4in256_accdp8x128wxdropdowd01bf16` at 256² with drop-path and dropout. `mnv4_net_tiedB` is at the literal `3 * 224 * 224` with "no resolution binder q" (MobileNetV4StepTieB.lean:969 docstring) and drop/do are "outside this statement" (MobileNetV4ParamGrad.lean header); only `mnv4InputGradB_eq_mnv4B_full_vjp` is generic in the feature side `f`. L9398–9410 already discloses this for the sync tie. No block claim is wrong; the step-tie block could carry the same one-clause caveat.

**L8093 `thm:mobilenetv4FullHasVJP` — [low]** the gloss "at all-ones masks it is this forward" is `mobilenetv4ForwardBFullDrop_ones` (MobileNetV4FullBDrop.lean:190), not in `\lean{}`; add it.

## Checked and fine

Statement, hypotheses, counts and proof description match the cited Lean (file:line of the main declaration):

- `ax:pdiv_bnAffine` (BatchNorm.lean:455; `pdiv_of_affine`, `mul_add`), `ax:pdiv_bnCentered` (:504; `pdiv_of_linear`, `Finset.sum_add_distrib`, `Finset.mul_sum`, `Finset.sum_ite_eq'`), `ax:bnIstdBroadcast_differentiable` (:522; `hε : 0 < ε`, `fun_prop`, `.sqrt`, `.inv`), `ax:pdiv_bnIstdBroadcast` (:599; `pdiv_eq_fderiv_coord`, `bnVar_hasFDerivAt`, `HasFDerivAt.sqrt`, `hasDerivAt_inv`, `bnVarDeriv_basisVec`), `thm:bnNormalizeHasVJP` (:670; via `pdiv_bnNormalize`, `bnXhat_eq_product`, `pdiv_mul`), `thm:bnAffineHasVJP` (:660), `thm:bnHasVJP` (:720; `bnForward_eq_compose`, `vjpComp`).
- `thm:cifar_bn_fold` (SgdNodes.lean:131, `BnSgdPairTied` at any `oc h w`, any cotangent), `thm:cifar8_step_tie` (Cifar8StepTie.lean:56; 22 = 8×2 + 3×2, `cifarCnn8Forward`, chain head-first then stages; the docstring's "no trainer runs cifar8_train_step.mlir" is consistent with the lead-in), `thm:cifar8_loss_grad` (Cifar8ParamGrad.lean:273, Cifar8BnParamGrad.lean:578; `hkH hkW`, `hq : Cifar8BnPos`, `hx : Cifar8(Bn)LossSmoothAt` with four twin relations and four selections, `hL`; `_CE` corollaries at :579 / :1230), `thm:cifar8_sgd_descends` (SgdDescent/Cifar.lean:108, `cifarCnn8Forward_factor` :69 is `rfl`; the listed binders exist, "the bounds" covers `ha hx hW₉ hWa hWb hlr hη`).
- `thm:residualHasVJP` (Residual.lean:71; `hf_diff`, `hf`, `biPathHasVJP` at `id`), `thm:resnet50FullHasVJP` (ResNet50FullBVJP.lean:423/434; `R50PosB`, `R50SmoothAtB`, side `32q`), `thm:resnet50_whole_back` (ResNet50WholeBackCertifiedTieB.lean:69/153/233; `hεs h_stem h_pool`, `hb1…hb16 : HasVJPDiffAt` at `opaqueA*`, proof = `unfold`, two `rw`, `rfl`; `r34BFullHasVJPAt` at ResNet34BackCertifiedTieB.lean:123), `thm:resnet34_step_tie`'s 110 = stem 3 + 13×6 + 3×9 + 2 (146 slots at `convBias := true`) and its bf16 claim (`ConvWTiedBAt bf16`, `Bf16Erasure`), `thm:resnet34_loss_grad`'s Assume/Prove (ResNet34ParamGrad.lean:938; `R34LossSmoothAtB` :814 = `StemPoolTwinAt` at `StemConvTwin`; `_stemSelect` :1047 for any `IsMaxPool3s2SelectB`; `r34LossSmoothAtB_of_smoothAtB` :837), `thm:resnet50_step_tie`'s 161 = stem 3 + 12×9 + 4×12 + 2 with `g` a binder (ResNet50StepTieB.lean:527), `thm:resnet50_loss_grad` (ResNet50ParamGrad.lean:691; `R50LossSmoothAtB` :674; `_bce` :835 divisor `N·K`), `thm:resnet34_sync_tie` (ResNet34SyncStepTieB.lean:641/698; `hR hN hgs`, 110 nodes, `B` vs `R·B`, four-step proof as described), `thm:resnet50_sync_tie`'s BCE divisors `N·K` / `(R·N)·K` (ResNet50SyncStepTieB.lean:1028), both seals' "batch 2", "sealW/sealX", `0 < q ≤ 7` (ResNet34FullBSeal.lean:827, ResNet50FullBSeal.lean:934).
- `ax:depthwiseConv2d` (Depthwise.lean:77), `ax:depthwiseWeightGradHasVJP3` (:342), `ax:depthwiseBiasGradHasVJP` (:433); `ax:depthwiseHasVJP3`'s formula and "no hypotheses" (:139) — only the kernel-size sentence is wrong (above).
- `thm:mobilenetv4FullHasVJP` (MobileNetV4FullBVJP.lean:165/180; `Mnv4SmoothAt` only, ε in the weights; `mnv4FwdGraphBFullDrop_faithful` FullBDrop.lean:337 at every `sd`, `m`, `bf16`; 18 skip rows), `thm:mobilenetv2_whole_back` (MobileNetV2WholeBackCertifiedTieB.lean:264/365/466; `hεs hεh h_stem h_head`, `hb1…hb17`), `thm:mobilenetv4_whole_back` (MobileNetV4WholeBackCertifiedTieB.lean:426/552/738; `f` binder for the feature side, `hεs hεh1 hεh h_stem h_h1 h_h2 hfused hb1…hb21`, shape check at 224), `thm:mobilenetv2_step_tie`'s 158 = stem 3 + b1 6 + 16×9 + head 3 + dense 2 and the `cd : Option` dropout site (MobileNetV2StepTieB.lean:826; `mobilenetv2ForwardBFullDoOpt` :466 with `_none`/`_some` by `rfl`), `thm:mobilenetv2_loss_grad` (MobileNetV2ParamGrad.lean:744; `MNV2PosB`, `MNV2SmoothAtB`, loss at `mobilenetv2ForwardBFullDoOpt`), `thm:mobilenetv4_step_tie`'s 233 = stem 3 + fused 6 + 13×12 + 4×9 + 4×6 + head 8, `g` a binder, `N`/`nCls` binders (MobileNetV4StepTieB.lean:969), `thm:mobilenetv4_loss_grad` (MobileNetV4ParamGrad.lean:1171), `thm:mobilenetv2_seal` (35 weight-only clauses, MobileNetV2FullBSeal.lean header, :1044), `thm:mobilenetv4_seal` (38 clauses via `#guard`, `sealX t = t • rayV`, MobileNetV4FullBSeal.lean:967), `thm:mobilenetv2_sync_tie` (MobileNetV2SyncStepTieB.lean:968/1065; global mask `cd`, shards per replica), `thm:mobilenetv4_sync_tie` (MobileNetV4SyncStepTieB.lean:1326/1459).

Not verified: whether `cifar8Bbn_train_step_tiedB` is pinned in AuditAxioms (grep found it only in the lakefile, Types.lean and its own files); the bag-of-tricks rerun's final render name (queued, not landed).

---

# Fact-check: ch 7 (EfficientNet), ch 8 (ConvNeXt), Bestiary `Layer.*` definitions

Repo at HEAD of main (2026-10-21). Book `blueprint/src/content.tex`, slices 9576–12402 and 14691–19219.
Every `\lean{}` name in the slice resolves to a declaration (checked with a regex over `LeanMlir/`, `Bestiary/`).
Report only; nothing edited.

## Findings

### L9879 `thm:efficientnet_step_tie` — [high] missing hypothesis
- Book says: the block has no `\Assume{}` at all.
- Lean says: `Proofs.EnetTieG.efficientnet_net_tiedG (…) (w : B0Weights nCls) (hεw : w.EpsPos) (bf16 : Bool) (sd …) (cd …) …` — `LeanMlir/Proofs/Nets/EfficientNet/EfficientNetStepTieG.lean:449-450`. `B0Weights.EpsPos` is all 49 BatchNorm ε > 0 (`EfficientNetFullB0.lean:133-151`). The hypothesis is load-bearing: every chain cotangent `dy16 … dy0` is a `HasVJP` witness's `.backward` (`mbResidDropWHasVJP … hεw.b15.e hεw.b15.d hεw.b15.p`, lines 476-493), and each conjunct passes `hεw.*` to the per-block tie. (ConvNeXt's `cnx_net_tiedGB` genuinely takes no positivity — `ConvNeXtStepTieGB.lean:499-502` has `(ε α B : ℝ)` and no `hε` — so the ConvNeXt block's missing `\Assume{}` is correct; the EfficientNet one is not.)
- Fix: add `\Assume{}` with one item, "every BatchNorm's ε > 0, forty-nine of them \hfill[\texttt{hεw}]", as the neighbouring blocks have.

### L11398–11403 (lead-in) / chapter 8 — [medium] missing ladder rung (i): whole-net VJP + graph faithfulness
- Book says: "Three rungs of the ladder for ConvNeXt-T: the rendered backward is the VJP, with the whole-net VJP folded into it; the emitted step is the certified step; each node is the loss's derivative." Chapters 5, 6, 7 (`thm:efficientnetFullHasVJP`) and 9 each have a "whole net at batch N has the VJP / the graph denotes the forward" block; chapter 8 has none.
- Lean says: both halves exist and are not cited anywhere in the book (underscore-unescaped grep of content.tex finds none of these names):
  - `Proofs.convNextForwardTChHasVJP_correct` — `LeanMlir/Proofs/Nets/ConvNeXt/ConvNeXtFullT.lean:397-404`: under the 23 LN positivities (`hsε h1 hd1 h2 hd2 h3 hd3 h4 hhε`), `(convNextForwardTChHasVJP gf w …).backward x dy i = ∑ j, pdiv (convNextForwardTCh gf w) x i j * dy j`, at a variable `gf : GeluForm`, per example (`x : Vec (3*224*224)`).
  - `Proofs.StableHLO.convNextFwdGraphTCh_faithful` — `ConvNeXtFullT.lean:552-554`: `den (convNextFwdGraphTCh gf epsStr w x) = convNextForwardTCh gf w x`, no hypothesis, per example.
  - `Proofs.convnextVerified_fwd_faithful` — `LeanMlir/Proofs/SpecVJP.lean:413-418`: the same at the committed `convnextVerified` spec (nC = 10).
  - Also `Proofs.convnextHasVJP_correct` (`ConvNeXt.lean:303`) — the two-block scalar-LN toy net; not the T net, do not cite as the whole net.
  Scope caveat a new block must carry: the ConvNeXt graph tie is the per-example f32 graph; `ConvNeXtStepTieGB.lean:31-33` says the batched chain the bf16 artifacts render from "has no typed graph at either precision". `convnextInputGradB_correct`'s docstring (`ConvNeXtWholeBackCertifiedTieB.lean:478-481`) itself points at `convNextFwdGraphTCh_faithful` as the graph it is about.
- Fix: add a block "ConvNeXt-T: VJP and graph" before `thm:convnext_whole_back` citing the three names above; Assume the 23 ε's (VJP only — the faithfulness takes none); Prove: per example, either GELU form, drop-free, f32 render; and change the lead-in to four rungs.

### L9879 `thm:efficientnet_step_tie`, L9945 `thm:efficientnet_sync_tie` — [low] the exemplar artifact is neither the reported run nor today's render
- Book says: "`efficientnetin_emarmsdp64dropdowxeps0001bf16` among them" (L9899, L9965).
- Lean/repo says: the artifact exists (`verified_mlir/efficientnetin_emarmsdp64dropdowxeps0001bf16_train_step.mlir`) and the Lean docstrings (StepTieG, SyncStepTieG, ParamGrad headers) still call it "the book's run". But the chapter's own results text says the verified column is the `emarmsdp64dropdobf16` render "of the time" and today's `enet-default-4gpu` runs `emarmstfdp64dropdowneps0001bf16` (L10694-10697; commit 087ff789, 2026-10-19). "Among them" remains true.
- Fix: name the reported render (`emarmsdp64dropdobf16`) or the current one (`emarmstfdp64dropdowneps0001bf16`), and the Lean docstrings when next touched.

### L9879 `thm:efficientnet_step_tie` — [low] "213 emitted parameter gradients" vs the tie's 262 nodes
- Book says: "each of the 213 emitted parameter gradients".
- Lean says: the tie's 18 conjuncts carry 262 nodes — the 213 tensors plus 49 conv-bias nodes (`ConvBBetaTiedB`, e.g. `EfficientNetStepTieG.lean:330`; `EfficientNetSyncStepTieG.lean:53-56`: "The single-device tie carries 49 more conjuncts, one per conv bias … the DP artifacts do not emit them"; `EfficientNetParamGrad.lean:8` "262"). Every committed B0 step (Imagenette `efficientnet_adam_train_step.mlir` included) runs `convBias := false` — its signature has `%sW %sg %sbt`, no `%sb` — so 213 is what is emitted. This is the "weaker, true reading" `planning/book_theorems_pass.md` §7.2 chose. Not wrong.
- Fix (optional): one gloss clause, "the tie also carries the 49 conv-bias nodes no render emits".

### L9814 `thm:efficientnetFullHasVJP` — [low] precision and hypothesis scope of the drop graphs
- Book says: "the `drop` and `dropdo` forward graphs denote the masked forward at every mask, at training and at inference BatchNorm, in f32 as the committed … are"; the block's one Assume (ε > 0) reads as covering all six names.
- Lean says: `efficientnetFwdGraphBFullDrop_faithful (N) (epsStr) (w) (bf16 : Bool) (sd) (cd) (x)` — `EfficientNetFullB0Drop.lean:450-453` — holds at either precision (file header: "`efficientnetFwdGraphBFullDrop … true` is the forward of the `*bf16` train steps"); only the eval twin (`:482`) has no flag. All five `*_faithful` theorems take no hypothesis (`efficientnetFwdGraphBFullEval_faithful` takes `ε : ℝ` with no positivity); `hεw` is the VJP's alone. The `do`-only graph (`efficientnet_do_fwd`, `sd = none, cd = some`) is also covered.
- Fix: "at either precision" for the training drop graph; a gloss that the graph ties need no hypothesis. (planning §7.4 already parks splitting this bundle into two blocks.)

### L9911 `thm:efficientnet_loss_grad`, L11480 `thm:convnext_loss_grad` — [low] the smoothed-CE instance has two side conditions
- Book says: "Instantiated at the label-smoothed cross-entropy."
- Lean says: `enet_net_lossGrad_smoothedCE … (hK : 0 < nCls) … (ht : ∀ n, ∑ k, targetRow N nCls t n k = 1)` — `EfficientNetParamGrad.lean:1404-1409`; `cnx_net_lossGrad_smoothedCE … (hK : 0 < nC) … (ht : ∀ n, ∑ k, batchSlice N nC t n k = 1)` — `ConvNeXtParamGrad.lean:1414-1418`.
- Fix: "Instantiated at the label-smoothed cross-entropy (targets summing to one)". Same clause presumably applies in chapters 5, 6, 9 — not in my slice.

### L9945 `thm:efficientnet_sync_tie` — [low] the forward half is uncited
- Book says: the proof paragraph relies on "a replica's forward is the global forward on its shard".
- Lean says: that fact is `Proofs.StableHLO.efficientnetFwdGraphSyncFullDrop_shard` — `EfficientNetSyncB.lean:450-461`: `den (efficientnetFwdGraphSyncFullDrop R hR N epsStr w bf16 ss ms e r) = batchShard R N nCls (efficientnetForwardBFullDrop (R*N) w (some SD) (some M) X) r`, with `mbResidDropGraphSync_shard` (`:293`) and `headGraphSyncDo_shard` (`:321`) as its block lemmas. SyncStepTieG's header (L58-60) calls it "the forward half". Not cited anywhere in content.tex. (Note: `efficientnet_net_syncTiedG` itself does not import or use it — the replicas' saved activations enter as shard hypotheses, header L58-59.)
- Fix: add the name to `\lean{}` or a gloss clause "the replicas' forward graphs denote the shards of the global forward".

### L11242 `ax:pdiv_geluErf` — [low] step count
- Book says: "Theorem~\ref{ax:pdiv_gelu}'s four steps".
- Lean/book: `ax:pdiv_gelu`'s proof (L11193-11210) has three enumerated steps; both Lean proofs are one call to `pdiv_elementwise` (`Activations.lean:140-143`, `GeluErf.lean:111-114`).
- Fix: "three steps".

### L11328 `thm:geluHasVJP` — [low] the `rfl` instances are described but not cited
- Book says: "At `tanh` the record is geluHasVJP and at `erf` it is geluErfHasVJP, each by `rfl`."
- Lean says: those are `Proofs.GeluForm.hasVJP_tanh` / `hasVJP_erf` — `GeluForm.lean:91-92` — not in the block's `\lean{}` (which lists `GeluForm.hasVJP`, `hasVJP_correct`, `geluHasVJP`, `geluErfHasVJP`).
- Fix: add the two names to `\lean{}`.

### L11259 `def:geluForm` — [low] "no proof outside the GELU's own two files cases on which"
- Lean says: `GeluForm.lean` (a third file beside `Activations.lean` and `GeluErf.lean`) is where `scalar` and `scalar_differentiable` case on the form (header: "Nothing here cases on the form except `scalar` and its differentiability").
- Fix: "outside `GeluForm.scalar` and its differentiability" or "the GELU's own three files".

### L11405 `thm:convnext_whole_back` — [low] GELU form unstated
- Lean: `convnextInputGradB_correct {gf : GeluForm} …` (`ConvNeXtWholeBackCertifiedTieB.lean:482`); the step-tie block says "GELU at either form", this one does not.
- Fix: add "at either GELU" to the Prove sentence.

### L14859 `layer:inceptionModule` — [low] signature argument names
- Book says: `inceptionModule (ic b1 b2reduce b2 b3reduce b3 b4 : Nat)`.
- Lean says: `| inceptionModule (ic b1out b2reduce b2out b3reduce b3out b4out : Nat)` — `LeanMlir/Types.lean`.
- Fix: use the Lean names.

### L14848 (prose above the definitions) — [low] "Twenty-five `Layer` constructors exist only for the bestiary"
- Lean: `Layer` has 51 constructors. The 23 defined here + `.separableConv` + `.fireModule` = 25 described; but 13 others are neither in the Part-1 list (L14705-14717) nor described here (`bottleneckBlock`, `mbConvV3`, `fusedMbConv`, `uib`, `convNextStem`, `layerNorm`, `bilinearUpsample`, `fpnDetect`, `spatialFlatten`, `spatialUnflatten`, `tokenPositionEmbed`, `lmHead`, `timeCondAdd`). Whether exactly 25 are "bestiary-only" is not checkable from the inductive. Outside a block.
- Fix: "Twenty-five of the bestiary's constructors are described here: …" or recount.

### L15041 `layer:pairTile` — [low] "two dense maps … (one parameter group, no bias …)"
- Lean: two weights `W` (on the i block) and `Wj` (on the j block), each with its own gradient (`Types.lean` docstring: "Each block goes through its own weight … `W` … `Wj`"). "One parameter group" is ambiguous (two tensors, one layer).
- Fix: "two weights, no bias" or drop the parenthesis.

## Newer / stronger Lean the slice could cite (summary)
- Chapter 8: `convNextForwardTChHasVJP_correct`, `convNextFwdGraphTCh_faithful`, `convnextVerified_fwd_faithful` — see the medium finding. 
- Chapter 8: `GeluForm.hasVJP_tanh` / `hasVJP_erf` (low, above). `geluErfHasVJP_correct` (`GeluErf.lean:127`) is the `.correct` restatement already covered by `GeluForm.hasVJP_correct`; `IR.geluErf_back_bridge` is cited.
- Chapter 7: `efficientnetFwdGraphSyncFullDrop_shard` + its two block lemmas (low, above). `rmsPropTf_triple_faithful` (`Codegen/StableHLO/Basic.lean:3566`) exists and is uncited; the chapter's blocks correctly put the optimizer tail outside every statement, so this is for the §"RMSProp in TensorFlow's form" prose, not a theorem block.
- Commit a89fa9af (2026-10-12, TF `SAME` on the four strided depthwises) changed the proof-model forward; no block in the slice describes padding, so nothing in the blocks went stale.
- Commit 087ff789: no chapter-7 block says AdamW; the blocks name `efficientnet_adam_train_step.mlir` (Imagenette Adam render, correct) and the `efficientnetin_*` steps generically. Only the exemplar-name drift above.

## Checked and fine
EfficientNet:
- `thm:seBlockHasVJP` (L9769): `seBlockHasVJP {n} (gate) (hg_diff : Differentiable ℝ gate) (hg : HasVJP gate) : HasVJP (seBlock gate) := elemwiseProductHasVJP (fun x => x) gate differentiable_id hg_diff (identityHasVJP n) hg` — `SE.lean:110-114`; backward formula and both proof steps match.
- `thm:efficientnetFullHasVJP` (L9814) apart from the low note: 49 ε's (1 stem + 2 for b1 + 15×3 + 1 head), 16 MBConv, batch N, `efficientnetForwardBFull`, nine skip blocks `b3 b5 b7 b8 b10 b11 b13 b14 b15` (Drop header), classifier dropout between GAP and dense, both artifact names exist, proof shape (fold via `vjpComp`; graph one `rw` per block then `rfl`).
- `thm:efficientnet_whole_back` (L9851): `efficientnetInputGradBFull_correct … (hεw : w.EpsPos) … = ∑ j, pdiv (efficientnetForwardBFull N w) x i j * dy j` — `EfficientNetFullWholeBackCertifiedTie.lean:227-260`.
- `thm:efficientnet_step_tie` (L9879) apart from the two notes above: masks `sd : Option (Fin 9 → Vec N)`, `cd : Option (Vec (N*1280))`, dropped cotangent into the branch (`dropPathOpt … dy3`) and raw at the skip, dense reads the dropped activation (`headDoFwdB`), either precision (`bf16 : Bool`), one replica, loss cotangent `smoothedLossCotGraph` with target binder; `efficientnet_adamdo`/`_drop`/`_dropdo` renders exist.
- `thm:efficientnet_loss_grad` (L9911): `enet_net_lossGrad … (hεw) … (hL : HasGradAt L (efficientnetForwardBFullDrop N w sd cd x) g)` — `EfficientNetParamGrad.lean:1302-1307`; forward at the same masks; proof is `HasGradAt.comp_global` per stage; `enet_net_tied_lossGrad` cited.
- `thm:efficientnet_sync_tie` (L9945): `efficientnet_net_syncTiedG (R) (hR : 0 < R) (N) (hN : 0 < N) … (hεw) (bf16) (sd : Option (Fin 9 → Vec (R*N))) (cd) … (hgs : ∀ r, gs r = batchShard R N nCls (fun i => R * g i) r)` — `SyncStepTieG.lean:1360-1366`; 213 collectives at `convBias := false` (header L53-54); ÷B vs ÷(R·B) in `_smoothedCE` (`:1431-1446`); proof description (homogeneity + shard, R cancels 1/R) matches the header's five steps.

ConvNeXt:
- `ax:geluScalar`, `ax:geluScalarDeriv` (closed form proof via inner polynomial, `hasDerivAt_tanh` from `sinh/cosh` + quotient rule, outer product — `Activations.lean:99-129`), `ax:pdiv_gelu` (three steps = `pdiv_elementwise`'s proof, `Tensor.lean:199-212`), `ax:geluErfScalar` (`gaussPhi = ½ + ∫₀ˣ φ`, `hasDerivAt_gaussPhi` by FTC at a continuous integrand — `GeluErf.lean:44-67`), `ax:geluErfScalarDeriv` (`Φ(x) + x φ(x)`, product rule — `:84-104`), `ax:pdiv_geluErf` apart from "four steps", `def:geluForm` apart from the wording note (`tanh | erf`, `scalar`, `map`, `map_tanh`/`map_erf` by `rfl`), `thm:layerNormHasVJP` (`show HasVJP (bnForward …); exact bnHasVJP … hε` — `LayerNorm.lean:89-93`), `thm:chanLNTensor3HasVJP` (five-piece `vjpComp`: reassoc, transpose, `rowLNVecFlatHasVJP`, transpose, reassoc — `ChannelLN.lean:161-173`; 22 spatial sites + head vector LN per the file header), `thm:geluHasVJP` apart from the `\lean{}` note, `thm:geluErf_as_computed` (all three displayed identities are `gaussPhi_eq_erfc`, `geluErfScalar_eq_erfc`, `geluErfScalarDeriv_eq_erfc` verbatim — `GeluErf.lean:173-204`; proof steps `integral_comp_div`, `erf_neg`, `field_simp; ring` match; `geluErf_back_bridge` is `rfl` — `IR.lean:381-383`).
- `thm:convnext_whole_back` (L11405) apart from the GELU note: hypotheses `hsε, h1–h4, hd1–hd3, hhε` (23 = 1 + 18 + 3 + 1), twelve-stage `convnextInputGradB`, `∑ pdiv (StableHLO.batchMap B (convNextForwardTCh gf w))`, every B and nC — `ConvNeXtWholeBackCertifiedTieB.lean:482-507`; `padOdd` at the stem and three downsamples, `conv2d_padOdd_eq` exists (`EvenKernelConvBack.lean:61,86`); `convnextImagenetInputGradB_eq_vjp` at nC = 1000.
- `thm:convnext_step_tie` (L11445): no positivity hypothesis in `cnx_net_tiedGB` (correctly no `\Assume{}`), 182 nodes, `[3,3,9,3]`, 22 channel-LN sites, `sd : Option (Fin 18 → Vec N)` at the site between LayerScale and the skip (`CnxTieBlk.fwdOD`/`cotInD`), `smoothedLossCotGraphDiv`, either precision, one replica; `convnext_adam_train_step.mlir` and 34 `convnextin_*` artifacts exist; the three leaf ties `cnxBlockCotInB_eq_vjp`, `cnxDownCotInB_eq_vjp`, `cnxHeadDyB_eq_vjp` at `ConvNeXtStepTieGB.lean:403-434`.
- `thm:convnext_loss_grad` (L11480) apart from the side-condition note: `cnx_net_lossGrad … (ε) (hε : 0 < ε) … (hL : HasGradAt L (cnxNetB gf N ε w sd x) g)` — `ConvNeXtParamGrad.lean:1312-1315`; `cnxNetB_eq_convNextForwardTCh : cnxNetB gf N ε w none x = batchMap N (convNextForwardTCh gf (w.toCh ε)) x` (`:1197-1199`).

Bestiary (all 23 constructors found in `LeanMlir/Types.lean`, arity and argument meaning checked; shape/count rules in `LeanMlir/Spec.lean`):
- `layer:denseBlock` (output `ic + nLayers·gr`, `Spec.lean:532`), `layer:transitionLayer`, `layer:shuffleBlock`, `layer:shuffleV2Block`, `layer:mobileVitBlock`, `layer:swinStage`, `layer:patchMerging`, `layer:darknetBlock`, `layer:cspBlock`, `layer:fpnModule`, `layer:transformerDecoder`, `layer:detrHeads` (`dim → nClasses+1`, 3-layer box MLP), `layer:unetDown`, `layer:unetUp` (`ic + oc → oc → oc`, skip width `oc`), `layer:pairTile` apart from the wording note (`Proofs/Foundation/PairTile.lean` exists), `layer:asppModule`, `layer:mambaBlock` (component list matches the count comment `Spec.lean:170-180`), `layer:waveNetBlock` (kernel-2 causal conv, output channels `skipCh` — `Spec.lean:298-307, 526`), `layer:positionalEncoding` (0 params, out dim `inputDim·2·numFreq` — `:308-310, 527`), `layer:nerfMLP` ("under 600K": `Spec.lean:311-323` at (60, 24, 256) gives 593,924), `layer:evoformerBlock`, `layer:structureModule` (`6·cs² + cs·cz/4`, `nBlocks` unused — `:275-283`), `layer:inceptionModule` apart from the argument names.

---

# Review: Chapter 9 "Vision Transformer" — content.tex 12403–14690 vs LeanMlir (HEAD 2026-10-21)

41 blocks (1 definition + 40 theorems). Every `\lean{}` name resolves; every `\uses{}` label
exists. Lean files last moved: Attention/LayerNorm/Tensor 2026-10-01..15 (GeluForm 10fc13ee,
module system 01f07b9c); ViT nets 2026-10-01..10-15 (drop-path masks da62e3b4, bf16 32d8cccf).
Nothing in the cited ViT files changed with the R4 patch-embed-bias commits (d61452ad, ebe3cb6b):
those touch `LeanMlir/Verified/*` and the JAX side; the theorems are generic in the weights.

## Findings

### High

**L13499 thm:transformerBlockHasVJPMat — [high]**
Book says: `\Prove{} HasVJPMat of one pre-norm encoder block …`, no `\Assume`.
Lean says: `transformerBlockHasVJPMat … (ε γ1 β1 : ℝ) (hε : 0 < ε) …` — LeanMlir/Proofs/Architectures/Attention.lean:1603-1605; LayerNorms are scalar-affine (`γ1 β1 γ2 β2 : ℝ`).
Fix: add `\Assume{} ε > 0 \hfill[hε]`; say "scalar-affine LayerNorms" once in the gloss (the vector-LN block of the render is `transformerBlockVHasVJPMat`, ViTVecLN.lean:165).

**L13522 thm:transformerTowerHasVJPMat — [high]**
Book says: no `\Assume`; "for every k --- ViT-Tiny/Base (k = 12) and Large (k = 24) are instances."
Lean says: `transformerTowerHasVJPMat … (hε : 0 < ε) …` Attention.lean:1682-1684. `transformerTower` is `Nat.rec` over ONE shared parameter tuple with scalar-affine LN (Attention.lean:1643-1657; the file's own text: "in practice every block has its own weights and a per-feature LN. Per-block parameters are not formalized in this file"). ViT-Tiny is `vitForwardKV` (ViTDepthK.lean:160), proved by `vitForwardKVHasVJP`, which does not use this theorem.
Fix: add ε > 0; "the weight-tied k-block tower (one parameter tuple shared by every block, scalar-affine LN), for every k". Point the ViT-Tiny/Base/Large sentence at Theorem vitForwardKVHasVJP, or drop it.

**L13552 thm:vitBodyHasVJPMat — [high]**
Book says: title "ViT body: the grand finale"; no `\Assume`; "the full ViT transformer backbone finalLN ∘ transformerTower is one HasVJPMat."
Lean says: `vitBodyHasVJPMat … (hε : 0 < ε) …` Attention.lean:1774-1776; docstring 1767-1773: "A depth-k weight-tied backbone (one parameter tuple for every block, scalar-affine LayerNorms)". The real-network finale is Theorem vitForwardKVHasVJP (the proof paragraph already says so).
Fix: add ε > 0; "the weight-tied body"; retitle. This is also the natural home for `vitFullHasVJP` / `vitFullHasVJP_correct` (Attention.lean:2224, 2325: the weight-tied whole net incl. patch embed and head, three `vjpComp`s), which is currently mis-cited under thm:layerNormVecHasVJP (see L13326).

### Medium

**L13308 thm:layerNormPerTokenHasVJPMat — [medium]**
Book says: the theorem environment has no statement at all (label, lean, leanok, uses only).
Lean says: `layerNormPerTokenHasVJPMat (N D : Nat) (ε γ β : ℝ) (hε : 0 < ε) : HasVJPMat (fun X => fun n => layerNormForward D ε γ β (X n))` Attention.lean:1354-1357.
Fix: `\Assume{} ε > 0 [hε]`; `\Prove{} HasVJPMat of the row-wise scalar-affine LayerNorm (γ, β ∈ ℝ) on Mat N D`.

**L13358 thm:densePerTokenHasVJPMat — [medium]**
Book says: no statement.
Lean says: `densePerTokenHasVJPMat (N inD outD) (W : Mat inD outD) (b : Vec outD) : HasVJPMat (fun X => fun n => dense W b (X n))` Attention.lean:1361-1364; no hypotheses.
Fix: one `\Prove{}` line.

**L13374 thm:geluPerTokenHasVJPMat — [medium]**
Book says: no statement.
Lean says: `geluPerTokenHasVJPMat (gf : GeluForm) (N D) : HasVJPMat (fun X => fun n => gf.map D (X n))` Attention.lean:1368-1370; either GELU form.
Fix: one `\Prove{}` line, "at either GELU form".

**L13685 thm:vit_whole_back — [medium]**
Book says: title "The rendered backward is the VJP"; Prove: "the batched input-gradient chain vitInputGradKB equals the backward of the batched tower batchMap B vitForwardKV".
Lean says: `vitInputGradKB` is a Lean-defined chain (ViTBackChains.lean:269-283, "as the batched render computes it") with no `den` — the cited theorems (ViTWholeBackCertifiedTieB.lean:270, 301) tie that chain, not a rendered graph, to the VJP. The graph-level rung exists and is uncited: `vitNetBackGraph_faithful` (ViTBackNet.lean:296-318): `den (vitNetBackGraph …) = (vitForwardKVHasVJP …).backward x (den e)`, every depth, one example. Also `vitForwardKV` is the whole net (patch embed → blocks → final LN → head, ViTDepthK.lean:160-181), not "the tower".
Fix: title "The batched backward chain is the VJP" (or cite `vitNetBackGraph_faithful` and say which rung is the graph); "batched network" for "batched tower".

**L13748 thm:vit_loss_grad — [medium]**
Book says: Assume ε > 0, hL; gloss "Instantiated at the label-smoothed cross-entropy."
Lean says: the instantiation `vit_net_lossGrad_smoothedCE` (ViTParamGrad.lean:1675-1678) and `vit_net_tied_lossGrad` (1692-1697) additionally take `hK : 0 < nC` and `ht : ∀ n, ∑ k, batchSlice N nC t n k = 1`. The generic `vit_net_lossGrad` (1608) needs only hε and hL — as the block says.
Fix: "Instantiated at the label-smoothed cross-entropy, for targets whose rows sum to one and nC > 0."

**L14654 Recap (prose) — [medium]**
Book says: "the whole ViT-Tiny is proved at every depth (Theorem vitTinyHasVJP_correct)".
Lean says: `vitTinyHasVJP_correct` is fixed at depth 12 and the literal dims (ViTWholeBackCertifiedTie.lean:238-248: `ps : Fin 12 → BlockParamsV (3 * 64) 768`). The every-depth statement is `vitForwardKVHasVJP_correct` (ViTDepthK.lean:228).
Fix: "the depth-k net at every depth (Theorem vitForwardKVHasVJP) and ViT-Tiny, at k = 12, end to end (Theorem vitTinyHasVJP_correct)". No block in the slice itself says "every depth" of `vitTinyHasVJP_correct`; L13705 "The same holds at every depth" is backed by `vitInputGradKB_correct` (cited) — fine.

**L12530–12545, L12427 counts (prose) — [medium]**
Book says: "thirty-seven theorems", "Matrix-level machinery, sixteen theorems", "Attention proofs, twenty-one theorems", "the sixteen matrix-machinery lemmas".
Actual: 41 blocks = 40 theorems + 1 definition; §Matrix-level machinery (12605–12992) = 13 theorems + 1 definition; §Attention proofs (12994–13775) = 27 theorems. Theme 8 of the 10-18 doc; not fixed by 5729af20/fa46f254.
Fix: "forty", "thirteen (plus the matrix VJP definition)", "twenty-seven"; drop "sixteen" at 12427.

**L13326 thm:layerNormVecHasVJP — [medium]**
Book says: `\lean{Proofs.layerNormVecHasVJP, Proofs.layerNormVecPerTokenHasVJPMat, Proofs.transformerBlockV, Proofs.vitFullHasVJP}`.
Lean says: `transformerBlockV` is a forward definition (ViTVecLN.lean:61), not a theorem; `vitFullHasVJP` (Attention.lean:2224) is the weight-tied scalar-LN whole net and uses no vector LN. These two names are why the block's `\uses` reaches forward to thm:vitBodyHasVJPMat, ax:patchEmbedFlatHasVJP, thm:pdiv_reindex.
Fix: cite `Proofs.transformerBlockVHasVJPMat` (ViTVecLN.lean:165) if the vector-LN block witness belongs here; move `vitFullHasVJP` to thm:vitBodyHasVJPMat; rerun `blueprint_uses.py --fix`.

### Low

**L13611 thm:vitFwdGraphKMHV_faithful — [low]**
Book says: "at all-ones masks, vitForwardKV on every example."
Lean says: `vitFwdGraphBDrop_faithful` concludes `vitForwardKVDropB` (ViTFwdDrop.lean:445-455); the reduction is `vitForwardKVDrop_ones` (ViTFwdDrop.lean:160) / `vitBodyKVDrop_ones` (130), neither in `\lean{}`. Stronger/newer: `vitVerified_fwd_faithful` (SpecVJP.lean:477-488) ties the depth-12 graph to `denoteVitTiny vitVerified.layers` by `rfl` through `vitVerified_denote_eq`.
Fix: add `vitForwardKVDrop_ones` to `\lean{}`; optionally gloss "and at ViT-Tiny's spec the graph denotes the committed `vitVerified` itself".

**L13580 thm:vitForwardKVHasVJP — [low]**
Book says: title "The depth-k tower has a VJP"; proof "Three applications of vjpComp: the patch embedding, the tower by induction on k, the final LayerNorm and head".
Lean says: the object is the whole net `vitForwardKV` (ViTDepthK.lean:160-181). Three top-level `vjpComp`s glue four factors (PE, body, final LN, head; ViTDepthK.lean:183-226); the body's induction is a further `vjpComp` per block (`vitBodyKVFlatHasVJP`, 140-157).
Fix: "The depth-k network has a VJP"; "three vjpComps over four factors, the body itself a vjpComp fold over the k blocks".

**L13184 ax:mhsaHasVJPMat, proof step 3 — [low]**
Book says: "the dense factors are per-token lifts (Theorem densePerTokenHasVJPMat)".
Lean says: `mhsaComposedHasVJPMat` inlines `rowwiseHasVJPMat (denseHasVJP …)` (Attention.lean:1270-1276, 1289-1290) because `densePerTokenHasVJPMat` is defined later; the `\uses` correctly omits it. Step 2 is accurate (`pdivMat_colIndep` :164, `colSlabwiseHasVJPMat` :204, lifting `mhsaGHasVJPMat` :1068 whose backward column-stacks sdpaBackQ/K/V).
Fix: "rowwiseHasVJPMat at g = dense".

**L13444 / L13474 sublayer proofs — [low]**
Lean says: both are one call of the generic pre-LN residual helper `preLNResHasVJPMat` (Attention.lean:1459-1466) = `biPathMatHasVJP (id) (vjpMatComp L F)`; the book's steps describe exactly that. Optional: name the helper once.

**L12624 ax:pdivMat_rowIndep — [low]**
Lean says: the proof is now one rewrite of `pdivMat_rowIndep_perRow_at` (Tensor.lean:921-951), a stronger lemma (a different `g r` per row, `DifferentiableAt` only at each row `A r`); the book's three steps (rowProj CLM, `hasFDerivAt_pi`, chain rule) are that lemma's proof. Statement matches (:961-967). Optional: mention the per-row-at-a-point form.

**L13392 ax:rowSoftmax_flat_differentiable — [low]**
Book says: step 1 "Case n = 0 … constant".
Lean says: no case split (Attention.lean:395-399: `have := softmax_differentiable n; unfold rowSoftmax; fun_prop`); the `c = 0` case lives inside `softmax_differentiable` (Softmax.lean:22-27).
Fix: fold the case into step 2 or drop it.

**L13714 thm:vit_step_tie, proof sentence — [low]**
Book says: "the chain's cotangents the certified backwards of the lifted block and the head" with no `\Assume` (correct for `vit_net_tiedGB`, ViTStepTieGB.lean:462: no hε).
Lean says: the two cited cotangent lemmas `vitBlockCotInB_eq_vjp` (:380) and `vitCotTowerOutB_eq_vjp` (:391) take `hε : 0 < ε`.
Fix: "(at ε > 0)" in the proof sentence.

**L13580–13748 GELU form — [low]**
No ViT-ladder block says the statement holds at either GELU form, though every cited theorem carries `gf : GeluForm` (both `.tanh` and `.erf`; GeluForm.lean:30-92, `hasVJP_erf` = `geluErfHasVJP`). Only thm:geluPerTokenHasVJPMat's proof says "either GELU form"; the chapter prose (L13990) says Imagenette = tanh, ImageNet pairs = erf.
Fix: one clause in thm:vitForwardKVHasVJP's or thm:vit_step_tie's gloss: "at either GELU form (tanh for the Imagenette render, exact erf for the ImageNet pairs)".

**L1383 thm:hasGradAt_comp (outside slice; §7 item 5) — [low]**
Book says: "If G has gradient dy at f(x) and f has a VJP at x, then …".
Lean says: `HasGradAt.comp … (hG : HasGradAt G (f x) dy) (hf : DifferentiableAt ℝ f x) (vf : HasVJPAt f x)` ParamGrad.lean:79-81 — the differentiability binder is still unmentioned. Not fixed.
Fix: "f is differentiable at x with VJP backward there".

## Newer / stronger Lean the slice could cite (none contradict the text)
- `vitNetBackGraph_faithful` (ViTBackNet.lean:296): backward GRAPH denotes `vitForwardKVHasVJP.backward`, every depth — the graph rung thm:vit_whole_back's title promises.
- `vitVerified_fwd_faithful` (SpecVJP.lean:477): forward graph = `denoteVitTiny vitVerified.layers` at the committed spec.
- `vitFullHasVJP_correct` (Attention.lean:2325), `transformerBlockHasVJPMat_correct` (:2300): public `.correct` restatements of the weight-tied witnesses.
- `transformerBlockVBackGraphMHP_faithful` (ViTBackB0.lean:941): the vector-LN block's backward graph denotes `transformerBlockVHasVJPMat.backward`.
- `vit_block_tiedGB` (ViTStepTieGB.lean:258) / `vit_block_lossTiedGB` (ViTParamGrad.lean:773): the per-block 16-node tie and loss tie the 200-node theorems fold; the book's "A fold over the 200 nodes" is right, naming the block lemma would match the ladder paragraph's "the hypotheses enter at the block".
- `vitForwardKVDrop_ones` (ViTFwdDrop.lean:160) — see L13611.
- `vitInputGradK_eq_vitApexVJP` (ViTWholeBackCertifiedTie.lean:133) is the same statement as `vitInputGradK_eq_vitForwardKV_vjp` (:164) through the `vitApexVJP` alias; nothing to add.
- Patch-embed bias (R4, d61452ad/ebe3cb6b): `vitVerified` now spells `.patchEmbed 3 192 16` (NetsCore.lean:1225, "bias kind 8"), as the book's listing (L13865) and gloss (L13900-13908) say; L14173 ("starts at zero here … ViT-S and B start it there") and the §vit_sb paragraph (L14590-14596) agree with the commits. No theorem block mentions the bias init (all are generic in `b_conv`), so nothing disagrees.

## Checked and fine
Statement, hypotheses, numbers, `\pf{}` names and proof shape all match the Lean:
- def:hasvjpmat (Tensor.lean:676-679, 748-752); ax:pdivMat_rowIndep statement (:961-967); thm:vjpMatComp (:773-812: `pdivMat_comp`, `Finset.sum_comm` pack/unpack); thm:biPathMatHasVJP (:819-831: `pdivMat_add`, `sum_add_distrib` ×2); thm:identityMatHasVJP (:837-843: `pdivMat_id`, `ite_and`); thm:pdivMat_scalarScale (:998-1006: `pdiv_const_smul` = `pdiv_mul` + `pdiv_const` at :183-189, then `pdiv_id`); thm:pdivMat_transpose (:1010-1016: `pdiv_reindex`); thm:pdivMat_matmul_left_const / _right_const (:897-918: `pdiv_of_linear`, `by_cases`; entries `[l=j]C_ki`, `[i=k]D_jl`); thm:matmulLeftConstHasVJP / RightConst (:1022-1040: Cᵀ dY, dY Dᵀ); thm:scalarScaleHasVJP, thm:transposeHasVJP (:1043-1058); thm:rowwiseHasVJPMat (:977-984: hg, hg_diff).
- ax:pdiv_softmax (Softmax.lean:57-110: `pdiv_eq_fderiv_coord`, `HasFDerivAt.exp`, `hasDerivAt_inv.comp_hasFDerivAt`, `field_simp; ring`); thm:softmaxHasVJP (:142-151: `Finset.sum_ite_eq`, `Finset.mul_sum`); thm:rowSoftmaxHasVJPMat (Attention.lean:406-410).
- thm:sdpaBackQ_correct (:555-620: `sdpaQChain_eq`, 4 links / 3 `vjpMatComp`, `fun_prop`, final `rfl`); thm:sdpaBackK_correct (:628-713: 5 links / 4 `vjpMatComp`, `mul_comm`/`ring` at the summand); thm:sdpaBackV_correct (:717-742: `sdpa_eq_mul_weights`, `matmulLeftConstHasVJP`).
- ax:mhsaHasVJPMat statement and steps 1, 2, 4 (:1232, 1310-1327: backward = composed witness's field, transport in `correct` only); ax:mhsaLayer_flat_differentiable (:1330-1340).
- ax:patchEmbedFlatHasVJP (:2043ff: `pdiv_of_affine`, CLS row 0, `Fin.sum_univ_succ`; backward = `patchEmbedInputGradFormula` :2013-2030, matches step 1's formula); ax:patchEmbedFlat_differentiable (:1996-2005).
- thm:layerNormVecHasVJP statement, Assume, proof (LayerNorm.lean:196-206: `(+β) ∘ layerScale γ ∘ LN(1,0)`, two `vjpComp`; per-token lift :208-212); its gloss about which LN is which (ViTVecLN.lean header, ViTDepthK.lean:160).
- thm:transformerMlpHasVJPMat (:1429-1455); thm:transformerAttnSublayerHasVJPMat and thm:transformerMlpSublayerHasVJPMat (Assume ε > 0 present; :1532-1539, 1572-1581).
- thm:vitTinyHasVJP_correct: Prove (3×224×224, P=16, N=196+CLS, 192=3×64, MLP 768, 12 distinct blocks, any nCls, generic weights; ViTWholeBackCertifiedTie.lean:219-248) and all four proof steps (`vitForwardKVHasVJP` :183, `_correct` :228, `vitInputGradK_eq_vitForwardKV_vjp` :164, `vitTowerBackK_eq_vjp` :78, `vitFinalLNBack_eq_vjp` :63, `transformerBlockVHasVJPMat` ViTVecLN.lean:165).
- thm:vit_whole_back Prove body (every B, nCls, cotangent, index; every depth via `vitInputGradKB_correct` ViTWholeBackCertifiedTieB.lean:270; `vitTinyInputGradB_eq_vitTiny_vjp` :301).
- thm:vit_step_tie statement: 200 nodes = 12×16 + Wc/bc/cls/pos + γF/βF + Wcls/bcls (ViTStepTie.lean:280ff, ViTStepTieGB.lean:462-520); heads 3 × 64, depth 12, patch 16; `N`, `nC` binders; smoothed-CE cotangent `g`; CLS summed in-node; one replica; `bf16`/`bf16ConvW`; `sd : Option` with out-proj/fc2 at the masked cotangent and skips raw (`vitBlockTiedGB` :225-256: `cotOB = dropPathOpt sA cotHB`, `dyOutD = dropPathOpt sM dyOut`); no ε hypothesis on the tie itself.
- thm:vit_loss_grad statement proper: Assume ε > 0 + hL match `vit_net_lossGrad` (ViTParamGrad.lean:1608-1613); `vitNetB` (:1201) and `vitNetB_eq_vitForwardKV` at `none` (:1521); proof = `HasGradAt.comp` per stage (`vitBlkB_hasGradAt_comp`, `vitHeadB_hasGradAt_comp`).
- thm:vitFwdGraphKMHV_faithful: every-depth forward denotation (ViTDepthK.lean:322-342), batched drop graph at either precision and per-example masks (ViTFwdDrop.lean:445-455, `_slice` :405).
- Chapter prose consistent with the Lean on: spec listing (`.patchEmbed 3 192 16`, `.param … 5`, 24 drop sites, NetsCore.lean:1225-1227); GELU tanh for Imagenette / erf for ImageNet; patch-embed bias disclosure after R4.
- Not independently verified: the vitFwdGraphKMHV block's claim that the emitted forward text is not tied to the typed graph by a text check. `tests/TestViTFwdBTie.lean` byte-ties the per-example and batched *renders* to `vit_fwd.mlir`; I did not establish whether the printed batched graph is `vitFwdGraphBDrop` (den-bearing) or a separate printer-only term.

---

## 6. Status — 2026-10-21, the fix pass (working tree, uncommitted)

Everything in §1–§4 is applied in `blueprint/src/content.tex` except two items left on purpose:
`thm:reluHasVJP`'s `thm:` prefix on a definition (renaming the label churns `\uses` lists, xrefs
and the depgraphs for no reader-facing change) and the MobileNetV4 step tie's 256²/drop caveat
(disclosed once, on the sync tie, where the chapter reports that run). Also done:

* **Two new blocks**: `thm:convnextFullHasVJP` (ch 8 rung (i): `Proofs.convNextForwardTChHasVJP_correct`,
  `Proofs.StableHLO.convNextFwdGraphTCh_faithful`, `convnextVerified_fwd_faithful`; the lead-in
  says four rungs) and `thm:cifar8bbn_step_tie` (ch 4, after the G ties, with a lead-in clause).
  172 blocks now (133 theorems, 39 definitions); 311 cited names.
* **Citations added** to existing blocks: `rmsPropTf_triple_faithful` (MNv2 step tie, with an
  optimizer gloss), `vitNetBackGraph_faithful` (ViT whole-back, retitled "batched network"),
  `vitForwardKVDrop_ones`, `mobilenetv4ForwardBFullDrop_ones`, `w5B_tied`,
  `r34/r50_lossCot_is_smoothedCE_grad`, `r50_net_syncTiedB_smoothedCE`,
  `efficientnetFwdGraphSyncFullDrop_shard`, `GeluForm.hasVJP_tanh/erf`, the MLP output/hidden
  float descents, the four bias descents and the three remaining trained CNN witnesses;
  `vitFullHasVJP` moved from `thm:layerNormVecHasVJP` to `thm:vitForwardKVHasVJP` (on the body block it dragged the block below the ladder in the dep graph),
  `transformerBlockV` replaced by `transformerBlockVHasVJPMat`.
* **Lean side, two lines**: `tests/AuditAxioms.lean` imports and pins
  `Cifar8BbnTieB.cifar8Bbn_train_step_tiedB` (audit rerun: 1,960 declarations, all on the three
  axioms); `tests/TestCifar8BbnGradCheck.lean`'s header no longer says the tie "is not yet stated".
* **Regenerated**: `blueprint/lean_decls`, `blueprint/lean_deps` (2,691 edges), every `\uses`
  (`blueprint_uses.py --check` in sync, 1,351 edges), the depgraph figures for ch 2, 3, 4, 8, 9,
  the book spine and `book.tex`.
* **Gates**: checkdecls resolves all 311 names; only-mentions report unchanged; 427/427 prose
  identifiers; `book_xrefs` 505 refs / 232 targets; `book_floats --strict` 0 violations;
  `book_listings --check` clean; `book_counts` agree; PDF builds with 0 LaTeX errors and no
  undefined references (249 pages, from 248 at HEAD).

Not done here (Lean docstrings, not the book): the run names in the headers of
`ResNet34StepTieB/ParamGrad/SyncStepTieB` (`momdp64bf16`), `MobileNetV2StepTieB/ParamGrad/SyncStepTieB`
(`rmsdp64wxdols0eps0001bf16`) and `EfficientNetStepTieG` (`emarmsdp64dropdowxeps0001bf16`) still
name the superseded renders; the R34 blocks will need `momdp64wxbf16` when the bag-of-tricks
rerun lands.
