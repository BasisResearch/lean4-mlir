#!/bin/bash
# The 100-epoch MNv4 pair on ares: JAX, then verified.
cd /home/skoonce/lean/klawd_max_power/lean4-jax-mlir || exit 1
Q=runs/2026-10-24-mnv4-full100-jax/queue.log
echo "$(date -u '+%F %T') JAX start" >> $Q
runs/2026-10-24-mnv4-full100-jax/launch.sh > runs/2026-10-24-mnv4-full100-jax/launch.log 2>&1; echo "$(date -u '+%F %T') JAX exit $?" >> $Q
echo "$(date -u '+%F %T') verified start" >> $Q
runs/2026-10-24-mnv4-full100-verified/launch.sh > runs/2026-10-24-mnv4-full100-verified/launch.log 2>&1; echo "$(date -u '+%F %T') verified exit $?" >> $Q
