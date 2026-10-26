#!/bin/bash
# MNv4-Conv-M paper tier, 500 epochs (tf-models yaml at 256²), JAX reference path; ares 4x 4060 Ti. ~112 h.
cd /home/skoonce/lean/klawd_max_power/lean4-jax-mlir || exit 1
RUNDIR=runs/2026-10-26-mnv4-full500-jax exec scripts/supervise.sh mnv4-full-jax-4gpu
