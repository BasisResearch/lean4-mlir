#!/usr/bin/env bash
# RSB-A3 verified rerun (timm schedule, CKPT_TAG=2611) on ares, 4x4060 Ti. ~22-24 h.
cd /home/skoonce/lean/klawd_max_power/lean4-jax-mlir
RUNDIR=runs/2026-10-12-r50-a3-rsb-bf16 exec scripts/supervise.sh r50-a3-wxclip4x128-bf16-4gpu
