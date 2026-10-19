import LeanMlir.Proofs.Codegen.MlpRender
import LeanMlir.Proofs.Codegen.CnnRender

/-! # The Chapter 1–3 train steps are the prints of BATCHED graphs, byte for byte

`linTrainStepText` / `mlpTrainStepText` / `cnnTrainStepText` write `verified_mlir/
{linear,mlp,cnn}_train_step.mlir` from per-example `SHlo` nodes, whose `den` is one example's.
`LinearFoldB` / `MlpFoldB` / `CnnFoldB` read those same artifacts at the batched index — `batchOp`
lifts, `subB`, `selectPosB`, `maxPoolBackB`, the `convBackP` descriptor and the `*SgdB` nodes —
and that reading is honest only if the batched graph prints the SAME text. This file pins that,
at the committed shapes (B = 128; 784→10; 784→512→512→10; 1→32→32 @ 28², 3×3, 512, 10): three
writers that mirror the committed ones node for node with the batched peers substituted, diffed
against the committed writers' output.

The `den` half — that the batched nodes denote the per-example math summed over `batchSlice` —
is the fold files' theorems; the two halves are needed together.

    lake env lean tests/TestSmallNetsBatchedEmit.lean
-/

open Proofs Proofs.StableHLO

namespace SmallNetsB

/-- Chapter 1: linear train step from batched nodes. -/
def linTrainStepTextB (B m n : Nat) (lrStr : String) (W : Mat m n) (b : Vec n) : String :=
  let xB : Vec (B*m) := fun _ => 0
  let ohB : Vec (B*n) := fun _ => 0
  let logits : SHlo (B*n) := .batchOp (N := B) (.dense "%W0" "%b0" W b) (.operand "%x" xB)
  let cot : SHlo (B*n) :=
    .subB (.batchOp (N := B) (.softmaxDiv (n := n)) (.batchOp (N := B) (.expe (n := n)) logits))
          (.operand "%onehot" ohB)
  let act : StateM EmitS (String × String × String) := do
    let (wBody, wRes) ← pretty B (SHlo.denseWeightSgdB "%x" "%W0" lrStr xB W 0 cot)
    let (bBody, bRes) ← pretty B (SHlo.denseBiasSgdB "%b0" lrStr b 0 cot)
    pure (wBody ++ bBody, wRes, bRes)
  let (body, wRes, bRes) := act.run' (0, [])
  "module @m {\n" ++
  s!"  func.func @linear_train_step(%x: {ty [B,m]}, %W0: {ty [m,n]}, %b0: {ty [n]}, " ++
  s!"%onehot: {ty [B,n]}) -> ({ty [m,n]}, {ty [n]}) " ++ "{\n" ++
  "    // ── linear train step: every op is pretty(verified AST node) ──\n" ++
  body ++
  s!"    return {wRes}, {bRes} : {ty [m,n]}, {ty [n]}\n" ++
  "  }\n}\n"

