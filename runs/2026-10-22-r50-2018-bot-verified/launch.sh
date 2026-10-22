#!/bin/bash
# ResNet-50-2018 Bag-of-Tricks rerun (427d8cda), 90 epochs, verified path (momdp64wxbf16 through PJRT), Arm B
# loader respawn, on ares 4x4060 Ti. ~29 h.
cd /home/skoonce/lean/klawd_max_power/lean4-jax-mlir || exit 1
RUNDIR=runs/2026-10-22-r50-2018-bot-verified exec scripts/supervise.sh r50-2018-bf16-4gpu
