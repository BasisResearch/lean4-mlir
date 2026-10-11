# recipe_prep.md — every ImageNet chapter's `[TODO: …]` marker ready to run

Started 2026-10-11. The ch 5–9 markers (`blueprint/src/content.tex`, one bold `[TODO: what is still out;
the job that closes it.]` after each side-by-side table) are the contract: each names the recipe items a
pair still owes its paper and the confs that pay them. This doc is the code plan for closing every one
of them *in code*, in cost order, so that whichever box frees next has its run ready. The runs
themselves go in the user's ROI order (ResNet → ViT → MNv2 → EfficientNet → ConvNeXt) and each needs
the user's word. `imagenet_parity.md` §10 holds the F-items (cross-net) and D-items (per-net) this doc
cites; the method is the ResNet A3/A2 prep of 2026-10-11 (4d612bb9), repeated per net.

## 1. Done, 2026-10-11

| chapter | state | commit |
|---|---|---|
| ch 5 ResNet R34, R50-2018 | fp32 rescore paid the markers; R34's deleted; McNemar paired | 8a659b2f, 5be4f349 |
| ch 5 ResNet A3, A2, A1 | timm's recipe on both paths (F1 / F3 / F4 / F5 / F8), gated, smoked; runs pending | 4d612bb9 |
| ch 9 ViT-Ti | DeiT as timm runs it on both paths, dp256x4 no-clip render, smoked; runs pending | 320f5045, 3336f4a7 |

What "done" means, per net, and what each later section repeats:

1. **Flags on the JAX config.** `TrainConfig` (`LeanMlir/Types.lean`) carries `mixSwitchProb`,
   `schedPerEpoch` + `warmupLRInit`, `minLR` (the per-step cosine takes it too), `randAugmentFillMean`,
   `repeatedAugAdjacent`, `emaWarmup`, `evalF32`, `gradClipNorm`, `gradAccumSteps`, `wdExcludeNormBias`,
   `cropTorchvision`, `randAugmentInc`, `geluExact`, `bnMomentum`, `bceTargetThresh`. A net whose marker
   is covered by these needs config lines, a re-emit (`scripts/regen_jax_generated.sh write`, then
   `sync`), and nothing in the emitter.
