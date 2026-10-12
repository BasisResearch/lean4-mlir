# MobileNetV2 JAX smoke of slim's own validation decode — 2026-10-12 (later), ares (4× 4060 Ti)

The `full` trainer re-emitted with the two rows §6 had left disclosed (planning/recipe_prep.md §6 addendum,
`imagenet_parity.md` D23): TF 1's `resize_bilinear` on the train crop (`resizeLegacyTf1`, where the first
emit ran TF 2's half-pixel bilinear) and slim's `preprocess_for_eval` at validation (`evalCropSlim`:
`tf.image.central_crop(0.875)` of BOTH sides of the whole decoded image, then TF 1's bilinear to 224 × 224;
timm's resize-then-crop kept under `_imagenet_decode_center_crop_timm` for `PROTOCOL=timm`). Patched to one
50-step epoch (`trainer_smoke.patch`, the two `SMOKE` lines only), then the full 50,000-image f32 validation.
`run.sh`; the checkpoint directory `~/mnv2_smoke_evalcrop_2612/` was deleted afterwards. XLA's default arena,
4 × 64. The whole-vs-cropped decode question the gate raised (`scripts/gates/slim_eval_crop_gate.py`:
`decode_and_crop_jpeg` differs from the whole decode by one column at an unaligned window) is settled in the
emitted text, not here; this run checks that the decode traces and runs inside `tf.data` on the real set.

## `full_default_arena.log`

    lr=0.120000  batch_size=256 (4 devices x 64)  epochs=1  params=3504872
    steps_per_epoch=50  total_steps=50
      eval: f32 forward (evalF32)
    [Epoch 1] lr=0.12 loss(train_avg)=7.3653 val_top1=50/50000 (0.001) val_top5=0.005 val_loss=6.9581  [27.9s train, 12.4s val]
    saved 53 param-groups ... saved full train state ... (840 arrays, step=50)
    exit 0

* The validation ran through slim's decode over all 50,000 images in 12.4 s (the 10-12 smoke's timm-form
  validation took 14.3 s in its second epoch) — a whole `decode_jpeg` per image plus TF 1's bilinear is no
  dearer than the bicubic-antialias resize it replaces; the ETA in `mnv2-full-jax-4gpu.conf` (~49 h) stands.
* 50 / 50,000 after 50 steps is chance, as it should be; the f32 eval line precedes the validation (F8);
  `ema_params` / `ema_bn` in the saved state, which `eval_full50k.py` scores by default.
* No pace claim: 27.9 s for 50 steps includes the compile.
