#!/bin/bash
# The 420-epoch JAX MNv2 (ares, 2026-10-15; /home/skoonce/mnv2_full_jax_2612/) rescored over the full 50k
# through f32 (EVAL_DTYPE=f32, as the trainer's own evalF32 eval was), writing the per-image top-1 bitmap
# (DUMP_CORRECT) that the McNemar pairing with the verified run's e420 bitmap needs. The template is
# ../2026-10-12-r50-a3-jax/rescore.sh. Scored through the trainer AS IT RAN (6bcdb7f3); main's copy has
# since re-emitted only the timm-protocol resize helper (F6, 0b465f53). Run from anywhere; it cds to jax/.
#
# As run 2026-10-20 on ares (four 4060 Ti, PY=../.venv/bin/python, JAX_PLATFORMS=cuda), about a minute:
# 35,921 / 45,268 = 71.84 / 90.54 against the in-training 35,920 / 90.53.
set -u
cd "$(dirname "$0")/../../jax" || exit 1
R=../runs/2026-10-15-mnv2-full-jax
PY="${PY:-../.venv/bin/python}"
GEN="$(mktemp -d)/generated_mobilenet_v2_imagenet_full.py"
git show 6bcdb7f3:jax/generated/generated_mobilenet_v2_imagenet_full.py > "$GEN" || exit 1
mkdir -p "$R/bitmaps"
JAX_PLATFORMS="${JAX_PLATFORMS:-cuda}" JAX_COMPILATION_CACHE_DIR=/home/skoonce/.jax_cache \
TFDS_DATA_DIR="${TFDS_DATA_DIR:-/home/skoonce/tensorflow_datasets}" GEN="$GEN" \
CKPT="${CKPT:-/home/skoonce/mnv2_full_jax_2612/mobilenet_v2_imagenet_full.state.npz}" BATCH=200 PROTOCOL=train \
EVAL_DTYPE=f32 DUMP_CORRECT=$R/bitmaps/mnv2_jax_e420_f32 LABEL="mnv2 jax 2612 e420 f32" \
  "$PY" -u scripts/eval_full50k.py 2>&1 | tee "$R/rescore_f32.log"
