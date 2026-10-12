# ViT-S reference (JAX) smoke at DeiT's recipe as timm runs it — 2026-10-11, ares (4× 4060 Ti)

The re-emitted `generated_vit_s_imagenet.py` (`vitSImagenetConfig`: batch 1024 as 4 × 256, lr 1e-3, no
clip, timm's per-epoch cosine from 1e-6, per-batch Mixup/CutMix draw, img_mean RandAugment fill, adjacent
RA copies, constant EMA decay, f32 eval — Tiny's lines at S's width) with the three-line smoke patch
`trainer_smoke.patch` (`EPOCHS = 2`, `steps_per_epoch = 200`, `_do_val = True`; both epochs sit inside the
warmup, whose lr lines do not read `EPOCHS`). `trainer_smoke.py` is that copy. Run from `jax/` as
`jax_job.sh` runs the committed trainer (`JAX_COMPILATION_CACHE_DIR`, `TFDS_DATA_DIR`, four cards).

## 1. At XLA's default arena: RESOURCE_EXHAUSTED (`full_default_arena.log`)

Header `lr=0.001000  batch_size=1024 (4 devices x 256)  epochs=2  params=22050664`, then the first
`train_step` dies: *"Out of memory while trying to allocate 12.08GiB"*. The JAX graph at 4 × 256 wants
more than the 11.68 GiB the plugin's `memory_fraction = 0.75` leaves it, where the verified render of the
same step peaks at 10.75 GiB of the same budget (`runs/2026-10-11-vits-default-emabf16-4gpu/`) — the two
compilers lay the backward out differently, and XLA under `jax.jit` does not rematerialise toward a
budget the way the PJRT plugin path does for the committed artifact. The ViT-Ti trainer at the same 4 × 256
runs at the default (its activations are half the size).

## 2. At `XLA_PYTHON_CLIENT_MEM_FRACTION=0.97` (`full.log`)

The same trainer at the raised arena asks for MORE — *"Out of memory while trying to allocate 14.32GiB"*
against 15.11 — XLA's rematerialisation spends the room it is given (the ViT-B README's observation, here
past the wall). So the one-shot 4 × 256 `default` recipe does not run on these cards on the JAX side at
either budget; the verified render of the same step fits the default (10.75 GiB).

## 3. The `accum` recipe: 2 × 512 (`trainer_smoke_accum.py`, `trainer_smoke_accum.patch`)

`vitSImagenetConfigAccum` — the same effective 1024 as `GRAD_ACCUM = 2` micro-batches of 4 × 128, exact
under LayerNorm — is therefore the pair's JAX recipe, and the conf is `vits-accum-jax-4gpu` (renamed from
`vits-default-jax-4gpu`; ch 9's marker and §9.6's conf names follow). Same three-line patch on the emitted
`generated_vit_s_imagenet_accum.py`.
At XLA's DEFAULT arena (`full_accum.log`), two epochs of 200 optimizer steps, both validated:

    [Epoch 1] lr=1e-06 loss(train_avg)=6.9685 val_top1=44/50000 (0.0009) val_top5=0.0045 val_loss=6.9911  [170.0s train, 26.0s val]
    [Epoch 2] lr=0.000201 loss(train_avg)=6.8924 val_top1=45/50000 (0.0009) val_top5=0.0048 val_loss=6.9855  [129.5s train, 16.8s val]

* Header `grad-accum=2x  micro_batch=512 (4 devices x 128)  -> effective_batch=1024  (LR targets effective)`;
  `eval: f32 forward (evalF32)` before each validation, no assertion; epoch 1 at timm's 1e-6 floor,
  epoch 2 at the second warmup value.
* **Pace: 648 ms a 1024-row optimizer step** (epoch 2's 200 steps in 129.5 s; the per-100-step running
  averages, 1,051 / 850 / 869 / 814 ms, carry the first epoch's compile), 17 s the f32 validation →
  1,251 steps × ~0.65–0.70 s + 17 s ≈ 830–890 s an epoch, **~70–75 h for 300 epochs on this box** — the
  verified half's 650 ms one-shot step, to within the noise. No `XLA_PYTHON_CLIENT_MEM_FRACTION` needed
  at 4 × 128 a micro-batch; the conf leaves the arena at the default.
