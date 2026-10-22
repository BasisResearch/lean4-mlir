# 2026-10-21 — the Kneser-Ney n-gram ladder under TinyGPT

planning/tinygpt_ngram_ladder.md, Phases 0–1. The question: does a 212K-parameter transformer
on 1 MB of text learn more than counts learn? The instrument is interpolated modified
Kneser-Ney at character level, orders 1–10, fit on `data/shakespeare/train.bin` and scored on
`val.bin` under the two protocols of the plan's §3, on the same positions the Lean `score`
mode scores the transformer.

```
python3 scripts/demos/ngram_ladder.py check                                   # Gate 0
python3 scripts/demos/ngram_ladder.py fit --orders 10 --out <here>/ngram_kn.npz
python3 scripts/demos/ngram_ladder.py score --model <here>/ngram_kn.npz --protocol streaming  --T 64 --out <here>
python3 scripts/demos/ngram_ladder.py score --model <here>/ngram_kn.npz --protocol chunked:64        --out <here>
# the transformer, per seed, from its own run dir (data/ and ffi/ symlinked, its own .lake/build):
PATH=~/lean/venv-cpu/bin:$PATH LEAN_MLIR_LOWERER=iree IREE_BACKEND=llvm-cpu IREE_DEVICE=local-sync \
  LEAN_MLIR_SEED=<s> LD_LIBRARY_PATH=ffi ./tinygpt-shakespeare train nano 10000 32 30
  ... ./tinygpt-shakespeare score nano .lake/build/tinygpt_shakespeare_params.bin <here>/nano_s<s>
python3 scripts/demos/ngram_ladder.py table --run <here> --nets nano
```

## Gate 0 — the instrument

`check` 2026-10-21: (a) Σ_w P(w|h) = 1 to 4e-16 over 1,000 histories at every order; (b) an
order-3 Markov chain (V = 20, Dirichlet-0.3 rows, entropy rate 2.9255 bits) is recovered by
the 3-gram at 2.9294 and sits above at n = 1, 2 (4.32, 4.21) — orders above the source's
over-order (+0.04 at 4, +0.24 at 6: KN's continuation counts assume natural-language
novelty, and an exact chain has none), reported, not gated; (c) the KN bigram in-sample on
train is 3.538 against the dense bigram's 3.56; (d) the vectorised scorer equals a dict
implementation of the formulas at every position of a random corpus under both protocols.

**The dense bigram's 3.56 is a train loss.** `MainBigramShakespeare.lean` reports its
last epoch's mean training loss over random train chunks and never reads `val.bin`. The
book and both READMEs set it beside TinyGPT's val number. The KN bigram on val is 3.583.

## The ladder (val, bits/char)

| order | P1 chunked 64 | P1 chunked 128 | P2 streaming |
|---|---|---|---|
| 1 | 4.829 | 4.829 | 4.829 |
| 2 | 3.583 | 3.583 | 3.583 |
| 3 | 2.950 | 2.945 | 2.940 |
| 4 | 2.505 | 2.492 | 2.480 |
| 5 | 2.286 | 2.268 | 2.253 |
| 6 | 2.233 | 2.214 | 2.197 |
| 7 | **2.225** | **2.206** | **2.188** |
| 8 | 2.228 | 2.209 | 2.192 |
| 9 | 2.232 | 2.213 | 2.196 |
| 10 | 2.233 | 2.214 | 2.197 |

Fit: 5 s on CPU; 780,165 distinct 10-grams; discounts D₁ 0.47 → 0.85 up the orders. Scoring
all ten orders: seconds. The plateau is the 7-gram under every protocol. Files:
`ngram_kn.npz`, `score_*.log`, `ngram_<protocol>.csv`, `ngram_<protocol>_n<k>.npy`
(per-position log2 loss).

## The transformer

Three nano seeds (`LEAN_MLIR_SEED` 0 = the recipe's own init, 1, 2), 10k steps, B = 32,
30-step eval, IREE local-sync on the CPU box (~2.1 s/step, 5¾ h each, run in parallel);
then `score nano nano_params.bin .` in each seed's folder (chunked pass 2 min, streaming pass
30 min). The 2026-09-09 checkpoint was overwritten (modernization plan §1.1), so these three
reproduce the recipe rather than score that file; each seed's checkpoint is kept here as
`nano_s<s>/nano_params.bin`.

| seed | trainer's val @ 10k (12 × 32 × 64) | P1 chunked 64 | P2 streaming | gap vs KN 7 (P2), 95% CI | gap (P1) |
|---|---|---|---|---|---|
| s0 | 2.272 | 2.285 | 2.244 | +0.056 [+0.046, +0.067] | +0.060 |
| s1 | 2.275 | 2.275 | 2.228 | +0.039 [+0.030, +0.049] | +0.051 |
| s2 | 2.250 | 2.274 | 2.226 | +0.038 [+0.027, +0.050] | +0.050 |
| mean | 2.266 | 2.278 | 2.233 (sd 0.010) | +0.044 [+0.035, +0.054] (seed-pooled per position) | +0.054 |

- **Gate 1 passes.** The trainer's 12-batch number is a 384-chunk sample of P1; its sampling
  sd, from resampling 384 aligned chunks of each seed's per-position P1 losses, is 0.026
  bits. The three P1 − logged differences are +0.013, +0.001, +0.024: 0.5, 0.0 and 0.9 sd.
  The 2026-09-09 run's 2.279 is the same number on a fourth draw.
- **Gate 2 passes, the wrong way for the net.** The gap has the same sign on all three seeds
  and every CI excludes zero: **at 10k steps, TinyGPT nano is 0.04–0.06 bits/char behind
  the Kneser-Ney 7-gram**, under both protocols. The seed spread (sd 0.010) is a quarter of
  the gap.
- **Where the gap sits** (`context_curve.csv`, the figure's panel b): the net is behind the
  7-gram by ~0.17 bits at histories 2–5, ~0.10 at 6–10 and ~0.04 averaged over 11–64, where
  it is ahead at only 5–9 of the 54 lengths and never by more than 0.06. It is not a
  short-history artefact; the transformer with most of its 64-character window still loses
  to a 6-character count. Both gain the same ~0.04 from the unbounded history
  of P2 over P1 (net +0.041/+0.048/+0.048 by seed; KN 7 +0.037).
- `ngram_ladder.png` (from s0): (a) the ladder with the net's line sitting on the n = 5 rung;
  (b) loss against history; (c) a 90-character stretch of val, where the net's losses are
  single characters it misses by 2–5 bits (the first letter after a speaker tag, a rare word)
  against many small wins.

What this says for the book: the §10.3.1 claim is a 212K-parameter transformer against a
bigram; against the right bracket it is **undertrained** — the plan's third case. Its train
loss is 1.26–1.38 nats (1.8–2.0 bits) against 2.27 val, so it is also overfitting 1 MB with
no dropout; `lm_demos_modernization.md` §1 (dropout, a longer run, `tiny`) is where the
next bits are. `tiny` is left for a GPU box.

Files per seed: `train.log`, `score.log`, `table.{md,csv,log}`, `context_curve.csv`,
`nano_params.bin` (kept), and the per-position scores `tinygpt_nano_score_{chunked,streaming}.bin`
(ignored; regenerate with `score`). `.gitignore` here drops the copied binary, the
`data`/`ffi` symlinks, `.lake/`, and the `.npy`/`.npz` arrays, which `fit` + `score` rebuild
in under a minute.
