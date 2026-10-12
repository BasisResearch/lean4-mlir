#!/bin/bash
# JAX ViT-B smoke (2026-10-11/12): the re-emitted DeiT-as-timm `accum` trainer (512 x 2), two 200-step epochs
# each validated in f32. trainer_smoke.py = jax/generated/generated_vit_b_imagenet_accum.py + trainer_smoke.patch
#   (`patch -o <out> <trainer> <patch>` from the repo root; the copy is not committed.)
# Logs: full_default_arena.log (default arena: RESOURCE_EXHAUSTED 8.71 GiB), full.log (XLA_PYTHON_CLIENT_MEM_FRACTION=0.97: runs).
set -u
cd "$(dirname "$0")/../../jax" || exit 1
D=../runs/2026-10-11-vitb-jax-smoke
run() { env "$@" JAX_COMPILATION_CACHE_DIR=/home/skoonce/.jax_cache LEAN_MLIR_PARAMS_OUT=/home/skoonce/vit_smoke_2611/vit_b_imagenet_accum LEAN_MLIR_CKPT_EVERY=1000 \
          TFDS_DATA_DIR=/home/skoonce/tensorflow_datasets CUDA_VISIBLE_DEVICES=0,1,2,3 ../.venv/bin/python -u $D/trainer_smoke.py; }
run A=1 > $D/full_default_arena.log 2>&1
run XLA_PYTHON_CLIENT_MEM_FRACTION=0.97 > $D/full.log 2>&1
