# ViT-Ti (DeiT-Ti), `default` recipe as DeiT runs it (batch 1024), bf16, max-shifted softmax — verified path, 300 epochs

**✅ 71.612 % top-1 / 90.948 % top-5** (35,806 / 45,474 of 50,000, EMA shadow, fp32 eval), epoch
300/300, 95 % CI 71.22–72.01.
* Landed 2026-10-16 17:32:21 UTC.
* **62.55 h** wall clock, on attempt 1.
* Zero restarts, zero thermal rests, EDAC 0 / 0 throughout, no NaN.

The verified half of the DeiT-recipe ViT-Ti pair (`320f5045`; `planning/imagenet_parity.md` §10.4;
ch 9's `[TODO: …]` marker). Its JAX half is `runs/2026-10-11-vit-deit-jax-bf16-300ep/` (71.638 /
90.980), which `summarize.sh` reads in place.
* Job `scripts/jobs/vit-default-emabf16-4gpu.conf`, variant `emadp256x4wxdropeps0000001smxerfbf16`,
  unit `vit-smx-ver`. Launched 2026-10-14 02:59:04 UTC on the 4× 3060 box (mars), tree at
  `2170bd9f`, fresh checkpoint name.
* Render `verified_mlir/vitin_emadp256x4wxdropeps0000001smxerfbf16_train_step.mlir`: 4 regions
  [θ|m|v|ema], 831 operands, 200 all-reduces, LN ε 1e-6, no clip (0 `stablehlo.minimum`), and 72
  row-max reduces. Eval forward `vitin_emadp256x4wxdropeps0000001smxerfbf16_fwd` (36 row-max reduces,
  fp32, sharded over 4 replicas).

## Why this is a rerun

The first run of this job, on the unshifted render `…eps0000001erfbf16`
(`runs/2026-10-11-vit-deit-verified-bf16-300ep/`, launched 2026-10-13 20:39 UTC), went NaN in
epoch 3. Its 36 attention softmaxes were plain `exp(s)/Σexp(s)`, and one score reached 90.0, past
f32's `exp` limit of 88.72 (replayed per shard in `runs/2026-10-14-vit-deit-verified-nan-diag/`;
that folder and the failed run's are local only, not committed — `2170bd9f`'s message carries the replay).
`2170bd9f` subtracts each row's max before every `exp`, forward and backward. It is the same function
(`rowSoftmaxShiftFlat_eq`, `den_softmaxRowBackShiftB_eq`), so the pair's recipe is unchanged; the
JAX side's `jax.nn.softmax` always did this. This run went through epoch 3 and the remaining 297
epochs with no non-finite loss.

## ⭐ The pair: a tie

| | verified (this run) | JAX reference | Δ |
|---|---|---|---|
| top-1 / top-5, e300, EMA | **71.612 / 90.948** | 71.638 / 90.980 | **−0.03 / −0.03** |
| mean of the scored e280, 285, …, 300 | 71.44 / 90.85 | 71.48 / 90.87 | −0.04 / −0.01 |

