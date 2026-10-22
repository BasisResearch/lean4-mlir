# tinygpt_ngram_ladder.md — a Kneser–Ney n-gram ladder under TinyGPT

Goal: give the NLP entry of the Bestiary (§10.3.1, "TinyGPT, in passing") the bracket every
other chapter-10 section has. Today the 2.28 bits/char sits against a bigram table (3.56) and
uniform (6.02), both straw men. The classical state of the art in language modelling for twenty
years was a count-based n-gram with Kneser–Ney smoothing: no training, a closed form from
counts, seconds on CPU, and strong at character level on a 1 MB corpus. It is this section's
matched filter — the detector the field already has, which the network must beat to have
shown anything.

Origin: `planning/demo_slate.md` §2 item 2 (2026-10-05): "A Kneser–Ney n-gram ladder is its
matched filter; the RoPE length-extrapolation gate (`lm_demos_modernization.md` §5) is a
ready-made result." Opened 2026-10-21. Companion: `planning/lm_demos_modernization.md` (the
trainer's open bugs; §1.1 checkpoint overwrite matters here, §4 the order).

## 1. The question

**Does a 212K-parameter transformer on 1 MB of text learn more than counts learn?** An n-gram
of order n is the best predictor that conditions on exactly the last n − 1 characters, given
the counts; with Kneser–Ney it degrades gracefully where the counts go sparse, so the ladder
over n flattens at the corpus's own limit. The one number the section then reads is where
TinyGPT sits against that plateau:

- below it by a clear margin (say 2.1 against 2.3): the gap is what attention over 64
  characters buys that no finite context of counts can;
- at it: a 4-layer transformer on 1 MB learns what a 7-gram table learns, and the honest
  sentence is that one;
- above it: the recipe is undertrained (no dropout, `tiny` overfits — `lm_demos_modernization.md`
  §1.4), and the ladder says by how much.

The expected shape, from the character-level literature on this corpus, is a plateau near
2.2–2.5 bits/char by n ≈ 7 and TinyGPT nano close to it. **These are expectations, not
measurements**; nothing in the repo has run a smoothed n-gram above order 2.

## 2. What exists

- `demos/MainTinyGptShakespeare.lean` (`tinygpt-shakespeare`): `train [nano|tiny] [steps] [batch]
  [lr×1e4]`, `sample`, `suite`, `xeval <cfg> <T>`. nano T=64 D=64 h=2 mlp=256 ×4 (212K);
  tiny T=128 D=128 h=4 mlp=512 ×6 (~1.6M). RoPE and no-pos configs exist (`nano-rope-nopos`).
- `demos/MainBigramShakespeare.lean`: a dense V→V trained by SGD — the existing 3.56 row. It is
  a *trained* bigram, not a count table; the ladder's n = 2 row will sit slightly below it
  (the ML estimate with KN smoothing is the optimum the dense layer approximates).
- Data: `scripts/datasets/preprocess_shakespeare.py` → `data/shakespeare/{train,val}.bin`
  (int32 LE ids, 65-char vocab), a 90/10 split taking the val *tail* of the 1,115,394-char
  file (~1,003,854 train / ~111,540 val; confirm from `meta.txt` — the data is not on this
  box today). The split is contiguous text, so an n-gram fit on train sees none of val.
- The result on record: `runs/2026-09-09-tinygpt-nano-xla/` — 2.279 bits/char val, 1.99 train,
  173 s on one 4060 Ti. `tiny` has no run folder.

## 3. ⚠ The scoring protocol — the one thing to get right first

The trainer's "val bits/char" is **not** the val stream's cross-entropy. `evalValLoss`
(`MainTinyGptShakespeare.lean:228`) draws `nValBatches = 12` batches of 32 random 64-char chunks
(fixed seeds `0xdead0000 + 9973·i`, `lean_f32_sample_chunks`), so:

1. it scores 24,576 positions sampled with replacement from ~111k, not the stream;
2. a chunk is inputs `[o, o+T)` and targets `[o+1, o+T+1)`, so target j is predicted from
   j+1 characters: the mean over a chunk is the mean over history lengths 1 … 64, not
   "context 64" (and never 0 — the first target always has the first input behind it).

