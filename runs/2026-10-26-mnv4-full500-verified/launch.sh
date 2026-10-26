#!/bin/bash
# MNv4-Conv-M paper tier, 500 epochs, verified path (untagged lineage, Arm B); ares 4x 4060 Ti. ~75 h.
cd /home/skoonce/lean/klawd_max_power/lean4-jax-mlir || exit 1
RUNDIR=runs/2026-10-26-mnv4-full500-verified exec scripts/supervise.sh mnv4-full-4gpu
