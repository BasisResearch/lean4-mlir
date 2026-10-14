# ResNet-50, RSB-A3 as timm ran it, bf16 — verified path, 100 epochs

**✅ 78.08 % top-1 / 93.84 % top-5** (39,039 / 50,000, 95 % CI 77.71–78.44), epoch 100/100.
* Landed 2026-10-14 04:33:22 UTC.
* **21.9 h** wall clock, on attempt 1.
* Zero restarts, zero thermal rests.

The verified half of the timm-schedule A3 pair (`4d612bb9`, "A3/A2/A1 as timm ran them"). The JAX half
is `runs/2026-10-12-r50-a3-jax/` (77.60 / 93.61), run first on this box.
* Job `scripts/jobs/r50-a3-wxclip4x128-bf16-4gpu.conf` (`CKPT_TAG=2611`), launched 2026-10-13
  06:39:19 UTC on ares (4× 4060 Ti) via `launch.sh`.
* Render `lambaccdp4x128wxclipbcebf16` (4 × 128 per step, accumulated to the A3 global 2048), XLA
  through PJRT, parameters resident.
* Tree at `9861f21c`, unchanged for the whole run.
* `aborted_10-12/` holds a first launch stopped at step 1 on 10-12 so the JAX half could run first;
  no checkpoint was written.
* Per-epoch top-1 bitmaps went to `bitmaps/` (`*.bin`, not committed).

~306 ms/step, 2500 steps/epoch, ~13 min an epoch including eval and checkpoint.

## Curve (top-1 / top-5)

| epoch | 10 | 25 | 50 | 75 | 90 | 95 | **100** |
|---|---|---|---|---|---|---|---|
| top-1 | 34.18 | 52.36 | 61.40 | 74.59 | 77.56 | 77.99 | **78.08** |
| top-5 | 60.47 | 76.47 | 83.32 | 92.04 | 93.66 | 93.80 | **93.84** |

Epochs 91–100 average **77.91** top-1.

## Against the JAX half

| | top-1 e100 | top-5 e100 | top-1 e91–100 mean |
|---|---|---|---|
| verified (this run) | **78.08** | **93.84** | 77.91 |
| JAX (`2026-10-12-r50-a3-jax`) | 77.60 | 93.61 | 77.38 |
| Δ | **+0.48** | +0.23 | +0.53 |

One run's 95 % half-width is ±0.37, so the verified run finished ahead at this seed. The book's pair
was 77.74 JAX / 77.91 verified (+0.17). McNemar on the paired predictions is owed: this run wrote
bitmaps, the JAX trainer does not.
