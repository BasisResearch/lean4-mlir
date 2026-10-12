# MobileNetV4-Conv-M reference (JAX) smoke at the paper's own config — 2026-10-12, ares (4× 4060 Ti)

The re-emitted `generated_mobilenet_v4_imagenet_full.py` (`mobilenetV4ConvMImagenetConfigFull`,
planning/recipe_prep.md §5: tensorflow/models' `imagenet_mobilenetv4_conv_medium_tpu.yaml` on timm's net —
256², 4096 as `GRAD_ACCUM = 8` micro-batches of 512 = 4 × 128, AdamW 4e-3 at ε 1e-7, wd 0.1 off norm/bias,
BN 0.997 / ε 1e-3, tf-models' cosine from step 0 with the 5-epoch linear warmup on top, RandAugment N2 m15
at p 0.7 under TF's mappings with the identity branch, ±150 px translate, nearest resampling and the 128
fill, TF's crop sampler at 0.08 with the whole image on exhaustion, bilinear resizes without antialias, the
eval centre crop 0.875 of the short side then resize, no EMA, f32 eval) with the smoke patch
`trainer_smoke.patch` (`EPOCHS = 2`, `steps_per_epoch = 25` = 200 micro-batches an epoch, validate every
epoch). `trainer_smoke.py` is that copy (not committed). Run from `jax/` as `jax_job.sh` runs the committed
trainer, through `run.sh` (at the default arena first; the 0.97 retry did not run). 9,715,512 parameters.

## 1. The arena

At XLA's default arena (`full_default_arena.log`): trains and validates at 256² — no RESOURCE_EXHAUSTED,
so the conf carries no `XLA_PYTHON_CLIENT_MEM_FRACTION`.

## 2. Two epochs of 25 optimizer steps

Header `lr=0.004000  batch_size=4096 (4 devices x 1024)`; `eval: f32 forward (evalF32)` before each validation:

    [Epoch 1] lr=0.0 loss(train_avg)=7.2521 val_top1=47/50000 (0.0009) val_top5=0.0049 val_loss=2547.4153  [110.4s train, 20.6s val]
    [Epoch 2] lr=0.0 loss(train_avg)=7.2465 val_top1=54/50000 (0.0011) val_top5=0.0049 val_loss=242.7486  [64.1s train, 11.5s val]

* **`lr=0.0` is the smoke's own arithmetic, not the schedule's.** tf-models' warmup ramps to the cosine's
  value at `warmup_steps` = 5 × 25 = 125, and the smoke's whole run is `total_steps` = 2 × 25 = 50 — the
  cosine is past its end there, i.e. at its floor 0, so every warmup step multiplies 0. At the real
  schedule (1,560 of 156,000 steps) `_cos(warmup_steps)` = 0.004 × ½(1 + cos(π/100)) ≈ 0.004. The verified
  half's smoke runs the real 500-epoch cosine (`LEAN_MLIR_EPOCHS=500`, the loop capped), so its banner and
  rate are the run's.
* **The validation loss (2547, then 243) is the running-statistic BatchNorm at the yaml's 0.997 after
  200 and 400 micro-batches**: per micro-batch the decay is 0.997^(1/8) = 0.99962, so the running stats
  have moved 7 % (then 14 %) of the way from their init toward the batch statistics, and the frozen-stat
  forward scores a net that trained under batch statistics. Over the real 2,496 micro-batches an epoch the
  gap is 61 % after the first epoch and gone by the first scored epoch (the fifth). The 100-epoch tier's
  0.99 (0.9987 a micro-batch) hid this in its smokes. The f32 swap precedes the first `eval_batch` trace
  (the emitted assertion did not fire); the train loss moves with lr 0 only through BN's batch statistics.
* **Pace: 2.56 s a 4096-row optimizer step** (epoch 2's 25 steps in 64.1 s, compile excluded) = 320 ms a
  512-row micro-batch — the same figure the 224 trainer read on 2026-10-07 (2.57 s, `runs/2026-10-07-d17-reprobe`):
  this trainer is bound by its own `tf.data` feed (decode, TF's RandAugment at m15), not by the 1.31× pixels.
  **ETA ≈ 2.56 s × 312 × 500 = 111 h, plus the f32 validation every 5 epochs (~12 s each at this batch) —
  ~112 h on ares.** The conf's `EPOCH_SECS` is 2.56 × 312 ≈ 800 s.