An n-gram scored on the whole stream with full context would be compared on different
positions under a different context rule — the error is tenths of a bit, the size of the
effect being measured. Both sides must score the same positions under the same context rule.
Two protocols, both reported:

- **P1, chunked (the trainer's own number, made deterministic).** The trainer's chunks laid
  consecutively over val, inputs `[cT, cT+T)`, targets `[cT+1, cT+T+1)` (T = 64 for nano;
  1,742 chunks, 111,488 targets); every target scored with the history cut at the chunk's
  start. Transformer: the `score <cfg>` mode, the eval forward at batch 32 over the chunks
  and the CE at every position (55 forwards). n-gram: the same chunks, history reset at every
  boundary, so target j is the order-min(n, j+2) model's prediction. This is the number that
  matches what the trainer logs, up to the sampling noise of its 12 random batches — `score`
  prints that number too, from the same checkpoint, so the gap is read, not estimated.
- **P2, streaming (the honest number for both).** Every position t ≥ T of the val stream
  predicted from the full window `[t−T, t)`: a sliding window at stride 1, the CE at the
  window's last position only, batch 32 → 3,484 forwards at T = 64 (a minute on one card,
  ~40 min single-threaded on CPU). n-gram: unbounded history (the model only ever uses
  n − 1 anyway). This is what "bits/char on tinyshakespeare" means in the literature, and is
  the table's headline column.

The two protocols differ for the transformer by the cost of short contexts; for a 7-gram they
differ by almost nothing (6 of every 64 positions see fewer than 6 characters). That
difference is itself a row worth one sentence: how much of the transformer's number is paid
at chunk starts.

## 4. The instrument — `scripts/demos/ngram_ladder.py`

Interpolated modified Kneser–Ney (Chen & Goodman 1998), the standard form:

- counts c(h, w) for every order up to N (N = 10 at character level; 65^10 is sparse, the
  tables are dicts of what was seen, ~a few million entries at n = 10 on 1 MB);
- three absolute discounts D₁, D₂, D₃₊ per order from the count-of-counts
  (D₁ = 1 − 2Y·n₂/n₁ etc., Y = n₁ / (n₁ + 2n₂));
- the highest order uses raw counts; every lower order uses **continuation counts**
  (the number of distinct contexts w follows), which is the Kneser–Ney idea and the whole
  reason it beats Katz / Witten–Bell at high orders;
- interpolation weights from the discount mass left in each context, back off to the
  uniform over V at the bottom;
- **no OOV**: the vocabulary is the 65 characters of the file, and val is the same file's
  tail, so every character is in-vocabulary. `<s>` is not a symbol: at a chunk start (P1)
  the history is simply empty and the model backs off to the unigram.

Modes:

```
ngram_ladder.py fit   --train data/shakespeare/train.bin --orders 1..10 --out .lake/build/ngram_kn.pkl
ngram_ladder.py score --val data/shakespeare/val.bin --protocol chunked:64 | streaming
                      [--model .lake/build/ngram_kn.pkl] [--orders 1..10] --out runs/x/ngram_ladder.csv
ngram_ladder.py check                     # §6 Gate 0 — the self-checks below
```

Pure Python + numpy (numpy 2.3.5 is on the box); no venv, no lock file. SRILM / KenLM would
give the same numbers and are the cross-check if any row looks odd (`ngram-count -kndiscount
-interpolate`), not a dependency. Fit is seconds; scoring 111k positions at ten orders is
seconds with the tables in dicts.

The script also emits, for each order, the per-position log-loss stream (`.npy`) so the
figure can draw loss against context length and the transformer's stream can be diffed
against it position by position.

