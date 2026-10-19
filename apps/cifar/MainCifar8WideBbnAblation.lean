module

public import LeanMlir.Verified.NetsCore
public import LeanMlir.Verified.Train

@[expose] public section

/-! # `cifar8wb-bbn-ablation` — the wide-head cifar8 BN net at BATCH statistics, six arms

The batch-statistics peer of `cifar8w-bn-ablation` / `cifar8wb-bn-ablation`: the
`cifar8wbBbnVerified` net (8× conv→BN→relu, 128→512→512→10 head) with every BatchNorm reducing
over `[0,2,3]` — the layer Chapter 4 names and Chapter 5 trains — instead of the per-image
`[2,3]` those two binaries measure. Same controlled pipeline (shuffle + hflip, **constant**
learning rate: `warmupEpochs = 0`, `expDecayRate = 1.0`), same three optimizers at the same
rates (SGD lr 0.1, Nesterov μ.9 lr 0.02, AdamW lr 1e-3), same bf16 twins, 40 epochs, bs 128.

What is new is everything a batch-statistics layer needs that a per-image one does not, all of
it the generic `trainAdamSched` already does for ResNet-34 once `bnChannels` is non-empty:
each step hands back the 8 BN layers' batch μ/var, the driver EMAs them at `bnMomentum`
(`VerifiedConfig`, 0.99: the ~100-step memory Chapter 5 uses), writes them beside the
checkpoint as `<ckpt>.bn`, and **evaluates through `@cifar8wb_bbn_fwd_eval`** with the frozen
running statistics — so train ≠ eval here, and the val curve's noise is the running-stat
momentum's. Renders: `LeanMlir/Proofs/Codegen/CnnBbnRender.lean`, written by `CnnArtifacts.lean`.

**One arm per invocation** (`cifar8wb-bbn-ablation data <arm>`), so the seed matrix the chapter
needs (3 optimizers × 5 seeds, f32 and bf16) can be scheduled as independent jobs rather than
one eight-hour serial run; `all` runs the six in sequence. Arms:
`sgd mom adam bf16sgd bf16mom bf16adam all`. Seeds via `LEAN_MLIR_SEED`.

Run (GPU): `.lake/build/bin/cifar8wb-bbn-ablation data adam`
Smoke (CPU, no data): `LEAN_MLIR_LOWERER=iree IREE_BACKEND=llvm-cpu LEAN_MLIR_BENCH_SYNTH=1
LEAN_MLIR_MAX_EPOCHS=1 LEAN_MLIR_G2_STEPS=2 .lake/build/bin/cifar8wb-bbn-ablation data sgd`
— the plumbing only (compile, stat passthrough, EMA, eval through `_fwd_eval`, the `.bn`
companion). ⚠ Not a training check: IREE 3.11's llvm-cpu MISCOMPILES this step's backward
(`tests/TestCifar8BbnGradCheck.lean` header); numbers come from XLA on a GPU, or `IREE_BACKEND=vmvx`.

**One file, one binary, either lowerer.** The proven graph goes to whichever trusted lowerer
`$LEAN_MLIR_LOWERER` selects — XLA/PJRT by default, IREE with `=iree` — resolved by dlopen at
run time (`ffi/lowerer.h`).
-/

def cfg : VerifiedConfig where
  epochs    := 40
  batchSize := 128

/-- The six arms: (variant, base LR, banner). The rates are `cifar8w-bn-ablation`'s exactly. -/
def arms : List (String × Float × String) :=
  [("sgd",      0.1,   "f32 — SGD (lr 0.1)"),
   ("mom",      0.02,  "f32 — Nesterov momentum (μ.9, lr 0.02)"),
   ("adam",     0.001, "f32 — AdamW (lr 1e-3)"),
   ("bf16sgd",  0.1,   "bf16 — SGD (lr 0.1)"),
   ("bf16mom",  0.02,  "bf16 — Nesterov momentum (μ.9, lr 0.02)"),
   ("bf16adam", 0.001, "bf16 — AdamW (lr 1e-3)")]

def runArm (d : String) (arm : String × Float × String) : IO Unit := do
  let (variant, lr, banner) := arm
  IO.println s!"════════ cifar8wb-bbn (batch-statistics BN) {banner} ════════"
  cifar8wbBbnVerified.toNet.trainAdamSched cfg d lr 0.9 0.999 0 variant 1.0 1.0

def main (argv : List String) : IO Unit := do
  let d := argv.head?.getD "data"
  let which := (argv.drop 1).head?.getD "all"
  if which == "all" then
    for arm in arms do runArm d arm
  else
    match arms.find? (fun (v, _, _) => v == which) with
    | some arm => runArm d arm
    | none =>
      let names := String.intercalate " " (arms.map (·.1))
      throw (IO.userError s!"unknown arm '{which}' — expected one of: {names} all")
