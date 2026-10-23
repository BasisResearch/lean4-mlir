#!/bin/bash
# MuZero 4x4 Phase 4 first arm on the B50: 3 fresh inits x 60 iters, then mode=score at sims 25 / 100.
cd /home/skoonce/lean/lean4-mlir-muzero || exit 1
export PLATFORM_BACKEND=xpu
. /home/skoonce/lean/lean4-mlir/scripts/platform/env.sh
export ZE_AFFINITY_MASK=0 LEAN_MLIR_LOWERER_SO=/home/skoonce/lean/lean4-mlir/ffi/libpjrt_ffi.so
unset IREE_BACKEND IREE_DEVICE LEAN_MLIR_LOWERER
D=runs/2026-10-23-muzero-ttt-b50
B=.lake/build/bin/muzero-ttt
since=$(date '+%Y-%m-%d %H:%M:%S')
dropped() { journalctl -k --since "$since" --no-pager 2>/dev/null | grep -qE 'CT write|AER: .*(Uncorrectable|Fatal)'; }
for p in "101 1" "201 2" "301 3"; do
  set -- $p; init=$1; s=$2; tag=n4_run1_q0_sims50_init${init}_s$s
  echo "=== $(date -u +%H:%M:%S) train $tag"
  { time $B n=4 iters=60 steps=300 sims=50 qnorm=0 sweepN=20000 initSeed=$init seed=$s tag=$tag; } > $D/$tag.log 2>&1
  echo "    rc=$? $(grep -E '^trained:' $D/$tag.log)"
  dropped && { echo "BUS DROP — stopping"; exit 2; }
  cp .lake/build/muzero_ttt_4x4_${tag}_curve.csv $D/${tag}_curve.csv 2>/dev/null
  for sims in 25 100; do
    echo "=== $(date -u +%H:%M:%S) score $tag sims$sims"
    { time $B n=4 mode=score qnorm=0 sims=$sims seed=11 params=.lake/build/muzero_ttt_4x4_${tag}_params.bin; } > $D/final_${tag}_sims${sims}_seed11.log 2>&1
    echo "    rc=$? $(grep -m1 'M1' $D/final_${tag}_sims${sims}_seed11.log)"
    dropped && { echo "BUS DROP — stopping"; exit 2; }
  done
done
echo "=== $(date -u +%H:%M:%S) done"
