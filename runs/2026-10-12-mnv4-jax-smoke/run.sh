#!/bin/bash
# MobileNetV4-Conv-M paper-tier smokes (2026-10-12): the re-emitted `full` trainer as the paper's own
# config has it (256², 4096 as 512 x 8, AdamW 4e-3 at ε 1e-7, BN 0.997 / 1e-3, tf-models' cosine from
# step 0, RandAugment m15 p0.7 under TF's mappings, TF's crop at 0.08, bilinear without antialias, the
# eval crop 0.875 of the short side; planning/recipe_prep.md §5), two 25-step epochs (200 micro-batches)
# each validated in f32. trainer_smoke.py = jax/generated/<trainer>.py + trainer_smoke.patch (not
# committed). At XLA's default arena first; on RESOURCE_EXHAUSTED re-run at 0.97 (trap 2 of §4).
# Then the verified half: one capped window through the supervisor (its prechecks, the shim, the
# driver's banners), and the smoke's checkpoint under the new slug is deleted.
set -u
R=/home/skoonce/lean/klawd_max_power/lean4-jax-mlir
D=$R/runs/2026-10-12-mnv4-jax-smoke
wait_idle() {
  while nvidia-smi --query-gpu=memory.used --format=csv,noheader,nounits | awk '$1 > 1000 {f=1} END {exit !f}'; do sleep 20; done
}
cd $R/jax || exit 1
T=generated/generated_mobilenet_v4_imagenet_full.py
sed -e 's/^    EPOCHS = 500$/    EPOCHS = 2   # SMOKE: two short epochs, then exit (both inside the warmup)/' \
    -e 's|^    steps_per_epoch = train_examples // BATCH_SIZE$|    steps_per_epoch = 25   # SMOKE: 25 optimizer steps = 200 micro-batches an epoch|' \
    -e 's/^        _do_val = .*$/        _do_val = True   # SMOKE: validate after every (short) epoch/' \
    $T > $D/trainer_smoke.py
diff -u $T $D/trainer_smoke.py > $D/trainer_smoke.patch
run() { env "$@" JAX_COMPILATION_CACHE_DIR=/home/skoonce/.jax_cache LEAN_MLIR_PARAMS_OUT=/home/skoonce/mnv4_smoke_2612/mobilenet_v4_imagenet_full LEAN_MLIR_CKPT_EVERY=1000 \
          TFDS_DATA_DIR=/home/skoonce/tensorflow_datasets CUDA_VISIBLE_DEVICES=0,1,2,3 ../.venv/bin/python -u $D/trainer_smoke.py; }
mkdir -p /home/skoonce/mnv4_smoke_2612
wait_idle
run A=1 > $D/full_default_arena.log 2>&1
if grep -q 'RESOURCE_EXHAUSTED' $D/full_default_arena.log; then
  run XLA_PYTHON_CLIENT_MEM_FRACTION=0.97 > $D/full.log 2>&1
fi
rm -rf /home/skoonce/mnv4_smoke_2612
echo "jax smoke done"
cd $R
wait_idle
ONCE=1 LEAN_MLIR_MAX_STEPS=400 LEAN_MLIR_PROBE_WARM=200 RUNDIR=runs/2026-10-12-mnv4-full-4gpu scripts/supervise.sh mnv4-full-4gpu > runs/2026-10-12-mnv4-full-4gpu/smoke_w4.log 2>&1
rm -f .lake/build/mnv4in256_accdp8x128wxdropdowd01bf16_ckpt_xla.bin*
echo "verified smoke done"
echo ALL_SMOKES_DONE
