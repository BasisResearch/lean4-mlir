#!/bin/bash
# MobileNetV2 verified smoke of slim's own validation decode (2026-10-12, D23; planning/recipe_prep.md §6
# addendum): one epoch capped at 50 steps (LEAN_MLIR_G2_STEPS) through the supervisor, so the epoch-end
# validation over 50,000 runs through the shim's re-emitted `_imagenet_decode_center_crop` (central_crop
# 0.875 of both sides of the whole decode, TF 1's bilinear to 224²; jax/.lake/build/generated_mobilenet_v2_
# imagenet_shim.py, synced from the committed copy). The run is stopped once the epoch's checkpoint lands
# and that checkpoint — keyed to the variant — is deleted, so no lineage starts here.
set -u
R=/home/skoonce/lean/klawd_max_power/lean4-jax-mlir
D=$R/runs/2026-10-12-mnv2-verified-evalcrop-smoke
CK=$R/.lake/build/mobilenetv2in_emarmstfdp64wxdwdoeps0001bf16_ckpt_xla.bin
cd $R || exit 1
rm -f "$CK" "$CK.epoch"
ONCE=1 LEAN_MLIR_G2_STEPS=50 RUNDIR=$D scripts/supervise.sh mnv2-default-4gpu > $D/supervise.out 2>&1 &
SUP=$!
for i in $(seq 1 180); do   # up to 15 min for compile + 50 steps + the streamed validation + the checkpoint
  [ -f "$CK.epoch" ] && break
  sleep 5
done
sleep 15   # let the post-validation lines flush
pkill -TERM -f '[m]obilenetv2-imagenet-verified'
wait $SUP
echo "supervisor exit $?" >> $D/supervise.out
ls -la "$CK" "$CK.epoch" >> $D/supervise.out 2>&1
rm -f "$CK" "$CK.epoch"
echo VERIFIED_SMOKE_DONE
