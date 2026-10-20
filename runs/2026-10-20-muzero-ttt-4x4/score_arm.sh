#!/usr/bin/env bash
# Gate B + M2–M5 on one arm's final net (planning/muzero_ttt_demo.md §6, §9):
#   runs/2026-10-20-muzero-ttt-4x4/score_arm.sh <tag> <sims> [gpu] [scoreN]
# mode=score plays 256 games a side vs perfect and random, net alone and at <sims>; M2 sweeps all
# 9,062,619 decision positions; M3–M5 start from every ⌈9,062,619 / scoreN⌉-th (default 20000).
# The log and CSV land in gate_b/ beside this script.
set -u
tag=$1; sims=$2; gpu=${3:-3}; scoreN=${4:-20000}
R=runs/2026-10-20-muzero-ttt-4x4
BIN=${BIN:-/tmp/claude-1000/-home-skoonce-lean-klawd-max-power-lean4-jax-mlir/f17bf5c4-6f39-42cc-95f4-1251ed550fdb/scratchpad/bin/muzero-ttt-score}
P=.lake/build/muzero_ttt_4x4_${tag}_params.bin
mkdir -p "$R/gate_b"
out="$R/gate_b/final_${tag}_sims${sims}_seed11"
CUDA_VISIBLE_DEVICES=$gpu "$BIN" mode=score n=4 qnorm=0 sims=$sims seed=11 scoreN=$scoreN params="$P" tag=$tag \
  > "$out.log" 2>&1
echo "EXIT $?" >> "$out.log"
cp ".lake/build/muzero_ttt_4x4_${tag}_score.csv" "$out.csv"
