#!/usr/bin/env python3
"""F4 gate: the per-epoch schedule both paths emit, against timm's `CosineLRScheduler` itself
(planning/imagenet_parity.md F4; `TrainConfig.schedPerEpoch`, `trainAdamSched`'s `schedPerEpoch`).

DeiT and the RSB tiers step timm's scheduler ONCE PER EPOCH (`t_in_epochs`): warmup linear from
`--warmup-lr` to the peak over `--warmup-epochs`, then the cosine over ALL epochs counted from epoch 0
(`warmup_prefix=False`), floored at `--min-lr`. The JAX emitter writes that as two lines in the epoch
loop; the verified driver computes `schedPerEpochLR`. This gate:
  1. reads LR / EPOCHS / the two emitted lines out of a generated trainer (the constants are not
     trusted from the config — they are read from the file that trains),
  2. evaluates them for every epoch and holds them against timm's `_get_lr(t)` at 1e-9 relative,
  3. with `--lean`, runs `tests/TestSchedPerEpoch.lean` at the same constants and holds that too,
  4. CONTROL: the pre-F4 per-step formula, sampled at each epoch's first step, must DIFFER from timm
     by more than 1e-3 relative somewhere (it does, from epoch 5 on), or the gate could not see a
     regression to it.
Runs under .venv-timm (timm 1.0.28 + torch): `.venv-timm/bin/python3 scripts/gates/sched_timm_gate.py`.
"""
import argparse, re, subprocess, sys
import numpy as np

AP = argparse.ArgumentParser()
AP.add_argument("--trainer", default="jax/generated/generated_vit_tiny_imagenet.py")
AP.add_argument("--lean", action="store_true", help="also run tests/TestSchedPerEpoch.lean (needs lake)")
AP.add_argument("--tol", type=float, default=1e-9)
A = AP.parse_args()

src = open(A.trainer).read()
def grab(pat, what):
    m = re.search(pat, src, re.M)
    if not m:
        raise SystemExit(f"⛔ {A.trainer}: no {what} ({pat!r}) — not a schedPerEpoch trainer?")
    return m
LR = float(grab(r"^LR = ([0-9.eE+-]+)", "LR").group(1))
EPOCHS = int(grab(r"^\s+EPOCHS = (\d+)", "EPOCHS").group(1))
w = grab(r"^\s+if epoch < (\d+):\n\s+lr = jnp\.float32\(([0-9.eE+-]+) \+ epoch \* \(LR - ([0-9.eE+-]+)\) / (\d+)\)",
         "warmup line")
W, WLR, WLR2, W2 = int(w.group(1)), float(w.group(2)), float(w.group(3)), int(w.group(4))
assert W == W2 and WLR == WLR2, "the emitted warmup line is inconsistent with itself"
c = grab(r"^\s+lr = jnp\.float32\(([0-9.eE+-]+) \+ 0\.5 \* \(LR - ([0-9.eE+-]+)\) \* \(1 \+ np\.cos\(np\.pi \* epoch / EPOCHS\)\)\)",
         "cosine line")
MIN, MIN2 = float(c.group(1)), float(c.group(2))
assert MIN == MIN2
print(f"trainer: LR={LR} EPOCHS={EPOCHS} warmup={W} from {WLR} floor={MIN}")

def ours(t):   # the two emitted lines, verbatim in numpy
    if t < W:
        return WLR + t * (LR - WLR) / W
    return MIN + 0.5 * (LR - MIN) * (1 + np.cos(np.pi * t / EPOCHS))

import torch, timm
from timm.scheduler import CosineLRScheduler
opt = torch.optim.SGD([torch.nn.Parameter(torch.zeros(1))], lr=LR)
sched = CosineLRScheduler(opt, t_initial=EPOCHS, lr_min=MIN, warmup_t=W, warmup_lr_init=WLR,
                          warmup_prefix=False, t_in_epochs=True, cycle_limit=1)
ref = np.array([sched._get_lr(t)[0] for t in range(EPOCHS)])
mine = np.array([ours(t) for t in range(EPOCHS)])
rel = np.max(np.abs(mine - ref) / LR)
ok = rel <= A.tol
print(f"{'✓' if ok else '⛔'} JAX emit vs timm {timm.__version__} CosineLRScheduler: max |Δ|/LR = {rel:.2e} over {EPOCHS} epochs")

# control: the pre-F4 per-step curve at each epoch's first step
steps = 1251   # any steps-per-epoch; the control is about the shape, not the count
def per_step(step):
    ws = steps * W
    if step < ws:
        return LR * (step + 1) / ws
    prog = (step - ws) / max(steps * EPOCHS - ws, 1)
    return MIN + (LR - MIN) * 0.5 * (1 + np.cos(np.pi * min(prog, 1.0)))
ctrl = np.array([per_step(t * steps) for t in range(EPOCHS)])
crel = np.max(np.abs(ctrl - ref) / LR)
cok = crel > 1e-3
print(f"{'✓' if cok else '⛔'} control (per-step form at epoch starts) differs from timm by {crel:.2e} (> 1e-3 required)")

lok = True
if A.lean:
    args = [str(int(round(LR * 1e9))), str(int(round(MIN * 1e9))), str(int(round(WLR * 1e9))), str(W), str(EPOCHS)]
    p = subprocess.run(["lake", "env", "lean", "--run", "tests/TestSchedPerEpoch.lean"] + args,
                       capture_output=True, text=True)
    vals = {}
    for line in p.stdout.splitlines():
        parts = line.split()
        if len(parts) == 2 and parts[0].isdigit():
            vals[int(parts[0])] = float(parts[1]) * 1e-15   # the test prints femto-units
    if len(vals) != EPOCHS:
        print(f"⛔ Lean: got {len(vals)} values (rc={p.returncode})\n{p.stderr[-1500:]}"); lok = False
    else:
        lean = np.array([vals[t] for t in range(EPOCHS)])
        lrel = np.max(np.abs(lean - ref) / LR)
        lok = lrel <= A.tol
        print(f"{'✓' if lok else '⛔'} verified schedPerEpochLR vs timm: max |Δ|/LR = {lrel:.2e}")
sys.exit(0 if (ok and cok and lok) else 1)
