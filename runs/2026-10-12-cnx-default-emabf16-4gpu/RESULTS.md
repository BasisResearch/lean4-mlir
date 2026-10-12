# ConvNeXt-T verified at the official batch — 16 × (4 × 64), accumulated, no clip — `cnx-default-emabf16-4gpu`, 2026-10-12, ares

The ConvNeXt pair at the paper's own batch (planning/recipe_prep.md §4; ch 8's marker): `convnextin_emaaccdp16xwxdroperfbf16`,
the first accumulating ConvNeXt render — `OptRecipe.adamwAccum 16` through `convNextAdamTrainStepText`'s `acc`
(ViT-B's mechanism of 2026-10-11 on this renderer), a fifth `[θ|m|v|G|E]` blob region and the `%aup` / `%akeep`
scalars (937 operands = 2 + 5 × 182 + 7 + 18); the driver reads the 16 off the name and applies on every sixteenth micro-batch.
ConvNeXt has no BatchNorm, so sixteen micro-batches of 256 are one batch of 4096 exactly. No clip (`--clip_grad`
None), lr 4e-3 at that batch, min_lr 1e-6 on the per-step cosine, timm's `ModelEma` constant from step 0.

## 1. Does it fit, and what does a micro-batch cost? — the device probe (`device_probe.log`; the script is `runs/2026-10-12-cnx-default-emabf16-4gpu/device_probe.sh`, one run for the three sizes)

Bare device executable at 4 replicas (`scripts/probes/bf16_peak_memory.py`, `bf16_device_step.py`):

| budget | peak | args | temp | of budget | executes |
|---|---|---|---|---|---|
| 11.68 GiB (the default) | **4.46 G** | 0.57 G | 3.36 G | 38 % | ✅ **194.2 ms** a 256-row micro-batch (min 193.5, p10–p90 193.7–194.5, 5 interleaved reps) |

The accumulation is the recipe's, not memory's: the one-shot clip render `convnextin_emadpwxclipdroperfbf16` read 237 ms/step median in the trainer on 2026-09-25 (its conf's header); the 2026-09-17 sweep put the one-shot non-EMA bf16 graph at ~205 ms bare. `args` is the five parameter-sized regions — the
accumulator costs one region over the one-shot render's four — and the per-micro-batch cost is the one-shot
step's plus one parameter-sized `momVNextF`. Sixteen micro-batches an optimizer step, 312 optimizer steps =
4,992 micro-batches an epoch (`LEAN_MLIR_G2_STEPS=4992`; 5,004 is not a multiple of 16, and the reference's
`steps_per_epoch = train_examples // 4096` drops the same 12).

## 2. The smoke (`smoke_w4.log`)

One capped window (`ONCE=1 LEAN_MLIR_MAX_STEPS=400 LEAN_MLIR_PROBE_WARM=200`) of the committed render through
`scripts/supervise.sh cnx-default-emabf16-4gpu` (the script is `runs/2026-10-12-cnx-jax-smoke/run.sh`, after the
three JAX smokes) — the conf's prechecks, ConvNeXt-T's shim at the official-recipe items, the driver's per-step
schedule with the floor, the constant EMA decay and the accumulation cadence. The driver's banners read:

    (cosine→0.000001+warmup 20ep, baseLR 0.004000)
    ▸ EMA: region 4 of 5 [θ|m|v|G|ema], shadow starts AT the weights, decay 0.999900 constant from step 0 (timm ModelEma, as DeiT scores; emaWarmup := false). EVAL AND CHECKPOINT SCORE THE SHADOW. ⚠ It advances on APPLY micro-batches only — once per optimizer step, as the reference does.
    ▸ GRADIENT ACCUMULATION: k = 16, blob region 3 of 5 [θ|m|v|G|ema]. Micro-batch 256 x 16 = EFFECTIVE BATCH 4096. 4992 micro-batches/epoch = 312 updates/epoch

Step 0's loss 7.079387 (ln 1000 = 6.91 plus the label-smoothed, mixed target's entropy). 400 micro-steps =
25 optimizer steps, inside the warmup.

| SHIM_WORKERS | min | median | p90 | mean | starvation (med − min) |
|---|---|---|---|---|---|
| 4 | 222 | **242** | 254 | 242 | 20 ms |

ms per 256-row MICRO-step (the probe counts invokes), median over micro-steps 201–400. Against the bare-device
194.2 ms the trainer adds ~48 ms; the one-shot clip render's 237 ms/step median of 2026-09-25 is the one-shot render at the same shape, so the accumulator's
extra region costs nothing visible. An optimizer step of 4096 rows is sixteen of them.

ETA at w4: 4,992 × 0.242 s ≈ 1,208 s of steps + ~105 s eval/ckpt (the one-shot run's measured overhead, `cnx-default-4gpu.conf`) ≈ 1,313 s an epoch → 300 epochs in **~109 h** on this box; the conf's `ETA=` carries it. The smoke's
checkpoint under the new tag was deleted.
