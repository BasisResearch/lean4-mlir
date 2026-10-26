#!/bin/bash
# The 500-epoch MNv4 pair, chained after the 10-24 100-epoch pair (unit mnv4-e100-queue), on the user's
# word "assuming this works": it starts only if both 100-epoch halves exited 0 and each read >= 76 % top-1
# at epoch 100 (the 10-14 pair: 77.39 / 77.35). Then verified (~75 h), then JAX (~112 h) — verified
# first at the user's ask (10-26).
R=/home/skoonce/lean/klawd_max_power/lean4-jax-mlir; cd $R || exit 1
J=$R/runs/2026-10-26-mnv4-full500-jax; V=$R/runs/2026-10-26-mnv4-full500-verified
P=$R/runs/2026-10-24-mnv4-full100-jax/queue.log
log () { echo "$(date -u '+%F %T') $*" >> $J/queue.log; }
log "waiting on mnv4-e100-queue"
while systemctl --user is-active -q mnv4-e100-queue; do sleep 120; done
jx=$(awk '/^\[Epoch 100\]/' $R/runs/2026-10-24-mnv4-full100-jax/full.log | grep -o '(0\.[0-9]*)' | tr -d '()')
vf=$(awk '/epoch 100: test_acc/' $R/runs/2026-10-24-mnv4-full100-verified/full.log | grep -o '= [0-9.]*%' | head -1 | tr -dc '0-9.')
log "100-ep pair: JAX ${jx:-none} verified ${vf:-none}%"
grep -q 'JAX exit 0' $P && grep -q 'verified exit 0' $P \
  && awk -v j="${jx:-0}" -v v="${vf:-0}" 'BEGIN{exit !(j>=0.76 && v>=76)}' \
  || { log "GATE FAILED — the 500-epoch pair NOT launched"; exit 1; }
sleep 60
log "verified start"; $V/launch.sh > $V/launch.log 2>&1; log "verified exit $?"
log "JAX start"; $J/launch.sh > $J/launch.log 2>&1; log "JAX exit $?"
