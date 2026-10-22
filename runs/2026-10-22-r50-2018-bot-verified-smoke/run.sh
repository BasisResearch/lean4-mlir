#!/bin/bash
# ResNet-50-2018 Bag-of-Tricks verified smoke (2026-10-22, imagenet_finish_line.md item 7): the first GPU
# execution of resnet50in_momdp64wxbf16 (no bias decay; zero-γ and BN 0.9 were already this net's).
# One epoch capped at 50 steps (LEAN_MLIR_G2_STEPS) through the supervisor, the epoch-end validation,
# then the `bot` checkpoint it wrote is deleted so the real run starts fresh.
set -u
R=/home/skoonce/lean/klawd_max_power/lean4-jax-mlir
D=$R/runs/2026-10-22-r50-2018-bot-verified-smoke
CK=$R/.lake/build/resnet50in_momdp64wxbf16_ckpt_xla_bot.bin
cd $R || exit 1
rm -f "$CK" "$CK".*
ONCE=1 LEAN_MLIR_G2_STEPS=50 RUNDIR=$D scripts/supervise.sh r50-2018-bf16-4gpu > $D/supervise.out 2>&1 &
SUP=$!
for i in $(seq 1 240); do   # up to 20 min: compile + 50 steps + 50k validation + checkpoint
  [ -f "$CK.epoch" ] && break
  sleep 5
done
sleep 15
pkill -TERM -f '[r]esnet50-imagenet-verified'
wait $SUP
echo "supervisor exit $?" >> $D/supervise.out
ls -la "$CK"* >> $D/supervise.out 2>&1
rm -f "$CK" "$CK".*
echo VERIFIED_SMOKE_DONE
