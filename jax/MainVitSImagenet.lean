import Jax

/-! Vision Transformer (ViT-S/16, i.e. DeiT-S) on full 1000-class ImageNet — bf16
    mixed precision, multi-GPU data-parallel (tfds streaming).

    Same shape as `MainVitImagenet.lean` (ViT-Ti) with the DeiT-S widths:
    embed 192→384, heads 3→6, MLP 768→1536. Depth stays 12 and patch stays 16,
    so head_dim is 64 in both (384/6 = 192/3 · 1 = 64) — the `mhsa` helper
    derives head_dim = D // n_heads, so nothing in codegen changes.
    ~22.0M params vs ViT-Ti's 5.7M.

    Recipe is DeiT's: the paper uses ONE recipe for Ti/S/B and only changes the
    width, so this is deliberately a byte-for-byte copy of the ViT-Ti config —
    including lr 1e-3 at batch 1024 (5e-4 · B/512), no gradient clip, timm's
    per-epoch cosine and stochastic depth 0.1 (DeiT Table 9 lists 0.1 for every
    model size). That is the point of this file: if ViT-S needs anything ViT-Ti
    didn't, it should show up as a training failure, not as a config difference. -/

def vitSImagenet : NetSpec where
  name := "ViT-S/16 (ImageNet, bf16)"
  imageH := 224
  imageW := 224
  layers := [
    .patchEmbed 3 384 16 196,             -- (224/16)^2 = 196 patches
    .transformerEncoder 384 6 1536 12,    -- 12 blocks, 6 heads, MLP 1536
    .dense 384 1000 .identity             -- 1000-class head
  ]

/-- DeiT-S: identical to `vitTinyImagenetConfig` (DeiT applies one recipe across
    Ti/S/B) — since 2026-10-11 DeiT as timm runs it: batch 1024 at lr 1e-3, no gradient
    clip, the scheduler stepped once an epoch from 1e-6, Mixup or CutMix drawn per batch,
    RandAugment's fill at the image mean, the 3 repeated-aug copies adjacent, the EMA decay
    constant from step 0, the eval forward in f32 (ch 9's marker; the ViT-Ti config carries
    the note on each line). The clip-off decision (D2) was probed at Ti, not here. -/
def vitSImagenetConfig : TrainConfig where
  vitInit        := true            -- timm/DeiT trunc_normal(0.02) init, not the emitter's Xavier-uniform
  learningRate   := 0.001           -- DeiT's 5e-4 · 1024/512, as ViT-Ti
  batchSize      := 1024            -- DeiT-S's batch (8 × 128 there; 4 × 256 one-shot on the verified path, which
                                    -- fits: runs/2026-10-11-vits-default-emabf16-4gpu/; this trainer runs it as the
                                    -- `accum` recipe below, 512 × 2 — exact under LayerNorm)
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
                                    -- timm RASampler). Closes the last DeiT faithfulness gap;
                                    -- steps_per_epoch is unchanged, so an epoch sees ~1/3 the
                                    -- unique images ×3 views — same aug cost, not 3×.

#eval vitSImagenet.validate!

/-- 80-epoch validation tier — the schedule ViT-Ti was actually run at (`jax/runs/vit_tiny_imagenet_bf16_80ep/`),
    so it is the apples-to-apples comparison point before committing to 300ep. -/
def vitSImagenetConfigShort : TrainConfig :=
  { vitSImagenetConfig with epochs := 80, repeatedAug := 1 }
  -- repeatedAug off at the 80ep tier so it stays comparable with the ViT-Ti
  -- 80-epoch baseline; the 300ep `default` is the paper-faithful one.

/-- The pair's recipe on the JAX side (`vits-accum-jax-4gpu`): the same effective
    batch 1024, as 2 micro-batches of 512 (4 × 128) so peak activation is halved.
    Numerically the grads are averaged over the same 1024 images (BN-free net, so
    accumulation is exact here); LR still targets the effective batch. The one-shot
    `default` dies RESOURCE_EXHAUSTED on four 16 GB cards at the default AND the
    raised arena (runs/2026-10-11-vits-jax-smoke/), where the verified render of the
    same step fits the default — the two compilers lay the backward out differently,
    and under LayerNorm the two batchings are one function. -/
def vitSImagenetConfigAccum : TrainConfig :=
  { vitSImagenetConfig with batchSize := 512, gradAccumSteps := 2 }

def vitSImagenetRecipes : List Recipe := [
  { name := "default", cfg := vitSImagenetConfig,
    out := "generated_vit_s_imagenet.py",
    desc := "full DeiT-S 300-epoch schedule, bs1024 one-shot (OOMs on 16 GB cards; run `accum`), AdamW + full DeiT aug + EMA" },
  { name := "short",   cfg := vitSImagenetConfigShort,
    out := "generated_vit_s_imagenet_short.py",
    desc := "80-epoch tier (apples-to-apples with the ViT-Ti 65.6% run)" },
  { name := "accum",   cfg := vitSImagenetConfigAccum,
    out := "generated_vit_s_imagenet_accum.py",
    desc := "300ep, effective bs1024 as 2×512 grad-accum (4 × 128 a micro-batch; the pair's JAX recipe)" }
]

def main (args : List String) : IO Unit :=
  runRecipeMain "vit-s-imagenet" vitSImagenet .imagenet
    vitSImagenetRecipes args
