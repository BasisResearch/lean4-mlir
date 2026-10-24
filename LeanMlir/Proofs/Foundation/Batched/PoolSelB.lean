module

public import LeanMlir.Proofs.Nets.Small.SmallParamGrad
public import LeanMlir.Proofs.Foundation.ParamGradNodes
import Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp

@[expose] public section

/-! # The batched 2×2 pool at a fixed selection — the per-example kit, lifted over the batch

`SmallParamGrad` proves the chapter nets' loss gradients through their 2×2 pools by freezing each
pool's routing at a selection `σ` (one cell per window): the pool is then a gather, linear and
differentiable everywhere, and `maxPool_relu_eventuallyEq_sel` says the pooled ReLU IS that gather
along any parameter, near a point where every window is dead or tied only between twins. This file
is the same kit at the batched index `N·(c·h·w)`: a selection per example (`poolSelIdxB`), the
selection and smoothness predicates per example (`PoolSelDomB`, `MaxPool2SmoothUpToB`), the pooled
batch as a gather (`batchMap_maxPoolFlat_eq_gatherB`), the germ along a parameter
(`maxPoolB_relu_eventuallyEq_sel`, row by row from the per-example lemma), and the render's pool
backward as the scatter at the first argmax (`batchMapAux_maxPoolBackFlat_eq_selScatter`), which is
what makes a batched step tie's pool cotangent the loss-gradient chain's at `σ = argmax`.

The pull-backs a batched chain needs that `ParamGradNodes` does not have are here too: through the
gather with the ReLU mask spelled `reluMaskB` (`hasGradAt_gatherReluB`), and through a batched dense
layer with its backward spelled `rowDenseBackFlat` (`hasGradAt_denseB`). -/

namespace Proofs.SmallParamGrad

open Proofs Proofs.StableHLO Proofs.BackLinks
open scoped BigOperators

-- ════════════════════════════════════════════════════════════════
-- § Slices
-- ════════════════════════════════════════════════════════════════

/-- A batched map read at example `r`, entry `j`: the per-example map at that example's slice. -/
theorem batchMap_apply_slice {N a b : Nat} (f : Vec a → Vec b) (u : Vec (N * a)) (r : Fin N)
    (j : Fin b) :
    batchMap N f u (finProdFinEquiv (r, j)) = f (batchSlice N a u r) j := by
  simp only [batchMap, Equiv.symm_apply_apply]
  rfl

/-- ReLU slices: it is coordinatewise. -/
theorem batchSlice_relu (N a : Nat) (Z : Vec (N * a)) (r : Fin N) :
    batchSlice N a (relu (N * a) Z) r = relu a (batchSlice N a Z r) := rfl

/-- Taking example `r`'s slice is continuous (a reindex). -/
theorem continuous_batchSlice (N a : Nat) (r : Fin N) :
    Continuous (fun v : Vec (N * a) => batchSlice N a v r) :=
  continuous_pi fun j => continuous_apply (finProdFinEquiv (r, j))

-- ════════════════════════════════════════════════════════════════
-- § The selection, per example
-- ════════════════════════════════════════════════════════════════

/-- The flat batched index of the cell `σ` selects for pooled entry `k`: example `k`'s row, and
    `poolSelIdx` of that example's selection within it. -/
def poolSelIdxB (N : Nat) {c h w : Nat} (σ : Fin N → Fin c → Fin h → Fin w → Fin 2 × Fin 2)
    (k : Fin (N * (c * h * w))) : Fin (N * (c * (2 * h) * (2 * w))) :=
  finProdFinEquiv ((finProdFinEquiv.symm k).1,
    poolSelIdx (σ (finProdFinEquiv.symm k).1) (finProdFinEquiv.symm k).2)

theorem poolSelIdxB_apply (N : Nat) {c h w : Nat} (σ : Fin N → Fin c → Fin h → Fin w → Fin 2 × Fin 2)
    (r : Fin N) (j : Fin (c * h * w)) :
    poolSelIdxB N σ (finProdFinEquiv (r, j)) = finProdFinEquiv (r, poolSelIdx (σ r) j) := by
  simp only [poolSelIdxB, Equiv.symm_apply_apply]

/-- **Every example's selection names a maximum of every window** of its slice. -/
def PoolSelDomB (N : Nat) {c h w : Nat} (σ : Fin N → Fin c → Fin h → Fin w → Fin 2 × Fin 2)
    (u : Vec (N * (c * (2 * h) * (2 * w)))) : Prop :=
  ∀ r : Fin N, PoolSelDom (σ r) (batchSlice N _ u r)

/-- The per-example first argmax is a selection of the batch. -/
theorem poolSelDomB_argmax (N : Nat) {c h w : Nat} (u : Vec (N * (c * (2 * h) * (2 * w)))) :
    PoolSelDomB N (fun r => maxPool2Argmax
      (Tensor3.unflatten (batchSlice N _ u r) : Tensor3 c (2 * h) (2 * w))) u :=
  fun r => poolSelDom_argmax (batchSlice N _ u r)

