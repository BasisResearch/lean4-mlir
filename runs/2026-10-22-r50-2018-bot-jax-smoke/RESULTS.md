# ResNet-50-2018 Bag-of-Tricks JAX smoke — 2026-10-22, ares (4× 4060 Ti)

The re-emitted `generated_resnet50_imagenet_2018.py` (`WD_MASK`; 427d8cda) cut to one 50-step epoch
(`trainer_smoke.patch`; `run.sh`), state to a scratch `LEAN_MLIR_PARAMS_OUT`, removed. `lr=0.100000
batch_size=256 (4 devices x 64) params=25557032`; `[Epoch 1] lr=0.02 loss(train_avg)=6.9728
val_top1=200/50000 val_top5=0.0139` (29.2 s train incl. compile, 17.7 s val); exit 0.
