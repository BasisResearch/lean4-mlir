import Jax

/-! MobileNetV2 on full 1000-class ImageNet — Lean → JAX trainer.
    Same inverted-residual body as `MainMobilenetV2.lean` (Imagenette) but
    with a 1000-class head and the `.imagenet` (tfds streaming) dataset.

    bf16 incl. bf16 conv: the Codegen routes the inverted-residual
    expand/project 1x1s and the depthwise through `convdt`, so `bf16Conv`
    reaches the 17 inverted-residual blocks as well as the stem + final 1x1.
    The block-level
    win on the 4060 Ti comes from the 1x1 expand/project (GEMM-like), which
    love bf16; the 3x3 depthwise is a wash but harmless. See the per-op
    microbench in `planning/archive/imagenet_sweep.md`. -/

def mobilenetV2Imagenet : NetSpec where
  name := "MobileNetV2 (ImageNet, bf16)"
  imageH := 224
  imageW := 224
  -- The same override EfficientNet-B0 needs (`MainEfficientNetImagenet.lean`).
  -- `NetSpec.convBnAct` defaults to `.relu`
  -- (`LeanMlir/Types.lean`), so without this line the two `.convBn` layers below — the stem and
  -- the 1×1 head — emit `jax.nn.relu` while every inverted-residual interior emits ReLU6.
  -- MobileNetV2 is ReLU6 throughout, as the Imagenette twin (`MainMobilenetV2.lean`) says.
  -- The VERIFIED render is ReLU6 (35 `stablehlo.maximum` paired with 35
  -- `stablehlo.minimum`, including at the 32×112×112 stem).
  -- The book's reference run (runs/2026-09-27-mnv2-jax-bf16-350ep/) trained with this line; its
  -- predecessor trained a ReLU stem/head and was retired for it.
  convBnAct := .relu6
  layers := [
    .convBn 3 32 3 2 .same,                    -- 224→112
    .invertedResidual  32  16 1 1 1,            -- 112, t=1
    .invertedResidual  16  24 6 2 2,            -- 112→56, t=6
    .invertedResidual  24  32 6 2 3,            -- 56→28, t=6
    .invertedResidual  32  64 6 2 4,            -- 28→14, t=6
    .invertedResidual  64  96 6 1 3,            -- 14, t=6
    .invertedResidual  96 160 6 2 3,            -- 14→7, t=6
    .invertedResidual 160 320 6 1 1,            -- 7, t=6
    .convBn 320 1280 1 1 .same,                 -- 1x1 conv to 1280
    .globalAvgPool,
    .dense 1280 1000 .identity                  -- 1000-class head
  ]

