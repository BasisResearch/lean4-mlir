#!/bin/bash
# JAX ConvNeXt-T/S/B smokes (2026-10-12): the re-emitted official-recipe trainers (4096 as 256 x 16,
# lr 4e-3, no clip, min_lr 1e-6 per-step cosine, per-batch Mixup/CutMix draw, img_mean fill, constant
# EMA, f32 eval), two 25-step epochs (400 micro-batches) each validated in f32. The trainer_smoke.py
# copies = jax/generated/<trainer>.py + trainer_smoke.patch (`patch -o <out> <trainer> <patch>` from
# the repo root; the copies are not committed). Each runs at XLA's default arena first; on
# RESOURCE_EXHAUSTED it is re-run at XLA_PYTHON_CLIENT_MEM_FRACTION=0.97 (trap 2 of recipe_prep §4).
# Logs: full_default_arena.log, and full.log only if the retry ran.
set -u
R=/home/skoonce/lean/klawd_max_power/lean4-jax-mlir
cd $R/jax || exit 1
wait_idle() {  # the shim gates hold GPU 0 through TensorFlow while they run; start on an idle box
  while nvidia-smi --query-gpu=memory.used --format=csv,noheader,nounits | awk '$1 > 1000 {f=1} END {exit !f}'; do sleep 20; done
}
smoke() {  # <job> <trainer stem>
  local D=../runs/2026-10-12-$1-jax-smoke T=generated/generated_$2.py STEM=$2
  sed -e 's/^    EPOCHS = 300$/    EPOCHS = 2   # SMOKE: two short epochs, then exit (both inside the warmup)/' \
      -e 's|^    steps_per_epoch = train_examples // BATCH_SIZE$|    steps_per_epoch = 25   # SMOKE: 25 optimizer steps = 400 micro-batches an epoch|' \
      -e 's/^        _do_val = .*$/        _do_val = True   # SMOKE: validate after every (short) epoch/' \
      $T > $D/trainer_smoke.py
  diff -u $T $D/trainer_smoke.py > $D/trainer_smoke.patch
  run() { env "$@" JAX_COMPILATION_CACHE_DIR=/home/skoonce/.jax_cache LEAN_MLIR_PARAMS_OUT=/home/skoonce/cnx_smoke_2612/$STEM LEAN_MLIR_CKPT_EVERY=1000 \
            TFDS_DATA_DIR=/home/skoonce/tensorflow_datasets CUDA_VISIBLE_DEVICES=0,1,2,3 ../.venv/bin/python -u $D/trainer_smoke.py; }
  mkdir -p /home/skoonce/cnx_smoke_2612
  wait_idle
  run A=1 > $D/full_default_arena.log 2>&1
  if grep -q 'RESOURCE_EXHAUSTED' $D/full_default_arena.log; then
    run XLA_PYTHON_CLIENT_MEM_FRACTION=0.97 > $D/full.log 2>&1
  fi
  echo "$1 done"
}
smoke cnx  convnext_tiny_imagenet_full
smoke cnxs convnext_s_imagenet
smoke cnxb convnext_b_imagenet
rm -rf /home/skoonce/cnx_smoke_2612
# ── the verified halves: one capped window each through the supervisor (its prechecks, the shim, the
# driver's banners), then the smoke's checkpoint under the new tag is deleted.
cd $R
for j in cnx cnxs cnxb; do
  wait_idle
  slug=convnextin; [ $j = cnxs ] && slug=convnextsin; [ $j = cnxb ] && slug=convnextbin
  ONCE=1 LEAN_MLIR_MAX_STEPS=400 LEAN_MLIR_PROBE_WARM=200 RUNDIR=runs/2026-10-12-$j-default-emabf16-4gpu scripts/supervise.sh $j-default-emabf16-4gpu > runs/2026-10-12-$j-default-emabf16-4gpu/smoke_w4.log 2>&1
  rm -f .lake/build/${slug}_emaaccdp16xwxdroperfbf16_ckpt_xla.bin*
  echo "$j verified done"
done
echo ALL_SMOKES_DONE
