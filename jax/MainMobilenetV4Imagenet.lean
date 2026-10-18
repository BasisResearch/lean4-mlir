import Jax

/-! MobileNetV4-Conv-M on full 1000-class ImageNet — (Lean → JAX) trainer.

    `MainMobilenetV4.lean` is a 10-class Imagenette DEMO whose
    block table is Conv-S-sized (~4.1M params). This spec is the *faithful*
    MobileNetV4-Conv-Medium (~9.7M params, paper 79.9% top-1 non-distilled),
    transcribed 1:1 from timm `mobilenetv4_conv_medium` (`_gen_mobilenet_v4`,
    `timm/models/mobilenetv3.py`). timm's `uir_rN_aA_kK_sS_eE_cC` encoding decodes
    into `.uib ic oc expand stride preDWk postDWk` (a=pre/start-DW kernel,
    k=post/mid-DW kernel).

    Eval uses running BN statistics (`runningBN := true`): the UIB and fused-MBConv
    blocks are wired into the codegen's running-BN threading.

    Resolution: the spec is declared at 224, timm's `mobilenetv4_conv_medium.e500_r224_in1k`,
    which the `default` (100-epoch) tier trains at; the `full` tier sets `imgSize := 256`, the
    paper's own `input_size`, on the same spec (the generated `forward` infers the side). -/

