"""The MuZero tic-tac-toe table rows (planning/muzero_ttt_demo.md §7) from a run directory's
score logs and CSVs: per net, root agreement (M2, every decision position), imagined-line policy
agreement at k = K on the agent's own and on random lines (M3), r's recall of the winning moves at
one move (M4a, every legal move from every scored start), and W/D/L vs the perfect player as X and
as O, net alone and with search, pooled over every `mode=score` log of the net at `sims`.

  python scripts/demos/muzero_ttt_table.py <dir-with-logs> <net tag> [sims=25] [K=5]
"""
import csv, glob, re, sys

d, tag = sys.argv[1], sys.argv[2]
sims = int(sys.argv[3]) if len(sys.argv) > 3 else 25
K = int(sys.argv[4]) if len(sys.argv) > 4 else 5
logs = sorted(glob.glob(f"{d}/final_{tag}_sims{sims}_seed*.log"))
wdl = {"alone": [[0, 0, 0], [0, 0, 0]], "search": [[0, 0, 0], [0, 0, 0]]}
m2 = None
for lg in logs:
    txt = open(lg).read()
    for kind, pat in [("alone", r"net alone: as X (\d+)/(\d+)/(\d+), as O (\d+)/(\d+)/(\d+)"),
                      ("search", rf"search {sims}: as X (\d+)/(\d+)/(\d+), as O (\d+)/(\d+)/(\d+)")]:
        m = re.search(r"M1 vs perfect, " + pat, txt)
        if m:
            v = list(map(int, m.groups()))
            for i in range(3):
                wdl[kind][0][i] += v[i]; wdl[kind][1][i] += v[3 + i]
    m = re.search(r"M2 f∘h, all \((\d+)\): agree ([\d.]+)%  value mse ([\d.]+)  sign ([\d.]+)%", txt)
    if m and m2 is None:
        m2 = (int(m.group(1)), float(m.group(2)), float(m.group(4)))
csvs = sorted(glob.glob(f"{d}/final_{tag}_sims{sims}_seed11.csv"))
m3 = {}
m4a = None
if csvs:
    rows = list(csv.DictReader(open(csvs[0])))
    for r in rows:
        if r["metric"] == "m3_agree" and r["split"] == "all" and int(r["k"]) == K:
            m3[r["source"]] = float(r["value"])
        if r["metric"] == "m4a_reward_recall_every_move":
            pass
    recall = [r for r in rows if r["metric"] == "m4a_reward_recall_every_move"]
    if recall:
        n = sum(int(r["count"]) for r in recall)
        m4a = sum(int(r["count"]) * float(r["value"]) for r in recall) / n if n else None
def s(w): return f"{w[0]}/{w[1]}/{w[2]}"
print(f"net {tag}: {len(logs)} score log(s) at {sims} sims pooled")
if m2: print(f"  M2 root agreement {m2[1]:.2f}% / sign {m2[2]:.2f}% over {m2[0]:,} decision positions")
if m3: print(f"  M3 at k = {K}: own {100*m3.get('own', float('nan')):.1f}%  perfect {100*m3.get('perfect', float('nan')):.1f}%  random {100*m3.get('random', float('nan')):.1f}%")
if m4a is not None: print(f"  M4a winning moves called at one move: {100*m4a:.2f}%")
print(f"  net alone vs perfect:  X {s(wdl['alone'][0])}  O {s(wdl['alone'][1])}")
print(f"  + latent search ({sims}): X {s(wdl['search'][0])}  O {s(wdl['search'][1])}")
