# 2026-10-20 — MuZero tic-tac-toe, 4×4, Phase 4 (`planning/muzero_ttt_demo.md` §9)

The demo's first runs on XLA (CUDA, one RTX 4060 Ti a run; no lowerer env, the defaults). Phases 1–3
ran on IREE llvm-cpu on the build box (`runs/2026-10-16-muzero-ttt/`). Binary: branch `muzero-ttt`
at 82371542 (+ the `scoreN=` knob below for `mode=score`), a copy per run.

## The XLA path, gated at 3×3 first

| log | what | result |
|---|---|---|
| `n3_xla_smoke.log` | one iteration, 3×3, 50 sims, 300 steps | 14.2 s: play 0.7 / train 8.0 / score 0.9 s (IREE CPU: 5.8 min). Iteration 0 equals the CPU baseline (sweep 61.64%, sign 23.47%); iteration 1 diverges (self-play on different low-order bits) |
| `n3_xla_oracle_gate.log` | §5 oracle gate, trained AlphaZero net | 4520 / 4520 exact at sims 2–6; 4489 at 25 (max L1 0.25); 4.7 s |
| `n3_xla_unroll_gate.log` | §4 unroll gate, XLA default and `NVIDIA_TF32_OVERRIDE=0` | losses to 5e-5 and the ½ check pass; ∂θ at 2.0e-4 (h) / 2.4e-4 (g) / 2.1e-4 (f) / 6.6e-4 (r) relative, over the 1e-5 tolerance, the same with the override — the TF32 level every XLA-vs-reference tie in the repo sits at (IREE CPU: ≤ 7.4e-7) |
| `n4_xla_smoke.log` | one iteration, 4×4, `sweepN=20000` | preamble 185 s (the dihedral symmetry check over 9,062,619 positions, single-threaded Lean), then play 1.3 / train 8.3 / score 2.1 s = 11.6 s an iteration; 60 iterations ≈ 15 min a run (the plan's estimate: ~1 h; CPU: 25–27 min an iteration) |

A train step is 27.6 ms for 38 calls (17 forwards, 17 VJPs, 4 Adam applies) — 0.7 ms a call, launch
and copy overhead on 140,826 parameters, the same at 3×3 and 4×4. Self-play is ~0.5 ms a call. The
net's FLOPs are nowhere in it.

## `mode=score` at 4×4: `scoreN=`

M1 plays its games and M2 sweeps every decision position whatever `scoreN` says; M3–M5 (imagined
lines, the probes, the principal lines, the blunders, the transpositions) start from every
⌈9,062,619 / scoreN⌉-th decision position, the same stride sample `sweepN=` uses in training.
`n3_xla_smoke3_scoreN_test.log`: the 3×3 smoke net scored with `scoreN=1000` and without.

## `mode=line` and the figure (`lines/`, `scripts/demos/muzero_ttt_figure.py`)

`mode=line start=<index>[,…] [src=own|perfect|random] [moves=…] [lineN=20000]` walks one or more
starts through a line imagined inside the model and prints, per step, the true board, the board
probe's readout of the latent, f's policy and value, r's reward and the exact value and optimal
set of the true position. The depth-0 probe is fit on h over `lineN` sampled decision positions,
the depth-k probe is the scorer's refit on gᵏ latents along `src` lines from the same sample
(2·D boards needed on the fit side: `lineN=0` at 3×3). 3.7 min at 4×4, nearly all of it the
preamble and the probe fits, so `start=` takes a list. The figure script reads a score CSV and
a line CSV: left the line, middle M3's agreement and value sign against k, right M4a's recall
and the refit probe's whole-board accuracy against k. `lines/…_line158436.log`: arm 1's net on
the agent's own line from X,X / O,O in the middle rows — the probe reads every cell through
k = 5 on that line (the population average at k = 5: 11% of whole boards).

**The figure's line** (`lines/random/…init301…_line139986.csv`, init 301's net, a random line
from `..O....X.XO.....`): the probe reads every cell through k = 4, then at k = 5 three phantom
O stones, and the value −0.12 where the exact value is −1. On that net the refit probe, own
lines, held out by board, reads 99.8% / 99.7% / 99.7% of whole boards at k = 1 / 2 / 3 (arm 1's
60-iteration net: 85.6% / 53.9% / 29.7%), random lines 94.0% / 79.2% / 69.5%. As at 3×3: the
better the net, the more of the board g keeps, and it keeps it best on the lines it plays.

## The arms (`launch_arms.sh`)

The 3×3 winner — raw Q, 50-sim self-play, 300 steps an iteration — across three fresh inits, 60
iterations, `sweepN=20000`, one card each:

