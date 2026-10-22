module

public import LeanMlir.Verified.NetsCore
public import LeanMlir.Verified.Train
public import LeanMlir.Proofs.Codegen.CnnBbnRender

@[expose] public section

/-! # `cifar8wb-bbn-grid` — FC-head width sweep of the 8-conv CIFAR CNN at BATCH-statistics BN, AdamW

The batch-statistics peer of `cifar8-bn-grid`: the same experiment — conv feature extractor held
fixed (8× conv→BN→relu, channels `[16,16,32,32]`, 4 pools), only the dense classifier head swept,
`flatten(128) → dense 128→d → relu → dense d→d → relu → dense d→10`, AdamW 1e-3 with a 3-epoch
warmup + cosine, 25 epochs, batch 128 — on the layer Chapter 4 names and Chapter 5 trains: every
BatchNorm reducing over `[0,2,3]` with running-statistics eval (`cifar8wbBbnG d`, `runningBN`
on), where `cifar8-bn-grid` measures the per-image `[2,3]` layer (train = eval).

Reads the head width `d` from argv, renders the three width-slugged artifacts into
`(cifar8wbBbnG d).mlirDir` (`.lake/build`, build products, never `verified_mlir/`) from the
width-parametric renderers of `CnnBbnRender.lean` — the AdamW train step
(`cifar8BbnTrainStepBText`: the 16 stat outputs the driver EMAs), the batch-BN training forward
(`cifar8BbnFwdText`, the train step's byte prefix, read only under `LEAN_MLIR_EVAL_BATCHSTATS`)
and the frozen-stat eval forward (`cifar8BbnFwdEvalText`, what every epoch scores through) —
then trains on them through the generic `trainAdamSched`, which threads the running statistics
and writes the `.bn` companion exactly as it does for `cifar8wb-bbn-ablation` and ResNet-34.
Hyperparameters of the render are `c8wbBbnPacked`'s (`CnnArtifacts.lean`): ε=1e-5, 1/B, β₁=.9,
β₂=.999, Adam ε=1e-8, wd=1e-4; `cifar8wb-bbn-grid 512` renders `cifar8wb_bbn_adam_train_step`'s
text under its own slug.

Run (GPU): `CUDA_VISIBLE_DEVICES=0 .lake/build/bin/cifar8wb-bbn-grid 128 25 data`
Sweep: `scripts/sweeps/run_cifar8wb_bbn_grid_sweep.sh` (widths 8..4096, one card or several).
Smoke (CPU, no data): `LEAN_MLIR_LOWERER=iree IREE_BACKEND=vmvx LEAN_MLIR_BENCH_SYNTH=1
LEAN_MLIR_MAX_EPOCHS=1 LEAN_MLIR_G2_STEPS=2 .lake/build/bin/cifar8wb-bbn-grid 16 1` — vmvx or
XLA only: IREE 3.11's llvm-cpu miscompiles this step's backward (`tests/TestCifar8BbnGradCheck.lean`).
-/

open Proofs.StableHLO in
/-- Render the AdamW train step, the batch-BN forward and the frozen-stat eval forward for
    `cifar8wb_bbn_{d}` into the net's own `mlirDir`. Every entry is named from the slug by the
    renderers themselves (`@{slug}_adam_train_step`, `@{slug}_fwd`, `@{slug}_fwd_eval`), the
    driver's convention, so nothing is renamed after the fact. -/
def renderGrid (d : Nat) : IO Unit := do
  let net := cifar8wbBbnG d
  let dir := net.mlirDir
  IO.FS.createDirAll dir
  let slug := net.slug
  -- B ic c1 c2 c3 c4 h w d1 nClasses kH kW — `c8wbBbnPacked`'s arguments with `d1 := d`.
  let ts := cifar8BbnTrainStepBText 128 3 16 16 32 32 2 2 d 10 3 3
    "1.0e-05" "0.0078125" "0.9" "0.1" "0.999" "0.001" "1.0e-8" "0.0001"
    slug "adam" 1 .adamw false
  let fwd := cifar8BbnFwdText 128 3 16 16 32 32 2 2 d 10 3 3 "1.0e-05" slug
  let fwdEval := cifar8BbnFwdEvalText 128 3 16 16 32 32 2 2 d 10 3 3 "1.0e-05" slug
  IO.FS.writeFile s!"{dir}/{slug}_adam_train_step.mlir" ts
  IO.FS.writeFile s!"{dir}/{slug}_fwd.mlir" fwd
  IO.FS.writeFile s!"{dir}/{slug}_fwd_eval.mlir" fwdEval
  IO.println s!"rendered {dir}/{slug}_adam_train_step.mlir, _fwd.mlir and _fwd_eval.mlir (batch-statistics BN, fc{d})"

def main (argv : List String) : IO Unit := do
  match argv with
  | ds :: rest =>
    let some d := ds.toNat? | throw (.userError s!"bad FC-head width: {ds}")
    let epochs := (rest.head?.bind (·.toNat?)).getD 25
    let dataDir := rest[1]?.getD "data"
    let cfg : VerifiedConfig := { epochs := epochs, batchSize := 128 }
    renderGrid d
    (cifar8wbBbnG d).toNet.trainAdamSched cfg dataDir 0.001 0.9 0.999 3 "adam"
  | _ => throw (.userError "usage: cifar8wb-bbn-grid <fc-head-width> [epochs] [dataDir]")
