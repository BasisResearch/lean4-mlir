# MobileNetV2 verified smoke at TF-slim's README recipe — 2026-10-12, ares (4× 4060 Ti)

`mnv2-default-4gpu` through the supervisor (`ONCE=1 LEAN_MLIR_MAX_STEPS=400 LEAN_MLIR_PROBE_WARM=200`,
`smoke_w4.log`; the rewritten precheck, the `default` shim, the driver's banners), the first run of the
render `mobilenetv2in_emarmstfdp64wxdwdoeps0001bf16` (planning/recipe_prep.md §6: TF1's RMSProp with
the rate inside the momentum term, coupled L2 4e-5 off BN γ/β, biases and the depthwise kernels, dropout
0.2, label smoothing 0.1, BN ε 1e-3 baked and 0.997 on the host, the EMA shadow at 0.9999 in TF's
warmup-corrected form, bf16; the host's 0.12 at 256 stepped ×0.98 every 2.5 epochs from step 0 with no
warmup and the truncated-normal σ 0.09 init; the shim's slim pipeline). The smoke's checkpoint under the
new slug was deleted afterwards; the run's bitmaps dir is created by the precheck.

## Memory

`peak_memory.log` (`scripts/probes/bf16_peak_memory.py --replicas 4`, bare device executable): **1.53 GiB
of the 11.68 GiB default arena (13 %)**, 0.09 GiB of arguments — the EMA region is one more copy of
3.5 M parameters. No `LEAN_MLIR_MEM_FRACTION`.

## The banners

`RMSPROP: m = momentum buffer (init 0), v = running MEAN-SQUARE (init 1.0, TF convention)`; `CLASSIFIER
DROPOUT: keep 0.800000`; `EMA: region 3 of 4 [θ|m|v|ema], shadow starts AT the weights, decay
min(0.999900, (1+t)/(10+t)) — TF warmup-corrected. EVAL AND CHECKPOINT SCORE THE SHADOW`; `INIT:
truncated normal σ=0.090000 on every conv kernel, depthwise and dense (TF-slim training_scope; std
0.8796σ as TF's ±2σ redraw gives), biases 0 — above the fan rules` (the `depthwise fan = k²` line
prints too and is overridden, as the σ line says); the schedule line `exp x0.980000/2.500000ep
staircase+warmup 0ep, baseLR 0.120000`; `DATA-PARALLEL: 4 replicas x bs 64 = global batch 256, 5004
steps/epoch`; the train step compiled with **742 outputs** (= the 744 operands − 2, the arity gate's
invariant) in 30 s, the ε-1e-3 eval graph selected by `evalTag`. The loss 7.69 → 6.63 over 400 steps at
the README's rate.

## Pace

    PROBE: 96 ms/step (median of 200 steps 201..400)
    PROBE-SPREAD: min=90 med=96 p90=102 mean=96 ms/step (starvation wait = med-min = 6 ms)

**96 ms a 256-row step at SHIM_WORKERS=4, 6 ms of starvation** — the retired arm's sync-BN probe read
123 ms on 2026-09-25 under timm's PIL-bicubic-with-antialias feed; slim's bilinear-without-antialias
pipeline is cheaper, as MobileNetV4's paper tier found on 2026-10-12. **ETA ≈ 0.096 s × 5,004 = 480 s an
epoch + ~60 s the streamed f32 validation and checkpoint every epoch ≈ 540 s → 420 epochs ≈ 63 h on
ares.** The conf's `EPOCH_SECS` is 540.

`shim_hash.log`: the shim's first batch under `SHIM_DETERMINISM=1` is reproducible at seed 0
(`6080248908d32727` twice) and distinct at seed 1 (`b83a75c9cbdaa32e`), at the 224² flat width.
