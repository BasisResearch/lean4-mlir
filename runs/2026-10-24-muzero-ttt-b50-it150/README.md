# MuZero 4×4 on the Arc Pro B50, 150 iterations — 2026-10-24

The overnight queue `night4.sh` (here), one process on the card at a time, all on the pinned
`muzero-ttt.new` binary (bfd4a4cf). Same setup as `../2026-10-23-muzero-ttt-b50/` (PJRT on
`jax_oneapi_pjrt`, the arc-b50-gen3 shim, n=4 steps=300 sims=50 qnorm=0 sweepN=20000), same inits
and seeds, 150 iterations instead of 60. 33 s an iteration as before: 89 min a run. Queue log
`night4.log`; no kernel errors, the card's health check passed after every step.

## 1. The 3×3 gate for `searchOnly=` / `scoreN=` — passes

`../2026-10-23-muzero-ttt-b50/ab-scorelines/gate_*`: the edited binary's default score CSV is
byte-identical to the original binary's; `searchOnly=1`'s M1 lines equal the full score's;
`scoreN=1000` runs. At 4×4, run 1 (60 it) sampled (`scoreN=200000`, 23 min) against its partial
exhaustive score: M1/M2/the probe on h are exhaustive in both and identical; the `own` lines at
k = 0, 1 agree to 0.1 point (86.5 / 79.6 % vs 86.3 / 79.7 % policy at k 0, seen / unseen).

## 2. Training: two of three inits reach perfect play, one never takes off

Trainer's eval at the iteration (256 games a side vs perfect, W/D/L; agree = f∘h sweep):

| init | it 30 | it 60 | it 90 | it 150 | at 150: net alone X · O | + search 50 X · O |
|---|---|---|---|---|---|---|
| 101 | 64.0 % | 91.0 % | 98.4 % | **99.08 %** | 0/256/0 · 0/256/0 | 0/256/0 · 0/256/0 |
| 201 | 64.0 % | 83.3 % | 97.5 % | **98.70 %** | 0/256/0 · 0/256/0 | 0/256/0 · 0/256/0 |
| 301 | 61.9 % | 62.4 % | 61.3 % | 63.20 % | 0/143/113 · 0/117/139 | 0/119/137 · 0/61/195 |

**Not bit-reproducible.** Iteration 1 plays the same games as the 60-iteration arm (3715
positions, X 73 / draw 118 / O 65) but its losses differ in the 4th digit — training on the card
is not deterministic, so the same init/seed is a fresh draw of the take-off: 101 was at 79 % at
it 60 last time, 91 % this time; 201 was 95 %, now 83 %.

