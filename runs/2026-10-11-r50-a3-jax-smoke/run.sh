#!/bin/bash
# JAX RSB-A3 smoke (2026-10-11): the re-emitted `generated_resnet50_imagenet_rsbfaithful.py` with
# `steps_per_epoch = 40` (`trainer_a3smoke.patch`), so two per-epoch validations land within minutes.
# Reads: "[Epoch 1] lr=0.0001" (timm's warmup_lr), "[Epoch 2] lr=0.00168" (1e-4 + (8e-3 - 1e-4)/5),
# "eval: f32 forward (evalF32)" before each validation, no assertion, GRAD_ACCUM = 4 in force.
# trainer_a3smoke.py = the committed trainer + the patch (`patch -o trainer_a3smoke.py
# jax/generated/generated_resnet50_imagenet_rsbfaithful.py trainer_a3smoke.patch` from the repo root).
set -u
cd "$(dirname "$0")/../../jax" || exit 1
exec env JAX_COMPILATION_CACHE_DIR=/home/skoonce/.jax_cache \
  LEAN_MLIR_PARAMS_OUT=/home/skoonce/r50_a3_smoke_2611/resnet50_imagenet_rsbfaithful_smoke LEAN_MLIR_CKPT_EVERY=1000 \
  TFDS_DATA_DIR=/home/skoonce/tensorflow_datasets CUDA_VISIBLE_DEVICES=0,1,2,3 \
  ../.venv/bin/python -u ../runs/2026-10-11-r50-a3-jax-smoke/trainer_a3smoke.py \
  > ../runs/2026-10-11-r50-a3-jax-smoke/smoke.log 2>&1
