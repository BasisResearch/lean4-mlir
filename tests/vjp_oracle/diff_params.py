#!/usr/bin/env python3
"""Verified-path VJP oracle differ: one SGD step, parameter for parameter.

Both trainers start from the same raw f32 init (the verified trainer's `LEAN_MLIR_INIT_DUMP`,
loaded by the JAX script's `init_params_from_file`) and take one step on the same batch. Each
dumps its parameters afterwards in the same on-disk layout (the render's argument order; dense
`[in, out]` then bias, conv `[oc, ic, k, k]` then bias; the Lean dump of a `lossSlot` render — mlp,
cnn — carries one trailing scalar, the slot the trainer re-appends after reading the parameter
prefix back, and it is stripped here). This compares the two UPDATES
`Δ = θ₁ − θ₀`, not the parameters — the init cancels, so the number is about the gradient and
nothing else.

    diff_params.py <init.bin> <lean_after.bin> <jax_after.bin> <net> [tol]

Per tensor it prints ‖Δlean − Δjax‖₂ / ‖Δjax‖₂ and max|Δlean − Δjax|; the case passes when every
tensor's relative error is below `tol` and no update is identically zero (a zero update would pass
any relative test vacuously, so it fails instead). Exit 0 on pass, 1 on fail, 2 on bad input.
"""
import sys
import numpy as np

SHAPES = {
    'linear': [('W0', (784, 10)), ('b0', (10,))],
    'mlp': [('W0', (784, 512)), ('b0', (512,)), ('W1', (512, 512)), ('b1', (512,)),
            ('W2', (512, 10)), ('b2', (10,))],
    'cnn': [('W1', (32, 1, 3, 3)), ('b1', (32,)), ('W2', (32, 32, 3, 3)), ('b2', (32,)),
            ('W3', (6272, 512)), ('b3', (512,)), ('W4', (512, 512)), ('b4', (512,)),
            ('W5', (512, 10)), ('b5', (10,))],
}


# Renders with `VerifiedNet.lossSlot`: their train step takes and returns a trailing scalar, and
# `LEAN_MLIR_DUMP_PARAMS` writes the packed blob with it (Verified/Train.lean, the Gate G2 dump).
LOSS_SLOT = {'mlp', 'cnn'}


def load(path, n, slot=0):
    buf = np.fromfile(path, dtype=np.float32)
    if slot and buf.size == n + slot:
        return buf[:n]
    if buf.size != n:
        print(f"FAIL  {path}: {buf.size} floats, expected {n}" + (f" (or {n + slot} with the loss slot)" if slot else ""))
        sys.exit(2)
    return buf


def main():
    if len(sys.argv) < 5:
        print(__doc__); sys.exit(2)
    init_p, lean_p, jax_p, net = sys.argv[1:5]
    tol = float(sys.argv[5]) if len(sys.argv) > 5 else 1e-4
    if net not in SHAPES:
        print(f"FAIL  unknown net {net!r}; known: {sorted(SHAPES)}"); sys.exit(2)
    shapes = SHAPES[net]
    n = sum(int(np.prod(s)) for _, s in shapes)
    slot = 1 if net in LOSS_SLOT else 0
    th0, thL, thJ = load(init_p, n, slot), load(lean_p, n, slot), load(jax_p, n)
    dL, dJ = thL - th0, thJ - th0
    ok = True; worst = 0.0; idx = 0
    for name, shape in shapes:
        k = int(np.prod(shape)); a = dL[idx:idx+k]; b = dJ[idx:idx+k]; idx += k
        nb = float(np.linalg.norm(b))
        if nb == 0.0:
            print(f"  {name:4s} {str(shape):18s} JAX update is identically zero"); ok = False; continue
        rel = float(np.linalg.norm(a - b)) / nb
        mx = float(np.max(np.abs(a - b)))
        worst = max(worst, rel)
        flag = "" if rel < tol else "  <-- over tol"
        print(f"  {name:4s} {str(shape):18s} rel ‖Δlean−Δjax‖/‖Δjax‖ = {rel:.2e}   max|Δlean−Δjax| = {mx:.2e}{flag}")
        if not rel < tol: ok = False
    status = "PASS" if ok else "FAIL"
    print(f"{status}  {net:8s} worst rel Δ={worst:.2e}  (tol={tol:.0e})")
    sys.exit(0 if ok else 1)


if __name__ == "__main__":
    main()