/-- Chapter 2: MLP train step from batched nodes (same `pretty` call order as `mlpTrainStepText`). -/
def mlpTrainStepTextB (B d₀ d₁ d₂ d₃ : Nat) (lrStr : String)
    (W₀ : Mat d₀ d₁) (b₀ : Vec d₁) (W₁ : Mat d₁ d₂) (b₁ : Vec d₂)
    (W₂ : Mat d₂ d₃) (b₂ : Vec d₃) : String :=
  let z₀ : Vec (B*d₀) := fun _ => 0
  let z₁ : Vec (B*d₁) := fun _ => 0
  let z₂ : Vec (B*d₂) := fun _ => 0
  let z₃ : Vec (B*d₃) := fun _ => 0
  let act : StateM EmitS (String × String × String × String × String × String × String × String) := do
    let (cp0, np0) ← pretty B (.batchOp (N := B) (.dense "%W0" "%b0" W₀ b₀) (.operand "%x" z₀))
    let (ca0, na0) ← pretty B (.batchOp (N := B) (.relu (n := d₁)) (.operand np0 z₁))
    let (cp1, np1) ← pretty B (.batchOp (N := B) (.dense "%W1" "%b1" W₁ b₁) (.operand na0 z₁))
    let (ca1, na1) ← pretty B (.batchOp (N := B) (.relu (n := d₂)) (.operand np1 z₂))
    let (clog, nlog) ← pretty B (.batchOp (N := B) (.dense "%W2" "%b2" W₂ b₂) (.operand na1 z₂))
    let (cdy, ndy) ← pretty B (.subB (.batchOp (N := B) (.softmaxDiv (n := d₃))
        (.batchOp (N := B) (.expe (n := d₃)) (.operand nlog z₃))) (.operand "%onehot" z₃))
    let (cc1, nc1) ← pretty B (.selectPosB np1 z₂ (.batchOp (N := B) (.dotOut "%W2" W₂) (.operand ndy z₃)))
    let (cc0, nc0) ← pretty B (.selectPosB np0 z₁ (.batchOp (N := B) (.dotOut "%W1" W₁) (.operand nc1 z₂)))
    let (cW2, nW2) ← pretty B (SHlo.denseWeightSgdB na1 "%W2" lrStr z₂ W₂ 0 (.operand ndy z₃))
    let (cb2, nb2) ← pretty B (SHlo.denseBiasSgdB "%b2" lrStr b₂ 0 (.operand ndy z₃))
    let (cW1, nW1) ← pretty B (SHlo.denseWeightSgdB na0 "%W1" lrStr z₁ W₁ 0 (.operand nc1 z₂))
    let (cb1, nb1) ← pretty B (SHlo.denseBiasSgdB "%b1" lrStr b₁ 0 (.operand nc1 z₂))
    let (cW0, nW0) ← pretty B (SHlo.denseWeightSgdB "%x" "%W0" lrStr z₀ W₀ 0 (.operand nc0 z₁))
    let (cb0, nb0) ← pretty B (SHlo.denseBiasSgdB "%b0" lrStr b₀ 0 (.operand nc0 z₁))
    pure (cp0 ++ ca0 ++ cp1 ++ ca1 ++ clog ++ cdy ++ cc1 ++ cc0 ++
            cW2 ++ cb2 ++ cW1 ++ cb1 ++ cW0 ++ cb0,
          nW0, nb0, nW1, nb1, nW2, nb2, nlog)
  let (body, nW0, nb0, nW1, nb1, nW2, nb2, nlog) := act.run' (0, [])
  let lossCode := reportCeLossOfLogits B d₃ nlog
  "module @m {\n" ++
  s!"  func.func @mlp_train_step(%x: {ty [B,d₀]}, %W0: {ty [d₀,d₁]}, %b0: {ty [d₁]}, %W1: {ty [d₁,d₂]}, %b1: {ty [d₂]}, %W2: {ty [d₂,d₃]}, %b2: {ty [d₃]}, %lslot: tensor<f32>, %onehot: {ty [B,d₃]}) -> ({ty [d₀,d₁]}, {ty [d₁]}, {ty [d₁,d₂]}, {ty [d₂]}, {ty [d₂,d₃]}, {ty [d₃]}, tensor<f32>) " ++ "{\n" ++
  "    // ── mlp train step: every op is pretty(verified AST node) except the marked report-only %loss ──\n" ++
  body ++
  lossCode ++
  s!"    return {nW0}, {nb0}, {nW1}, {nb1}, {nW2}, {nb2}, %loss : {ty [d₀,d₁]}, {ty [d₁]}, {ty [d₁,d₂]}, {ty [d₂]}, {ty [d₂,d₃]}, {ty [d₃]}, tensor<f32>\n" ++
  "  }\n}\n"

