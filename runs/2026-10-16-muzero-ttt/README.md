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
| `n3_run3_q0_s2` | raw Q, seed 2 | running | | 0 so far | |
| `n3_run3_q1_s2` | normalized Q, seed 2 | running | | 0 so far | |
| `n3_run1_s1` | normalized Q, AlphaZero's schedule | running (20) | ~15 h | 0 so far | |

As X every arm is unbeaten with search from about iteration 10. O is the whole story.

## Gate A — passes on two seed-1 arms at the training budget (25 sims)

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
35–50, the other seed-1 arms pass at a few iterations at most, and both seed-2 arms are far
behind (70–130 O losses at iteration 50).

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
- **M4d, the board probe.** A ridge readout from h's latent recovers every cell of every
  held-out position (100% / 100%). After ONE imagined move it recovers 84% of cells and
  25% of whole boards, and stays there (own lines), or falls to 67% / 7% (random, k = 5).

So, at 3×3: **the model learned the values and the policy, not the board.** h's latent
holds the board exactly; g's does not, from the first imagined move, and a transposed line
does not land on h of the same board. (The probe is fit on h, so part of the drop is h vs g
distribution shift; a probe fit on g latents is the next check.)

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

- **Raw Q beats the paper's normalized Q on seed 1** (0/236/20 vs 0/103/153 as O at
  iteration 60, same seed and steps). Seed 2 has normalized Q slightly ahead at iteration
  ~50, so this is open.
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
