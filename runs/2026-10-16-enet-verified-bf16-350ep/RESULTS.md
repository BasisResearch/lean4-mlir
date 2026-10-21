# EfficientNet-B0, TF TPU EfficientNet's recipe, bf16 — verified path, 350 epochs

**✅ 77.208 % top-1 / 93.464 % top-5** (38,604 / 46,732 of 50,000, EMA shadow, running-BN eval),
epoch 350/350, 95 % CI 76.84–77.57.
* Landed 2026-10-21 05:15:39 UTC.
* **65.14 h** wall clock: one supervisor start, 7 trainer launches (the first plus the 6 planned
  `REST_EPOCHS` feed refreshes at e125, 160, 200, 240, 280, 320).
* Zero crashes, zero thermal rests, EDAC 0 / 0 throughout, no NaN.

The verified half of the TF-recipe EfficientNet-B0 pair (`dedb34f5`; `planning/recipe_prep.md` §7;
ch 7's marker). Its JAX half is `runs/2026-10-16-enet-full-jax-bf16-350ep/` (77.168 / 93.39), which
`summarize.sh` reads in place.
* Job `scripts/jobs/enet-default-4gpu.conf`, variant `emarmstfdp64dropdowneps0001bf16`, unit
  `enet-tf-ver`. Chain-launched by `chain_after_jax.sh` 2026-10-18 12:07:30 UTC on the 4× 3060 box
  (mars), after the JAX half's ✅ COMPLETE; tree at `04c72553`, fresh checkpoint name.
* Render `verified_mlir/efficientnetin_emarmstfdp64dropdowneps0001bf16_train_step.mlir`: 4 regions
  [θ|m|v|ema], 965 outputs, 852 resident tensors (80.7 MB). Eval forward
  `efficientnetin_fwd_eval_eps0001` (running-stats BN, 49 layers, sharded over 4 replicas).

## ⭐ The pair: a tie

| | verified (this run) | JAX reference | Δ |
|---|---|---|---|
| top-1 / top-5, e350, EMA | **77.208 / 93.464** | 77.168 / 93.39 | **+0.04 / +0.07** |
| mean of e326–350 | 77.233 / 93.452 | 77.176 / 93.406 | +0.06 / +0.05 |

The endpoint Δ is a tenth of one Wilson half-width (±0.37). Per 50-epoch window (`summarize.sh`,
both runs score every epoch):

| epochs | verified top-1 | JAX top-1 | Δtop-1 | Δtop-5 | Δtrain loss |
|---|---|---|---|---|---|
| 1–50 | 64.85 | 64.83 | +0.02 | −0.00 | −0.002 |
| 51–100 | 73.04 | 72.89 | +0.15 | −0.01 | −0.007 |
| 101–150 | 74.92 | 74.73 | +0.19 | +0.07 | −0.005 |
| 151–200 | 75.99 | 75.76 | +0.23 | +0.15 | −0.005 |
| 201–250 | 76.55 | 76.47 | +0.09 | +0.13 | −0.005 |
| 251–300 | 76.96 | 76.92 | +0.04 | +0.10 | −0.005 |
| 301–350 | 77.18 | 77.13 | +0.05 | +0.03 | −0.005 |

* The verified run is ahead on top-1 on 284 of 350 epochs and behind on 63 (3 equal). The largest
  window lead is +0.23 (e151–200); it settles at +0.05. Train loss runs 0.002–0.007 lower in every
  window.

### McNemar, per image (`scripts/demos/mcnemar.py`)

The JAX run's final `.state.npz` was re-scored through `jax/scripts/eval_full50k.py`
(`EVAL_DTYPE=f32 PROTOCOL=train BATCH=256`, `DUMP_CORRECT`; logs `rescore_{ema,live}.log` in the
JAX folder). Its EMA arm reproduces the logged 38,584 exactly. This run's live arm is
`score-checkpoint` with `LEAN_MLIR_REGION=live` (region 0 plus the running BN stats; `rescore_live.log`).

| arm | JAX | verified | only JAX right | only verified right | p (exact) |
|---|---|---|---|---|---|
| EMA (scored) | 38,584 (77.168) | 38,604 (77.208) | 2,190 | 2,210 | **0.77** |
| live weights | 38,315 (76.630) | 38,255 (76.510) | 2,567 | 2,507 | **0.41** |

Neither arm separates the two checkpoints. The EMA is worth +0.54 (JAX) and +0.70 (verified) on this
recipe. The bitmaps are local only.

## Against the 09-12 pair (timm-form recipe)

| | e350 top-1 / top-5 | Δ vs its JAX | e301–350 window Δ |
|---|---|---|---|
| verified, this run (TF recipe) | 77.208 / 93.464 | **+0.04** | +0.05 |
| verified, `runs/2026-09-12-enet-verified-350ep/` | 76.878 / 93.154 | −0.27 | −0.32 |
| JAX, `runs/2026-10-16-enet-full-jax-bf16-350ep/` | 77.168 / 93.39 | | |
| JAX, the 09-04 run (77.15 rescored; in-training 77.18) | 77.18 / 93.31 | | |

The 09-12 pair's −0.32 window offset, which held from e51 to the end, is gone: on the TF recipe the
two paths tie. The JAX side barely moved (77.18 → 77.17); the verified side gained +0.33. Which of the
recipe's changes closed the gap isn't separated here (one seed each, and the recipe changed every
row of `dedb34f5` at once on both paths).

## Verified from the run's own output

* `train 1281167, test 50000; bs 64, EfficientNet-B0 (ImageNet-1k) emarmstfdp64dropdowneps0001bf16 (exp x0.970000/2.400000ep staircase+warmup 5ep, baseLR 0.016000)`
* `▸ RMSPROP: m = momentum buffer (init 0), v = running MEAN-SQUARE (init 1.0, TF convention — this optimizer is not bias-corrected)`
* `▸ STOCHASTIC DEPTH: 9 drop sites` (keeps 0.975 … 0.825), `▸ CLASSIFIER DROPOUT: keep 0.800000`
* `▸ EMA: region 3 of 4 [θ|m|v|ema], shadow starts AT the weights, decay min(0.999900, (1+t)/(10+t)) — TF warmup-corrected. EVAL AND CHECKPOINT SCORE THE SHADOW.`
* `running-stats BN: 49 layers, 42016 stat floats`, decay 0.99
* `▸ INIT: classifier U(±1/√out) on 1 dense (TF EfficientNet's dense_kernel_initializer …)`, plus the
  depthwise fan = k² and SE fan = out rules
* `DATA-PARALLEL: 4 replicas x bs 64 = global batch 256, 5004 steps/epoch`
* every resume: `▸ resumed BN running stats + ema_bn from …ckpt_xla.bin.bn` (6 of 6)

⚠ The header still reads `He init`: the stale unconditional label `Train.lean` documents; the
`▸ INIT` banners are the true ones.

## Pace and loaders

* **670 s an epoch** (min 656, max 923) over 349 gaps, eval of all 50,000 every epoch included. The
  conf's ~67 h was the 10-12 probe's estimate; 65.14 h landed. The 09-12 run took 73.4 h.
* Each planned rest costs one ~765 s epoch (restart + recompile), six in all.
* **One degraded producer, e33–40.** The last original loader (pid 3014013) grew to 7.1 GiB of
  arena-class memory (the others held ~3.9) and paced the round-robin feed at ~1.75× in stretches:
  e33 849 s, e35 923, e36 791, e37 868. The shim's scheduled respawn replaced it after e40 and every
  later epoch ran at 656–680 s, apart from the six rests. Cost ≈ 15 min. `fault_watch` never fired.
  This is the same failure the 09-12 run recorded; `▸ SHIM RESPAWN` every 10 epochs (32 respawns)
  is what bounded it.

## Artifacts

* Checkpoint, outside git: `.lake/build/efficientnetin_emarmstfdp64dropdowneps0001bf16_ckpt_xla.bin{,.bn,.epoch}`
  (marker 350, 84.6 MB, all four regions, plus BN running stats and their EMA).
* Per-image top-1 bitmaps for all 350 epochs, `bitmaps/` (local only; `runs/**/*.bin` is gitignored).
* `attempt.log` / `full.log` / `master.log`, `log_ts.log`, `epoch_clock.tsv`, `loader_rss.tsv`,
  `edac.tsv`, `CHAIN_EVENT`, `WATCH_EVENT`, the five watcher scripts and `chain_after_jax.sh`.
* `enet_verified_curve.csv`, written by `summarize.sh`.

## Reproduce

    bash runs/2026-10-16-enet-full-jax-bf16-350ep/summarize.sh
    bash runs/2026-10-16-enet-verified-bf16-350ep/summarize.sh
