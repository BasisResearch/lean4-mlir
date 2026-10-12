#!/bin/bash
# MobileNetV2 JAX smoke of slim's own validation decode (2026-10-12, D23): the re-emitted `full` trainer
# (TF 1's bilinear on train and eval, `preprocess_for_eval`'s central_crop 0.875 of both sides of the whole
# decode; planning/recipe_prep.md §6 addendum) patched to one 50-step epoch, then the full 50k f32 validation.
# trainer_smoke.py = jax/generated/<trainer>.py + trainer_smoke.patch (the two SMOKE lines only).
set -u
R=/home/skoonce/lean/klawd_max_power/lean4-jax-mlir
D=$R/runs/2026-10-12-mnv2-jax-smoke-evalcrop
cd $R/jax || exit 1
mkdir -p /home/skoonce/mnv2_smoke_evalcrop_2612
env JAX_COMPILATION_CACHE_DIR=/home/skoonce/.jax_cache LEAN_MLIR_PARAMS_OUT=/home/skoonce/mnv2_smoke_evalcrop_2612/mobilenet_v2_imagenet_full LEAN_MLIR_CKPT_EVERY=1000 \
    TFDS_DATA_DIR=/home/skoonce/tensorflow_datasets CUDA_VISIBLE_DEVICES=0,1,2,3 ../.venv/bin/python -u $D/trainer_smoke.py > $D/full_default_arena.log 2>&1
echo "exit $?" >> $D/full_default_arena.log
rm -rf /home/skoonce/mnv2_smoke_evalcrop_2612
echo JAX_SMOKE_DONE
