module

public import LeanMlir

@[expose] public section

/-! Emit `generateVjp` / `generateApplyAdam` modules for the CPU gates in
    `scripts/probes/vjp_gate.py` (planning/muzero_ttt_demo.md §2).

    Per probe spec, under `outDir`: `<name>_vjp.mlir`, the SGD + momentum train step on the
    MSE block with weight decay off (`<name>_sgd.mlir`), the same at Adam (`<name>_adam_step.mlir`),
    the eval forward (`<name>_eval.mlir`), the Adam apply (`<name>_apply_adam.mlir`), and
    `<name>.json` — the layers, for the gate's JAX reference to rebuild the net.

    The specs: three toy shapes (a conv stack on an image, a conv → flatten → dense head, a
    dense-first MLP for the dense input cotangent), then MuZero's four nets at 3×3 with a 32-plane
    latent, the shapes the trainer will run.

    Usage: `lake exe vjp-probe [outDir=.lake/build/vjp_probe] [B=4]` -/

namespace VjpProbe

/-- MuZero's four nets at board `n`, latent width `C` (planning/muzero_ttt_demo.md §3): the
    representation `h` and dynamics `g` (the action as one extra plane), the prediction `f`
    (policy logits over the cells, then the value) and the reward `r`. -/
def muzero (n C : Nat) : List NetSpec := [
  { name := s!"muz_h{n}", imageH := n, imageW := n, layers := [
      .conv2d 2 64 3 .same .relu, .conv2d 64 64 3 .same .relu, .conv2d 64 C 3 .same .identity ] },
  { name := s!"muz_g{n}", imageH := n, imageW := n, layers := [
      .conv2d (C + 1) 64 3 .same .relu, .conv2d 64 64 3 .same .relu, .conv2d 64 C 3 .same .identity ] },
  { name := s!"muz_f{n}", imageH := n, imageW := n, layers := [
      .conv2d C 4 1 .same .relu, .flatten, .dense (4 * n * n) 64 .relu, .dense 64 (n * n + 1) .identity ] },
  { name := s!"muz_r{n}", imageH := n, imageW := n, layers := [
      .conv2d C 4 1 .same .relu, .flatten, .dense (4 * n * n) 64 .relu, .dense 64 1 .identity ] } ]

def specs : List NetSpec := [
  { name := "convstack", imageH := 3, imageW := 3, layers := [
      .conv2d 3 8 3 .same .relu, .conv2d 8 8 3 .same .relu, .conv2d 8 4 3 .same .identity ] },
  { name := "convhead", imageH := 3, imageW := 3, layers := [
      .conv2d 4 2 1 .same .relu, .flatten, .dense 18 8 .relu, .dense 8 10 .identity ] },
  { name := "mlp", imageH := 1, imageW := 1, layers := [
      .dense 6 5 .relu, .dense 5 3 .identity ] } ] ++ muzero 3 32

def act : Activation → String
  | .relu => "relu" | .identity => "identity" | a => toString (repr a)

/-- The spec as JSON, by hand: the layer kinds the VJP takes. -/
def specJson (s : NetSpec) (B : Nat) (outShape : List Nat) : String :=
  let ls := s.layers.map fun
    | .conv2d ic oc k _ a => s!"\{\"kind\": \"conv2d\", \"ic\": {ic}, \"oc\": {oc}, \"k\": {k}, \"act\": \"{act a}\"}"
    | .dense fi fo a => s!"\{\"kind\": \"dense\", \"fi\": {fi}, \"fo\": {fo}, \"act\": \"{act a}\"}"
    | .flatten => "{\"kind\": \"flatten\"}"
    | _ => "{\"kind\": \"unsupported\"}"
  s!"\{\"name\": \"{s.name}\", \"B\": {B}, \"imageH\": {s.imageH}, \"imageW\": {s.imageW}, " ++
  s!"\"inDim\": {MlirCodegen.inputFlatDim s}, \"outShape\": {outShape}, \"layers\": [{", ".intercalate ls}]}\n"

end VjpProbe

open VjpProbe in
def main (args : List String) : IO Unit := do
  let kv (k : String) := (args.find? (·.startsWith (k ++ "="))).map (fun a => (a.drop (k.length + 1)).toString)
  let outDir := (kv "outDir").getD ".lake/build/vjp_probe"
  let B := ((kv "B").bind String.toNat?).getD 4
  IO.FS.createDirAll outDir
  for s in specs do
    MlirCodegen.checkSupported s
    let (_, _, outShape, _) := MlirCodegen.emitTrainForward s B
    -- The MSE block's target arrives rank-4: `[B, N, 1, 1]` for a rank-2 output.
    let yShape := match outShape with | [b, n] => [b, n, 1, 1] | sh => sh
    let w (suffix body : String) := IO.FS.writeFile s!"{outDir}/{s.name}_{suffix}" body
    w "vjp.mlir" (MlirCodegen.generateVjp s B)
    w "apply_adam.mlir" (MlirCodegen.generateApplyAdam s)
    w "eval.mlir" (MlirCodegen.generateEval s B)
    w "sgd.mlir" (MlirCodegen.generateTrainStep s B (labelSmoothing := 0.0) (weightDecay := 0.0)
      (useAdam := false) (useDdpm := true) (ddpmOutShape := yShape))
    w "adam_step.mlir" (MlirCodegen.generateTrainStep s B (labelSmoothing := 0.0) (weightDecay := 0.0)
      (useAdam := true) (useDdpm := true) (ddpmOutShape := yShape))
    IO.FS.writeFile s!"{outDir}/{s.name}.json" (specJson s B outShape)
    IO.eprintln s!"{s.name}: {s.totalParams} params, in {MlirCodegen.inputFlatDim s}, out {outShape} → {outDir}/{s.name}_*"
