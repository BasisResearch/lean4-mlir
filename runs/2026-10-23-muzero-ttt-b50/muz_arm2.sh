#!/bin/bash
# MuZero 4x4 arm, v2: training stays serial on the card; each run's two mode=score sweeps (host-bound,
# one core each) start in the background as soon as its params land. Run 1's sims-25 score is
# already running from muz_arm.sh, so only its sims-100 score is launched here.
cd /home/skoonce/lean/lean4-mlir-muzero || exit 1
export PLATFORM_BACKEND=xpu
. /home/skoonce/lean/lean4-mlir/scripts/platform/env.sh
export ZE_AFFINITY_MASK=0 LEAN_MLIR_LOWERER_SO=/home/skoonce/lean/lean4-mlir/ffi/libpjrt_ffi.so LEAN_MLIR_MEM_FRACTION=0.3
unset IREE_BACKEND IREE_DEVICE LEAN_MLIR_LOWERER
D=runs/2026-10-23-muzero-ttt-b50
B=.lake/build/bin/muzero-ttt
since=$(date '+%Y-%m-%d %H:%M:%S')
dropped() { journalctl -k --since "$since" --no-pager 2>/dev/null | grep -qE 'CT write|AER: .*(Uncorrectable|Fatal)'; }
score() {  # tag sims
  local f=$D/final_$1_sims$2_seed11.log
  echo "=== $(date -u +%H:%M:%S) score $1 sims$2 (background)"
  ( { time $B n=4 mode=score qnorm=0 sims=$2 seed=11 params=.lake/build/muzero_ttt_4x4_$1_params.bin; } > $f 2>&1
    echo "    score done rc=$? $1 sims$2 $(date -u +%H:%M:%S) $(grep -m1 'vs perfect, search' $f)" ) &
}
score n4_run1_q0_sims50_init101_s1 100
for p in "201 2" "301 3"; do
  set -- $p; init=$1; s=$2; tag=n4_run1_q0_sims50_init${init}_s$s
  echo "=== $(date -u +%H:%M:%S) train $tag"
  { time $B n=4 iters=60 steps=300 sims=50 qnorm=0 sweepN=20000 initSeed=$init seed=$s tag=$tag; } > $D/$tag.log 2>&1
  echo "    rc=$? $(grep -E '^trained:' $D/$tag.log)"
  dropped && { echo "BUS DROP — stopping"; exit 2; }
  cp .lake/build/muzero_ttt_4x4_${tag}_curve.csv $D/${tag}_curve.csv 2>/dev/null
  score $tag 25; score $tag 100
done
wait
dropped && echo "BUS DROP during scoring"
echo "=== $(date -u +%H:%M:%S) all done"
