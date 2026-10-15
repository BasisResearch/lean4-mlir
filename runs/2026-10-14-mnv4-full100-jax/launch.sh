#!/bin/bash
cd /home/skoonce/lean/klawd_max_power/lean4-jax-mlir || exit 1
RUNDIR=runs/2026-10-14-mnv4-full100-jax exec scripts/supervise.sh mnv4-full100-jax-4gpu
