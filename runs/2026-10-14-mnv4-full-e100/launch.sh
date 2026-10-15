#!/bin/bash
# MNv4 paper tier at 100 epochs, verified path (CKPT_TAG e100) on ares, 4x4060 Ti. ~15 h.
cd /home/skoonce/lean/klawd_max_power/lean4-jax-mlir || exit 1
RUNDIR=runs/2026-10-14-mnv4-full-e100 exec scripts/supervise.sh mnv4-full-e100-4gpu
