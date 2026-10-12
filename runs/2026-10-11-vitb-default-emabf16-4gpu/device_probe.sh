#!/usr/bin/env bash
set -uo pipefail
cd /home/skoonce/lean/klawd_max_power/lean4-jax-mlir
F=verified_mlir/vitbin_emaaccdp2x128x4wxdropeps0000001erfbf16_train_step.mlir
export CUDA_VISIBLE_DEVICES=0,1,2,3
echo "── A. peak at 0.97 (15.11 GiB), 4 replicas ──"
XLA_PYTHON_CLIENT_MEM_FRACTION=0.97 .venv/bin/python scripts/probes/bf16_peak_memory.py --budget-gib 15.11 --replicas 4 "$F"
echo; echo "── B. peak at the default (11.68 GiB) ──"
.venv/bin/python scripts/probes/bf16_peak_memory.py --replicas 4 "$F"
echo; echo "── C. EXECUTION at 0.97 ──"
XLA_PYTHON_CLIENT_MEM_FRACTION=0.97 .venv/bin/python scripts/probes/bf16_device_step.py --replicas 4 --reps 5 --warmup 2 "$F"
echo DONE
