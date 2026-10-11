import LeanMlir.Verified.Train
/-! `lake env lean tests/TestSchedPerEpoch.lean` — prints `schedPerEpochLR` at DeiT-Ti's settings
(`vitTinyImagenetConfig`: peak 1e-3, floor 1e-5, warmup from 1e-6 over 5 of 300 epochs) for every
epoch, one `t femto-value` line each (the rate × 1e15 as an integer), for `scripts/gates/sched_timm_gate.py --lean` to hold against timm's
`CosineLRScheduler`. The constants are the ViT driver's; the gate reads them off the JAX trainer and
passes its own through `--lean-args`, so the two never drift apart silently. -/
def main (argv : List String) : IO Unit := do
  let f (i : Nat) (d : Float) := ((argv[i]?).bind String.toNat? |>.map (fun u => u.toFloat * 1e-9)).getD d
  -- rates arrive in nano-units (integers), epochs as plain naturals
  let baseLR := f 0 0.001; let minLR := f 1 0.00001; let warmupLRInit := f 2 0.000001
  let warmupEpochs := ((argv[3]?).bind String.toNat?).getD 5
  let epochs := ((argv[4]?).bind String.toNat?).getD 300
  for ep in [0:epochs] do
    -- printed in femto-units (×1e15, rounded to an integer): `Float`'s `toString` keeps six decimals,
    -- which is a 2e-4 relative error at these rates; the gate divides by 1e15
    let v := schedPerEpochLR baseLR minLR warmupLRInit warmupEpochs epochs ep
    IO.println s!"{ep} {(v * 1e15 + 0.5).toUInt64}"

#eval main []
