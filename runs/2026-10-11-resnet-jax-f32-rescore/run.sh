#!/bin/bash
# ResNet reference reruns (mars, 2026-10-07; copied to /home/skoonce/resnet/mars_2610/) rescored over the
# full 50k through the trainer's own bf16 forward and through f32 (EVAL_DTYPE=f32), each writing its
# per-image top-1 bitmap (DUMP_CORRECT) for the McNemar pairing with the verified bitmaps.
set -u
cd "$(dirname "$0")/../../jax" || exit 1
R=../runs/2026-10-11-resnet-jax-f32-rescore
for spec in "r34:generated_resnet34_imagenet:/home/skoonce/resnet/mars_2610/r34_2018_jax_2610/resnet34_imagenet.state.npz" \
            "r50-2018:generated_resnet50_imagenet_2018:/home/skoonce/resnet/mars_2610/r50_2018_jax_2610/resnet50_imagenet_2018.state.npz" \
            "r50-a3:generated_resnet50_imagenet_rsbfaithful:/home/skoonce/resnet/mars_2610/r50_a3_jax_2610/resnet50_imagenet_rsbfaithful.state.npz"; do
  IFS=: read -r tag gen ckpt <<<"$spec"
  for dt in module f32; do
    JAX_COMPILATION_CACHE_DIR=/home/skoonce/.jax_cache TFDS_DATA_DIR=/home/skoonce/tensorflow_datasets \
    CUDA_VISIBLE_DEVICES=0,1,2,3 GEN=generated/$gen.py CKPT=$ckpt BATCH=200 PROTOCOL=train \
    EVAL_DTYPE=$dt DUMP_CORRECT=$R/bitmaps/${tag}_jax_${dt} LABEL="$tag jax 2610 $dt" \
      ../.venv/bin/python -u scripts/eval_full50k.py 2>&1 | tee $R/${tag}_${dt}.log
  done
done