/-- **Smooth, dead, or tied only between twins**, in every example's windows; the twin relation
    `T r` is that example's. -/
abbrev MaxPool2SmoothUpToB (N : Nat) {c h w : Nat}
    (T : Fin N → Fin (2 * h) × Fin (2 * w) → Fin (2 * h) × Fin (2 * w) → Prop)
    (u : Vec (N * (c * (2 * h) * (2 * w)))) : Prop :=
  ∀ r : Fin N,
    MaxPool2SmoothUpTo (T r) (Tensor3.unflatten (batchSlice N _ u r) : Tensor3 c (2 * h) (2 * w))

/-- **The pooled batch is the gather at `σ`** wherever `σ` names a maximum of every window. -/
theorem batchMap_maxPoolFlat_eq_gatherB {N c h w : Nat}
    (σ : Fin N → Fin c → Fin h → Fin w → Fin 2 × Fin 2) (u : Vec (N * (c * (2 * h) * (2 * w))))
    (hσ : PoolSelDomB N σ u) :
    batchMap N (maxPoolFlat c h w) u = fun k => u (poolSelIdxB N σ k) := by
  funext k
  obtain ⟨⟨r, j⟩, rfl⟩ := finProdFinEquiv.surjective k
  rw [batchMap_apply_slice, maxPoolFlat_eq_poolGatherFlat (σ r) _ (hσ r), poolGatherFlat_eq_sel,
    poolSelIdxB_apply]
  rfl

-- ════════════════════════════════════════════════════════════════
-- § The germ along a parameter, row by row
-- ════════════════════════════════════════════════════════════════

/-- **Along a parameter, ReLU then the batched 2×2 pool is the gather at a fixed selection.**
    `Z θ` is the batch's pool pre-activation as the parameter moves; at `θ₀` it has no zero entry,
    every example's windows are dead or tied only between that example's `T`-twins, `σ` names a
    maximum of every window of its ReLU, and twins are equal at EVERY `θ`. Each example is
    `maxPool_relu_eventuallyEq_sel` on its own slice; the batch is the conjunction over the
    finitely many examples. -/
theorem maxPoolB_relu_eventuallyEq_sel {P N c h w : Nat}
    (Z : Vec P → Vec (N * (c * (2 * h) * (2 * w))))
    (σ : Fin N → Fin c → Fin h → Fin w → Fin 2 × Fin 2)
    (T : Fin N → Fin (2 * h) × Fin (2 * w) → Fin (2 * h) × Fin (2 * w) → Prop)
    (hT : ∀ θ (r : Fin N) (ci : Fin c) (p q : Fin (2 * h) × Fin (2 * w)), T r p q →
      Z θ (finProdFinEquiv (r, t3Idx ci p.1 p.2)) = Z θ (finProdFinEquiv (r, t3Idx ci q.1 q.2)))
    (θ₀ : Vec P) (hZc : ContinuousAt Z θ₀) (hz : ∀ k, Z θ₀ k ≠ 0)
    (hs : MaxPool2SmoothUpToB N T (Z θ₀)) (hσ : PoolSelDomB N σ (relu _ (Z θ₀))) :
    ∀ᶠ θ in nhds θ₀,
      batchMap N (maxPoolFlat c h w) (relu _ (Z θ)) = fun k => relu _ (Z θ) (poolSelIdxB N σ k) := by
  have hrow : ∀ r : Fin N, ∀ᶠ θ in nhds θ₀,
      maxPoolFlat c h w (relu _ (batchSlice N _ (Z θ) r))
        = fun j => relu _ (batchSlice N _ (Z θ) r) (poolSelIdx (σ r) j) := by
    intro r
    refine maxPool_relu_eventuallyEq_sel (fun θ => batchSlice N _ (Z θ) r) (σ r) (T r) ?_ θ₀
      ((continuous_batchSlice N _ r).continuousAt.comp hZc) (fun k => hz _) (hs r) ?_
    · intro θ ci p q hpq
      exact hT θ r ci p q hpq
    · rw [← batchSlice_relu]; exact hσ r
  filter_upwards [Filter.eventually_all.2 hrow] with θ hθ
  funext k
  obtain ⟨⟨r, j⟩, rfl⟩ := finProdFinEquiv.surjective k
  rw [batchMap_apply_slice, batchSlice_relu, hθ r, poolSelIdxB_apply]
  rfl

-- ════════════════════════════════════════════════════════════════
-- § The render's pool backward is the scatter at the first argmax
-- ════════════════════════════════════════════════════════════════

