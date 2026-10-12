#!/usr/bin/env bash
# EfficientNet-B0 ImageNet, the JAX reference at the `full` recipe as TF's own code has it
# (planning/recipe_prep.md §7, 2026-10-12): two 100-step epochs on four cards at the default arena,
# the f32 eval line before every validation, the warmup rates, the step time. trainer_smoke.py is
# jax/generated/generated_efficientnet_b0_imagenet_full.py with EPOCHS=2 and steps_per_epoch=100:
#   patch -o runs/2026-10-12-enet-jax-smoke/trainer_smoke.py jax/generated/generated_efficientnet_b0_imagenet_full.py runs/2026-10-12-enet-jax-smoke/trainer_smoke.patch
set -u
cd "$(dirname "$0")/../../jax" || exit 1
D=../runs/2026-10-12-enet-jax-smoke
mkdir -p /home/skoonce/enet_smoke_2612
env JAX_COMPILATION_CACHE_DIR=/home/skoonce/.jax_cache LEAN_MLIR_CKPT_EVERY=1000 \
    TFDS_DATA_DIR=/home/skoonce/tensorflow_datasets CUDA_VISIBLE_DEVICES=0,1,2,3 \
    LEAN_MLIR_PARAMS_OUT=/home/skoonce/enet_smoke_2612/efficientnet_b0_imagenet \
    ../.venv/bin/python -u $D/trainer_smoke.py > $D/full.log 2>&1
echo "exit $?" >> $D/full.log
