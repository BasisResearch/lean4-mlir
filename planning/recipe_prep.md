# recipe_prep.md — every ImageNet chapter's `[TODO: …]` marker ready to run

Started 2026-10-11. The ch 5–9 markers (`blueprint/src/content.tex`, one bold `[TODO: what is still out;
the job that closes it.]` after each side-by-side table) are the contract: each names the recipe items a
pair still owes its paper and the confs that pay them. This doc is the code plan for closing every one
of them *in code*, in cost order, so that whichever box frees next has its run ready. The runs
themselves go in the user's ROI order (ResNet → ViT → MNv2 → EfficientNet → ConvNeXt) and each needs
the user's word. `imagenet_parity.md` §10 holds the F-items (cross-net) and D-items (per-net) this doc
cites; the method is the ResNet A3/A2 prep of 2026-10-11 (4d612bb9), repeated per net.

**Next (2026-10-12, later): §5, MobileNetV4-Conv-M.** §1–§4 are in code (§9); nothing has run. §5
opens on two decisions the user owns (D7, the m15 extrapolation; the timm tag the tier reproduces),
then a 256² render. Then §6 → §7 in the order of §2.

## 1. Done, 2026-10-11

| chapter | state | commit |
|---|---|---|
| ch 5 ResNet R34, R50-2018 | fp32 rescore paid the markers; R34's deleted; McNemar paired | 8a659b2f, 5be4f349 |
| ch 5 ResNet A3, A2, A1 | timm's recipe on both paths (F1 / F3 / F4 / F5 / F8), gated, smoked; runs pending | 4d612bb9 |
| ch 9 ViT-Ti | DeiT as timm runs it on both paths, dp256x4 no-clip render, smoked; runs pending | 320f5045, 3336f4a7 |
| ch 9 ViT-S, ViT-B | Tiny's recipe at both widths; S one-shot 4 × 256, B the first `acc` render; both JAX refs accumulate; smoked (§3) | a39f5cf7 |

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
| 1 | ViT-S, ViT-B (ch 9 side quest) | ½ day — DONE 2026-10-11 | S one-shot at 4 × 256; B the first accumulating ViT render (`acc`) | ViT-S micro-batch — probed: one-shot |
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

