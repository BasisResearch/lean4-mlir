#!/bin/bash
# MuZero 4×4 overnight on the B50, one process at a time:
#  1. 3×3 gate: the edited binary's default score = the original's; searchOnly and scoreN run
#  2. run 1 (60 it) sampled score, sims 25, scoreN=200000 — vs its partial exhaustive one
#  3. 3 inits × 150 iterations (same inits/seeds as the 60-iteration arm)
#  4. sampled sims-25 scores of the 150-it nets, then the 60-it runs 2, 3; then sims-100 searchOnly
H=/sys/class/hwmon/hwmon5
MZ=/home/skoonce/lean/lean4-mlir-muzero
MD=$MZ/runs/2026-10-23-muzero-ttt-b50
ND=$MZ/runs/2026-10-24-muzero-ttt-b50-it150
say() { echo "=== $(date -u '+%F %H:%M:%S') $*"; }
since=$(date '+%Y-%m-%d %H:%M:%S')
dropped() { journalctl -k --since "$since" --no-pager 2>/dev/null | grep -qE 'CT write|AER: .*(Uncorrectable|Fatal)|guc_exec_queue_timedout'; }
gpu_ok() { timeout 120 /home/skoonce/lean/lean4-mlir/.venv-xpu/bin/python -c "import jax.numpy as j; assert float((j.ones((512,512))@j.ones((512,512))).sum())==512**3" >/dev/null 2>&1; }
run() {  # log stale_s max_s cmd...
  local log=$1 stale=$2 max=$3; shift 3
  "$@" > "$log" 2>&1 & local pid=$! t0=$(date +%s)
  while kill -0 $pid 2>/dev/null; do
    sleep 30
    local now=$(date +%s) age=$(( $(date +%s) - $(stat -c %Y "$log") ))
    if [ $stale -gt 0 ] && [ $age -gt $stale ]; then say "STALL ($age s) — killing $pid"; kill $pid; sleep 10; kill -9 $pid 2>/dev/null; break; fi
    if [ $((now - t0)) -gt $max ]; then say "TIMEOUT — killing $pid"; kill $pid; sleep 10; kill -9 $pid 2>/dev/null; break; fi
  done
  wait $pid; return $?
}
after() {
  dropped && { journalctl -k --since "$since" --no-pager > $1/kernel-drop.txt; say "KERNEL ERROR — stopping"; exit 2; }
  gpu_ok || { say "GPU health check failed — stopping"; journalctl -k --since "$since" --no-pager > $1/kernel-gpu-fail.txt; exit 3; }
}
mz_env() {
  cd $MZ; export PLATFORM_BACKEND=xpu; . /home/skoonce/lean/lean4-mlir/scripts/platform/env.sh
  export ZE_AFFINITY_MASK=0 LEAN_MLIR_LOWERER_SO=/home/skoonce/lean/lean4-mlir/ffi/libpjrt_ffi.so
  unset IREE_BACKEND IREE_DEVICE LEAN_MLIR_LOWERER LEAN_MLIR_MEM_FRACTION
}
B=$HOME/arc-queue/muzero-ttt.new
ORIG=$HOME/arc-queue/muzero-ttt.orig

# ---- 1: the 3×3 gate ----
T=$MD/ab-scorelines
mz_ok=1
for v in orig new search sampled; do
  case $v in
    orig)    bin=$ORIG; extra="" ;;
    new)     bin=$B; extra="" ;;
    search)  bin=$B; extra="searchOnly=1" ;;
    sampled) bin=$B; extra="scoreN=1000" ;;
  esac
  ( mz_env; run $T/gate_$v.log 0 1800 $bin n=3 mode=score qnorm=0 sims=25 seed=11 $extra params=.lake/build/muzero_ttt_3x3_ab3_params.bin ); rc=$?
  say "gate $v rc=$rc $(tail -1 $T/gate_$v.log)"
  [ $rc = 0 ] || mz_ok=0
  case $v in search) cp $MZ/.lake/build/muzero_ttt_3x3_ab3_score_search25.csv $T/gate_search.csv ;;
             *) cp $MZ/.lake/build/muzero_ttt_3x3_ab3_score.csv $T/gate_$v.csv ;; esac
done
cmp -s $T/gate_orig.csv $T/gate_new.csv && say "gate: default score CSV identical" || { say "gate: default CSV DIFFERS — no sampled scores"; mz_ok=0; }
grep -E '^  M1' $T/gate_new.log | diff -q - <(grep -E '^  M1' $T/gate_search.log) >/dev/null && say "gate: searchOnly M1 = full M1" || say "gate: searchOnly M1 differs (check)"
after $MD

score() {  # dir tag sims extra-args...
  local d=$1 t=$2 s=$3; shift 3
  local nm=final_${t}_sims${s}_seed11_n200k${1:+_$(echo $1 | tr -d =)}
  say "score $t sims$s scoreN=200000 $*"
  ( mz_env; run $d/$nm.log 0 10800 $B n=4 mode=score qnorm=0 sims=$s seed=11 scoreN=200000 "$@" params=.lake/build/muzero_ttt_4x4_${t}_params.bin ); local rc=$?
  say "  rc=$rc $(grep -E '^wrote ' $d/$nm.log) | $(grep -m1 'vs perfect, search' $d/$nm.log)"
  local csv=$MZ/.lake/build/muzero_ttt_4x4_${t}_score.csv
  [ -n "$1" ] && csv=$MZ/.lake/build/muzero_ttt_4x4_${t}_score_search$s.csv
  cp $csv $d/$nm.csv 2>/dev/null
  after $d
}
R1=n4_run1_q0_sims50_init101_s1

# ---- 2 ----
[ $mz_ok = 1 ] && score $MD $R1 25

# ---- 3: 150 iterations ----
for p in "101 1" "201 2" "301 3"; do
  set -- $p; tag=n4_run2_q0_sims50_init$1_s$2_it150
  say "train $tag"
  ( mz_env; run $ND/$tag.log 600 14400 $B n=4 iters=150 steps=300 sims=50 qnorm=0 sweepN=20000 initSeed=$1 seed=$2 tag=$tag ); rc=$?
  say "  rc=$rc $(grep -E '^trained:' $ND/$tag.log) $(grep -E 'iter 150:' $ND/$tag.log | cut -c1-160)"
  for f in curve.csv params.bin seen.bin; do cp $MZ/.lake/build/muzero_ttt_4x4_${tag}_$f $ND/${tag}_$f 2>/dev/null; done
  after $ND
done

# ---- 4 ----
if [ $mz_ok = 1 ]; then
  for t in 101_s1 201_s2 301_s3; do score $ND n4_run2_q0_sims50_init${t}_it150 25; done
  for t in 201_s2 301_s3; do score $MD n4_run1_q0_sims50_init$t 25; done
  for t in 101_s1 201_s2 301_s3; do score $ND n4_run2_q0_sims50_init${t}_it150 100 searchOnly=1; done
fi
say "all done"
