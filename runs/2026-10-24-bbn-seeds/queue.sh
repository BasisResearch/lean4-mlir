#!/bin/bash
# Chapter 4 batch-statistics BN reruns on ares (4x 4060 Ti, CUDA/XLA), planning/cifar-batch-bn-rerender.md.
# Seeds 1-4 on the four cards, then seed 5 on card 0 beside the head-width grid on cards 1-3.
cd /home/skoonce/lean/klawd_max_power/lean4-jax-mlir || exit 1
export PLATFORM_BACKEND=cuda; . scripts/platform/env.sh
D=runs/2026-10-24-bbn-seeds
log () { echo "$(date -u '+%F %T') $*" >> $D/queue.log; }
log "seeds 1-4 start"
SUITE=bbn SWEEP_DIR=$D scripts/sweeps/seed_sweep.sh 0,1,2,3 "1 2 3 4"; log "seeds 1-4 exit $?"
SUITE=bbn SWEEP_DIR=$D scripts/sweeps/seed_sweep.sh 0 "1 2 3 4 5" & S=$!
GPUS="1 2 3" scripts/sweeps/run_cifar8wb_bbn_grid_sweep.sh 25 runs/2026-10-24-cifar8wb-bbn-grid-xla > $D/grid.out 2>&1; log "grid exit $?"
wait $S; log "seed 5 exit $?"
