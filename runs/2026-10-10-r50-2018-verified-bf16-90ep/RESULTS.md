# ResNet-50, `2018` recipe, bf16 sync-BN 4 × 64, zero-γ, BN 0.9 — verified path, 90 epochs

**✅ 77.090 % top-1 / 93.362 % top-5** (live weights, no EMA), epoch 90/90.
* Landed 2026-10-11 14:48:42 UTC.
* **31.58 h** wall clock (1,263 s an epoch), on attempt 1.
* Zero restarts, zero thermal rests, EDAC 0 / 0 throughout. `WATCH_EVENT` is the watcher's end-of-run
  notice (`=== RUN ENDED …`, final evals, loader table), as on the 09-24 run; no fault fired.

This is the verified half of the 2018 rerun the book's R50 table owes (`content.tex` :6884, "[TODO:
rerun both pairs with the head, the γ initialization and the BN decay matched (fp32, zero, 0.9) …]").
Its JAX partner on the same settings is `runs/2026-10-07-r50-2018-jax-bf16-90ep/` (76.796 / 93.360).
* Job: `scripts/jobs/r50-2018-bf16-4gpu.conf`, `CKPT_TAG=2610`. The checkpoint is
  `.lake/build/resnet50in_momdp64bf16_ckpt_xla_2610.bin`, so the landed 09-24 run's checkpoint
  (`…_ckpt_xla.bin`, 2026-09-25 22:54) is untouched.
* Unit `r502018-ver`. Launched 2026-10-10 07:13:43 UTC by `chain_after.sh`, 37 s after the verified
  A3 rerun (`runs/2026-10-09-r50-a3-verified-bf16-100ep/`) completed. Last of the five chained
  ResNet reruns.

## The run, from its own output

* `attempt 1: resuming at epoch 0/90`: a fresh start.
* `ResNet-50 (ImageNet-1k, 2018 recipe) momdp64bf16 (cosine+warmup 5ep, baseLR 0.100000)`,
  `4 replicas x bs 64 = global batch 256, 5004 steps/epoch`
* `decay 0.900000 …, new-batch weight 0.100000` (no grad-accum, so no compensation)
* `▸ INIT: zero-γ on 16 residual-closing BNs (the JAX reference's zero_init_last)`
* Step-0 loss 7.178, against 7.911 on the landed run; epoch 1 reads 5.83 %, against 10.66 % there and
  4.61 % for the JAX rerun.
* 8 shim producers, one replaced every 10 epochs: 8 respawns.

## What changed against the landed verified run

Only zero-γ. The 09-24 run's log already reads `decay 0.900000 …, new-batch weight 0.100000`, and it
has no zero-γ line. So this pair isolates zero-γ on the verified 2018 recipe.

## Curve (top-1 / top-5)

| epoch | 1 | 5 | 10 | 30 | 60 | 75 | 85 | 89 | **90** |
|---|---|---|---|---|---|---|---|---|---|
| top-1 | 5.83 | 36.38 | 51.19 | 55.14 | 65.34 | 73.21 | 76.73 | 77.09 | **77.09** |
| top-5 | 16.42 | 62.77 | 76.91 | 80.07 | 87.31 | 91.38 | 93.26 | 93.36 | **93.36** |

The tail is flat: e87–90 averages 77.054 / 93.355.

## Against the other 2018 numbers

| | e90 top-1 / top-5 | mean e87–90 top-1 | mean e81–90 top-1 |
|---|---|---|---|
| **verified, this run** | **77.090 / 93.362** | **77.05** | **76.54** |
| JAX rerun, same settings (`runs/2026-10-07-r50-2018-jax-bf16-90ep`) | 76.796 / 93.360 | 76.78 | 76.31 |
| verified landed 09-24 (γ = 1; BN 0.9 already) | 77.160 / 93.430 | | 76.60 |
| JAX landed August (book) | 76.95 / 93.44 | | |

* **The pair on matched settings: verified +0.29 / +0.00 over JAX** at e90, +0.28 over e87–90 and
  +0.24 over e81–90. That is inside the ±0.37 single-run 95 % half-width: the paths tie.
* **Zero-γ costs the verified 2018 recipe nothing measurable**: −0.07 at e90, −0.05 over e81–90
  against the landed γ = 1 run. It starts behind (−2.17 over e1–20) and closes the gap by the end.
* **What that says about A3.** The verified A3 rerun dropped 0.42 with two settings moved, the 0.2
  BCE threshold and zero-γ. Zero-γ is worth ~0 here, so the threshold is the likelier cause of the A3
  drop. That's an inference across recipes, not a measurement: zero-γ could act differently under
  LAMB / BCE / Mixup. The threshold-only ablation (~15 h) would settle it.
* **The recipe delta (A3 − 2018):** verified 77.914 − 77.090 = **+0.82**; JAX 77.742 − 76.796 =
  **+0.95**; the book has +1.31.
* Top-1 by 20-epoch window, verified minus JAX: +0.22, −0.52, −0.19, +0.07, then +0.24 over e81–90.
* Per image: this run's `bitmaps/r50-2018_momdp64bf16_e90.bin` (local only) can be paired by McNemar
  with a re-score of the JAX rerun's final `.state.npz` (template
  `runs/2026-10-01-vit-jax-bf16-300ep/score_arms.py`). Not done.

## Pace and loader memory

* **1,263 s an epoch** (min 1,250, max 1,275), flat throughout: 1,260 / 1,260 / 1,264 / 1,264 /
  1,265 s by window. The landed 09-24 run took 31.60 h; this one 31.58 h.
* Loader arena per producer stayed at ~3.6 GiB mean to e50, then rose to 5.8 GiB mean (max 8.8–9.0
  GiB) by e80–89 as the longest-lived producers grew. Respawns held it below the fault line; pace
  never moved.
* MemAvailable never fell below 102.3 GB, swap ≤ 8.0 GB.

## Artifacts

* Checkpoint, outside git: `.lake/build/resnet50in_momdp64bf16_ckpt_xla_2610.bin` (+ `.bn`, `.epoch`).
* Per-image top-1 bitmaps for every epoch, `bitmaps/` (local only; `runs/**/*.bin` is gitignored).
* `attempt.log` / `full.log` / `master.log`, `epoch_clock.tsv`, `loader_rss.tsv`, `edac.tsv`,
  `log_ts.log`, the five watcher scripts, `chain_after.sh` and its `CHAIN_EVENT`, `WATCH_EVENT`.
* `r502018_verified_curve.csv`, written by `summarize.sh`.

## Reproduce

    bash runs/2026-10-10-r50-2018-verified-bf16-90ep/summarize.sh
