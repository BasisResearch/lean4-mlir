#!/bin/bash
# Runs once the R34 pair's queue unit exits: the R34 pair's rescore + McNemar, then the two R50-2018
# smokes (verified, JAX). Each step waits for the one before; nothing here is a long run.
R=/home/skoonce/lean/klawd_max_power/lean4-jax-mlir
L=$R/runs/2026-10-22-r50-2018-bot-verified-smoke/after_r34.log
while systemctl --user is-active -q r34-bot-queue; do sleep 60; done
echo "$(date '+%F %T') r34 queue done; rescore" >> $L
$R/runs/2026-10-20-r34-bot-verified/rescore.sh > /dev/null 2>&1; echo "$(date '+%F %T') rescore exit $?" >> $L
$R/runs/2026-10-22-r50-2018-bot-verified-smoke/run.sh >> $L 2>&1; echo "$(date '+%F %T') verified smoke exit $?" >> $L
$R/runs/2026-10-22-r50-2018-bot-jax-smoke/run.sh >> $L 2>&1; echo "$(date '+%F %T') jax smoke exit $?" >> $L
