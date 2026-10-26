# MobileNetV4-Conv-M, the paper tier at 256² cut to 100 epochs, bf16 — verified path

**✅ 77.35 % top-1 / 93.53 % top-5** (38,676 / 50,000, 95 % CI 76.98–77.72), epoch 100/100.
* Landed 2026-10-15 18:28:36 UTC.
* **15.6 h** wall clock, on attempt 1.
* Zero restarts, zero thermal rests.

The verified half of the 100-epoch MNv4 pair (`078ad53f`, "the paper tier cut to 100 epochs, on both
paths"). The JAX half is `runs/2026-10-14-mnv4-full100-jax/` (77.39 / 93.46), run first on this box.
* Job `scripts/jobs/mnv4-full-e100-4gpu.conf` (recipe `full` at `LEAN_MLIR_EPOCHS=100`,
  `CKPT_TAG=e100`), launched 2026-10-15 02:52:39 UTC on ares (4× 4060 Ti) via `launch.sh`.
* Render `accdp8x128wxdropdowd01bf16` (4 × 128 per micro-step, accumulated ×8 to the global 4096), XLA
  through PJRT. The startup banner confirms the cosine over all 100 epochs with a 5-epoch linear warmup.
* Tree at `a06eaaeb`, the exe built on Lean 4.35.0, unchanged for the whole run.
* No checkpoint at `CKPT_TAG=e100` existed, so it was a fresh start.
* Per-epoch top-1 bitmaps went to `bitmaps/` (`*.bin`, not committed).

~214 ms a micro-step, 2,496 micro-steps an epoch, ~9.4 min an epoch including the streamed f32 eval.

## Curve (top-1 / top-5)

| epoch | 5 | 10 | 25 | 50 | 75 | 90 | 95 | **100** |
|---|---|---|---|---|---|---|---|---|
| top-1 | 7.88 | 34.19 | 60.29 | 67.62 | 73.89 | 77.06 | 77.29 | **77.35** |
| top-5 | 21.16 | 59.38 | 83.11 | 88.03 | 91.66 | 93.27 | 93.51 | **93.53** |

## Against the JAX half

| | top-1 e100 | top-5 e100 | top-1, scored e80–100 mean |
|---|---|---|---|
| verified (this run) | **77.35** | **93.53** | 76.60 |
| JAX (`2026-10-14-mnv4-full100-jax`) | 77.39 | 93.46 | 76.56 |
| Δ | **−0.04** | +0.07 | +0.04 |

The pair ties: −0.04 is a tenth of one run's ±0.37 95 % half-width. The curves cross back and forth all
the way through; at e60 they are 34,750 and 34,753 correct. The 500-epoch recipe this tier cuts from is
not run. McNemar needs a JAX bitmap, which the trainer does not write; the checkpoint is
`/home/skoonce/mnv4_full100_r256_2614/mobilenet_v4_imagenet_full100.state.npz` for a rescore.

**McNemar, 2026-10-26:** the JAX e100 state rescored at f32 (38,691, `rescore_jax_f32.log`) against this
run's e100 bitmap: 2,170 only JAX / 2,155 only verified, p = 0.83 (`mcnemar.txt`). The rerun after
3333bbd5 and the cross-run pairings: `../2026-10-24-mnv4-full100-verified/RESULTS.md`.
