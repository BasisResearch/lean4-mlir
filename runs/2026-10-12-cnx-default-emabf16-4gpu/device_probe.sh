#!/usr/bin/env bash
# ConvNeXt-T/S/B official-batch renders (4 x 64 x 16, 2026-10-12) as bare device executables at 4
# replicas: peak memory against the default arena (and B against 0.90, its conf's budget), then the
# execution time of one 256-row micro-batch. Writes device_probe.log beside each size's RESULTS.md.
set -uo pipefail
cd /home/skoonce/lean/klawd_max_power/lean4-jax-mlir
export CUDA_VISIBLE_DEVICES=0,1,2,3
probe() {  # <slug> <rundir> [fraction]
  local F=verified_mlir/$1_emaaccdp16xwxdroperfbf16_train_step.mlir D=$2 FR=${3:-}
  {
    echo "── A. peak at the default (11.68 GiB), 4 replicas ──"
    .venv/bin/python scripts/probes/bf16_peak_memory.py --replicas 4 "$F"
    if [ -n "$FR" ]; then
      echo; echo "── B. peak at $FR, 4 replicas ──"
      XLA_PYTHON_CLIENT_MEM_FRACTION=$FR .venv/bin/python scripts/probes/bf16_peak_memory.py --budget-gib $(python3 -c "print(round(15.58*$FR,2))") --replicas 4 "$F"
    fi
    echo; echo "── C. EXECUTION${FR:+ at $FR} ──"
    env ${FR:+XLA_PYTHON_CLIENT_MEM_FRACTION=$FR} .venv/bin/python scripts/probes/bf16_device_step.py --replicas 4 --reps 5 --warmup 2 "$F"
    echo DONE
  } > "$D/device_probe.log" 2>&1
}
probe convnextin  runs/2026-10-12-cnx-default-emabf16-4gpu
probe convnextsin runs/2026-10-12-cnxs-default-emabf16-4gpu
probe convnextbin runs/2026-10-12-cnxb-default-emabf16-4gpu 0.90
echo ALL_DONE
