#!/usr/bin/env python3
"""The Kneser-Ney n-gram ladder under TinyGPT — planning/tinygpt_ngram_ladder.md §4.

Interpolated modified Kneser-Ney (Chen & Goodman 1998) at character level on the same
int32 streams the Lean trainer reads (`data/shakespeare/{train,val}.bin`, 65 symbols). One
model per order n = 1 .. N: the top level of the order-n model uses raw counts, every level
below it continuation counts (the number of distinct left-extensions), three absolute
discounts per level from that level's counts-of-counts, interpolation weights from the
discounted mass, uniform over V at the bottom. No OOV: val is the same file's tail.

Two scoring protocols (plan §3), both over the SAME positions as the Lean `score` mode:
  chunked:T   the trainer's own chunks laid consecutively: inputs [cT, cT+T), targets
              [cT+1, cT+T+1), so target j of a chunk is predicted from j+1 characters and
              the order-n model acts as the order-min(n, j+2) model there (raw counts at
              its top). The partial chunk at the end is dropped, as the trainer's chunks
              are always full.
  streaming   every position t >= T with the full window behind it, unbounded history
              for the n-gram — what "bits/char on tinyshakespeare" means in the literature.

Modes:
  fit    --train data/shakespeare/train.bin [--orders 10] [--vocab 65] --out MODEL.npz
  score  --model MODEL.npz --val data/shakespeare/val.bin --protocol chunked:64|streaming
         [--T 64] --out DIR          writes DIR/ngram_<protocol>.csv (order, bits/char, n)
                                     and DIR/ngram_<protocol>_n<k>.npy (per-position log2 loss)
  table  --run DIR [--nets nano,tiny] [--T 64]
         the ladder beside the transformers (plan §5): reads DIR/ngram_<protocol>_n<k>.npy
         and DIR/tinygpt_<net>_score_<protocol>.bin (the Lean `score` mode's per-position
         CE in nats, the same positions), writes DIR/table.md, DIR/table.csv and
         DIR/context_curve.csv (P1 loss against history length); the plateau (the first
         order the ladder stops improving by > 0.01), each net's gap to it under P2 with
         a block-bootstrap CI (blocks of T positions, 1,000 resamples).
  check  [--train ... --val ...]     Gate 0 (plan §6): (a) distributions sum to 1,
                                     (b) a synthetic order-3 Markov chain's entropy rate is
                                     recovered at n = 3 and not at n = 1, 2 (orders above
                                     the source's are reported: KN's continuation counts
                                     assume natural-language novelty and over-order on an
                                     exact chain, by 0.04 at n = 4 and 0.24 at n = 6),
                                     (c) the KN bigram scored IN-SAMPLE on train is at or
                                     below the dense bigram's 3.56 — that number is
                                     `bigram-shakespeare train`'s last-epoch TRAIN loss, not
                                     a val figure; the KN bigram's val row is printed beside it,
                                     (d) the vectorised scorer equals a dict implementation
                                     of the same formulas at every position of a small
                                     corpus, under both protocols.

Keys are the n-gram packed base-V into int64 with the LAST symbol least significant, so a
k-gram's context is key // V and the last k symbols of a (k+1)-gram are key % V**k.
V**10 = 1.3e18 fits int64; orders above 10 do not.
"""
import argparse
import csv
import os
import sys

import numpy as np

LN2 = np.log(2.0)


# ----------------------------------------------------------------------------- streams

def load_stream(path):
    ids = np.fromfile(path, dtype="<i4").astype(np.int64)
    if ids.size == 0:
        sys.exit(f"empty stream {path}")
    return ids


def gram_keys(ids, order, V):
    """keys[t] = the order-gram ending at t (valid for t >= order-1; garbage before)."""
    n = ids.size
    keys = np.zeros(n, dtype=np.int64)
    for j in range(order):
        w = V ** j
        shifted = np.empty(n, dtype=np.int64)
        shifted[:j] = 0
        shifted[j:] = ids[: n - j] if j else ids
        keys += shifted * w
    return keys


# ----------------------------------------------------------------------------- tables

