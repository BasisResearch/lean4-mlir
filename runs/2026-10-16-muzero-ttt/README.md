# 2026-10-16 — MuZero tic-tac-toe, 3×3, Phase 3 (`planning/muzero_ttt_demo.md` §9)

All on CPU: IREE `llvm-cpu`, `IREE_DEVICE=local-sync`, up to eight runs side by side on the
88-core build box. Every arm: C 32, K 5, 256 games an iteration at 25 sims (unless noted),
batch 64, lr 1e-3, a 20-iteration window, dihedral views, seed 1 unless noted.

```
lake build muzero-ttt
# a copy per run, so a rebuild never relinks a running binary
.lake/build/bin/muzero-ttt iters=60 steps=300 qnorm=0 sims=50 seed=1 tag=run3_q0_sims50_s1
.lake/build/bin/muzero-ttt mode=score qnorm=0 sims=25 seed=11 params=<prefix>_params.bin
```

`seed=` drives self-play, the Dirichlet noise and batch sampling; the four nets' He init is
fixed (seeds 11–14 in `main`) whatever `seed=` says, so "seed 2" is a different run of
play and sampling from the same initial weights. `initSeed=` (added after the run3 / run4
arms, default 11 = their init) moves it; the run5 arms use it.

`qnorm=1` is the paper's min–max-normalized Q in the search (unvisited children 0); `qnorm=0`
is the raw mean, AlphaZero's. `steps=` fixes the train steps an iteration (0 is AlphaZero's
epochs-over-the-window schedule). Each training log prints, every iteration, M2 (f ∘ h over
the 4520 decision positions) and M1 (256 games each side vs perfect, net alone and with
25-sim search).

## The arms

| log | knobs | iters | wall | O vs perfect +search, unbeaten iterations | final O +search W/D/L |
|---|---|---|---|---|---|
| `n3_run3_q0_sims50_s1` | raw Q, 50 sims | 60 | 6.3 h | **19 / 61** | **0/256/0** |
| `n3_run3_q0_steps600_s1` | raw Q, 600 steps | 60 | 9.0 h | 11 / 61 | **0/256/0** |
| `n3_run3_q0_temp3_s1` | raw Q, tempPlies=3 | 60 | 5.2 h | 4 / 61 | 0/250/6 |
| `n3_run3_q0_s1` | raw Q | 60 | 6.0 h | 1 / 61 | 0/236/20 |
| `n3_run3_q1_s1` | normalized Q | 60 | 6.2 h | 0 / 61 | 0/103/153 |
| `n3_run3_q0_s2` | raw Q, seed 2 | 60 | 11.6 h | 0 / 61 | 0/180/76 |
| `n3_run3_q1_s2` | normalized Q, seed 2 | 60 | 11.2 h | 0 / 61 | 0/191/65 |
| `n3_run1_s1` | normalized Q, AlphaZero's schedule | 20 | 22.0 h | 0 / 21 | 0/56/200 |
| `n3_run4_q0_sims50_steps300_s2` | raw Q, 50 sims, seed 2 | 60 | 5.9 h | 12 / 61 | **0/256/0** |
| `n3_run4_q0_sims50_steps300_s3` | raw Q, 50 sims, seed 3 | 60 | 6.5 h | 11 / 61 | 0/247/9 |
| `n3_run5_q0_sims50_init101_s1` | raw Q, 50 sims, init 101 | 60 | 6.3 h | 18 / 61 | **0/256/0** |
| `n3_run5_q0_sims50_init201_s2` | raw Q, 50 sims, init 201 | 60 | 5.9 h | 25 / 61 | **0/256/0** |
| `n3_run5_q0_sims50_init301_s3` | raw Q, 50 sims, init 301 | 60 | 6.3 h | 34 / 61 | **0/256/0** |
| `n3_run4_q0_sims50_steps600_s2` | raw Q, 50 sims, 600 steps, seed 2 | 60 | 10.1 h | **27 / 61** | **0/256/0** |

As X every arm is unbeaten with search from about iteration 10. O is the whole story.

## Gate A — passes on two seed-1 arms at the training budget (25 sims); replication below

`gate_a_final/`: the sims-50 arm's iteration-60 net (`*_params.bin`, not tracked) scored by
`mode=score`. 256 games each side, the perfect player breaking ties at random:

| search | as X | as O |
|---|---|---|
| net alone | 0/256/0 | 0/256/0 |
| 25 sims (seeds 11, 12) | 0/256/0 | 0/256/0 |
| 50 sims | 0/256/0 | 0/256/0 |
| 100 sims | 0/256/0 | 0/256/0 |

