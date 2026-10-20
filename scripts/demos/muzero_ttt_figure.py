"""The MuZero tic-tac-toe figure (planning/muzero_ttt_demo.md §8), one picture.

Left (the object itself): one position and a line of K moves played only inside the model —
at each step the true board, the board probe's readout of the imagined latent (cells the model
has lost track of marked), and f's policy over the cells with the solved game's optimal moves
ringed. Middle: policy agreement with the solved game (solid) and the value's sign (dashed) against
imagined depth k, on the agent's own lines, perfect play and random lines, AlphaZero's root
agreement as the horizontal reference, K marked. The lines that reach a deep k are the
longer games' endgames, so agreement can rise with k; the own-versus-random gap in the sign
is He et al.'s value-equivalence effect against an exact value. Right: r's recall of the winning moves and the refit probe's whole-board
accuracy against k.

Inputs:
  <score.csv>   lake exe muzero-ttt mode=score … (metric,source,k,split,count,value)
  <line.csv>    lake exe muzero-ttt mode=line start=<index> … (one row a step)

  python scripts/demos/muzero_ttt_figure.py <score.csv> <line.csv> out.png [K=5] [az_agree=0.9942] [n=4]
"""
import csv, sys
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
import matplotlib.gridspec as gridspec
from matplotlib.patches import Rectangle, Circle
import numpy as np

score_path, line_path = sys.argv[1], sys.argv[2]
out = sys.argv[3] if len(sys.argv) > 3 else "muzero_ttt.png"
K = int(sys.argv[4]) if len(sys.argv) > 4 else 5
az_agree = float(sys.argv[5]) if len(sys.argv) > 5 else 0.9942
OWN, PERF, RAND, INK, GREY, LOST, HEAT = "#5598e7", "#5aa46a", "#eb6834", "#14201a", "#8a938d", "#d1343c", "Blues"

with open(score_path) as f:
    score = list(csv.DictReader(f))
with open(line_path) as f:
    line = list(csv.DictReader(f))
n = int(round(len(line[0]["true_cells"]) ** 0.5))
nc = n * n

def series(metric, source, split="all"):
    pts = sorted((int(r["k"]), float(r["value"])) for r in score
                 if r["metric"] == metric and r["source"] == source and r["split"] == split)
    return [k for k, _ in pts], [v for _, v in pts]

steps = [r for r in line if r["past_end"] != "true"][: K + 1]
fig = plt.figure(figsize=(15, 4.6))
gs = gridspec.GridSpec(1, 3, width_ratios=[1.9, 1, 1], wspace=0.28)

# ── left: the line inside the model ──
axl = fig.add_subplot(gs[0])
axl.set_axis_off()
PITCH = n + 1.3
axl.set_xlim(-1.2, len(steps) * PITCH - 1.3)
axl.set_ylim(-1.9, 3 * (n + 0.6) + 0.9)
rows_y = {"true": 2 * (n + 0.6), "probe": n + 0.6, "policy": 0.0}

def draw_board(x0, y0, cells, lost=None, heat=None, optimal=()):
    for c in range(nc):
        i, j = divmod(c, n)
        x, y = x0 + j, y0 + (n - 1 - i)
        face = "white"
        if heat is not None:
            face = plt.get_cmap(HEAT)(0.1 + 0.85 * heat[c] / max(1e-9, max(heat)))
        axl.add_patch(Rectangle((x, y), 1, 1, facecolor=face, edgecolor=GREY, linewidth=0.6))
        if cells is not None and cells[c] != ".":
            axl.text(x + 0.5, y + 0.5, cells[c], ha="center", va="center", fontsize=11 if n == 4 else 13,
                     color=LOST if (lost is not None and lost[c]) else INK, fontweight="bold")
        if lost is not None and lost[c] and cells[c] == ".":
            axl.text(x + 0.5, y + 0.5, "?", ha="center", va="center", fontsize=10, color=LOST)
        if c in optimal:
            axl.add_patch(Circle((x + 0.5, y + 0.5), 0.42, fill=False, edgecolor=INK, linewidth=1.2))

