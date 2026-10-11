#!/bin/bash
# JAX ViT-Ti smoke (2026-10-11): the re-emitted DeiT-as-timm trainer, one epoch + the f32 eval. The only
# patch is `_do_val = True` (eval after every epoch instead of every 5th). Kill after epoch 1's eval.
# Reads: lr=0.001000 / batch 1024 header, the per-epoch lr line, "eval: f32 forward (evalF32)".
# trainer_smoke.py = the committed jax/generated/generated_vit_tiny_imagenet.py + trainer_smoke.patch
# (`patch -o trainer_smoke.py jax/generated/generated_vit_tiny_imagenet.py trainer_smoke.patch` from the repo root).
set -u
cd "$(dirname "$0")/../../jax" || exit 1
exec env JAX_COMPILATION_CACHE_DIR=/home/skoonce/.jax_cache \
  LEAN_MLIR_PARAMS_OUT=/home/skoonce/vit_smoke_2611/vit_tiny_imagenet LEAN_MLIR_CKPT_EVERY=1000 \
  TFDS_DATA_DIR=/home/skoonce/tensorflow_datasets CUDA_VISIBLE_DEVICES=0,1,2,3 \
  ../.venv/bin/python -u ../runs/2026-10-11-vit-jax-smoke/trainer_smoke.py \
  > ../runs/2026-10-11-vit-jax-smoke/full.log 2>&1
