# ViT-Ti (DeiT-Ti), `default` recipe as DeiT runs it (batch 1024), bf16 — JAX reference path, 300 epochs

**✅ 71.638 % top-1 / 90.980 % top-5** (35,819 / 50,000, EMA shadow, fp32 eval), epoch 300/300.
* Landed 2026-10-13 20:38:52 UTC.
* **48.25 h** of trainer time, on attempt 1.
* Zero restarts, zero thermal rests, EDAC 0 / 0 throughout.

The JAX half of the DeiT-recipe ViT-Ti pair (`320f5045`, "ViT-Ti as DeiT runs it, on both paths";
`planning/imagenet_parity.md` §10.4; ch 9's `[TODO: …]` marker). The verified half,
`runs/2026-10-11-vit-deit-verified-bf16-300ep/`, was chained behind this run (launched 2026-10-13
20:39:46 UTC) and went NaN in epoch 3: the verified render's attention softmax has no max subtraction,
and one score of 90.0 overflowed f32's `exp` (replayed in `runs/2026-10-14-vit-deit-verified-nan-diag/`).
It reruns after the render is fixed; this run is the JAX half of that pair.
* Job `scripts/jobs/vit-default-jax-4gpu.conf`, unit `vit-deit-jax`, launched 2026-10-11 20:23:45 UTC
  on the 4× 3060 box (mars). Brett's line: `git pull && scripts/regen_jax_generated.sh sync && lake
  build && scripts/supervise.sh vit-default-jax-4gpu`, run as a systemd unit.
* Fresh start: `/home/skoonce/vit_tiny_jax_2611/` did not exist. The 10-01 run's checkpoints are
  untouched.
* Tree at `320f5045`, unchanged for the whole run.

## The run, from its own output

* `lr=0.001000  batch_size=1024 (4 devices x 256)  epochs=300  params=5717416`
* `steps_per_epoch=1251  total_steps=375300`
* `repeated-aug=3x (timm RASampler placement: the copies adjacent, in one optimizer step)`
* `eval: f32 forward (evalF32)` on every scored epoch

What the conf's precheck asserted against the emitted trainer, beyond the 10-01 recipe (torchvision
crop, exact GELU, RandAugment m9 mstd0.5, smoothing folded into the mixed target, DeiT init, LN ε 1e-6,
fp32 patch embed and head):
* DeiT's batch 1024 and lr 1e-3 (5e-4 · 1024/512)
* timm's per-epoch schedule: warmup from 1e-6 once per epoch, then cosine to 1e-5 over all 300
* no gradient clipping (DeiT's `--clip-grad None`)
* Mixup / CutMix drawn once per batch at p 0.5
* RandAugment's geometric fill at timm's img_mean
* repeated-augmentation copies adjacent
* the EMA held at 0.99996 from step 0 (no warmup ramp)
* an fp32 eval forward

Trainer: `jax/.lake/build/generated_vit_tiny_imagenet.py`, byte-identical to the committed
`jax/generated/` copy (`regen_jax_generated.sh check` clean), on `/home/skoonce/.venv-cuda`.

## Curve (top-1 / top-5, EMA shadow, scored every 5th epoch)

| epoch | 5 | 10 | 25 | 50 | 100 | 150 | 200 | 250 | **300** |
|---|---|---|---|---|---|---|---|---|---|
| top-1 | 0.44 | 1.13 | 11.54 | 41.07 | 60.19 | 65.33 | 68.28 | 70.33 | **71.64** |
| top-5 | 2.06 | 4.33 | 26.40 | 66.12 | 83.46 | 86.99 | 88.98 | 90.19 | **90.98** |

The scored epochs e280–300 average **71.478 / 90.874** (range 71.30–71.64). As in the 10-01 run, the
endpoint is the top of a still-rising tail.

**The early curve is the EMA, not the model.** With the decay held at 0.99996 from step 0, the
shadow still carries 0.99996^t of the random init: 78 % at e5, 29 % at e25, 5 % at e60, under 1 % from
e100. The 10-01 run ramped the decay in, so its early EMA tracked the live weights. The trainer scores
only the EMA, so the early epochs aren't comparable; train loss is.

## Against the 10-01 JAX run (batch 512, clip 1.0, step-wise schedule, ramped EMA)

| epoch | 25 | 50 | 100 | 150 | 200 | 250 | **300** | e276–300 mean |
|---|---|---|---|---|---|---|---|---|
| top-1, this run | 11.54 | 41.07 | 60.19 | 65.33 | 68.28 | 70.33 | **71.64** | 71.48 |
| top-1, 10-01 | 48.24 | 57.05 | 63.15 | 66.31 | 68.75 | 71.02 | **72.07** | 71.96 |
| Δ | −36.70 | −15.98 | −2.96 | −0.98 | −0.47 | −0.69 | **−0.43** | −0.48 |
| train loss, this run | 5.247 | 4.809 | 4.461 | 4.265 | 4.072 | 3.830 | 3.718 | |
| train loss, 10-01 | 5.025 | 4.685 | 4.386 | 4.228 | 4.033 | 3.876 | 3.759 | |

* **−0.43 at e300, −0.48 over the scored tail.** That's inside the ±0.39 95 % half-width for one run
  at e300, and just outside it on the tail mean. At one seed, it's at most a small regression.
* **Train loss ends lower** (3.718 vs 3.759). Over 25-epoch windows the mean difference goes
  +0.008 (e201–225), −0.005, −0.011, −0.024 (e276–300, below on 22 of 25 epochs). The DeiT recipe
  fits the training set at least as well; the gap is in what it generalises, not in optimisation.
  (Train loss is under Mixup/CutMix, and their draw changed, so this is a loose comparison.)
* Against DeiT-Ti's published 72.2 (live model): this run reports the EMA. A live-weight re-score of
  the final state (`runs/2026-10-01-vit-jax-bf16-300ep/score_arms.py`) would give the comparable
  number; on the 10-01 run, EMA was worth +0.23. Not done.
* What the comparison can't separate: batch 512 → 1024 (and lr ×2), clip on → off, the schedule, the
  Mixup/CutMix draw, the RandAugment fill, the repeated-aug placement and the EMA ramp all moved
  together. The pair this run belongs to is with the verified rerun on the same recipe, not with
  10-01.

## Pace

* **579 s an epoch** by the epoch clock (min 559, max 622), eval every 5th epoch included; 571.6 s of
  training (~457 ms a 1024-image step) + ~33 s of val.
* 48.25 h in all, against the conf's ~48 h ares estimate. The 10-01 run at batch 512 took 45.91 h on
  the same box, so batch 1024 costs about 5 % here.

## Artifacts

* Checkpoints, outside the repo in `/home/skoonce/vit_tiny_jax_2611/`:
  * the EMA weights for every epoch (`vit_tiny_imagenet_e{1..300}.bin`)
  * the full train state for the last 3 epochs
  * the final `vit_tiny_imagenet.state.npz`
* `attempt.log` / `full.log` / `master.log`, `epoch_clock.tsv`, `edac.tsv`, the two watcher scripts
* `vit_jax_curve.csv`, written by `summarize.sh`

## Rescore and pairing (2026-10-16, atlas CPU)

`rescore.sh`: the final `vit_tiny_imagenet.state.npz` through `score_arms.py` (copied from the 10-01
run; the generated trainer is this run's, DeiT init and the f32 eval hook), JAX on CPU
(`~/.venv-score`), writing `bitmaps/jax_e300_{ema,live}_{bf16,f32}.bin` + the labels. Local only
(`runs/**/*.bin`).

| arm | top-1 | top-5 |
|---|---|---|
| EMA, f32 | 35,826 / 50,000 = **71.652** | 45,494 = 90.988 |
| EMA, bf16 | 35,826 = 71.652 | 45,493 = 90.986 |
| live, f32 | 35,937 / 50,000 = **71.874** | 45,561 = 91.122 |
| live, bf16 | 35,948 = 71.896 | 45,560 = 91.120 |

* The EMA f32 arm is 7 images over the run's own e300 line (35,819): the CPU compile against the
  four-card one, the class `sharded_eval_gate.sh` documents.
* **Live beats the shadow**, +0.22, McNemar p = 0.0009 (489 / 600 discordant). The constant 0.99996
  averages the last ~25k steps (20 epochs) of a schedule still rising at the end.

McNemar against the verified run (`runs/2026-10-14-vit-deit-verified-smx-bf16-300ep/bitmaps/`),
`scripts/demos/mcnemar.py`, f32 arms:

| pairing | only JAX right | only verified right | agree | exact p |
|---|---|---|---|---|
| EMA vs EMA (the verified run's own e300 bitmap) | 2,347 | 2,327 | 90.7 % | **0.78** |
| live vs live (`ver_e300_live.bin`) | 2,434 | 2,361 | 90.4 % | **0.30** |

A tie both ways. Ch 9's marker is written out.

## Reproduce

    bash runs/2026-10-11-vit-deit-jax-bf16-300ep/summarize.sh
    bash runs/2026-10-11-vit-deit-jax-bf16-300ep/rescore.sh      # the four bitmaps, CPU ~15 min
