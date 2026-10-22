#!/bin/bash
# Waits for the R50-2018 pair's queue unit to exit, then the pair's rescore + McNemar (rescore.sh).
R=/home/skoonce/lean/klawd_max_power/lean4-jax-mlir
L=$R/runs/2026-10-22-r50-2018-bot-verified/after_queue.log
while systemctl --user is-active -q r50-2018-bot-queue; do sleep 60; done
echo "$(date '+%F %T') r50-2018 queue done; rescore" >> $L
$R/runs/2026-10-22-r50-2018-bot-verified/rescore.sh > /dev/null 2>&1; echo "$(date '+%F %T') rescore exit $?" >> $L
