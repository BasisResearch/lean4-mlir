#!/usr/bin/env python
"""The MuZero unroll gate (planning/muzero_ttt_demo.md §4): the trainer's four parameter
gradients against `jax.grad` of the same unrolled loss.

  1. lake build muzero-ttt && .lake/build/bin/muzero-ttt mode=dump [bf=64 sims=8]
     # one self-play batch, its targets, the parameters and the trainer's gradients,
     # written to .lake/build/muz_unroll/
  2. <jax venv>/bin/python scripts/probes/muz_unroll_gate.py

The trainer composes the gradient by hand: each net's own VJP module (`generateVjp`), the
min–max VJP and the action-plane split in C (`lean_muz_minmax_back`, `lean_muz_latent_grad`),
the heads' cotangents in C (`lean_muz_heads_grad`), `g`'s K gradients summed, the cotangent
entering each `g` halved. Here the same loss is one JAX function — the nets re-implemented
from the dumped layer lists, min–max as `jnp.min` / `jnp.max`, the halving as the paper's
`scale_gradient` — and `jax.grad` is the reference.

  loss    the trainer's three loss terms against the JAX function's, at the same θ.
  ∂θ      each net's gradient, max |Δ| over max |reference|.
  ½       the same gradient with the halving left out must NOT match `g`'s and `h`'s: the
          gate can see the scaling it checks.

CPU only; `jax` and `numpy` (scripts/probes/vjp_gate.py's venv).
"""
import json
import os
import pathlib
import sys

os.environ.setdefault("JAX_PLATFORMS", "cpu")
import numpy as np  # noqa: E402
import jax  # noqa: E402
import jax.numpy as jnp  # noqa: E402

jax.config.update("jax_default_matmul_precision", "highest")

DIR = pathlib.Path(".lake/build/muz_unroll")
TOL = 1e-5

failures = []


def check(ok, what):
    print(f"  {'ok  ' if ok else 'FAIL'} {what}")
    if not ok:
        failures.append(what)


def shapes(net):
    """The parameter tensors in the trainer's order: per layer W then b (conv OIHW, dense [in, out])."""
    out = []
    for l in net["layers"]:
        if l["kind"] == "conv2d":
            out += [(l["oc"], l["ic"], l["k"], l["k"]), (l["oc"],)]
        elif l["kind"] == "dense":
            out += [(l["fi"], l["fo"]), (l["fo"],)]
    return out


def split(flat, net):
    ts, o = [], 0
    for sh in shapes(net):
        n = int(np.prod(sh))
        ts.append(jnp.asarray(flat[o:o + n].reshape(sh)))
        o += n
    assert o == net["nP"], (net["name"], o, net["nP"])
    return ts


def forward(net, n):
    def f(theta, x):
        it = iter(theta)
        a = x
        if net["layers"][0]["kind"] == "conv2d":
            a = a.reshape(a.shape[0], net["layers"][0]["ic"], n, n)
        for l in net["layers"]:
            if l["kind"] == "flatten":
                a = a.reshape(a.shape[0], -1)
                continue
            w, b = next(it), next(it)
            if l["kind"] == "conv2d":
                a = jax.lax.conv_general_dilated(a, w, (1, 1), "SAME",
                                                 dimension_numbers=("NCHW", "OIHW", "NCHW"))
                a = a + b[None, :, None, None]
            else:
                a = a @ w + b
            if l["act"] == "relu":
                a = jax.nn.relu(a)   # derivative 0 at 0, the codegen's mask; jnp.maximum splits ½
        return a.reshape(a.shape[0], -1)
    return f


def minmax(s):
    """Per example to [0, 1]; a range under 1e-6 is clamped and passes no gradient (the trainer's
    `lean_muz_minmax_back`)."""
    lo = jnp.min(s, axis=1, keepdims=True)
    r = jnp.max(s, axis=1, keepdims=True) - lo
    y = (s - lo) / jnp.maximum(r, 1e-6)
    return jnp.where(r < 1e-6, jax.lax.stop_gradient(y), y)


