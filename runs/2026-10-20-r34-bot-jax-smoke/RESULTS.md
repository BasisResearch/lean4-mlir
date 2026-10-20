# ResNet-34 Bag-of-Tricks JAX smoke — 2026-10-20, ares (4× 4060 Ti)

The re-emitted `generated_resnet34_imagenet.py` (`WD_MASK`, BN momentum 0.9, 16 zero-γ inits;
427d8cda) cut to one 50-step epoch (`trainer_smoke.patch`; `run.sh`), state written to a scratch
`LEAN_MLIR_PARAMS_OUT` and removed.

- `lr=0.100000 batch_size=256 (4 devices x 64) params=21797672`
- `[Epoch 1] lr=0.02 loss(train_avg)=6.958 val_top1=87/50000 (0.0017) val_top5=0.0077` —
  21.7 s train (compile included), 15.8 s validation.
- full train state saved (292 arrays, step 50); exit 0.

Train loss after the capped epoch: 6.958 here, 6.959 on the verified smoke beside it.
