module

public import LeanMlir.Proofs.Foundation.GradNodesBAt

@[expose] public section

/-! # The cifar8-BN step tie at BATCH statistics — the un-fused, batched gradient nodes

`Cifar8BnTieG.cifar8Bn_train_step_tiedG` ties the per-image renders (`cifar8w_bn_*`, BN over
`[2,3]`, one `x : Tensor3` at a time). The artifacts `planning/cifar-batch-bn-rerender.md` builds
— `cifar8wb_bbn_{sgd,mom,adam,bf16…}_train_step.mlir`, from `Proofs/Codegen/CnnBbnRender.lean` —
are the same 38 parameters with every BatchNorm reducing over `[0,2,3]`: the batch is coupled, so
there is no per-example statement to make. This file states those artifacts' gradient nodes at the
batched vocabulary ResNet-34's tie uses (`Foundation/GradNodesB`, `GradNodesBAt`,
`Batched/BackLinks`): all 38 parameter tensors, each `*GradB` node denoting the certified batched
`Σ_n` gradient at the layer's input and the cotangent the rendered backward chain delivers.

## What is tied, and how the chain is written

The chain is the render's, node for node, in `CnnBbnRender.lean`'s emission order:

```
sm    = softmaxRow(logits)            g    = scaleB(1/B, subB(sm, %onehot))
dyA   = selectPosB(ha, denseRowBack(Wb, g))        dy9 = selectPosB(h9, denseRowBack(Wa, dyA))
dx9   = denseRowBack(W9, dy9)
dac8  = maxPoolBackB(ac8, dx9)        dbn8 = selectPosB(bn8, dac8)      dhc8 = bnBatchBack(g8, hc8, dbn8)
dac7  = convBackBatched(W8, dhc8)     dbn7 = selectPosB(bn7, dac7)      dhc7 = bnBatchBack(g7, hc7, dbn7)
dpool3 = convBackBatched(W7, dhc7)    dac6 = maxPoolBackB(ac6, dpool3)  …
```

Every forward activation is the `den` of the forward node the render emits (`batchOp (convAt
bf16 …)`, `bnBatchF`, `batchOp relu`, `batchOp maxPool`, `batchOp dense`), and every cotangent is
the `den` of the backward node — except the BatchNorm link, which is `bnInB` (the network-layout
twin of `den bnBatchBack`; `BackLinks.bnInB_eq_den_bnBatchBack` is the identity, and
`bnInB_eq_bnBackB` says it is the certified `bnBatchLA` VJP). So the statement is about exactly
the values the artifact computes, with no symbolic cotangent and no free activation.

**What is NOT stated here** (the second half ResNet-34's tie has and this net does not yet):
that this chain IS the certified whole-net backward — `r34IdCotIn_eq_vjp`'s analogue, which needs
the batched-BN cifar8 forward's `HasVJPAt` and the per-link `_eq_vjp` lemmas. Each link's `den`
theorem exists (`den_maxPoolBackB`, `den_convBackBatched_eq_cInB`, `bnInB_eq_bnBackB`, the relu
mask by `rfl`), so that half is composition work, listed in the planning note. Numerically the
gap is covered by `tests/TestCifar8BbnGradCheck.lean` and `tests/cifar8_bbn_jax_ref.py`.

**`N` is a binder, `bf16` is a flag.** The bf16 artifacts' conv forward, input-VJP and weight
gradient are the bf16 kinds; the capstone takes `bf16` and reaches them through `ConvWTiedBAt`
(`Bf16Erasure`: at the identity rounding the bf16 kind denotes its f32 peer). BatchNorm, bias and
dense nodes carry no flag because no render switches them.

**The loss cotangent is the plain mean softmax-CE's**, at a general target `t` (the graph input
`%onehot`): `g = (softmax(logits) − t) / B`, as the render composes it from `softmaxRow`, `subB`
and `scaleB`. There is no label smoothing in the cifar8 recipe.

**The `rows := 1` head.** The render's head backward uses `denseRowBack (rows := 1)` and
`softmaxRow (m := 1)`, whose operands are typed `N * (1 * n)`; `1 * n` is not `n` definitionally,
so the head cotangents are re-indexed with `castB1` / `unB1` (`Nat.one_mul`), exactly the
reshape the emitted text performs between those nodes and their neighbours. -/