**Status 2026-10-21.** `scripts/demos/ngram_ladder.py` (fit / score / check / table) and the
`score` mode in `MainTinyGptShakespeare.lean` exist; `LEAN_MLIR_SEED` now moves the TinyGPT
trainer's init and chunk draws as it does the generic trainer's. Gate 0 passes: sums to 1 at
4e-16, the order-3 chain's rate recovered at n = 3 (2.929 vs 2.926), the vectorised scorer
equal to a dict implementation of the formulas at every position under both protocols.
Finding on the way: **the dense bigram's 3.56 is `bigram-shakespeare train`'s last-epoch
TRAIN loss** — it never reads `val.bin` — and the book and READMEs set it beside TinyGPT's
val number; the KN bigram is 3.538 in-sample on train and 3.583 on val. The ladder on val:

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

(the chunked rows after the convention fix of §3; the 7-gram is the plateau under every
protocol). TinyGPT nano's logged 2.279 is **above** the 7-gram's 2.225 under its own protocol
and 0.09 above the streaming plateau — the third case of §1, pending Gate 1 on a checkpoint.
The 2026-09-09 checkpoint was not kept (§1.1 of the modernization plan), so three nano seeds
(0 = the recipe's own init, 1, 2) are retraining on the CPU box under IREE local-sync, 10k
steps each, ~2 s/step (`runs/2026-10-21-tinygpt-ngram-ladder/nano_s{0,1,2}/`); `tiny` is
left for a GPU (its step is ~10× nano's). The `score` mode was validated on a 200-step
checkpoint: chunked 3.668 against the trainer's logged 3.663.

**Phase 1 done, 2026-10-21 22:08 UTC.** Three nano seeds at 10k steps on the CPU box, scored
under both protocols (`runs/2026-10-21-tinygpt-ngram-ladder/README.md` has the table).
Gate 1 passes: the `score` mode's P1 (2.285 / 2.275 / 2.274) matches each seed's own 12-batch
number (2.272 / 2.275 / 2.250) within 1 sd of the 12-batch sampling noise (0.026 bits).
Gate 2 passes with the gap **positive**: TinyGPT nano − KN 7-gram under P2 is +0.056
[+0.046, +0.067], +0.039 [+0.030, +0.049], +0.038 [+0.027, +0.050] by seed, +0.044
[+0.035, +0.054] seed-pooled; under P1 +0.060 / +0.051 / +0.050. **At 10k steps the net is
0.04–0.06 bits/char behind counts**: by 0.17 at histories 2–5, 0.10 at 6–10, 0.04 over
11–64 (not a short-history artefact), with a train loss of 1.8–2.0 bits against 2.27 val. The third case of §1,
established; the figure exists (`ngram_ladder.png`). Still owed: Phase 2 (the section and
README text, previewed first), `tiny` on a GPU, and the modernization plan's dropout /
longer-run rows, which are now the obvious next experiment: does the net cross the 7-gram
with dropout, or with more steps, and at which?

## 5. The table

One row per order and the two rungs, two protocol columns, bits/char on val:

| row | P1 chunked (T=64) | P2 streaming |
|---|---|---|
| uniform | 6.02 | 6.02 |
| KN n = 1 … 10, one row each | | |
| trained bigram (`bigram-shakespeare`, the existing row) | — | 3.56 |
| TinyGPT nano, 10k steps | (the logged 2.28 ± noise) | |
| TinyGPT tiny, 10k steps | | |

Plus two readings the prose needs:

- **the plateau**: the order at which the ladder stops improving by more than 0.01, and its
  value — the corpus's own limit under counts;
- **the gap**: TinyGPT nano minus the plateau, with a bootstrap CI over val positions (block
  bootstrap over chunks, 1,000 resamples; the positions are not independent).

## 6. Gates

- **Gate 0 — the smoother is right** (`check` mode, CPU, seconds). (a) Every conditional
  distribution sums to 1 to 1e-9 on 1,000 random histories at every order. (b) On a synthetic
  corpus drawn from a known order-3 Markov chain, KN at n ≥ 3 lands within 0.01 bit of the
  chain's true entropy rate and n = 1, 2 sit above it. (c) The KN bigram on train scores val
  ≤ the trained dense bigram's 3.56 (a trained V→V cannot beat the smoothed ML estimate by
  more than noise). (d) Optional cross-check: SRILM on the same text files agrees to 0.01
  bit at n = 5.
- **Gate 1 — the protocols agree where they must.** The `score` mode's P1 on the 2026-09-09
  nano checkpoint reproduces the logged 2.279 within the 12-batch sampling noise (estimate
  that noise from the script: the spread of 12-batch means over seeds). ⚠ `lm_demos_modernization.md`
  §1.1: `train` overwrites the checkpoint on every run; copy
  `.lake/build/tinygpt-shakespeare-nano*_params.bin` into the run folder before anything
  retrains, or fix §1.1 first (six lines, the plan's own order says to).
- **Gate 2 — the finding is stable.** The gap of §5 has the same sign on the three nano seeds
  (`LEAN_MLIR_SEED`, three 3-minute runs) and the CI excludes zero in whichever direction.

## 7. Figure and section

`scripts/demos/ngram_ladder_figure.py`: (a) bits/char against order n, the ladder, with
TinyGPT nano and tiny as horizontal lines (P2) and the trained-bigram point; (b) mean
log-loss against history length 1 … 64 under P1, the 7-gram and nano on the same axis — where
in the window the transformer earns its gap (the expectation is: nothing before ~6
characters, everything after); (c) optional: the per-position difference nano − KN7 along a
200-character stretch of val, the characters the transformer predicts that counts cannot
(names after a speaker tag, closing a quotation).

The section: "TinyGPT, in passing" becomes a subsection with the question of §1 first, the
table, the figure, and a "what this is not" (not a scaling result; not a tokenised model;
one corpus). The rest of the entry — the three things that change, the causal-mask figure,
the sample — stays. `demos/README.md`'s NLP section gets the table and the two commands;
the front-door README's language row keeps 2.28 and gains "against a KN 7-gram at x.xx".

## 8. Phases

```
Phase 0 (½ session, CPU):   ngram_ladder.py fit / score / check; Gate 0; the ten rows under
                             P2 on the existing split. No GPU, no Lean.
Phase 1 (½ session, GPU):    `score <cfg>` mode in MainTinyGptShakespeare.lean (P1 and P2),
                             run on the 2026-09-09 nano checkpoint (copied first); Gate 1.
                             Then nano ×3 seeds and one tiny run, 10k steps each (~15 min);
                             Gate 2. runs/<date>-tinygpt-ngram-ladder/.
Phase 2 (½ session):         figure, table script, the section and README text (previewed in
                             chat before commit).
Phase 3 (optional, ½ session): the RoPE extrapolation gate (lm_demos_modernization.md §5)
                             on the same table — nano-rope-nopos trained at T=64, scored by
                             `score` at T = 64 / 128 / 256 under P2, the KN rows as the
                             length-independent control. This is the second finding the
                             slate names; it needs no new instrument once Phase 1 exists.
```

## 9. Out of scope

Word-level or BPE n-grams (the corpus is scored at character level, as the transformer
is); neural n-gram hybrids; a bigger corpus (TinyStories is deleted, 2026-09-30); any change
to the TinyGPT recipe beyond `lm_demos_modernization.md` §1 — if the ladder says nano is
undertrained, that is a finding to state, and dropout / the `tiny` run are that plan's rows.

## 10. Notes before starting

- The trained bigram's 3.56 is from `bigram-shakespeare train` at 30 epochs (random chunks,
  the same protocol caveat as §3 in miniature); the KN n = 2 row is the exact comparison
  and supersedes it in the table. Keep the dense bigram's row for the README's "pipeline
  smoke test" purpose, not as a baseline.
- Character-level KN at n = 10 on 1 MB: the highest orders are nearly memorisation of train
  and contribute little on val; the plateau is the result, not the top row. Do not tune the
  discounts on val.
- P1's chunk starts are where position-0 losses land; the trainer's own curve has them
  mixed in at every eval, which is why its 2.28 is a few hundredths above P2's will be.
  Say so once in the section; it explains the number the reader already saw.
- `score` for `tiny` is at T = 128, so its P1 column is chunked at 128 and is not directly
  comparable to nano's P1; P2 is the column that compares the rungs.
- Block bootstrap for the CI: blocks of one chunk (64 chars), 1,000 resamples; the per-position
  losses of a transformer are correlated within a window.
