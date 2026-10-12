# MobileNetV4-Conv-M verified smoke at the paper's own config, 256² — 2026-10-12, ares (4× 4060 Ti)

`mnv4-full-4gpu` through the supervisor (`ONCE=1 LEAN_MLIR_MAX_STEPS=400 LEAN_MLIR_PROBE_WARM=200`,
`smoke_w4.log`; the prechecks, the `full` shim, the driver's banners), the first run of the `mnv4in256`
render `accdp8x128wxdropdowd01bf16` (planning/recipe_prep.md §5: the paper tier as tensorflow/models'
`imagenet_mobilenetv4_conv_medium_tpu.yaml` has it — 256², 4 × 128 × k = 8 at AdamW 4e-3 / ε 1e-7, wd 0.1
off norm/bias, BN ε 1e-3 baked and decay 0.997 on the host, tf-models' cosine from step 0, drop-path over
the 25-entry ramp, dropout 0.2, the m15 shim under TF's mappings, no EMA, bf16). The smoke's checkpoint
under the new slug was deleted afterwards; the run's bitmaps dir is created by the precheck.

## Memory

`peak_memory_256.log` (`scripts/probes/bf16_peak_memory.py --replicas 4`, bare device executable): the 256
render at 4 × 128 peaks at **4.02 GiB of the 11.68 GiB default arena (34 %)**, 0.24 GiB of arguments —
no `LEAN_MLIR_MEM_FRACTION`, and the accumulation geometry stays the 224 tier's `8 × (4 × 128)`.

## The banners

`RECIPE: full — augmentation from generated_mobilenet_v4_imagenet_full_shim.py; 256²`; `LR SCHEDULE: per
step, tf-models CosineDecay over every step of the 500 epochs counted from step 0 (floor 0), LinearWarmup
0→cosine(5 ep) over 5 epochs on top; the step 0-based`; `STOCHASTIC DEPTH: 18 drop sites, keeps #[0.988,
0.982, 0.979, …, 0.940]` (= 1 − 0.075·(i+3)/25 at the skip rows, the JAX trainer's `dpkeys[k], 0.988000 …
0.940000` literals); `CLASSIFIER DROPOUT: keep 0.8`; `GRADIENT ACCUMULATION: k = 8 … 2496
micro-batches/epoch = 312 updates/epoch`; the BN line `decay 0.997 … new-batch weight 0.000375 = 1 −
0.997^(1/8), compensated for grad-accum`; no EMA line (the paper tier has none).

## Pace

    PROBE: 214 ms/step (median of 200 steps 201..400)
    PROBE-SPREAD: min=210 med=214 p90=219 mean=214 ms/step (starvation wait = med-min = 4 ms)

**214 ms a 512-row micro-step at SHIM_WORKERS=4, compute-bound** (4 ms of starvation). The 224 tier read
274 / 275 ms on 2026-10-07 with 35 ms starved (`runs/2026-10-07-d17-reprobe`): that feed ran timm's
PIL-bicubic geometry; the paper's pipeline (nearest resampling, bilinear resizes without antialias) is
cheaper, so the 1.31× pixels buy a faster step. **ETA ≈ 0.214 s × 2,496 × 500 = 74 h, plus the streamed
f32 validation every fifth epoch — ~75 h on ares.** The conf's `EPOCH_SECS` is 2,496 × 0.214 ≈ 534 s + the
eval's share → 540.
