#!/bin/bash
# F6 (2026-10-19): the same checkpoint as rescore.sh, scored through the RE-EMITTED trainer, whose eval
# resize now takes timm's short side (math.floor(224 / 0.95) = 235, where tf.round said 236) and
# torchvision's truncated long side (int(235 * long / short); tf.round before). Everything else is
# rescore.sh: full 50k, f32, PROTOCOL=train (the module's own _IMG_SIZE / _CROP_PCT), the per-image
# bitmap for the McNemar pairing. The 236 number it is read against is rescore_f32.log.
#
# As run 2026-10-19 on atlas's CPU, as rescore.sh was (PY=~/.venv-score/bin/python, JAX_PLATFORMS=cpu,
# the checkpoint and the tfds validation shards copied over from ares).
set -u
cd "$(dirname "$0")/../../jax" || exit 1
R=../runs/2026-10-12-r50-a3-jax
PY="${PY:-$HOME/.venv-score/bin/python}"
mkdir -p "$R/bitmaps"
grep -q 'tf.math.floor(_IMG_SIZE / _CROP_PCT)' generated/generated_resnet50_imagenet_rsbfaithful.py || {
  echo "⛔ generated/generated_resnet50_imagenet_rsbfaithful.py still rounds the eval resize (pre-F6) — re-emit"; exit 1; }
JAX_PLATFORMS="${JAX_PLATFORMS:-cpu}" JAX_COMPILATION_CACHE_DIR=/home/skoonce/.jax_cache \
TFDS_DATA_DIR="${TFDS_DATA_DIR:-/home/skoonce/tensorflow_datasets}" \
GEN=generated/generated_resnet50_imagenet_rsbfaithful.py \
CKPT="${CKPT:-/home/skoonce/r50_a3_jax_2611/resnet50_imagenet_rsbfaithful.state.npz}" BATCH=200 PROTOCOL=train \
EVAL_DTYPE=f32 DUMP_CORRECT=$R/bitmaps/r50-a3_jax_f32_f6 LABEL="r50-a3 jax 2611 f32 F6 (235, truncated long side)" \
  "$PY" -u scripts/eval_full50k.py 2>&1 | tee "$R/rescore_f6_f32.log"
