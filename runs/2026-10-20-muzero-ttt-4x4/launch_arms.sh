#!/usr/bin/env bash
# Phase 4 arms (planning/muzero_ttt_demo.md §9): the 3×3 winner — raw Q, 50-sim self-play, 300 steps an
# iteration — at 4×4 across three fresh inits, 60 iterations, one card each, the per-iteration sweep on
# 20,000 of the 9,062,619 decision positions. Launch bare from the repo root (XLA, cuda: no lowerer env):
#   setsid -f nohup runs/2026-10-20-muzero-ttt-4x4/launch_arms.sh
# BIN is a copy of .lake/build/bin/muzero-ttt (branch muzero-ttt at 82371542); each arm gets its own copy
# so a rebuild never relinks a running binary.
set -u
R=runs/2026-10-20-muzero-ttt-4x4
BIN=${BIN:-/tmp/claude-1000/-home-skoonce-lean-klawd-max-power-lean4-jax-mlir/f17bf5c4-6f39-42cc-95f4-1251ed550fdb/scratchpad/bin/muzero-ttt-smoke}
BINDIR=${BINDIR:-/tmp/claude-1000/-home-skoonce-lean-klawd-max-power-lean4-jax-mlir/f17bf5c4-6f39-42cc-95f4-1251ed550fdb/scratchpad/bin}
gpu=0
for cfg in "101 1" "201 2" "301 3"; do
  set -- $cfg; init=$1; seed=$2
  tag=run1_q0_sims50_init${init}_s${seed}
  cp "$BIN" "$BINDIR/muzero-ttt-$tag"
  CUDA_VISIBLE_DEVICES=$gpu nohup "$BINDIR/muzero-ttt-$tag" n=4 iters=60 steps=300 sims=50 qnorm=0 sweepN=20000 \
    seed=$seed initSeed=$init tag=$tag > "$R/n4_$tag.log" 2>&1 &
  gpu=$((gpu + 1))
done
wait
