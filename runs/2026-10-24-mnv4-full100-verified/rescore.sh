#!/bin/bash
# McNemar for the 100-epoch MNv4 pair (2026-10-26, ares). The verified half wrote its e100 bitmap in training
# (LEAN_MLIR_DUMP_CORRECT). The JAX e100 state is scored through eval_full50k.py at EVAL_DTYPE=f32 with a
# bitmap — on ONE card beside the running 500-epoch verified job, without preallocation (~4 GB free a card).
set -u
cd "$(dirname "$0")/../.." || exit 1
R=runs/2026-10-24-mnv4-full100-verified
(cd jax && JAX_COMPILATION_CACHE_DIR=/home/skoonce/.jax_cache TFDS_DATA_DIR=/home/skoonce/tensorflow_datasets \
  CUDA_VISIBLE_DEVICES=3 XLA_PYTHON_CLIENT_PREALLOCATE=false \
  GEN=generated/generated_mobilenet_v4_imagenet_full100.py \
  CKPT=/home/skoonce/mnv4_full100_dp26_2624/mobilenet_v4_imagenet_full100_e100.state.npz BATCH=50 PROTOCOL=train EVAL_DTYPE=f32 \
  DUMP_CORRECT=../$R/bitmaps/mnv4_full100_jax_f32 LABEL="mnv4 full100 jax e100 f32" \
  ../.venv/bin/python -u scripts/eval_full50k.py) 2>&1 | tee $R/rescore_jax_f32.log
.venv/bin/python scripts/demos/mcnemar.py $R/bitmaps/mnv4_full100_jax_f32.bin $R/bitmaps/*_e100.bin --label-a jax-f32 --label-b verified 2>&1 | tee $R/mcnemar.txt
