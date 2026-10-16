#!/bin/bash
# The DeiT-recipe ViT-Ti reference (mars, 2026-10-11/13; lineage /home/skoonce/vit_tiny_jax_2611/) rescored
# per image at e300: {EMA, live} x {bf16, f32} through score_arms.py (copied from the 10-01 run; the
# generated trainer is this run's), writing bitmaps/jax_e300_{ema,live}_{bf16,f32}.bin + the labels for
# the McNemar pairing with runs/2026-10-14-vit-deit-verified-smx-bf16-300ep/bitmaps/.
#
# As run 2026-10-16 on atlas's CPU: the state file copied over from mars, PY=~/.venv-score/bin/python,
# JAX_PLATFORMS=cpu, about 15 minutes for the four arms. EMA f32 35,826 (the run's own e300: 35,819).
set -u
cd "$(dirname "$0")/../../jax" || exit 1
R=../runs/2026-10-11-vit-deit-jax-bf16-300ep
PY="${PY:-$HOME/.venv-score/bin/python}"
mkdir -p "$R/bitmaps"
JAX_PLATFORMS="${JAX_PLATFORMS:-cpu}" JAX_COMPILATION_CACHE_DIR=/home/skoonce/.jax_cache \
TFDS_DATA_DIR="${TFDS_DATA_DIR:-/home/skoonce/tensorflow_datasets}" \
GEN="$PWD/generated/generated_vit_tiny_imagenet.py" \
CKPT="${CKPT:-/home/skoonce/vit_tiny_jax_2611/vit_tiny_imagenet.state.npz}" \
OUT="$R/bitmaps/jax_e300" \
  "$PY" -u "$R/score_arms.py" 2>&1 | tee "$R/rescore.log"
# then:
#   scripts/demos/mcnemar.py runs/2026-10-11-vit-deit-jax-bf16-300ep/bitmaps/jax_e300_ema_f32.bin \
#     runs/2026-10-14-vit-deit-verified-smx-bf16-300ep/bitmaps/vit_emadp256x4wxdropeps0000001smxerfbf16_e300.bin
#   scripts/demos/mcnemar.py runs/2026-10-11-vit-deit-jax-bf16-300ep/bitmaps/jax_e300_live_f32.bin \
#     runs/2026-10-14-vit-deit-verified-smx-bf16-300ep/bitmaps/ver_e300_live.bin
