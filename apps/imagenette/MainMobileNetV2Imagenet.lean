import LeanMlir.Verified.NetsCore
import LeanMlir.Verified.Train

/-! # `mobilenetv2-imagenet-verified` — MobileNetV2 on full ImageNet-1k, verified → XLA

One of the five scale-tier trainers. It needs only a `slug` plus derived label-smoothing
constants — the smoothing constant sits in the COTANGENT (the gradient path) as well as in the
report-only loss.

Does NOT move the verification tier. The optimizer follows the variant: `rms*` / `emarms*` is the
reference's RMSProp with its ×0.98 staircase, `adam*` is AdamW at 1e-3. The shipping
`emarmstfdp64wxdwdoeps0001bf16` (2026-10-12, planning/recipe_prep.md §6) is TF-slim's recipe as its
README runs it, the JAX `full` config row for row: TF1's RMSProp (the rate inside the momentum
term), coupled L2 4e-5 off BN γ/β, biases AND the depthwise kernels, classifier dropout 0.2, label
smoothing 0.1, BN ε 1e-3 in the render and decay 0.997 here, the model-EMA shadow at 0.9999 (TF's
warmup-corrected form, scored), 0.12 at 256 stepped ×0.98 every 2.5 epochs from step 0 with no
warmup, and the truncated-normal init below. The earlier `rmsdp64wxdols0eps0001bf16` (the 71.12
run's arm) differs from it in every one of those but the dropout and the BN constants.

**One file, one binary, either lowerer.** The proven graph goes to whichever
trusted lowerer `$LEAN_MLIR_LOWERER` selects -- XLA/PJRT by default, IREE with
`=iree` -- resolved by dlopen at run time (`ffi/lowerer.h`). The target name has no
`-xla` suffix because it would distinguish nothing.
-/

/-- **420 epochs** at 64 per device, and at four replicas the reference's global batch of 256.
    `batchSize` is PER DEVICE and must match the batch the variant was rendered at.

    420 because **this trainer's job is to match the JAX reference run**, `mobilenetV2ImagenetConfigFull`:
    TF-slim's README reproduces its 72.0 in "about 700K steps" on 8 clones of 96, 700,000 × 768 /
    1,281,167 ≈ 420 epochs of data (the book's landed pair, §6.5, ran 350 under the paper's
    per-epoch reading of the schedule). An exponential staircase has no floor to anneal to, so a
    shorter run is a truncation of the same curve rather than a rescaled one — but the pair is
    read at matched length, so the two sides carry the same number. -/
def mobilenetv2ImagenetConfig : VerifiedConfig where
  epochs    := 420
  batchSize := 64
  -- TF-slim's BN decay, the reference's `bnMomentum` (host-side EMA, no render).
  -- It applies to every variant this driver runs, the older 1e-5 renders included.
  bnMomentum := 0.997
  -- **Depthwise fan = k², as the JAX reference.** Every JAX depthwise emitter hard-codes
  -- fan = k² (TF/timm's `variance_scaling` on a `(k,k,C,1)` kernel); `mkParam`'s He fan-out gave
  -- `2/(C·k²)`, a fraction of the reference's std on the 17 depthwise kernels (planning/init_parity.md §2a,
  -- imagenet_parity.md D4). Host-side, no re-render. On since 2026-10-07; verified runs before it
  -- started at the narrow fan, and `LEAN_MLIR_DW_FAN_K2=0` reproduces those from their seed.
  dwFanK2 := true
  -- **TF-slim's `truncated_normal_initializer(stddev=0.09)` on every kernel** — the stem, the
  -- 1×1s, the 17 depthwise kernels and the logits — above the fan rules (so `dwFanK2` is
  -- overridden while it is set; it stays for the `rms*` variants this driver can still run).
  -- Variance-matched to the ±2σ-truncated draw (std 0.0792); `LEAN_MLIR_TRUNC_NORMAL=0` reproduces
  -- the fan-rule runs from their seed. The JAX reference's `initTruncNormal` is the same 0.09.
  truncNormalSigma := 0.09

/-- Entry point. Defaults to the single-device `adam64` variant, matching the other four ImageNet
    drivers — a DP default dies at the first step on a replica-count refusal, which reads as a
    broken build rather than a missing flag. -/
def runMobileNetV2Imagenet (argv : List String) : IO Unit := do
  let variant := (← IO.getEnv "LEAN_MLIR_VARIANT").getD "adam64"
  let bs := ((← IO.getEnv "LEAN_MLIR_BATCH").bind (·.toNat?)).getD mobilenetv2ImagenetConfig.batchSize
  -- `LEAN_MLIR_EPOCHS` SETS the schedule where `LEAN_MLIR_MAX_EPOCHS` only CAPS it: `totalSteps
  -- := cfg.epochs * nb / accK` is what the cosine anneals over, so `EPOCHS=30` is a complete
  -- 30-epoch experiment while `MAX_EPOCHS=30` is a PREFIX of the 350-epoch decay stopped with the
  -- LR still high.
  let epochs := ((← IO.getEnv "LEAN_MLIR_EPOCHS").bind (·.toNat?)).getD mobilenetv2ImagenetConfig.epochs
  -- `rms*` / `emarms*` selects the reference's OWN optimizer, so it also selects the reference's
  -- own schedule. At the shipping variant this driver is the MobileNetV2 recipe: RMSProp (ρ .9,
  -- μ .9, ε 1.0, coupled wd 4e-5 — all baked by `rmsConstsBlock mnv2RmsHyper`; TF1's rate placement
  -- in the `rmstf` renders) at peak LR 0.12 for the global 256, ×0.98 every 2.5 epochs as a
  -- staircase from step 0 with no warmup, mean-square initialised to 1.0 by the driver. Every one
  -- of those is `mobilenetV2ImagenetConfig`'s value, and the LR/schedule half comes off
  -- `mnv2ImagenetRmsSchedule` so the two paths cannot carry a different 0.98 or 2.5.
  -- `rmsOn` is a SUBSTRING test (`emarms…` does not start with "rms"; `rmstf` contains it).
  let sched := mnv2ImagenetRmsSchedule
  let rms := VerifiedVariant.rmsOn variant
  let baseLR := match (← IO.getEnv "LEAN_MLIR_BASE_LR_U").bind (·.toNat?) with
    | some u => u.toFloat * 1e-6
    | none   => if rms then sched.lr
                else 0.001   -- NOT the reference's 0.045: that is an RMSProp rate, this is AdamW.
  mobilenetv2ImagenetVerified.toNet.trainAdamSched
    { mobilenetv2ImagenetConfig with batchSize := bs, epochs := epochs }
    (argv.head?.getD "data") baseLR 0.9 0.999 (if rms then sched.warmup else 5) variant
    (if rms then sched.decayRate else 0.0) sched.decayEpochs
    (expStaircase := rms && sched.staircase)

def main (argv : List String) : IO Unit := runMobileNetV2Imagenet argv