def main():
    meta = json.loads((DIR / "meta.json").read_text())
    n, C, K, B = meta["n"], meta["C"], meta["K"], meta["B"]
    nc = n * n
    nets = meta["nets"]
    fh, fg, ff, fr = (forward(net, n) for net in nets)
    rd = lambda name, dt=np.float32: np.fromfile(DIR / name, dtype=dt)  # noqa: E731
    flat = rd("params.bin")
    grads = rd("grads.bin")
    offs = np.cumsum([0] + [net["nP"] for net in nets])
    theta = [split(flat[offs[i]:offs[i + 1]], nets[i]) for i in range(4)]
    x0 = jnp.asarray(rd("x0.bin").reshape(B, 2 * nc))
    acts = rd("acts.bin", np.uint32).reshape(K, B)
    pis = jnp.asarray(rd("pis.bin").reshape(K + 1, B, nc))
    zs = jnp.asarray(rd("zs.bin").reshape(K + 1, B))
    us = jnp.asarray(rd("us.bin").reshape(K, B))
    onehot = jnp.asarray(np.eye(nc, dtype=np.float32)[acts])          # [K, B, nc]

    def loss(th, half=0.5):
        s = minmax(fh(th[0], x0))
        lv = lp = lr = 0.0
        for k in range(K + 1):
            w = 1.0 / B if k == 0 else 1.0 / (B * K)
            o = ff(th[2], s)
            v = jnp.tanh(o[:, nc])
            lv = lv + w * jnp.sum((zs[k] - v) ** 2)
            lp = lp + w * jnp.sum(-pis[k] * jax.nn.log_softmax(o[:, :nc], axis=1))
            if k >= 1:
                rr = jnp.tanh(fr(th[3], s)[:, 0])
                lr = lr + w * jnp.sum((us[k - 1] - rr) ** 2)
            if k < K:
                # the paper's scale_gradient: the cotangent entering the next g is `half` of it
                sh = half * s + (1.0 - half) * jax.lax.stop_gradient(s)
                gin = jnp.concatenate([sh.reshape(B, C, nc), onehot[k][:, None, :]], axis=1)
                s = minmax(fg(th[1], gin.reshape(B, -1)))
        return lv + lp + lr, (lv, lp, lr)

    (_, terms), ref = jax.value_and_grad(loss, has_aux=True)(theta)
    print(f"muzero unroll gate: n {n}, C {C}, K {K}, B {B}; {offs[-1]} parameters")
    for name, a, b in zip(("value", "policy", "reward"), meta["loss"], terms):
        check(abs(a - float(b)) <= 1e-4 * max(1.0, abs(float(b))), f"loss {name}: trainer {a:.6f}  jax {float(b):.6f}")
    errs = []
    for i, net in enumerate(nets):
        r = np.concatenate([np.asarray(t).ravel() for t in ref[i]])
        e = float(np.max(np.abs(grads[offs[i]:offs[i + 1]] - r)) / max(np.max(np.abs(r)), 1e-30))
        errs.append(e)
        check(e < TOL, f"∂θ {net['name']}: max|Δ| / max|ref| = {e:.2e}  (‖ref‖∞ {np.max(np.abs(r)):.3e})")
    _, full = jax.value_and_grad(loss, has_aux=True)(theta, 1.0)
    for i in (0, 1):
        r = np.concatenate([np.asarray(t).ravel() for t in full[i]])
        e = float(np.max(np.abs(grads[offs[i]:offs[i + 1]] - r)) / max(np.max(np.abs(r)), 1e-30))
        check(e > 10 * max(errs[i], TOL / 10),
              f"½ seen: {nets[i]['name']} against the unhalved gradient differs by {e:.2e}")
    if failures:
        print(f"FAILED: {len(failures)}")
        sys.exit(1)
    print("all checks passed")


if __name__ == "__main__":
    main()
