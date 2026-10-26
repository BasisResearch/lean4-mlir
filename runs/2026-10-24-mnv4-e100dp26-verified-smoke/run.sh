#!/bin/bash
# 16-micro-step smoke of mnv4-full-e100-4gpu at the e100dp26 tag; the checkpoint is removed after.
cd /home/skoonce/lean/klawd_max_power/lean4-jax-mlir || exit 1
RUNDIR=runs/2026-10-24-mnv4-e100dp26-verified-smoke ONCE=1 LEAN_MLIR_G2_STEPS=16 scripts/supervise.sh mnv4-full-e100-4gpu
rm -f .lake/build/mnv4in256_accdp8x128wxdropdowd01bf16_ckpt_xla_e100dp26.bin*
