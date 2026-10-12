import Jax

/-! ConvNeXt-Base on full 1000-class ImageNet — (Lean → JAX) trainer.

    Relative to `MainConvNeXtSImagenet.lean`: same (3,3,27,3) compute ratio,
    channels widened 96→128 throughout (128,256,512,1024). ~88.6M params.
    Relative to ConvNeXt-T it is both deeper (18→36 blocks) and wider.

    This is the heaviest net in the sweep by a wide margin — deeper AND wider;
    the stage-1 inverted bottleneck alone holds 4·128 channels at 56×56 per
    sample per block. The official recipe's 4096 is 16 accumulated micro-batches
    of 256 here (`gradAccumSteps`), as for T and S. -/

def convNeXtBImagenet : NetSpec where
  name := "ConvNeXt-B (ImageNet, bf16)"
  imageH := 224
  imageW := 224
  layers := [
    .convNextStem 3 128 4,                     -- patchify stem: 4×4 s4 conv → channel-LN
    .convNextStage 128 3 .ln .gelu,            -- stage 1: 3 blocks @ 128
    .convNextDownsample 128 256,               -- 56→28
    .convNextStage 256 3 .ln .gelu,            -- stage 2: 3 blocks @ 256
    .convNextDownsample 256 512,               -- 28→14
    .convNextStage 512 27 .ln .gelu,           -- stage 3: 27 blocks @ 512
    .convNextDownsample 512 1024,              -- 14→7
    .convNextStage 1024 3 .ln .gelu,           -- stage 4: 3 blocks @ 1024
    .globalAvgPool,
    -- head LayerNorm. The paper is `GAP → LN → Linear`
    -- (`self.norm(x.mean([-2,-1]))`, eps 1e-6) and timm's head is
    -- `NormMlpClassifierHead(global_pool → LayerNorm2d(1024) → flatten → fc)`; without it
    -- the parameter count is short by exactly 2×1024.
    .layerNorm 1024,
    .dense 1024 1000 .identity                 -- 1000-class head
  ]

/-- ConvNeXt-B, 300-epoch paper schedule. Same as S except stochastic depth
    0.4 → 0.5 (the paper's B value). LR 2.5e-4 = 4e-3@bs4096 scaled to bs256. -/
def convNeXtBImagenetConfig : TrainConfig where
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
  dropPath       := 0.5      -- ConvNeXt-B paper value
  valEveryEpochs := 5

#eval convNeXtBImagenet.validate!

/-- 80-epoch validation tier. dropPath pulled back 0.5 → 0.3 for the same reason
    as ConvNeXt-S's short recipe: the paper value is tuned for 300 epochs. -/
def convNeXtBImagenetConfigShort : TrainConfig :=
  { convNeXtBImagenetConfig with epochs := 80, warmupEpochs := 5, dropPath := 0.3 }

def convNeXtBImagenetRecipes : List Recipe := [
  { name := "default", cfg := convNeXtBImagenetConfig,
    out := "generated_convnext_b_imagenet.py",
    desc := "paper-faithful 300-epoch run (dropPath 0.5)" },
  { name := "short",   cfg := convNeXtBImagenetConfigShort,
    out := "generated_convnext_b_imagenet_short.py",
    desc := "80-epoch validation tier (dropPath pulled back to 0.3)" }
]

def main (args : List String) : IO Unit :=
  runRecipeMain "convnext-b-imagenet" convNeXtBImagenet .imagenet
    convNeXtBImagenetRecipes args