for s_i, r in enumerate(steps):
    x0 = s_i * PITCH
    true_c, probe_c = r["true_cells"], r["probe_cells"]
    lost = [probe_c[c] != true_c[c] for c in range(nc)] if probe_c else None
    pol = [float(v) for v in r["policy"].split(";")]
    optimal = set(int(v) for v in r["optimal"].split(";") if v != "")
    draw_board(x0, rows_y["true"], true_c)
    draw_board(x0, rows_y["probe"], probe_c if probe_c else None, lost)
    draw_board(x0, rows_y["policy"], None, None, pol, optimal)
    k = int(r["k"])
    head = "the position" if k == 0 else f"k = {k}\n{'X' if r['mover'] == 'O' else 'O'} plays {steps[s_i - 1]['move']}"
    axl.text(x0 + n / 2, rows_y["true"] + n + 0.12, head, ha="center", va="bottom", fontsize=8, color=INK, linespacing=1.1)
    val = f"v {float(r['value']):+.2f}" + (f"\nr {float(r['reward']):+.2f}" if r["reward"] else "")
    if r["true_value"] != "":
        val += f"\nexact {int(r['true_value']):+d}"
    if r["terminal"] == "true":
        val += "\ngame over"
    axl.text(x0 + n / 2, -0.25, val, ha="center", va="top", fontsize=7, color=GREY, linespacing=1.1)
for key, label in [("true", "true"), ("probe", "probe"), ("policy", "policy")]:
    axl.text(-0.35, rows_y[key] + n / 2, label, ha="right", va="center", fontsize=8.5, color=INK, rotation=90)
axl.set_title(f"one line played inside the model ({n}×{n}; lost cells in red, optimal moves ringed)",
              fontsize=10, loc="left")

# ── middle: agreement against imagined depth ──
axm = fig.add_subplot(gs[1])
for src, col, lab in [("own", OWN, "the agent's own lines"), ("perfect", PERF, "perfect play"), ("random", RAND, "random legal lines")]:
    ks, vs = series("m3_agree", src)
    if ks:
        axm.plot(ks, [100 * v for v in vs], "-o", color=col, markersize=3.5, linewidth=1.4, label=lab)
    ks, vs = series("m3_sign", src)
    if ks:
        axm.plot(ks, [100 * v for v in vs], "--", color=col, linewidth=1.1)
axm.axhline(100 * az_agree, color=GREY, linestyle="-.", linewidth=1, label="AlphaZero, root")
axm.plot([], [], "-", color=INK, linewidth=1.4, label="policy agrees with the optimal set")
axm.plot([], [], "--", color=INK, linewidth=1.1, label="value has the exact sign")
axm.axvline(K, color=GREY, linestyle=":", linewidth=1)
axm.text(K + 0.1, axm.get_ylim()[0] + 1, "K", fontsize=8, color=GREY)
axm.set_xlabel("imagined moves k")
axm.set_ylabel("% of the lines' positions")
axm.set_title("f(gᵏ(h(s))) against the true position", fontsize=10, loc="left")
axm.legend(fontsize=7, frameon=False, loc="center", bbox_to_anchor=(0.56, 0.47))
axm.grid(alpha=0.25)

# ── right: the rules — terminal recall and the board, against depth ──
axr = fig.add_subplot(gs[2])
ks, vs = series("m4a_reward_recall", "random")
if ks:
    axr.plot(ks, [100 * v for v in vs], "-o", color=RAND, markersize=3.5, linewidth=1.4, label="r: winning moves called (random lines)")
ks, vs = series("m4a_reward_recall", "own")
if ks:
    axr.plot(ks, [100 * v for v in vs], "-o", color=OWN, markersize=3.5, linewidth=1.4, label="r: winning moves called (own lines)")
for src, col, lab in [("own", OWN, "probe: whole board right (own lines)"), ("random", RAND, "probe: whole board right (random lines)")]:
    ks, vs = series("m4d_gprobe_boards_heldout", src)
    if ks:
        axr.plot(ks, [100 * v for v in vs], "--s", color=col, markersize=3.5, linewidth=1.2, label=lab)
axr.axvline(K, color=GREY, linestyle=":", linewidth=1)
axr.set_xlabel("imagined moves k")
axr.set_ylabel("%")
axr.set_ylim(0, 102)
axr.set_title("does the model know the rules?", fontsize=10, loc="left")
axr.legend(fontsize=7, frameon=False, loc="lower left")
axr.grid(alpha=0.25)

fig.savefig(out, dpi=150, bbox_inches="tight")
print("wrote", out)
