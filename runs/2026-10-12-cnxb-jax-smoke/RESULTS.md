# ConvNeXt-B reference (JAX) smoke at the official recipe — 2026-10-12, ares (4× 4060 Ti)

The re-emitted `generated_convnext_b_imagenet.py` (`convNeXtBImagenetConfig`, planning/recipe_prep.md §4: an effective batch of 4096
as `GRAD_ACCUM = 16` micro-batches of 256 = 4 × 64, lr 4e-3, no clip, the per-step cosine floored at min_lr 1e-6
with the 20-epoch warmup from 0, Mixup-or-CutMix drawn per batch at p 0.5, img_mean RandAugment fill, timm's
`ModelEma` constant from step 0, f32 eval; ConvNeXt has no BatchNorm, so the accumulation is exact) with the
smoke patch `trainer_smoke.patch` (`EPOCHS = 2`, `steps_per_epoch = 25` = 400 micro-batches an epoch, validate
every epoch). `trainer_smoke.py` is that copy (not committed). Run from `jax/` as `jax_job.sh` runs the committed
trainer, through `runs/2026-10-12-cnx-jax-smoke/run.sh` (one script for T, S and B; each at the default arena
first, re-run at 0.97 only on RESOURCE_EXHAUSTED). 88,591,464 parameters.

## 1. The arena

**At XLA's default arena the run dies in the f32 EVAL forward** (`full_default_arena.log`): the 25 training steps complete, then the first validation raises *RESOURCE_EXHAUSTED: Out of memory while trying to allocate 7.46GiB* in `jit_eval_batch` — `evalF32`'s f32 forward of B at 64 per device, on top of the resident training state, does not fit the 11.68 GiB default; the one-shot trainer validated in bf16. At `XLA_PYTHON_CLIENT_MEM_FRACTION=0.97` (`full.log`, the numbers below) both epochs train and validate. The conf carries the fraction in `ENV_EXTRA` and asserts it (trap 2 of recipe_prep §4).

## 2. Two epochs of 25 optimizer steps

Header `lr=0.004000  batch_size=4096 (4 devices x 1024)` and `grad-accum=16x  micro_batch=256 (4 devices x 64)
-> effective_batch=4096  (LR targets effective)`; `eval: f32 forward (evalF32)` before each validation:

    [Epoch 1] lr=0.0002 loss(train_avg)=6.9785 val_top1=57/50000 (0.0011) val_top5=0.0051 val_loss=7.1121  [299.3s train, 61.4s val]
    [Epoch 2] lr=0.0004 loss(train_avg)=6.9079 val_top1=57/50000 (0.0011) val_top5=0.0052 val_loss=7.1097  [140.7s train, 55.0s val]

* The warmup is PER STEP from 0, as the official `utils.cosine_scheduler` ramps it: with the smoke's 25 steps an
  epoch, `warmup_steps = 25 × 20 = 500`, so step 25 reads 4e-3 × 25 / 500 = 2e-4 and step 50 reads 4e-4 — the
  logged `lr=0.0002` / `lr=0.0004`. (The per-epoch form, which would hold 1e-6 then step, is asserted ABSENT by
  the conf.)
* The f32 swap precedes the first `eval_batch` trace (the emitted assertion did not fire) and the second
  validation reuses the trace; the loss descends across the 50 steps.
* **Pace: 5.63 s a 4096-row optimizer step** (epoch 2's 25 steps in the train seconds above, compile
  excluded) = **352 ms a 256-row micro-batch**, against 400 ms a 256-row step (the one-shot trainer, 2026-10-07, `runs/2026-10-07-d17-reprobe`). 312 steps an epoch
  (~1,810 s with the 55–61 s f32 validation) → **~151 h for 300 epochs on this box**; the conf's
  `EPOCH_SECS` / `ETA` carry it.
