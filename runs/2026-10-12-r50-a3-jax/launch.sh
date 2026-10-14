#!/usr/bin/env bash
# RSB-A3 JAX reference rerun (timm schedule, ~/r50_a3_jax_2611) on ares. ~13.5 h.
cd /home/skoonce/lean/klawd_max_power/lean4-jax-mlir
RUNDIR=runs/2026-10-12-r50-a3-jax exec scripts/supervise.sh r50-a3-jax-4gpu