The endpoint Δ is a tenth of one Wilson half-width (±0.39). Per 25-epoch window (`summarize.sh`,
top-1 on the JAX run's scored epochs, train loss on every epoch):

| epochs | Δtop-1 | Δtop-5 | Δtrain loss |
|---|---|---|---|
| 1–25 | +0.29 | +0.63 | −0.012 |
| 26–50 | +1.13 | +1.44 | −0.007 |
| 51–75 | +0.50 | +0.45 | −0.017 |
| 76–100 | +0.88 | +0.49 | −0.012 |
| 101–125 | +0.72 | +0.42 | −0.008 |
| 126–150 | +0.55 | +0.22 | +0.003 |
| 151–175 | +0.34 | +0.20 | −0.004 |
| 176–200 | +0.26 | −0.02 | +0.006 |
| 201–225 | +0.23 | +0.01 | +0.001 |
| 226–250 | +0.14 | +0.06 | +0.006 |
| 251–275 | +0.06 | −0.01 | +0.008 |
| 276–300 | −0.04 | −0.01 | +0.001 |

* The verified run leads by up to +1.1 through e125 and the lead decays to zero by e250. The early
  epochs are the EMA shadow at a constant 0.99996 (no ramp), which still carries much of the random
  init before e60, so the early Δ says little.
* Train loss is within ±0.02 in every window and within ±0.01 from e126 on.
* No per-image McNemar yet: the JAX run wrote no per-image bitmap. This run's
  `bitmaps/vit_emadp256x4wxdropeps0000001smxerfbf16_e300.bin` (local only) can be paired with a
  re-score of the JAX run's final `.state.npz` (template `runs/2026-10-01-vit-jax-bf16-300ep/score_arms.py`).

## Against the 10-01 pair (batch 512, clip 1.0, step-wise schedule, ramped EMA)

| | e300 top-1 / top-5 | Δ vs its JAX |
|---|---|---|
| verified, this run (DeiT's batch 1024) | 71.612 / 90.948 | −0.03 |
| verified, `runs/2026-10-01-vit-verified-bf16-300ep/` | 72.416 / 91.212 | +0.34 |
| JAX, `runs/2026-10-11-vit-deit-jax-bf16-300ep/` | 71.638 / 90.980 | |
| JAX, `runs/2026-10-01-vit-jax-bf16-300ep/` | 72.072 / 91.000 | |

The DeiT recipe costs both paths: −0.43 on JAX, −0.80 on verified. One seed each, and the 10-01
verified checkpoint was the one McNemar put ahead of its JAX partner (p = 0.009), so the larger drop
here is mostly that run's lead going away rather than evidence against the recipe on this path.

## Verified from the run's own output

* `ViT-Tiny (ImageNet-1k) emadp256x4wxdropeps0000001smxerfbf16 (cosine→0.000010+warmup 5ep, baseLR 0.001000)`
* `▸ LR SCHEDULE: per epoch (timm CosineLRScheduler, t_in_epochs) — warmup 0.000001→0.001000 over 5 epochs, then cosine over all 300 epochs to the floor 0.000010`
* `▸ EMA: region 3 of 4 [θ|m|v|ema], … decay 0.999960 constant from step 0 (timm ModelEma, as DeiT scores; emaWarmup := false)`
* `▸ INIT: timm/DeiT (σ=0.02 weights + CLS/pos-embed, patch-embed on PyTorch Conv2d default)`
* `▸ STOCHASTIC DEPTH: 24 drop sites`
* `DATA-PARALLEL: 4 replicas x bs 256 = global batch 1024, 1251 steps/epoch`
* train step RESIDENT (800 tensors, 87.2 MB), forward RESIDENT (200 tensors)
* `▸ SHIM RESPAWN: one producer every 10 epoch(s)` (29 respawns)

⚠ The header still reads `He init`: the stale unconditional label `Train.lean` documents; the
`▸ INIT` banner is the true one.

## Pace and loaders

* **751 s an epoch** (min 713, max 800) over 298 gaps, eval of all 50,000 every epoch included.
  The unshifted render ran 843 s an epoch over its two epochs; the shift costs nothing visible. The
  conf's ~70 h was that estimate; 62.55 h landed.
* No producer's arena-class memory passed 4.28 GiB (peak at e54). `fault_watch` never fired.

## Artifacts

* Checkpoint, outside git: `.lake/build/vitin_emadp256x4wxdropeps0000001smxerfbf16_ckpt_xla.bin{,.epoch}`
  (marker 300, 91.5 MB, all four regions).
* Per-image top-1 bitmaps for all 300 epochs, `bitmaps/` (local only; `runs/**/*.bin` is gitignored).
* `attempt.log` / `full.log` / `master.log`, `log_ts.log`, `epoch_clock.tsv`, `loader_rss.tsv`,
  `edac.tsv`, the five watcher scripts (copied from the failed run's, with `fault_watch.sh` now also
  flagging a non-finite loss). No `WATCH_EVENT`: the watcher was stopped by hand at the end.
* `vit_verified_curve.csv`, written by `summarize.sh`.

## Reproduce

    bash runs/2026-10-11-vit-deit-jax-bf16-300ep/summarize.sh
    bash runs/2026-10-14-vit-deit-verified-smx-bf16-300ep/summarize.sh
