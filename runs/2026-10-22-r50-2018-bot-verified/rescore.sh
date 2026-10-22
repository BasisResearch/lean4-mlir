#!/bin/bash
# The R50-2018 Bag-of-Tricks pair scored for McNemar (2026-10-24, ares): each half's e90 checkpoint over the
# full 50k with a per-image top-1 bitmap. The verified half's run did not set LEAN_MLIR_DUMP_CORRECT, so
# its `bot` checkpoint goes through `score-checkpoint resnet50-in-2018` (the 2018 shim, 224 / 0.875 — `resnet50-in` is A2's, 0.95) (the f32 eval forward, as in training); the JAX
# half through `jax/scripts/eval_full50k.py` at EVAL_DTYPE=f32 (the 10-11 convention: the reference is
# quoted through an f32 forward, like the verified column). Then scripts/demos/mcnemar.py, JAX first.
set -u
cd "$(dirname "$0")/../.." || exit 1
R=runs/2026-10-22-r50-2018-bot-verified
mkdir -p $R/bitmaps
. scripts/platform/env.sh
CKPT=.lake/build/resnet50in_momdp64wxbf16_ckpt_xla_bot.bin
[ -f "$CKPT" ] && [ -f "$CKPT.bn" ] && [ "$(tr -cd 0-9 < $CKPT.epoch)" = 90 ] || { echo "⛔ $CKPT not a finished e90 run"; exit 1; }
env PJRT_PLUGIN="${PJRT_PLUGIN:-$PLATFORM_PLUGIN}" ${PLATFORM_SHIMPY[@]+"${PLATFORM_SHIMPY[@]}"} \
  PJRT_REPLICAS=1 LEAN_MLIR_REPLICAS=1 TFDS_DATA_DIR="${TFDS_DATA_DIR:-$HOME/tensorflow_datasets}" \
  LEAN_MLIR_VARIANT=momdp64wxbf16 LEAN_MLIR_CKPT="$CKPT" LEAN_MLIR_DUMP_CORRECT=$R/bitmaps/r50_2018_bot_verified \
  .lake/build/bin/score-checkpoint resnet50-in-2018 data 2>&1 | tee $R/rescore_verified.log
(cd jax && JAX_COMPILATION_CACHE_DIR=/home/skoonce/.jax_cache TFDS_DATA_DIR=/home/skoonce/tensorflow_datasets \
  CUDA_VISIBLE_DEVICES=0,1,2,3 GEN=generated/generated_resnet50_imagenet_2018.py \
  CKPT=/home/skoonce/r50_2018_bot_jax/resnet50_imagenet_2018_e90.state.npz BATCH=200 PROTOCOL=train EVAL_DTYPE=f32 \
  DUMP_CORRECT=../$R/bitmaps/r50_2018_bot_jax_f32 LABEL="r50-2018 bot jax e90 f32" \
  ../.venv/bin/python -u scripts/eval_full50k.py) 2>&1 | tee $R/rescore_jax_f32.log
.venv/bin/python scripts/demos/mcnemar.py $R/bitmaps/r50_2018_bot_jax_f32.bin $R/bitmaps/r50_2018_bot_verified*.bin --label-a jax-f32 --label-b verified 2>&1 | tee $R/mcnemar.txt