/-- MobileNetV2 as TF-slim trained it — `research/slim/nets/mobilenet/README.md`'s own
    reproduction command (the README's own "roughly 72.0" top-1), read line for line with the sources it runs
    (`train_image_classifier.py`, `mobilenet.training_scope`, `conv_blocks.expanded_conv`,
    `inception_preprocessing.py`, TF's `training_ops.cc`), on 2026-10-12 (planning/recipe_prep.md §6).
    The README's line is named beside each value; the book's landed pair (§6.5) ran the paper's
    sentence instead (0.045 unscaled at 256, ×0.98 per epoch, 350 epochs, no smoothing, no EMA,
    mean/std inputs, timm's init and decay set). `default` is this recipe at 90 epochs, a
    validation tier; `full` below is the run.

    * Optimizer — `--optimizer rmsprop` (the flag's default), `rmsprop_decay 0.9`,
      `rmsprop_momentum 0.9`, `opt_epsilon 1.0`; TF1's `ApplyRMSProp` puts the rate inside the
      momentum term (`rmspropTf`) and starts the mean-square at 1.
    * Rate and schedule — `--learning_rate=0.045 * NUM_GPUS` on `--batch_size=96` per clone, i.e.
      0.045 per 96 images: **0.12 at this pair's 256**; `exponential_decay(staircase=True)` from
      step 0, `--learning_rate_decay_factor=0.98` every `--num_epochs_per_decay=2.5 / NUM_GPUS`
      per-clone epochs = every 2.5 epochs of data; no warmup (`warmup_epochs` unset).
    * Decay — `weight_decay 4e-5` as `l2_regularizer` on `slim.conv2d` only: not BN, not biases,
      not the depthwise (`separable_conv2d`, `weights_regularizer=None`): `wdExcludeNormBias` +
      `wdExcludeDepthwise`. Coupled, through the regularization loss.
    * Init — `training_scope(stddev=0.09)`: `truncated_normal_initializer` on every kernel and the
      logits (`initTruncNormal`), biases 0.
    * `--label_smoothing=0.1`; `dropout_keep_prob 0.8`; `--moving_average_decay=0.9999` as
      `tf.train.ExponentialMovingAverage(decay, global_step)` — the warmup-corrected form
      (`emaWarmup`), and `eval_image_classifier` restores the averages, so the shadow is scored.
    * BN — `bn_decay 0.997`, slim's `batch_norm` ε 1e-3.
    * Pipeline — `--preprocessing_name="inception_v2"` = `inception_preprocessing` in `fast_mode`:
      `distorted_bounding_box_crop` at `min_object_covered 0.1`, aspect `(0.75, 1.33)`, area
      `(0.05, 1.0)`, 100 attempts, the whole image on exhaustion; `resize_images` bilinear, no
      antialias; flip; `distort_color` fast = brightness ±32/255 then saturation 0.5–1.5, clipped
      (`colorDistortSlim`); `(x − 0.5) × 2` (`inputScalePm1`). No AutoAugment, no Mixup.
    * Length — "about 700K steps" on 8 clones of 96: 700,000 × 768 / 1,281,167 ≈ 420 epochs.
    * The reference number is scored through an f32 forward (`evalF32`), F8.

    Disclosed, not reproduced: slim's eval (`central_crop(0.875)` on both sides, then a
    non-aspect-preserving bilinear resize to 224) — the in-training and post-hoc scores use timm's
    224 / 0.875 protocol, as every pair in the book; and the sixteen asynchronous workers of 96,
    which are four synchronous replicas of 64 here. -/
def mobilenetV2ImagenetConfig : TrainConfig where
  learningRate   := 0.12    -- README: learning_rate 0.045*NUM_GPUS on batch_size 96*NUM_GPUS, so 0.045 per 96 images: 0.12 at 256
  batchSize      := 256
  epochs         := 90      -- the validation tier; `full` is the README's ~420
  optimizer      := .rmsprop  -- train_image_classifier.py: `optimizer` defaults to rmsprop
  momentum       := 0.9       -- rmsprop_momentum 0.9
  rmspropDecay   := 0.9       -- rmsprop_decay 0.9
  rmspropEps     := 1.0       -- opt_epsilon 1.0 (NOT 1e-8)
  rmspropTf      := true      -- TF1 ApplyRMSProp: the rate inside the momentum term (D13)
  weightDecay    := 4e-5      -- weight_decay 4e-5, coupled (the regularization loss)
  wdExcludeNormBias := true   -- l2_regularizer on slim.conv2d only: no BN γ/β, no biases
  wdExcludeDepthwise := true  -- …and separable_conv2d (the depthwise) has weights_regularizer=None (D11)
  initTruncNormal := 0.09     -- training_scope(stddev=0.09): truncated_normal on every kernel + the logits
  cosineDecay      := false   -- exponential_decay instead
  expLRDecayRate   := 0.98    -- learning_rate_decay_factor 0.98
  expLRDecayEpochs := 2.5     -- num_epochs_per_decay = 2.5 / NUM_GPUS per-clone epochs = 2.5 epochs of data
  expLRStaircase   := true    -- staircase=True, counted from step 0
  dropout          := 0.2     -- dropout_keep_prob 0.8
  warmupEpochs   := 0         -- warmup_epochs unset
  augment        := true      -- inception_preprocessing: distorted crop + flip
  cropAreaMin    := 0.05      -- distorted_bounding_box_crop area_range (0.05, 1.0)
  cropMaxAttempts := 100      -- …max_attempts 100 (then the whole image)
  cropAspectLo   := 0.75      -- …aspect_ratio_range (0.75, 1.33)
  cropAspectHi   := 1.33
  trainResize    := .bilinear -- resize_images, fast_mode: bilinear
  resizeAntialias := false    -- tf.image.resize_images: no antialias
  colorDistortSlim := true    -- distort_color fast_mode: brightness ±32/255 then saturation 0.5–1.5 (D12)
  inputScalePm1  := true      -- (x − 0.5) × 2
  useAutoAugment := false     -- none in slim's pipeline
  labelSmoothing := 0.1       -- README: --label_smoothing=0.1
  useEMA         := true      -- README: --moving_average_decay=0.9999
  emaDecay       := 0.9999
  emaWarmup      := true      -- tf.train.ExponentialMovingAverage(decay, num_updates=global_step)
  evalF32        := true      -- the reference number from an f32 forward (F8)
  bf16           := true
  bf16Conv       := true      -- reaches the inverted-residual blocks
  f32StemHead    := true      -- classifier head in fp32, as every verified render keeps it
  runningBN      := true      -- paper-faithful eval: running BN stats, not eval-batch stats
  bnMomentum     := 0.997     -- training_scope bn_decay 0.997 (PyTorch momentum 0.003)
  bnEps          := 1e-3      -- slim.batch_norm's ε

#eval mobilenetV2Imagenet.validate!

/-- The run: the README's "about 700K steps" on 8 clones of 96 = 700,000 × 768 / 1,281,167 ≈ 420
    epochs of data. Selected with the `full` recipe arg; writes a separate `_full.py` so a quick
    validation subrun and the multi-day run never clobber each other. -/
def mobilenetV2ImagenetConfigFull : TrainConfig :=
  { mobilenetV2ImagenetConfig with epochs := 420 }

def mobilenetV2ImagenetRecipes : List Recipe := [
  { name := "default", cfg := mobilenetV2ImagenetConfig,
    out := "generated_mobilenet_v2_imagenet.py",
    desc := "90-epoch validation tier (TF-slim's README recipe, short)" },
  { name := "full",    cfg := mobilenetV2ImagenetConfigFull,
    out := "generated_mobilenet_v2_imagenet_full.py",
    desc := "TF-slim's README recipe, 420 epochs" }
]

def main (args : List String) : IO Unit :=
  runRecipeMain "mobilenet-v2-imagenet" mobilenetV2Imagenet .imagenet
    mobilenetV2ImagenetRecipes args
