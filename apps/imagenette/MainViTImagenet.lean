module

public import LeanMlir.Verified.NetsCore
public import LeanMlir.Verified.Train

@[expose] public section

/-! # `vit-imagenet-verified` — ViT-Tiny on full ImageNet-1k, verified renderer → XLA/PJRT

The ViT peer of `resnet34-imagenet-verified`. `nClasses`, `bs` and `replicas` are all parameters
of the renderer, so the three ImageNet artifacts are three `#eval`s, exactly as for ResNet-34.

XLA-only by construction: collectives live on the PJRT path, and IREE has no measured
ImageNet-scale number here to compare against.

**This does not move the verification tier** — the proof-carrying claims stop at Imagenette.
See `vitImagenetVerified`'s claim-ceiling note for what the variant carries of the DeiT recipe.

The job is `scripts/jobs/vit-default-emabf16-4gpu.conf` (`emadp256x4wxdropeps0000001smxerfbf16`:
EMA from step 0, no clip, drop-path, weight decay off norm/bias, DeiT's LayerNorm ε 1e-6, the
shifted softmax, the exact GELU, bf16, 4 × 256 = DeiT's global 1024). It sets `SHIM_WORKERS`
(4, its measured peak at 1024), `LEAN_MLIR_EPOCHS` and both replica knobs; run the job, not the
bare binary, for anything printable. The 4 × 128 clip renders (`emadp128x4wxclipdrop…`, the
recipe before 2026-10-11) stay committed; a checkpoint under one cannot be resumed into the pair.

```bash
scripts/gen_shims.sh                       # this net's OWN data shim (NOT R34's — see VerifiedNet.shimScript)
gcc -fPIC -O2 -shared ffi/pjrt_ffi.c -ldl -o ffi/libpjrt_ffi.so
lake build vit-imagenet-verified
scripts/supervise.sh vit-default-emabf16-4gpu
```

**One file, one binary, either lowerer.** The proven graph goes to whichever
trusted lowerer `$LEAN_MLIR_LOWERER` selects -- XLA/PJRT by default, IREE with
`=iree` -- resolved by dlopen at run time (`ffi/lowerer.h`).
-/

/-- 300 epochs at 256 per device — the DeiT-Ti schedule length, and at four replicas DeiT's own
    global batch of 1024 (`vitTinyImagenetConfig.batchSize`). `batchSize` is PER DEVICE, as
    everywhere else here (`LEAN_MLIR_BATCH` overrides, and must match the batch the selected
    variant was rendered at, since it is baked into the graph: 128 for the clip renders). -/
def vitImagenetConfig : VerifiedConfig where
  epochs    := 300
  batchSize := 256   -- PER REPLICA: 4 × 256 = DeiT-Ti's global 1024 (`vitTinyImagenetConfig.batchSize`)
  -- timm/DeiT init, matching the reference run's `deit-init` recipe (blueprint §9.6).
  -- Without it every transformer Linear is Glorot, which at ViT-Ti's d=192 is 3.6× wider than
  -- timm's fixed 0.02, and the CLS token is 5× wider — the one axis §9.6 credits for reaching
  -- the paper's number. Init is host-side, so this needs no re-render.
  vitInit   := true

/-- Entry point. Defaults to the **single-device** `adam128erf` variant rather than the four-replica
    one, matching `runResnet34Imagenet`: a DP default would make a plain invocation fail at the
    first step with a replica-count refusal, which reads as a broken build rather than a missing
    flag. `LEAN_MLIR_VARIANT=adamdp128x4erf` selects the 4-GPU render.

    The `erf` marker is the exact GELU `x · Φ(x)`, DeiT's own and the JAX reference's
    (`vitTinyImagenetConfig.geluExact`); every ImageNet render also exists without it, at the tanh
    approximation the runs before 2026-10-06 trained. The driver reads the marker to score through
    a forward at the same form (`VerifiedVariant.erfOn`). -/
def runViTImagenet (argv : List String) : IO Unit := do
  let variant := (← IO.getEnv "LEAN_MLIR_VARIANT").getD "adam128erf"
  let bs := ((← IO.getEnv "LEAN_MLIR_BATCH").bind (·.toNat?)).getD vitImagenetConfig.batchSize
  let baseLR := match (← IO.getEnv "LEAN_MLIR_BASE_LR_U").bind (·.toNat?) with
    | some u => u.toFloat * 1e-6
    | none   => 0.001    -- `vitTinyImagenetConfig.learningRate`: DeiT's 5e-4 · B/512 at its batch
                         -- of 1024 (4 × 256 here). The Imagenette ViT driver's 3e-4 is tuned for
                         -- global batch 32 and would under-step this by ~3x.
  -- `LEAN_MLIR_EPOCHS` SETS the schedule where `LEAN_MLIR_MAX_EPOCHS` only CAPS it
  -- (`min n cfg.epochs`). `totalSteps := cfg.epochs * nb / accK` is what the cosine anneals over,
  -- so `EPOCHS=30` is a complete 30-epoch experiment while `MAX_EPOCHS=30` is a PREFIX of the
  -- committed 300-epoch decay stopped with the LR still high. Clear checkpoints when switching
  -- schedules; resuming across them fuses two LR curves silently. Without this knob a 300-epoch
  -- commitment makes the net unprobeable.
  let epochs := ((← IO.getEnv "LEAN_MLIR_EPOCHS").bind (·.toNat?)).getD vitImagenetConfig.epochs
  -- `emaDecay` IS NAMED, and it has to be. `trainAdamSched`'s default is **0.9999**, while
  -- `vitTinyImagenetConfig.emaDecay` — the DeiT default the reference run used — is **0.99996**.
  -- Positional args stop at `variant`, so an EMA variant launched without this line trains against
  -- a shadow that averages 2.5× faster than its reference's (a 1/(1−d) horizon of 10⁴ steps
  -- against 2.5·10⁴) and reports it as the pair.
  -- Inert unless the variant selects EMA (`VerifiedVariant.emaOn`, i.e. a name starting "ema"),
  -- so it costs the non-EMA renders nothing.
  vitImagenetVerified.toNet.trainAdamSched
    { vitImagenetConfig with batchSize := bs, epochs := epochs }
    (argv.head?.getD "data") baseLR 0.9 0.999 5 variant (emaDecay := 0.99996)
    -- DeiT `--min-lr 1e-5`, the reference's `vitTinyImagenetConfig.minLR` (2026-10-01).
    (minLR := 0.00001)
    -- DeiT's ModelEma holds its decay from step 0 (`vitTinyImagenetConfig.emaWarmup := false`), and
    -- its scheduler is timm's, stepped once an epoch from `--warmup-lr 1e-6` with the cosine over all
    -- 300 epochs (`schedPerEpoch` / `warmupLRInit`, 2026-10-11). Both are host-side: no re-render.
    (emaWarmup := false) (schedPerEpoch := true) (warmupLRInit := 0.000001)

def main (argv : List String) : IO Unit := runViTImagenet argv
