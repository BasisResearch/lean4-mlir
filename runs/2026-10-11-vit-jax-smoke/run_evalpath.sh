#!/bin/bash
# Eval-path smoke (2026-10-11): the re-emitted trainer with `_do_val = True` and `steps_per_epoch = 40`,
# so the per-epoch validation — the inline `eval_batch` loop, not `evaluate()` — runs within a minute.
# Reads: "eval: f32 forward (evalF32)" before the first validation, no assertion (eval_batch had no
# prior trace), a second validation at epoch 2 (no retrace). Kill after epoch 2.
# trainer_evalpath.py = the committed jax/generated/generated_vit_tiny_imagenet.py + trainer_evalpath.patch
# (`patch -o trainer_evalpath.py jax/generated/generated_vit_tiny_imagenet.py trainer_evalpath.patch` from the repo root).
set -u
cd "$(dirname "$0")/../../jax" || exit 1
exec env JAX_COMPILATION_CACHE_DIR=/home/skoonce/.jax_cache \
  LEAN_MLIR_PARAMS_OUT=/home/skoonce/vit_smoke_2611/vit_tiny_imagenet_evalpath LEAN_MLIR_CKPT_EVERY=1000 \
  TFDS_DATA_DIR=/home/skoonce/tensorflow_datasets CUDA_VISIBLE_DEVICES=0,1,2,3 \
  ../.venv/bin/python -u ../runs/2026-10-11-vit-jax-smoke/trainer_evalpath.py \
  > ../runs/2026-10-11-vit-jax-smoke/evalpath.log 2>&1