| log | init / play seed | iters | steps | wall | final f∘h sweep (20k) agree / sign | final vs perfect, net alone X, O | +search X, O | unbeaten iterations (search), first |
|---|---|---|---|---|---|---|---|---|
| `n4_run1_q0_sims50_init101_s1.log` | 101 / 1 | 60 | 300 | 16.0 min | 91.81% / 83.86% | 0/254/2, 0/241/15 | **0/256/0**, 0/250/6 | 0 / 61 |
| `n4_run2_q0_sims50_init101_s1_it120.log` | 101 / 1 | 120 | 300 | 25.9 min | 98.59% / 90.62% | **0/256/0**, **0/256/0** | **0/256/0**, **0/256/0** | 47 / 121, iteration 67 |
| `n4_run2_q0_sims50_init201_s2_it120.log` | 201 / 2 | 120 | 300 | 25.8 min | 98.26% / 89.78% | **0/256/0**, **0/256/0** | **0/256/0**, **0/256/0** | 39 / 121, iteration 75 |
| `n4_run2_q0_sims50_init301_s3_it120.log` | 301 / 3 | 120 | 300 | 27.1 min | 98.76% / 92.21% | **0/256/0**, **0/256/0** | **0/256/0**, **0/256/0** | 50 / 121, iteration 66 |
| `n4_run2_q0_sims50_steps600_init101_s1_it120.log` | 101 / 1 | 120 | 600 | 39.6 min | 99.10% / 92.98% | 0/256/0, 0/256/0 | 0/256/0, 0/256/0 | 67 / 121, iteration 46 |

