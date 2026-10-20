#!/bin/bash
# MNv2 slim-README recipe, 420 epochs, JAX reference path, on ares 4x4060 Ti. ~49 h.
cd /home/skoonce/lean/klawd_max_power/lean4-jax-mlir || exit 1
RUNDIR=runs/2026-10-15-mnv2-full-jax exec scripts/supervise.sh mnv2-full-jax-4gpu
