# ViT-Ti reference (JAX) smoke at DeiT's recipe as timm runs it — 2026-10-11, ares (4× 4060 Ti)

The re-emitted `generated_vit_tiny_imagenet.py` (batch 1024 as 4 × 256, lr 1e-3, no clip, timm's
per-epoch cosine from 1e-6, per-batch Mixup/CutMix draw, img_mean RandAugment fill, adjacent RA copies,
constant EMA decay, f32 eval) with one patch, `_do_val = True` (validation after every epoch instead of
every 5th; `trainer_smoke.py` is that copy). One epoch, then killed.

* Header: `lr=0.001000  batch_size=1024 (4 devices x 256)  epochs=300  params=5717416`.
* **Epoch 1 trains at lr 1e-6** — timm's `CosineLRScheduler` with `t_in_epochs`: epoch 0 is the
  `warmup_lr` floor, the ramp reaches the peak at epoch 5 (`scripts/gates/sched_timm_gate.py`, exact).
  `[Epoch 1] lr=1e-06 loss(train_avg)=6.9276 val_top1=49/50000 (0.001)` — chance, as DeiT's own
  first epoch is.
* **Pace: 448 ms a 1024-row step, 559.7 s train + 17.5 s val an epoch** → ~48 h for 300 epochs on
  this box. (The 10-01 run at 4 × 128 ran 380 ms a 512-row step here, feed-bound; the 3060 box did
  220 ms / 545 s an epoch at 512 and is unmeasured at 1024.)
* What this smoke found: the per-epoch validation is an inline `eval_batch` loop, not `evaluate()`,
  so the first emit's f32 swap was not on the scoring path — no `eval: f32 forward` line printed. The
  emitter now swaps at that loop too, asserting `eval_batch` had no prior trace; `run_evalpath.sh`
  (40-step epochs) is the re-check, below.

## Eval-path smoke
`run_evalpath.sh` — the re-emitted trainer with `_do_val = True` and `steps_per_epoch = 40`
(`trainer_evalpath.patch`), two epochs:

    eval: f32 forward (evalF32)
    [Epoch 1] lr=1e-06 loss(train_avg)=6.9437 val_top1=45/50000 (0.0009) ...  [71.3s train, 24.8s val]
    eval: f32 forward (evalF32)
    [Epoch 2] lr=0.000201 loss(train_avg)=6.9267 val_top1=48/50000 (0.001) ...  [15.6s train, 18.8s val]

The swap precedes the first `eval_batch` trace (the emitted assertion did not fire), the second
validation reuses the f32 trace (no retrace), and epoch 2's rate is timm's second warmup value,
1e-6 + (1e-3 − 1e-6)/5. Killed after epoch 2. `trainer_smoke.patch` / `trainer_evalpath.patch` are
against the committed `jax/generated/generated_vit_tiny_imagenet.py` (this recipe's emit).
