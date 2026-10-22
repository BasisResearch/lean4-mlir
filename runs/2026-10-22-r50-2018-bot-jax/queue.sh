#!/bin/bash
# The ResNet-50-2018 Bag-of-Tricks pair on ares, one half after the other (both take all four cards):
# the JAX reference (~22.5 h), then the verified path (~29 h). Launched under `systemd-run --user`.
R=/home/skoonce/lean/klawd_max_power/lean4-jax-mlir
J=$R/runs/2026-10-22-r50-2018-bot-jax; V=$R/runs/2026-10-22-r50-2018-bot-verified
echo "$(date '+%F %T') JAX start" >> $J/queue.log
$J/launch.sh > $J/launch.log 2>&1
echo "$(date '+%F %T') JAX exit $?" >> $J/queue.log
echo "$(date '+%F %T') verified start" >> $J/queue.log
$V/launch.sh > $V/launch.log 2>&1
echo "$(date '+%F %T') verified exit $?" >> $J/queue.log