def discounts(cnt):
    """Modified KN's three discounts from the counts-of-counts of one level."""
    n1 = float(np.count_nonzero(cnt == 1))
    n2 = float(np.count_nonzero(cnt == 2))
    n3 = float(np.count_nonzero(cnt == 3))
    n4 = float(np.count_nonzero(cnt == 4))
    if n1 == 0 or n2 == 0:
        return np.array([0.75, 1.25, 1.75])          # Chen & Goodman's fallback shape
    Y = n1 / (n1 + 2.0 * n2)
    D1 = 1.0 - 2.0 * Y * n2 / n1
    D2 = 2.0 - 3.0 * Y * n3 / n2 if n2 > 0 else 1.25
    D3 = 3.0 - 4.0 * Y * n4 / n3 if n3 > 0 else 1.75
    D = np.array([D1, D2, D3])
    return np.clip(D, 0.0, [1.0, 2.0, 3.0])


def level_tables(keys, cnt, V):
    """From (sorted unique k-gram keys, counts) build the per-context statistics."""
    ctx = keys // V
    ctx_keys, inv = np.unique(ctx, return_inverse=True)
    tot = np.bincount(inv, weights=cnt, minlength=ctx_keys.size)
    n1 = np.bincount(inv, weights=(cnt == 1), minlength=ctx_keys.size)
    n2 = np.bincount(inv, weights=(cnt == 2), minlength=ctx_keys.size)
    n3 = np.bincount(inv, weights=(cnt >= 3), minlength=ctx_keys.size)
    return dict(keys=keys, cnt=cnt.astype(np.float64), ctx_keys=ctx_keys, tot=tot,
                n1=n1, n2=n2, n3=n3, D=discounts(cnt))


def fit(train_ids, N, V):
    """raw[k] for k = 1..N, cont[k] for k = 1..N-1 (cont[k] needs raw[k+1])."""
    raw_uniq = {}
    for k in range(1, N + 1):
        keys = gram_keys(train_ids, k, V)[k - 1:]
        u, c = np.unique(keys, return_counts=True)
        raw_uniq[k] = (u, c)
    raw, cont = {}, {}
    for k in range(1, N + 1):
        raw[k] = level_tables(*raw_uniq[k], V)
    for k in range(1, N):
        u_hi, _ = raw_uniq[k + 1]
        suffix = u_hi % (V ** k)
        u, c = np.unique(suffix, return_counts=True)
        cont[k] = level_tables(u, c, V)
    return dict(V=V, N=N, raw=raw, cont=cont)


def save_model(model, path):
    flat = {"V": np.int64(model["V"]), "N": np.int64(model["N"])}
    for kind in ("raw", "cont"):
        for k, t in model[kind].items():
            for name, arr in t.items():
                flat[f"{kind}_{k}_{name}"] = arr
    np.savez_compressed(path, **flat)


def load_model(path):
    z = np.load(path)
    V, N = int(z["V"]), int(z["N"])
    model = dict(V=V, N=N, raw={}, cont={})
    for key in z.files:
        if key in ("V", "N"):
            continue
        kind, k, name = key.split("_", 2)
        model[kind].setdefault(int(k), {})[name] = z[key]
    return model


# ----------------------------------------------------------------------------- lookup

def lookup(sorted_keys, values, q):
    idx = np.searchsorted(sorted_keys, q)
    idx_c = np.minimum(idx, sorted_keys.size - 1)
    found = sorted_keys[idx_c] == q
    out = np.where(found, values[idx_c], 0.0)
    return out


def level_update(t, keys, p_lower, V):
    """One interpolated-KN level: p(w|h) from the table t at the gram keys, or p_lower
    where the context is unseen. Returns (p, active)."""
    c = lookup(t["keys"], t["cnt"], keys)
    ctx = keys // V
    tot = lookup(t["ctx_keys"], t["tot"], ctx)
    n1 = lookup(t["ctx_keys"], t["n1"], ctx)
    n2 = lookup(t["ctx_keys"], t["n2"], ctx)
    n3 = lookup(t["ctx_keys"], t["n3"], ctx)
    D1, D2, D3 = t["D"]
    Dc = np.where(c >= 3, D3, np.where(c == 2, D2, np.where(c == 1, D1, 0.0)))
    active = tot > 0
    safe_tot = np.where(active, tot, 1.0)
    gamma = (D1 * n1 + D2 * n2 + D3 * n3) / safe_tot
    p = np.maximum(c - Dc, 0.0) / safe_tot + gamma * p_lower
    return np.where(active, p, p_lower)


