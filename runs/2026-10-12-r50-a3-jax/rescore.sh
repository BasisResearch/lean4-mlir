#!/bin/bash
# The timm-schedule A3 reference (ares, 2026-10-12; lineage /home/skoonce/r50_a3_jax_2611/) rescored over the
# full 50k through f32 (EVAL_DTYPE=f32 — the trainer's own eval forward already is), writing the per-image
# top-1 bitmap (DUMP_CORRECT) that the McNemar pairing with the verified run's e100 bitmap needs. The
# template is runs/2026-10-11-resnet-jax-f32-rescore/run.sh. Run from anywhere; it cds to jax/.
#
# As run 2026-10-14, on atlas's CPU (no GPU, no CUDA venv there): the checkpoint and the tfds validation
# shards copied over from ares, PY=~/.venv-score/bin/python (jax 0.11.0 / tensorflow 2.21.0 / tfds 4.9.10,
# the pins of jax/requirements-cuda-lock.txt, CPU wheels), JAX_PLATFORMS=cpu — about 12 minutes, 38,803 set.
# On ares: PY=../.venv/bin/python JAX_PLATFORMS=cuda, about a minute on the four cards.
set -u
cd "$(dirname "$0")/../../jax" || exit 1
R=../runs/2026-10-12-r50-a3-jax
PY="${PY:-$HOME/.venv-score/bin/python}"
mkdir -p "$R/bitmaps"
JAX_PLATFORMS="${JAX_PLATFORMS:-cpu}" JAX_COMPILATION_CACHE_DIR=/home/skoonce/.jax_cache \
TFDS_DATA_DIR="${TFDS_DATA_DIR:-/home/skoonce/tensorflow_datasets}" \
GEN=generated/generated_resnet50_imagenet_rsbfaithful.py \
CKPT="${CKPT:-/home/skoonce/r50_a3_jax_2611/resnet50_imagenet_rsbfaithful.state.npz}" BATCH=200 PROTOCOL=train \
EVAL_DTYPE=f32 DUMP_CORRECT=$R/bitmaps/r50-a3_jax_f32 LABEL="r50-a3 jax 2611 f32" \
  "$PY" -u scripts/eval_full50k.py 2>&1 | tee "$R/rescore_f32.log"
