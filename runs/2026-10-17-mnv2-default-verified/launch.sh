#!/bin/bash
# MNv2 slim-README recipe, 420 epochs, verified path (bf16 render, XLA through PJRT), on ares 4x4060 Ti. ~63 h.
cd /home/skoonce/lean/klawd_max_power/lean4-jax-mlir || exit 1
RUNDIR=runs/2026-10-17-mnv2-default-verified exec scripts/supervise.sh mnv2-default-4gpu