**Take-off is the reward head.** In every run that learns, the reward loss falls from the
~0.035 base rate to ~0.002 over the twenty iterations agreement climbs, and leads it by about
five (101: reward 0.033 → 0.002 over it 40–60, agree 65 → 91 % over 45–65; 201: it 45–65,
agree 65 → 91 % over 50–70), then to 1e-4. In 301 it never moves (0.038 at it 9, 0.040 at it 150) and the policy loss
sits at 4.82 throughout (the others' starts at ~3.9–4.1). `*_curve.csv` columns `loss_reward`,
`agree`.

## 3. Sampled scores (`scoreN=200000`, sims 25, seed 11)

| net | search 25 vs perfect X · O | M2 agree | M4a wins called / false | M4b through a taken cell | blunders (search errs, net does not) | g-probe whole boards, own lines k 1 / 5 / 9 | M4c ‖s₁−s₂‖ / two boards |
|---|---|---|---|---|---|---|---|
| 101, 60 it | 0/249/7 · 0/234/22 | 79.76 % | 93.54 % / 0.06 % | 0.30 % | 1317 | 84.2 / 21.6 / 13.6 % | 1.21 / 3.96 |
| 201, 60 it | 0/256/0 · 0/256/0 | 94.80 % | 97.75 % / 0.01 % | 0.41 % | 312 | 97.7 / 74.8 / 68.5 % | 0.89 / 4.20 |
| 301, 60 it | 0/160/96 · 0/131/125 | 66.41 % | 2.65 % / 0.12 % | 0.00 % | 7337 | 9.5 / 0.2 / 0.1 % | 1.02 / 2.98 |
| 101, 150 it | **0/256/0 · 0/256/0** | 99.02 % | 99.85 % / 3.36 % | 1.22 % | 14 | **100 / 99.7 / 99.7 %** | 1.80 / 5.09 |
| 201, 150 it | **0/256/0 · 0/256/0** | 98.75 % | 98.72 % / 2.23 % | 0.78 % | 33 | 100 / 99.8 / 99.7 % | 1.74 / 5.23 |
| 301, 150 it | 0/73/183 · 0/51/205 | 63.57 % | 0.00 % / 0.00 % | 65.19 % | 7576 | 0.0 / 0.0 / 0.0 % | **0.027 / 0.026** |

(The 60-iteration scores sit in `../2026-10-23-muzero-ttt-b50/final_*_n200k.*`.)

- **Gate B passes** for both learners at 150 iterations (no losses as X or O with search), where
  run 1 failed it at 60.
- **g carries the board.** A linear probe refit on g's latents (held out by board) reads the
  whole board after 9 imagined moves along the net's own lines at 99.7 % for both learners (cells
  100 %); along random lines it falls off (101: 95.5 % at k 1 → 48.9 % at k 9). This **corrects**
  the 2026-10-23 README's "values, not the board" at 4×4: that came from h's probe applied to g
  (still 42–48 % of cells, 0 % of boards — g's board lives in other coordinates), the refit had not
  run when that score was cut. At 3×3 the refit falls to ~0 % of boards by k 2 (`gate_new.log`);
  at 4×4 the learners' dynamics hold it.
- **301 at 150 is a collapsed dynamics model.** After one imagined move every latent is the same
  point (‖s₁ − s₂‖ 0.027, two *different* boards 0.026 apart; |v₁ − v₂| 0.000), the reward head
  never fires (0 % of 56,920 winning moves), the g-probe reads nothing. Its h is fine (the probe on
  h is 100 %, value sign from h 98.1 %), so the net alone draws ~half its games, and the search —
  planning in a latent that ignores the move — makes it *worse* (X losses 113 → 183) and runs
  through taken cells 65 % of the time (82 % at 100 sims). At 60 iterations its g was still
  spread (two boards 2.98 apart) but already blind (9.5 % boards at k 1).
- **What the learners give up.** False reward calls rise from ~0.01 % to 2–3 % of non-winning
  moves, and in the few starts where search errs and the net does not (14 and 33 of 200,000) a
  phantom win for the mover is on the line 43 % / 36 % of the time.

## 4. Sims 100, `searchOnly=1` (16 min each)

| net | search 100 vs perfect X · O | M4b through a taken cell / past the end | blunders, phantom win mover / opp. |
|---|---|---|---|
| 101, 150 it | 0/256/0 · 0/256/0 | 3.18 % / 64.65 % | 14, 28.6 % / 0 % |
| 201, 150 it | 0/256/0 · 0/256/0 | 3.62 % / 63.13 % | 51, 23.5 % / 3.9 % |
| 301, 150 it | 0/122/134 · 0/86/170 | 82.02 % / 10.41 % | 2522, 0 / 0 |

Deeper search lines leave the legal game more (taken cells 1 → 3 %, past the end 48 → 64 %)
without costing a game.

## Next

- The 301 failure: does g collapse early (the reward loss is flat from iteration 1)? A per-
  iteration ‖s₁ − s₂‖ / reward recall in the curve would show it; so would more inits — at
  one in three, the rate is unmeasured.
- A score of the learners at sims 25 with the full (unsampled) lines, now affordable: the
  lines block was the 46 min of the old run.

Files: `n4_run2_*_it150.log`, `*_curve.csv`, `*_params.bin`, `*_seen.bin`; scores
`final_*_n200k*.log` / `.csv`.
