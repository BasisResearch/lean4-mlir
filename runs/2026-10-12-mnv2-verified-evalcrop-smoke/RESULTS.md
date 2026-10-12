# MobileNetV2 verified smoke of slim's own validation decode — 2026-10-12 (later), ares (4× 4060 Ti)

`mnv2-default-4gpu` through the supervisor (`ONCE=1 LEAN_MLIR_G2_STEPS=50`, `run.sh`): the render
`emarmstfdp64wxdwdoeps0001bf16` unchanged, the shim re-emitted with the two rows §6 had left disclosed
(planning/recipe_prep.md §6 addendum, `imagenet_parity.md` D23) — TF 1's `resize_bilinear` on the train crop
(`resizeLegacyTf1`) and slim's `preprocess_for_eval` at validation (`evalCropSlim`: `central_crop(0.875)` of
BOTH sides of the whole decoded image, then TF 1's bilinear to 224 × 224) — so that the epoch-end validation
over all 50,000 images runs through the shim's new `_imagenet_decode_center_crop`. One epoch capped at 50
steps, the validation, the checkpoint; epoch 2 began and the run was stopped (`supervisor exit 143`). The
checkpoint the epoch wrote under the variant (`.bin`, `.epoch`, `.bn`) was deleted, so no lineage starts here.

## `supervise.out` (the trainer's lines; `master.log` is the supervisor's)

    ▸ RMSPROP: m = momentum buffer (init 0), v = running MEAN-SQUARE (init 1.0, TF convention …)
    ▸ EMA: region 3 of 4 [θ|m|v|ema], … decay min(0.999900, (1+t)/(10+t)) — TF warmup-corrected. EVAL AND CHECKPOINT SCORE THE SHADOW.
    ▸ INIT: truncated normal σ=0.090000 on every conv kernel, depthwise and dense (TF-slim training_scope …)
    running-stats BN: 52 layers, 34112 stat floats → eval via @mobilenetv2in_fwd_eval_eps0001
    EVAL SHARDED: 4 replicas x 64 = 256 test images per invoke, 196 invokes, last one 80 real + 176 pad
    ▸ val: STREAMED per pass — 2 batch-block producer(s) … nothing held
    ▸ val = all 50000 streamed (timm's denominator)
    epoch 1: test_acc = 50/50000 = 0.100000%  top5 = 254/50000 = 0.508000%  [95% CI 0.08–0.13]
      per-example top-1 bitmap -> …/bitmaps/mobilenetv2in_emarmstfdp64wxdwdoeps0001bf16…  (LEAN_MLIR_DUMP_CORRECT, the conf's)
      BN companion -> .lake/build/…_ckpt_xla.bin.bn (34112 floats x 2)
    step 0/50: loss=7.140979      ← epoch 2, then stopped

* The shim's streamed validation decoded all 50,000 JPEGs whole and cropped slim's window inside `tf.data`
  across its two producers — no trace error, no shape fault at the odd-sized images, the bitmap written.
* 50 / 50,000 after 50 steps of 256 is chance, as it must be; the precheck's greps (two legacy bilinear
  calls, slim's comment line, `central_crop`'s arithmetic, the `_timm` form, no `ResizeMethod.BILINEAR`)
  passed on the synced shim before the launch (`DRY_RUN=1` the same minute).
* No pace claim: 50 steps include the compile; `mnv2-default-4gpu.conf`'s ETA (~63 h, the 10-12 smoke at
  96 ms a step) stands — the eval is a small share of an epoch and slim's decode is no dearer than timm's.
