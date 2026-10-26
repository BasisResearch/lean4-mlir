#!/bin/bash
# MNv4-Conv-M paper tier cut to 100 epochs, JAX reference path, after 3333bbd5 (26-entry drop-path ramp, crop fallback); ares 4x 4060 Ti. ~23 h.
cd /home/skoonce/lean/klawd_max_power/lean4-jax-mlir || exit 1
RUNDIR=runs/2026-10-24-mnv4-full100-jax exec scripts/supervise.sh mnv4-full100-jax-4gpu
