# EfficientNet-B0, `full` recipe as TF TPU EfficientNet's own code runs it, bf16 — JAX reference path, 350 epochs

**✅ 77.168 % top-1 / 93.39 % top-5** (38,584 / 50,000, EMA shadow, fp32 eval), epoch 350/350,
95 % CI 76.80–77.54.
* Landed 2026-10-18 12:06:33 UTC.
* **42.49 h** of trainer time, on attempt 1.
* Zero restarts, zero thermal rests, EDAC 0 / 0 throughout.

The JAX half of the TF-recipe EfficientNet-B0 pair (`dedb34f5`, "EfficientNet-B0 as TF TPU
EfficientNet's own code runs it, every row, on both paths"; `planning/recipe_prep.md` §7; ch 7's
marker). The verified half, `runs/2026-10-16-enet-verified-bf16-350ep/`, was chained behind this run
(`chain_after_jax.sh`) and launched 2026-10-18 12:07:30 UTC. It landed 77.208 / 93.464 on
2026-10-21: a tie (+0.04).
* Job `scripts/jobs/enet-full-jax-4gpu.conf`, unit `enet-tf-jax`, launched 2026-10-16 17:36:32 UTC on
  the 4× 3060 box (mars), tree at `913ff07c`, unchanged for the whole run.
* Fresh start: `/home/skoonce/enet_tf350_2612/` was a new lineage. The 09-04 run's checkpoints
  (`/home/skoonce/enet_b0_350_4gpu/`) are untouched.

## The run, from its own output

* `lr=0.016000  batch_size=256 (4 devices x 64)  epochs=350  params=5288548`
* `steps_per_epoch=5004  total_steps=1751400`
* `eval: f32 forward (evalF32)` on all 350 epochs

What the conf's precheck asserted against the emitted trainer: TF's crop sampler with the centre-crop
fallback and TF1's legacy bicubic on both resizes; AutoAugment v0 as `autoaugment.py` applies it
(TranslateY at `(m/10)·250` px, NEAREST geometry); TF1's RMSProp with the rate inside the momentum
buffer; `main.py`'s decay set (BN γ/β alone exempt, the biases decay); the classifier at
`U(±1/√1000)`; TF EfficientNet's `_decode_and_center_crop` at eval; the f32 eval forward; BN ε 1e-3 /
decay 0.99; the ×0.97-every-2.4-epochs staircase; the `0.2·i/16` drop-connect ramp; no RandAugment.

Trainer: `jax/.lake/build/generated_efficientnet_b0_imagenet_full.py`, byte-identical to the committed
`jax/generated/` copy (`regen_jax_generated.sh check` clean), on `/home/skoonce/.venv-cuda`.

## Curve (top-1 / top-5, EMA shadow, scored every epoch)

| epoch | 10 | 25 | 50 | 100 | 150 | 200 | 250 | 300 | **350** |
|---|---|---|---|---|---|---|---|---|---|
| top-1 | 62.81 | 68.33 | 71.30 | 74.01 | 75.21 | 76.14 | 76.67 | 77.06 | **77.17** |
| top-5 | 84.71 | 88.44 | 90.09 | 91.66 | 92.37 | 92.85 | 93.13 | 93.34 | **93.39** |
| train loss | 3.491 | 3.199 | 3.016 | 2.790 | 2.631 | 2.513 | 2.424 | 2.352 | 2.300 |

The last 25 epochs average **77.176 / 93.406** (range 77.05–77.30; best 77.304 at e345). The curve is
flat at the end: the e350 number is the tail mean, not the top of a rise.

## Against the 09-04 JAX run (77.15; timm-form recipe)

That run is the reference the 09-12 verified run (76.878) was paired with. Its per-epoch EMA curve is
`runs/2026-09-12-enet-verified-350ep/reference_curve.tsv`, which `summarize.sh` reads in place.

| epochs | 1–50 | 51–100 | 101–150 | 151–200 | 201–250 | 251–300 | 301–350 | e326–350 |
|---|---|---|---|---|---|---|---|---|
| mean Δtop-1 | +0.72 | +0.63 | +0.49 | +0.21 | +0.26 | +0.25 | +0.10 | **+0.02** |

* **The endpoint is the same:** 77.168 against the 09-04 run's in-training 77.18 (77.15 rescored),
  and the e326–350 means differ by +0.02. Both match the B0 paper's 77.1 / 93.3.
* The TF recipe leads early (+0.7 through e100) and the lead closes over the run. The recipe changes
  that moved together: TF1 RMSProp placement, the decay set (biases now decay, BN exempt), BN ε
  1e-5 → 1e-3, the staircase in place of the continuous schedule, the i/16 drop ramp, TF-form
  AutoAugment, TF1 bicubic, the TF eval crop, the classifier init and the f32 eval. One seed each, so
  none of these is separated.
* The pair this run belongs to is with the verified half on the same recipe, not with 09-04.

## Pace

* **436.9 s an epoch** by the epoch clock (min 434, max 482), eval of all 50,000 every epoch
  included; 426.7 s of training (~85 ms a 256-image step) + 10.2 s of val.
* 42.49 h in all, against the conf's ~49 h estimate (the smoke timed 99 ms a step, taken early in
  a 100-step epoch). The 09-04 run took 46.6 h on the same box.

## Artifacts

* Checkpoints, outside the repo in `/home/skoonce/enet_tf350_2612/`:
  * the EMA weights for every epoch (`efficientnet_b0_imagenet_e{1..350}.bin`)
  * the full train state for the last 3 epochs (`_e{348,349,350}.state.npz`)
  * the final `efficientnet_b0_imagenet.state.npz` and EMA `efficientnet_b0_imagenet.bin`
* `attempt.log` / `full.log` / `master.log`, `epoch_clock.tsv`, `edac.tsv`, the two watcher scripts
* `enet_jax_curve.csv`, written by `summarize.sh`

## Reproduce

    bash runs/2026-10-16-enet-full-jax-bf16-350ep/summarize.sh
