import Jax

/-! Vision Transformer (ViT-B/16, i.e. DeiT-B) on full 1000-class ImageNet —
    bf16 mixed precision, multi-GPU data-parallel (tfds streaming).

    Widths only, relative to `MainVitImagenet.lean` (ViT-Ti): embed 192→768,
    heads 3→12, MLP 768→3072. Depth 12 and patch 16 unchanged; head_dim stays
    64. ~86.6M params — 15× ViT-Ti.

    MEMORY is the one thing that is genuinely different at this size. The
    attention score tensor is `heads × N × N` per sample per block: at 12 heads
    and N = 197 tokens that is 12·197·197·4 B ≈ 1.9 MB/sample/block, 22 MB over
    12 blocks, before the MLP hidden (197·3072·4 B ≈ 2.4 MB/sample/block). There
    is no `jax.checkpoint`/remat in the emitter, so every one of those is
    live through the backward pass. On four 16 GB cards the `default` recipe at
    DeiT-B's batch 1024 (256 per device) does not fit; the `accum` recipe below
    is the one the pair runs — it keeps the effective batch (and therefore the
    LR) fixed at 1024 as 2 micro-batches of 4 × 128. -/

def vitBImagenet : NetSpec where
  name := "ViT-B/16 (ImageNet, bf16)"
  imageH := 224
  imageW := 224
  layers := [
    .patchEmbed 3 768 16 196,             -- (224/16)^2 = 196 patches
    .transformerEncoder 768 12 3072 12,   -- 12 blocks, 12 heads, MLP 3072
    .dense 768 1000 .identity             -- 1000-class head
  ]

/-- DeiT-B: same recipe as Ti/S (DeiT deliberately uses one recipe for all three
    sizes) — since 2026-10-11 DeiT as timm runs it, line for line `vitSImagenetConfig`:
    batch 1024 at lr 1e-3, no gradient clip, the scheduler stepped once an epoch from
    1e-6, Mixup or CutMix drawn per batch, RandAugment's fill at the image mean, the 3
    repeated-aug copies adjacent, the EMA decay constant from step 0, the eval forward in
    f32 (ch 9's marker). ⚠ The clip-off decision (D2) was probed at Ti; DeiT-B is the size
    whose warmup is known to be touchy, and DeiT itself ran it unclipped — a collapse here
    is a finding about the recipe at this width, not a reason to clip. -/
def vitBImagenetConfig : TrainConfig where
  vitInit        := true            -- timm/DeiT trunc_normal(0.02) init, not the emitter's Xavier-uniform
  initPatchEmbedBiasTorch := true   -- and the patch-embed BIAS on PyTorch's Conv2d default, as DeiT
                                    -- leaves it (recipe_prep R4); the landed Ti pair started it at 0
  learningRate   := 0.001           -- DeiT's 5e-4 · 1024/512, as ViT-Ti
  batchSize      := 1024            -- DeiT-B's batch (8 × 128 there); the `accum` recipe below runs it
  epochs         := 300
  optimizer      := .adam
  weightDecay    := 0.05
  wdExcludeNormBias := true
  valEveryEpochs := 5
  cosineDecay    := true
  warmupEpochs   := 5
  minLR          := 0.00001         -- DeiT `--min-lr 1e-5`, as ViT-Ti (`vitTinyImagenetConfig`)
  schedPerEpoch  := true            -- timm's CosineLRScheduler as DeiT steps it: once per epoch, the
  warmupLRInit   := 0.000001        -- warmup from `--warmup-lr 1e-6`, the cosine over all 300 from epoch 0
  augment        := true
  labelSmoothing := 0.1
  gradClipNorm   := 0.0             -- DeiT does NOT clip (`--clip-grad` None), as ViT-Ti since D2
  useMixup       := true
  mixupAlpha     := 0.8
  useCutmix      := true
  cutmixAlpha    := 1.0
  mixSwitchProb  := 0.5             -- timm Mixup(switch_prob 0.5): CutMix with p 0.5 per batch, else Mixup
  useRandAugment := true
  augBicubic     := true    -- PIL-bicubic geometry, as timm
  randAugmentFillMean := true   -- the geometric ops fill with timm's img_mean (124, 116, 104), not 128
  evalF32        := true    -- score through an f32 forward, as the verified path and timm do
  repeatedAugAdjacent := true   -- the 3 RA copies of an image in one optimizer step (timm RASampler)
  cropTorchvision := true   -- torchvision RandomResizedCrop, not TF's sampler (bicubic resize, the recipe's)
  geluExact      := true    -- nn.GELU's exact x·Φ(x), not jax.nn.gelu's tanh default
  randAugmentGeometric := true
  randAugmentM   := 9.0
  randAugmentMstd := 0.5
  randAugmentInc  := true
  randomErasing  := true
  randomErasingProb := 0.25
  erasingPixel   := true    -- timm RandomErasing(mode='pixel'), N(0,1) fill
  dropPath       := 0.1             -- DeiT stochastic depth (same for Ti/S/B)
  useEMA         := true
  emaDecay       := 0.99996
  emaWarmup      := false           -- DeiT's ModelEma: a constant decay from step 0, no ramp-in
  bf16           := true
  lnEps          := 0.000001        -- DeiT `partial(nn.LayerNorm, eps=1e-6)` (the render's `eps0000001`)
  f32StemHead    := true            -- patch embed + head in fp32: the verified render's carve-out
  repeatedAug    := 3               -- DeiT Repeated Augmentation 3× (Hoffer et al. 2020 /
                                    -- timm RASampler).
                                    -- steps_per_epoch is unchanged, so an epoch sees ~1/3 the
                                    -- unique images ×3 views — same aug cost, not 3×.

#eval vitBImagenet.validate!

/-- 80-epoch validation tier — same comparison point the Ti and S runs use. -/
def vitBImagenetConfigShort : TrainConfig :=
  { vitBImagenetConfig with epochs := 80, repeatedAug := 1 }
  -- repeatedAug off at the 80ep tier so it stays comparable with the ViT-Ti
  -- 80-epoch baseline; the 300ep `default` is the paper-faithful one.

/-- The pair's recipe (`vitb-accum-jax-4gpu`): effective batch 1024 (so lr 1e-3
    is DeiT-B's rate) as 2 micro-batches of 512 — 4 × 128, the shape the verified
    `vitbin_emaaccdp2x128x4…` render accumulates — halving peak activation. This
    net has no BN, so accumulation is numerically exact: the same function as the
    one-shot 1024, which does not fit four 16 GB cards. -/
def vitBImagenetConfigAccum : TrainConfig :=
  { vitBImagenetConfig with batchSize := 512, gradAccumSteps := 2 }

def vitBImagenetRecipes : List Recipe := [
  { name := "default", cfg := vitBImagenetConfig,
    out := "generated_vit_b_imagenet.py",
    desc := "full DeiT-B 300-epoch schedule, bs1024 one-shot, AdamW + full DeiT aug + EMA" },
  { name := "short",   cfg := vitBImagenetConfigShort,
    out := "generated_vit_b_imagenet_short.py",
    desc := "80-epoch tier (comparison point with the Ti/S runs)" },
  { name := "accum",   cfg := vitBImagenetConfigAccum,
    out := "generated_vit_b_imagenet_accum.py",
    desc := "300ep, effective bs1024 as 2×512 grad-accum (4 × 128 a micro-batch; fits 16 GB)" }
]

def main (args : List String) : IO Unit :=
  runRecipeMain "vit-b-imagenet" vitBImagenet .imagenet
    vitBImagenetRecipes args