**Done 2026-10-11.** The decision in 3 went to a probe before any render was chosen: ViT-S at 4 × 256
peaks at 10.75 GiB of the 11.68 GiB default arena and executes (587 ms a step, bare device at 4
replicas, `runs/2026-10-11-vits-default-emabf16-4gpu/device_probe.log`), so S is one-shot as Tiny is and
the S conf keeps its "no `LEAN_MLIR_MEM_FRACTION`" rule. B is the accumulating one: `vitAdamVariant` and
`vitAdamTrainStepText` (`ViTRender.lean`) take `acc`, trailing and defaulted to 1 (every committed ViT
artifact re-renders byte-identical), and at `acc > 1` hand the per-parameter tail to RenderKit's
`optOne (.adamwAccum k)` with `optConstsB`'s `%aup`-computed β block and `packedTrainSig`'s `G` region —
the "one real piece of code" of 2, ~40 lines, and the same `acc` serves ConvNeXt's writer in §4 (its
`cnxAdamVariant` derives the entry name, so the marker goes through that). The clip is refused in
composition (the reference clips the accumulated mean; `optAllParams`'s `accIn` route would be needed,
and DeiT does not clip). Renders: `vitsin_emadp256x4wxdropeps0000001{erf,}bf16`,
`vitbin_emaaccdp2x128x4wxdropeps0000001{erf,}bf16`, each with its eval forward (S at B = 256 as Tiny's,
B at its 32) and `#guard`s on the spelling; B's probe 13.83 GiB of 15.11 at 0.97 and 813 ms a 512-row
micro-batch (`runs/2026-10-11-vitb-default-emabf16-4gpu/device_probe.log`). `tests/TestVitEmaDropRender`
accepts the five-region layout; `TestVariantPredicates` pins the spelling (k from the FIRST `x`) and
106 / 53 GELU-form pairs. JAX: Tiny's lines verbatim on both configs, and BOTH references accumulate,
`vit{S,B}ImagenetConfigAccum` = 512 × 2 — the JAX ViT-S trainer at the one-shot 4 × 256 dies
RESOURCE_EXHAUSTED at the default arena (12.08 GiB asked) and at 0.97 (14.32), where the verified render
of the same step fits the default; the two compilers lay the backward out differently, and under LayerNorm
the pair is one function either way. So the JAX S conf is `vits-accum-jax-4gpu` (renamed; the marker
and §9.6's conf names follow), `vitb-accum-jax-4gpu` keeps its name at 512 × 2, and both JAX confs raise
`XLA_PYTHON_CLIENT_MEM_FRACTION` where their smoke needed it. Confs: the four, on the Ti confs' blocks,
fresh lineages, bitmaps appended. Gates and smokes per §1.4–1.5 (`imagenet_parity.md` §10.4 has the
numbers). Item 5 (the patch-embed bias) stays out, disclosed.

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
   render. The AdamW accumulation recipe of §3.2 now exists on ViT (a39f5cf7) and is a copy here —
   see the hand-off below; after T, S and B follow the same way (`convnextsin_…`, `convnextbin_…`),
   four more artifacts.
3. D15: the T reference on file (81.53) is pre-C6; this rerun replaces both halves, so the pair is
   one-axis again. D18: `PROTOCOL=timm` on the JAX scorer; the verified half's 288 renders exist
   (`convnext{,s,b}in_fwd_s288.mlir`, checked 2026-10-11).
4. Gates: fill and hash on the three shims; `regen_verified_mlir.sh check` (GELU twins). The schedule
   gate does not apply (per step).
5. Confs: six; `LEAN_MLIR_DUMP_CORRECT` appended in the three verified prechecks.
6. Runs: T ~77 + 107 h (10-07 re-probe), S and B larger; the ch 8 marker goes when T lands, the S/B
   marker when both land.

**Done 2026-10-12.** The official values were read off facebookresearch/ConvNeXt `main.py` and `utils.py`
before anything was set: `--lr 4e-3` at 4096, `--min_lr 1e-6`, `--warmup_epochs 20` ramped PER ITERATION from
`cosine_scheduler`'s `start_warmup_value = 0` (so item 1's question is answered: `warmupLRInit` stays 0 and
the schedule stays the emitter's per-step form — this is not timm's per-epoch scheduler), `--clip_grad None`,
`--mixup_switch_prob 0.5` at `--mixup_mode batch`, timm's `ModelEma` at `--model_ema_decay 0.9999` (constant;
`emaWarmup false`), `--model_ema_eval`. Renderer: `cnxAdamVariant` and `convNextAdamTrainStepText` take `acc`
(trailing, default 1; every committed ConvNeXt artifact re-renders byte-identical) and spell it into the
entry — `emaaccdp16xwxdroperfbf16`, `acc` after `ema`, `dp` inside, `16x` before `wx` (the driver's `accK`
ends at the FIRST `x`, so `wx`'s cannot reach it; `TestVariantPredicates` pins `accK = 16`) — routing the
tail through `optOne (.adamwAccum 16)`, the `G` region, `%aup` / `%akeep`, `optConstsB`'s `1/16` and a
`packedTrainSig (acc := true)`; clip ∧ acc refused as on ViT. Six renders, DP only: `convnext{,s,b}in_
emaaccdp16xwxdrop{erf,}bf16` (937 / 1,765 / 1,765 operands = 2 + 5 × P + 7 + masks), no new forwards
(the driver opens `<slug>_erf_fwd` at 64 by name). Probed bare-device at 4 replicas: T 4.46 GiB / 194 ms a
256-row micro-batch, S 7.21 / 300 ms, B 10.42 / 462 ms at 0.90 — the accumulation is the recipe's, not
memory's. JAX: `convNeXt{Tiny,S,B}ImagenetConfig` carry `gradAccumSteps 16`, `learningRate 0.004`,
`gradClipNorm 0`, `minLR`, `mixSwitchProb`, `randAugmentFillMean`, `evalF32`, `emaWarmup false`; S and B's
legacy `accum` / `bs512` recipes are deleted with their eight generated files (batch-256 shapes that would
have inherited the 4096 rate). Apps: `(minLR := 0.000001) (emaWarmup := false)`, the rate defaulting to
4e-3 on an `acc` variant. Confs: the three verified ones rewritten standalone on the ViT-B template
(`cnx-default-emabf16-4gpu` used to source `cnx-default-4gpu`, which asserts the batch-256 rate) with
`LEAN_MLIR_G2_STEPS=4992` (trap 1: 5,004 mod 16 = 12; = the reference's 312 steps × 16, the same
1,277,952 images) asserted together with its divisibility, `LEAN_MLIR_BASE_LR_U=4000`, the render / shim /
app greps and the bitmaps; the three JAX ones on fresh lineages (`~/cnx_{t,s,b}_jax_2611/`) with a grep
per emitted recipe line. Trap 2 bit once: the JAX ConvNeXt-B trainer trains at the default arena but its
f32 VALIDATION dies RESOURCE_EXHAUSTED (7.46 GiB in `jit_eval_batch` — `evalF32`'s cost, where the one-shot
trainer validated in bf16), so `cnxb-default-jax-4gpu` carries `XLA_PYTHON_CLIENT_MEM_FRACTION=0.97` in
`ENV_EXTRA` and asserts it; T and S validate at the default. Smokes (`runs/2026-10-12-cnx{,s,b}-jax-smoke/`,
two 25-step epochs each, the warmup reading 2e-4 then 4e-4 as the per-step ramp has it, the f32 eval line
before every validation): JAX 2.83 / 3.96 / 5.63 s a 4096-row step = 177 / 247 / 352 ms a micro-batch →
~76 / ~106 / ~151 h; verified (`runs/2026-10-12-cnx{,s,b}-default-emabf16-4gpu/`, the driver's `k = 16 …
4992 micro-batches/epoch = 312 updates/epoch` banner, the floor and the constant decay in its schedule
line): 242 / 323 / 491 ms a micro-step → ~109 / ~144 / ~219 h. Gates per §1.4 (`imagenet_parity.md`
§10.4 has the list; the schedule gate is n/a per step, and `mixup_gate.py`'s "inert when off" leg cannot
run on a shim whose mixing is on by default — the `SHIM_HASH` was taken directly: reproducible at seed 0,
distinct at seed 1). Disclosed, not a recipe item: Mixup's λ granularity (JAX once per 4096, the shim once
per 256, the official trainer once per 128). Found on the way: ViT-B's `emaaccdp2x128x4wxdropbf16` was in
`TestVariantPredicates`' table but not its `accumSpellings` since a39f5cf7 (red on the unpushed branch);
fixed. The ch 8 markers stand; the S/B "what is queued" paragraph names the new renders.

**Hand-off from §3 (2026-10-12) — what §4 inherits and the order to do it in.**

* *The accumulation form.* `ViTRender.lean`'s `vitAdamTrainStepText (acc : Nat := 1)` is the template:
  `opt := if acc > 1 then .adamwAccum acc else .adamw`, `optOne opt …` per parameter with the fifth
  return (`nA`) collected as the `G` region, `packedTrainSig` / `packedTrainRetTys` at `(acc := accOn)`,
  the return list `θ ++ m ++ v ++ G ++ E ++ [loss, bc1, bc2] ++ [aup, akeep] ++ [emad, oemad] ++ masks`,
  the consts `wdzConst … ++ optConstsB opt wdStr` instead of the baked `adamWConsts`, `trainStepHandNote
  (acc := …)`, and `clip ∧ acc` refused (the reference clips the accumulated mean; DeiT and the official
  ConvNeXt recipe do not clip). ConvNeXt's writer has the same shape — `ConvNeXtRender.lean` :996
  (`optOne .adamw`), :1043 (`packedTrainSig (ema := ema)`), :865 (`adamWConsts`) — so it is the same
  edit, PLUS `cnxAdamVariant` (:808) takes `acc` and spells `acc` + `dp` + `<k>x` in the optimizer slot
  (`emaaccdp16xwxdroperfbf16`; `vitAdamVariant` has the spelling and the `#guard`s), because ConvNeXt
  DERIVES its entry name from the variant (route (a) in that file's words) where ViT takes `funcName`.
  Every committed ConvNeXt artifact must re-render byte-identical at `acc = 1` (`regen_verified_mlir.sh
  check`); `vit-ema-drop-render convnextin <variant>` already accepts five regions; `TestVariantPredicates`
  gets the spelling and the GELU-form count (106 → 110 with T's pair; S/B add four more).
* *Trap 1 — the per-epoch micro-batch count.* The driver refuses an epoch whose micro-batch count is
  not a multiple of k (`Train.lean` ~:2100): at 4 × 64, 1,281,167 / 256 = 5,004 micro-batches and
  5,004 mod 16 = 12. Cap with `LEAN_MLIR_G2_STEPS=4992` in the conf (= the JAX trainer's 312 optimizer
  steps × 16; its `steps_per_epoch = train_examples // 4096` drops the same remainder), and grep it in
  the precheck. ViT-B's k = 2 never met this (2,502 is even).
* *Trap 2 — the JAX trainer's arena.* The verified render and the JAX graph of one step do not peak
  alike: ViT-S's render fit the default arena at 4 × 256 while the JAX trainer OOMed at 0.75 AND at
  0.97 (XLA's rematerialisation spends the room it is given), and ViT-B's JAX 512 × 2 OOMed at the
  default. So: smoke the JAX trainer's first step at the shape before writing its ETA, and the conf's
  lever is `ENV_EXTRA=(XLA_PYTHON_CLIENT_MEM_FRACTION=0.97)` + `pc_env` (`vitb-accum-jax-4gpu.conf`).
  ConvNeXt-T at 4 × 64 micro-batches is the shape its JAX trainer already runs, so this should be
  moot for T; check S and B.
* *The method, in order:* probe (`scripts/probes/bf16_peak_memory.py` / `bf16_device_step.py
  --replicas 4` on a scratch render) → renderer `acc` → renders + `#guard`s → proofs.yml list, regen
  rows, `gen_mlir_manifest.py` → JAX config + `regen_jax_generated.sh` write / sync / check → apps →
  confs (fresh lineages, `LEAN_MLIR_DUMP_CORRECT`) → gates (§1.4, schedule gate n/a here) → smokes
  (`ONCE=1 LEAN_MLIR_MAX_STEPS=400 LEAN_MLIR_PROBE_WARM=200`; the JAX three-line patch
  `runs/2026-10-11-vits-jax-smoke/trainer_smoke_accum.patch`) → run records → `docstring-checkrefs`,
  `comment_numbers` (cite the run dir, not the number) → stage. The driver's EMA banner reads
  `emaWarmup` since a39f5cf7, so the smoke log says "constant from step 0" when the app passes it.

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
| ViT-S / B | done | done | done (B: the first `acc` render) | done | green | done | a39f5cf7 | pending | stands |
| ConvNeXt-T / S / B | done | done | done (the first `acc` ConvNeXt renders, six) | done | green | done | — | pending | stands |
| MNv4-Conv-M | NEXT — §5 | | | | | | | | |
| MNv2 | | | | | | | | | |
| EfficientNet-B0 | | | | | | | | | |
