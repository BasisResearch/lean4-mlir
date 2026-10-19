module

public import LeanMlir.Types

@[expose] public section

/-! # VJP-oracle nets — one definition, trained by both sides

The oracle trains each net one step through the Lean reference codegen (`NetSpec.train`, which
lowers the `NetSpec` to MLIR at run time through `MlirCodegen`; entry points in
tests/vjp_oracle/phase3/) and through the JAX reference (Lean → JAX → XLA,
jax/tests/vjp_oracle/phase2/) from the same init, and diffs the step-2 loss. Both backwards are
hand-written: the oracle checks them against each other, not against the verified_mlir/
artifacts or a theorem. The `VerifiedOracle` section at the end is the other oracle: the same JAX
reference against the committed `verified_mlir/{linear,mlp,cnn}_train_step.mlir` the Lean-proved
trainers run (tests/vjp_oracle/run_verified.sh). The declarations the docstrings below name are the proof-side
statements of the same math. The diff is evidence only if both sides train the same `NetSpec`
under the same config, so both import them from here rather than each carrying a copy.

## References

- Howard et al. 2019, *Searching for MobileNetV3* (h-swish / h-sigmoid). <https://arxiv.org/abs/1905.02244> -/

namespace VjpOracle

/-- The shared one-step config: Adam at lr 1e-3, batch 4, one epoch, no schedule, no weight
    decay, no augmentation — the optimizer the diff runs through, and nothing else. -/
def cfg : TrainConfig where
  learningRate := 0.001
  batchSize    := 4
  epochs       := 1
  optimizer    := .adam
  weightDecay  := 0.0
  cosineDecay  := false
  warmupEpochs := 0
  augment      := false

/-- **`dense_only`** — the minimal net: one dense layer 784→10, no activation, so the only
    backward that runs is the dense one (math side: `Proofs.denseHasVJP`). Step 2 is the first step whose loss depends on
    the backward pass; a small cross-backend Δ there means the hand-derived VJP matches JAX's
    `value_and_grad` at f32. -/
def denseOnly : NetSpec where
  name   := "vjp-oracle-dense"
  imageH := 28
  imageW := 28
  layers := [
    .dense 784 10 .identity
  ]

/-- **`dense_relu`** — dense and ReLU backwards composed (math side: `Proofs.reluHasVJP`,
    `Proofs.vjpComp`). -/
def denseRelu : NetSpec where
  name   := "vjp-oracle-dense-relu"
  imageH := 28
  imageW := 28
  layers := [
    .dense 784 64 .relu,
    .dense 64 10 .identity
  ]

/-- **`conv`** — the conv backward and the flatten reshape (math side: `Proofs.conv2dHasVJP3`). -/
def convOnly : NetSpec where
  name   := "vjp-oracle-conv"
  imageH := 28
  imageW := 28
  layers := [
    .conv2d 1 4 3 .same .identity,   -- 4 × 28 × 28 = 3136
    .flatten,
    .dense 3136 10 .identity
  ]

/-- **`convbn`** — conv + BN + ReLU backward (math side: `Proofs.convBnHasVJP`). -/
def convBnOnly : NetSpec where
  name   := "vjp-oracle-convbn"
  imageH := 28
  imageW := 28
  layers := [
    .convBn 1 4 3 1 .same,          -- conv + BN + ReLU, 4 × 28 × 28
    .flatten,
    .dense 3136 10 .identity
  ]

/-- **`conv_pool`** — the 2×2 max-pool backward after a conv (math side: `Proofs.maxPool2HasVJP3`). -/
def convPool : NetSpec where
  name   := "vjp-oracle-conv-pool"
  imageH := 28
  imageW := 28
  layers := [
    .conv2d 1 4 3 .same .identity,   -- 4 × 28 × 28
    .maxPool 2 2,                     -- 4 × 14 × 14 = 784
    .flatten,
    .dense 784 10 .identity
  ]

/-- **`residual`** — the additive fan-in backward (math side: `Proofs.biPathHasVJP`) via
    a single residualBlock with no projection. Stem is `.convBn` so both
    phases reshape NCHW correctly. -/
