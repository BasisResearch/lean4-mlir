#!/bin/bash
# MobileNetV2 TF-slim-README smoke (2026-10-12): the re-emitted `full` trainer (TF1 RMSProp at 0.12 on
# 256, x0.98 / 2.5 ep staircase, wd off BN/bias/depthwise, truncated-normal 0.09, dropout 0.2, LS 0.1,
# EMA 0.9999 TF-form, BN 0.997 / 1e-3, slim's crop + bilinear + distort_color + (x-0.5)*2, f32 eval;
# planning/recipe_prep.md §6), two 100-step epochs each validated in f32. trainer_smoke.py =
# jax/generated/<trainer>.py + trainer_smoke.patch (not committed). At XLA's default arena.
set -u
R=/home/skoonce/lean/klawd_max_power/lean4-jax-mlir
D=$R/runs/2026-10-12-mnv2-jax-smoke
cd $R/jax || exit 1
mkdir -p /home/skoonce/mnv2_smoke_2612
env JAX_COMPILATION_CACHE_DIR=/home/skoonce/.jax_cache LEAN_MLIR_PARAMS_OUT=/home/skoonce/mnv2_smoke_2612/mobilenet_v2_imagenet_full LEAN_MLIR_CKPT_EVERY=1000 \
    TFDS_DATA_DIR=/home/skoonce/tensorflow_datasets CUDA_VISIBLE_DEVICES=0,1,2,3 ../.venv/bin/python -u $D/trainer_smoke.py > $D/full_default_arena.log 2>&1
echo "exit $?" >> $D/full_default_arena.log
rm -rf /home/skoonce/mnv2_smoke_2612
echo JAX_SMOKE_DONE