The first arm's curve: root agreement flat at 62–66% through iteration 40 (value MSE falling
0.57 → 0.20, sign 30% → 70%), 73% at 50, **92% at 60** — the take-off the 3×3 arms had at
iterations 28–40 comes at 50–60 here, and the arm was still climbing when it stopped, six O
losses short of Gate B. Hence the 120-iteration arms; the 600-step arm is the budget question
(each 300-step iteration covers a quarter of the 20-iteration window's ~73k samples, half at 3×3).
Self-play stood at 108,363 of the 9,062,619 decision positions after 60 iterations (AlphaZero's
4×4 run: 108,483 after 40).

## Gate B (`gate_b/`, `score_arm.sh <tag> <sims> [gpu] [scoreN]`)

`mode=score` on a finished arm's net: 256 games a side vs perfect and random, net alone and at
`sims`; M2 over all 9,062,619 decision positions; M3–M5 from every 454th (`scoreN=20000`).
5.4 min a score on one card. Each 120-iteration arm is scored at 25 and 100 sims on its own card
as soon as it exits. A scorer or line dump shares a card with a training arm at
`LEAN_MLIR_MEM_FRACTION=0.15` (the nets are 140k parameters; the default 0.75 pool is the cost).

## 3×3 on XLA (`n3_xla_run5_*.log`, `n3_final/`)

The CPU box's passing 3×3 recipe (50 sims, 300 steps, 60 iterations) on three fresh inits,
each sharing a card with a 4×4 arm at `LEAN_MLIR_MEM_FRACTION=0.15`: 10.0–10.4 min a run
against 5.9–6.3 h on the CPU box. The final nets scored by `mode=score` (25 sims, seed 11):

| init / seed | wall | unbeaten iterations (search) | M2 agree / sign | net alone X, O | 25 sims X, O | g probe, own lines, boards k = 1 / 2 | r recall / false | search-only blunders, phantom win |
|---|---|---|---|---|---|---|---|---|
| 101 / 1 | 10.0 min | 4 / 61 | 96.55% / 80.11% | 0/256/0, 0/256/0 | 0/256/0, 0/246/10 | 98.2% / 90.4% | 88.07% / 0.66% | 51, 35% |
| 201 / 2 | 10.3 min | 21 / 61 | 96.90% / 88.41% | 0/256/0, 0/256/0 | **0/256/0, 0/256/0** | 94.0% / 79.9% | 92.99% / 3.32% | 23, 30% |
| 301 / 3 | 10.4 min | 24 / 61 | 96.59% / 87.28% | 0/256/0, 0/256/0 | 0/256/0, 0/249/7 | 95.7% / 89.1% | 97.45% / 1.77% | 16, 50% |

Alone 3 / 3, with search 1 / 3 at the final net (the CPU box's inits 101 / 201 / 301: 3 / 3 and
3 / 3, with 18 / 25 / 34 unbeaten iterations). Same recipe, same inits; the trajectories differ
from the first self-play game on (XLA's TF32 convolutions), and the CPU study's finding that the
final net's search losses sit within seed spread holds here too. The instrument reads the same
picture: the refit probe holds 94–98% of whole boards at one imagined move and 80–90% at two,
and a third to a half of the search-only blunders carry a phantom win on the line.

**The 120-iteration nets, three evaluation seeds (11–13) pooled at 25 sims, seed 11 at 100
(`scripts/demos/muzero_ttt_table.py gate_b <tag>`):**

| net | M2 all / sign | M3 at k = 5, own · perfect · random | M4a recall (one move) | net alone X · O | 25 sims X · O | 100 sims X · O |
|---|---|---|---|---|---|---|
| init 101, 300 steps | 98.57% / 90.54% | 100.0 · 99.9 · 94.3% | 99.55% | **0/768/0 · 0/768/0** | **0/768/0 · 0/768/0** | **0/256/0 · 0/256/0** |
| init 201, 300 steps | 98.18% / 89.58% | 100.0 · 99.9 · 96.2% | 96.66% | **0/768/0 · 0/768/0** | **0/768/0 · 0/768/0** | **0/256/0 · 0/256/0** |
| init 301, 300 steps | **98.74% / 92.25%** | 100.0 · 99.9 · 92.9% | 99.51% | **0/768/0 · 0/768/0** | **0/768/0 · 0/768/0** | **0/256/0 · 0/256/0** |
| init 101, 600 steps | **99.08% / 92.98%** | 100.0 · 100.0 · 93.4% | 100.00% | 0/768/0 · 0/767/1 | **0/768/0 · 0/768/0** | **0/256/0 · 0/256/0** |

**Gate B passes on every 300-step initialisation** — unbeaten both sides alone and with 25 and
100 simulations on the scorer's own games; the book's table and figure use init 301's net, the
best root agreement of the three. The 600-step budget arm has the best sweep of all and drops
one game alone as O. AlphaZero's 4×4 net: 99.42% / 95.57%.

**Arm 1's net (60 iterations), `gate_b/final_run1_q0_sims50_init101_s1_sims25_seed11.log`:**

| | as X | as O |
|---|---|---|
| net alone vs perfect | 0/252/4 | 0/243/13 |
| 25 sims vs perfect | 0/254/2 | 0/247/9 |
| net alone vs random | 229/27/0 | 218/37/1 |
| 25 sims vs random | 245/11/0 | 232/24/0 |

Gate B not met (it needs 0 losses both sides with search). M2 over all 9,062,619 decision
positions: agree **92.11%**, value MSE 0.1334, sign 83.67% (visited 96.84% / 89.90% on the
108,363 self-play stood at — 1.2% of the game; unvisited 92.06% / 83.59%). AlphaZero's 4×4 net:
99.42% / 95.57%.

The instrument at 4×4 (19,961 sampled starts, lines of up to 10 moves):

- **M3.** Policy agreement along imagined lines stays ≥ 89% to the end of the game on every
  source and rises with k (the lines that continue are the longer, simpler endgames); value
  sign on own lines 85% at k = 1 → 96% at k = 5, on random lines 73% → 70% — He et al.'s gap,
  exact, at 4×4 as at 3×3.
- **M4a.** r calls 95.88% of the winning moves at one move and 0.03% of the others; along
  random lines recall falls 95% → 50% at k = 5 → 33% at k = 8.
- **M4b.** 0.51% of the 25-sim principal lines pass through a taken cell; 47.78% run past the
  true end of the game.
- **M4c.** Transposed move orders land 1.37 apart, against 3.66 from h of the same board and
  3.97 between different boards; value sign from the imagined states 93% (h of the board 97%).
- **M4d.** The h-fit probe reads every held-out position (100% / 100%) and only ~55% of g's
  cells at any depth. **Refit on g's own latents** (own lines, held out by board, cells / whole
  boards): k = 1 99.0% / 85.6%, k = 2 95.6% / 53.9%, k = 3 91.7% / 29.7%, k = 4 88.5% / 16.2%,
  k = 5 86.5% / 11.3% (random lines 98.7% / 82.0% at k = 1, 85.7% / 8.5% at k = 5). At 3×3 the
  same probe held 95.5% of boards at k = 1 and 85.6% at k = 2: with 16 cells the board leaves
  the latent faster.
- **Blunders.** 90 of the 19,961 starts where the 25-sim search errs and the net alone does
  not; a phantom win for the mover on 8.9% of those lines against 0.4% elsewhere (3×3: 36% /
  1.4%).
