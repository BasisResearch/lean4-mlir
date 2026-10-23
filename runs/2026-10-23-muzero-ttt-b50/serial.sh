#!/bin/bash
# One process on the B50 at a time: two muzero-ttt processes sharing the card hung in oneAPI
# (2026-10-23 17:3x, a ccs job that never finished; GT reset on kill). Order: MuZero runs 2, 3
# (training) → the three sims-25 scores → Imagenette 80 epochs (15-min breaks) → the sims-100 scores.
S=/tmp/claude-1000/-home-skoonce-lean-lean4-mlir/bef76abc-e864-4bd8-a385-0fa83a988e62/scratchpad
H=/sys/class/hwmon/hwmon5
MZ=/home/skoonce/lean/lean4-mlir-muzero
MD=$MZ/runs/2026-10-23-muzero-ttt-b50
say() { echo "=== $(date -u '+%F %H:%M:%S') $*"; }
since=$(date '+%Y-%m-%d %H:%M:%S')
dropped() { journalctl -k --since "$since" --no-pager 2>/dev/null | grep -qE 'CT write|AER: .*(Uncorrectable|Fatal)'; }
gpu_ok() { timeout 120 /home/skoonce/lean/lean4-mlir/.venv-xpu/bin/python -c "import jax.numpy as j; assert float((j.ones((512,512))@j.ones((512,512))).sum())==512**3" >/dev/null 2>&1; }

# run <log> <stale_s> <max_s> cmd... — kill on a stale log (stale_s>0) or past max_s
run() {
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
after() {  # after a run: bus drop stops everything; a hung GPU gets a health check
  dropped && { journalctl -k --since "$since" --no-pager > $1/kernel-drop.txt; say "BUS DROP — stopping"; exit 2; }
  gpu_ok || { say "GPU health check failed — stopping"; journalctl -k --since "$since" --no-pager > $1/kernel-gpu-fail.txt; exit 3; }
}

# ---- MuZero (worktree, PJRT on the B50) ----
mz_env() {
  cd $MZ; export PLATFORM_BACKEND=xpu; . /home/skoonce/lean/lean4-mlir/scripts/platform/env.sh
  export ZE_AFFINITY_MASK=0 LEAN_MLIR_LOWERER_SO=/home/skoonce/lean/lean4-mlir/ffi/libpjrt_ffi.so
  unset IREE_BACKEND IREE_DEVICE LEAN_MLIR_LOWERER LEAN_MLIR_MEM_FRACTION
}
B=$MZ/.lake/build/bin/muzero-ttt
score() {  # tag sims
  local f=$MD/final_$1_sims$2_seed11.log
  say "score $1 sims$2"
  ( mz_env; run $f 0 14400 $B n=4 mode=score qnorm=0 sims=$2 seed=11 params=.lake/build/muzero_ttt_4x4_$1_params.bin ); local rc=$?
  say "  score rc=$rc $(grep -m1 'vs perfect, search' $f)"
  after $MD
}
for p in "201 2" "301 3"; do
  set -- $p; tag=n4_run1_q0_sims50_init$1_s$2
  grep -q '^trained:' $MD/$tag.log 2>/dev/null && { say "already trained: $tag"; continue; }
  [ -e $MD/$tag.log ] && mv $MD/$tag.log $MD/$tag.hung.log
  say "train $tag"
  ( mz_env; run $MD/$tag.log 600 7200 $B n=4 iters=60 steps=300 sims=50 qnorm=0 sweepN=20000 initSeed=$1 seed=$2 tag=$tag ); rc=$?
  say "  rc=$rc $(grep -E '^trained:' $MD/$tag.log) $(grep -E 'iter 60:' $MD/$tag.log | cut -c1-160)"
  cp $MZ/.lake/build/muzero_ttt_4x4_${tag}_curve.csv $MD/${tag}_curve.csv 2>/dev/null
  after $MD
done
for s in 1 2 3; do
  t=n4_run1_q0_sims50_init$((s * 100 + 1))_s$s
  [ -e $MD/final_${t}_sims25_seed11.log ] && mv $MD/final_${t}_sims25_seed11.log $MD/final_${t}_sims25_seed11.hung.log
  score $t 25
done

# ---- Imagenette, 80 epochs (main checkout) ----
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
    # run.sh tees into $dir/$tr.log; the watchdog reads that (an epoch is minutes; 20 min of silence is a hang)
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

# ---- the sims-100 scores last ----
for t in n4_run1_q0_sims50_init101_s1 n4_run1_q0_sims50_init201_s2 n4_run1_q0_sims50_init301_s3; do
  [ -e $MD/final_${t}_sims100_seed11.log ] && mv $MD/final_${t}_sims100_seed11.log $MD/final_${t}_sims100_seed11.killed.log
  score $t 100
done
say "all done"