def predict(model, n, ctx_by_level, w, L):
    """P(w | history) under the order-n model, vectorised over positions.
    ctx_by_level[k] = the (k-1)-gram ending just before the target (0 for k = 1);
    L = the number of history symbols available at each position (the chunk rule)."""
    V = model["V"]
    m = np.minimum(n, L + 1)                     # the effective order at each position
    p = np.full(w.shape, 1.0 / V)
    for k in range(1, n + 1):
        keys = ctx_by_level[k] * V + w
        p_cont = level_update(model["cont"][k], keys, p, V) if k < n else p
        p_raw = level_update(model["raw"][k], keys, p, V)
        p = np.where(k < m, p_cont, np.where(k == m, p_raw, p))
    return p


def stream_contexts(ids, N, V):
    """ctx[k][t] = key of the (k-1)-gram ending at t-1, for k = 1..N."""
    ctx = {1: np.zeros(ids.size, dtype=np.int64)}
    for k in range(2, N + 1):
        g = gram_keys(ids, k - 1, V)
        shifted = np.zeros(ids.size, dtype=np.int64)
        shifted[1:] = g[:-1]
        ctx[k] = shifted
    return ctx


# ----------------------------------------------------------------------------- scoring

def protocol_positions(n_tokens, protocol, T):
    """(positions, L) for a protocol over a stream of n_tokens."""
    if protocol.startswith("chunked"):
        # the trainer's chunk: inputs [cT, cT+T), targets [cT+1, cT+T+1) — target j of a
        # chunk is predicted from j+1 characters, so the history runs 1..T, never 0
        T = int(protocol.split(":")[1]) if ":" in protocol else T
        n_full = ((n_tokens - 1) // T) * T
        pos = np.arange(1, n_full + 1)
        L = (pos - 1) % T + 1
        return pos, L, f"chunked{T}"
    if protocol == "streaming":
        # every position with a full T-character window behind it
        pos = np.arange(T, n_tokens)
        return pos, pos.copy(), "streaming"
    sys.exit(f"unknown protocol {protocol}")


def score_stream(model, ids, orders, protocol, T):
    V, N = model["V"], model["N"]
    pos, L, tag = protocol_positions(ids.size, protocol, T)
    ctx = stream_contexts(ids, N, V)
    ctx_at = {k: ctx[k][pos] for k in ctx}
    w = ids[pos]
    out = {}
    for n in orders:
        p = predict(model, n, ctx_at, w, L)
        out[n] = -np.log2(p)
    return tag, pos, out


# ----------------------------------------------------------------------------- gate 0

def check_sums(model, ids, n_hist=1000, seed=0):
    V, N = model["V"], model["N"]
    rng = np.random.default_rng(seed)
    ctx = stream_contexts(ids, N, V)
    t = rng.integers(N, ids.size, size=n_hist)
    worst = 0.0
    for n in range(1, N + 1):
        ctx_at = {k: np.repeat(ctx[k][t], V) for k in ctx}
        w = np.tile(np.arange(V, dtype=np.int64), n_hist)
        L = np.repeat(np.full(n_hist, N, dtype=np.int64), V)
        p = predict(model, n, ctx_at, w, L).reshape(n_hist, V).sum(axis=1)
        worst = max(worst, float(np.abs(p - 1.0).max()))
    return worst


def markov_chain(V=20, ctx_len=2, n_train=1_000_000, n_test=100_000, seed=1):
    """An order-(ctx_len+1) Markov source with a known entropy rate."""
    rng = np.random.default_rng(seed)
    S = V ** ctx_len
    P = rng.dirichlet(np.full(V, 0.3), size=S)          # P[state, next]
    # stationary distribution over states by power iteration
    pi = np.full(S, 1.0 / S)
    nxt = (np.arange(S)[:, None] % (V ** (ctx_len - 1))) * V + np.arange(V)[None, :]
    for _ in range(500):
        new = np.zeros(S)
        np.add.at(new, nxt, pi[:, None] * P)
        pi = new / new.sum()
    H = -(pi[:, None] * P * np.log2(np.where(P > 0, P, 1.0))).sum()
    n = n_train + n_test
    ids = np.zeros(n, dtype=np.int64)
    state = 0
    cum = np.cumsum(P, axis=1)
    u = rng.random(n)
    for t in range(n):
        w = int(np.searchsorted(cum[state], u[t]))
        w = min(w, V - 1)
        ids[t] = w
        state = (state % (V ** (ctx_len - 1))) * V + w
    return ids[:n_train], ids[n_train:], H


def run_check(args):
    ok = True
    print("Gate 0 (planning/tinygpt_ngram_ladder.md §6)")
    # (b) synthetic order-3 chain
    tr, te, H = markov_chain()
    m = fit(tr, 6, 20)
    _, _, bits = score_stream(m, te, range(1, 7), "streaming", 8)
    print(f"  (b) order-3 Markov chain, V=20: entropy rate {H:.4f} bits")
    for n in range(1, 7):
        b = float(bits[n].mean())
        flag = ""
        if n == 3 and abs(b - H) > 0.02:
            ok, flag = False, "  <-- FAIL (>0.02 from the rate)"
        if n < 3 and b - H < 0.05:
            ok, flag = False, "  <-- FAIL (should sit above the rate)"
        if n > 3:
            flag = f"  (over-ordered by {b - H:+.3f}; reported, not gated)"
        print(f"      KN n={n}: {b:.4f}{flag}")
    # (a) and (c) on Shakespeare
    train = load_stream(args.train)
    val = load_stream(args.val)
    V = int(max(train.max(), val.max())) + 1
    model = fit(train, args.orders, V)
    worst = check_sums(model, val)
    print(f"  (a) worst |sum_w P(w|h) - 1| over 1000 histories x {args.orders} orders: {worst:.2e}"
          + ("" if worst < 1e-9 else "  <-- FAIL"))
    ok &= worst < 1e-9
    _, _, bits_tr = score_stream(model, train, [2], "streaming", 64)
    _, _, bits_va = score_stream(model, val, [2], "streaming", 64)
    b2_tr, b2_va = float(bits_tr[2].mean()), float(bits_va[2].mean())
    print(f"  (c) KN bigram in-sample on train: {b2_tr:.4f} bits/char against the dense bigram's "
          f"3.56 (its last-epoch train loss)" + ("" if b2_tr <= 3.57 else "  <-- FAIL")
          + f"; the same model on val: {b2_va:.4f}")
    ok &= b2_tr <= 3.57
    worst_ref = check_reference()
    print(f"  (d) vectorised scorer against the dict reference, worst |dlog2| over both "
          f"protocols: {worst_ref:.1e}" + ("" if worst_ref < 1e-9 else "  <-- FAIL"))
    ok &= worst_ref < 1e-9
    print("GATE 0: " + ("PASS" if ok else "FAIL"))
    return 0 if ok else 1


def check_reference(V=5, N=4, T=7, seed=3):
    """A dict implementation of interpolated modified KN, straight from the formulas, against
    the vectorised scorer at every position of a small random corpus, both protocols."""
    from collections import defaultdict
    rng = np.random.default_rng(seed)
    tr = rng.integers(0, V, 3000)
    te = rng.integers(0, V, 200)
    ids = [int(x) for x in tr]
    raw = {k: defaultdict(int) for k in range(1, N + 1)}
    for k in range(1, N + 1):
        for t in range(k - 1, len(ids)):
            raw[k][tuple(ids[t - k + 1:t + 1])] += 1
    cont = {}
    for k in range(1, N):
        c = defaultdict(int)
        for g in raw[k + 1]:
            c[g[1:]] += 1
        cont[k] = c

    def disc(cnts):
        return discounts(np.array(list(cnts.values())))

    D = {("raw", k): disc(raw[k]) for k in raw}
    D.update({("cont", k): disc(cont[k]) for k in cont})

    def prob(n, hist, w):
        m = min(n, len(hist) + 1)
        p = 1.0 / V
        for k in range(1, m + 1):
            tbl = raw[k] if k == m else cont[k]
            Dk = D[("raw", k)] if k == m else D[("cont", k)]
            h = tuple(hist[len(hist) - (k - 1):]) if k > 1 else ()
            tot = n1 = n2 = n3 = 0
            for g, c in tbl.items():
                if g[:-1] == h:
                    tot += c; n1 += c == 1; n2 += c == 2; n3 += c >= 3
            if tot == 0:
                continue
            c = tbl.get(h + (w,), 0)
            Dc = Dk[2] if c >= 3 else Dk[1] if c == 2 else Dk[0] if c == 1 else 0.0
            gamma = (Dk[0] * n1 + Dk[1] * n2 + Dk[2] * n3) / tot
            p = max(c - Dc, 0) / tot + gamma * p
        return p

    vec = fit(tr, N, V)
    worst = 0.0
    for proto in ["streaming", f"chunked:{T}"]:
        _, pos, bits = score_stream(vec, te, range(1, N + 1), proto, T)
        for n in range(1, N + 1):
            for i, t in enumerate(pos[:60]):
                Lh = int((t - 1) % T + 1) if proto.startswith("chunked") else int(t)
                hist = [int(x) for x in te[t - Lh:t]]
                worst = max(worst, abs(-np.log2(prob(n, hist, int(te[t]))) - bits[n][i]))
    return worst



# ----------------------------------------------------------------------------- table

def block_bootstrap_ci(diff, block, n_boot=1000, seed=0):
    """95% CI of the mean of a per-position difference, resampling blocks of `block`."""
    rng = np.random.default_rng(seed)
    n_blocks = diff.size // block
    blocks = diff[: n_blocks * block].reshape(n_blocks, block).mean(axis=1)
    idx = rng.integers(0, n_blocks, size=(n_boot, n_blocks))
    means = blocks[idx].mean(axis=1)
    return float(np.percentile(means, 2.5)), float(np.percentile(means, 97.5))


def run_table(args):
    d = args.run
    T = args.T
    protos = [f"chunked{T}", "streaming"]
    kn = {}
    for proto in protos:
        kn[proto] = {}
        for n in range(1, 11):
            f = os.path.join(d, f"ngram_{proto}_n{n}.npy")
            if os.path.exists(f):
                kn[proto][n] = np.load(f).astype(np.float64)
    nets = {}
    for name in [x for x in args.nets.split(",") if x]:
        nets[name] = {}
        for proto, suffix in ((f"chunked{T}", "chunked"), ("streaming", "streaming")):
            f = os.path.join(d, f"tinygpt_{name}_score_{suffix}.bin")
            if os.path.exists(f):
                nets[name][proto] = np.fromfile(f, dtype="<f4").astype(np.float64) / LN2
    V = 65
    rows = [("uniform", {p: np.log2(V) for p in protos})]
    for n in sorted(kn[protos[0]]):
        rows.append((f"KN n={n}", {p: float(kn[p][n].mean()) for p in protos if n in kn[p]}))
    for name, by in nets.items():
        rows.append((f"TinyGPT {name}", {p: float(v.mean()) for p, v in by.items()}))
    # the plateau under P2: the first order after which no later order improves by > 0.01
    orders = sorted(kn["streaming"])
    means = {n: float(kn["streaming"][n].mean()) for n in orders}
    plateau = orders[-1]
    for n in orders:
        if all(means[n] - means[m] <= 0.01 for m in orders if m > n):
            plateau = n
            break
    best = min(orders, key=lambda n: means[n])
    lines = [f"# the ladder under TinyGPT — {d}", "",
             f"| row | P1 chunked (T={T}) | P2 streaming |", "|---|---|---|"]
    for name, by in rows:
        c = by.get(protos[0]); st = by.get("streaming")
        lines.append(f"| {name} | {'' if c is None else f'{c:.4f}'} | {'' if st is None else f'{st:.4f}'} |")
    lines += ["", f"plateau (P2): order {plateau} at {means[plateau]:.4f} bits/char "
                  f"(best order {best} at {means[best]:.4f})"]
    for name, by in nets.items():
        if "streaming" in by:
            diff = by["streaming"] - kn["streaming"][best]
            n_common = min(diff.size, kn["streaming"][best].size)
            diff = by["streaming"][:n_common] - kn["streaming"][best][:n_common]
            lo, hi = block_bootstrap_ci(diff, T)
            lines.append(f"gap, TinyGPT {name} − KN n={best} (P2): {diff.mean():+.4f} bits/char, "
                         f"95% block-bootstrap CI [{lo:+.4f}, {hi:+.4f}] over {n_common:,} positions")
        if protos[0] in by:
            diff = by[protos[0]] - kn[protos[0]][best]
            lines.append(f"gap, TinyGPT {name} − KN n={best} (P1): {diff.mean():+.4f} bits/char; "
                         f"P1 − P2 for the net: {by[protos[0]].mean() - by['streaming'].mean():+.4f}"
                         if "streaming" in by else "")
    text = "\n".join(lines) + "\n"
    with open(os.path.join(d, "table.md"), "w") as f:
        f.write(text)
    with open(os.path.join(d, "table.csv"), "w", newline="") as f:
        w = csv.writer(f)
        w.writerow(["row"] + protos)
        for name, by in rows:
            w.writerow([name] + [by.get(p, "") for p in protos])
    # P1 loss against history length 1..T
    with open(os.path.join(d, "context_curve.csv"), "w", newline="") as f:
        w = csv.writer(f)
        cols = [f"KN n={n}" for n in orders] + [f"TinyGPT {k}" for k in nets if protos[0] in nets[k]]
        w.writerow(["history"] + cols)
        p1 = protos[0]
        n_full = kn[p1][orders[0]].size
        L = (np.arange(1, n_full + 1) - 1) % T + 1
        for h in range(1, T + 1):
            m = L == h
            vals = [float(kn[p1][n][m].mean()) for n in orders]
            vals += [float(nets[k][p1][:n_full][m[:nets[k][p1].size]].mean()) for k in nets if p1 in nets[k]]
            w.writerow([h] + [f"{v:.4f}" for v in vals])
    print(text)
    return 0

# ----------------------------------------------------------------------------- main

def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("mode", choices=["fit", "score", "check", "table"])
    ap.add_argument("--train", default="data/shakespeare/train.bin")
    ap.add_argument("--val", default="data/shakespeare/val.bin")
    ap.add_argument("--orders", type=int, default=10, help="highest order N (<= 10)")
    ap.add_argument("--vocab", type=int, default=0, help="V; 0 = max id + 1")
    ap.add_argument("--model", default=".lake/build/ngram_kn.npz")
    ap.add_argument("--protocol", default="streaming", help="chunked:T or streaming")
    ap.add_argument("--T", type=int, default=64, help="the window the streaming protocol starts after")
    ap.add_argument("--out", default="")
    ap.add_argument("--run", default="", help="table: the run folder holding the .npy and .bin files")
    ap.add_argument("--nets", default="nano", help="table: comma-separated net keys with score files")
    args = ap.parse_args()
    if args.orders > 10:
        sys.exit("orders > 10 overflow the int64 key")

    if args.mode == "check":
        return run_check(args)
    if args.mode == "table":
        return run_table(args)

    if args.mode == "fit":
        train = load_stream(args.train)
        V = args.vocab or int(train.max()) + 1
        model = fit(train, args.orders, V)
        out = args.out or args.model
        os.makedirs(os.path.dirname(out) or ".", exist_ok=True)
        save_model(model, out)
        print(f"fit: {train.size:,} tokens, V={V}, orders 1..{args.orders} -> {out}")
        for k in range(1, args.orders + 1):
            t = model["raw"][k]
            print(f"  order {k:2d}: {t['keys'].size:>9,} distinct grams, discounts "
                  f"{t['D'][0]:.3f} {t['D'][1]:.3f} {t['D'][2]:.3f}")
        return 0

    model = load_model(args.model)
    val = load_stream(args.val)
    orders = list(range(1, model["N"] + 1))
    tag, pos, bits = score_stream(model, val, orders, args.protocol, args.T)
    out_dir = args.out or "."
    os.makedirs(out_dir, exist_ok=True)
    rows = []
    print(f"{tag}: {pos.size:,} positions of {val.size:,}")
    for n in orders:
        b = float(bits[n].mean())
        rows.append((n, b, pos.size))
        np.save(os.path.join(out_dir, f"ngram_{tag}_n{n}.npy"), bits[n].astype(np.float32))
        print(f"  KN n={n:2d}: {b:.4f} bits/char")
    with open(os.path.join(out_dir, f"ngram_{tag}.csv"), "w", newline="") as f:
        w = csv.writer(f)
        w.writerow(["order", "bits_per_char", "positions"])
        w.writerows(rows)
    return 0


if __name__ == "__main__":
    sys.exit(main())
