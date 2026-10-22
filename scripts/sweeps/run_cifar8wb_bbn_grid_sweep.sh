#!/bin/bash
# FC-head width sweep of the verified cifar8 CNN at BATCH-statistics BN (AdamW) on the XLA/PJRT
# path — the batch-BN peer of run_cifar8bn_grid_sweep.sh (same widths, epochs, schedule and
# result columns), for the chapter-4 head-width figure on the layer the chapter names.
# planning/cifar-batch-bn-rerender.md.
#
#   scripts/sweeps/run_cifar8wb_bbn_grid_sweep.sh [EPOCHS=25] [OUT=runs/<date>-cifar8wb-bbn-grid-xla]
#   GPUS="0" (env) — which cards to use; widths are dealt round-robin, small/large interleaved.
#   One card: ~25 min for the ten widths at 25 epochs (the per-image sweep took 22 min on three).
#
# Needs `lake build cifar8wb-bbn-grid`; the binary renders its own width-slugged artifacts into
# .lake/build/ on every invocation, so nothing has to be rendered beforehand. Scores all 10,000
# test images through @<slug>_fwd_eval with the EMA'd running statistics and records the Wilson
# interval the trainer prints. XLA only — IREE llvm-cpu miscompiles this step's backward.
set -u
cd "$(dirname "$0")/../.."
EPOCHS="${1:-25}"
OUT="${2:-runs/$(date -u +%Y-%m-%d)-cifar8wb-bbn-grid-xla}"
GPUS="${GPUS:-0}"
BIN=.lake/build/bin/cifar8wb-bbn-grid
[ -x "$BIN" ] || { echo "no $BIN — lake build cifar8wb-bbn-grid first"; exit 1; }
[ -d data ] || { echo "no data/ — CIFAR-10 is read from data/cifar-10/"; exit 1; }
mkdir -p "$OUT"

run_gpu () {
  local gpu="$1"; shift
  local res="$OUT/results_gpu${gpu}.tsv"
  : > "$res"
  for d in "$@"; do
    local log="$OUT/cifar8wbbbn_fc${d}.log"
    # never resume an old width: the checkpoint AND its `.bn` running-stat companion
    rm -f .lake/build/cifar8wb_bbn_${d}_adam_ckpt*
    echo "=== $(date -u +%H:%M:%S) [gpu${gpu}] cifar8wb_bbn fc${d} (${EPOCHS} ep) ==="
    CUDA_VISIBLE_DEVICES="$gpu" "$BIN" "$d" "$EPOCHS" data > "$log" 2>&1
    # awk, not grep: the repo's grep wrapper honours .gitignore and skips *.log
    local last acc n lo hi floats msep
    last=$(awk '/test_acc = /{l=$0} END{print l}' "$log")
    acc=$(echo "$last"   | awk 'match($0,/= ([0-9.]+)%/,m){print m[1]}')
    n=$(echo "$last"     | awk 'match($0,/test_acc = [0-9]+\/([0-9]+)/,m){print m[1]}')
    lo=$(echo "$last"    | awk 'match($0,/95% CI ([0-9.]+)/,m){print m[1]}')
    hi=$(echo "$last"    | awk 'match($0,/95% CI [0-9.]+.([0-9.]+)\]/,m){print m[1]}')
    floats=$(awk 'match($0,/params, ([0-9]+) floats/,m){print m[1]; exit}' "$log")
    msep=$(awk 'match($0,/\(([0-9]+)ms\)/,m){l=m[1]} END{print l}' "$log")
    echo -e "${d}\t${acc:-NA}\t${n:-NA}\t${lo:-NA}\t${hi:-NA}\t${floats:-NA}\t${msep:-NA}" >> "$res"
    echo "    [gpu${gpu}] -> fc${d} acc=${acc:-NA}% n=${n:-NA} CI=[${lo:-NA},${hi:-NA}]"
  done
}

# deal widths round-robin over the GPUs, small and large interleaved so no card gets all the fat heads
WIDTHS=(8 4096 16 2048 32 1024 64 512 128 256)
read -ra G <<< "$GPUS"
declare -A LOTS; i=0
for d in "${WIDTHS[@]}"; do g=${G[$((i % ${#G[@]}))]}; LOTS[$g]+="$d "; i=$((i+1)); done
PIDS=()
for g in "${G[@]}"; do run_gpu "$g" ${LOTS[$g]} & PIDS+=($!); done
wait "${PIDS[@]}"

RESULTS="$OUT/results.tsv"
echo -e "d\tacc\tn_eval\tci_lo\tci_hi\tfloats\tms_per_ep" > "$RESULTS"
cat "$OUT"/results_gpu*.tsv | sort -n >> "$RESULTS"
echo "=== sweep done $(date -u +%H:%M:%S) ==="; cat "$RESULTS"
