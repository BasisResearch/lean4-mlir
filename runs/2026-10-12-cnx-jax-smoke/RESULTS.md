# ConvNeXt-T reference (JAX) smoke at the official recipe — 2026-10-12, ares (4× 4060 Ti)

The re-emitted `generated_convnext_tiny_imagenet_full.py` (`convNeXtTinyImagenetConfigFull`, planning/recipe_prep.md §4: an effective batch of 4096
as `GRAD_ACCUM = 16` micro-batches of 256 = 4 × 64, lr 4e-3, no clip, the per-step cosine floored at min_lr 1e-6
with the 20-epoch warmup from 0, Mixup-or-CutMix drawn per batch at p 0.5, img_mean RandAugment fill, timm's
`ModelEma` constant from step 0, f32 eval; ConvNeXt has no BatchNorm, so the accumulation is exact) with the
smoke patch `trainer_smoke.patch` (`EPOCHS = 2`, `steps_per_epoch = 25` = 400 micro-batches an epoch, validate
every epoch). `trainer_smoke.py` is that copy (not committed). Run from `jax/` as `jax_job.sh` runs the committed
trainer, through `runs/2026-10-12-cnx-jax-smoke/run.sh` (one script for T, S and B; each at the default arena
first, re-run at 0.97 only on RESOURCE_EXHAUSTED). 28,589,128 parameters.

## 1. The arena

At XLA's default arena (`full_default_arena.log`): trains and validates.

## 2. Two epochs of 25 optimizer steps

Header `lr=0.004000  batch_size=4096 (4 devices x 1024)` and `grad-accum=16x  micro_batch=256 (4 devices x 64)
-> effective_batch=4096  (LR targets effective)`; `eval: f32 forward (evalF32)` before each validation:

    [Epoch 1] lr=0.0002 loss(train_avg)=6.9647 val_top1=50/50000 (0.001) val_top5=0.0045 val_loss=7.0593  [207.2s train, 31.2s val]
    [Epoch 2] lr=0.0004 loss(train_avg)=6.8999 val_top1=49/50000 (0.001) val_top5=0.0045 val_loss=7.0576  [70.7s train, 25.3s val]

* The warmup is PER STEP from 0, as the official `utils.cosine_scheduler` ramps it: with the smoke's 25 steps an
  epoch, `warmup_steps = 25 × 20 = 500`, so step 25 reads 4e-3 × 25 / 500 = 2e-4 and step 50 reads 4e-4 — the
  logged `lr=0.0002` / `lr=0.0004`. (The per-epoch form, which would hold 1e-6 then step, is asserted ABSENT by
  the conf.)
* The f32 swap precedes the first `eval_batch` trace (the emitted assertion did not fire) and the second
  validation reuses the trace; the loss descends across the 50 steps.
* **Pace: 2.83 s a 4096-row optimizer step** (epoch 2's 25 steps in the train seconds above, compile
  excluded) = **177 ms a 256-row micro-batch**, against 179 ms a 256-row step (the one-shot global-256 trainer, 2026-09-04→09-07 on the 3060 box; its 918 s/epoch). 312 steps an epoch
  (~910 s with the 25–31 s f32 validation) → **~76 h for 300 epochs on this box**; the conf's
  `EPOCH_SECS` / `ETA` carry it.
