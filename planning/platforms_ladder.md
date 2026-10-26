# platforms_ladder.md — one ladder, named by its commands, generated into the book

Started 2026-10-26, from the book review (planning/book_review_2026-10-26.md §1.6). The
platform *suite* is planning/platform_integration.md; this is the layer above it: how the
book, the README and PLATFORMS.md describe where each platform stands, and how a new platform
flows into all three without hand-typing.

## 0. The problem

Three numberings of one ladder:

| where | 1 | 2 | 3 | 4 |
|---|---|---|---|---|
| README tour table | `lake run mnist` | `cifar` | `imagenette` | `imagenet` |
| Appendix A, Table A-1 ("Track") | proofs only | MNIST / CIFAR / Imagenette ("2, 3") | — | ImageNet-1k |
| PLATFORMS.md / `support.tsv` | names only: suite, mnist, cifar, imagenette, imagenet | | | |

"Track 2" vs "Track 3" is defined nowhere in the book since Getting started was rewritten in
tiers (adb2e750); Appendix A's platforms table uses both ("Track 2 on record, and of Track 3 the
MNIST CNN …") and carries queue prose ("is the next run", "their full runs to come") that the
generated PLATFORMS.md cannot. The book's table is hand-typed and already disagrees with
`support.tsv` in both directions (the Mac's MNIST numbers are in the book, `-` in the tsv).

## 1. The ladder

Rungs are named by the command that climbs them; nothing in prose is "Track N" or "tier N".

| rung | what it is | needs | time |
|---|---|---|---|
| proofs | `lake build Proofs` / `Certs`; `tests/comparator/run.sh` | Lean, no GPU | minutes to an hour |
| suite | `scripts/platform/check.sh` (its tiers 0–2 stay internal to the script) | the plugin, the shim; no Lean build of the proof tree | minutes |
| mnist | `lake run mnist` | one plugin file | ~1 min |
| cifar | `lake run cifar` | " | ~6 min (re-time: the tier gained `cifar8wb-bbn-ablation` on 10-24) |
| imagenette | `lake run imagenette` (`imagenette-orin` at the board's memory) | " | ~6 h on a 4060 Ti; a day on the Orin |
| imagenet | `lake run imagenet` | four cards, Python + tfds | weeks |

The side quests (A2/A1, MNv4-500, ConvNeXt-S/B, ViT-S/B) are imagenet-rung jobs that ride
`lake run imagenet` after their chapter's row; they are not a rung.

## 2. Where each platform stands (2026-10-26, the user's word; `support.tsv` is the record)

| platform | state | next |
|---|---|---|
| NVIDIA CUDA 12 (ares) and CUDA 13 (3060 box) | working; every rung on record between them | — |
| Intel Arc Pro B50 (minerva) | working; suite, mnist, cifar, imagenette on record | — |
| Jetson Orin Nano | running; mnist, cifar on record, imagenette (`imagenette-orin`) in progress | the tsv cell when it lands |
| AMD ROCm | was running (2026-08); fighting back right now | row stays with its last record and `historical/ROCM.md`; no promise in the book |
| Apple M1 / Metal | mnist run on the laptop (92.10 / 97.79 / 98.71, deploy/MAC.md), not in the tsv | pick the form it runs in (the suite + mnist, or mnist alone), record it in the tsv |
| AWS Trainium | waiting on AWS approval; the probe plan is planning/book_copy_audit_2026-10-21.md §5 | a `neuron` arm in `env.sh`, an expected file, `deploy/TRAINIUM.md`, a tsv row |
| TPU (TFRC) | the plan after Trainium: the primary sequence and the side quests, i.e. every imagenet-rung row, on TFRC time | a tsv row; the imagenet column is where it would show |

What the book says per platform is a projection of this table, so the book cannot say more than
the tsv does. "Running", "fighting", "waiting on approval" are this doc's words, never the book's:
a rung is on record or it is `-`.

## 3. The work, in order

1. **Reconcile `support.tsv` with what has run.** Add the Mac's mnist record (date, deploy/MAC.md
   § Measured); confirm the Orin cells; decide the ROCm row's wording (last record, no forecast);
   add a `TRAINIUM` and a `TPU` row only when each has a record. Add a `proofs` column? No: the
   proofs rung is platform-free (CI runs it); the tsv stays GPU rungs only, and the book's ladder
   table says so.
2. **`platforms_md.py --tex`.** Emit a LaTeX tabular from the same rows: platform, plugin (pinned),
   then one cell per rung with the date (`-` as a dash); write
   `blueprint/src/figures/platforms.tex`; `--check` covers both outputs. Appendix A's platforms
   float `\input`s it (book_floats already allows `\input{figures/...}` inside a float). The
   runbook column becomes a footnote line under the table (the book cannot link into the repo
   the way markdown does). Markdown-only cell text (links, `✅`) needs a plain rendering: date and
   a short tag, link dropped.
3. **Appendix A's prose.** Table A-1 becomes the ladder table of §1 (rung / command / needs /
   where in the book); "Track 1" section title → "Proofs only"; the thirteen "Track" mentions
   become rung names (Track 4 → "the imagenet tier", "Tracks 2 and 3" → "the mnist, cifar and
   imagenette tiers"); labels (`sec:getting_started_track3`, `_track4`) can stay. Appendix C's
   opening sentence and Table C-1 caption follow. The hand-typed platforms table is deleted once
   the generated one is checked against it, same commit.
4. **README tour table**: drop the 1–4 column for the command; its "Track 4" link text follows.
   Getting started's one-command-per-tier block is already in rung names and needs nothing.
5. **New platform flow** (the thing this buys): a row in `support.tsv` + an `env.sh` arm + an
   expected file + a `deploy/<X>.md` runbook; `check.sh` regenerates PLATFORMS.md and the book's
   table in the same run; the book's prose never names a platform count ("the six GPU platforms"
   at L421, L20033 become "the GPU platforms of Table A-2", so Trainium and TPU do not need a
   prose edit when they land).

Each step is its own commit; step 2 and the deletion in step 3 are the one that needs the
preview diffed before commit.

## 4. Open

* Does the book's table show the suite as its own column (one rung a new box clears in minutes
  without Lean) or fold it into the plugin column as "checked <date>"? Proposed: its own column.
* The two "Track-4" comments in content.tex's preamble (`\sqstatus`, never used) go in step 3.
* Whether the TPU row's imagenet cell, when it exists, is per (network, recipe) like the chapters'
  tables, or one date for the whole sequence. Proposed: one date + a pointer to the runs/ README
  that lists the rows, as the ares and 3060 cells already do.