The 600-step arm's iteration-60 net (`gate_a_final/final_run3_q0_steps600_*`): unbeaten
alone and at 25 sims (seeds 11, 12), but 0/249/7 as O at 50 sims and 0/254/2 at 100. Its
M2 is 93.63% / sign 76.35%; its search errs alone at 156 starts (25 sims), against 28 for
the sims-50 net — the weaker value head leaves less margin for the search.

`gate_a_iter50/`: the sims-50 arm's iteration-50 net — unbeaten at 25 sims (3 seeds) and 50
sims (2 seeds), but **0/246/10 as O at 100 sims**.

Not robust yet: the arm's own per-iteration check still drops O games at 3 of iterations
35–50, the other seed-1 arms pass at a few iterations at most, and both seed-2 arms (at the
default 25 sims, 300 steps) end at 65–76 O losses. At 50 sims, seeds 2 and 3 pass at 12
and 11 iterations; seed 2's final net passes the gate and seed 3's does not (below).

## The 50-sim arm on seeds 2 and 3 (`gate_a_seeds/`)

The final nets of `n3_run4_q0_sims50_steps300_s{2,3}`, scored as above (as O vs perfect;
every net is 0/256/0 as X at every setting):

| seed | net alone | 25 sims (seeds 11, 12) | 100 sims | M2 agree / sign | r false calls | search-only errors with a false win for the mover (25 sims) |
|---|---|---|---|---|---|---|
| 1 | 0/256/0 | 0/256/0, 0/256/0 | 0/256/0 | 96.26% / 84.76% | 1.88% | 36% of 28 |
| 2 | 0/256/0 | 0/256/0, 0/256/0 | 0/256/0 | 96.33% / 82.90% | 1.64% | 29% of 42 |
| 3 | 0/256/0 | 0/247/9, 0/245/11 | 0/247/9 | 95.66% / 78.67% | 4.31% | 42% of 45 |

The best net of the study is the 50-sim, **600-step** arm on seed 2
(`gate_a_seeds/final_run4_q0_sims50_steps600_s2_*`): unbeaten alone and at 25 (two seeds)
and 100 sims; M2 **97.79%** / sign 90.77% (visited 98.80% / 94.01%) — past AlphaZero's
97.30% root agreement, short of its 99.42% sign; r recall 96.05%, false calls 1.20%; 13
search-only errors at 25 sims. Its g probe (own lines, whole boards) is 98.2% at k = 1 and
92.1% at k = 2 — across the nets scored, the better the net, the more of the board g keeps.

**Fresh inits** (`initSeed=` 101 / 201 / 301, play seeds 1 / 2 / 3, `n3_run5_*`): all three
final nets unbeaten both sides alone, at 25 sims (seeds 11, 12) and at 100 sims. M2 96.90 /
96.88 / 96.79%, sign 81.3 / 85.3 / 84.2%; r false calls 5.06 / 3.62 / 3.39%; g probe (own
lines, whole boards) 96.4 / 94.8 / 94.5% at k = 1 and 87.2 / 77.1 / 85.2% at k = 2.

**Tally, 50-sim self-play, 300 steps, final net:** unbeaten alone 6 / 6, with search 5 / 6
(the shared-init seed 3 drops 9–11 O games). The 600-step arm makes 7 / 7 alone, 6 / 7 with search.

The shared-init seeds alone: with search, two of three. Seed 3's
search losses come with the highest reward false-call rate of the three (4.31%), and at 100
sims 54% of its search-only errors have a false win for the mover on the line against 4.2%
elsewhere. At 25 sims in self-play (seed 2, both Q variants) no iteration passes at all, so
the 50-sim self-play is what carries the gate. The g probe repeats on both seeds (own lines,
whole boards at k = 1: 95.9% seed 2, 92.5% seed 3).

## M2–M5 on the Gate-A net (`gate_a_final/final_*_sims25_seed11.log`)

- **M2.** Root agreement 96.26% (visited 97.60% / unvisited 93.53%); value sign 84.76%
  (88.21% / 77.68%). AlphaZero's 3×3 net: 97.30% / 99.42%. Self-play stood at 3037 of the
  4520 decision positions.
- **M3, imagined lines.** Policy agreement holds along every source to the end of the game
  (own 96–100%, perfect 97–100%, random 89–95% at k = 1 … 5). Value sign does not: on own
  lines 86–99%, on random lines 74% at k = 1 falling to 62% at k = 5 (visited starts) and
  43–57% unvisited — He et al.'s gap, against the exact value.
- **M4a, rewards.** Winning moves called 93.31%, non-winning moves called wins 1.88%
  (visited starts 97.0% / 1.3%, unvisited 86.9% / 3.2%). Along random lines recall falls
  from 91% at k = 1 to 51% at k = 5.
- **M4b.** 2.0% of the 25-sim search's principal lines pass through a taken cell; 94% run
  past the true end of the game (the absorbing states are trained to z = 0, u = 0).
