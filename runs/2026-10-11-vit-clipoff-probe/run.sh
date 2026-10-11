#!/bin/bash
# D2 probe (2026-10-11): ViT-Ti JAX reference at DeiT's batch 1024 (4 x 256), lr 1e-3, NO gradient clip.
# The trainer is jax/generated/generated_vit_tiny_imagenet.py (the emit at 178fe4c2) with three
# constants patched — `trainer_noclip_1024.patch`, each hunk marked `# PROBE`; `git show
# 178fe4c2:jax/generated/generated_vit_tiny_imagenet.py | patch -o trainer_noclip_1024.py` rebuilds it. Question: does warmup to 1e-3 collapse without the clip? The
# collapse that put the clip in was seen on Xavier init past lr ~1.6e-4; vitInit has been in since.
# Kill after epoch ~7 (peak lr is reached at epoch 5). 300-epoch schedule kept so warmup is DeiT's.
set -u
cd "$(dirname "$0")/../../jax" || exit 1
exec env JAX_COMPILATION_CACHE_DIR=/home/skoonce/.jax_cache \
  LEAN_MLIR_PARAMS_OUT=/home/skoonce/vit_probe_clipoff/vit_tiny_imagenet LEAN_MLIR_CKPT_EVERY=1000 \
  TFDS_DATA_DIR=/home/skoonce/tensorflow_datasets CUDA_VISIBLE_DEVICES=0,1,2,3 \
  ../.venv/bin/python -u ../runs/2026-10-11-vit-clipoff-probe/trainer_noclip_1024.py \
  > ../runs/2026-10-11-vit-clipoff-probe/full.log 2>&1
