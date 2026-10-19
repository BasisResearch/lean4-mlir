#!/usr/bin/env python3
"""Independent autodiff of the cifar8 BN net's forward, against a `cifar8-bbn-gradcheck` dump.

    C8BBN_GC_DUMP=/tmp/d/bbn .lake/build/bin/cifar8-bbn-gradcheck   # writes /tmp/d/bbn_{theta,x,y,out}.bin
    python3 tests/cifar8_bbn_jax_ref.py /tmp/d/bbn batch                # batch-statistics BN ([0,2,3])
    python3 tests/cifar8_bbn_jax_ref.py /tmp/d/bn  image                # per-image BN ([2,3])

Reimplements the forward the artifact emits — 3×3 SAME cross-correlation conv + bias, BatchNorm
(two-pass biased variance, ε = 1e-5 inside the rsqrt), relu, 2×2/s2 max-pool, c-major flatten,
three dense layers, mean softmax-CE — in JAX, and compares, per parameter tensor:

  * the artifact's recovered gradient `g = 10·m'` against `jax.grad` of this forward (f32 and f64);
  * the harness's adjoint probe — `(L(θ+δ) − L(θ−δ))/2` at `δ = α·m'` per group — recomputed
    in f64 (no fp32 noise, no lowerer), against `⟨∇L, δ⟩` for BOTH gradients.

So it answers, independently of the lowerer: is the artifact's backward the gradient of its
forward, and is the finite difference a fair referee at this base point. Param layout is
`cifar8wBnVerified.toSpecs`: (W[oc,ic,3,3], b, γ, β) ×8 then W9[128,512], b9, Wa, ba, Wb, bb.
"""
import sys
import numpy as np
import jax
import jax.numpy as jnp

jax.config.update("jax_enable_x64", True)

pre, mode = sys.argv[1], sys.argv[2]
assert mode in ("batch", "image")
B, NC = 128, 10
chans = [(3, 16), (16, 16), (16, 16), (16, 16), (16, 32), (32, 32), (32, 32), (32, 32)]
pool_after = {1, 3, 5, 7}  # 0-based layer index after which a 2×2 pool follows

theta = np.fromfile(f"{pre}_theta.bin", dtype=np.float32)
x = np.fromfile(f"{pre}_x.bin", dtype=np.float32).reshape(B, 3, 32, 32)
y = np.fromfile(f"{pre}_y.bin", dtype=np.int32)
out = np.fromfile(f"{pre}_out.bin", dtype=np.float32)
nP = theta.size
m1 = out[nP:2 * nP]
loss_art = float(out[3 * nP])
g_art = 10.0 * m1.astype(np.float64)

# ── unpack θ into named tensors, keeping (offset, size) per tensor ──
names, shapes = [], []
for i, (ic, oc) in enumerate(chans):
    names += [f"L{i+1}.W", f"L{i+1}.b", f"L{i+1}.γ", f"L{i+1}.β"]
    shapes += [(oc, ic, 3, 3), (oc,), (oc,), (oc,)]
names += ["head.W9", "head.b9", "head.Wa", "head.ba", "head.Wb", "head.bb"]
shapes += [(128, 512), (512,), (512, 512), (512,), (512, 10), (10,)]
offs = [0]
for sh in shapes:
    offs.append(offs[-1] + int(np.prod(sh)))
assert offs[-1] == nP, (offs[-1], nP)


def unpack(th):
    return [th[offs[i]:offs[i + 1]].reshape(shapes[i]) for i in range(len(shapes))]