def residualNet : NetSpec where
  name   := "vjp-oracle-residual"
  imageH := 28
  imageW := 28
  layers := [
    .convBn 1 4 3 1 .same,        -- 4×28×28
    .residualBlock 4 4 1 1,        -- 4×28×28, no projection (ic==oc, stride==1)
    .flatten,
    .dense 3136 10 .identity
  ]

/-- **`depthwise`** — the depthwise-conv backward via one
    `.invertedResidual` block (expand + depthwise + project). The depthwise
    middle step has weight shape (mid, 1, 3, 3) with feature_group_count
    = mid — unusual layout that's easy to get wrong between phases. -/
def depthwiseNet : NetSpec where
  name   := "vjp-oracle-depthwise"
  imageH := 28
  imageW := 28
  layers := [
    .convBn 1 4 3 1 .same,              -- stem: 4×28×28
    .invertedResidual 4 4 2 1 1,         -- expand=2, stride=1, 1 block, 4×28×28
    .flatten,
    .dense 3136 10 .identity
  ]

/-- **`attention`** — smallest ViT-shaped net, exercising the transformer-block backward
    (math side: `Proofs.transformerBlockHasVJPMat`, which bundles LN, MHA with
    scaled-dot-product attention, residuals, and the MLP sublayer).
    MNIST 28×28 → 7×7 patches → 1 block → classifier. -/
def attentionNet : NetSpec where
  name   := "vjp-oracle-attention"
  imageH := 28
  imageW := 28
  layers := [
    .patchEmbed 1 16 7 16,                -- 16 patches of 7×7, dim=16
    .transformerEncoder 16 2 32 1,         -- 1 block, 2 heads, mlpDim=32
    .dense 16 10 .identity                  -- classifier off CLS token
  ]

/-- **`mbConv`** — the SE gate's elementwise-product backward (math side:
    `Proofs.elemwiseProductHasVJP`) inside the MBConv composition (expand + depthwise + SE +
    project with Swish). -/
def mbConvNet : NetSpec where
  name   := "vjp-oracle-mbconv"
  imageH := 28
  imageW := 28
  layers := [
    .convBn 1 4 3 1 .same,                -- stem: 4×28×28
    .mbConv 4 4 2 3 1 1 true,              -- expand=2, kSize=3, stride=1, n=1, SE on
    .flatten,
    .dense 3136 10 .identity
  ]

/-- **`globalAvgPool`** — the spatial-mean backward in isolation. -/
def gapNet : NetSpec where
  name   := "vjp-oracle-global-avg-pool"
  imageH := 28
  imageW := 28
  layers := [
    .convBn 1 4 3 1 .same,
    .globalAvgPool,
    .dense 4 10 .identity
  ]

/-- **`bottleneckBlock`** — ResNet-50 building block.
    1×1 reduce + 3×3 + 1×1 expand + skip. The same additive fan-in
    as residual but through a 3-conv composition. -/
def bneckNet : NetSpec where
  name   := "vjp-oracle-bottleneck"
  imageH := 28
  imageW := 28
  layers := [
    .convBn 1 8 3 1 .same,           -- stem: 8×28×28 (oc must be divisible by 4)
    .bottleneckBlock 8 8 1 1,         -- mid = 2, 1 block, no proj
    .flatten,
    .dense 6272 10 .identity
  ]

/-- **`mbConvV3`** — MobileNet V3 block with h-swish + h-sigmoid SE.
    Tests piecewise-linear activations (h-swish / h-sigmoid) on top of
    the mbConv composition. -/
def mbConvV3Net : NetSpec where
  name   := "vjp-oracle-mbconv-v3"
  imageH := 28
  imageW := 28
  layers := [
    .convBn 1 4 3 1 .same,                -- stem
    .mbConvV3 4 4 8 3 1 true .hSwish,         -- ic=4, oc=4, expandCh=8, k=3, stride=1, SE on, h-swish on
    .flatten,
    .dense 3136 10 .identity
  ]

/-- **`fusedMbConv`** — EfficientNet V2 block. k×k regular conv
    replaces (1×1 expand + k×k depthwise) of MBConv. Same op kinds,
    different composition — the path where the fused conv is an
    expanding convBn rather than a factored expand+DW pair. -/
