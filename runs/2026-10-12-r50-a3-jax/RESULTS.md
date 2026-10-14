# ResNet-50, RSB-A3 as timm ran it, bf16 — JAX reference path, 100 epochs

**✅ 77.60 % top-1 / 93.61 % top-5** (38,801 / 50,000, fp32 eval), epoch 100/100.
* Landed 2026-10-13 05:57:52 UTC.
* **13.37 h** of trainer time (48,120 s), on attempt 1.
* Zero restarts.

The JAX half of the timm-schedule A3 pair (`4d612bb9`, "A3/A2/A1 as timm ran them"; ch 5's A3
row). The verified half is `runs/2026-10-12-r50-a3-rsb-bf16/`, launched on this box after this run
finished.
* Job `scripts/jobs/r50-a3-jax-4gpu.conf`, launched 2026-10-12 16:35:33 UTC on ares (4× 4060 Ti) via
  `launch.sh`.
* Fresh start: `/home/skoonce/r50_a3_jax_2611/` did not exist. The book run's lineage (2610) is
  untouched.
* Tree at `36d8d6cf`; `0f6caf7e` landed three minutes in and touched CI gates only.

## The run, from its own output

* `lr=0.008000  batch_size=2048 (4 devices x 512)  epochs=100  params=25557032`
* `steps_per_epoch=625  total_steps=62500`
* `grad-accum=4x  micro_batch=512 (4 devices x 128)  -> effective_batch=2048`
* `eval: f32 forward (evalF32)` on every epoch
* ~457 s train + ~17 s validation per epoch at the tail

Trainer: `jax/.lake/build/generated_resnet50_imagenet_rsbfaithful.py`.

## Curve (top-1 / top-5)

| epoch | 10 | 25 | 50 | 75 | 90 | 95 | **100** |
|---|---|---|---|---|---|---|---|
| top-1 | 34.52 | 45.13 | 61.56 | 73.30 | 77.11 | 77.40 | **77.60** |
| top-5 | 59.76 | 69.96 | 83.78 | 91.23 | 93.35 | 93.57 | **93.61** |

Epochs 91–100 average **77.38** top-1 (range 77.16–77.60).

Against the book's A3 JAX run (77.75 at its f32 rescore): **−0.15**, inside one run's ±0.37 95 %
half-width.
