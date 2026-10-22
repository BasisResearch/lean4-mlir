#!/usr/bin/env bash
# The SYCL scheduler race on the Arc Pro B50: loop the MNIST CNN train step through the shim.
# From the repo root:  bash runs/2026-10-11-xpu-sycl-race/repro.sh [runs] [iters]
# Each run is one process; on jax_oneapi_pjrt 0.11.2 / intel-sycl-rt 2025.1.1 every run of
# 10,000 iterations died (5/5, three of them before iteration 1,000). Stops at the first GPU page fault:
# the one time it was pushed past that, the card dropped off the bus and needed a power cycle.
set -u
D=runs/2026-10-11-xpu-sycl-race
gcc -O2 -Wall -Iffi $D/stress.c -Lffi -lpjrt_ffi -ldl -Wl,-rpath,$PWD/ffi -o $D/stress || exit 1
python3 $D/gen_spec.py verified_mlir/cnn_train_step.mlir cnn_train_step > $D/cnn.spec
. scripts/platform/env.sh
[ "$PLATFORM_BACKEND" = xpu ] || { echo "not on xpu (PLATFORM_BACKEND=$PLATFORM_BACKEND)"; exit 1; }
export ZE_AFFINITY_MASK=${ZE_AFFINITY_MASK:-0}
# The shim serializes uploads on oneAPI by default since 2026-10-12 (the workaround); the
# repro needs them overlapped, so default it off. PJRT_FFI_H2D_SERIAL=1 checks the workaround.
export PJRT_FFI_H2D_SERIAL=${PJRT_FFI_H2D_SERIAL:-0}
t0=$(date '+%F %T'); crashes=0
for i in $(seq 1 "${1:-5}"); do
  $D/stress verified_mlir/cnn_train_step.mlir cnn_train_step $D/cnn.spec "${2:-10000}" > $D/run-$i.log 2>&1
  rc=$?; [ $rc != 0 ] && crashes=$((crashes + 1))
  faults=$(journalctl -k --since "$t0" --no-pager 2>/dev/null | grep -cE 'Fault response|wedged|MMIO unreliable')
  echo "run $i rc=$rc $(grep -E '^(iter|OK)' $D/run-$i.log | tail -1) $(grep -m1 -oE 'die: .*' $D/run-$i.log) crashes=$crashes gpu_faults=$faults"
  [ "$faults" -gt 0 ] && { echo "GPU page fault in the kernel log — stopping"; break; }
done
journalctl -k --since "$t0" --no-pager 2>/dev/null | grep -E 'segfault|general protection' | grep -o 'in lib[^ ]*\[[0-9a-f]*' | sort | uniq -c
