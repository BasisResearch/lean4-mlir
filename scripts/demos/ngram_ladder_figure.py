#!/usr/bin/env python3
"""The ladder figure — planning/tinygpt_ngram_ladder.md §7.

  python scripts/demos/ngram_ladder_figure.py <run dir> <out.png> [--T 64] [--nets nano]

(a) bits/char against n-gram order under P2 (streaming), with each transformer as a
    horizontal line and the trained dense bigram's 3.56 as a point (that number is a
    train loss; it is drawn hollow);
(b) P1 (chunked) loss against history length 1..T, the plateau order's n-gram and each
    transformer on one axis — where in the window the transformer earns or loses its gap;
(c) the per-position difference transformer − KN along a stretch of val, with the text.

Reads table.csv, context_curve.csv, ngram_streaming_n<k>.npy, tinygpt_<net>_score_streaming.bin
and data/shakespeare/{val.bin,vocab.txt} (for the text in panel c).
"""
import argparse
import csv
import os

import numpy as np
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt

LN2 = np.log(2.0)


def read_csv(path):
    with open(path) as f:
        rows = list(csv.reader(f))
    return rows[0], rows[1:]


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("run")
    ap.add_argument("out")
    ap.add_argument("--T", type=int, default=64)
    ap.add_argument("--nets", default="nano")
    ap.add_argument("--stretch", type=int, default=90, help="panel c: characters shown")
    ap.add_argument("--start", type=int, default=20000, help="panel c: first stream position")
    args = ap.parse_args()
    d, T = args.run, args.T
    nets = [x for x in args.nets.split(",") if x]

    hdr, rows = read_csv(os.path.join(d, "table.csv"))
    p2 = {r[0]: float(r[2]) for r in rows if r[2]}
    p1 = {r[0]: float(r[1]) for r in rows if r[1]}
    orders = sorted(int(k.split("=")[1]) for k in p2 if k.startswith("KN n="))
    ladder = [p2[f"KN n={n}"] for n in orders]
    best = orders[int(np.argmin(ladder))]

    chdr, crows = read_csv(os.path.join(d, "context_curve.csv"))
    curve = {name: np.array([float(r[i]) for r in crows]) for i, name in enumerate(chdr) if i}
    hist = np.array([int(r[0]) for r in crows])

    fig, axes = plt.subplots(1, 3, figsize=(15, 4.2), gridspec_kw=dict(width_ratios=[1, 1, 1.3]))

    ax = axes[0]
    ax.plot(orders, ladder, "o-", color="#444", label="Kneser-Ney n-gram (P2)")
    ax.plot([2], [3.56], "o", mfc="none", color="#444", label="dense bigram, train loss")
    colors = ["#c0392b", "#2980b9", "#27ae60"]
    for i, net in enumerate(nets):
        key = f"TinyGPT {net}"
        if key in p2:
            ax.axhline(p2[key], color=colors[i % 3], ls="--", label=f"{key} (P2)")
    ax.axhline(p2["uniform"], color="#aaa", ls=":", label="uniform")
    ax.set_xlabel("n-gram order n")
    ax.set_ylabel("bits/char, val")
    ax.set_xticks(orders)
    ax.set_title("(a) the ladder, streaming")
    ax.legend(fontsize=8, loc="upper right")

    ax = axes[1]
    ax.plot(hist, curve[f"KN n={best}"], color="#444", label=f"KN n={best}")
    for i, net in enumerate(nets):
        key = f"TinyGPT {net}"
        if key in curve:
            ax.plot(hist, curve[key], color=colors[i % 3], label=key)
    ax.set_xlabel("history length (characters before the target, within the chunk)")
    ax.set_ylabel("bits/char at that history")
    ax.set_title(f"(b) chunked (T={T}): loss against history")
    ax.legend(fontsize=8)

    ax = axes[2]
    kn = np.load(os.path.join(d, f"ngram_streaming_n{best}.npy")).astype(np.float64)
    net = nets[0]
    f = os.path.join(d, f"tinygpt_{net}_score_streaming.bin")
    if os.path.exists(f):
        tr = np.fromfile(f, dtype="<f4").astype(np.float64) / LN2
        n = min(tr.size, kn.size)
        s0, L = args.start, args.stretch
        diff = tr[s0:s0 + L] - kn[s0:s0 + L]
        pos = np.arange(s0, s0 + L) + T                   # stream positions of these targets
        val = np.fromfile("data/shakespeare/val.bin", dtype="<i4")
        vocab = {}
        with open("data/shakespeare/vocab.txt") as vf:
            for line in vf:
                i, b, _ = line.rstrip("\n").split("\t", 2)
                vocab[int(i)] = chr(int(b))
        text = "".join(vocab.get(int(v), "?") for v in val[pos])
        ax.bar(np.arange(L), diff, color=np.where(diff < 0, "#2980b9", "#c0392b"), width=1.0)
        ax.axhline(0, color="#444", lw=0.8)
        ax.set_xlim(-0.5, L - 0.5)
        ax.set_xticks(np.arange(L))
        ax.set_xticklabels([c if c != "\n" else "⏎" for c in text], fontsize=7, family="monospace")
        ax.set_ylabel(f"bits: TinyGPT {net} − KN n={best}")
        ax.set_xlabel(f"val positions {pos[0]}–{pos[-1]}")
        ax.set_title("(c) per character (blue: the transformer wins)")
    else:
        ax.set_axis_off()
        ax.text(0.5, 0.5, "no transformer score file", ha="center")

    fig.tight_layout()
    fig.savefig(args.out, dpi=160)
    print("wrote", args.out)


if __name__ == "__main__":
    main()