/-- The batched scatter at example `r` is the per-example scatter of that example's slices. -/
theorem selScatter_poolSelIdxB_apply {N c h w : Nat}
    (σ : Fin N → Fin c → Fin h → Fin w → Fin 2 × Fin 2) (dy : Vec (N * (c * h * w))) (r : Fin N)
    (i : Fin (c * (2 * h) * (2 * w))) :
    selScatter (poolSelIdxB N σ) dy (finProdFinEquiv (r, i))
      = selScatter (poolSelIdx (σ r)) (batchSlice N _ dy r) i := by
  simp only [selScatter]
  rw [← finProdFinEquiv.sum_comp, Fintype.sum_prod_type, Finset.sum_eq_single r]
  · refine Finset.sum_congr rfl fun j _ => ?_
    rw [poolSelIdxB_apply]
    simp only [EmbeddingLike.apply_eq_iff_eq, Prod.mk.injEq, true_and, batchSlice]
  · intro r' _ hr'
    refine Finset.sum_eq_zero fun j _ => ?_
    rw [poolSelIdxB_apply]
    simp only [EmbeddingLike.apply_eq_iff_eq, Prod.mk.injEq]
    exact ite_eq_right_iff.mpr fun h => absurd h.1.symm hr'
  · intro h; exact absurd (Finset.mem_univ r) h

/-- `maxPoolBackFlat` is the flattened first-argmax routing `maxPoolBackDenote`. -/
theorem maxPoolBackFlat_eq_flatten_denote {c h w : Nat} (xv : Vec (c * (2 * h) * (2 * w)))
    (dyv : Vec (c * h * w)) :
    maxPoolBackFlat c h w xv dyv
      = Tensor3.flatten (Proofs.IR.maxPoolBackDenote
          (Tensor3.unflatten xv : Tensor3 c (2 * h) (2 * w)) (Tensor3.unflatten dyv)) := rfl

/-- **The per-example pool backward is the scatter at the first argmax**, at every point. -/
theorem maxPoolBackFlat_eq_selScatter {c h w : Nat} (xv : Vec (c * (2 * h) * (2 * w)))
    (dyv : Vec (c * h * w)) :
    maxPoolBackFlat c h w xv dyv
      = selScatter (poolSelIdx (maxPool2Argmax (Tensor3.unflatten xv : Tensor3 c (2 * h) (2 * w))))
          dyv := by
  rw [maxPoolBackFlat_eq_flatten_denote]
  exact maxpool_flatDenote_eq_selScatter (Tensor3.unflatten xv) dyv

/-- **The render's batched pool backward (`den maxPoolBackB`) is the scatter at the per-example
    first argmax**, at every point, ties included — so a batched step tie's pool cotangent is the
    loss-gradient chain's at that selection. -/
theorem batchMapAux_maxPoolBackFlat_eq_selScatter {N c h w : Nat}
    (x : Vec (N * (c * (2 * h) * (2 * w)))) (dy : Vec (N * (c * h * w))) :
    batchMapAux N (maxPoolBackFlat c h w) x dy
      = selScatter (poolSelIdxB N (fun r => maxPool2Argmax
          (Tensor3.unflatten (batchSlice N _ x r) : Tensor3 c (2 * h) (2 * w)))) dy := by
  funext k
  obtain ⟨⟨r, i⟩, rfl⟩ := finProdFinEquiv.surjective k
  rw [selScatter_poolSelIdxB_apply]
  simp only [batchMapAux, Equiv.symm_apply_apply]
  exact congrFun (maxPoolBackFlat_eq_selScatter _ _) i

-- ════════════════════════════════════════════════════════════════
-- § Two pull-backs in the batched vocabulary
-- ════════════════════════════════════════════════════════════════

/-- Through ReLU then a gather, off the ReLU kinks: the scatter along `σ`, then the mask
    `reluMaskB`. `hasGradAt_gatherRelu` with its cotangent in the batched ties' spelling. -/
theorem hasGradAt_gatherReluB {m n : Nat} (σ : Fin n → Fin m) (z : Vec m) (hz : ∀ k, z k ≠ 0)
    {G : Vec n → Vec 1} {dy : Vec n} (hG : HasGradAt G (fun k => relu m z (σ k)) dy) :
    HasGradAt (fun y => G (fun k => relu m y (σ k))) z (reluMaskB m z (selScatter σ dy)) :=
  (hasGradAt_gatherRelu σ z hz hG).of_eq rfl

/-- Through a batched dense layer: the backward is `rowDenseBackFlat` (`den` of `.denseRowBack`). -/
theorem hasGradAt_denseB {N a c : Nat} (W : Mat a c) (b : Vec c) (u : Vec (N * a))
    {G : Vec (N * c) → Vec 1} {dy : Vec (N * c)} (hG : HasGradAt G (batchMap N (dense W b) u) dy) :
    HasGradAt (fun y => G (batchMap N (dense W b) y)) u (rowDenseBackFlat N a c W dy) :=
  hG.comp_global (batchMap_differentiable _ (dense_differentiable W b))
    (batchMapHasVJP _ (denseHasVJP W b) (dense_differentiable W b))

end Proofs.SmallParamGrad
