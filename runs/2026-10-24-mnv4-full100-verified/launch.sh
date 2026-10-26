#!/bin/bash
# MNv4-Conv-M paper tier cut to 100 epochs, verified path (CKPT_TAG=e100dp26, Arm B), after 3333bbd5; ares 4x 4060 Ti. ~15.6 h.
cd /home/skoonce/lean/klawd_max_power/lean4-jax-mlir || exit 1
RUNDIR=runs/2026-10-24-mnv4-full100-verified exec scripts/supervise.sh mnv4-full-e100-4gpu
