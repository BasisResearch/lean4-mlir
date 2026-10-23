#!/bin/bash
# One process on the B50 at a time. Picks up after serial.sh (detached at 21:5x):
#  0. wait for run 1's EXHAUSTIVE sims-25 score (pid $1), capped at 04:00 UTC
#  1. 3×3 gate: the edited binary's default score = the original's (CSV byte-identical); the
#     searchOnly and scoreN paths run
#  2. sampled scores (scoreN=200000): sims 25 for runs 1–3 (run 1's against its exhaustive one),
#     then sims 100 searchOnly for runs 1–3
#  3. Imagenette 80 epochs, 15-min breaks
EXH_PID=$1
H=/sys/class/hwmon/hwmon5
MZ=/home/skoonce/lean/lean4-mlir-muzero
MD=$MZ/runs/2026-10-23-muzero-ttt-b50
say() { echo "=== $(date -u '+%F %H:%M:%S') $*"; }
since=$(date '+%Y-%m-%d %H:%M:%S')
dropped() { journalctl -k --since "$since" --no-pager 2>/dev/null | grep -qE 'CT write|AER: .*(Uncorrectable|Fatal)'; }
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
  dropped && { journalctl -k --since "$since" --no-pager > $1/kernel-drop.txt; say "BUS DROP — stopping"; exit 2; }
  gpu_ok || { say "GPU health check failed — stopping"; journalctl -k --since "$since" --no-pager > $1/kernel-gpu-fail.txt; exit 3; }
}
mz_env() {
  cd $MZ; export PLATFORM_BACKEND=xpu; . /home/skoonce/lean/lean4-mlir/scripts/platform/env.sh
  export ZE_AFFINITY_MASK=0 LEAN_MLIR_LOWERER_SO=/home/skoonce/lean/lean4-mlir/ffi/libpjrt_ffi.so
  unset IREE_BACKEND IREE_DEVICE LEAN_MLIR_LOWERER LEAN_MLIR_MEM_FRACTION
}
B=$HOME/arc-queue/muzero-ttt.new      # pinned copies: rebuilding the worktree can't touch a queued run
ORIG=$HOME/arc-queue/muzero-ttt.orig

# ---- 0 ----
R1=n4_run1_q0_sims50_init101_s1
say "waiting for the exhaustive run-1 score (pid $EXH_PID)"
while kill -0 $EXH_PID 2>/dev/null; do
  [ $(date -u +%H%M) = 0400 ] && { say "04:00 cap — killing the exhaustive score"; kill $EXH_PID; sleep 10; kill -9 $EXH_PID 2>/dev/null; }
  sleep 30
done
say "exhaustive score ended: $(grep -E '^wrote ' $MD/final_${R1}_sims25_seed11.log)"
grep -q '^wrote ' $MD/final_${R1}_sims25_seed11.log && cp $MZ/.lake/build/muzero_ttt_4x4_${R1}_score.csv $MD/final_${R1}_sims25_seed11_exhaustive.csv
after $MD

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
cmp -s $T/gate_orig.csv $T/gate_new.csv && say "gate: default score CSV identical" || { say "gate: default CSV DIFFERS — skipping the MuZero scores"; mz_ok=0; }
grep -E '^  M1' $T/gate_new.log | diff -q - <(grep -E '^  M1' $T/gate_search.log) >/dev/null && say "gate: searchOnly M1 = full M1" || say "gate: searchOnly M1 differs (check)"
after $MD

# ---- 2: sampled scores ----
score() {  # tag sims extra-args...
  local t=$1 s=$2; shift 2
  local nm=final_${t}_sims${s}_seed11_n200k${1:+_$(echo $1 | tr -d =)}
  say "score $t sims$s scoreN=200000 $*"
  ( mz_env; run $MD/$nm.log 0 10800 $B n=4 mode=score qnorm=0 sims=$s seed=11 scoreN=200000 "$@" params=.lake/build/muzero_ttt_4x4_${t}_params.bin ); local rc=$?
  say "  rc=$rc $(grep -E '^wrote ' $MD/$nm.log) | $(grep -m1 'vs perfect, search' $MD/$nm.log)"
  local csv=$MZ/.lake/build/muzero_ttt_4x4_${t}_score.csv
  [ -n "$1" ] && csv=$MZ/.lake/build/muzero_ttt_4x4_${t}_score_search$s.csv
  cp $csv $MD/$nm.csv 2>/dev/null
  after $MD
}
if [ $mz_ok = 1 ]; then
  for t in $R1 n4_run1_q0_sims50_init201_s2 n4_run1_q0_sims50_init301_s3; do score $t 25; done
  for t in $R1 n4_run1_q0_sims50_init201_s2 n4_run1_q0_sims50_init301_s3; do score $t 100 searchOnly=1; done
fi

# ---- 3: Imagenette, 80 epochs (main checkout) ----
cd /home/skoonce/lean/lean4-mlir
hwlog() {
  local e0 e1 t=0; e0=$(cat $H/energy1_input)
  echo "t_s W gpu_C vram_C fan_rpm link" > "$1/hw-sensors.log"
  while sleep 1; do
    t=$((t+1)); e1=$(cat $H/energy1_input)
    echo "$t $(( (e1-e0)/1000000 )) $(( $(cat $H/temp2_input)/1000 )) $(( $(cat $H/temp3_input)/1000 )) $(cat $H/fan1_input) $(cut -d' ' -f1 /sys/bus/pci/devices/0000:0b:00.0/current_link_speed)" >> "$1/hw-sensors.log"
    e0=$e1
  done
}
export LEAN_MLIR_CKPT_TAG=full
for net in mobilenetv2 mobilenetv4 efficientnet convnext resnet50; do
  tr=$net-verified-adam
  if [ $net = mobilenetv2 ]; then dir=runs/2026-10-23-$tr; else dir=runs/$(date +%F)-$tr; fi
  mkdir -p $dir
  say "break 15 min before $tr"; sleep 900
  for attempt in 1 2; do
    [ -e $dir/$tr.log ] && mv $dir/$tr.log $dir/$tr.until-$(date -u +%H%M).log
    [ -e $dir/hw-sensors.log ] && mv $dir/hw-sensors.log $dir/hw-sensors.until-$(date -u +%H%M).log
    hwlog $dir & hp=$!
    say "start $tr (attempt $attempt) → $dir"
    ( export RUN_LOG_DIR=$dir; ./run.sh $tr 0 xpu > /dev/null 2>&1 ) & rp=$!
    sleep 60
    while kill -0 $rp 2>/dev/null; do
      sleep 30
      age=$(( $(date +%s) - $(stat -c %Y $dir/$tr.log 2>/dev/null || date +%s) ))
      [ $age -gt 1200 ] && { say "STALL ($age s) — killing $tr"; pkill -f "bin/$tr"; sleep 10; pkill -9 -f "bin/$tr"; }
    done
    wait $rp; rc=$?
    kill $hp 2>/dev/null; wait $hp 2>/dev/null
    say "end $tr rc=$rc $(grep -E 'epoch [0-9]+: val_acc' $dir/$tr.log | tail -1 | cut -c1-80)"
    after $dir
    [ $rc = 0 ] && break
    [ $attempt = 1 ] && { say "failed; resuming after 15 min"; sleep 900; }
  done
done
say "all done"
