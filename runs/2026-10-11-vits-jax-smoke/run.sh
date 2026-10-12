#!/bin/bash
# JAX ViT-S smoke (2026-10-11/12): the re-emitted DeiT-as-timm trainers, two 200-step epochs each validated in f32.
# trainer_smoke.py       = jax/generated/generated_vit_s_imagenet.py       + trainer_smoke.patch       (4 x 256 one-shot)
# trainer_smoke_accum.py = jax/generated/generated_vit_s_imagenet_accum.py + trainer_smoke_accum.patch (512 x 2)
#   (`patch -o <out> <trainer> <patch>` from the repo root; the copies are not committed.)
# Logs: full_default_arena.log (one-shot, default arena: RESOURCE_EXHAUSTED 12.08 GiB), full.log (one-shot at
# XLA_PYTHON_CLIENT_MEM_FRACTION=0.97: RESOURCE_EXHAUSTED 14.32 GiB), full_accum.log (512 x 2 at the default: runs).
set -u
cd "$(dirname "$0")/../../jax" || exit 1
D=../runs/2026-10-11-vits-jax-smoke
run() { env "$@" JAX_COMPILATION_CACHE_DIR=/home/skoonce/.jax_cache LEAN_MLIR_CKPT_EVERY=1000 \
          TFDS_DATA_DIR=/home/skoonce/tensorflow_datasets CUDA_VISIBLE_DEVICES=0,1,2,3 ../.venv/bin/python -u; }
run LEAN_MLIR_PARAMS_OUT=/home/skoonce/vit_smoke_2611/vit_s_imagenet $D/trainer_smoke.py > $D/full_default_arena.log 2>&1
run XLA_PYTHON_CLIENT_MEM_FRACTION=0.97 LEAN_MLIR_PARAMS_OUT=/home/skoonce/vit_smoke_2611/vit_s_imagenet $D/trainer_smoke.py > $D/full.log 2>&1
run LEAN_MLIR_PARAMS_OUT=/home/skoonce/vit_smoke_2611/vit_s_imagenet_accum $D/trainer_smoke_accum.py > $D/full_accum.log 2>&1
