import Jax

/-! ConvNeXt-Small on full 1000-class ImageNet — Lean → JAX trainer.

    The only change from `MainConvNeXtImagenet.lean` (ConvNeXt-T) is the stage-3
    depth: compute ratio (3,3,9,3) → (3,3,27,3) at the same channel widths
    (96,192,384,768). ~49.5M params vs T's 28.6M. Everything else — patchify
    stem, depthwise-7×7 + channel-LN + inverted-bottleneck + GELU + LayerScale,
    dedicated 2×2 stride-2 downsamples — is identical.

    Depth 36 vs T's 18 means twice the sequential blocks and roughly twice the
    live activation per sample, so this is the first variant where per-device
    batch is likely to need attention on a 16 GB card. -/

def convNeXtSImagenet : NetSpec where
  name := "ConvNeXt-S (ImageNet, bf16)"
  imageH := 224
  imageW := 224
  layers := [
    .convNextStem 3 96 4,                      -- patchify stem: 4×4 s4 conv → channel-LN
    .convNextStage 96 3 .ln .gelu,             -- stage 1: 3 blocks @ 96
    .convNextDownsample 96 192,                -- 56→28
    .convNextStage 192 3 .ln .gelu,            -- stage 2: 3 blocks @ 192
    .convNextDownsample 192 384,               -- 28→14
    .convNextStage 384 27 .ln .gelu,           -- stage 3: 27 blocks @ 384  (T had 9)
    .convNextDownsample 384 768,               -- 14→7
    .convNextStage 768 3 .ln .gelu,            -- stage 4: 3 blocks @ 768
    .globalAvgPool,
    -- head LayerNorm. The paper is `GAP → LN → Linear`
    -- (`self.norm(x.mean([-2,-1]))`, eps 1e-6) and timm's head is
    -- `NormMlpClassifierHead(global_pool → LayerNorm2d(768) → flatten → fc)`; without it
    -- the parameter count is short by exactly 2×768.
    .layerNorm 768,
    .dense 768 1000 .identity                  -- 1000-class head
  ]

/-- ConvNeXt-S, 300-epoch paper schedule. Identical to the ConvNeXt-T recipe
    except stochastic depth: the paper uses dropPath 0.4 for S (vs 0.1 for T).
    LR 2.5e-4 is 4e-3@bs4096 scaled to bs256. -/
def convNeXtSImagenetConfig : TrainConfig where
  -- The official recipe's batch and schedule (2026-10-12, as `convNeXtTinyImagenetConfig`, whose
  -- docstring cites each value to facebookresearch/ConvNeXt `main.py`): lr 4e-3 at the effective
  -- 4096 = 256 × 16 accumulated (exact without BatchNorm), min_lr 1e-6, no clip, Mixup-or-CutMix
  -- drawn per batch, RandAugment's fill at img_mean, timm's ModelEma constant from step 0, f32 eval.
  learningRate   := 0.004
  batchSize      := 256
  gradAccumSteps := 16
  epochs         := 300
  optimizer      := .adam
  weightDecay    := 0.05
  wdExcludeNormBias := true
  minLR          := 0.000001
  mixSwitchProb  := 0.5
  randAugmentFillMean := true
  evalF32        := true
  emaWarmup      := false
  cnxInit        := true    -- ConvNeXt `_init_weights`, as ConvNeXt-T: trunc_normal(0.02) on every
                            -- conv and the head, where the generic path is Xavier
  cosineDecay    := true
  warmupEpochs   := 20
  augment        := true
  useRandAugment       := true
  augBicubic     := true    -- PIL-bicubic geometry, as timm
  cropTorchvision := true   -- torchvision RandomResizedCrop, not TF's sampler (bicubic resize, the recipe's)
  geluExact      := true    -- nn.GELU's exact x·Φ(x), not jax.nn.gelu's tanh default
  randAugmentGeometric := true
  randAugmentMstd := 0.5
  randAugmentInc  := true
  useMixup       := true
  mixupAlpha     := 0.8
  useCutmix      := true
  cutmixAlpha    := 1.0
  randomErasing  := true
  randomErasingProb := 0.25
  erasingPixel   := true    -- timm RandomErasing(mode='pixel'), N(0,1) fill
  labelSmoothing := 0.1
  gradClipNorm   := 0.0     -- `--clip_grad None`
  bf16           := true
  bf16Conv       := true
  f32StemHead    := true    -- classifier head in fp32, as every verified render keeps it
  useEMA         := true
  dropPath       := 0.4      -- ConvNeXt-S paper value (T uses 0.1)
  valEveryEpochs := 5

#eval convNeXtSImagenet.validate!

/-- 80-epoch validation tier, matching how ConvNeXt-T was actually run.
    dropPath is pulled back 0.4 → 0.2: the paper's 0.4 is tuned for the 300-epoch
    schedule, and at 80 epochs that much stochastic depth underfits (the T run at
    80ep used 0.1). This is a deliberate recipe deviation, not a transcription of
    the paper — if you want the paper number, use `default`. -/
def convNeXtSImagenetConfigShort : TrainConfig :=
  { convNeXtSImagenetConfig with epochs := 80, warmupEpochs := 5, dropPath := 0.2 }

def convNeXtSImagenetRecipes : List Recipe := [
  { name := "default", cfg := convNeXtSImagenetConfig,
    out := "generated_convnext_s_imagenet.py",
    desc := "paper-faithful 300-epoch run (dropPath 0.4)" },
  { name := "short",   cfg := convNeXtSImagenetConfigShort,
    out := "generated_convnext_s_imagenet_short.py",
    desc := "80-epoch validation tier (dropPath pulled back to 0.2)" }
]

def main (args : List String) : IO Unit :=
  runRecipeMain "convnext-s-imagenet" convNeXtSImagenet .imagenet
    convNeXtSImagenetRecipes args
