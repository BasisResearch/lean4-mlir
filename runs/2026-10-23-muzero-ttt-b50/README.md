# MuZero 4×4 on the Arc Pro B50 (minerva, PJRT / oneAPI) — 2026-10-23

The first GPU runs of `muzero-ttt` (Phase 4's first step, `planning/muzero_ttt_demo.md` §9).
XLA through the PJRT shim on Intel's `jax_oneapi_pjrt` 0.11.2 — no IREE. The shim is
`arc-b50-gen3`'s (`h2d_serial` + `d2h_serial`, commit aa1ce7e9), loaded with
`LEAN_MLIR_LOWERER_SO`; `.venv-xpu` symlinked into this worktree; the main checkout's
`scripts/platform/env.sh` (this branch's predates the xpu arm and finds no plugin from here —
`n4_smoke_b50_noplugin*.log`).

## Speed

| | play | train (300 steps) | score (sweepN=20000) | iteration |
|---|---|---|---|---|
| B50, one process | 3.6 s | 25.3 s (84 ms a step) | 4.0 s | **33 s** |
| B50, three at once, each | 9.5 s | 69.3 s | 8–10 s | ~88 s |
| CPU box (88 threads, 80 runs sharing it, IREE llvm-cpu) | ~7 min | ~12–13 min | ~6–8 min | ~25 min |

Setup ~170 s (host side: the table, the symmetry check; graphs compile in ~1 s). A 60-iteration
run is 37 min. Three at once buys ~11 % throughput (`n4_smoke_b50_x3_p*.log`): the calls are
small and queue on the card. **And two processes on the card can hang** — see below.

## The arm: 3 fresh inits × 60 iterations (n=4 steps=300 sims=50 qnorm=0 sweepN=20000)

Iteration 60, the trainer's own eval (256 games a side vs the perfect player, W/D/L):

| init / seed | sweep agree | value mse | sign | net alone X · O | + search (50) X · O |
|---|---|---|---|---|---|
| 101 / 1 | 79.23 % | 0.2075 | 72.10 % | 0/197/59 · 0/182/74 | 0/256/0 · 0/248/8 |
| 201 / 2 | 94.96 % | 0.1275 | 83.27 % | 0/256/0 · 0/255/1 | **0/256/0 · 0/256/0** |
| 301 / 3 | 66.37 % | 0.2976 | 66.22 % | 0/158/98 · 0/151/105 | 0/160/96 · 0/143/113 |

The take-off is init-dependent: run 1 sat flat (sweep ~61 %) to iteration ~30, then climbed to
79 % by 60; run 2 took off early; run 3 had not by 60. Sixty iterations is short at 4×4 — the
next arm wants 100+ (37 min per 60 here, so cheap).

Logs `n4_run1_q0_sims50_init*_s*.log`, curves `*_curve.csv`, final nets `*_params.bin`, visited
sets `*_seen.bin` (for `mode=score params=…`). `n4_run1_…init201_s2.hung.log` is the hung first
attempt (below).

## mode=score on run 1 (sims 25) — partial, exhaustive

`final_n4_run1_q0_sims50_init101_s1_sims25_seed11.partial.log`: M1, M2, the probe on h and the
`own` lines block (k = 0…10) over all 9,062,619 decision positions, then stopped (the box went to
another card). Gate B **fails** at 25 sims: X 0/249/7, O 0/234/22. M2 seen 86.25 % / unseen
79.68 % agree, sign 80.91 % / 72.13 %. The probe reads the board from h perfectly (100 % / 100 %
held out) and from g after one imagined move at 42 % of cells, **0 % of whole boards**, ~46 %
to k = 10 — the 3×3 finding (values, not the board) holds at 4×4.

**Cost, the reason it did not finish:** the `own` lines block alone was ~46 min, and M4b and the
blunder account run a search from every start (~70 min each at 25 sims, ~4.7 h at 100 — 35k
batches of 256 searches × sims × ~5 ms). A full exhaustive score is ≥ 5 h at 25 sims.

## Two fixes to `mode=score` (demos/MainMuZeroTtt.lean, this commit's parent)

- **`scoreLines` was quadratic.** `acc := { acc with idx := acc.idx.modify … }` keeps the old
  `acc` holding each array while it is modified, so every push copied its whole ByteArray
  (6 of 8 stack samples in `lean_copy_sarray`; the card ~5 % busy). Invisible at 3×3's 4,520
  starts, never finishing at 4×4. One `let mut` per field. 3×3 A/B: the score CSV
  byte-identical, old vs new (`ab-scorelines/`).
- **`searchOnly=1`** (M1, M4b, the blunders only — the rest does not depend on `sims`; writes
  `_score_search<sims>.csv`) and **`scoreN=`** (lines, M4a, M4b, blunders, M4c on a seeded uniform
  sample of starts; M1, M2, the probe on h stay exhaustive). Built, **not yet run** — the
  queued 3×3 gate (`serial2.sh` step 1) never ran. Also note the full score's CSV name does not
  carry `sims`: a sims-25 and a sims-100 score of one net overwrite each other.

## The hang: never two processes on the B50

With run 2 training and two `mode=score` runs alongside (17:20), run 1's score and run 2 both
stopped making progress (17:02–17:31) while the card sat at 2,600 MHz, the two splitting its ccs
cycles ~45/55. Backtraces: a SYCL host task in `DispatchHostTask::waitForEvents → urEventWait`,
forever. No kernel message until they were killed (18:24): `guc_exec_queue_timedout_job`, GT0
reset, recovered without a power cycle. `hang-18-24/` (kernel log, backtrace). The 3-process smoke
had passed. Everything after ran one process at a time (`serial*.sh`).
