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

## Against the other A3 numbers (added 2026-10-14, with the ch 5 update)

| | e100 top-1 / top-5 | mean e97–100 top-1 | mean e91–100 top-1 |
|---|---|---|---|
| **JAX, this run (timm's schedule)** | **77.602 / 93.610** | **77.46** | **77.38** |
| verified, same settings (`runs/2026-10-12-r50-a3-rsb-bf16`) | 78.078 / 93.844 | 78.04 | 77.91 |
| JAX 10-07 (per-step cosine from zero, alternating Mixup/CutMix, grey fill), f32 rescore | 77.75 / 93.65 | 77.72 | 77.57 |
| verified 10-09, same settings as the 10-07 run | 77.914 / 93.712 | 77.90 | 77.83 |
| timm RSB A3 (paper) / `resnet50.a3_in1k` under this protocol | 78.1 / 78.05 | | |

* The three settings (the per-epoch cosine 1e-4 → 1e-6, the per-batch Mixup/CutMix draw at 0.5, the
  img_mean fill) moved the reference −0.15 and the verified path +0.17, each inside one run's interval.
  The reference lands 0.50 under the paper's 78.1; the verified render lands on it.
* Epoch 1 reads 0.10 % (51 images; the verified half also 51): the whole first epoch runs at `warmup_lr`
  1e-4, an eightieth of the peak, where the 10-07 run's per-step warmup read 1.73 %. The rate is 1.68e-3 /
  3.26e-3 / 4.84e-3 / 6.42e-3 over the rest of the warmup, 7.951e-3 at epoch 6, 2.37e-4 at epoch 90,
  3e-6 at epoch 100 (`cooldown_epochs 10` not taken).
* Top-1 by 20-epoch window, verified minus JAX: +0.58, +3.06, +1.45, +1.42, +0.50 (the 10-07/09 pair:
  +1.92, +0.24, +1.16, +1.05, +0.29). The reference's middle is the noisier: e30 reads 38.44 against the
  verified 49.80, the widest single-epoch gap (11.36).
* The recipe delta on the reference, A3 − 2018: 77.60 − 76.76 = **+0.84** (the 10-07 pair had +0.99); on
  the verified path 78.08 − 77.09 = **+0.99**. Against the 2018 reference curve, A3 first leads at epoch
  41 and holds the lead outright from epoch 89; at the matched epoch 90 it is +0.31 (77.11 vs 76.80).
* Pace: 478.7 s an epoch at the median, eval included (min 473.8, max 503.1; 770 ms an optimizer step at
  the end), against the conf's ETA of ~13.5 h and the 10-07 mars run's 14.75 h.

## The per-image pairing — `rescore.sh`, 2026-10-14

`rescore.sh` rescored the final `resnet50_imagenet_rsbfaithful.state.npz` (copied to atlas as
`~/r50_a3_jax_2611/`) through `jax/scripts/eval_full50k.py` at `EVAL_DTYPE=f32`, `PROTOCOL=train`
(224 / 0.95), `BATCH=200`, writing `bitmaps/r50-a3_jax_f32.bin` (`rescore_f32.log`) — on atlas's CPU
(`JAX_PLATFORMS=cpu`, `~/.venv-score`: jax 0.11.0 / tensorflow 2.21.0 / tfds 4.9.10, the CUDA lock's pins;
the validation shards rsync'd from ares), ~12 min for the 50,000 against ~1 min on four cards.

    224px crop 0.95   top-1  77.61%  top-5  93.61%  (50000 images)   # 38,803 set; the training log 38,801

Two images over the log's own f32 evaluation: CPU and GPU f32 reductions round differently. Paired
with the verified run's e100 bitmap (`scripts/demos/mcnemar.py <jax> <verified>`):

| JAX f32 | verified | both right / both wrong | only JAX / only verified | net | discordant | McNemar p |
|---|---|---|---|---|---|---|
| 77.61 (38,803) | 78.08 (39,039) | 36,902 / 9,060 | 1,901 / 2,137 | +236 | 4,038 (8.1 %) | **0.0002** |

These two checkpoints are separable on this validation set (the 10-07/09 pair was not: p = 0.20 on 82
images of 4,014). One seed per arm, so a statement about the two checkpoints, not the two paths.
