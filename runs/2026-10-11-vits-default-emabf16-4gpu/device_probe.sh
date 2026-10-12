#!/usr/bin/env bash
# ViT-S at DeiT's 4 x 256 (no clip, EMA, bf16): does it fit the default arena, the raised one, neither?
set -uo pipefail
cd /home/skoonce/lean/klawd_max_power/lean4-jax-mlir
F=verified_mlir/vitsin_emadp256x4wxdropeps0000001erfbf16_train_step.mlir   # rendered to a scratch dir before it was committed (same bytes)
export CUDA_VISIBLE_DEVICES=0,1,2,3
echo "── A. peak at the DEFAULT budget (11.68 GiB), 4 replicas ──"
.venv/bin/python scripts/probes/bf16_peak_memory.py --replicas 4 "$F"
echo; echo "── B. peak at 0.97 (15.11 GiB) ──"
XLA_PYTHON_CLIENT_MEM_FRACTION=0.97 .venv/bin/python scripts/probes/bf16_peak_memory.py --budget-gib 15.11 --replicas 4 "$F"
echo; echo "── C. EXECUTION at the default ──"
.venv/bin/python scripts/probes/bf16_device_step.py --replicas 4 --reps 5 --warmup 2 "$F"
echo; echo "── D. EXECUTION at 0.97 ──"
XLA_PYTHON_CLIENT_MEM_FRACTION=0.97 .venv/bin/python scripts/probes/bf16_device_step.py --replicas 4 --reps 5 --warmup 2 "$F"
echo DONE
