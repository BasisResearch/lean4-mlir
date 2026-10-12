# ViT-B reference (JAX) smoke at DeiT's recipe as timm runs it — 2026-10-11, ares (4× 4060 Ti)

The re-emitted `generated_vit_b_imagenet_accum.py` (`vitBImagenetConfigAccum`: effective batch 1024 as
`GRAD_ACCUM = 2` micro-batches of 512 = 4 × 128, lr 1e-3, no clip, timm's per-epoch cosine from 1e-6,
per-batch Mixup/CutMix draw, img_mean RandAugment fill, adjacent RA copies, constant EMA decay, f32 eval —
Tiny's lines at B's width; ViT has no BatchNorm, so the accumulation is exact) with the three-line smoke
patch `trainer_smoke.patch` (`EPOCHS = 2`, `steps_per_epoch = 200`, `_do_val = True`). `trainer_smoke.py`
is that copy. Run from `jax/` as `jax_job.sh` runs the committed trainer.

## 1. At XLA's default arena: RESOURCE_EXHAUSTED (`full_default_arena.log`)

Header `lr=0.001000  batch_size=1024 (4 devices x 256)  epochs=2  params=86567656` and
`grad-accum=2x  micro_batch=512 (4 devices x 128)  -> effective_batch=1024  (LR targets effective)`, then
the first `train_step` dies: *"Out of memory while trying to allocate 8.71GiB"* — the `lax.scan` over the two
micro-batches keeps one micro-batch's activations live, and at 128 per device for ViT-B that plus the
optimizer state exceeds the 11.68 GiB default. (The 2026-10-07 `accum` recipe ran 4 micro-batches of 128
global, 32 per device, which is why it fit; the verified render at the same 4 × 128 peaks at 13.83 GiB of
the 15.11 GiB raised arena, `runs/2026-10-11-vitb-default-emabf16-4gpu/`.)

## 2. At `XLA_PYTHON_CLIENT_MEM_FRACTION=0.97` (`full.log`)

The same trainer and patch with `XLA_PYTHON_CLIENT_MEM_FRACTION=0.97` (15.11 GiB; the verified render of
this step needs the same budget), two epochs of 200 optimizer steps, both validated:

    eval: f32 forward (evalF32)
    [Epoch 1] lr=1e-06 loss(train_avg)=7.0028 val_top1=42/50000 (0.0008) val_top5=0.0045 val_loss=7.0579  [336.4s train, 48.1s val]
    [Epoch 2] lr=0.000201 loss(train_avg)=6.9258 val_top1=42/50000 (0.0008) val_top5=0.0046 val_loss=7.0465  [326.7s train, 37.7s val]

* Epoch 1 at lr 1e-6 (timm's warmup floor), epoch 2 at 1e-6 + (1e-3 − 1e-6)/5 — the per-epoch scheduler,
  as `sched_timm_gate.py` holds it to timm 1.0.28 (0 over 300 epochs on this trainer).
* The f32 swap precedes the first `eval_batch` trace (the emitted assertion did not fire) and the second
  validation reuses the trace.
* **Pace: 1.63–1.78 s a 1024-row optimizer step** (the per-100-step averages 1,730 / 1,682 / 1,826 / 1,778 ms;
  epoch 2's 200 steps in 326.7 s), ~40 s the f32 validation → 1,251 steps × ~1.7 s + 40 s ≈ 2,170 s an epoch,
  **~180 h for 300 epochs on this box** — within 5 % of the verified half's 2 × 859 ms micro-steps. The conf
  carries the fraction in `ENV_EXTRA` and the ETA.
