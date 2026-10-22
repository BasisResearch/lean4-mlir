#!/bin/bash
# ResNet-50-2018 Bag-of-Tricks rerun (427d8cda: no bias decay), 90 epochs, JAX reference path, on ares 4x4060 Ti. ~22.5 h.
cd /home/skoonce/lean/klawd_max_power/lean4-jax-mlir || exit 1
RUNDIR=runs/2026-10-22-r50-2018-bot-jax exec scripts/supervise.sh r50-2018-jax-4gpu
