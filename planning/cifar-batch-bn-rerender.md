# CIFAR chapter: re-render the eight-conv nets with batch-statistics BatchNorm

Status: plan only (2026-10-19). Nothing here has run. The book text was
corrected the same day to say what the current layer is; this plan is for making
the chapter's measurements be about the layer the chapter is named after.

## Why

The CIFAR-8 "BatchNorm" renders normalize each example on its own: the statistic
is per image and per channel over the 32×32 cells. The batch axis is never
reduced (`cifar8w_bn_*_train_step.mlir` and `cifar8w_bn_fwd.mlir` reduce over
`dimensions = [2, 3]`), there are no running statistics (`runningBN := false` on
`cifar8wBnVerified`, so `bnChannels = #[]`), and train = eval. The math the
chapter proves (`bnForward` on a `Vec n`) holds for any group, so no theorem is
wrong, but every number in §4's experiments — the +5.8 / +4.2 / +1.5 BN deltas,
the 2.5–13× spread reduction, the bf16 table, the head-width sweep — was
measured on per-image normalization, and the chapter's framing (Ioffe & Szegedy,
batch statistics, running stats threaded through `bnChannels`) describes the
layer Chapter 5 uses. The honest fix landed in the prose; the complete fix is to
train the layer the prose describes.

## What changes

1. **Render.** A `cifar8w_bbn_*` family (name to taste; `bbn` = batch BN) from
   `CnnRender.lean`: the same eight-conv net with each BN taking statistics over
   `[0, 2, 3]` — the batched conv-BN stage the ResNet render already emits
   (`bnBatchTensor4`, `PerChannelBN.lean:475`; the batched stage leaf ties
   `cbReluBBack_eq_vjp_backward` / `cbReluStridedBBack_eq_vjp_backward` in
   `ConvBackCertifiedTie`). Three optimizer arms (sgd / mom / adam) as today,
   plus the bf16 twins for the precision table, plus an `_fwd_eval` render that
   reads running statistics (the BN ImageNet nets all have one; the CIFAR net
   has only `cifar8w_bn_fwd.mlir`, which recomputes per-image statistics).
2. **Spec.** `cifar8wBnVerified` (or a sibling) with `runningBN := true`, so the
   derived `bnChannels` threads 8 × 16..32 stat slots and `trainAdamSched` keeps
   the EMA (`bnMomentum`, `Verified/Train.lean:247`). Keep the per-image spec
   under a new slug so the old renders stay reproducible; the book can then
   present per-image normalization as a one-paragraph aside, not the chapter.
3. **Driver.** `apps/cifar/MainCifar8WideBnAblation.lean` currently relies on
   train = eval (its header says so) and evaluates through `@cifar8w_bn_fwd`.
   It needs the eval forward with running stats and the stats threading the
   ImageNet drivers already do (`runResnet34Adam` is the template).
4. **Theorems.** Today's ties are per-example: `Cifar8BnTieG.cifar8Bn_train_step_tiedG`
   (fused, one `x : Tensor3`), `cifar8Bn_net_lossGrad`, `SgdNode.bnSgdPairTied_holds`.
   A batch-statistics tie is the ResNet pattern at CIFAR shape:
   `ResNet34StepTieB` over `Batched.StageLayers` / `BatchSealKit`, i.e. a
   `Cifar8BnStepTieB` stating the 38 gradient nodes at batch `N` with
   `bnBatchTensor4GradInput_eq_backward` (`Batched/BackLinks.lean:68`) at each
   BN. The chapter would then gain the "at batch statistics" rung the budget
   table already credits to Chapter 4 ("BN at batch statistics", row 4) —
   check what that row currently points at. The descent theorem
   (`cifar8_lastConv_sgd_descends`) is for the no-BN net and is unaffected.

## Runs to redo (one 4060 Ti; `timing.txt` has the BN binary at 757 s for 120 epochs)

| artifact | arms | cost |
|---|---|---|
| `runs/2026-09-01-cifar8w-6arm-constlr/` BN half | 3 optimizers × 5 seeds × 40 ep | ~15 × 4.5 min ≈ 70 min |
| `runs/2026-09-01-bnprec-seeds/` (tab:cifar_bf16) | 3 × 5 seeds, bf16 twins | ≈ 70 min |
| head-width sweep (`results.tsv`, cosine, 25 ep) | 10 widths, single runs | ≈ 25 min |
| `fig:cifar_bn_curves` | from the SGD arm above | free |
| `runs/2026-09-01-cifar8w-bn-xla-cuda/` (the §4 transcript) | 1 run, 3 arms | ≈ 13 min |

The no-BN half of every table stands. Expect the BN numbers to move: with
batch statistics the eval forward uses running means, which is the usual source
of the val-accuracy dips the MNv2 chapter sees at full learning rate, so the
"2.5–13× tighter spread" claim in particular needs re-measuring rather than
re-asserting.

## Book text to touch afterwards

- §4 "What BN actually is": drop the per-image paragraph (or shrink it to the
  aside), restore "batch".
- `tab:cifar_optimizers`, `tab:cifar_bf16`, the head-width figure, the BN
  deltas in the lever text, the Recap's "number format is not measurable
  against seed noise" (holds only on the normalized net).
- The transcript in "Run it first" (new log).
- `README.md` CIFAR row (76.3) and `PLATFORMS.md` cifar column; the lakefile
  `cifar` tier wall-clock (currently claimed ~5 min; measured 19).
- Downstream demos that reuse the chapter-4 CNN: the GW demo's `cifarbn` arms
  (`runs/2026-09-11-gw-cifarbn-*`), ArASL, PlantVillage, EuroSAT. They are
  framed as "the chapter-4 CNN", so either they keep the per-image layer (and
  say so) or they rerun. Decide before touching the Bestiary text.

## Open questions

- Keep both layers in the chapter? Per-image normalization at 1,024 cells per
  group is a legitimate variant (InstanceNorm with affine) and the train = eval
  property is pedagogically useful for the step theorems. One option: the
  chapter trains batch BN, and a short "per-image variant" subsection keeps
  today's numbers as a comparison row.
- Batch 128 at 32×32 gives 131,072 cells per channel statistic; the eval-time
  running-stat momentum (0.99 per step, ~100-step memory) is the knob that
  decides how noisy the val curve gets. Match Chapter 5's setting.
- Whether to do the Lean tie before or after the runs. The runs don't need it;
  the chapter's "step tied" claim does.
