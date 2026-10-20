#!/bin/bash
# ResNet-34 Bag-of-Tricks rerun (427d8cda), 90 epochs, verified path (momdp64wxbf16 through PJRT), Arm B
# loader respawn, on ares 4x4060 Ti. ~21 h on the 3060 box's probe.
cd /home/skoonce/lean/klawd_max_power/lean4-jax-mlir || exit 1
RUNDIR=runs/2026-10-20-r34-bot-verified exec scripts/supervise.sh r34-default-bf16-4gpu