2. **The verified half.** The shim is emitted from the same config, so augmentation items ride for
   free. The driver (`LeanMlir/Verified/Train.lean`, `trainAdamSched`) takes `schedPerEpoch` /
   `warmupLRInit` / `minLR` / `emaWarmup` as arguments the net's app passes. Anything in the *graph* —
   accumulation, the clip, resolution, an optimizer rule, padding — is a render (`LeanMlir/Proofs/Codegen/
   *RenderB.lean`, a `#eval` + `#guard`, the GELU twin where the net has one, `MANIFEST.md`,
   `.github/workflows/proofs.yml`'s diff list, `scripts/regen_verified_mlir.sh` rows) and, where the
   change moves what a tie proves, proof work.
3. **Confs.** Fresh checkpoint lineages for a rerun, a grep per new emitted line (the ViT and A3 confs are
   the templates), and the verified conf appending `LEAN_MLIR_DUMP_CORRECT=$RUNDIR/bitmaps/<tag>` in
   PRECHECK, so the run writes per-epoch bitmaps and the McNemar pairing is free.
4. **Gates.** `sched_timm_gate.py --trainer <py>` (per-epoch form against timm 1.0.28),
   `repeated_aug_gate.py --script <shim>` (control synthesized from the flagged shim),
   `aug_bicubic_pil_check.py <shim>` (fill), the shim hash under `SHIM_DETERMINISM=1` at two seeds,
   `comment_numbers.py`, `regen_jax_generated.sh check` (every other artifact byte-identical),
   `regen_verified_mlir.sh check` after a render, `DRY_RUN=1 scripts/supervise.sh <conf>` for each conf.
5. **Smokes.** JAX: the trainer with `steps_per_epoch` patched short, two or three validations read for
   the epoch rates and the `eval: f32 forward` line. Verified: `ONCE=1 LEAN_MLIR_MAX_STEPS=400
   LEAN_MLIR_PROBE_WARM=200 RUNDIR=<dir> scripts/supervise.sh <conf>` for the ms/step and the schedule
   banner; delete any checkpoint the smoke leaves under the new tag.
6. **After the pair lands.** Score the reference post hoc through `jax/scripts/eval_full50k.py`
   (`EVAL_DTYPE=f32`, `DUMP_CORRECT`, `PROTOCOL=timm` for D18), pair with the verified bitmap through
   `scripts/demos/mcnemar.py`, update the chapter, delete the marker.

## 2. Order and cost

| step | net | code | new in the emitter / renders | decision needed |
|---|---|---|---|---|
| 1 | ViT-S, ViT-B (ch 9 side quest) | ½ day | two no-clip renders | ViT-S micro-batch |
| 2 | ConvNeXt-T, then S / B (ch 8) | 1½ days | accumulating no-clip renders | none |
| 3 | MNv4-Conv-M (ch 6) | 1 day | a 256² render | D7, the timm tag |
| 4 | MNv2 (ch 6) | 2–3 days | decay mask, colour distortion, RMSProp op + tie, an init | D12's reference |
| 5 | EfficientNet-B0 (ch 7) | 3–4 days | RMSProp op (shared), SAME padding through the ties | D3's scope |

About two weeks of code against about two weeks of ResNet and ViT runs on the two boxes. Each step
ends in one commit per net (code + confs + smokes), the chapter untouched until its pair lands.

## 3. ViT-S and ViT-B — "as Tiny's"

Marker (ch 9, after the S/B table): as Tiny's; neither has run — `vits-default-jax-4gpu` /
`vits-default-emabf16-4gpu`, `vitb-accum-jax-4gpu` / `vitb-default-emabf16-4gpu`.

Today (`jax/MainVitSImagenet.lean`, `jax/MainVitBImagenet.lean`): batch 512, lr 5e-4, clip 1.0, minLR
1e-5, repeated aug 3, EMA; none of Tiny's flags. Renders on file: `vit{s,b}in_emadp128x4wxclipdrop
eps0000001{erf,}bf16` (4×128, clip on).

1. Configs: Tiny's lines verbatim — `batchSize 1024`, `learningRate 0.001` (DeiT's 5e-4·1024/512),
   `gradClipNorm 0.0`, `schedPerEpoch true`, `warmupLRInit 0.000001`, `mixSwitchProb 0.5`,
   `randAugmentFillMean true`, `repeatedAugAdjacent true`, `emaWarmup false`, `evalF32 true`; minLR 1e-5
   stays (DeiT's). ViT-B: DeiT-B is 8×128 = 1024; here 4×128 with `gradAccumSteps 2`, exact under
   LayerNorm (`vitb-accum-jax-4gpu` already does the accumulation; keep it).
2. Verified: the apps pass `(emaWarmup := false) (schedPerEpoch := true) (warmupLRInit := 0.000001)` as
   Tiny's does; `batchSize` per replica 256 for S if it fits, else 128 with accumulation 2.
   Renders: `vitsin_emadp256x4wxdropeps0000001{erf,}bf16` (or `…acc2dp128x4…`) and
   `vitbin_emaacc2dp128x4wxdropeps0000001{erf,}bf16`, from `ViTRenderB.lean` as Tiny's were. Checked
   2026-10-11: the ViT renderer has NO accumulation form (R50's `OptRecipe.lambAccum` is LAMB-only;
   `ViTRenderB.lean`:902 notes B fits the arena at global 512 without one). An AdamW accumulation
   recipe in `OptRecipe` + the renderer is the one real piece of code here, shared with §4 — unless
   ViT-S at 4×256 fits and ViT-B is run at 2× accumulation on the JAX side only, disclosed.
3. Decision: ViT-S at 4×256 — a memory probe (`LEAN_MLIR_MEM_FRACTION` 0.90–0.97) before the render
   is chosen. Measure both halves' ms/step; the 10-05 ETAs (`side_quest_etas_measured`) predate every
   flag.
4. Confs: four, on the Tiny confs' grep blocks; new checkpoint names.
5. Still out, disclosed, all three ViTs: the patch-embedding bias at PyTorch's default (small; do it
   here if the ViT renders move anyway, since it is a render change).
6. Runs: ~S and ~B ETAs on file are 10-05 probes; re-probe. The ch 9 side-quest marker goes when both
   pairs land.

## 4. ConvNeXt-T, then S and B — the official recipe in four places

Marker (ch 8): batch 4096 (accumulated 16× at 256, exact without BatchNorm), no gradient clip, Mixup or
CutMix drawn per batch, torchvision's crop; plus the exact erf GELU, the cosine floor at 1e-6,
RandAugment's fill at the image mean, and scoring at timm's 288 / 1.0. The EMA pair has not run —
`cnx-default-jax-4gpu` / `cnx-default-emabf16-4gpu`, ~77 + 107 h. S/B: as T's.

Today (`jax/MainConvNeXtImagenet.lean`): batch 256 (4×64, no accumulation), lr 2.5e-4 (the 4096 rate
scaled down), warmup 20, clip 1.0, drop-path 0.1, EMA, `cropTorchvision`, `randAugmentInc`, erf GELU
(D1, landed 2026-10-06); no minLR, no switch, no fill, no f32 eval. Renders: `convnext{,s,b}in_
emadpwxclipdrop{erf,}bf16` (clip on, no accumulation).

1. Config: `gradAccumSteps 16` with `learningRate 0.004` (the official rate at 4096), `gradClipNorm 0.0`,
   `mixSwitchProb 0.5`, `minLR 0.000001` (the per-step cosine takes the floor, `Codegen.lean`
   `cosLine`), `randAugmentFillMean true`, `evalF32 true`. The schedule stays per step: the official
   ConvNeXt trainer builds its cosine per iteration, not timm's per-epoch form (verify
   `warmup_start_lr` in `main.py` before setting `warmupLRInit`). `emaWarmup`: the official EMA is
   timm's `ModelEmaV2`, constant decay — `emaWarmup false`.
2. Verified: the app passes `(emaWarmup := false)` and `minLR`; renders `convnextin_emaacc16dpwxdrop
   erfbf16` + tanh twin (accumulation 16 at 4×64 = 4096; no clip) — the first accumulating ConvNeXt
   render. Checked 2026-10-11: `ConvNeXtRenderB.lean` has no accumulation form either; the AdamW
   accumulation recipe of §3.2 is the prerequisite (M), after which S and B follow the same way
   (`convnextsin_…`, `convnextbin_…`), four more artifacts.
3. D15: the T reference on file (81.53) is pre-C6; this rerun replaces both halves, so the pair is
   one-axis again. D18: `PROTOCOL=timm` on the JAX scorer; the verified half's 288 renders exist
   (`convnext{,s,b}in_fwd_s288.mlir`, checked 2026-10-11).
4. Gates: fill and hash on the three shims; `regen_verified_mlir.sh check` (GELU twins). The schedule
   gate does not apply (per step).
5. Confs: six; `LEAN_MLIR_DUMP_CORRECT` appended in the three verified prechecks.
6. Runs: T ~77 + 107 h (10-07 re-probe), S and B larger; the ch 8 marker goes when T lands, the S/B
   marker when both land.

## 5. MobileNetV4-Conv-M — the paper's tier, and what is still out of it

Marker (ch 6): the paper's tier — 500 epochs, wd 0.1, dropout 0.2, RandAugment m15 at p 0.7, drop-path
0.075 — exists on both paths and has not run: `mnv4-full-jax-4gpu` / `mnv4-full-4gpu`, ~112 + 95 h.
Still out of it: the paper's 256² (ours 224), timm's inc1 magnitude mappings, BN decay 0.9, the
drop-path ramp over all 23 blocks, the verified depthwise init; and both tiers scored at timm's 256 / 1.0.

Today (`jax/MainMobilenetV4Imagenet.lean`): `Full` = 500 epochs, dropout 0.2, RA m15, drop-path 0.075,
no EMA, on the base's lr 4e-3 at 512×8 = 4096, warmup 5, `cropTorchvision`, f32 head; the base has
no `randAugmentInc`, BN decay 0.99.

1. Config (`Full`): `trainRes 256` + `testCropRatio`/size per the tag; `randAugmentInc true` (D8);
   `bnMomentum 0.9` (D9, eval only); the drop-path ramp over all 23 blocks (D10: the per-block rate is
   computed on the host for both paths — `Spec`/driver, not the render); `evalF32 true`;
   `mixSwitchProb` if the tier mixes (check timm's `ra4` hparams); `randAugmentFillMean true`.
2. D7 decision: RandAugment m15 — TF extrapolates past 10, the pinned timm clamps; the book's tier
   says m15, so the emitter's extrapolation stands unless the user prefers timm's clamp. Say which.
3. The timm tag: `jax/timm_eval_protocols.json` has one MNv4 row, `mobilenetv4_conv_medium.e500_
   r224_in1k` (train 224, test 256 / 1.0); the marker's "the paper's 256²" is the `…e500_r256_in1k` tag,
   whose protocol is not in the table — look it up from the pinned timm, pin which tag the tier
   reproduces, and the train and eval render sizes follow.
4. Verified: D4 (depthwise fan-in init) landed 2026-10-07 and the rerun picks it up; a 256² render
   `mobilenetv4in256_…` from `MobileNetV4Render*` (the R50 160² render is the template: a second
   resolution of the same spec, eval render at the test size), plus the `_fwd_eval_s<S>` for D18.
5. Gates: fill, hash, `comment_numbers`; `mnv4_timm_parity.py` must stay green at 224 (the parity
   gate's resolution) — the 256 render is a new artifact, not a change to the 224 one.
6. Runs: ~112 + 95 h (10-07); the ch 6 MNv4 marker goes when the pair lands and both tiers are rescored
   at timm's protocol.

## 6. MobileNetV2 — TF-slim in three places

Marker (ch 6): TF-slim in three places, on both paths: weight decay off the depthwise kernels, slim's
Inception colour distortion, RMSProp's learning rate inside the momentum term; slim's truncated-normal
initialization (σ 0.09) against He-uniform; and the pair predates the depthwise fan-in init on the
verified path, the suspect for its −0.51. One rerun of both halves takes all of it —
`mnv2-full-jax-4gpu` / `mnv2-default-4gpu`, ~38 + 66 h. The sixteen workers of 96 stay 4×64.

Today (`jax/MainMobilenetV2Imagenet.lean`): lr 0.045 at 256, RMSProp, `wdExcludeNormBias`, dropout
0.2, no warmup, BN decay 0.997, no AutoAugment, f32 head. Nothing here is a flag yet.

1. D11, weight decay off the depthwise kernels: a per-tensor decay mask. JAX: a flag
   (`wdExcludeDepthwise`) extending the norm/bias skip-list by kernel shape. Verified: the decay is in
   the optimizer step of the render, so a variant (`wxdw`) whose per-tensor wd vector zeroes the
   depthwise slots — `OptRecipe` already carries `wx` (norm/bias off); extend the mask builder. M.
2. D12, slim's Inception colour distortion: `inception_preprocessing.distort_color` (fast mode:
   brightness 32/255, saturation 0.5–1.5, hue 0.2, contrast 0.5–1.5, two op orders) in the shared
   `emitDataLoading`, so the trainer and the shim get it together; a flag (`colorDistortSlim`). The
   reference is unverified offline — a gate against a slim transcript needs TF-slim in `.venv-timm`
   or a hand-rolled numpy twin; decide which. M.
3. D13, RMSProp's learning rate inside the momentum term (TF1: `mom = μ·mom + lr·g/√(v+ε)`,
   `w −= mom`; ours applies lr outside). JAX: a flag on the emitted update. Verified: a new optimizer
   op spelling (`rmspropTf`) with its `opt_step_tie` row and T3 tie; it differs only while lr moves,
   so the Imagenette twin at constant lr cannot catch a wrong placement — the tie must. M; shared
   with B0 (§7).
4. Slim's truncated-normal init σ 0.09 on the convolutions against He-uniform: an init kind on both
   paths (`VerifiedConfig` has kinds 1–7; add 8), JAX a flag. S.
5. D4 landed 2026-10-07; the rerun picks it up. `evalF32 true`, `bnMomentum` as slim (0.997 stays).
6. Gates: `mnv2_timm_parity.py --controls` stays green (forward unchanged); `opt_step_tie.py` gains the
   TF-RMSProp row; a colour-distortion known-answer gate; fill n/a (no RandAugment).
7. Runs: ~38 + 66 h; the ch 6 MNv2 marker goes when the pair lands.

## 7. EfficientNet-B0 — the final pair

Marker (ch 7): the final pair — the staircase floored on the global step from step 0, no decay on BN or
biases, drop-connect 0.2·i/16, BN ε 1e-3, AutoAugment v0 with bicubic geometry, TensorFlow's crop
sampler without its centre-crop fallback, the fp32 classifier head, synchronised BatchNorm,
TensorFlow's classifier init U(±1/√1000) with the depthwise and squeeze-excite fan inits, RMSProp's
learning rate inside the momentum term, and SAME padding on the strided depthwise convolutions, which
moves the T2/T3 ties; `enet-full-jax-4gpu` / `enet-default-4gpu`, ~47 + 80 h.

Today (`jax/MainEfficientNetImagenet.lean`): RMSProp lr 0.016 at 256, `wdExcludeNormBias`, dropout
0.2, drop-path 0.2, AutoAugment, EMA, f32 head, clip 0; BN ε 1e-3 and the bicubic v0 geometry landed
with X1; the sync-BN render exists (`imagenet_syncbn_probe`); D4 / D5 (depthwise and SE fan inits)
landed 2026-10-07. Of the marker's list, owed in code:

1. TF's crop sampler without its centre-crop fallback: the emitted `sample_distorted_bounding_box`
   path keeps TF's fallback today; a flag that drops it (TF's reference uses `max_attempts 100` and no
   fallback? — read `preprocessing.py` first; the fallback may be TF's own). S once pinned.
2. D6, the classifier init U(±1/√1000): an init kind for the head on both paths. S.
3. D13, RMSProp's rate inside the momentum: §6.3, the same op. Shared.
4. The staircase floored on the global step from step 0 and drop-connect 0.2·i/16: check the emitted
   `expStaircase` / `dropPath` ramp against the TF reference's `global_step` arithmetic; likely
   already right (they are in the pair's recipe, not the "owed" sentence of 3bc91118) — confirm, and
   list here as "verified, no change" or as an item.
5. D3, SAME padding on the strided depthwise convolutions (TF) against our symmetric padding:
   `enet_timm_parity --pad tf` puts it at 0.37 / 0.048 of the logit scale. JAX: a flag on the conv
   emit (S). Verified: the render's padded conv op and the T2 / T3 ties that are stated on the
   symmetric form — the padding changes the function, so the tie moves to the TF-padded spelling:
   a new op or a padding argument on the existing one, its VJP, the fold lemmas for the asymmetric
   case, and the whole-net tie re-pointed. M–L; parked 2026-09-25 for this reason. This is the one
   item in the five chapters that is proof work, and it decides whether B0's pair is "the paper's" or
   "the paper's at symmetric padding, disclosed".
6. `evalF32 true`; `mixSwitchProb` n/a (B0 has no Mixup); fill n/a (AutoAugment's fill is X1's).
7. Gates: `enet_timm_parity.py --controls` (the `--pad tf` control becomes the pass once D3 lands),
   `opt_step_tie.py` (TF-RMSProp), `crop_sampler_gate.py` for the sampler, hash.
8. Decision: do D3 now (the pair is "the paper's", ~2 days of proofs) or run the pair at symmetric
   padding with the marker keeping that one clause. The user's call before §7 starts.

## 8. What this does not cover

* The runs' order and boxes (`imagenet_parity.md` §10.4): A3 pair first, ViT-Ti, then A2, MNv2 … as
  boxes free; every launch is the user's word.
* The 2018 R50 pair's McNemar p 0.015 — a seeds-per-arm question, not a marker.
* timm's `cooldown_epochs 10` on the RSB tiers — disclosed in the configs, not reproduced.
* The Imagenette twins: nothing here changes a chapter's Imagenette number.

## 9. Status

| net | config | verified driver | render | confs | gates | smokes | commit | run | marker |
|---|---|---|---|---|---|---|---|---|---|
| R34, R50-2018 | — | — | — | — | — | — | 8a659b2f, 5be4f349 | landed | R34 deleted; 2018 paid |
| R50 A3 / A2 / A1 | done | done | existing | done | green | done | 4d612bb9 | pending | stands until the runs |
| ViT-Ti | done | done | done | done | green | done | 320f5045, 3336f4a7 | pending | stands |
| ViT-S / B | | | | | | | | | |
| ConvNeXt-T / S / B | | | | | | | | | |
| MNv4-Conv-M | | | | | | | | | |
| MNv2 | | | | | | | | | |
| EfficientNet-B0 | | | | | | | | | |