/-- Chapter 3: MNIST-CNN train step from batched nodes (same `pretty` order as `cnnTrainStepText`). -/
def cnnTrainStepTextB (B ic c h w d1 nClasses kH kW : Nat) (lrStr : String)
    (W₁ : Kernel4 c ic kH kW) (b₁ : Vec c) (W₂ : Kernel4 c c kH kW) (b₂ : Vec c)
    (W₃ : Mat (c*h*w) d1) (b₃ : Vec d1) (W₄ : Mat d1 d1) (b₄ : Vec d1)
    (W₅ : Mat d1 nClasses) (b₅ : Vec nClasses) : String :=
  let flat := c*h*w
  let xB : Vec (B*(ic*(2*h)*(2*w))) := fun _ => 0
  let zC : Vec (B*(c*(2*h)*(2*w))) := fun _ => 0
  let zPool : Vec (B*(c*h*w)) := fun _ => 0
  let zD1 : Vec (B*d1) := fun _ => 0
  let zNC : Vec (B*nClasses) := fun _ => 0
  let act : StateM EmitS (String × String × String × String × String × String × String × String × String × String × String × String) := do
    let (cHc1, nHc1) ← pretty B (.batchOp (N := B) (.conv (h := 2*h) (w := 2*w) "%W1" "%b1" W₁ b₁) (.operand "%x" xB))
    let (cAc1, nAc1) ← pretty B (.batchOp (N := B) (.relu (n := c*(2*h)*(2*w))) (.operand nHc1 zC))
    let (cHc2, nHc2) ← pretty B (.batchOp (N := B) (.conv (h := 2*h) (w := 2*w) "%W2" "%b2" W₂ b₂) (.operand nAc1 zC))
    let (cAc2, nAc2) ← pretty B (.batchOp (N := B) (.relu (n := c*(2*h)*(2*w))) (.operand nHc2 zC))
    let (cPool, nPool) ← pretty B (.batchOp (N := B) (.maxPool (c := c) (h := h) (w := w)) (.operand nAc2 zC))
    let (cH3, nH3) ← pretty B (.batchOp (N := B) (.dense "%W3" "%b3" W₃ b₃) (.operand nPool zPool))
    let (cA3, nA3) ← pretty B (.batchOp (N := B) (.relu (n := d1)) (.operand nH3 zD1))
    let (cH4, nH4) ← pretty B (.batchOp (N := B) (.dense "%W4" "%b4" W₄ b₄) (.operand nA3 zD1))
    let (cA4, nA4) ← pretty B (.batchOp (N := B) (.relu (n := d1)) (.operand nH4 zD1))
    let (cLog, nLog) ← pretty B (.batchOp (N := B) (.dense "%W5" "%b5" W₅ b₅) (.operand nA4 zD1))
    let (cDy, nDy) ← pretty B (.subB (.batchOp (N := B) (.softmaxDiv (n := nClasses))
        (.batchOp (N := B) (.expe (n := nClasses)) (.operand nLog zNC))) (.operand "%onehot" zNC))
    let (cDy4, nDy4) ← pretty B (.selectPosB nH4 zD1 (.batchOp (N := B) (.dotOut "%W5" W₅) (.operand nDy zNC)))
    let (cDy3, nDy3) ← pretty B (.selectPosB nH3 zD1 (.batchOp (N := B) (.dotOut "%W4" W₄) (.operand nDy4 zD1)))
    let (cDx3, nDx3) ← pretty B (.batchOp (N := B) (.dotOut "%W3" W₃) (.operand nDy3 zD1))
    let (cDac2, nDac2) ← pretty B (.maxPoolBackB (N := B) (c := c) (h := h) (w := w) nAc2 zC (.operand nDx3 zPool))
    let (cDhc2, nDhc2) ← pretty B (.selectPosB nHc2 zC (.operand nDac2 zC))
    let (cDac1, nDac1) ← pretty B (.batchOp (N := B) (.convBackP (h := 2*h) (w := 2*w) "%W2" W₂ b₂) (.operand nDhc2 zC))
    let (cDhc1, nDhc1) ← pretty B (.selectPosB nHc1 zC (.operand nDac1 zC))
    let (cW5, nW5) ← pretty B (SHlo.denseWeightSgdB nA4 "%W5" lrStr zD1 W₅ 0 (.operand nDy zNC))
    let (cb5, nb5) ← pretty B (SHlo.denseBiasSgdB "%b5" lrStr b₅ 0 (.operand nDy zNC))
    let (cW4, nW4) ← pretty B (SHlo.denseWeightSgdB nA3 "%W4" lrStr zD1 W₄ 0 (.operand nDy4 zD1))
    let (cb4, nb4) ← pretty B (SHlo.denseBiasSgdB "%b4" lrStr b₄ 0 (.operand nDy4 zD1))
    let (cW3, nW3) ← pretty B (SHlo.denseWeightSgdB nPool "%W3" lrStr zPool W₃ 0 (.operand nDy3 zD1))
    let (cb3, nb3) ← pretty B (SHlo.denseBiasSgdB "%b3" lrStr b₃ 0 (.operand nDy3 zD1))
    let (cW2g, nW2g) ← pretty B (SHlo.convWeightSgdB (N := B) (h := 2*h) (w := 2*w) nAc1 "%W2" lrStr b₂ zC W₂ 0 (.operand nDhc2 zC))
    let (cb2g, nb2g) ← pretty B (SHlo.convBiasSgdB (N := B) (h := 2*h) (w := 2*w) "%b2" lrStr W₂ zC b₂ 0 (.operand nDhc2 zC))
    let (cW1g, nW1g) ← pretty B (SHlo.convWeightSgdB (N := B) (h := 2*h) (w := 2*w) "%x" "%W1" lrStr b₁ xB W₁ 0 (.operand nDhc1 zC))
    let (cb1g, nb1g) ← pretty B (SHlo.convBiasSgdB (N := B) (h := 2*h) (w := 2*w) "%b1" lrStr W₁ xB b₁ 0 (.operand nDhc1 zC))
    pure (cHc1 ++ cAc1 ++ cHc2 ++ cAc2 ++ cPool ++ cH3 ++ cA3 ++ cH4 ++ cA4 ++ cLog ++ cDy ++
            cDy4 ++ cDy3 ++ cDx3 ++ cDac2 ++ cDhc2 ++ cDac1 ++ cDhc1 ++
            cW1g ++ cb1g ++ cW2g ++ cb2g ++ cW3 ++ cb3 ++ cW4 ++ cb4 ++ cW5 ++ cb5,
          nW1g, nb1g, nW2g, nb2g, nW3, nb3, nW4, nb4, nW5, nb5, nLog)
  let (body, n1W, n1b, n2W, n2b, n3W, n3b, n4W, n4b, n5W, n5b, nLog) := act.run' (0, [])
  let lossCode := reportCeLossOfLogits B nClasses nLog
  "module @m {\n" ++
  s!"  func.func @cnn_train_step(%x: {ty [B,ic*(2*h)*(2*w)]}, %W1: {ty [c,ic,kH,kW]}, %b1: {ty [c]}, %W2: {ty [c,c,kH,kW]}, %b2: {ty [c]}, %W3: {ty [flat,d1]}, %b3: {ty [d1]}, %W4: {ty [d1,d1]}, %b4: {ty [d1]}, %W5: {ty [d1,nClasses]}, %b5: {ty [nClasses]}, %lslot: tensor<f32>, %onehot: {ty [B,nClasses]}) -> ({ty [c,ic,kH,kW]}, {ty [c]}, {ty [c,c,kH,kW]}, {ty [c]}, {ty [flat,d1]}, {ty [d1]}, {ty [d1,d1]}, {ty [d1]}, {ty [d1,nClasses]}, {ty [nClasses]}, tensor<f32>) " ++ "{\n" ++
  "    // ── cnn train step: every op is pretty(verified AST node) except the marked report-only %loss ──\n" ++
  body ++
  lossCode ++
  s!"    return {n1W}, {n1b}, {n2W}, {n2b}, {n3W}, {n3b}, {n4W}, {n4b}, {n5W}, {n5b}, %loss : {ty [c,ic,kH,kW]}, {ty [c]}, {ty [c,c,kH,kW]}, {ty [c]}, {ty [flat,d1]}, {ty [d1]}, {ty [d1,d1]}, {ty [d1]}, {ty [d1,nClasses]}, {ty [nClasses]}, tensor<f32>\n" ++
  "  }\n}\n"