def forward(th, xx):
    ps = unpack(th)
    h = xx
    for i in range(8):
        W, b, gam, bet = ps[4 * i:4 * i + 4]
        h = jax.lax.conv_general_dilated(h, W, (1, 1), [(1, 1), (1, 1)],
                                         dimension_numbers=("NCHW", "OIHW", "NCHW"))
        h = h + b[None, :, None, None]
        axes = (0, 2, 3) if mode == "batch" else (2, 3)
        mu = jnp.mean(h, axis=axes, keepdims=True)
        var = jnp.mean((h - mu) ** 2, axis=axes, keepdims=True)
        h = (h - mu) * jax.lax.rsqrt(var + 1e-5)
        h = h * gam[None, :, None, None] + bet[None, :, None, None]
        h = jnp.maximum(h, 0.0)
        if i in pool_after:
            h = jax.lax.reduce_window(h, -jnp.inf, jax.lax.max, (1, 1, 2, 2), (1, 1, 2, 2), "VALID")
    h = h.reshape(B, -1)
    W9, b9, Wa, ba, Wb, bb = ps[32:]
    h = jnp.maximum(h @ W9 + b9, 0.0)
    h = jnp.maximum(h @ Wa + ba, 0.0)
    logits = h @ Wb + bb
    logp = jax.nn.log_softmax(logits, axis=-1)
    return -jnp.mean(logp[jnp.arange(B), y])


def report(dtype):
    th = jnp.asarray(theta, dtype=dtype)
    xx = jnp.asarray(x, dtype=dtype)
    L, g = jax.value_and_grad(forward)(th, xx)
    g = np.asarray(g, dtype=np.float64)
    print(f"\n── {np.dtype(dtype).name}: loss {float(L):.6f}  (artifact {loss_art:.6f}, "
          f"Δ {abs(float(L) - loss_art):.2e})   ‖∇L‖ {np.linalg.norm(g):.6f}  ‖g_art‖ {np.linalg.norm(g_art):.6f}")
    print("   tensor      ‖∇L_jax‖     ‖g_art‖      rel ‖diff‖/‖∇L‖     cos")
    worst = 0.0
    for i, nm in enumerate(names):
        a = g[offs[i]:offs[i + 1]]
        b = g_art[offs[i]:offs[i + 1]]
        na, nb = np.linalg.norm(a), np.linalg.norm(b)
        rel = np.linalg.norm(a - b) / max(na, 1e-30)
        cos = float(a @ b / max(na * nb, 1e-30))
        worst = max(worst, rel)
        print(f"   {nm:9s}  {na:.6e}  {nb:.6e}  {rel:.3e}  {cos:+.6f}")
    print(f"   worst per-tensor rel {worst:.3e}")
    return th, xx, g


th64, xx64, g64 = report(jnp.float64)
report(jnp.float32)

# ── the harness's adjoint probe, in f64: FD vs ⟨∇L_jax, δ⟩ vs ⟨g_art, δ⟩, δ = α·m' per group ──
print("\n── adjoint probe in f64 at h = 6e-5 (δ = α·m' on the group, ‖δ‖ = h·‖θ_group‖)")
print("   group   (L₊−L₋)/2      <∇L_jax,δ>     rel     <g_art,δ>      rel")
groups = [(f"L{i+1}", offs[4 * i], offs[4 * i + 4]) for i in range(8)] + [("head", offs[32], nP), ("whole", 0, nP)]
th_np = theta.astype(np.float64)
for nm, a, b in groups:
    d = np.zeros(nP)
    d[a:b] = m1[a:b]
    tn = np.linalg.norm(th_np[a:b]); mn = np.linalg.norm(d)
    if mn < 1e-30:
        continue
    alpha = 6e-5 * tn / mn
    d *= alpha
    Lp = float(forward(jnp.asarray(th_np + d), xx64))
    Lm = float(forward(jnp.asarray(th_np - d), xx64))
    fd = (Lp - Lm) / 2
    pj = float(g64 @ d); pa = float(g_art @ d)
    print(f"   {nm:6s}  {fd:+.6e}  {pj:+.6e}  {abs(fd-pj)/abs(pj):.2e}  {pa:+.6e}  {abs(fd-pa)/abs(pa):.2e}")