open Proofs Proofs.StableHLO Proofs.IR
open Proofs.BackLinks (reassocB bnInB)
open Proofs.GradNodeB (bnPairTiedB_holds convBTiedB_holds convWTiedBAt_holds denseBTiedB_holds
  denseWTiedB_holds)

namespace Proofs.Cifar8BbnTieB

/-- `Vec (N * n)` read at the `N * (1 * n)` index — the head's `rows := 1` layout. -/
def castB1 (N n : Nat) (v : Vec (N * n)) : Vec (N * (1 * n)) :=
  fun i => v (Fin.cast (by rw [Nat.one_mul]) i)

/-- …and back. -/
def unB1 (N n : Nat) (v : Vec (N * (1 * n))) : Vec (N * n) :=
  fun i => v (Fin.cast (by rw [Nat.one_mul]) i)

/-- **Whole batch-statistics cifar8-BN train step at its gradient nodes.** All 38 parameter
    tensors (8 conv `W`+`b`, 8 BN `γ`+`β`, 3 dense `W`+`b`), at the batched forward the render
    emits and the cotangent its backward chain delivers: each `*GradB` node denotes the certified
    batched `Σ_n` gradient (the per-layer Jacobian contracted with the arriving cotangent, summed
    over the batch) — `cifar8Bn_train_step_tiedG`'s statement at batch BN, `N` free. -/