def firstDiff (a b : String) : Option String :=
  let la := a.splitOn "\n"; let lb := b.splitOn "\n"
  let rec go : List String → List String → Nat → Option String
    | [], [], _ => none
    | x :: xs, y :: ys, i => if x == y then go xs ys (i+1) else some s!"line {i}:\n  committed: {x}\n  batched:   {y}"
    | x :: _, [], i => some s!"line {i}: committed has extra: {x}"
    | [], y :: _, i => some s!"line {i}: batched has extra: {y}"
  go la lb 1

def main : IO Unit := do
  let die (msg : String) : IO Unit := throw (IO.userError msg)
  let cases : List (String × String × String) :=
    [ ("linear_train_step",
       linTrainStepText 128 784 10 "0.00078125" (fun _ _ => 0) (fun _ => 0) (fun _ => 0),
       linTrainStepTextB 128 784 10 "0.00078125" (fun _ _ => 0) (fun _ => 0))
    , ("mlp_train_step",
       mlpTrainStepText 128 784 512 512 10 "0.00078125"
         (fun _ _ => 0) (fun _ => 0) (fun _ _ => 0) (fun _ => 0) (fun _ _ => 0) (fun _ => 0) (fun _ => 0),
       mlpTrainStepTextB 128 784 512 512 10 "0.00078125"
         (fun _ _ => 0) (fun _ => 0) (fun _ _ => 0) (fun _ => 0) (fun _ _ => 0) (fun _ => 0))
    , ("cnn_train_step",
       cnnTrainStepText 128 1 32 14 14 512 10 3 3 "0.00078125"
         (fun _ _ _ _ => 0) (fun _ => 0) (fun _ _ _ _ => 0) (fun _ => 0)
         (fun _ _ => 0) (fun _ => 0) (fun _ _ => 0) (fun _ => 0) (fun _ _ => 0) (fun _ => 0) (fun _ => 0),
       cnnTrainStepTextB 128 1 32 14 14 512 10 3 3 "0.00078125"
         (fun _ _ _ _ => 0) (fun _ => 0) (fun _ _ _ _ => 0) (fun _ => 0)
         (fun _ _ => 0) (fun _ => 0) (fun _ _ => 0) (fun _ => 0) (fun _ _ => 0) (fun _ => 0)) ]
  for (nm, committed, batched) in cases do
    match firstDiff committed batched with
    | some d => die s!"{nm}: the batched graph does not print the committed writer's text\n{d}"
    | none => IO.println s!"  ✓ {nm}: batched graph prints the committed text ({(committed.splitOn "\n").length} lines)"

#eval main

end SmallNetsB
