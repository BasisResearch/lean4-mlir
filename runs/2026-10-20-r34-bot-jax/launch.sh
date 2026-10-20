#!/bin/bash
# ResNet-34 Bag-of-Tricks rerun (427d8cda), 90 epochs, JAX reference path, on ares 4x4060 Ti. ~13.3 h.
cd /home/skoonce/lean/klawd_max_power/lean4-jax-mlir || exit 1
RUNDIR=runs/2026-10-20-r34-bot-jax exec scripts/supervise.sh r34-default-jax-4gpu
