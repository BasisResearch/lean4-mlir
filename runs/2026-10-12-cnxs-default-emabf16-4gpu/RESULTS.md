# ConvNeXt-S verified at the official batch — 16 × (4 × 64), accumulated, no clip — `cnxs-default-emabf16-4gpu`, 2026-10-12, ares

The ConvNeXt pair at the paper's own batch (planning/recipe_prep.md §4; ch 8's marker): `convnextsin_emaaccdp16xwxdroperfbf16`,
the first accumulating ConvNeXt render — `OptRecipe.adamwAccum 16` through `convNextAdamTrainStepText`'s `acc`
(ViT-B's mechanism of 2026-10-11 on this renderer), a fifth `[θ|m|v|G|E]` blob region and the `%aup` / `%akeep`
scalars (1,765 operands = 2 + 5 × 344 + 7 + 36); the driver reads the 16 off the name and applies on every sixteenth micro-batch.
ConvNeXt has no BatchNorm, so sixteen micro-batches of 256 are one batch of 4096 exactly. No clip (`--clip_grad`
None), lr 4e-3 at that batch, min_lr 1e-6 on the per-step cosine, timm's `ModelEma` constant from step 0.

## 1. Does it fit, and what does a micro-batch cost? — the device probe (`device_probe.log`; the script is `runs/2026-10-12-cnx-default-emabf16-4gpu/device_probe.sh`, one run for the three sizes)

Bare device executable at 4 replicas (`scripts/probes/bf16_peak_memory.py`, `bf16_device_step.py`):

| budget | peak | args | temp | of budget | executes |
|---|---|---|---|---|---|
| 11.68 GiB (the default) | **7.21 G** | 0.97 G | 5.30 G | 62 % | ✅ **300.5 ms** a 256-row micro-batch (min 299.7, p10–p90 299.9–301.2, 5 interleaved reps) |

The accumulation is the recipe's, not memory's: the one-shot clip render read 318 ms/step in the trainer on 2026-10-07 (`runs/2026-10-07-d17-reprobe`); its peak was 6.80 GiB. `args` is the five parameter-sized regions — the
accumulator costs one region over the one-shot render's four — and the per-micro-batch cost is the one-shot
step's plus one parameter-sized `momVNextF`. Sixteen micro-batches an optimizer step, 312 optimizer steps =
4,992 micro-batches an epoch (`LEAN_MLIR_G2_STEPS=4992`; 5,004 is not a multiple of 16, and the reference's
`steps_per_epoch = train_examples // 4096` drops the same 12).

## 2. The smoke (`smoke_w4.log`)

One capped window (`ONCE=1 LEAN_MLIR_MAX_STEPS=400 LEAN_MLIR_PROBE_WARM=200`) of the committed render through
`scripts/supervise.sh cnxs-default-emabf16-4gpu` (the script is `runs/2026-10-12-cnx-jax-smoke/run.sh`, after the
three JAX smokes) — the conf's prechecks, ConvNeXt-T's shim at the official-recipe items, the driver's per-step
schedule with the floor, the constant EMA decay and the accumulation cadence. The driver's banners read:

    (cosine→0.000001+warmup 20ep, baseLR 0.004000)
    ▸ EMA: region 4 of 5 [θ|m|v|G|ema], shadow starts AT the weights, decay 0.999900 constant from step 0 (timm ModelEma, as DeiT scores; emaWarmup := false). EVAL AND CHECKPOINT SCORE THE SHADOW. ⚠ It advances on APPLY micro-batches only — once per optimizer step, as the reference does.
    ▸ GRADIENT ACCUMULATION: k = 16, blob region 3 of 5 [θ|m|v|G|ema]. Micro-batch 256 x 16 = EFFECTIVE BATCH 4096. 4992 micro-batches/epoch = 312 updates/epoch

Step 0's loss 7.123226 (ln 1000 = 6.91 plus the label-smoothed, mixed target's entropy). 400 micro-steps =
25 optimizer steps, inside the warmup.

| SHIM_WORKERS | min | median | p90 | mean | starvation (med − min) |
|---|---|---|---|---|---|
| 4 | 320 | **323** | 324 | 322 | 3 ms |

ms per 256-row MICRO-step (the probe counts invokes), median over micro-steps 201–400. Against the bare-device
300.5 ms the trainer adds ~23 ms; the one-shot clip render's 318 ms/step of 2026-10-07 is the one-shot render at the same shape, so the accumulator's
extra region costs nothing visible. An optimizer step of 4096 rows is sixteen of them.

ETA at w4: 4,992 × 0.323 s ≈ 1,612 s of steps + eval/ckpt (~2 min: 782 batches of the B = 64 f32 forward plus the 600 MB checkpoint) ≈ 1,730 s an epoch → 300 epochs in **~144 h** on this box; the conf's `ETA=` carries it. The smoke's
checkpoint under the new tag was deleted.
