#!/bin/bash
# The ResNet-34 Bag-of-Tricks pair on ares, one half after the other (both take all four cards):
# the JAX reference (~13.3 h), then the verified path (~21 h). Launched under `systemd-run --user`.
R=/home/skoonce/lean/klawd_max_power/lean4-jax-mlir
J=$R/runs/2026-10-20-r34-bot-jax; V=$R/runs/2026-10-20-r34-bot-verified
echo "$(date '+%F %T') JAX start" >> $J/queue.log
$J/launch.sh > $J/launch.log 2>&1
echo "$(date '+%F %T') JAX exit $?" >> $J/queue.log
echo "$(date '+%F %T') verified start" >> $J/queue.log
$V/launch.sh > $V/launch.log 2>&1
echo "$(date '+%F %T') verified exit $?" >> $J/queue.log
