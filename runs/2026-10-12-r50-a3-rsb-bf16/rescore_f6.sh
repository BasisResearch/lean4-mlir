#!/bin/bash
# F6 (2026-10-19): the verified A3 checkpoint (tag 2611, the book's 78.08 / 93.84 — scored in-training on
# ares through XLA at the pre-F6 eval resize, 236 with a rounded long side) rescored through the re-emitted
# shim, whose eval resize is timm's and torchvision's (235, truncated long side). The JAX half is
# ../2026-10-12-r50-a3-jax/rescore_f6.sh.
#
#     runs/2026-10-12-r50-a3-rsb-bf16/rescore_f6.sh pre    # the pre-F6 shim: the control, read against 39,039
#     runs/2026-10-12-r50-a3-rsb-bf16/rescore_f6.sh f6     # the committed shim: the number
#
# Runs on any box with a PJRT plugin (scripts/platform/env.sh names it: ares's CUDA .venv, a ROCm box's
# jax-rocm7-pjrt per historical/ROCM.md's fast path) — `score-checkpoint` through the XLA lowerer over the f32
# eval forward `verified_mlir/resnet50in160_fwd_eval.mlir`, the whole 50k in about a minute on four 4060 Ti.
# The `pre` run is what makes a different card legible: its count against ares's 39,039 is the lowerer /
# card gap on this checkpoint, and `f6` − `pre` on one card is the protocol's move.
#
# Needs: the three checkpoint files (CKPT below, its `.bn` companion and `.epoch`), the tfds validation
# shards under TFDS_DATA_DIR, `lake build score-checkpoint`, `scripts/regen_jax_generated.sh sync`, and a
# shim python with tensorflow + tensorflow_datasets + jax (SHIM_PYTHON, or the platform's PLATFORM_SHIMPY;
# the plugin-only .venv of the ROCm fast path is NOT one — a CPU jax is fine for the shim).
#
# ⛔ NOT atlas's CPU through IREE (tried 2026-10-19): `IREE_BACKEND=llvm-cpu` with `IREE_DEVICE=local-task`
# segfaults in the first invoke of this eval forward (generic and `--iree-llvmcpu-target-cpu=host` codegen
# alike), and `local-sync` had not finished one 256-image batch in seven minutes.
set -u
cd "$(dirname "$0")/../.." || exit 1
MODE="${1:?pre | f6}"
R=runs/2026-10-12-r50-a3-rsb-bf16
SHIM=.lake/build/generated_resnet50_imagenet_short_shim.py
case "$MODE" in
  pre) git show 0b465f53~1:jax/generated/generated_resnet50_imagenet_short_shim.py > "$SHIM" || exit 1
       grep -q 'tf.round(_IMG_SIZE / _CROP_PCT)' "$SHIM" || { echo "⛔ $SHIM is not the pre-F6 shim"; exit 1; } ;;
  f6)  scripts/regen_jax_generated.sh sync >/dev/null || exit 1
       grep -q 'tf.math.floor(_IMG_SIZE / _CROP_PCT)' "$SHIM" || { echo "⛔ $SHIM still rounds (pre-F6) — re-emit"; exit 1; } ;;
  *) echo "⛔ mode: pre | f6"; exit 1 ;;
esac
. scripts/platform/env.sh
mkdir -p "$R/bitmaps"
CKPT="${CKPT:-.lake/build/resnet50in160_lambaccdp4x128wxclipbcebf16_ckpt_xla_2611.bin}"
[ -f "$CKPT" ] && [ -f "$CKPT.bn" ] || { echo "⛔ $CKPT (+ .bn) missing — set CKPT=<path to the 2611 .bin>"; exit 1; }
[ -x .lake/build/bin/score-checkpoint ] || { echo "⛔ lake build score-checkpoint first"; exit 1; }
REPLICAS="${LEAN_MLIR_REPLICAS:-1}"
PJRT_PLUGIN="${PJRT_PLUGIN:-$PLATFORM_PLUGIN}" ${PLATFORM_SHIMPY[@]+"${PLATFORM_SHIMPY[@]}"} \
PJRT_REPLICAS="$REPLICAS" LEAN_MLIR_REPLICAS="$REPLICAS" \
TFDS_DATA_DIR="${TFDS_DATA_DIR:-$HOME/tensorflow_datasets}" \
LEAN_MLIR_VARIANT=lambaccdp4x128wxclipbcebf16 LEAN_MLIR_RES=160 LEAN_MLIR_CKPT="$CKPT" \
LEAN_MLIR_DUMP_CORRECT="$R/bitmaps/a3_f6_$MODE" \
  .lake/build/bin/score-checkpoint resnet50-in160 data 2>&1 | tee "$R/rescore_f6_$MODE.log"