def mobilenetV4ConvMImagenet : NetSpec where
  name := "MobileNetV4-Conv-M (ImageNet, bf16)"
  -- timm `mobilenetv4_conv_medium` pads every strided conv symmetrically (`(k-1)//2`); XLA `SAME`
  -- put the stem's extra row on the high side. See `PadStyle`.
  convPadStyle := .symmetric
  imageH := 224
  imageW := 224
  layers := [
    .convBn 3 32 3 2 .same,                       -- 224→112  stem
    -- stage 0 (FusedIB): er_r1_k3_s2_e4_c48
    .fusedMbConv 32 48 4 3 2 1 false .relu,       -- 112→56
    -- stage 1: 2× UIB
    .uib  48  80 4 2 3 5,                          -- 56→28   ExtraDW
    .uib  80  80 2 1 3 3,                          --         ExtraDW
    -- stage 2: 8× UIB
    .uib  80 160 6 2 3 5,                          -- 28→14   ExtraDW
    .uib 160 160 4 1 3 3,                          --         ExtraDW  (uir_r2 #1)
    .uib 160 160 4 1 3 3,                          --         ExtraDW  (uir_r2 #2)
    .uib 160 160 4 1 3 5,                          --         ExtraDW
    .uib 160 160 4 1 3 3,                          --         ExtraDW
    .uib 160 160 4 1 3 0,                          --         ConvNeXt
    .uib 160 160 2 1 0 0,                          --         FFN
    .uib 160 160 4 1 3 0,                          --         ConvNeXt
    -- stage 3: 11× UIB
    .uib 160 256 6 2 5 5,                          -- 14→7    ExtraDW
    .uib 256 256 4 1 5 5,                          --         ExtraDW
    .uib 256 256 4 1 3 5,                          --         ExtraDW  (uir_r2 #1)
    .uib 256 256 4 1 3 5,                          --         ExtraDW  (uir_r2 #2)
    .uib 256 256 4 1 0 0,                          --         FFN
    .uib 256 256 4 1 3 0,                          --         ConvNeXt
    .uib 256 256 2 1 3 5,                          --         ExtraDW
    .uib 256 256 4 1 5 5,                          --         ExtraDW
    .uib 256 256 4 1 0 0,                          --         FFN      (uir_r2 #1)
    .uib 256 256 4 1 0 0,                          --         FFN      (uir_r2 #2)
    .uib 256 256 2 1 5 0,                          --         ConvNeXt
    -- head: cn_r1_k1_s1_c960 → GAP → conv_head 1280 → norm_head → FC (timm order)
    .convBn 256 960 1 1 .same,                     -- 7  cn to 960
    .globalAvgPool,                               -- 7→1  (timm pools BEFORE conv_head)
    .convBn 960 1280 1 1 .same,                    -- 1  conv_head (num_features), on the POOLED features
    .dense 1280 1000 .identity                     -- 1000-class head
  ]

/-- Tier 2 — reduced-regularization 100-epoch tier (repo default), run on both paths: this recipe
    is the JAX reference's `mnv4-default-jax-4gpu` and the verified path's `mnv4-default-4gpu`
    (`emaaccdp8x128wxdowd005bf16`).

    The paper recipe (500ep, dropPath 0.075, RandAug m15 p0.7, wd 0.1,
    dropout 0.2) is tuned for the long schedule and UNDERFITS short. This tier
    dials regularization down for a real go/no-go signal in ~1–1.5 days.
    Expect low-to-mid 70s (paper 79.9 needs the full 500ep). -/
def mobilenetV4ConvMImagenetConfig : TrainConfig where
  learningRate         := 0.004    -- paper peak @ bs4096; here targets the effective batch
  batchSize            := 512
  gradAccumSteps       := 8        -- effective batch 4096 (paper) at one micro-batch's activation cost
  epochs               := 100
  optimizer            := .adam     -- AdamW (decoupled wd)
  weightDecay          := 0.05     -- reduced from paper 0.1 for the short schedule
  wdExcludeNormBias    := true     -- timm excludes norm γ/β + biases from decay
  cosineDecay          := true
  warmupEpochs         := 5
  labelSmoothing       := 0.1
  dropout              := 0.1      -- reduced from paper 0.2
  augment              := true
  useRandAugment       := true
  augBicubic     := true    -- PIL-bicubic geometry, as timm
  cropTorchvision      := true     -- torchvision RandomResizedCrop, not TF's sampler
  trainResize          := .random  -- timm train.py's default interpolation: bilinear or bicubic per image
  randAugmentGeometric := true     -- full color+geometric sampler
  randAugmentN         := 2
  randAugmentM         := 9.0      -- reduced from paper 15 for the short schedule
  useEMA               := true
  emaDecay             := 0.9999
  valEveryEpochs       := 5        -- eval every 5 ep (per-epoch 50k-img val wastes hours over 100ep)
  bf16                 := true
  bf16Conv             := true
  f32StemHead          := true    -- classifier head in fp32, as every verified render keeps it
  runningBN            := true     -- paper-faithful eval: running BN stats (UIB + fusedMbConv wired)

#eval mobilenetV4ConvMImagenet.validate!

/-- Tier 1 — ~30-epoch quick signal (does the 1000-class tfds path climb?). -/
def mobilenetV4ConvMImagenetConfigProbe : TrainConfig :=
  { mobilenetV4ConvMImagenetConfig with epochs := 30 }

/-- Throughput bench: micro-batch 128 (== one GPU's shard of the real 4-GPU
    512 micro-batch), no grad-accum, single epoch. For measuring per-GPU img/s
    to extrapolate a run-time estimate; kill after a couple hundred steps. -/
def mobilenetV4ConvMImagenetConfigBench : TrainConfig :=
  { mobilenetV4ConvMImagenetConfig with
      epochs := 1, batchSize := 128, gradAccumSteps := 1, useEMA := false }

/-- Tier 3 — the paper's 500-epoch recipe, as the paper's own training config has it:
    tensorflow/models `official/vision/configs/experiments/image_classification/
    imagenet_mobilenetv4_conv_medium_tpu.yaml` (its header names the paper's 500-epoch top-1), read 2026-10-12,
    with tf-models' `augment.py` / `classification_input.py` / `preprocess_ops.py` /
    `lr_schedule.py` / `nn_layers.py` where the yaml inherits a default. Every line below names its
    source; the net stays timm's `mobilenetv4_conv_medium` (the parity gate's). Its head order is
    tf-models' too: `_mnv4_conv_medium_block_specs` ends `convbn 960`, `gpooling`, `convbn 1280`,
    so both pool before the 1280 conv (read 2026-10-17; the "8×8 then pool" reading was wrong).
    Disclosed: the init (timm's, D4) and the decay reaching the classifier bias (the yaml excludes BN only).
    The verified peer is `mnv4Imagenet256FullVerified` (`mnv4in256`). -/
def mobilenetV4ConvMImagenetConfigFull : TrainConfig :=
  { mobilenetV4ConvMImagenetConfig with
      epochs         := 500        -- yaml: train_steps 156000 = 500 × 312 at 4096
      weightDecay    := 0.1        -- yaml: adamw.weight_decay_rate 0.1 (BN excluded)
      dropout        := 0.2        -- yaml: dropout_rate 0.2
      randAugmentM   := 15.0       -- yaml: randaug.magnitude 15; tf-models clamps only at magnitude_std > 0, so 15 extrapolates (Posterize 6 bits, Solarize a no-op, enhance 2.8, rotate 45°)
      randAugmentProb := 0.7       -- yaml: prob_to_apply 0.7
      randAugmentIdentityOp := true  -- augment.py `_distort_common`: the op index is drawn over len(ops) + 1 (an identity branch)
      randAugmentTranslateConst := 100.0  -- augment.py default translate_const 100: ±150 px at m15, not timm's 0.45 of the side
      augBicubic     := false      -- tf-models resamples its geometric ops through ImageProjectiveTransformV3 …
      augNearest     := true       -- … at interpolation='nearest' (augment.py `transform`), fill 128 (wrap/unwrap)
      randAugmentFillMean := false -- the 128 fill, not timm's img_mean
      dropPath       := 0.075      -- yaml: stochastic_depth_drop_rate 0.075, flat_stochastic_depth_drop_rate false …
      dropPathAllBlocks := true    -- … mobilenet.py: rate · (block_idx + 1) / 26 over the whole block list, the gpooling entry included (UIB i at (i + 3) / 26), residual blocks only
      imgSize        := 256        -- yaml: input_size [256, 256, 3], train and eval
      testCropRatio  := 0.875      -- image_classification.py: center_crop_fraction 0.875 (the default at 256 would be 256/288)
      evalCropTf     := true       -- classification_input.py: centre crop of the SHORTER side, then resize bilinear
      cropTorchvision := false     -- preprocess_ops.random_crop_image_v2: TF's sample_distorted_bounding_box …
      cropFallbackCenter := true   -- … and classification_input.py's Parser replaces a crop that came back whole with center_crop_image_v2 (0.875 of the shorter side) — tf-models' form, not EfficientNet's (2026-10-17)
      cropMinCovered := 0.08       -- … min_object_covered = area_range[0] = 0.08
      trainResize    := .bilinear  -- image_classification.py: tf_resize_method 'bilinear'
      resizeAntialias := false     -- tf.image.resize's default, which tf-models runs
      bnMomentum     := 0.997      -- yaml: norm_momentum 0.997 (the 100-epoch tier's 0.99 is the repo's own)
      bnEps          := 1e-3       -- yaml: norm_epsilon 0.001 (timm's 1e-5 stays on the 224 tier the parity gate ties)
      adamEps        := 1e-7       -- Table 10 / Keras AdamWeightDecay default epsilon 1e-7
      cosineFromStep0 := true      -- yaml: CosineDecay decay_steps 156000 from step 0 + linear warmup 1560 steps (5 epochs) from 0
      evalF32        := true       -- the verified path's eval forward; scored post hoc in f32 as every pair is
      useEMA         := false }    -- Table 10: no EMA for Conv-M; the live weights are scored

/-- Tier 3 at 100 epochs — the paper recipe above with only the length cut: the cosine runs over
    100 × 312 steps from step 0 with the same 5-epoch warmup on top. A one-day read on the recipe
    before the 500-epoch run, not the paper's number. -/
def mobilenetV4ConvMImagenetConfigFull100 : TrainConfig :=
  { mobilenetV4ConvMImagenetConfigFull with epochs := 100 }

def mobilenetV4ConvMImagenetRecipes : List Recipe := [
  { name := "default", cfg := mobilenetV4ConvMImagenetConfig,
    out := "generated_mobilenet_v4_imagenet.py",
    desc := "Tier-2 ~100ep reduced-reg confidence run" },
  { name := "probe",   cfg := mobilenetV4ConvMImagenetConfigProbe,
    out := "generated_mobilenet_v4_imagenet_probe.py",
    desc := "Tier-1 ~30ep quick-signal run" },
  { name := "full",    cfg := mobilenetV4ConvMImagenetConfigFull,
    out := "generated_mobilenet_v4_imagenet_full.py",
    desc := "Tier-3 paper-faithful 500ep run" },
  { name := "full100", cfg := mobilenetV4ConvMImagenetConfigFull100,
    out := "generated_mobilenet_v4_imagenet_full100.py",
    desc := "Tier-3 paper recipe cut to 100ep" },
  { name := "bench",   cfg := mobilenetV4ConvMImagenetConfigBench,
    out := "generated_mobilenet_v4_imagenet_bench.py",
    desc := "throughput bench: micro-batch 128, single GPU" }
]

def main (args : List String) : IO Unit :=
  runRecipeMain "mobilenet-v4-imagenet" mobilenetV4ConvMImagenet .imagenet
    mobilenetV4ConvMImagenetRecipes args
