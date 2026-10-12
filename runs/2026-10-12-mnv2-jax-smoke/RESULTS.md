# MobileNetV2 JAX smoke at TF-slim's README recipe — 2026-10-12, ares (4× 4060 Ti)

The re-emitted `full` trainer (`jax/generated/generated_mobilenet_v2_imagenet_full.py`,
planning/recipe_prep.md §6: TF1's RMSProp at 0.12 on 256 with the rate inside the momentum term, ×0.98
every 2.5 epochs as a staircase from step 0, coupled L2 4e-5 off BN γ/β, biases and the depthwise kernels,
truncated-normal σ 0.09 on all 53 kernels, dropout 0.2, label smoothing 0.1, the EMA shadow at 0.9999 in
TF's warmup-corrected form, BN 0.997 / ε 1e-3, slim's inception crop (area ≥ 0.05, aspect 0.75–1.33, 100
attempts) resized bilinear without antialias, flip, `distort_color` in fast mode, `(x − 0.5) × 2`, the
validation forward in f32), patched to two 100-step epochs (`trainer_smoke.patch`; the two `SMOKE` lines
only). `run.sh`; the checkpoint directory `~/mnv2_smoke_2612/` was deleted afterwards.

## `full_default_arena.log` — XLA's default arena, 4 × 64

    lr=0.120000  batch_size=256 (4 devices x 64)  epochs=2  params=3504872
    step 100/200  loss=7.0175  lr=0.12  (324.0ms/step avg)      ← includes the compile
      eval: f32 forward (evalF32)
    [Epoch 1] lr=0.12 loss(train_avg)=7.2791 val_top1=50/50000 (0.001)  [32.4s train, 21.3s val]
    step 200/200  loss=6.8784  lr=0.12  (309.0ms/step avg)
      eval: f32 forward (evalF32)
    [Epoch 2] lr=0.12 loss(train_avg)=6.9593 val_top1=66/50000 (0.0013) [8.1s train, 14.3s val]
    exit 0

* The rate reads 0.12 on both epochs: both sit inside the first 2.5-epoch stair (`np.floor(_ep / 2.5)`
  = 0), as the recipe has it; no warmup line.
* The f32 eval line precedes every validation (F8); no assertion, no RESOURCE_EXHAUSTED at the default
  arena — MobileNetV2 at 4 × 64 is far inside it.
* The loss moves 7.28 → 6.96 over 200 steps at a rate (0.12 under ε = 1.0, ≈ SGD-momentum at 0.12 on a
  fresh net) that is the README's own; 66 / 50,000 at 200 steps is where a 420-epoch run starts.
* The trainer carries `EMA_DECAY = 0.999900` with `d = min(EMA_DECAY, (1 + step) / (10 + step))`, and
  the saved state holds `ema_params` / `ema_bn` (840 arrays), which `jax/scripts/eval_full50k.py`
  scores by default (`REGION=auto`).

## Pace and ETA

Epoch 2, compile excluded: **8.1 s for 100 optimizer steps of 256 = 81 ms a step**, ~3,160 img/s —
feed-bound at the same pace as the retired 350-epoch run (38.4 h / 350 ep = 395 s an epoch = 79 ms a
step on the predecessor cards). 5,004 steps × 0.081 s = 405 s an epoch + the streamed f32 validation
(~15–20 s) ≈ **420 s an epoch → 420 epochs ≈ 49 h**. The conf's `EPOCH_SECS` is 420.

Two `cuda_timer.cc: Delay kernel timed out` lines during the first validation are XLA's autotuner
warning on a cold kernel, not a failure (the MNv4 and ConvNeXt smokes' logs carry the same lines).
