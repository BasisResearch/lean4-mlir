# cifar_fold_b.md — the Chapter-4 train step tied at batch N (`CifarFoldB`)

Opened 2026-10-21 from the theorem check (`planning/book_theorems_check_2026-10-21.md` §2.5):
chapters 1–3 got batched folds on 2026-10-19 (0da70269: `LinFoldB`, `MlpFoldB`, `CnnFoldB`);
chapter 4's `thm:cifar_fold` is still `CifarFold.cifar_train_step_tied_certified`, stated at one
`x : Tensor3` while `verified_mlir/cifar_train_step.mlir` is the batch-128 instance
(`%x: tensor<128x3072xf32>`). The book says so in one clause ("Stated at one example; the committed
text is the batch-128 instance read one image at a time"). This closes it the way the three
smaller nets were closed.

## 1. What exists

* `LeanMlir/Proofs/Nets/Small/CifarFold.lean` (250 lines): the 14-parameter per-example tie —
  `(conv→relu)×2 → pool → (conv→relu)×2 → pool → (dense→relu)×2 → dense`, 4 conv kernels/biases
  + 3 dense layers. Hand-named chain cotangents: `mlpCotOut1`/`mlpCotOut0` in the head,
  `cnnChainCotW2` for conv₄ (relu mask on pool₂-back of the head cotangent), `cnnChainCotW1` for
  conv₃ and conv₁ (relu mask on the next conv's input-VJP), `cifarChainCotW2` for conv₂ (relu mask
  on pool₁-back of conv₃'s input-VJP — the one chain shape the MNIST CNN does not have). Capstone
  `cifar_train_step_tied_certified` = 14 `*SgdTied` conjuncts; `cifar_W7_tied_totalloss` folds
  the output weight to the whole-loss gradient.
* `CnnFoldB.lean` (365 lines), the template: per-example shorthands at slice `k`; the batched
  forward as `batchOp` lifts (`hc1B … a4B`) with `_slice` lemmas; the loss cotangent
  `cotB = subB(softmaxDiv(expe(logits)), onehot)` with `cotB_slice`; the chain as the EMITTED
  nodes — `selectPosB` (relu mask), `maxPoolBackB`, `convBackP` (the transpose-then-reverse conv
  input-VJP descriptor, 0da70269) — with `dy4B_slice`, `dy3B_slice`, `dhc2B_slice`
  (= `cnnChainCotW2`), `dhc1B_slice` (= `cnnChainCotW1`, odd kernels); `*SgdTiedB_holds` per node
  kind (`GradNodeB.convWGradB_den` etc.); `w5B_tied`; `cnn_train_step_tiedB` = 10 conjuncts.
* The byte tie: `tests/TestSmallNetsBatchedEmit.lean` re-prints each committed artifact from the
  batched nodes and diffs against the committed writer (34/74/176 lines for linear/mlp/cnn).
  The cifar writer is `cifarTrainStepText` in `Proofs/Codegen/CnnRender.lean:187`, `B` a
  parameter, hand-written conv backward.
* Registration pattern (0da70269): lakefile `Certs` root (`:238` next to `CifarFold`),
  `tests/AuditAxioms.lean` import + `#audit_axioms` pins (`:462–466` for CnnFoldB), the
  `certs.yml` summary row (`:216` is cifar's), the comparator tier count
  (`scripts/gates/gen_comparator_tier.py`, 58 tier / 110 total today; `book_counts.py` checks it).

## 2. The statement

`Proofs.CifarFoldB.cifar_train_step_tiedB (N) … : let … ; DenseWSgdTiedB … ∧ … (14 conjuncts)` —
`CnnFoldB.cnn_train_step_tiedB` with two more convolutions and the second pool crossing:

| node | batched chain value | slice lemma (= per-example) |
|---|---|---|
| `%W7 %b7` | `g = cotB` | `cotB_slice`: `softmax(logitsₖ) − onehotₖ` |
| `%W6 %b6` | `dy6B = selectPosB(h6, denseRowBack(W7, g))` | `dy6B_slice` = `mlpCotOut1` |
| `%W5 %b5` | `dy5B = selectPosB(h5, denseRowBack(W6, dy6))` | `dy5B_slice` = `mlpCotOut0` |
| `%W4 %b4` | `dhc4B = selectPosB(hc4, maxPoolBackB(ac4, denseRowBack(W5, dy5)))` | `dhc4B_slice` = `cnnChainCotW2` |
| `%W3 %b3` | `dhc3B = selectPosB(hc3, convBackP(W4, dhc4))` | `dhc3B_slice` = `cnnChainCotW1` (odd `kH kW`) |
| `%W2 %b2` | `dhc2B = selectPosB(hc2, maxPoolBackB(ac2, convBackP(W3, dhc3)))` | `dhc2B_slice` = `cifarChainCotW2` (odd) |
| `%W1 %b1` | `dhc1B = selectPosB(hc1, convBackP(W2, dhc2))` | `dhc1B_slice` = `cnnChainCotW1` (odd) |

plus `w7B_tied` (the output weight at the whole loss, `∑ₖ pdiv (crossEntropy ∘ dense ∘ a6ₖ)`),
`CnnFoldB.w5B_tied`'s proof verbatim. The three conv-back identifications need odd kernels
(`IR.conv_back_bridge`), as `dhc1B_slice` does; the node theorems themselves carry none (the
artifact is 3×3). `N` a binder, the artifact `N = 128`.

## 3. Steps

1. **The byte tie first** (half a day). `cifarTrainStepTextB` in `TestSmallNetsBatchedEmit.lean`,
   mirroring `cifarTrainStepText` node for node with the batched peers (`batchOp` lifts of
   `conv`/`relu`/`maxPool`/`dense`/`expe`/`softmaxDiv`, `subB`, `selectPosB`, `maxPoolBackB`,
   `convBackP` at both spatial scales, the four `*SgdB` kinds); diff against the committed
   writer's output at the committed shapes (B = 128; 3→32→32 @ 32², pool, 64→64 @ 16², pool,
   4096→512→512→10; 3×3). If a line differs, the batched reading is dishonest there and the
   descriptor needs the cifar spelling — this is the risk, and it is found on day one. The CNN
   writer needed one new descriptor (`convBackP`); cifar's conv backs are the same spelling at
   two scales, so the expectation is zero new ops.
2. **`CifarFoldB.lean`** (a day). Shorthands and `_slice` lemmas for the twelve forward values;
   `cotB_slice`; the seven chain nodes and their slice lemmas (five are `CnnFoldB`'s proofs with
   the names changed; `dhc2B_slice` is new: pool-back of a conv-back, `cifarChainCotW2`'s shape —
   `maxPoolBackB`'s slice lemma composed with `convBackP`'s); the fourteen `*SgdTiedB_holds`;
   `w7B_tied`; the capstone.
3. **Registration** (an hour): lakefile `Certs` root, `AuditAxioms` import and pins (`dhc2B_slice`,
   `dhc3B_slice`, `w7B_tied`, `cifar_train_step_tiedB`), the `certs.yml` row, the comparator tier
   (`gen_comparator_tier.py` then `book_counts.py`), `tests/README.md` if the batched-emit test
   grows a fourth row.
4. **Book** (an hour): `thm:cifar_fold` gains `Proofs.CifarFoldB.cifar_train_step_tiedB` and
   `w7B_tied`, its `\Prove{}` becomes the batched reading (as `thm:cnn_fold`'s: "at a batch of N
   examples each update denotes θ − α Σₖ …, the output weight at the whole loss"), the one-example
   clause goes, the proof's `\leandocref` points at the B theorem; then the four-step regen
   (`lean_decls`, checkdecls, `blueprint_uses.py --fix`, the ch 4 depgraph). The lead-in sentence
   of chapter 4's ladder does not change.

## 4. Not in scope

* `cifar_net_lossGrad` (`CifarParamGrad`) is also per-example and stated at the un-fused `*Grad`
  nodes no two-conv artifact emits (the check's §3 note on `thm:cifar_loss_grad`); a batched
  loss gradient is a separate item and would follow the ResNet pattern (`GradNodesBAt`), not this
  file's.
* The eight-conv nets (`cifar8_*`, `cifar8Bbn`) are already batched (`Cifar8TieG` at the un-fused
  nodes, `Cifar8BbnTieB`).
* The BN two-conv net (`thm:cifar_bn_fold`, `bnSgdPairTied_holds`) is a per-channel statement at
  any shape; nothing to batch.

## 5. Gates

`lake build Certs` (the new root), `lake env lean tests/TestSmallNetsBatchedEmit.lean` (four diffs
clean), `lake test -- --audit` (three axioms on the four pins), `book_counts.py` (the comparator
tier), `blueprint_uses.py --check`, and the chapter 4 depgraph regenerated.