def fusedMbNet : NetSpec where
  name   := "vjp-oracle-fused-mbconv"
  imageH := 28
  imageW := 28
  layers := [
    .convBn 1 4 3 1 .same,                  -- stem
    .fusedMbConv 4 4 2 3 1 1 false,          -- ic=4, oc=4, expand=2, k=3, s=1, n=1, SE off
    .flatten,
    .dense 3136 10 .identity
  ]

/-- **`uib`** — MobileNet V4 Universal Inverted Bottleneck.
    Optional pre-DW + 1×1 expand + optional post-DW + 1×1 project.
    Here we use preDW=3, postDW=5 (ExtraDW config) so both conditional
    paths fire. -/
def uibNet : NetSpec where
  name   := "vjp-oracle-uib"
  imageH := 28
  imageW := 28
  layers := [
    .convBn 1 4 3 1 .same,          -- stem
    .uib 4 4 2 1 3 5,                -- ic=4, oc=4, expand=2, stride=1, preDW=3, postDW=5
    .flatten,
    .dense 3136 10 .identity
  ]

end VjpOracle

/-! ## The verified-path oracle — the proven text against JAX autodiff

`tests/vjp_oracle/run_verified.sh` trains ONE step of the committed, theorem-tied artifacts
`verified_mlir/{linear,mlp,cnn}_train_step.mlir` through the book's own trainers
([`apps/mnist/MainMnist*Verified.lean`](https://github.com/brettkoonce/lean4-mlir/tree/main/apps/mnist), with `LEAN_MLIR_INIT_DUMP` / `LEAN_MLIR_MAX_STEPS=1` /
`LEAN_MLIR_DUMP_PARAMS`) and one step of these JAX nets from that dumped init on the same batch,
then diffs the two parameter updates tensor for tensor (`tests/vjp_oracle/diff_params.py`). The
specs below are the three verified nets spelled as `NetSpec`s — the renders bake their SGD
(`0.00078125 = 0.1/128`, the mean-loss rate 0.1 at batch 128), so the JAX side runs plain SGD at
0.1 on the mean loss. Unlike the `VjpOracle` cases above, the Lean side here is `pretty` of the
graphs `LinearFoldB` / `MlpFoldB` / `CnnFoldB` certify, so a pass says the certified text and
autodiff compute the same step at float32. -/
namespace VerifiedOracle

/-- SGD at the renders' effective rate, batch 128 (the artifacts' baked batch), no schedule, no
    decay, no augmentation, one epoch (the runner caps it at one step). -/
def cfg : TrainConfig where
  learningRate := 0.1
  batchSize    := 128
  epochs       := 1
  optimizer    := .sgd
  weightDecay  := 0.0
  cosineDecay  := false
  warmupEpochs := 0
  augment      := false

/-- Chapter 1: `linearVerified` (784 → 10), `verified_mlir/linear_train_step.mlir`. -/
def linearNet : NetSpec where
  name   := "verified-oracle-linear"
  imageH := 28
  imageW := 28
  layers := [ .dense 784 10 .identity ]

/-- Chapter 2: `mlpVerified` (784 → 512 → 512 → 10), `verified_mlir/mlp_train_step.mlir`. -/
def mlpNet : NetSpec where
  name   := "verified-oracle-mlp"
  imageH := 28
  imageW := 28
  layers := [
    .dense 784 512 .relu,
    .dense 512 512 .relu,
    .dense 512  10 .identity
  ]

/-- Chapter 3: `cnnVerified` (conv 1→32, conv 32→32, both 3×3 SAME + ReLU, max-pool 2, flatten
    6272, dense 512 → 512 → 10), `verified_mlir/cnn_train_step.mlir`. -/
def cnnNet : NetSpec where
  name   := "verified-oracle-cnn"
  imageH := 28
  imageW := 28
  layers := [
    .conv2d 1 32 3 .same .relu,
    .conv2d 32 32 3 .same .relu,
    .maxPool 2 2,
    .flatten,
    .dense 6272 512 .relu,
    .dense 512 512 .relu,
    .dense 512 10 .identity
  ]

end VerifiedOracle