- **M4c.** Transposed move orders (a b c / c b a): latent distance 1.82, against 3.40 from
  h of the same board and 3.75 between two different boards; value sign 84% from the
  imagined states, 96% from h of the board.
- **M4d, the board probe.** A ridge readout fit on h's latents recovers every cell of
  every held-out position (100% / 100%). Applied unchanged to g's latents it recovers 84%
  of cells and 25% of whole boards after one imagined move (67% / 7% on random lines at
  k = 5). **Refit on g's own latents** at each depth, held out by board
  (`gate_a_final/gprobe_*.log`), cells / whole boards:

  | lines | k = 1 | k = 2 | k = 3 |
  |---|---|---|---|
  | own | 99.5% / 95.5% | 98.1% / 85.6% | (too few boards to fit) |
  | perfect | 99.1% / 92.7% | 96.3% / 75.1% | |
  | random | 99.1% / 92.8% | 95.1% / 68.3% | 91.7% / 50.8% |

So, at 3×3: **g keeps the board, in its own encoding, and loses it with depth.** After one
imagined move the board is linearly decodable almost exactly; the h-fit probe's drop is
mostly g's latent sitting in a different place from h's (M4c says the same: a transposed
line lands 3.4 from h of its board). By two moves whole boards fall to 69–86%, faster off
the agent's own lines. The fit set shrinks with k (≈ 1100 boards at k = 1, ≈ 650 at k = 2; D = 288), so the same
probe refit on exactly 600 boards at every depth (`gprobe_fit600_lambda1.log`, `gprobe_fit600_lambda10.log`, whole boards, λ = 1):

| lines | k = 1 | k = 2 | k = 3 |
|---|---|---|---|
| own | 93.0% | 85.0% | |
| perfect | 88.8% | 73.4% | |
| random | 64.3% | 63.6% | 47.7% |

At equal fit the fall from k = 1 to k = 2 holds on own and perfect lines; on random lines
most of the full-fit k = 1 figure was the larger fit (92.8% → 64.3%), and the fall comes at
k = 3. λ = 10 is worse everywhere, so the probe is short of data, not overfit: every figure
here is a lower bound on what g holds. The value-equivalent prediction ("values, not the
board") does not hold at one move; on the agent's own lines the board is nearly all there.

## Why more search can lose — the blunder diagnostic (`blunders/`)

`mode=score` now also finds every decision position where the search's move is not optimal
while the net alone's is, replays the search's principal line inside the model and asks
whether r calls a win there that the true board does not have (a non-winning move, a
taken cell, or a move past the end):

| net | sims | search-only blunders | phantom win for the mover on the line | at every other start |
|---|---|---|---|---|
| sims-50 arm, iter 50 | 25 | 42 | 40% | 2.4% |
| sims-50 arm, iter 50 | 100 | 62 | 50% | 3.2% |
| sims-50 arm, iter 60 | 25 | 28 | 36% | 1.4% |
| sims-50 arm, iter 60 | 100 | 45 | 53% | 1.7% |
| normalized Q, seed 1, final | 25 | 173 | 18% | 6.6% |

A search error is 15–30× likelier than a typical start to have a false win for the mover on
its line: the search exploits the reward model's mistakes, and more simulations find more
of them. About half the errors have none; the normalized-Q net's errors are mostly elsewhere
(its value head and latents are worse: 19% of its lines through a taken cell, transposed
pairs farther apart than different boards).

## Findings so far

- **Raw Q vs the paper's normalized Q is a seed-1 result only**: 0/236/20 vs 0/103/153 as
  O at iteration 60 on seed 1, 0/180/76 vs 0/191/65 on seed 2 (a tie). Seed 2's two arms
  never pass an iteration; the seed-to-seed spread is larger than the Q-normalization
  effect.
- **More search in self-play (50 sims) and more steps an iteration (600) both help**; low
  exploration temperature (tempPlies=3) helps less.
- **MuZero bootstraps much slower than AlphaZero here**: AlphaZero's net passed 93% root
  agreement by iteration 5; the MuZero arms reach it at iteration 28 (50 sims), 41 (600
  steps) and 59 (defaults). Self-play stays decisive for a long time, so z teaches the
  values of weak play.

## Other logs

- `midrun/`: the tempPlies=3 and sims-50 arms scored mid-run at 25 and 100 sims, where
  extra search first showed up as extra O losses.
- `n3_alphazero_for_oracle.log`, `n3_oracle_gate_trained.log`: the §5 oracle gate on a
  trained AlphaZero net (4520/4520 exact at sims 2–6).
- `n3_*_final_score.log`: `mode=score` on the three seed-1 arms' final nets.
- `n3_*_curve.csv`: per-iteration curves of the finished arms.
- `superseded/`: the run2 logs, exact duplicates of run3's normalized-Q arms (same seed and
  settings), killed.
