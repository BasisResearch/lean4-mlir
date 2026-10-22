#!/bin/bash
# ResNet-50-2018 Bag-of-Tricks JAX smoke (2026-10-22, imagenet_finish_line.md item 7): the re-emitted
# trainer (WD_MASK), one 50-step epoch + the validation.
# trainer_smoke.py = jax/generated/generated_resnet50_imagenet_2018.py + trainer_smoke.patch.
set -u
R=/home/skoonce/lean/klawd_max_power/lean4-jax-mlir
D=$R/runs/2026-10-22-r50-2018-bot-jax-smoke
cd $R/jax || exit 1
mkdir -p /home/skoonce/r50_bot_smoke
env JAX_COMPILATION_CACHE_DIR=/home/skoonce/.jax_cache LEAN_MLIR_PARAMS_OUT=/home/skoonce/r50_bot_smoke/resnet50_imagenet_2018 LEAN_MLIR_CKPT_EVERY=1000 \
    TFDS_DATA_DIR=/home/skoonce/tensorflow_datasets CUDA_VISIBLE_DEVICES=0,1,2,3 ../.venv/bin/python -u $D/trainer_smoke.py > $D/smoke.log 2>&1
echo "exit $?" >> $D/smoke.log
rm -rf /home/skoonce/r50_bot_smoke
echo JAX_SMOKE_DONE
