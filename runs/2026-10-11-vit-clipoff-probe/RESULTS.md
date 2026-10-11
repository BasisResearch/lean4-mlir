# D2 probe: ViT-Ti (JAX reference) at DeiT's batch 1024 and lr 1e-3, WITHOUT gradient clipping

The question (`planning/imagenet_parity.md` D2, ch 9's marker): our `gradClipNorm := 1.0` went in against
a collapse to chance seen on the Xavier initialization once warmup passed lr ~1.6e-4. DeiT does not
clip (`--clip-grad` defaults to None). `vitInit` (timm's σ 0.02) has been in since 2026-09-25 and the
rerun doubles the rate (5e-4 → 1e-3 at batch 1024), so the probe runs the TARGET configuration through
warmup to the peak and one epoch past it, clip off.

* Trainer: `trainer_noclip_1024.patch` on the committed `jax/generated/generated_vit_tiny_imagenet.py`
  (pre-rerun emit) with three constants patched, each marked `# PROBE`: `LR = 0.001`, `BATCH_SIZE`
  1024 (4 × 256), and the two clip lines removed. The 300-epoch schedule is kept so the warmup is
  DeiT's (5 epochs, per step here; the rerun steps it per epoch).
* Launched 2026-10-11 ~16:15 UTC on ares (4× 4060 Ti) by `run.sh`; killed after epoch 6.
* Pace: ~444 ms/step at 1024, ~540 s an epoch (feed-bound on this box; the run goes to mars).

## Epochs (train loss averaged over the epoch; val skipped — the trainer scores every 5th)

| epoch | lr at end | train loss (avg) | val | train s |
|---|---|---|---|---|
| 1 | 0.0002 | 6.807 | — | 589.2 |
| 2 | 0.0004 | 6.588 | — | 540.6 |
| 3 | 0.0006 | 6.4563 | — | 539.9 |
| 4 | 0.0008 | 6.3439 | — | 547.2 |
| 5 | 0.001 | 6.2125 | val top-1 14.66 % | 531.6 |
| 6 | 0.001 | 6.1055 | — | 526.3 |

## Verdict: **no collapse — DeiT's no-clip stands at DeiT's batch and rate.**

The epoch-averaged train loss falls monotonically through the whole warmup — 6.81, 6.59, 6.46, 6.34,
6.21 — reaches the 1e-3 peak at epoch 5 and keeps falling one full epoch at the peak (6.11); the
per-step loss stays in its usual 5.9–6.4 band at lr 1e-3 with no excursion toward ln(1000) = 6.91.
Epoch-5 val top-1 is 14.66 % / top-5 32.75 %; the 10-01 clipped run at 512 / 5e-4 read 13.99 % / 31.79 %
at its epoch 5, so the larger batch at twice the rate is level with it there. The collapse that put the
clip in was a property of the Xavier initialization, not of the rate.

**Consequence (D2):** `vitTinyImagenetConfig.gradClipNorm := 0.0` (the JAX trainer emits no `gn =`
lines; the conf's precheck asserts their absence), and the verified render is the no-clip
`vitin_emadp256x4wxdropeps0000001erfbf16` (0 `stablehlo.minimum` ops, asserted). Ch 9's marker loses
"no gradient clip" when the pair lands. Six epochs; killed after epoch 6, no checkpoint kept.