theorem cifar8Bbn_train_step_tiedB (N : Nat) {ic c1 c2 c3 c4 h w d1 nClasses kH kW : Nat}
    (bf16 : Bool) (xN vN epsStr cotN sStr : String) (ε invB : ℝ)
    (W₁ : Kernel4 c1 ic kH kW) (b₁ : Vec c1) (γ₁ β₁ : Vec c1)
    (W₂ : Kernel4 c1 c1 kH kW) (b₂ : Vec c1) (γ₂ β₂ : Vec c1)
    (W₃ : Kernel4 c2 c1 kH kW) (b₃ : Vec c2) (γ₃ β₃ : Vec c2)
    (W₄ : Kernel4 c2 c2 kH kW) (b₄ : Vec c2) (γ₄ β₄ : Vec c2)
    (W₅ : Kernel4 c3 c2 kH kW) (b₅ : Vec c3) (γ₅ β₅ : Vec c3)
    (W₆ : Kernel4 c3 c3 kH kW) (b₆ : Vec c3) (γ₆ β₆ : Vec c3)
    (W₇ : Kernel4 c4 c3 kH kW) (b₇ : Vec c4) (γ₇ β₇ : Vec c4)
    (W₈ : Kernel4 c4 c4 kH kW) (b₈ : Vec c4) (γ₈ β₈ : Vec c4)
    (W₉ : Mat (c4*h*w) d1) (b₉ : Vec d1) (Wa : Mat d1 d1) (ba : Vec d1)
    (Wb : Mat d1 nClasses) (bb : Vec nClasses)
    (x : Vec (N * (ic*(2*(2*(2*(2*h))))*(2*(2*(2*(2*w))))))) (t : Vec (N * nClasses)) :
    -- ═══ forward: the render's nodes, denoted ═══
    -- stage 1 (32²: c1)
    let hc1 : Vec (N * (c1*(2*(2*(2*(2*h))))*(2*(2*(2*(2*w)))))) :=
      den (.batchOp (N := N) (.convAt bf16 (h := 2*(2*(2*(2*h)))) (w := 2*(2*(2*(2*w)))) id xN xN W₁ b₁) (.operand xN x))
    let bn1 := den (.bnBatchF (N := N) (oc := c1) (h := 2*(2*(2*(2*h)))) (w := 2*(2*(2*(2*w)))) vN vN epsStr ε γ₁ β₁ (.operand vN hc1))
    let ac1 := den (.batchOp (N := N) .relu (.operand vN bn1))
    let hc2 : Vec (N * (c1*(2*(2*(2*(2*h))))*(2*(2*(2*(2*w)))))) :=
      den (.batchOp (N := N) (.convAt bf16 (h := 2*(2*(2*(2*h)))) (w := 2*(2*(2*(2*w)))) id xN xN W₂ b₂) (.operand vN ac1))
    let bn2 := den (.bnBatchF (N := N) (oc := c1) (h := 2*(2*(2*(2*h)))) (w := 2*(2*(2*(2*w)))) vN vN epsStr ε γ₂ β₂ (.operand vN hc2))
    let ac2 := den (.batchOp (N := N) .relu (.operand vN bn2))
    let pool1 : Vec (N * (c1*(2*(2*(2*h)))*(2*(2*(2*w))))) :=
      den (.batchOp (N := N) (.maxPool (c := c1) (h := 2*(2*(2*h))) (w := 2*(2*(2*w))) ) (.operand vN ac2))
    -- stage 2 (16²: c2)
    let hc3 : Vec (N * (c2*(2*(2*(2*h)))*(2*(2*(2*w))))) :=
      den (.batchOp (N := N) (.convAt bf16 (h := 2*(2*(2*h))) (w := 2*(2*(2*w))) id xN xN W₃ b₃) (.operand vN pool1))
    let bn3 := den (.bnBatchF (N := N) (oc := c2) (h := 2*(2*(2*h))) (w := 2*(2*(2*w))) vN vN epsStr ε γ₃ β₃ (.operand vN hc3))
    let ac3 := den (.batchOp (N := N) .relu (.operand vN bn3))
    let hc4 : Vec (N * (c2*(2*(2*(2*h)))*(2*(2*(2*w))))) :=
      den (.batchOp (N := N) (.convAt bf16 (h := 2*(2*(2*h))) (w := 2*(2*(2*w))) id xN xN W₄ b₄) (.operand vN ac3))
    let bn4 := den (.bnBatchF (N := N) (oc := c2) (h := 2*(2*(2*h))) (w := 2*(2*(2*w))) vN vN epsStr ε γ₄ β₄ (.operand vN hc4))
    let ac4 := den (.batchOp (N := N) .relu (.operand vN bn4))
    let pool2 : Vec (N * (c2*(2*(2*h))*(2*(2*w)))) :=
      den (.batchOp (N := N) (.maxPool (c := c2) (h := 2*(2*h)) (w := 2*(2*w))) (.operand vN ac4))
    -- stage 3 (8²: c3)
    let hc5 : Vec (N * (c3*(2*(2*h))*(2*(2*w)))) :=
      den (.batchOp (N := N) (.convAt bf16 (h := 2*(2*h)) (w := 2*(2*w)) id xN xN W₅ b₅) (.operand vN pool2))
    let bn5 := den (.bnBatchF (N := N) (oc := c3) (h := 2*(2*h)) (w := 2*(2*w)) vN vN epsStr ε γ₅ β₅ (.operand vN hc5))
    let ac5 := den (.batchOp (N := N) .relu (.operand vN bn5))
    let hc6 : Vec (N * (c3*(2*(2*h))*(2*(2*w)))) :=
      den (.batchOp (N := N) (.convAt bf16 (h := 2*(2*h)) (w := 2*(2*w)) id xN xN W₆ b₆) (.operand vN ac5))
    let bn6 := den (.bnBatchF (N := N) (oc := c3) (h := 2*(2*h)) (w := 2*(2*w)) vN vN epsStr ε γ₆ β₆ (.operand vN hc6))
    let ac6 := den (.batchOp (N := N) .relu (.operand vN bn6))
    let pool3 : Vec (N * (c3*(2*h)*(2*w))) :=
      den (.batchOp (N := N) (.maxPool (c := c3) (h := 2*h) (w := 2*w)) (.operand vN ac6))
    -- stage 4 (4²: c4)
    let hc7 : Vec (N * (c4*(2*h)*(2*w))) :=
      den (.batchOp (N := N) (.convAt bf16 (h := 2*h) (w := 2*w) id xN xN W₇ b₇) (.operand vN pool3))
    let bn7 := den (.bnBatchF (N := N) (oc := c4) (h := 2*h) (w := 2*w) vN vN epsStr ε γ₇ β₇ (.operand vN hc7))
    let ac7 := den (.batchOp (N := N) .relu (.operand vN bn7))
    let hc8 : Vec (N * (c4*(2*h)*(2*w))) :=
      den (.batchOp (N := N) (.convAt bf16 (h := 2*h) (w := 2*w) id xN xN W₈ b₈) (.operand vN ac7))
    let bn8 := den (.bnBatchF (N := N) (oc := c4) (h := 2*h) (w := 2*w) vN vN epsStr ε γ₈ β₈ (.operand vN hc8))
    let ac8 := den (.batchOp (N := N) .relu (.operand vN bn8))
    let pool4 : Vec (N * (c4*h*w)) :=
      den (.batchOp (N := N) (.maxPool (c := c4) (h := h) (w := w)) (.operand vN ac8))
    -- head
    let h9 : Vec (N * d1) := den (.batchOp (N := N) (.dense xN xN W₉ b₉) (.operand vN pool4))
    let a9 := den (.batchOp (N := N) .relu (.operand vN h9))
    let ha : Vec (N * d1) := den (.batchOp (N := N) (.dense xN xN Wa ba) (.operand vN a9))
    let aa := den (.batchOp (N := N) .relu (.operand vN ha))
    let logits : Vec (N * nClasses) := den (.batchOp (N := N) (.dense xN xN Wb bb) (.operand vN aa))
    -- ═══ the mean-loss cotangent: softmax, minus the target, over B ═══
    let sm := den (.batchOp (N := N) (.softmaxRow (m := 1) (n := nClasses)) (.operand vN (castB1 N nClasses logits)))
    let g : Vec (N * nClasses) := den (.scaleB sStr invB (.subB (.operand vN (unB1 N nClasses sm)) (.operand cotN t)))
    -- ═══ backward: dense head → (pool-back → relu-back → BN-back → conv-back) per stage ═══
    let dyA := den (.selectPosB vN (castB1 N d1 ha)
      (.batchOp (N := N) (.denseRowBack (rows := 1) xN Wb) (.operand cotN (castB1 N nClasses g))))
    let dy9 := den (.selectPosB vN (castB1 N d1 h9)
      (.batchOp (N := N) (.denseRowBack (rows := 1) xN Wa) (.operand cotN dyA)))
    let dx9 := den (.batchOp (N := N) (.denseRowBack (rows := 1) xN W₉) (.operand cotN dy9))
    -- stage 4
    let dac8 := den (.maxPoolBackB (N := N) (c := c4) (h := h) (w := w) vN ac8 (.operand cotN (unB1 N (c4*h*w) dx9)))
    let dbn8 := den (.selectPosB vN bn8 (.operand cotN dac8))
    let dhc8 := bnInB N c4 (2*h) (2*w) ε γ₈ hc8 dbn8
    let dac7 := den ((SHlo.convBackBatchedAt bf16 (N := N) (h := 2*h) (w := 2*w) id xN W₈ b₈) (.operand cotN dhc8))
    let dbn7 := den (.selectPosB vN bn7 (.operand cotN dac7))
    let dhc7 := bnInB N c4 (2*h) (2*w) ε γ₇ hc7 dbn7
    let dpool3 := den ((SHlo.convBackBatchedAt bf16 (N := N) (h := 2*h) (w := 2*w) id xN W₇ b₇) (.operand cotN dhc7))
    -- stage 3
    let dac6 := den (.maxPoolBackB (N := N) (c := c3) (h := 2*h) (w := 2*w) vN ac6 (.operand cotN dpool3))
    let dbn6 := den (.selectPosB vN bn6 (.operand cotN dac6))
    let dhc6 := bnInB N c3 (2*(2*h)) (2*(2*w)) ε γ₆ hc6 dbn6
    let dac5 := den ((SHlo.convBackBatchedAt bf16 (N := N) (h := 2*(2*h)) (w := 2*(2*w)) id xN W₆ b₆) (.operand cotN dhc6))
    let dbn5 := den (.selectPosB vN bn5 (.operand cotN dac5))
    let dhc5 := bnInB N c3 (2*(2*h)) (2*(2*w)) ε γ₅ hc5 dbn5
    let dpool2 := den ((SHlo.convBackBatchedAt bf16 (N := N) (h := 2*(2*h)) (w := 2*(2*w)) id xN W₅ b₅) (.operand cotN dhc5))
    -- stage 2
    let dac4 := den (.maxPoolBackB (N := N) (c := c2) (h := 2*(2*h)) (w := 2*(2*w)) vN ac4 (.operand cotN dpool2))
    let dbn4 := den (.selectPosB vN bn4 (.operand cotN dac4))
    let dhc4 := bnInB N c2 (2*(2*(2*h))) (2*(2*(2*w))) ε γ₄ hc4 dbn4
    let dac3 := den ((SHlo.convBackBatchedAt bf16 (N := N) (h := 2*(2*(2*h))) (w := 2*(2*(2*w))) id xN W₄ b₄) (.operand cotN dhc4))
    let dbn3 := den (.selectPosB vN bn3 (.operand cotN dac3))
    let dhc3 := bnInB N c2 (2*(2*(2*h))) (2*(2*(2*w))) ε γ₃ hc3 dbn3
    let dpool1 := den ((SHlo.convBackBatchedAt bf16 (N := N) (h := 2*(2*(2*h))) (w := 2*(2*(2*w))) id xN W₃ b₃) (.operand cotN dhc3))
    -- stage 1
    let dac2 := den (.maxPoolBackB (N := N) (c := c1) (h := 2*(2*(2*h))) (w := 2*(2*(2*w))) vN ac2 (.operand cotN dpool1))
    let dbn2 := den (.selectPosB vN bn2 (.operand cotN dac2))
    let dhc2 := bnInB N c1 (2*(2*(2*(2*h)))) (2*(2*(2*(2*w)))) ε γ₂ hc2 dbn2
    let dac1 := den ((SHlo.convBackBatchedAt bf16 (N := N) (h := 2*(2*(2*(2*h)))) (w := 2*(2*(2*(2*w)))) id xN W₂ b₂) (.operand cotN dhc2))
    let dbn1 := den (.selectPosB vN bn1 (.operand cotN dac1))
    let dhc1 := bnInB N c1 (2*(2*(2*(2*h)))) (2*(2*(2*(2*w)))) ε γ₁ hc1 dbn1
    -- ═══ the 38 gradient nodes, in `cifar8BnSigList` order ═══
    -- layer 1
    GradNodeB.ConvWTiedBAt bf16 N (2*(2*(2*(2*h)))) (2*(2*(2*(2*w)))) xN cotN b₁ x W₁ dhc1
  ∧ GradNodeB.ConvBTiedB N (2*(2*(2*(2*h)))) (2*(2*(2*(2*w)))) cotN W₁ x b₁ dhc1
  ∧ GradNodeB.BnPairTiedB N c1 (2*(2*(2*(2*h)))) (2*(2*(2*(2*w)))) vN epsStr cotN ε γ₁ β₁
      (reassocB N c1 _ _ hc1) (reassocB N c1 _ _ dbn1)
    -- layer 2
  ∧ GradNodeB.ConvWTiedBAt bf16 N (2*(2*(2*(2*h)))) (2*(2*(2*(2*w)))) xN cotN b₂ ac1 W₂ dhc2
  ∧ GradNodeB.ConvBTiedB N (2*(2*(2*(2*h)))) (2*(2*(2*(2*w)))) cotN W₂ ac1 b₂ dhc2
  ∧ GradNodeB.BnPairTiedB N c1 (2*(2*(2*(2*h)))) (2*(2*(2*(2*w)))) vN epsStr cotN ε γ₂ β₂
      (reassocB N c1 _ _ hc2) (reassocB N c1 _ _ dbn2)
    -- layer 3
  ∧ GradNodeB.ConvWTiedBAt bf16 N (2*(2*(2*h))) (2*(2*(2*w))) xN cotN b₃ pool1 W₃ dhc3
  ∧ GradNodeB.ConvBTiedB N (2*(2*(2*h))) (2*(2*(2*w))) cotN W₃ pool1 b₃ dhc3
  ∧ GradNodeB.BnPairTiedB N c2 (2*(2*(2*h))) (2*(2*(2*w))) vN epsStr cotN ε γ₃ β₃
      (reassocB N c2 _ _ hc3) (reassocB N c2 _ _ dbn3)
    -- layer 4
  ∧ GradNodeB.ConvWTiedBAt bf16 N (2*(2*(2*h))) (2*(2*(2*w))) xN cotN b₄ ac3 W₄ dhc4
  ∧ GradNodeB.ConvBTiedB N (2*(2*(2*h))) (2*(2*(2*w))) cotN W₄ ac3 b₄ dhc4
  ∧ GradNodeB.BnPairTiedB N c2 (2*(2*(2*h))) (2*(2*(2*w))) vN epsStr cotN ε γ₄ β₄
      (reassocB N c2 _ _ hc4) (reassocB N c2 _ _ dbn4)
    -- layer 5
  ∧ GradNodeB.ConvWTiedBAt bf16 N (2*(2*h)) (2*(2*w)) xN cotN b₅ pool2 W₅ dhc5
  ∧ GradNodeB.ConvBTiedB N (2*(2*h)) (2*(2*w)) cotN W₅ pool2 b₅ dhc5
  ∧ GradNodeB.BnPairTiedB N c3 (2*(2*h)) (2*(2*w)) vN epsStr cotN ε γ₅ β₅
      (reassocB N c3 _ _ hc5) (reassocB N c3 _ _ dbn5)
    -- layer 6
  ∧ GradNodeB.ConvWTiedBAt bf16 N (2*(2*h)) (2*(2*w)) xN cotN b₆ ac5 W₆ dhc6
  ∧ GradNodeB.ConvBTiedB N (2*(2*h)) (2*(2*w)) cotN W₆ ac5 b₆ dhc6
  ∧ GradNodeB.BnPairTiedB N c3 (2*(2*h)) (2*(2*w)) vN epsStr cotN ε γ₆ β₆
      (reassocB N c3 _ _ hc6) (reassocB N c3 _ _ dbn6)
    -- layer 7
  ∧ GradNodeB.ConvWTiedBAt bf16 N (2*h) (2*w) xN cotN b₇ pool3 W₇ dhc7
  ∧ GradNodeB.ConvBTiedB N (2*h) (2*w) cotN W₇ pool3 b₇ dhc7
  ∧ GradNodeB.BnPairTiedB N c4 (2*h) (2*w) vN epsStr cotN ε γ₇ β₇
      (reassocB N c4 _ _ hc7) (reassocB N c4 _ _ dbn7)
    -- layer 8
  ∧ GradNodeB.ConvWTiedBAt bf16 N (2*h) (2*w) xN cotN b₈ ac7 W₈ dhc8
  ∧ GradNodeB.ConvBTiedB N (2*h) (2*w) cotN W₈ ac7 b₈ dhc8
  ∧ GradNodeB.BnPairTiedB N c4 (2*h) (2*w) vN epsStr cotN ε γ₈ β₈
      (reassocB N c4 _ _ hc8) (reassocB N c4 _ _ dbn8)
    -- dense head: the weight nodes at the real activations, the bias nodes `x`-free
  ∧ GradNodeB.DenseWTiedB N xN cotN pool4 W₉ b₉ (unB1 N d1 dy9)
  ∧ GradNodeB.DenseBTiedB N cotN W₉ (fun _ => 0) b₉ (unB1 N d1 dy9)
  ∧ GradNodeB.DenseWTiedB N xN cotN a9 Wa ba (unB1 N d1 dyA)
  ∧ GradNodeB.DenseBTiedB N cotN Wa (fun _ => 0) ba (unB1 N d1 dyA)
  ∧ GradNodeB.DenseWTiedB N xN cotN aa Wb bb g
  ∧ GradNodeB.DenseBTiedB N cotN Wb (fun _ => 0) bb g := by
  exact ⟨convWTiedBAt_holds bf16, convBTiedB_holds, bnPairTiedB_holds,
    convWTiedBAt_holds bf16, convBTiedB_holds, bnPairTiedB_holds,
    convWTiedBAt_holds bf16, convBTiedB_holds, bnPairTiedB_holds,
    convWTiedBAt_holds bf16, convBTiedB_holds, bnPairTiedB_holds,
    convWTiedBAt_holds bf16, convBTiedB_holds, bnPairTiedB_holds,
    convWTiedBAt_holds bf16, convBTiedB_holds, bnPairTiedB_holds,
    convWTiedBAt_holds bf16, convBTiedB_holds, bnPairTiedB_holds,
    convWTiedBAt_holds bf16, convBTiedB_holds, bnPairTiedB_holds,
    denseWTiedB_holds, denseBTiedB_holds, denseWTiedB_holds, denseBTiedB_holds,
    denseWTiedB_holds, denseBTiedB_holds⟩

end Proofs.Cifar8BbnTieB
