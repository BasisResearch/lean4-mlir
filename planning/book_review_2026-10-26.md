# book_review_2026-10-26.md — a general read of the book at HEAD e981f8a6

Read-only review of `blueprint/src/content.tex` (21,789 lines, ~254 pp), 2026-10-26. Nothing in
the book was edited. Method: the front matter and appendices read by one reader; Chapters 1–13
by seven parallel readers on fixed line ranges against the same brief (internal inconsistencies,
development-history prose, dangling references, template drift, repetition, positional words,
hand-typed counts, caption rules); every high-severity item then re-checked against the text.
Line numbers are HEAD e981f8a6 and will drift; search by quote. The full per-range reports are
appended in §5; §1–§4 is the synthesis.

Gates at HEAD (all pass): `book_floats --strict` 63 figures / 86 tables / 0 violations;
`book_xrefs`; `book_counts` (46 bestiary files, 12 demo groups, comparator 13 + 39 + 58 = 110,
budget sums 44 / 9 / 45 = 98); `book_prose_idents` 450 / 450; `book_listings --check` clean.
The gates catch structure. Everything below is what they cannot see.

## 0. The TikZ note (planning/book_floats.md, 2026-10-15/16) — where it stands

Parts 0 and 1 are done and gated. Of its §2 "Open" items:

* **`\depgraphlegend{}` after Figure 1-2** (L978) is still a standalone paragraph; the note
  suggested folding it into the caption. Still open. Ch 1 also says "every chapter's theorems
  section opens with its own graph" three times in 40 lines (L938, L961, L975).
* **`[H]` everywhere** — true except Figure B-1 (`\begin{figure}[ht]`, L20184), the only
  non-`[H]` float in the book. Either intentional (it is tall) or an oversight; the surrounding
  prose does not assume its position, so it is safe either way.
* **Front-matter "Table 1"** — the roadmap is now Table 1 (adb2e750). Fine unless the editors ask.
* Not in the note but of its kind: the 2026-10-23 depgraph commit (a10c5fb5) set §9.2.1's two
  batch-lifting statements aside in the spines and chapter map. The prose has not caught up:
  §9.2 (L13279–13290) still introduces the matrix VJP record and the row-wise lift as new
  attention machinery, when Foundations (L781–784) says they have been in use since Chapter 4
  and Chapter 8 already cites them. One sentence at the top of §9.2 closes it. Related: the
  Ch 8 Recap (L13081) says Chapter 1 set them aside; it was Foundations.

## 1. The book-wide picture

The book reads as one shipped state almost everywhere a run has landed, and as a status board
everywhere one has not. The 10-23 sweep (b47a1ea6) cleared most of the 10-21 copy audit's
development-history passages; what remains clusters in five places, all tied to runs that are
queued, plus one chapter section that the 10-24 rewrite did not reach and one demo whose data
landed in `runs/` but not in the text.

### 1.1 Queue state still in the text (the marker rule allows a marker to name what a rerun closes; these go past that)

| where | what the reader sees | lines |
|---|---|---|
| Ch 5 A2/A1 side quest | `[TODO: RASampler … neither tier has run]`; "neither has been run" said four times, once inside a table | L8179–85, L8102, L8163, L8205 |
| Ch 6 MNv4 side quest | the 500-epoch pair "owed" three times, with "∼112 + 88 h … this pair times five" | L9880, L10180–82, L10200 |
| Ch 8 ConvNeXt-T ImageNet | `[TODO: … the pair on it is owed, both halves … ∼76 + 109 h]`; "queued", "owed", "(after the run)" listing comments, "landed after this run" | L12531, L12570–81, L12618, L12758, L12773, L12826–38 |
| Ch 8 / Ch 9 S/B side quests | "**What is queued.** Both pairs exist." + `[TODO: neither has run]` + dated smokes | L13028, L13048–63, L15328–38, L15360–84 |
| App A platforms table | Orin "is the next run"; Mac "their full runs to come" | L20050–51 |
| App C | "One chapter prints a pair from an earlier conf than the row trains today — ConvNeXt-T" | L20981–83 |

**ConvNeXt-T is the one that hurts.** Chapter 8 carries two ImageNet recipes at once: the pair
it publishes (one-shot batch 256 at 2.5e-4, global-norm clip, tanh GELU) and "the chapter's row"
(4096 by 16×64, no clip, erf) that has not run. Consequences inside the chapter: Definition
`ax:geluErfScalar` (L11853) and L11712 say the exact GELU is "what the ImageNet pairs of this
chapter … compute", while L12616–19 and the marker say the published pair trained tanh; the
`tab:cnx_paths` caption (L12796) says "Both are the paper's recipe" while the marker says the
pair predates it; `tab:cnx_vs_2018` describes the one-shot pair; the S/B section (L13052) says
"ConvNeXt-T's recipe as its marker has it", i.e. the one that did not run. Chapter 9's GELU story
(Imagenette tanh, ImageNet erf) is consistent on its own. Decide now which pair Chapter 8
publishes and make the definition, the two captions, the knob table, the S/B sentence, the
marker and App C's sentence describe that one state; swap the numbers when the rerun lands.

### 1.2 A section the 10-24 Chapter 4 rewrite did not reach

Chapter 4 now headlines batch-statistics BN everywhere — intro, Run it first, the three specs,
the spec-to-proof tie, the levers, the tables, the Recap — except **MLIR: BatchNorm**
(L5997–6080). It still calls the per-image render `cifar8w_bn_sgd_train_step.mlir` "the
chapter's trained artifact", assigns the `[0,2,3]` reduce to "the ResNet and MobileNet artifacts
of the next chapters" (this chapter's six `cifar8wb_bbn_*` artifacts emit it), and never names
`thm:cifar8bbn_step_tie`, `thm:cifar8bbn_whole_back` or `thm:bnBatchTensor4HasVJP`. A reader who
trusts the chapter's own rule ("BatchNorm without qualification means the batch form", L4441)
is told the wrong layer there. Smaller pre-rewrite residue in The theorems' lead-ins: L4970
"two-convolution" (the theorem says four), L4972 "the packed steps this chapter's runs train",
L4988 "ties below are batched" (per-image renders; "batched" now collides with batch
statistics), and the "two specs" heading over three specs (L5479–88). Appendix B's "the CIFAR
BatchNorm step is the one on [the render-guard baseline]" (L20340) should be re-read against
whichever artifact the MLIR section ends up quoting.

### 1.3 A demo whose data landed in `runs/` but not in the book

TinyGPT (L17698–17704) is the only demo in Part 2 with no results table. Commit 84eb2e49
(2026-10-22) measured the Kneser-Ney ladder (7-gram plateau 2.225 / 2.188; nano at 10k steps
2.285 / 2.275 / 2.274, i.e. 0.04–0.06 bits/char *behind* the 7-gram) but touched only
demo/scripts/runs. The section still says "2.28 … against 3.56 for a bigram table", and 3.56 is
the dense bigram's last-epoch *train* loss sitting beside a held-out number (the val KN bigram is
3.583). planning/demo_slate.md item 2 already lists this; landing the table and figure also lets
the "TinyGPT, in passing" heading go.

### 1.4 The 2026-10-18 fact-check's Part 2 items mostly never landed

Commit 5729af20 applied the fact-check's themes to Part 1 and the appendices. Roughly thirty of
its Part 2 findings are still in Chapter 11 at the current line numbers (the G report in §5 lists
each with "still open from fact-check"). The ones a reader will trip on:

* **Detection frames FPN as impossible and then trains one.** L16556–57 defers "the multi-head
  refactor to the limitations discussion" (no such discussion exists anywhere in the book);
  L16656–58 says multi-scale FPN heads "don't linearize"; three pages earlier the demo trains a
  three-level FPN head through `.fpnDetect`, a layer used by name twice (L16780, L17470) and
  defined nowhere (the kit defines `.fpnModule`). Part 2's opener (L15455) says "no training
  runs, no VJP commitments" over a Part with twelve demos.
* **VisDrone's four percentages are not derivable from its own table**: "44% more than 12
  epochs" (no 12-epoch scale-aug row; +20% or +55% against the rows that exist), "narrowed it
  from 43×" (25× from the table), "one item closes 31%", and "beats the PyTorch replica by 54%"
  where the matched rows tie (0.1526 vs 0.1532). L16612–42.
* **PlantDoc "last two rows … learn from it five-fold"** (L17004) points at the two "published"
  rows; the five-fold rows are the three "+ field labels" rows.
* **EuroSAT "near infrared alone buys four of the ten points"** (L17184): the table says +1.9.
* **NEU-DET "photometric augmentation's +0.007"** (L16848) has the wrong sign (0.623 vs 0.630).
* **Plant "ten per class buy seven points"** (L17105) is 4.9 from the table.
* Three BraTS tables appear before any citation, the only float-rule misses in the book that the
  strict gate does not see because the tables *are* cited, later.

### 1.5 Numbers that disagree with their own tables elsewhere (new this pass)

* Ch 5 `tab:r50_a3_vs_2018` (L8075): 2018 decay "$10^{-4}$, all params" vs L7347–49 / L7703 /
  `tab:r50_paths` L7873 "weights only" (10-21 audit item; `tab:r50_paths` was fixed, this table
  was not). Ch 5 L7320 "three times the next-largest knob": cosine is −5.00 against −7.33, so
  1.5×. Ch 5 L7596 "the verified path leads by one to three points through the first third":
  epoch by epoch the two swap sides; only the three tabulated epochs show a lead.
* Ch 5 trainer listing (L7462–65) shows `resnet34ImagenetConfig` without `zeroGammaInit := true`
  / `bnMomentum := 0.9`, which the source and the recipe prose carry; the architecture figure
  (L6799) draws a 2×2 stem pool where everything else says 3×3/s2.
* Ch 6 `tab:mnv4_vs_mnv2` (L9828–41): six MobileNetV2 cells (peak LR 0.045@256, ×0.98/epoch,
  300–400 epochs, no smoothing, no EMA, RRC+hflip) contradict `tab:mnv2_vs_2018` twenty lines
  above and the README run (0.12@256, ×0.98/2.5 ep, 420, 0.1, EMA 0.9999, slim's crop+colour).
  Relabel the column "MobileNetV2 (paper)" or align it. "A fifth as often" (L9472, L9758) is two
  fifths. "77 images" (L9674) vs 2,792 − 2,714 = 78.
* Ch 7 Recap (L11547–48): "The two paths land close and not on top of each other, and the section
  says which rows are the suspects" — the section now reports a tie (77.17 / 77.21, p = 0.77) with
  no unequal recipe row. "+0.71 / seven tenths over MobileNetV2" (L10867–71) vs 90.04 − 89.25 =
  0.79 and "eight tenths" one line up. SE parameter count `C²/r + C/r + C` (L10321) is missing a
  factor of two. "b1 no-expand, b2/4/6/12 strided, the remaining nine residual" (L10804) leaves
  b9 and b16 uncounted. Two config comments in one listing contradict each other on bias decay
  (L11034 vs L11057).
* Ch 8: depthwise "at the wide point" (L11733) is MobileNetV2's layout, not ConvNeXt's; "last
  block of the third stage (s3b2: 768 channels)" (L12474) is the fourth stage; the stem is drawn
  "ConvBN" in a net with no BatchNorm (L12230); MLIR sizes 1,047 / 1,316 in prose vs 1,071 /
  1,317 in the table (L12454). Ch 9: McNemar counts 2,347 / 2,327 imply a 20-image gap where the
  headline says thirteen (L15219 vs L15287), because the pairing used the reference's CPU-f32
  rescore; say which arm was paired.
* Ch 12: LIGO "half the windows carry a chirp" vs 8,177 noise-only of 12,228 (runs confirm 4,051
  / 8,177); Boltzmann "recovers the quadrature row to the last digit" vs three of five columns
  differing; DDPM `tab:ddpm_scores` labels 0.0020 as the 1× floor while the multiples use 0.00159;
  Whisper "encoder and decoder the same size, sum within 2–3% of paper" fails for four of five
  sizes. Ch 13 opener "none of it is new codegen" (L19280) vs MuZero's "**One new codegen
  piece.**" (L19617).
* Ch 1: "The trainer is 54 lines … here it is entire" (L1981) — the file is 58 and the listing
  drops the module header; "27 operations where 19 would do" (L2408) — 18; "LeCun … around 92%"
  (L886) — 88% for the plain linear classifier; "three VJP record types … we build all of it
  here" (L826–36) — only `HasVJP` is Ch 1's. All four still open from the 10-18 fact-check.
* Front matter: "four install steps" (L273, L418) over a five-item enumerate.

### 1.6 Two vocabularies for one ladder, and other book-wide sweeps

* **Track vs tier.** Getting started speaks only of tiers (`lake run mnist/cifar/imagenette/
  imagenet`). Appendix A's Table A-1 has Tracks 1–4 with "2, 3 → Getting started", and the
  platforms table says "Track 2 on record, and of Track 3 the MNIST CNN …" — nothing in the book
  now says what distinguishes Track 2 from Track 3 (one trainer vs a tier, per the old Appendix).
  Keep "tier"; let Table A-1 map Track → tier once, or drop the 2/3 split.
* **Part I vs Part 1**: three roman stragglers (L488, L2452–53) against 30 arabic.
* **Positional words.** The float-rule pass removed them from float lead-ins; roughly 70 remain
  in prose and listing comments ("the run below", "the table above", "the reference number above"
  inside rendered configs). Ch 5–9 carry most. The two that point at floats (L2885, L3083) are
  the ones that break under reflow; the rest are style.
* **Hand-typed chapter numbers** beside `\ref`'d ones: "chapter-4 CNN" (L17120, L21287), "Ch 1 /
  Ch 2–3 / Ch 5" in Ch 5's stopping-point aside (L7653–76), "Chapter~3's CNN kit" (L19323).
* **Jacobian index convention.** Ch 1 prose (L1424–28) describes the m×n (output, input) table
  and calls `pdiv f x i j` an entry of it; the Lean has i as the input index. Foundations (L613)
  gets it right; Ch 1 does not, and dW is spelled four ways (L1457, L1623, L2011, L2095). The
  10-21 audit's §3.2 item, moved rather than fixed.
* **Repetition worth a cut**: Ch 7 tells the TF-RMSProp lesson five times and the EMA-over-BN
  lesson four; Ch 4's "two convs + 2×512 head, now eight convs" paragraph appears three times;
  Ch 1's "what stays open" list is given twice in 25 lines (L2449–58, L2473–78), both claiming to
  be the single statement; the "novelty is in the training procedure" refrain closes five Part 2
  entries; Appendix B states the proven / by-construction / cross-checked triad three times.
* **Undefined on first use**: He init, device residency, CLM, AMSGrad, "(identity)" in the
  architecture figures (Ch 1–2); Ghost-BN, biPath, "shows the pad red" (Ch 6–7); "tier 1 in our
  codegen scope" (Ch 8); "the 2-D toy demo" (Ch 12, L18272, its only mention); "Lanczos ceiling"
  (NQS). "Cotangent" and the shape convention are now defined in Foundations (fixed since 10-21).

## 2. What the readers said works

Every reader's "Overall" named the same strengths, which is worth recording so the fix pass does
not flatten them. Chapter 1's arc from the `pdiv` definition to a byte-exact StableHLO file;
Chapter 2's "Return on width"; Chapter 3's honest treatment of noise; Chapter 4's measurement
prose after the rewrite; Chapter 5's ablation section and its numerically airtight ImageNet
pairs (every Δ, window average, Wilson interval and McNemar count recomputes); the MNv4 and MNv2
pair paragraphs; Chapter 8's "recipe is the thesis" argument; Chapter 9's ladder framing
(whole-net VJP → rendered backward → step tie → loss gradient); the Boltzmann, NQS, CASP16 and
MuZero sections as models of reporting a small experiment against an exact answer; the ArASL and
agriculture demos' "what the headline hides" method. The Introduction's three-rules-five-tricks
thesis is the book's best page and the front matter now runs in the right order.

## 3. The fix pass, in order

1. **Decide ConvNeXt-T's published state** and make Ch 8's definition, two captions, knob
   table, S/B sentence, marker and App C agree (§1.1). This is the only item where the book
   contradicts itself about what it trained.
2. **Chapter 4's MLIR section** catches up with the rewrite (§1.2), plus the four lead-in
   residues and the "two specs" heading.
3. **Ch 7 Recap sentence; Ch 6 `tab:mnv4_vs_mnv2`; Ch 5 `tab:r50_a3_vs_2018` and the trainer
   listing** (§1.5). Table-vs-prose disagreements a reader can catch with the page open.
4. **Land the TinyGPT ladder** (§1.3) — the data is in `runs/`.
5. **Chapter 11's fact-check backlog** (§1.4): the FPN framing and `.fpnDetect` definition first,
   then the VisDrone / PlantDoc / EuroSAT / NEU / plant numbers, then the BraTS table citations.
6. **Markers past the rule** (§1.1 table): A2/A1's `[TODO` paragraph, MNv4's hours, the S/B
   "What is queued" paragraphs and dated smokes, App A's "next run / to come", App B's "owed".
7. **Carried-over sentence fixes** from the 10-18 and 10-21 audits (§1.5 last bullets; §5 marks
   each "still open from").
8. **Vocabulary sweep** (§1.6): Track/tier, Part I, the two float-positional phrases, hand-typed
   chapter numbers, the Jacobian convention paragraph.

Structural suggestions the readers made, each one move: Ch 1's MNIST dataset overview lives in
Ch 2 §Example after Ch 1 has trained on it (move to Ch 1); Ch 3's "three priors" lead-in
(L3232) is separated from its list (L3342) by the whole Run it first; Ch 5's "A reasonable
stopping point" (L7648–80) splits the R34 and R50 halves of the ImageNet section (move after the
Recap); Ch 11's six demos should share the ArASL shape (data → table → figure → "the columns
are the result" → caveats → "what this is not"), each naming its `runs/` directory once (none
does today).

## 4. Gates this pass suggests

* A `--positional` report in `book_floats.py` (or a new check) for `(below|above)` in prose and
  listing comments, as a census not a gate.
* `book_counts.py` could learn the per-chapter "N install steps", "five other task families",
  and the budget-table narrative counts ("thirteen chapter networks are tied") — all hand-typed
  today and two of the three wrong or inconsistent.
* The render-guard sentence in Appendix B names a specific artifact; a check that the artifact
  the "MLIR:" sections quote matches it would have caught §1.2.

## 4a. Status — 2026-10-26, the first fix pass (working tree, uncommitted)

Applied to `blueprint/src/content.tex`, pending the user's okay on the preview: §1.2 in full (the
Chapter 4 MLIR section now quotes `cifar8wb_bbn_sgd_train_step.mlir`, n = 2048, `[0, 2, 3]`,
and names the three `cifar8bbn` theorems and `thm:bnBatchTensor4HasVJP`; Appendix B's
render-guard sentence follows); every §1.5 item except the ConvNeXt-T ones and the A3 77.60/77.61
(both readings are real: training log 38,801 vs the 236-rescore 38,803); §1.4 in full
(`.fpnDetect` gets Definition layer:fpnDetect, the kit's codegen-backed count is four, the
"limitations discussion" and "don't linearize" sentences are gone, VisDrone's four numbers now
come from its table, PlantDoc/EuroSAT/NEU/plant numbers match theirs, the three BraTS tables are
cited first, 38 `\S~\ref{layer:…}` print as "Definition"); "five install steps"; the three
"Part I" stragglers. Gates pass; preview build HEAD → tree: errors 0 = 0, overfull 72 → 71,
pages 264 → 265, 124 changed paragraphs.

Left for later by the user's call: ConvNeXt-T (§1.1, when the pair lands), TinyGPT (§1.3). Not
yet touched: the remaining §1.1 markers (A2/A1, MNv4 hours, S/B, App A/C), the Jacobian
convention paragraph, the Chapter 7 repetition, Track vs tier, positional words.

## 5. Per-range reports

Verbatim from the readers, most severe first within each range. "Still open from <audit>" marks an item a prior planning doc already lists.

---

### Front matter (L1–819) and Appendices A–D + back matter (L19952–21789)

- **[med] [inconsistency]** `L273`, `L418`: "four install steps" / "Four steps put a trained network on your GPU", but the Install enumerate has five items (Lean, plugin, shim, data, build-and-run). Say five, or fold step 5 into "One command per tier".
- **[med] [undefined term]** `L20050–20052` (Table A-2): "Track 2 on record, and of Track 3 the MNIST CNN…", "Track 2 and the MNIST tier of Track 3". Track 2 vs Track 3 is never defined anywhere in the book since Getting started was rewritten in tiers (Table A-1 lumps them as "2, 3 — Getting started"). A reader cannot tell what "Track 2" is. Define (one trainer vs a tier) in Table A-1 or drop the split.
- **[med] [dev-history]** `L20050`: Orin "…is the next run"; `L20051`: Mac "CIFAR and ResNet-34 train, their full runs to come". Still open from the 10-21 audit (then L19556–58). State what is on record and stop.
- **[med] [dev-history]** `L20981–20983` (App C): "Every row has run. One chapter prints a pair from an earlier conf than the row trains today --- ConvNeXt-T --- and its marker names it." Queue state in an appendix; still open from the 10-21 audit (then L20481). Goes when the ConvNeXt pair lands; until then it is the one sentence that makes App C read as a status board.
- **[med] [stale number]** `L487`: `lake run cifar … (~13 min)`. Commit 603c7624 (2026-10-24) dropped the identical "~13 min on a 4060 Ti" from the lake docstring as unsourced; the book keeps it. The tier also grew a third binary (`cifar8wb-bbn-ablation`, 12 arms) on 10-24, so the number predates the tier it times. Re-time or drop.
- **[low-med] [inconsistency]** `L488`, `L2452–2453`: "Part-I" / "Part~I" (roman) vs "Part 1" everywhere else (30 uses; `\thepart` is arabic). Three stragglers.
- **[low-med] [wrong count]** `L21264`: "the five other task families in the book, which are detection, segmentation, language, signal processing and physics" — the Organization chapter (L318–320) lists "detection, segmentation, language, generation, physics and signal processing" and the bullets that follow include structure (CASP16) and NQS. Pick one list and use it in both places.
- **[low-med] [wrong path]** `L21107`: "fetched or built by a script in the repository root" — the scripts live in `scripts/datasets/` (the table header two lines later says so).
- **[low-med] [collision]** Table D-2: "M\"uller-Brown density … MB" and "MapBiomas Collection 4 … MB" share an abbreviation in one table.
- **[low] [positional/placement]** `L20184`: `\begin{figure}[ht]` for Figure B-1 is the only non-`[H]` float in the book (planning/book_floats.md says `[H]` everywhere is the manuscript choice). Either intentional (the chapter map is tall) or an oversight; if intentional the caption/lead-in must not assume position (it doesn't today).
- **[low] [queue language]** `L20809`: "with that one constant still owed to a measurement" — honest limitation, but "owed" is the planning vocabulary. "which nothing here measures" says the same as a property.
- **[low] [loose claim]** `L20885–20886`: "Full-depth CIFAR and all five deep nets stay closeness-only" vs `L20740–20744` three of those five (B0, ConvNeXt, ViT) have no float budget for their defining operators, so they are not even closeness-covered as nets. "the deep nets have no descent theorem" is what is true.
- **[low] [tone/count]** `L46–48`: "ten years of networks, ResNet through the Vision Transformer" — ResNet (2015) to ViT (2020) is five. Either "a decade of networks" without the endpoints, or "ResNet through ViT".
- **[low] [wording]** `L21119–21120`: "Imagenette … is the recipe of Chapters 5–9" — a dataset is not a recipe; "is the dataset of".
- **[low] [hard-typed chapter number]** `L21287`: "The chapter-4 CNN (arasl-signs)" — every other chapter mention is `Chapter~\ref{chap:bn}`.
- **[low] [last sentence of the book]** `L21788–21789`: "blame not the compiler nor the models but the author, not the tools." — "not the tools" after "but the author" is a double negative of the same clause. Cut the tail.
- **[low] [dead macro / stale comment]** `L8`: `% The one marker every BatchNorm pair carries until its sync-BN re-run lands.` (orphan comment, flagged 10-21, still here). `L22–30`: `\sqstatus` ("Status: rendered, not trained.") is defined and never used; its comment says "MobileNetV4's has run … the rest will run eventually". Delete both.
- **[low] [open from book_floats.md]** `L978`: the `\depgraphlegend{}` line after Figure 1-2 is still a standalone paragraph (the note's §2 suggested folding it into the caption). Also still open there: whether `[H]` survives production (see Figure B-1 above).

Verified fine (no action): budget table sums 44 / 9 / 45 = 98 and match the prose; comparator 13 + 39 + 58 = 110; "thirteen chapter networks are tied" matches the budget table's ties (1+1+1+3+2+2+1+1+1); App C's "six networks / seven rows / fourteen rows in `lake run imagenet`" is internally consistent; Appendix order A–D matches the Organization chapter; Foundations' five settled points now cover the 10-18 "parked concepts" (parameter gradients, R vs floats, batch lifting, SGD-only, two trainers), the shape convention and "cotangent" are defined; Appendix B's "three generators" is now two and IRPrint is gone.

**Overall.** The front matter reads well and in the right order now (install → foundations → chapter 1); the Introduction's thesis (three rules, five tricks) is the book's best paragraph and the Organization chapter no longer front-loads the theorem budget. Appendix B is still the longest and most defensive piece of prose in the book: three places say "what is proven / by construction / cross-checked" (opening, §B.3 close, §B.4 "Each kind fails differently"), and the "Inside a bridge theorem" subsection still teaches the per-operator `Back` IR when the shipped artifacts are `SHlo` renders; it is now labelled as the ancestor, which is enough for correctness but a reader meets two IRs for one idea. The one structural change I would make: Appendix A's "tracks" and Getting started's "tiers" are two vocabularies for one ladder; keep "tier" (the lake targets are named that way) and let Table A-1 map Track→tier once.

---

### Review B: content.tex L820–3208 — Part 1 opener, Ch 1 "MNIST: linear classifier", Ch 2 "MNIST: 1D MLP"

Line numbers are the current `blueprint/src/content.tex` (HEAD e981f8a6). Prior-audit items that are
still in the text are marked "still open from <audit>".

#### Findings

- **[high] [inconsistency / stale]** `L1981`: "The trainer is 54 lines including its docstring, so here it is entire" — `apps/mnist/MainMnistLinearVerified.lean` is 58 lines, and the listing that follows (L1984–1993) silently drops `module`, `public import …`, `@[expose] public section` and rewrites `public import` as `import`, so "here it is entire … all of it" (L1995) is not true of the printed text. **Still open from book-fact-check-2026-10-18** (its §"54 lines and all of it are stale"). Fix: "58 lines"; print the module header or say it is omitted.

- **[high] [wrong count]** `L2408`: "the duplication is a fair picture of what naive rendering costs: 27 operations where 19 would do." The listing's own comment (L2360) says `%v13`–`%v21` is "v0-v8 emitted a SECOND time" = 9 ops, so 27 − 9 = 18 (17 if `%v22`'s zero constant reuses `%v4`). **Still open from book-fact-check-2026-10-18.** Fix: "where 18 would do".

- **[med] [external fact]** `L886–888`: "That is the going rate for a linear classifier on MNIST, and LeCun's original 1998 benchmark put a comparable model at around 92%." LeCun et al. 1998 list the plain linear classifier at 12.0% error (88%); only the deskewed (8.4%) / pairwise (7.6%) rows are near 92%. **Still open from book-fact-check-2026-10-18.** Fix: "88% for a plain linear classifier, about 92% with deskewing".

- **[med] [inconsistency]** `L826–831` vs the book: "Every backward function in this book is a VJP built by composing the foundation here. That foundation is … three VJP record types (HasVJP, HasVJPMat, HasVJP3, one per tensor rank)" and L836 "we build all of it here". Only `HasVJP` (L1215) is defined in Ch 1; `HasVJP3` is Definition at L3494 (Ch 3) and `HasVJPMat` is in §matrix_machinery (Ch 9). **Still open from book-fact-check-2026-10-18.** Fix: "one record type here, lifted to matrices and rank-3 tensors in Chapters 3 and 9".

- **[med] [inconsistency]** `L923–924` vs `L937–938`: the spines caption says "All five reach this chapter's calculus and Chapter~\ref{chap:bn}'s normalisation lemmas", but the prose right after says "this chapter's row is the only one every column crosses." If all five certificates reach Ch 4's lemmas, Ch 4's row is crossed by every column too. Fix: "the only row every column crosses that lies below Chapter 4" or drop "only".

- **[med] [clarity / convention]** `L1424–1428`: "A layer takes n numbers in and puts m numbers out, so … an m × n table of slopes, one per (output, input) pair. That table is the Jacobian, and pdiv above is one entry of it at a chosen (i, j)." Definition L1000–1006 has `pdiv f x i j` for f : Vec m → Vec n with *i the input index* (an m-in × n-out table). The prose here uses the transposed convention and then says `pdiv … (i, j)` is "one entry of it", so a reader takes `pdiv f x i j` = ∂y_i/∂x_j, the opposite of the Lean. The convention paragraph at L1503–1512 fixes W's orientation but not the Jacobian's. **Still open from book_copy_audit_2026-10-21 §3.2 ("Shape-convention flip")**, now inside Ch 1. Fix: state once that `pdiv f x i j` is the slope of output j in input i (rows = inputs), and write the dense example with that index order.

- **[med] [inconsistency]** `L1457` "dW = dy ⊗ x" vs `L1623` "dW = x ⊗ dy" (Theorem denseWeightGrad_correct) vs `L2011` "∇_W ℓ = (ŷ − e_t) ⊗ x" vs `L2095` "dW = xᵀ dy". Four spellings of the same gradient; the note at L1503–1512 ("One transpose, three spellings") only reconciles `dx`. Fix: add one clause to that paragraph: "and dW is x ⊗ dy in the Lean, dy ⊗ x in the prose".

- **[med] [dangling / misreference]** `L2155`: "The section above treated `linearVerified.toNet.trainLinear` as a black box." The section immediately before §What's inside .train? is "MLIR: Linear" (L2061), which never mentions `trainLinear`; the black-box treatment is in §Example (L1995–2007). Fix: "The Example section treated …".

- **[med] [repetition]** `L2449–2458` ("Where this stands … What stays open is three things, stated once here and accounted for in Appendix …: the theorems are over ℝ while the GPU runs a finite precision, and §precision is the budget that sits between them; each operator's printed text is trusted to compute what its graph node denotes …") is restated 20 lines later in the Recap `L2473–2478` ("What it leaves open is stated once here and carried through the book: the theorems are over ℝ while the card computes in a finite format, with §precision the budget between them, and each operator's printed text is trusted to compute what its node denotes"). Both claim to be the single statement. Fix: keep the Recap version, cut the first to one sentence pointing at the appendix.

- **[med] [Recap does not match chapter]** `L3196–3197`: "Two witnesses, one hand-built and one at the trained weights, show the gradient is not the zero function." Nothing in Ch 2 (theorems L2606–2820, Example, MLIR: Dense) mentions these witnesses, a hand-built one, or non-vanishing of the gradient. Either add the result to the theorems/Example section or drop the sentence.

- **[med] [structure]** `L2829–2857` "Dataset overview": MNIST (60k/10k, 28×28, 1998, flatten to 784) is introduced in Ch 2 after Ch 1 has already trained on it, cited "the full 10,000-image test set" (L884) and drawn "Input 28×28 flatten → 784" (L1891). "Our goal in this chapter is to correctly classify a held-out test digit" (L2846) is Ch 1's goal too. The paragraph also changes register ("It's a collection", "We're going to ignore") against Ch 1's voice. Fix: move the overview to Ch 1 §Example (before the architecture figure) and leave Ch 2 a one-line reminder.

- **[med] [inconsistency]** `L2049` "Ch~8 replaces ReLU with GELU. One new operator." vs `L2140` "Those operators are dense layers, convolution, BatchNorm, the residual fan-in, depthwise convolution, squeeze-excitation, layer scale, and attention" and Ch 8's MLIR section is "MLIR: Layer Scale" (L12464). Which is Ch 8's "one new operator", GELU or layer scale? Fix: make the two lists agree (GELU and layer scale, or name one in both).

- **[low] [inconsistency]** `L1753`: "Three certificates close this chapter and each of the next three". Ch 2 has three (mlp_fold, mlp_loss_grad, mlp_sgd_descends), Ch 3 three, but Ch 4 has at least six (`thm:cifar_fold` L4978, `thm:cifar_loss_grad` L5000, `thm:cifar_bn_fold` L5033, `thm:cifar8bbn_loss_grad` L5191, `thm:cifar8_loss_grad` L5242, `thm:cifar8_sgd_descends` L5279). Fix: "and each of the next two" or "the same three kinds of certificate close Chapters 2–4".

- **[low] [clarity]** `L2064`: "Nothing between the theorem and the GPU rewrites it." vs `L2399–2402` "Whether the copy survives to the GPU is the compiler's business — common-subexpression elimination is a standard pass" and `L2457` "the compiler between the text and the card is trusted, not proved." XLA does rewrite it. Fix: "Nothing of ours rewrites it: the text handed to XLA is the text the theorem is about."

- **[low] [inconsistency]** `L2135`: "Each architecture chapter closes with an 'MLIR: operator' section" — every chapter closes with a Recap; the MLIR section is second-to-last. Fix: "carries".

- **[low] [template drift]** Ch 1 runs Run it first / How it works / The theorems / Example / MLIR: Linear / What's inside .train? / MLIR: Training Step / Recap: two MLIR sections with a driver walk-through between them, and the only "How it works" section in Part 1. Ch 2 follows the template exactly. Not necessarily wrong for the foundation chapter, but the Part opener (L820) or L833–841 could say the chapter is longer than the template on purpose; the "Where this goes" list at L2032–2056 already does the opener's job.

- **[low] [hygiene]** `L2153` `\label{sec:mlp_inside_train}` names a Ch 1 section "mlp"; L2318 and L2444 cite it as "Section/§". Rename `sec:linear_inside_train` (or similar) before more chapters cite it.

- **[low] [positional]** Float-positional: `L2885` "The network above is a VerifiedNetSpec" (the figure fig:mnist_mlp_arch), `L3083` "The diagonal points plotted above are one run each" (fig:mlp_width). Text-positional: `L1411` "Everything above is machinery", `L1428` "pdiv above", `L1455` "transposing the picture above", `L2017` "the softmax-CE gradient … above", `L2322` "The 'MLIR: Linear' section above", `L2446` "the listing above", `L2451` "The scheme above", `L2564` "the interval printed above", `L2825` "The theorems above", `L2930` "the five-entry layers list above", `L3167` "the one-example chain above". `L961` "the legend after this one applies to all of them" (book_floats.md §2 open item: fold the legend into the fig:depgraph_tensor caption). Fix the two float ones ("Figure 2-2's network …", "The diagonal points in Figure 2-4 …"); the rest are tolerable but "section above" at L2155/L2322 should name the section.

- **[low] [dangling-ish]** `L974`: the Ch 1 depgraph caption says "Figure~\ref{fig:chapter_map} is the same graph at the scale of chapters" — that figure is in Appendix C (L20199), while fig:spines (L932, same chapter, one page earlier) is already the chapter-scale graph. Fix: cite fig:spines here.

- **[low] [caption]** `L918–931`: the spines caption is nine sentences and argues ("their chains are twice the length", "Not counted are …"); the chapter nets are "The five chapter networks" without saying which five (Part 1 has nine chapter networks; the five are the ImageNet ones). **Still open from book_copy_audit_2026-10-21 §3 wording ("five chapter networks vs thirteen")**. Fix: "The five ImageNet chapter networks' …", move the argument to prose.

- **[low] [repetition]** `L938` "Each chapter's theorems section opens with the same picture at the scale of its own statements", `L961` "Every chapter's theorems section opens with its own", `L975–976` "Every chapter's figure is drawn this way". Three times in 40 lines. Keep one.

- **[low] [count / provenance]** `L899–906` "Trained five times over, the linear model finishes at 92.10% every time … worth a single image at epochs 3 and 9" and `L2562–2564` "Run at five seeds it averages 97.73% with a spread of 0.06 either side" — no `runs/` directory for either five-run set, where every other number in the range carries one. `L2565–2568` "it holds for the rest of the book: changing the seed moves these numbers less than a single run can pin them down" is a book-wide claim made from two MNIST nets; soften or point at where it is shown.

- **[low] [inconsistency]** `L3072` "averages 93.70% over five seeds, with a spread of 0.56" then `L3077–3080` "The first three seeds land between 93.14 and 93.70% … the fourth comes in at 94.53%", i.e. 0.83 above the mean. At L2563 "spread of 0.06 either side" means half-range; here 0.56 cannot be the half-range. Say which statistic "spread" is (std dev?) in both places. Also "about a point and a half above what the 8→8 net manages (92.0%)": 93.70 − 91.99 = 1.7.

- **[low] [stale-adjacent]** `L845–846` "Four commands and about three seconds of GPU time" — the four commands do not install the PJRT plugin the shim dlopens; Getting started (L415) now covers it but Ch 1 never points there (first pointer is L2314, 1,500 lines later). **Partly open from book-fact-check-2026-10-18** (its "three seconds" item). Fix: "(after the install in Getting started)".

- **[low] [clarity]** `L2028`: "takes the same dataset and the same recipe to 97.81%". The MLP uses He init where the linear model is zero-initialised (L1958–1962, L2527 "He init"); same lr/batch/epochs, different init. Fix: "the same dataset, batch size and learning rate".

- **[low] [undefined terms]** Jargon used in the range without a definition anywhere before it: `L1942` "0 is He(fan-in)" and `L2269` "He-initialised" (He init is never defined; first appears as a transcript token at L2527); `L2193` "a residency check" and `L2294` "under device residency those two are stale by design" (residency never defined); `L2643` "the diagonal indicator CLM" (abbreviation never expanded; L1157 only has `reindexCLM`); `L893` "the 95% Wilson interval" (one-clause gloss, no reference); `L1893`/`L2868` "Dense 784→10 (identity)" in both architecture figures (identity activation, never said); `L2427` "the AMSGrad counterexample" (the Reddi–Kale–Kumar non-convergence example, named by the paper that fixed it; a reader will not know). `L3015` "the faithful emitter" (first use of "faithful" for the emitter in the range; L2423 uses it for optimizers).

- **[low] [inconsistency]** `L2418` "Adam is available here and the deeper chapters use it" vs `L2421` "to 2,293 under AdamW" and the filename `cifar8w_bn_adam`. Pick Adam or AdamW. (Counts verified: 1,001 and 2,293 `stablehlo.` ops in the two renders.)

- **[low] [inconsistency]** `L2452` "every architecture in Part~I trains under" (twice in the paragraph) vs "Part~1" at L2032, L734, L762, L601, L279. One style.

- **[low] [clarity]** `L2286`: "Chapter~1's run does 468 of those per epoch" — written inside Chapter 1. "This chapter's run".

- **[low] [clarity]** `L2468`: "a HasVJP record is a backward function bundled with …; and a trainer is four of those composed, forward, loss, backward, step". "Those" reads as four VJP records; forward/loss/step are not VJP records. Fix: "a trainer is four pieces composed".

- **[low] [clarity]** `L2902–2906`: the spec sets `lossSlot := true`, then "Five entries where Chapter 1 had one, and nothing else about the type changes." A reader sees a new field. Fix: "and one new field, lossSlot, …".

- **[low] [hygiene]** `L2666` `\label{thm:reluHasVJP}` on a `\begin{definition}` block (`ax:mlpHasVJP` at L2680 is also a definition under an `ax:` label). **Still present from book_theorems_check_2026-10-21** (its L129/L296 note).

- **[low] [hygiene]** `L3181` "Appendix~\ref{sec:verified_codegen}" — the label is a section inside Appendix C (L20363), so this renders "Appendix C.n"; use `\S\ref` or cite `app:verification` as L2149/L2458 do.

- **[low] [hygiene]** Spelling mix in the range: "normalisation" (L923), "initialis-" (L2173, L2192, L2208, L2266, L2269) vs "zero-initialized … initializer" (L901–902); "neighbourhood" (L2644, L2649) vs "neighborhood" (L2654, same proof). `\S~\ref` (14×) vs `\S\ref` (L2058, L2477, L2906, L2913…). The run transcript at L857 says "two long lines are wrapped" and the compile lines are the two; fine. Listing L2333–2384 says "Nothing else is removed" but the committed file's `module @m { … }` wrapper and its own comment line (`// ── linear train step: every op is pretty(verified AST node) ──`) are replaced by the book's band comments; say "comments are the book's".

- **[low] [reader before Ch 1]** Assumed rather than stated before Ch 1: the learning rate (0.1) is never given in Ch 1's prose or transcript — it first appears as `0.00078125 = 0.1/128` at L2120; the MLP transcript prints `lr=0.100000` but the linear one does not. One clause in Run it first ("SGD at 0.1, batch 128") would fix it. Everything else Ch 1 leans on (cotangent L649, `dense` L223, the five-line loop L724, shim/lowerer L422–454) is in the front matter.

#### Overall

The range reads as the book's strongest stretch: Ch 1 goes from the pdiv definition to a byte-exact StableHLO file in one arc, every number in the transcripts checks against `runs/` and the committed renders, the Lamport-style proofs are auditable step by step, and Ch 2's "Return on width" is the best piece of empirical writing in the two chapters (its arithmetic — 755×, 364×, 74×, +5.0/+1.0, 14× — all checks). The defects are mostly carried-over fact-check items (54 lines, 27/19, LeCun, "all of it here") and a cluster of index-convention slips around the Jacobian and dW that a careful reader of the Lean will trip on. Ch 2's Recap claims a result (two non-zero-gradient witnesses) the chapter never shows, and Ch 1 states its "what stays open" list twice within 25 lines. The one structural change: move the MNIST dataset overview from Ch 2 §Example into Ch 1 §Example, where the dataset is first trained on, and let Ch 2's Example begin at the architecture.

---

### Review C — content.tex L3209–6111: Chapter 3 "MNIST: 2D CNN", Chapter 4 "CIFAR with BatchNorm"

Read against the 2026-10-24 rewrite (35784fcc: batch-statistics BN is the headline, per-image a row). Verdict on that question first: the intro, Run it first, the three specs, the spec-to-proof tie, Lever 1–3, the optimizer/bf16 tables and the Recap all agree with the new headline. The one section that did not move is **MLIR: BatchNorm**, which still shows and names the per-image artifact as "the chapter's trained artifact" and hands the `[0,2,3]` reduction to "the next chapters". Everything else is smaller.

#### Findings (most severe first)

- **[high] [stale / inconsistency]** `L5997–5998`: the MLIR section still presents the per-image render as the chapter's trained net: "Here it is in the chapter's trained artifact, `verified_mlir/cifar8w_bn_sgd_train_step.mlir`, at the eighth convolution's BatchNorm". The chapter's headline run (`L4463–4470`, `L5565–5571`) trains `cifar8wb_bbn_sgd_train_step.mlir`, and `L4441–4443` promises "Where this chapter says ``BatchNorm'' without qualification it means the batch form". Either call the listing what it is ("the per-image render, `cifar8w_bn_…`, whose `[2,3]` reduce is the easier one to read") and add the `[0,2,3]` lines from `cifar8wb_bbn_sgd_train_step.mlir`, or swap the listing.
- **[high] [stale]** `L6051–6056`: "`[2, 3]` are the two spatial axes, so each statistic is taken per image … a batch-statistics BatchNorm reduces over `[0, 2, 3]`, and that is what the ResNet and MobileNet artifacts of the next chapters emit." After 35784fcc it is also what *this chapter's* six `cifar8wb_bbn_*` artifacts emit and what Theorems `thm:cifar8bbn_step_tie`/`whole_back`/`loss_grad` are about; the sentence still reads as if batch statistics arrive in Chapter 5. Same paragraph `L6063–6066`: "Theorems cifar8bn_step_tie and cifar8_step_tieG state that every parameter update in this file is the certified step" — the batch-statistics ties (`thm:cifar8bbn_step_tie`, `thm:cifar8bbn_whole_back`) and the new `thm:bnBatchTensor4HasVJP` are absent from the MLIR section entirely, and `thm:cifar8bn_step_tie` is stated about `cifar8_bn_train_step.mlir` (`L5080`), not "this file" (`cifar8w_bn_sgd_…`). Caveat `L6079` "The listing is one of the eight BatchNorms of the trained net" inherits the ambiguity.
- **[med] [inconsistency]** `L4970`: "the two-convolution CIFAR net's fold and loss gradient" vs Theorem `thm:cifar_fold` `L4984–4985`: "the two-stage CIFAR net's four convolutions" (fourteen updates = 6 dense + 8 conv). Should be "two-stage".
- **[med] [stale / inconsistency]** `L4972`: "the packed steps this chapter's runs train (the same backward chain handing each gradient to a separate optimizer)" — after the rewrite the chapter's runs train the batch-statistics steps; the packed per-image steps (`thm:cifar8_step_tieG`) are the per-image row. Also this lead-in omits `thm:optimizer_tails_faithful`, which closes the section (`L5306`).
- **[med] [ambiguity]** `L4988–4989`: "the committed text is the batch-128 instance read one image at a time, and the eight-convolution ties below are batched." `thm:cifar8_step_tie`, `thm:cifar8bn_step_tie`, `thm:cifar8_step_tieG` are per-image renders ("twenty-two without BatchNorm and thirty-eight with it"); only the `cifar8bbn` trio is "at batch N". In a chapter that now uses "batch" for the statistics group, "batched" here (op family) will be misread. Say "rendered in the batched op family" or drop the clause.
- **[med] [stale]** `L4437–4438`: "which is what lets the step theorems below be stated one example at a time" — true only of the per-image step theorems; the chapter's own batch-statistics step theorems are stated at batch N (`L5126–5130`). Reword to "lets *its* step theorems be stated one example at a time". Also positional "below" (twice, `L4437`, `L4439`).
- **[med] [stale heading]** `L5479–5481`: "Both specs are written out next." / `\subsection*{The two specs, differing by one keyword per layer}` / `L5488` "That one keyword per conv layer is the entire difference." — three specs follow (`L5565`), and the third differs by `runningBN`, not a layer keyword. Retitle "The three specs" and fix the two lead sentences.
- **[med] [inconsistency]** `L5405–5407`: "Every accuracy in this section is therefore the median of five runs at seeds 1–5" vs the head-width sweep: caption `L5922` "Each point is one run" and `L5873–5874` "76.40% narrow, 77.85% wide" (single runs). Scope the claim to Levers 1–3.
- **[med] [inconsistency]** `L5392–5394`: "This 2×512 head … yet trains to within a point of it" vs `L5873–5874`: "the two land a point and a half apart … 76.40% narrow, 77.85% wide" (1.45). Make the up-front bullet say "within a point and a half" or "within the test set's own interval".
- **[med] [inconsistency]** `L5380–5381`: "AdamW lands a point under SGD once BN is in" — true at batch statistics (75.7 vs 76.8) but not per image (74.3 vs 74.5, `L5695`). `L5700–5704` says the right thing ("under SGD rather than between the two"); the bullet should say "at batch statistics".
- **[med] [stale, still open from book_copy_audit_2026-10-21 §2 Ch 1–4]** `L5711–5712`: "Reading down the columns recovers Lever~1, and this time it recovers it everywhere." — "this time" narrates a previous version of the table. Drop "and this time it recovers it everywhere" → "and recovers it in every column".
- **[med] [stale, still open from book_copy_audit_2026-10-21 §2 Ch 1–4]** `L5887–5888`: "the same $D_1$ that was hard-wired to 64 is now a parameter of the verified emitter" — dev history. → "the head width $D_1$ is a parameter of the verified emitter".
- **[med] [repetition]** The "two convolutions + 2×512 head, now four stages / eight convolutions, the depth ResNet-34 scales to thirty-four layers" paragraph appears three times: `L4361–4370` (chapter intro), `L5348–5356` (Example intro), `L5417–5425` (Architecture). Keep one full statement and a one-clause reminder.
- **[med] [clarity]** `L5617–5619`: "because a schedule is a fourth thing changing and this section is about the third" — the subsection is Lever 1 (normalization), so "the third" has no referent (levers are numbered 1–3 and this is the first). Probably "and this subsection is about one" or "about normalization".
- **[med] [structure]** Ch 3: `L3232–3234` ends "Convolutional networks fix this by building three priors directly into the architecture" and the list of those priors only arrives at `L3342` "Three properties baked into a convolution", after the 100-line Run it first (transcript, n30 figure and its statistics). The lead-in and its enumerate should be adjacent; move the n30 discussion (`L3304–3340`) to Results, which already discusses run-to-run spread (`L4166–4180`).
- **[low] [inconsistency]** Two different causes given for CNN nondeterminism: Ch 3 `L3299–3300` "because a convolution's weight gradient accumulates in an order the GPU is free to vary" vs Ch 4 `L5403–5405` "because XLA selects convolution algorithms per process". Both may be true; say so once or pick one.
- **[low] [inconsistency]** `L4346`: Recap "Theorems cnn_fold and cnn_loss_grad tie the four convolution updates and every gradient node" vs `thm:cnn_fold` `L3736` "all ten parameter updates". Say "all ten updates".
- **[low] [positional]** `L3334–3335` "The second describes the picture above"; `L4030` "the same fact the backward passes above make"; `L4537` "the number above"; `L5399` "Every run below"; `L5412` "the text below"; `L5589` "the listing above"; `L5769` "the NaN above"; `L5926` "the levers above ran at a constant rate"; `L6053–6054` "the section ``What BN actually is'' above" (also refers to a `\prosesection` by its title rather than a label). `L3411` "the Jacobian above" and `L4296` "Above it" are within-formula/listing and fine.
- **[low] [inconsistency, rounding]** `L5661–5662` "the per-image form 5.8" and `L5714` "+5.8, +4.2" are computed from unrounded medians; the table's rounded cells (`L5694–5696`) give 74.5−68.8 = 5.7 and 76.3−72.2 = 4.1. Either compute from the table or say the gaps are from the unrounded medians.
- **[low] [clarity / count]** `L5932`: "The $128\times$ wider head buys nothing measurable" — the plateau just described runs $d=16$ to $4096$ (256×); 128× is 32→4096. State which pair.
- **[low] [clarity]** `L4455–4456` "about seven minutes of GPU time" then `L4522` "Forty epochs in about a minute" — both right (six arms), but the reader has to work it out; say "about seven minutes for all six arms".
- **[low] [clarity]** `L5681–5682`: "each at its own tuned learning rate, all on the identical pipeline, the same 40 epochs and the same constant rate" — "its own rate" and "the same constant rate" in one sentence; mean "each rate held constant".
- **[low] [dev detail]** `L5890–5891`: "Dealt across three of the box's four cards, the whole curve … is a four-minute run" — "the box" is undefined for the reader; wall-clock on the author's machine is not book content.
- **[low] [name mismatch]** `L3985`: "The `.conv2d` backward pass is the theorem…" — the `layers` entry is `.conv` (`L3947`, `L4019`).
- **[low] [overstatement]** `L3938–3939`: "The only thing that changes from Chapter 2's training program is the `layers` list" — `name`, `slug`, `inC`, `imageH/W`, `blurb` and `lossSlot` also change (compare `L2895–2900`). Fine as a figure of speech; tighten to "the only thing that matters".
- **[low] [jargon]** `L4287`: `maxPoolFlatHasVJPAt` appears once, undefined; the chapter's max-pool record is `maxPool2HasVJP3` (Def. `ax:maxPool2HasVJP3`). A clause tying the two would help.
- **[low] [hypothesis naming]** `L5253`: ε > 0 is tagged `[hq]` in `thm:cifar8_loss_grad` while every other BN theorem in the chapter tags it `[hε]`. Verify against the Lean; if the Lean name is `hq`, fine.
- **[low] [forward reference]** `L5141–5142`: proof of `thm:cifar8bbn_step_tie` says "in the batched vocabulary of Theorem resnet34_step_tie", a Chapter 5 theorem the reader has not met. Add "(Chapter~\ref{chap:residual})".
- **[low] [self-reference]** `L4106–4107`: inside Chapter 3, "Chapter~\ref{chap:cnn}'s 10-class MNIST CNN has 3.5M" → "this chapter's".
- **[low] [repetition]** "First place in the book where the math needs real analysis beyond chain-sum-product" is said at `L4588–4592`, `L5988–5989` and `L6085–6088`; "hardest chapter/proof in the book" at `L4375–4376` and `L6085`. Three is one too many for the first; the Recap's is the one to keep.
- **[low] [verify]** `L4519` transcript final 77.41 coincides exactly with the bf16 SGD seed-1 value in Table `tab:cifar_bf16` (`L5822`), and is not any of the five fp32 SGD seeds (`L5821`). It is a separate run (`runs/2026-10-24-cifar8wb-bbn-xla-cuda/`) so it need not match, but worth one check that the transcript is the fp32 arm.
- **[low] [unverifiable]** `L5848–5856` op-family deltas (+2.0/+1.7; −0.11/+0.37/+0.19) and `L4172–4176` "79% of the time … 92%" have no table in the text to check against; both say where the runs are, so briefly fine.
- **[low] [borderline dev-history, still open from audit (listed as borderline)]** `L5861–5865` "An fp8 (E4M3) arm exists in the repository and is left out of this table on purpose" — acceptable as a scope note, but "exists in the repository" is repository talk; "the renderer also has an fp8 arm" reads as a book sentence.

#### Checks that pass (not repeated above)
Hand-typed counts verified: CNN 10 params / 3,489,130 floats; 3,211,776 first dense; 9,568 backbone = 0.27%; 5.2× the MLP's 669,706; eleven-entry list; 60K at d=8; 8-of-10 widths within 0.4; 96.66 and 93.52 tails; 29 of 30 in 98.48–98.94. CIFAR: six theorems then `bnHasVJP`; 14/22/38 updates; 16 running-stat slots; 23 bf16 conv ops; 334K/374K/13K/53K parameters (25×, 7×); seventeen-layer composite; all three tables' medians/ranges/deltas (−0.21/+0.57/+1.02; 2.96/2.18/2.25; 74.9–77.9) agree with the per-seed table; thirty arm-runs; +8.0/+5.2/+2.9; nine overlapping intervals and the d=8 exclusion (75.1–76.8 vs 77.0). Every float in the range is cited by number before it appears and captions describe rather than argue. Headings run Run it first → The theorems → Example → MLIR → Recap in both chapters; both Recaps match their chapters' new content.

#### Overall
The two chapters read well and the Chapter 4 rewrite landed cleanly almost everywhere: the transcript, the three specs with `runningBN` as the one-field diff, the spec-to-proof tie naming the `cifar8wb_bbn` theorems, the three-row tables and the Recap all say the same thing, and the measurement prose (spread is running-statistic evaluation, not normalization) is the most careful experimental writing in the first four chapters. Chapter 3's strength is the honest treatment of noise (the n30 dot plot, median-of-five whiskers), though its intro is split by Run it first so the "three priors" sentence loses its list for a hundred lines. The structural thing to change is the Chapter 4 MLIR section: it is the one place the old headline survives, still calling the per-image render "the chapter's trained artifact" and assigning the `[0,2,3]` reduce to the next chapters, with none of the batch-statistics theorems or `thm:bnBatchTensor4HasVJP` mentioned; a reader who trusts the chapter's own rule ("BatchNorm means the batch form") will be told the wrong layer there. Beneath that, a handful of lead-in sentences in The theorems (`two-convolution`, `the packed steps this chapter's runs train`, `ties below are batched`) and the "two specs" heading are the remaining pre-rewrite residue.

---

### Review D — content.tex L6112–8209, Chapter 5 "ResNet-34" (Imagenette, recipe + ablation, ImageNet R34 / R50 2018 + RSB-A3, A2/A1 side quest, Recap)

Checked against: runs/2026-10-20-r34-bot-{jax,verified}/RESULTS.md + mcnemar.txt, scripts/jobs/r34-default-bf16-4gpu.conf, apps/imagenette/MainResnet34Imagenet.lean, the plotted coordinates (recomputed every window average, Δ row, Wilson interval, McNemar count and "four epochs" claim), and the 2026-10-21 copy audit's Ch 5 list.

The headline numbers are consistent everywhere they appear: R34 73.98 / 91.70 vs 74.14 / 91.85 (tables L7381, L7527, L7565–66, epoch table L7611–12, prose L7571–80, RESULTS.md); R50 77.01 / 93.51, 76.99 / 93.51, 77.58 / 93.66, 78.05 / 93.97 (L7718–19, L7816–17, L7876–77, L7887–88, L7965 caption, L8113). Per-epoch × epochs = totals in every table. Wilson ±0.38 / ±0.37, the 5,807 / 81 / p = 0.29 and 4,641 / 11 / p = 0.88 and 4,017 / 235 / p = 0.0002 counts, the 20-epoch window averages (L7945–51), "touching the lead at four epochs" (L7783) and the last-15-epoch 0.15 (L7598) all recompute from the plotted data. The recipe (no bias decay, zero-γ, BN decay 0.9, torchvision RandomResizedCrop) agrees between the prose L7344–55, tab:r34_paths L7557–62, L7701–03 and tab:r50_paths L7863–64, 7873 — with the exceptions below.

#### Findings

- **[high] [stale / TODO]** `L8179–8185`: a `[TODO: …]` marker is still in the rendered text: "\textbf{[TODO: \texttt{timm}'s index-level \texttt{RASampler} for the $3\times$ repeats … neither tier has run --- \texttt{r50-a2-bf16-4gpu} / …]}". Still open from book_copy_audit (its L7737–43). Everything it says is already in tab:r50_a2_a1_scope's "Still out" column (L8159–63) and the Recap (L8205); delete the paragraph.

- **[high] [inconsistency: recipe]** `L8075` tab:r50_a3_vs_2018, Weight decay row: "ResNet-50 (2018): $10^{-4}$, all params" and the A3 cell "skip BN $\gamma/\beta$ + bias … never decays scale/shift/bias params" presented as the *difference*. The 2018 recipe in this chapter decays weights only: L7347–49 "with BatchNorm's $\gamma$, $\beta$ and the biases left undecayed", L7703 "BatchNorm's $\gamma$, $\beta$ and the biases undecayed as there", tab:r50_paths L7873 "$10^{-4}$, weights only". Still open from book_copy_audit ("Same for R50 at L7350, L7424" — tab:r50_paths was fixed, this table was not). Fix: "$10^{-4}$, weights only" and make the A3 "buys" cell about the $200\times$ magnitude only.

- **[med] [inconsistency: listing vs recipe]** `L7462–7465`: the verified-trainer listing shows `resnet34ImagenetConfig` as only `epochs := 90 / batchSize := 256`, while the prose two paragraphs earlier (L7344–50) makes zero-γ and the 0.9 statistics decay part of the recipe. The source `apps/imagenette/MainResnet34Imagenet.lean` L61/L64 carries `zeroGammaInit := true` and `bnMomentum := 0.9` in that very record (the job conf's precheck greps for both). The listing has drifted from the file it is said to be, and a reader of the listing cannot see where two of the three Bag-of-Tricks rows are set. Add the two fields (with the comment "Bag of Tricks §3.1") to the listing.

- **[med] [inconsistency: figure vs text]** `L6799` fig:resnet34_arch: node "\textbf{maxPool} $2\times2$ \;\; $112\to56$" vs the Lean listing L6862 ".maxPool 3 2, -- He et al. 3x3-s2 OVERLAPPING 112->56", the log banner L6168 "3×3-s2 overlapping max pool", L7443, and the theorem's "$3 \times 3$/s2 pool" L6538. Change the node to "$3\times3$, /2".

- **[med] [wrong hand-typed ratio]** `L7320–7321`: "Augmentation is the largest single contribution ($-7.33 \pm 0.49$ fp32, $-7.11 \pm 0.38$ bf16; three times the next-largest knob)". The next-largest arm is cosine at $-5.00$ / $-4.78$ (L7186, L7202; L6918 calls cosine "the largest contribution of any knob … except augmentation itself"), so the ratio is 1.5×, not three. Three times is the *optimizer* arm ($-2.27$). Fix: "half again the next-largest knob" or "three times the optimizer's".

- **[med] [inconsistency: eval protocol]** `L7551` tab:r34_paths, "evaluation forward & bf16 & fp32" placed in the "rows above the first rule differ" block, while the caption of tab:r34_jax `L7375` says the reference number is "the final checkpoint scored over all $50{,}000$ validation images through an fp32 forward" and L7386 "That fp32 scoring is how the verified path … score". The two headline numbers are therefore both fp32-scored and the row describes only the in-training evaluation (RESULTS.md: 36,990 in training, 36,989 f32 — the same 73.98). Same construction in tab:r50_paths `L7859` ("bf16 (2018), fp32 (A3)") against tab:r50_jax's caption L7711. Suggested fix: rename the row "in-training eval forward" and say in the caption, as tab:r50_paths_epochs L7965 already does, that the headline columns are fp32 rescored.

- **[med] [stale / queue state in a table]** `L8163` tab:r50_a2_a1_scope "Still out" column: "Neither tier has been run", and `L8102` "and neither has been run", `L8183` "neither tier has run", `L8205` "A2 and A1 are rendered and timed, not run" — the same queue fact four times in 110 lines, once inside a table of what the *renders* carry (it is not a render property). Keep the Recap sentence and L8102; drop the table cell and the TODO.

- **[med] [stale / dated dev history]** `L8128–8130`: "the rates are the 2026-10-07 re-probe (\texttt{runs/2026-10-07-d17-reprobe/}), after torchvision's crop and the bicubic RandAugment geometry entered the shims." Still open from book_copy_audit (its L7686–88). The run directory as provenance is fine; "after … entered the shims" narrates a code change. Fix: "measured with the shipped shims (\texttt{runs/2026-10-07-d17-reprobe/})".

- **[med] [overstated curve claim]** `L7596–7597`: "The verified path leads by one to three points through the first third" (R34). Recomputed from the plotted coordinates (L7635/L7639), the per-epoch difference over epochs 1–30 is $-4.37$ at epoch 3, negative at epochs 2, 4, 6, 7, 8, 14, 17, 19, 23, 26, 29 and averages about $+0.2$; only the three selected epochs in tab:r34_paths_epochs (5, 15, 30: $+1.72$, $+2.58$, $+1.04$) show a lead. Say "at the selected epochs the verified path reads one to three points ahead; epoch by epoch the two swap sides" or drop the lead claim.

- **[low] [inconsistency: number]** `L7912` "The trainers scored them at $236$ … $77.61$ / $78.08$" vs tab:r50_paths_epochs caption `L7965` "read in training as $77.60$ / $78.08$", the epoch-100 point of the plotted curve (L7769, L8031: 77.60) and the table cell L7977 (77.60). One of 77.60 / 77.61 is wrong (77.606 rounded two ways); pick one, and the "$-13$ images" should then be re-derived.

- **[low] [inconsistency: parameter count]** `L7330–7333`: "This section is the same 21.8M-parameter network on 1.28M images … Only the dataset, the output head width, and the training schedule differ" — the network was introduced as "21.3M parameters" (L6262, L6282, L7321). Both are right (10- vs 1000-class head) but "the same 21.8M-parameter network" reads as a contradiction. Fix: "the same network, 21.8M parameters with the 1000-class head".

- **[low] [inconsistency: recipe enumeration]** `L8047–8049`: "The 2018-recipe row above is the original paper's SGD-with-momentum plus the 'bag of tricks' polish (cosine schedule, warmup, label smoothing, random-resized-crop)" omits the two Bag-of-Tricks rows L7353–55 adds (undecayed BN parameters, zero-$\gamma$); L8083 then lists zero-$\gamma$ among what "carries over unchanged". Make the two lists the same list.

- **[low] [inconsistency: "six ingredients"]** `L7139–7140` "Every chapter after this one uses the same six ingredients. The \texttt{NetSpec} changes, and the recipe stays" — but the first ingredient is "\textbf{Adam}" (L7077) and the ImageNet rows of this chapter and every later one run SGD with momentum (L7344, L7559). The sentence is true of the Imagenette recipes only; say so. Also L7077 heads the item "Adam" while the trainer (L6914, L6923) and the ablation (L7175 "$-$AdamW") are AdamW.

- **[low] [theorem vs run render]** `L6437–6440, L6446` thm:resnet34_step_tie names the renders "\texttt{resnet34in\_momdp64} at $N = 64$" and "the bf16 render \texttt{resnet34in\_momdp64bf16}"; the published run is \texttt{resnet34in\_momdp64wxbf16} (L7490, job conf), which `L7532–7534` says "the proof-carrying tier reaches … as a step". The wx twin differs only in the decay mask, so the gradient nodes are the same, but the theorem does not say so and the \texttt{wx} suffix is never glossed anywhere in the chapter (L7490, L7795–96, L7804). One clause at L7490: "(\texttt{wx}: weights-only decay; its gradient nodes are \texttt{momdp64bf16}'s)".

- **[low] [dangling name]** `L8113` tab:r50_rsb_tiers "A3 (\texttt{rsb-faithful})" — this slug occurs nowhere else in the book (the A3 render is named \texttt{resnet50in160\_lambaccdp4x128wxclipbcebf16} at L7796 and the job \texttt{r50-a3-wxclip4x128-bf16-4gpu}). Also the caption `L8107` "each tier at four replicas of $128$, in both precisions" describes a precision column the table does not have.

- **[low] [stale, still open from audit]** `L8159`: "the \texttt{emalamb} twins stay on disk unused" (audit's L7717). Repository-state narration; "Model EMA --- RSB Table~2 runs none" is the whole claim.

- **[low] [stale, borderline, still open from audit]** `L7908–7915` the rescoring narrative ("The trainers scored them at $236$ with the long side rounded … the move is $-13$ and $-14$ images …") tells the reader how the number used to be computed. The caption at L7965 already carries the protocol; one sentence ("rescored at \texttt{timm}'s 235; the in-training read at 236 was within 0.03") is enough.

- **[low] [template / structure]** `L7648–7680` "A reasonable stopping point" sits inside \subsection "ResNet-34: the 2018 recipe", between the R34 side-by-side table and the R50 subsection, so the ImageNet recipe section is interrupted by a book-navigation aside. It also hand-types chapter numbers — "The intro chapters \& Ch 1", "Ch 2--3", "Reading through Ch 5" (L7653–54, L7676) — beside \ref'd ones in the same list. Move it after the Recap (or to the end of the chapter as its own \section) and use \ref throughout.

- **[low] [positional words]** `L6242` "Theorem~\ref{thm:residualHasVJP} below"; `L7135` "in the Results section above"; `L7329` "The Imagenette runs above"; `L7490` "for the run below"; `L7694` "the table that closes the section"; `L7733` "the A3 render below"; `L7742` "the paragraph after the side-by-side table"; `L7965` (caption) "as are the curves below"; `L8047` "The 2018-recipe row above"; `L8072` (table cell) "the two rows below"; `L8083` "the row above"; `L8166` "as A3 ran them above".

- **[low] [vague forward pointer]** `L7123–7124`: "We will explore data augmentation strategies in upcoming chapters." No chapter is named; the augmentation story in this book is assembled here and in \S\ref{sec:r50_a3_vs_2018}. Point at that section or cut.

- **[low] [smooth-point wording]** `L6365` "every stem-pool window is entirely $\le 0$ or has one maximal cell" vs `L6499` "entirely zero or has one maximal cell" vs `L6540–41` "an all-zero window is admitted: every pre-activation there is negative". The pool reads post-ReLU values (never $< 0$), so "$\le 0$" at L6365 is about pre-activations and "zero" at L6499 about the window; pick one phrasing for both theorem statements.

- **[low] [table completeness]** `L7879–7888` tab:r50_paths RSB-A3 block has no weight-decay row while the 2018 block has one (L7873), although the A3 decay ($0.02$, BN $\gamma/\beta$ and biases excluded) is the setting L7830 calls out as one of "the three places a bare transcription would miss".

- **[low] [hand-typed count, verified]** `L7930` "the eight to nine percent of images the two disagree on": 4,641 / 50,000 = 9.3%, 4,017 / 50,000 = 8.0%. Fine at the stated precision; noting only that "eight to nine" rounds 9.3 down.

#### Verified and fine (not re-listed above)
110 / 161 gradient nodes (36 conv + 72 BN + 2 dense; 53 + 106 + 2); 36 BatchNorms (32 + 3 + 1); 295 steps/epoch at bs 32 and ~120 ms → 35 s/epoch → 47 min; label-smoothing floor 0.500; "four arms resolved in both" and "sorted by fp32 effect"; cosine ≥ optimizer + warmup + wd + ls combined (5.00 > 3.53); 5,004 and 625 steps/epoch, 0.08% unused; A3 lr $10^{-4}$ = peak/80; +3.03 / +0.57 / +1.06 / 0.52 / 0.47 deltas; "a ninth of the parameters" (21.3M / 2.24M = 9.5); Imagenette crop 256→224 (Train.lean L1246); every \ref label resolves; every file and runs/ path named exists; the prosesection before "Run it first" is the pattern every chapter uses, not drift.

#### Overall
The chapter reads well and is, numerically, the soundest ImageNet section a reader could hope for: every headline, Δ row, window average, interval and McNemar count recomputes from the data in the file, and the recipe moved cleanly into the prose and the two side-by-side tables when the Bag-of-Tricks pair landed. What has not caught up is the periphery: the A3-vs-2018 diff table still carries the old "all params" decay, the trainer listing lost the two config fields the recipe now rests on, the architecture figure still draws a 2×2 pool, and the A2/A1 side quest ends on a `[TODO` block that repeats what the table and Recap already say. The ablation section is the chapter's best teaching — the matched-step optimizer figure and its "what the row is really measuring" paragraph are exactly right — but its one hand-typed ratio ("three times") is wrong. The one structural change I would make is to lift "A reasonable stopping point" out of the middle of the ImageNet recipe section (it currently splits the R34 and R50 halves) and place it after the Recap, where a reader deciding whether to continue would look for it.

---

### Review E — content.tex L8210–11551: Chapter 6 "MobileNetV2" (incl. the MobileNetV4 side quest), Chapter 7 "EfficientNet"

Checked against the 10-21 copy audit: the "x2 or x3" dangling reference is gone (L9138 now says "Every block is its own line, with no repeat count"); the rendered listings at L9096–9135 (MNv2 trainer), L9327–9432 (MNv2 JAX config), L10703–10760 (B0 trainer) and L11003–11072 (B0 JAX config) carry no dates, ticket IDs or `planning/` pointers; "every row now a measurement" (old L10291) and "no rescoring gap this time" (old L10801) are fixed. Items from that audit still present are marked "still open".

#### Findings

- **[high] [recap mismatch / stale]** `L11547–48`: the Ch 7 Recap says "The two paths land close and not on top of each other, and the section says which rows are the suspects." The section it summarises now reports a tie — `L11370` "The two paths tie, $+0.04$ on top-1 (20 images) … McNemar's exact test gives $p = 0.77$: they cannot be told apart" — and `tab:enet_paths` (L11338–61) has no unequal recipe row above the rule (only lowering, Python, and wall-clock). Sentence is left over from the pre-c7307da4 pair; rewrite to match (e.g. "The two paths tie, and every recipe row is held equal by construction").

- **[high] [inconsistency: table vs section]** `tab:mnv4_vs_mnv2` (L9828–41) describes MobileNetV2's recipe with values that contradict the MobileNetV2 ImageNet section and `tab:mnv2_vs_2018` (L9754–66) twenty lines earlier:
  - `L9834` "Peak LR … $0.045$ @ 256" vs `L9757` "$0.045$ per 96, $0.12$ at 256" and `L9345` `learningRate := 0.12 -- 0.045 per 96 images, scaled to 256`.
  - `L9835` "exponential, $\times0.98$ per epoch" vs `L9758` "exponential, $\times0.98$ per $2.5$ epochs" (and the run, L9440).
  - `L9836` "Epochs $\sim$300--400" vs `L9759` "$420$".
  - `L9839` "Label smoothing: none" vs `L9761` "$0.1$" (and the run's `labelSmoothing := 0.1`, L9399).
  - `L9841` "EMA: none" (MNv2 column) vs `L9762` "EMA $0.9999$".
  - `L9838` "Augmentation: RRC + hflip" vs `L9763` "slim's crop + hflip + colour".
  The MNv4 table is reading MobileNetV2 off the paper's sentence while the chapter trains and tabulates TF-slim's README command. Either relabel the column "MobileNetV2 (paper, 2018)" and say so in the caption, or align the six cells with `tab:mnv2_vs_2018`.

- **[med] [arithmetic]** `L9472` "That staircase decays a fifth as often as the paper's sentence" and `L9758` "a fifth as often as the paper's sentence": the paper decays $\times0.98$ every epoch, the README every $2.5$ epochs, so the README decays $1/2.5 = $ two fifths as often (or "$0.4\times$"), not a fifth. Same slip in both places.

- **[med] [inconsistency]** `L10866` "eight tenths of a point over MobileNetV2's $89.25\%$" (and L10287 "eight tenths") vs `L10867–71` "SE and Swish buy $+0.71$ top-1 over MobileNetV2 … seven tenths of a point". $90.04 - 89.25 = 0.79$. The $0.71$ / "seven tenths" pair is stale; make it $+0.79$ / "eight tenths".

- **[med] [hand count]** `L10804–06` "the renderer … emits `b1` as no-expand, `b2`, `b4`, `b6` and `b12` as strided, and the remaining nine as residual." $1 + 4 + 9 = 14$, not 16. Blocks `b9` ($80\to112$) and `b16` ($192\to320$) are stride-1 with a channel change, so neither strided nor residual. Say "the two channel-changing stride-1 blocks as plain, and the nine others as residual" (nine skip blocks agrees with `thm:efficientnetFullHasVJP`, L10451).

- **[med] [contradictory listing]** `L11034` `wdExcludeNormBias := true -- no decay on BN γ/β or biases` and `L11057` `wdDecayBiases := true -- weight decay over every non-BN variable: biases too`, in the same rendered config. One comment says biases are exempt, the other says they decay; prose (`L11099`, `L11306`) and `tab:enet_paths` go with the second. Fix the first comment (e.g. "no decay on BN γ/β; biases handled by `wdDecayBiases`") or drop the flag.

- **[med] [formula]** `L10321` "tiny, at $C^2/r + C/r + C$ parameters per block". Two dense layers $C\to C/r$ and $C/r\to C$ with biases give $2C^2/r + C/r + C$; the leading term is off by a factor of two.

- **[med] [repetition]** The "RMSProp in TF form: $\varepsilon$ inside the root, accumulator at 1, rate inside the momentum buffer" explanation is given in full five times in the range: `thm:rmsprop_faithful` (L8756–80), `tab:enet_config_sources` optimizer row (L11094), `L11160–75` (the bold paragraph), `L11301–05` ("including every place TensorFlow's code differs from a naive port…"), and `L11494–97` ("'RMSProp (TF form)' is doing real work…"). The same for "EMA must shadow the BN buffers or eval blows up": `L11104` (table), `L11177–87`, `L11498–1501`, plus the Recap `L11544`. One full telling each plus a cross-reference would do; the Ch 7 recipe section reads as the same two lessons told in a loop.

- **[med] [dev-history, still open from 10-21 audit (old L9143–49)]** `L9682–88` "The pair this replaces ran the paper's sentence rather than the README's command --- $0.045$ unscaled with the stair every epoch for $350$ epochs … and read $71.63$ against $71.12$, a $0.51$ gap with two of its rows held unequal; every row is held equal here by construction, and the gap is gone." Narrates a superseded experiment. If the comparison is wanted, it belongs in a one-clause aside with the runs/ directory as provenance, not a sentence about what "this replaces".

- **[med] [dev-history, still open from 10-21 audit (old L8916–21)]** `L9456–63` "MobileNet's compute lives inside inverted-residual blocks … whose convolutions originally ran in fp32 regardless. Routing them through the same `convdt` cast as the plain convolutions is what lets bf16 reach the bulk of the network". "originally ran" is project history; state the shipped behaviour ("`bf16Conv` routes the block's three convolutions through the same cast").

- **[med] [dev-history, still open from 10-21 audit (old L10716)]** `L11290–92` "That second number is B0's canonical $5.29$M, the count the correctly-sized squeeze restores." "restores" implies a past mis-sizing. Also the squeeze-sizing lesson is told twice already: `L10774–83` ("sizing the squeeze off the $6\times$-larger `mid` instead is the difference between B0's canonical 5.29M parameters and an inflated 8.4M") and `L11120–25` ("most of the difference between a $5.3$M-parameter B0 and an $8.4$M one"). Keep one.

- **[med] [queue state / repetition]** The 500-epoch MNv4 pair is declared owed three times: `L9878–80` "the 500-epoch run is the same two jobs with a longer cosine, and it is the one thing here still owed", `L10180–82` the marker "[TODO: the schedule. The same two jobs at $500$ epochs, `mnv4-full-jax-4gpu` / `mnv4-full-4gpu`, ${\sim}112 + 88$\,h on the 4060~Ti box, this pair times five, are owed.]", and the Recap `L10198–10200` "its five hundred are the one job in the chapter still owed." Per the marker rule the TODO may name the schedule, but the wall-clock estimate ("${\sim}112 + 88$ h … this pair times five") is planning state, and the prose at L9880 and L10200 duplicate the marker. Suggest: marker says "the 500-epoch pair, `mnv4-full-jax-4gpu` / `mnv4-full-4gpu`"; prose and Recap say the chapter's number is the 100-epoch pair and stop.

- **[med] [inconsistency: counts]** `L9674` "$-0.15$ on top-1 (77 images)" vs `L9680–81` "disagree on $5{,}506$, $2{,}792$ against $2{,}714$": $2{,}792 - 2{,}714 = 78$. The 77 is the in-training count (35,920) against the verified 35,843; the rescored JAX bitmap that the McNemar counts come from is 35,921 (runs/2026-10-17-mnv2-default-verified/RESULTS.md). Pick one footing: "78 images" alongside the McNemar numbers, or say the rescoring moved one image. (The MNv4 paragraph at L10116–23 handles exactly this correctly: "162 images … $2{,}233$ … $2{,}071$".)

- **[low] [table arithmetic]** `L9702` `tab:mnv2_paths_epochs` $\Delta$ row: epoch 100 reads $-0.22$ but $67.70 - 67.93 = -0.23$; epoch 400 reads $+0.02$ but $71.70 - 71.69 = +0.01$. `L11412` `tab:enet_paths_epochs`: epoch 100 reads $+0.17$ but $74.19 - 74.01 = +0.18$; epoch 200 reads $+0.01$ but $76.14 - 76.14 = 0.00$. Presumably differences of unrounded values; either round the deltas from the printed cells or note the convention in the caption.

- **[low] [inconsistency]** `L9846–50` "by 2024 the mobile lineage has converged on the same transformer-era training recipe … (AdamW at large effective batch, cosine, heavy selective decay, RandAugment, EMA)" while the table it summarises, `L9841`, has "EMA: none / none" for the MNv4 paper tier and `L9873` "no EMA, so the live weights are what gets scored". Drop "EMA" from the list.

- **[low] [inconsistency]** `L9832` "Resolution … $256$ … timm also publishes the $224$ variant this book trains at" but the section's reported runs are at $256^2$ (`tab:mnv4_jax`, `tab:mnv4_pjrt`, `L10004–12`). Say "the $224$ variant the `default` tier trains at".

- **[low] [clarity / possible contradiction]** `L9615–19` "`adam64` is AdamW at $10^{-3}$ instead, the driver's default because it matches the other ImageNet drivers. The job: `lake run mnv2-default-4gpu`". Two sentences after naming `emarmstfdp64wxdwdoeps0001bf16` as the run's artifact, the reader is told the driver's *default* is `adam64` and then handed a job called `mnv2-default-4gpu`; scripts/jobs/mnv2-default-4gpu.conf in fact trains the `emarmstf…` render. Say which variant the job selects, or drop the `adam64` sentence.

- **[low] [hand count / dangling]** `L10002–03` "The paper tier is that spec with three host-side fields moved" — the listing that follows (L10006–15) shows six fields (`name`, `slug`, `imageH`, `imageW`, `dropDenom`, `dropIdxOffset`) plus "`... }` the blurb", and it extends `mnv4ImagenetFullVerified` (L10007), a spec never introduced (only `mnv4ImagenetVerified` is shown, L9960). Introduce the `Full` spec in one clause or extend `mnv4ImagenetVerified` in the listing.

- **[low] [naming drift]** `L9156` "composed with the dense, BN and biPath theorems already proved" — "biPath" appears nowhere else in the range; `L8411–14` names the same composition as "the conv2d VJP (Theorem~\ref{ax:conv2dHasVJP3}), the BN VJP (Theorem~\ref{thm:bnHasVJP}) and the residual's additive fan-in (Theorem~\ref{thm:residualHasVJP})". Use the second wording.

- **[low] [unexplained reference]** `L8320–22` "what moved here was the depth, from two blocks to seventeen, not the pointwise-to-global axis." No network in the preceding chapters is described as "two blocks" (ResNet-34 is "sixteen of these blocks", L6252). Say which theorem/net the two blocks were.

- **[low] [jargon]** `L10092` "BN statistic group 512 (Ghost-BN)" — "Ghost-BN" is defined in Chapter 5 (L7729) but used here without a pointer; one "(§\ref{…}, ghost batch norm)" would do. Similarly `L11328` "the gate … shows the symmetric pad red" (a gate-output colour, not defined), and `L10776` "`r == ic/4`" before `r` has been introduced as the squeeze width in prose (it is only in the listing's constructor comment).

- **[low] [dev-history]** `L9991–94` "which is why adding them was three `\#eval` lines rather than a new proof chain" — narrates the authoring; "the renders differ only in the head, the batch and the slug" already makes the point.

- **[low] [dev-history / still open from 10-21 audit (old L10496–524 tail)]** `L11068–71` the `Full` docstring in the rendered listing: "at the paper's real LR 0.016 (the TF-RMSProp form trains stably at it — no lowered LR, no grad clip)", echoed at `L11093` "paper-faithful, with no lowered rate and no gradient clip", `L11095` "the TF-RMSProp form has no blow-up for a clip to compensate for, so none is set", `L11173–74` "trains stably at the paper's $\mathrm{lr}=0.016$ with no gradient clipping and no lowered peak", and `L11490`. Four denials of a workaround the book never introduces; one ("no gradient clipping, as in the paper") suffices. Also `L11170` "that is enough to erode top-1 over training rather than diverge outright, which makes it read as a learning-rate sensitivity" and `L11493` "the chapter's two debugging lessons, both told in full above" describe the debugging rather than the recipe (audit's "borderline" L10546–50, L10918–22 — still present).

- **[low] [Recap vs theorems]** `L10186–89` Ch 6 Recap: "its backward is two convolutions of its own: an input VJP built from $\pdiv$, and a weight gradient, each proved at stride one and two." The theorems section proves three depthwise VJPs (input, weight, bias; L8458–8560) and none of them is stated per stride. Say "three VJPs … at every odd kernel" or drop "at stride one and two".

- **[low] [omitted knob]** `L11299` "BN momentum $0.99$ and $\varepsilon\,10^{-3}$ … All of it is carried on both paths" but the reference listing (L11003–72, "as the run below trained it") sets `bnEps` and no `bnMomentum`, and `tab:enet_config_sources` BatchNorm row (L11105) gives $\varepsilon$ only. Add `bnMomentum := 0.99` to the listing and table or drop the claim.

- **[low] [fact to verify]** `L11128` "TensorFlow's sampler (10--100\% of the image area …)". TF TPU EfficientNet's `preprocessing.py` uses `area_range=(0.08, 1.0)`; if the shim uses TF's values this should read 8–100%. Flag only; outside the range to confirm from the code.

- **[low] [positional words]** `L9315` "The Imagenette run above trained on $\sim$9.5K images"; `L9348`, `L11023` (listing comments) "the table below names each value's source"; `L9435` "The run below is"; `L9325`, `L9553`, `L11000` "as the run below trained it"; `L9591` "the artifact the run below used"; `L11272` listing comment "the reference number above"; `L11456` "The config above"; `L11474`, `L11481` "(below)"; `L11494` "told in full above". Replace with section or table references.

- **[low] [repetition]** `L8420–31` "Stacking the blocks" (17 blocks, seven stages, depths 1,2,3,4,3,3,1, 16→320, 1280, GAP, dense, 2.24M, 9.5×) and `L9009–19` "The architecture" restate the same column within 600 lines; the second could point at the first and keep only the figure.

- **[low] [inconsistency: ramp description]** `L9840` "linear ramp over the 21 UIB blocks, applied at the 18 that carry a skip" vs `L9862` "ramped as $(i+3)/26$ over its 26-entry block list (the `gpooling` row counts)". Both are true of different index sets; the table cell should say the ramp index runs over tf-models' 26-entry list.

- **[low] [style]** `L10343` "\prosesection{Attention in Disguise}" is the only title-case prosesection heading in the range (all others are sentence case). `L10363`, `L10367`, `L10383`, `L10991`, `L11172` "MobileNet-V2" (hyphenated) against "MobileNetV2" everywhere else in the two chapters. `L10310` "reduction ratio $r$ (typically 16)" sits beside a network whose $r$ is `ic/4` of the block input (L10776); a "(the SE paper's default; B0 sizes it off the block input, L…)" clause would prevent the mismatch.

#### Overall

The two chapters are in good shape structurally: both carry the template headings in order (Run it first → The theorems → Example → MLIR → ImageNet recipe → [Side quest] → Recap), every float is cited by number before it appears, the captions describe rather than argue, and the per-chapter arithmetic that can be checked from the text (parameter counts 158/213 from the layer lists, 2.24M→3,504,872 and 4,020,358→5,288,548 head deltas, step-time×295×80 against epoch wall-clock, the Wilson half-widths, every McNemar $p$ from its discordant counts, the MNv4 lead/lag epochs) checks out. The MNv4 pair paragraph (L10116–45) is the best-written pair comparison in the range and the MNv2 one is nearly as good. The one structural thing I would change is Chapter 7's ImageNet recipe section: it tells its two lessons (TF-form RMSProp, EMA over the BN buffers) five and four times respectively across the listing comments, the sources table, the bold paragraphs, the "recipe on both paths" paragraph, the diff table and the Recap, and the Recap's closing sentence still describes the previous pair's gap rather than the current tie; cutting it to one telling each and a tie-matching Recap would shorten the chapter by a page and remove most of the dev-history residue at once. In Chapter 6 the MNv4-vs-MNv2 diff table should be reconciled with the MNv2 table above it (six cells disagree), and the "a fifth as often" arithmetic fixed in both places it appears.

---

### Range L11552–15428: Chapter 8 "ConvNeXt" (incl. S/B side quest), Chapter 9 "Vision Transformer" (incl. S/B side quest)

Read-only review of `blueprint/src/content.tex` at HEAD e981f8a6. Line numbers are the current file's.

#### Findings

- **[high] [dev-history / queue state]** `L12826–12838`: the marker after Table `tab:cnx_paths` is a work queue, not a shipped state: "**[TODO: the official recipe in four places, on both paths: batch 4096 … The pair published above predates that recipe … The chapter's row runs the official recipe, `cnx-default-emabf16-4gpu`, and the pair on it is owed, both halves — `cnx-default-jax-4gpu` / `cnx-default-emabf16-4gpu`, ∼76 + 109 h.]**". The same queue leaks into the prose at `L12618` ("the queued ImageNet pair computes the exact form"), `L12771–12773` ("The chapter's row in `lake run imagenet` is `cnx-default-emabf16-4gpu`, the official recipe, not this job; the marker … says what that changes and what is owed") and `L12531–12533` ("its recipe quoted as the run below trained it (the file in the tree carries the official rows the marker after Table … describes)"). The chapter therefore carries two ConvNeXt-T ImageNet recipes at once — the pair it publishes (one-shot 256, clip, tanh) and the "chapter's row" (4096 by k16, no clip, erf) that has not run. Per `planning/imagenet_finish_line.md` the official pair is still "queued behind MNv2 and B0". Fix: describe the shipped pair as *the* pair, name its departures from the paper as properties of that run (batch 256 at 2.5e-4, clip 1.0, tanh GELU), drop "owed/queued/∼76 + 109 h" and the pointer to a listing that differs from the file; when the rerun lands, swap the numbers. (Still open from the 10-21 audit's TODO list, L12249–61.)

- **[high] [inconsistency: GELU]** `L11853–11854` (Definition `ax:geluErfScalar`): the exact form is "what the ImageNet pairs of this chapter and the next compute on both paths", and `L11712–11713`: "the exact x·Φ(x) …, which the paper's code and the ImageNet pairs compute" — vs `L12616–12619`: "the GELU, which every run in this chapter trained as the tanh approximation on both paths (Definition `ax:geluScalar`); the queued ImageNet pair computes the exact form", and the marker `L12834–12835`: the published pair ran "with a global-norm clip and the tanh GELU". So for ConvNeXt-T the published ImageNet pair is tanh, and the definition that says erf is wrong for "this chapter". Chapter 9 tells its own story consistently (`L14725–14730`: Imagenette tanh on both paths, ImageNet pairs erf; Table `tab:vit_paths` row "LayerNorm ε / GELU … erf"; config `geluExact := true` at `L14959`), so the two chapters disagree only about ConvNeXt-T. Fix: in `ax:geluErfScalar` and `L11712`, say the exact form is what the ViT pair (Ch 9) computes and what ConvNeXt's S/B renders carry; the ConvNeXt-T pair trained tanh — or wait for the erf rerun and then make every sentence say erf.

- **[high] [dev-history]** `L12367–12380`: "**The wrong init is worth three points here.** Until 2026-09-13 the verified path initialised layer scale to ones, and the same render on the same recipe landed at 85.45% against the 82.27% above … The book keeps the paper's value …". Still open from the 10-21 audit (its L11791–804); a dated episode narrated as history. Restate as an ablation: "With layer scale initialised to ones instead of 10⁻⁶, the same render on the same recipe reaches 85.45% (`runs/2026-08-30-convnext-imagenette-headln/`) …". `L12440` "worth three points on its own (above)" then needs a section ref instead of "above".

- **[high] [dev-history / queue state]** Both side quests read as a queue. `L13048`: "**What is queued.** Both pairs exist." and `L13060–13063`: "**[TODO: as T's; neither has run — `cnxs-default-jax-4gpu` / `cnxs-default-emabf16-4gpu`, …]**"; `L15360`: "**What is queued.** Both pairs exist." and `L15381–15384`: "**[TODO: as Tiny's; neither has run — …]**". Also dated smokes still present: `L13028` "timed on real ImageNet (the 2026-10-12 smokes)" and `L15338` "(the 2026-10-11 smokes, on the 4060 Ti box)" (audit L12451, L14745), and `L15328` "on the first renders at 128 per device" (audit L14735–40). Fix: "The jobs" / "Neither pair has been trained; the confs and renders are …", times "measured on real ImageNet (`runs/2026-10-1x-…`)".

- **[high] [dev-history]** Listing comments and prose that narrate what landed when. `L12570` "`augBicubic := true -- PIL-bicubic geometry, as timm (after the run)`", `L12577` "`erasingPixel := true -- … (after the run)`", `L12581` "`f32StemHead := true -- classifier head in fp32 (after the run below)`" — still open from the audit (L11994/12001/12005); the quoted listing is a hybrid of the run's recipe and the tree's. `L12758–12760`: "`convnextin_emadpwxclipdropbf16` carries all four, but it landed after this run, which trained `adamdpwxclipdropbf16`" — still open (audit L12180–83). Fix: quote the config as the run trained it with no "(after the run)" asides, and say "the run trained `adamdpwxclipdropbf16` and scores its raw weights; the EMA render exists but this pair did not use it".

- **[med] [inconsistency: recipe]** Caption `L12796` (Table `tab:cnx_paths`): "Both are the paper's recipe, 300 epochs" vs the marker `L12829–12835`: "The pair published above predates that recipe: it is the one-shot job … at global batch 256 and 2.5e-4, with a global-norm clip and the tanh GELU". Likewise Table `tab:cnx_vs_2018` (`L12960` "Grad clip … global-norm 1.0 — this book's addition, not the paper's"; `L12968` "batch 256 (the paper's own batch is 4096 …)") describes the one-shot pair, while the S/B section `L13052–13054` says "ConvNeXt-T's recipe as its marker has it — the official batch 4096 as 16 accumulated micro-batches of 64 per replica, no clip". Pick one recipe to call "ConvNeXt-T's".

- **[med] [inconsistency: block order]** `L11733–11735`: "the *inverted bottleneck* (1×1 expand 4×, depthwise spatial conv at the wide point, 1×1 project) is exactly the MobileNetV2 inverted residual" — vs the block display `L11726–11730` "DW 7×7 → LN → 1×1 expand 4× → GELU → 1×1 project" and the inset (`L12256–12262`), where the depthwise runs first at width c. In ConvNeXt the depthwise sits at the narrow width, before the expand (the paper's "moving up the depthwise conv"); "at the wide point" is MobileNetV2's layout. Fix: "depthwise 7×7 at the block width, then 1×1 expand 4×, GELU, 1×1 project — MobileNetV2's inverted bottleneck with the depthwise moved in front".

- **[med] [inconsistency: stage index]** `L12473–12474`: "at the last block of the third stage (`s3b2`: 768 channels at 7×7, batch 32)". 768 channels at 7×7 is stage 4 (figure `L12237` labels it "stage 4"); the artifact names stages `s0`…`s3` (`verified_mlir/convnext_adam_train_step.mlir` has `%s0b0lg` … `%s3b2lg`), so `s3b2` is the last block of the fourth stage — which `L12503` ("this is the last block, so its output cotangent comes down from the head") requires. Fix: "the last block of the fourth stage (`s3b2`, zero-indexed)".

- **[med] [figure]** `L12230`: the stem node of Figure `fig:convnext_t_arch` reads "**ConvBN** patchify 3→96, 4×4, /4". ConvNeXt has no BatchNorm (`L11665–11669`, `L12277`); the stem is conv + channel-LN (listing `L12291`). The figure also omits the stem LN and the head LN that the text counts ("Twenty-three LayerNorms", `L12393–12398`). Fix: "Conv + LN patchify", and an LN box before the dense head.

- **[med] [inconsistency: numbers]** `L12453–12454`: "above ResNet-34's 754 and below MobileNetV2's 1,047 and EfficientNet-B0's 1,316" vs Table `tab:imagenette_four` `L12423–12424`: MobileNetV2 "1,071 KB", EfficientNet-B0 "1,317 KB" (and `tab:imagenette_five` `L14750–14751`, Recap `L15409` "1,317 KB").

- **[med] [count / provenance]** `L15218–15220`: "at epoch 300 the two score 35,819 and 35,806 images correct, thirteen apart" vs `L15287–15289`: "The reference is right on 2,347 images the verified model misses, and the verified model on 2,327 the reference misses; McNemar's exact test gives p = 0.78". The discordant counts imply a 20-image gap, not 13. `runs/2026-10-11-vit-deit-jax-bf16-300ep/RESULTS.md` shows the pairing used the reference's CPU f32 rescore (35,826 = 35,819 + 7) against the verified e300 bitmap. Say which arm was paired ("the reference rescored on CPU, seven images over its in-run line"), or pair the arms the headline reports.

- **[med] [§9.2 role]** `L13279–13290`: the section opens "Before we can prove backward passes through these operations, we need the matrix-level extensions of Ch 1's foundation rules … We collect them here, where the attention proofs need all of them at once." Two of its statements — Definition `def:hasvjpmat` and Theorem `thm:rowwiseHasVJPMat` — are cited by every whole-network certificate from Chapter 4 on (Foundations `L781–784` says so and sets them aside in the chapter maps per a10c5fb5), and Chapter 8 already uses `thm:transposeHasVJP` and `thm:rowwiseHasVJPMat` (`L11927–11929`, `L12108`). Nothing in §9.2 says this, so the reader meets "the matrix VJP record" as new attention machinery after seven chapters have cited it. One sentence would do: "The record and the row-wise lift have been in use since Chapter 4 as the batch bookkeeping Foundations describes; the matmul, scale and transpose lemmas are the ones attention needs." Related: Ch 8 Recap `L13081–13082` "the matrix-level VJP records the first chapter set aside" — the setting-aside is in Foundations (`L781`), not Chapter 1 (MNIST linear).

- **[med] [cross-chapter inconsistency]** `L13079–13080` (Ch 8 Recap): "One thing is left in Part 1 that the kit has not replaced: the convolution itself. The next chapter removes it." vs `L14641–14650`: "The patch embed is spelled `.patchEmbed 3 192 16`, which is `.conv 3 192 16 16` … That it is a convolution rather than a distinct primitive is the point", and `L14775` "two convolutions" in the ViT graph. Fix: "The next chapter needs it only once, at the patch embedding."

- **[med] [forward reference]** `L11946`, `L11957`, `L12397`: Chapter 8 cites Theorem `thm:layerNormVecHasVJP` (the head's vector LayerNorm) which is stated in Chapter 9 at `L14022` under "Vector LayerNorm VJP, per token", and whose `\lean{}` bundles `transformerBlockVHasVJPMat` with a `\uses` list of attention theorems. A ConvNeXt proof thus rests on a statement the reader has not seen, titled as a transformer lemma. Either state the vector LayerNorm (the `layerNormVecHasVJP` half) in Chapter 8 beside `thm:layerNormHasVJP`, or say in Ch 8 that it is proved in §9.3.

- **[low] [inconsistency: optimizer]** `L12590–12591`: "Unlike MobileNet and EfficientNet, ConvNeXt trains with AdamW …, not SGD" — the MobileNetV2 and EfficientNet ImageNet recipes are RMSProp (`L12696–12697` "the test Chapter 7 ran on RMSProp"; Table `tab:cnx_vs_2018` contrasts with "B0's RMSProp"). "not SGD" is the ResNet contrast.

- **[low] [arithmetic]** `L12640`: "The raw weights score 81.51% / 95.50%, so weight averaging is worth +0.03 points" — 81.53 − 81.51 = 0.02 at the printed precision; "0.03" recurs at `L12762`, `L12860`, `L12874`. Print the unrounded pair or say 0.02.

- **[low] [count]** `L12066` "the twelve stages and downsamples" and `L12089` "the twelve-stage ConvNeXt-T input-gradient chain" — the chapter otherwise says four stages and three downsamples (`L11749–11751`, `L12336`); "twelve" (presumably the Lean chain's segment count) is never defined for the reader.

- **[low] [template / intro promise]** `L11762–11766`: "The chapter closes by putting the full recipe side-by-side with the 2018 ResNet-34 recipe …, on one page." The chapter closes with the S/B side quest and the Recap; the table is at `L12930–12970`.

- **[low] [vocabulary]** `L11739–11743`: "The spec's `.convNextStage` primitive emits N of these blocks … The `.convNextDownsample` primitive emits the LN + 2×2 stride-2 conv", and `L12203–12205`: "ConvNeXt-Tiny replaces the convolutional stages with `.convNextStage` blocks … glued by `.convNextDownsample` transitions" — but the verified listing that follows (`L12291–12303`) uses `.convNextBlockCh`, `.layerNorm`, `.conv`, and `L12383–12388` then explains that the stem and downsamples are "spelled out, not packaged". The JAX spec's vocabulary is introduced as "the spec's" before the reader knows there are two specs.

- **[low] [positional words]** `L11710` "the Imagenette tier below", `L11761` "The example section below", `L12370` "the 82.27% above", `L12440` "(above)", `L12531` "the run below", `L12654` "measured above", `L12656` "departures above", `L12723` (listing comment) "the reference number above", `L12756` "the run below", `L12761` "the pairing below", `L12832` "The pair published above", `L12870` "the final pairing above", `L12935` "The config above", `L14884` "The Imagenette ViT-Tiny above", `L14933` "the config below", `L14970` "(below)", `L15106–15107` (listing comment) "the reference number above", `L15210` "Above the rule sit". Captions `L12796` and `L15178`: "rows above the first rule differ, rows between the rules are held equal" — in both tables the header is what sits above the first rule; the differing rows are between the first and second rules.

- **[low] [dev-history, borderline]** `L14769–14771`: "**It reproduces exactly.** This number was measured three times before being printed, and all three passes came back bit-identical on three different cards" (audit borderline L14176). Restate as the property: "Three runs on three cards reproduce it bit for bit: …".

- **[low] [clarity]** `L15330–15333`: "which took one renderer feature, the accumulating optimizer tail, beyond the `#eval` lines" — author-facing. `L14984–14985`: "The init is the one row that carries the number" — which number? `L12984`: "tier 1 in our codegen scope" — the only occurrence of "tier 1" in the book; undefined.

- **[low] [inconsistency: list]** `L14868–14870`: "every operator in the modern vision stack, and that means dense, convolution, BatchNorm, residual, depthwise, squeeze-excite, layer scale and attention" omits LayerNorm, GELU and softmax, which the chapter opening lists (`L13095–13097`).

- **[low] [listing comment]** `L14612`: "`-- 2. The schedule. Note it is NOT the other four nets' schedule.`" — `vitAdamConfig` is `epochs 80 / batchSize 32`, the same as the others; what differs (baseLR 3e-4, warmup 5) is in the entry point two lines down, as `L14714–14716` says.

- **[low] [proof text]** `L14517`: "(Theorem `thm:hasGradAt_comp`, once per stage)" in the ViT loss-gradient proof — ViT has blocks, not stages; copied from `L12194`.

- **[low] [naming]** `L14750` "MobileNet V2" vs `L12423` "MobileNetV2" (same table layout one chapter apart).

- **[low] [scope]** `L11609`: "the heaviest per-epoch net in the book" — the ImageNet-tier ViT-B and ConvNeXt-B steps are far heavier; scope it to the Imagenette column as `L11670` does.

- **[low] [repetition]** Ch 8 lists the DeiT augmentation pack three times (`L12605–12612` bullets, `L12971` table row, `L12975–12988` paragraph with citations) and states the 81.53% headline three times (`L12444–12446`, Table `tab:cnx_jax` `L12632`, `L12644–12646`). Ch 9's Recap says the same thing about Part 2 in consecutive paragraphs: `L15412–15414` "The bestiary in Part 2 then shows that every other architecture … composes from the same small set of primitives" and `L15423–15426` "Part 2's bestiary takes the same set of primitives and tours how they compose into every well-known modern architecture".

#### Checks that came back clean
Template order in both chapters (Run it first → The theorems → Example → MLIR → ImageNet recipe → Side quest → Recap); every `\ref` target in the range resolves; floats are cited by number before they appear; the "forty theorems" / "thirteen theorems and a definition" / "twenty-seven theorems" / "fourteen matrix-machinery lemmas" counts match the blocks (14 + 27); 182 and 200 parameter tensors, 22/23 LayerNorms, 27.83M/28.59M and 5.53M/5.72M, the McNemar partition for ConvNeXt (38,850 + 7,445 + 1,903 + 1,802 = 50,000, 92.6% agreement, 69.7% expected), the 1.3×/6.9×/1.23×/6.8% ratios, the EMA-carry percentages (78/29/5/<1), and "+1.4 points through epoch 125" (the curve's epoch-30 point) all check. The ViT chapter's GELU story (tanh on Imagenette, erf on ImageNet) is told once and consistently. Suspected garbles at L13224, L14785, L14792, L14998 and L15142 were artifacts of filtering lines that begin with "(" and are fine.

#### Overall
Chapter 8 is the better-written of the two as mathematics and as a story — the "recipe is the thesis" argument is set up in the opening, lands as the Imagenette result, and is closed by the knob-by-knob table — but it is still the chapter where the book most visibly narrates its own development: the ImageNet section carries two recipes (the pair that ran and the row that is queued), the listing is annotated with what changed "after the run", the layer-scale paragraph is a dated episode, and the S/B side quest says "queued". The b47a1ea6 sweep cleared the smaller Ch 8/9 items (the "today"/"was 5"/"now covers" passages are gone, and the ViT pair text reads as a shipped result) but left every passage tied to the ConvNeXt-T rerun untouched, which is why the GELU story is inconsistent inside Ch 8 while Ch 9's is clean. Chapter 9 reads as one shipped state apart from its side quest; its theorem section is long but well organised, and the "ladder" framing shared with Ch 8 (whole-net VJP → rendered backward → step tie → loss gradient) is the clearest statement of what the book proves. The one structural change I would make: decide now whether the ConvNeXt-T chapter publishes the one-shot pair or the official-recipe pair, and make the definition of the exact GELU, the two-paths caption, the knob table, the S/B "as T's recipe" sentence and the marker all describe that one state; everything else in these two chapters is a sentence-level fix.

---

### Review G — content.tex L15429–17613: Part 2 opener, Ch 10 "The kit", Ch 11 "The chapter nets at work" (vision classifiers; detection/VisDrone; NEU-DET; ArASL; PlantVillage/PlantDoc; EuroSAT; UNet/BraTS + segmentation entries)

Cross-checks done: every `\ref` in the range resolves; all six demo figure files exist under `blueprint/src/figures/demos/`; all 21 named `Bestiary/*.lean` files exist; the kit's "twenty-five / two plain / twenty-three bundled" count matches the 23 `definition` blocks; the chapter numbers hand-typed in the kit (chapters 1–9, "ch 10") match the actual `\chapter` order. Table-vs-prose arithmetic checked for every demo; the mismatches are listed. The 2026-10-19 fact-check fix commit (5729af20) covered themes elsewhere in the book: most of the fact-check's Part 2 items are still in the text and are marked "still open from fact-check" here with current line numbers.

#### High

- **[high] [stale / dangling]** `L16556–57`: "The bestiary entries show the single-scale view and defer the multi-head refactor to the limitations discussion." There is no limitations discussion anywhere in the book (sole occurrence of the word), and the refactor is done: the next paragraph trains a three-level FPN head. Delete the sentence, or say the catalogue entries are single-scale and the demo is the multi-scale head.
- **[high] [dangling / inconsistency]** `L16780`, `L17470`: the demo detector's head layer `.fpnDetect` ("baked into the `fpnDetect` emitter"; "`.fpnDetect`'s C3/C4/C5 tap reused") is used by name twice and defined nowhere in the book. The kit defines `.fpnModule` instead (`L15724–38`) and says it is "bundled because the cross-scale add doesn't fit a linear NetSpec"; the kit's codegen-backed list (`L15580–83`, "Three of these are codegen-backed") omits `.fpnDetect`, which `LeanMlir/ReferenceNets.lean:232` shows is the trained layer. `L16656–58` (YOLO) then says "Multi-scale FPN detection heads don't linearize --- same skip-connection problem as UNet; all entries show a single-scale view", three pages after a multi-scale FPN head was trained. Add a `.fpnDetect` definition to the kit and reword the two "don't linearize" sentences.
- **[high] [inconsistency]** `L15455–56`: Part 2 is "a catalogue of famous architectures expressed as pure `NetSpec` values, no training runs, no VJP commitments" --- the same Part trains twelve demos and the kit itself says `.unetDown/.unetUp/.pairTile` are trained through (`L15580–83`) and `.pairTile` has proved VJPs (`L15791`). Still open from fact-check (14403). Qualify: the entries are pure specs; the demos are the exception.
- **[high] [wrong number]** VisDrone, four numbers not derivable from the table and contradicted by the run records (all still open from fact-check 15568/15574/15594/15585):
  - `L16612–13` "it makes 30 epochs worth $44\%$ more than 12": no 12-epoch scale-aug row exists in Table `tab:visdrone_results`; 0.2363 against the only 12-epoch rows gives +20% (0.1961) or +55% (0.1526). The 44% was taken from an unannealed epoch-12 checkpoint of the 30-epoch run.
  - `L16620` "narrowed it from $43\times$": no artifact gives 43×; the baseline the same sentence uses gives 25×.
  - `L16641–42` "one item of that recipe closes $31\%$ of it": 31% only comes out of the 50-epoch photometric row (0.2363−0.1674)/(0.391−0.1674); from the 12-epoch photometric row it is 21%, and the step between those rows is several recipe items, not one.
  - `L16631–35` "beats the hand-written PyTorch replica ... by $54\%$ ... it isolates implementation quality from architecture": the 0.2363 row is 30 ep + scale aug (multilabel decode), the replica row is 12 ep no-aug (argmax); the matched row in the same table is 0.1526 vs 0.1532 --- a tie. The paragraph argues the opposite of what its own table shows.
- **[high] [wrong ref]** `L17004–06`: "PlantDoc is never seen in training except by the last two rows of Table~\ref{tab:plantvillage_results}, which learn from it five-fold" --- the table's last two rows are "published, PlantVillage random split" and "published, on images from elsewhere". The five-fold rows are the three "+ ... field labels" rows (`L17032–34`). Still open from fact-check (15959).
- **[high] [inconsistency]** `L17184–85`: "Near infrared alone buys four of the ten points and the red edge and short-wave infrared buy the rest" vs Table `tab:eurosat_bands` `L17160–61`: Amazon `rgb` 87.4, `rgbn` 89.3 --- +1.9 of the 9.6. Still open from fact-check (16138). "two of the ten points ... the other eight".

#### Medium

- **[med] [inconsistency]** `L15956` AlexNet listing comment `-- ~95% of params live here` on `.dense (6 * 6 * 256) 4096`: that layer is 37.7M of 62M (61%); 95% is the three FCs together, as the prose at `L15931–32` ("$\sim$58M of the 62M live in the three FC layers") says. The listing is not the Lean (`Bestiary/AlexNet.lean:95–99` has a different comment). Still open from fact-check (14941).
- **[med] [inconsistency]** `L15929`: "AlexNet (62M, paper-exact at 60M; ...)" --- 62M is not 60M; "paper-exact" is the wrong word (the paper's model is the grouped two-GPU one). Same pattern `L16332` "Xception (21.9M, paper-exact at 22M)" (paper: 22.9M; the gap is the four 1×1 residual projections the prose calls "implicit") and `L16529–30` "Swin-T lands at 28.6M params against the paper's 28M ... exactly." Still open from fact-check (14904/15329/15492). Drop "exact(ly)" or explain the gap.
- **[med] [external fact]** `L15938–39`: "The winning submission combines convnets with KNN sampling and 10-crop test-time averaging." No KNN in the ILSVRC-2012 entry (an average of seven CNNs); the paper's nearest-neighbour use is a qualitative feature probe. Still open from fact-check (14925).
- **[med] [inconsistency]** Kit figure `fig:operation_inventory` vs the ResNet entry: the Part 2 column lists `bottleneck` as a bestiary primitive (`L15537`), but `L16070–73` says "`.bottleneckBlock` is a chapter net's primitive rather than the bestiary's" (and Theorem `thm:resnet50FullHasVJP` is cited). The Part 1 column carries `tokenEmbed/r` (`L15549`), which no Part 1 chapter introduces (zero occurrences in L820–15428; it is TinyGPT's layer), and the Part 2 column omits `pairTile` and `structureModule` although the caption calls it the inventory. Still open from fact-check (figure 14512).
- **[med] [inconsistency]** `L17105`: "ten per class buy seven points" vs Table `tab:plantvillage_results`: 22.69 − 17.80 = 4.9 (the "twenty-seven" in the same sentence is 45.00 − 17.80 = 27.2, so the two deltas use different baselines). Still open from fact-check (16053). Same sentence `L17103` "three and a half points" for 21.48 − 17.80 = 3.7.
- **[med] [wrong sign]** `L16848`: "Photometric augmentation's $+0.007$ is one run against one run" --- Table `tab:neudet_results`: recipe with augmentation 0.623, "photometric augmentation off" 0.630; the augmentation's effect is −0.007. Still open from fact-check (15802).
- **[med] [inconsistency]** `L16836–39`: "on drones it is six times behind, $0.039$ against $0.236$ ... same backbone, same bootstrap, same scorer, same lowerer in all four cells" --- but Table `tab:neudet_visdrone_heads` pairs a 30-epoch + scale-aug FPN with a 12-epoch single-grid run (`L16808–09`), while `L16788–90` promised the grid arm "run for the same 30 epochs" (true only on NEU). Say the VisDrone recipes differ, or compare to the 12-ep no-aug FPN (0.1526, 4×). Still open from fact-check (15771).
- **[med] [math]** `L15697–98` Darknet block: "Lighter than a standard ResNet bottleneck; heavier than a ResNet-18 basic block" is backwards at equal width (5c² vs ~1.06c² bottleneck vs 18c² basic). Still open from fact-check (14621).
- **[med] [float rule]** Three BraTS tables appear without being cited by number first, each introduced by a colon pointing at the page: `L17277` "ten epochs of plain per-pixel cross-entropy gives:" → `tab:brats_dice`; `L17352–54` "isolates exactly what they contribute:" → `tab:brats_skips`; `L17386` "Best-by-val checkpoints:" → `tab:brats_per_patient`. Every other demo in the chapter cites its table by number before it appears. (`tab:brats_3d` is cited correctly.)
- **[med] [inconsistency]** `L17284` Table `tab:brats_dice` row "ResNet-34 UNet (`unet-brats-r34`) 0.741 / 0.910 / 0.867 / 0.856" is the from-scratch arm (it equals the "from scratch" skips row at `L17364`), while Table `tab:brats_per_patient`'s first row is "ImageNet bootstrap" --- the two tables switch arms without saying so. Still open from fact-check (16239). Label the row.
- **[med] [inconsistency]** `L16697–98` Mask R-CNN: "the `.bottleneckBlock` backbone is Chapter~\ref{chap:residual}'s ResNet-50" but the listing is `maskRCNNBackboneR101` with `.bottleneckBlock 512 1024 23 2` (ResNet-101) and the "backbone+FPN 45.8M ... $\sim$63M in total" figures are the R101 model. Say ResNet-101, built from the bottleneck block Chapter 5 proves.
- **[med] [dangling]** `L16069` ResNet entry header "(`Bestiary/ResNet.lean`)" but the listing `def resnet50Imagenet ... convPadStyle := .symmetric` is `LeanMlir/ReferenceNets.lean`'s spec; `Bestiary/ResNet.lean` defines `resNet18/50/101/152/tinyResNet` without `convPadStyle`. Still open from fact-check (15060).
- **[med] [overclaim]** `L17219–20`: "which is why the arm without them travels best" --- Table `tab:eurosat_bands`: `ms10` ties `all` in the Amazon (97.0/97.0), is behind in September (32.8 vs 35.4), ahead only in March. Still open from fact-check (16172).
- **[med] [statement mismatch]** `L16887–89`: "$92.3\%$ of test images have a training image within $6$ grey levels and $95.7\%$ of those neighbours carry the test image's own label" --- 95.7% is the 1-NN accuracy over all test images (Table `tab:arasl_results` row "1-NN on 16×16 thumbnails 95.65"), not the share among the 92.3%. Still open from fact-check (15907).
- **[med] [statement mismatch]** `L17073–74`: "Both explainers say the same reassuring thing: the evidence is the leaf, $85\%$ of it" --- Table `tab:plantvillage_probes`: Shapley 85%, CAM 71%. Still open from fact-check (16027).
- **[med] [template drift]** The chapter's six demos do not share one shape, and none cites a `runs/` directory (zero occurrences of `runs/` in L15429–17613, against the brief's "each demo has a run-directory"). ArASL / agriculture / remote sensing follow one pattern (**The data.** → table → figure → "**The … columns are the result.**" → "What this classifier is not"); detection and inspection have no data paragraph, no closer, and the detection table precedes its figure while the inspection one has two tables; segmentation alone names its trainer file and executables (`demos/MainUnetBratsR34.lean`, `unet-brats-r34`, `brats-predict`, `brats-eval`), runs on `\paragraph`s, has four tables and no "what this is not" closer. Pick the ArASL shape and give each demo its run directory and trainer in one line.
- **[med] [dangling / forward ref]** `L16898–99`: "The recipe is the gravitational-wave demo's, unchanged" --- that demo is Chapter 12 §Signal processing (`L18546`), 1,650 lines later, and the sentence carries no `\ref`; a reader of Ch 11 has not met it. Likewise `L17322–23` "the same `useSeg` flag in `TrainConfig` that the NLP subsection's TinyGPT uses" (TinyGPT is `L17627`, next chapter; and it is a section). State the recipe here and `\ref` the later demo.
- **[med] [stale]** `L17322` "This rides the same `useSeg` flag in `TrainConfig`" --- `TrainConfig` has no such field; `useSeg` is a local in `LeanMlir/Train.lean` derived from `lossKind`. `L17345` "plus a small C colormap routine" --- the colormap is Lean (`demos/MainBratsPredict.lean`). Both still open from fact-check (16276/16298).
- **[med] [wrong number]** BraTS, still open from fact-check: `L17413` "+0.17 on ET" mixes arms (scratch 0.783 − no-skip 0.620 = 0.16; the pooled +0.12 is scratch vs scratch); `L17426–27` "a 3D UNet --- this section's UNet with $3^3$ kernels and $2^3$ pools, 23.5M parameters" is the from-scratch `unetBrats` (7.8M in 2D), not the section's 24.5M ResNet-34 UNet; `L17459–60` "Rank-5 convolution itself runs at 77\%" is the whole 3D step at ~79%.
- **[med] [inconsistency]** `L17556` SegFormer "shared MLP decoder (1M single-scale approx)" vs `L17563` "SegFormer's decoder is $\sim$3M params across all sizes" in the same entry. Still open from fact-check (16510).
- **[med] [inconsistency]** `L16686–87` YOLOv1 listing comment `-- Block 6: two 3×3 at 7×7` vs prose `L16654` "the spec's own body ends at $28 \times 28$". Still open from fact-check (15642).
- **[med] [count]** `L15884–87` chapter opener lists the demos as "detection, inspection, sign language, leaves and tumours" --- five of the six; remote sensing (EuroSAT, `L17115`) is missing.

#### Low

- **[low] [count]** `L15441` "Atomic ops: `.dense`, ... (Ch 2--5)" --- `.dense` is Chapter 1 (`chap:tensor`), and `L15468` itself says "additive fan-in from Ch 1". Still open from fact-check (14389).
- **[low] [LaTeX / hygiene]** `L15935–37` comma splice: "for $\sim$6 days, the two-tower model is a hardware constraint, not a design choice." Still open from fact-check (14919).
- **[low] [dangling path]** `L15784` "`Proofs/Foundation/PairTile.lean`" lacks its `LeanMlir/` root. Still open from fact-check (14734).
- **[low] [inconsistency]** `L16403–04` "`Layer.denseBlock ic growth\_rate n\_layers`" vs the kit's signature `L15616` "`denseBlock (ic growthRate nLayers : Nat)`". Still open from fact-check (15353).
- **[low] [inconsistency]** `L16293` Inception v3 "Szegedy et al.\ 2015" vs Chapter 5 `L7127` "Szegedy et al., 2016" for the same arXiv:1512.00567. Still open from fact-check (15265).
- **[low] [repetition]** `L16300–11` the label-smoothing bullet (formula, "$1 - \varepsilon + \varepsilon/K$ on the true class", calibration, `TrainConfig.labelSmoothing`) restates Chapter 5's `L7127–35` almost clause for clause; a one-line reminder with a `\ref` would do. `L16306` "Now standard in every modern recipe" --- the book's own ResNet-50 recipe sets it to 0 (still open from fact-check 15280).
- **[low] [external fact]** Still open from fact-check, each one phrase: `L16319` Inception-v4 "stem-A / stem-B / stem-C blocks" (one stem; A/B/C are the Inception modules); `L16209` SqueezeNet "$\sim$2$\times$ fewer FLOPs" (release notes: 2.4×); `L16327–31` Xception "every conv is a depthwise-separable conv" (the stem is two regular convs, as the listing shows) and "made MobileNet possible a year later" (six months); `L16065` Highway → ResNet "six months later" (seven); `L16018–19` VGG "those FC features" (perceptual loss uses conv features); `L16564` "a median image holds seventy objects" (70.7 is the mean); `L16855` "both arms are still rising at epoch 30" (both peak at e28); `L17002` PlantDoc "2,578 photographs ... 28 classes" (paper: 2,598 / 27; 2,578/28 is the GitHub release); `L16707` Mask R-CNN "$\sim$63M in total, matching paper" (the paper gives no count); `L17598` SAM encoder "$\sim$99\% of each variant's parameter budget" (ViT-B: 96%); `L17138`/`L17225` "Rond\^onia in June" (scene is 4 July) and "March" (Jan–Apr scenes); `L17202` "reflectance doubles" (SWIR-1 ×1.5, and over all chips not pasture); `L17209–10` "every arm recovers about 90 ... on all of them" (three arms were fine-tuned; the scratch comparison exists only with all labels); `L17146` "the stem's input channels as the only change" (the flatten also goes 128 → 512, as the ArASL paragraph `L16895` correctly says); `L17053` "leaves on black 60" is a 3-seed mean over 49–72 with no spread shown; `L17422` "within 0.004 on every metric" (TC pooled differs by 0.005 at printed precision).
- **[low] [positional words]** `L15896` "a bestiary entry below puts it to work"; `L16026` "the two paths are two `NetSpec`s below"; `L16570` "The catalog entry below keeps the paper-exact YOLOv1 shape"; `L17312` "the canonical bestiary UNet below also uses"; `L17348` "The second bullet above is the one claim"; `L17464` "The canonical UNet below pairs skips"; `L17475` "in the diffusion subsection below, \S\ref{sec:bestiary_diffusion}" (it is a section in the next chapter). Caption `L16603–04` (fig:visdrone_fpn): "exactly what the per-class spread below predicts" --- a caption pointing at prose and arguing; cut the last sentence.
- **[low] [render]** 17 occurrences of `\S~\ref{layer:...}` in the range (e.g. `L16235`, `L16440`, `L16645`) point at `definition` environments, so they print as "§ 10.3"-style definition numbers that are not sections. Still open from fact-check (4645). Use "Definition~\ref{...}" as `L16566` already does.
- **[low] [inconsistency]** `L15577` section title "Bestiary-only `Layer` primitives" and `L15580–83`: `.pairTile` is "the structure demo's stem" (a Ch 12 demo, no bestiary entry), and `.separableConv`/`.fireModule` are JAX-lowered and trained (`jax/MainMobilenet.lean`, `jax/MainSqueezeNet.lean`), so "bestiary-only" is loose. Partially reworded since fact-check (14530); the title still says it.
- **[low] [inconsistency]** `L15580–82` "`.unetDown` and `.unetUp`, which the segmentation and diffusion demos train through" vs `L17306–08` the segmentation demo's "encoder is the ResNet-34 of Ch 5, reused verbatim as the contracting path rather than a stack of `.unetDown`s" --- segmentation trains through `.unetUp` only.
- **[low] [hand-typed chapter / bare pointer]** `L17120` "the chapter-4 CNN" where every other mention is "Chapter~\ref{chap:bn}" (`L17146`); `L17137` "The Brazil chips were cut for this section (data appendix)" with no `\ref` to the Data availability appendix.
- **[low] [clarity]** `L17349` "the one claim in this subsection" --- it is a section. `L16830` bold lead "Table~\ref{tab:neudet_visdrone_heads} is the result" while the numbers that follow ("0.607 against 0.623") are in `tab:neudet_results`; the result is the two tables together.
- **[low] [overclaim]** `L15889–90` "Chapter~\ref{chap:bestiary_games} plays games against their exact solutions" --- Pong (`L19288`) is played against a state-fed twin and a scripted opponent, not an exact solution (same point the fact-check made for the front matter at 331).
- **[low] [table label]** `tab:visdrone_results` rows "+photometric aug" --- the pack includes a horizontal flip (`demos/MainYolov1VisdroneFpn.lean`), so "photometric" is partly wrong; and the table mixes argmax and multilabel decodes between rows without a column saying so, which is what makes the `L16607–11` "12 epochs still beats 50" reading unsafe. Still open from fact-check (15539).
- **[low] [clarity]** `L16652–55` YOLOv5s/m "(3M/8M single-scale)", YOLOv8n/s "(0.7M/2.9M single-scale)" --- a third to a quarter of the published sizes (7.2M / 21.2M / 3.2M / 11.2M); worth one clause since neighbouring entries are compared to paper counts. Still open from fact-check (15606).
- **[low] [unverifiable]** `L16619–22` per-class AP figures (car→bicycle 19×; +59% / +41% / +40% / +7%), `L16834–37` NEU per-class 0.29 / 0.41 / 0.66–0.84, `L17191–200` Cerrado confusion counts (666 of 884; 42%), `L17214–18` Shapley band shares (13% → 22%; −3.0 nats): none appear in a table or figure in the range; they rest on the run READMEs the chapter never cites.

#### Overall

The range reads as two different books. The kit and the classifier catalogue are clean, consistent in shape (count of new primitives → citation → variants → one listing → pedagogical hook) and well cross-linked to Part 1; the few slips there are overstatements ("paper-exact", "exactly", the AlexNet comment) and the figure/entry disagreement about `bottleneckBlock`. The six demos are where the reader is hurt: the chapter frames detection as something the linear `NetSpec` "cannot" do and then trains an FPN head through a layer (`.fpnDetect`) the book never defines; and roughly thirty numerical or wording findings from the 2026-10-18 fact-check are still in the text, including the four VisDrone percentages that the paragraph's own table does not support and the PlantDoc "last two rows" pointer at the published rows. What the demos do well is the method --- every one asks what the headline number hides (leakage, background, season, skips) and answers it with a table the prose then reads line by line; the ArASL and agriculture sections are the model. The one structural change: give the six demos one shape (data → table → figure → "the columns are the result" → caveats → "what this is not"), each with its run directory and trainer named once, and move the BraTS section's four tables under that shape with every table cited before it appears.

---

### Range L17614–19951 — Ch. 12 "Beyond recognition" (TinyGPT, image generation, DDPM, Boltzmann generator, LIGO, neural quantum states, CASP16 distogram) and Ch. 13 "Game theory" (Pong DQN, Leduc Deep CFR, AlphaZero TTT, MuZero TTT, catalogue)

Line numbers are the current `blueprint/src/content.tex` (21,789 lines). Chapter numbers hand-typed in the range ("Chapter~3's CNN kit" L19323, "chapter-4 CNN" L18556/18571) were checked against the `\chapter` order and are correct (chap:cnn = 3, chap:bn = 4). All `\S~\ref{layer:*}`, `chap:*`, `sec:*` targets cited in the range resolve; every `demos/Main*.lean` and `scripts/demos/*` file named exists; every `\includegraphics` resolves under `figures/demos/`.

#### Findings

- **[high] [dangling / stale]** `L17698–17704`: the TinyGPT demo never received the Kneser–Ney ladder table and figure that commit 84eb2e49 (2026-10-22) measured and that `planning/demo_slate.md` item 2 says the section is owed. The section carries one figure (the causal mask) and **no results table**, unlike every other demo in both chapters (each has a bracket table + a results figure). Text still reads "land at 2.28 bits/char on tinyshakespeare's held-out split --- against 3.56 for a bigram table and 6.02 for guessing uniformly". `grep -i kneser|7-gram|n-gram` over content.tex returns nothing. Fix: add the ladder table (KN orders 1–10, 7-gram plateau 2.225 chunked / 2.188 streaming, three nano seeds 2.285/2.275/2.274) and `ngram_ladder_figure`, and the "Three things change" paragraph's verdict that nano at 10k steps sits 0.04–0.06 bits/char *behind* the 7-gram.
- **[high] [inconsistency / mislabelled number]** `L17702–17703`: "against 3.56 for a bigram table" is presented in the same breath as the 2.28 held-out number, so a reader takes 3.56 as a held-out loss. Per 84eb2e49's log, 3.56 is the dense bigram's **last-epoch train loss** ("it never reads val.bin"); the KN bigram on val is 3.583. Fix: either print the val bigram (3.58) or label 3.56 as train loss.
- **[med] [inconsistency]** `L19276–19283` vs `L19617–19636`: the Game-theory chapter opener says "every rung goes through the squared-error block of the diffusion demo with a host-built target, and **none of it is new codegen**", but the MuZero section's first bullet is headed "**One new codegen piece.**" (`generateVjp` / `generateApplyAdam`). The opener predates MuZero (083a35c7) and was not updated. Fix: "none of it is new codegen but MuZero's unrolled VJP" or similar; also the opener's ladder ("a DQN from pixels, then regret minimisation …, then self-play and tree search") omits the fourth rung.
- **[med] [inconsistency]** `L18587–18588` vs `L18623–18624`: "**Half** the windows carry an IMRPhenomD chirp … $40{,}760$ training and $12{,}228$ validation windows" vs "every threshold set on the $8{,}177$ noise-only windows" — 8,177 of 12,228 is two thirds noise-only, not half. The run logs (`runs/2026-09-11-gw-cifar8w-*/table.log`: "4051 injected / 8177 noise-only") confirm the validation split is one third injected. Fix: "a third of the validation windows (half of training) carry …" or whatever the real split is.
- **[med] [inconsistency / overclaim]** `L18339–18340`: "Reweighting its own samples by $p_{20}/p_\theta$ recovers the quadrature row **to the last digit**" — Table `tab:boltzmann_kt20` (L18322–18323): reweighted $0.805/0.129/0.066$, $\langle U\rangle -112.8$, $\Delta F -36.7$ vs quadrature $0.806/0.129/0.065$, $-113.6$, $-36.6$. Three of five columns differ in the last digit and $\langle U\rangle$ by 0.8. Same overclaim in the figure caption L18300–18301 "report the quadrature populations to three decimals" (kT=8: $0.008$ vs $0.009$). Fix: "to within one in the third decimal" / "to 0.001 on every population".
- **[med] [inconsistency]** `L18084–18093` (`tab:ddpm_scores`): the column is headed "energy ($\times$ floor)" and the real-MNIST row prints "$0.0020$ ($1\times$)", which makes 0.0020 the floor; but the multiples in the other rows are against a different floor: $0.0067/0.0020 = 3.4$ (printed $4\times$), $0.0237/0.0020 = 12$ (printed $15\times$), $0.3674/0.0020 = 184$ (printed $231\times$). The run log (`runs/2026-09-28-mnist-ddpm-ancestral-score/score_centred.log`) shows the real-vs-real floor is $0.00159$ and the real-as-generated row is $0.00196$ ($1.2\times$). Fix: add the floor to the caption or a footnote ("floor $0.0016$, real-vs-real") and print the real row as $1.2\times$.
- **[med] [internal contradiction]** `L18694–18703` (Whisper): "tiny (7M enc, paper 39M total), base (19M enc, paper 74M), … medium (302M enc, paper 769M), large (629M enc, paper 1.55B total) … Encoder and decoder are the same size per variant; adding them together recovers paper totals within 2--3\%." With equal encoder and decoder, $2\times7 = 14$M vs 39M, $2\times19 = 38$ vs 74, $2\times302 = 604$ vs 769, $2\times629 = 1258$ vs 1550 — nowhere near 2–3%; only "small" (where the 153M "dec+emb" is quoted) lands at 238 vs 244. The within-2–3% claim holds only with the embedding table included. Fix: "encoder + decoder + the tied embedding recover …" and drop "same size".
- **[med] [dev-history, still open from 10-21 audit L18769–72]** `L19357–19360`: "An update was 24 milliseconds, twenty of them the shim re-pushing 20~MB of parameters and Adam moments every step; with that state resident on the device (\texttt{trainStepAdamF32DdpmR}) it is 14.6, and a pixel run 27 minutes on one card." Narrates two implementation states ("was … it is"). Fix: state only the shipped number ("An update is 14.6 ms with parameters and Adam state resident on the device; a pixel run is 27 minutes").
- **[med] [dev-history, borderline still open from 10-21 audit L18993–95]** `L19581–19583`: "The Python implementation this loop follows (Nair, alpha-zero-general) was expected to take a day on the $4 \times 4$ board." Orphaned: nothing before or after compares to it, and "was expected" is an author's planning expectation. Fix: cut, or make it a comparison ("…runs the $4\times4$ board in a day; this binary in 10 minutes").
- **[med] [dev-history / inconsistency]** `L19725–19729`: "MuZero's sits at 62--66\% through iteration 40, 73\% at 50, 92\% at 60 and 98\% by 100 … and at $4 \times 4$ **sixty iterations is simply short**. Doubling the steps an iteration brings the take-off to iteration 40 and the sweep to 99.1\%" — the table's $4\times4$ run is 120 iterations (L19684, caption L19697), so "sixty is short" argues against a configuration the book does not show, and the 99.1% arm is not in the table either (table: 98.7%). Reads as the development path. Fix: keep the learning-curve numbers, drop the sixty-iteration verdict, and say explicitly the 99.1% doubled-step arm is an ablation not tabulated.
- **[med] [float rule]** `L17642–17696` (`fig:tinygpt_causal_mask`): the figure is placed before its first citation (L17738, inside the third bullet). Fix: move the figure after the itemize or cite it in the lead paragraph.
- **[med] [float rule]** `L19662–19677` (`fig:muzero_ttt`): the figure appears after the itemize but is first cited only at L19736 ("Figure~\ref{fig:muzero_ttt}'s model loses the board"). Every other demo in the range has a "Figure~\ref{…} is …" sentence before the float. Fix: add one after the itemize.
- **[med] [dangling / undefined]** `L18272–18274`: "The network is the **2-D toy demo's** MLP (\texttt{demos/MainDiffusion2d.lean}, …), the loss is **that demo's** rank-2 squared-error block" — no 2-D toy demo is introduced anywhere in content.tex (this is its only mention); the DDPM section is MNIST only. Later sections cite "the rank-2 squared-error block of the diffusion demo (\S~\ref{sec:bestiary_diffusion})" (L18791–92, L19282, L19298), which does not describe that block either. Fix: one sentence in the DDPM section introducing `MainDiffusion2d` and the rank-2 block, or drop "the 2-D toy demo's".
- **[low] [dev-history, 10-21 audit L17463/17482]** `L18050` and `L18067`: both now say "archived" ("its CIFAR-10, sinusoidal-time and attention variants are **archived** beside it"; "the **archived** CIFAR variant embeds it with the positional-encoding primitive"), so the live-vs-archived contradiction is resolved, but "archived" is still repository history the reader does not need. Fix: "a CIFAR variant embeds it …" with no archive status. (10-21 items L18924–27 "diverged at iteration 11" and L19039–40 "it was dead" are gone; L19628 now reads "returned rather than dropped", which is fine.)
- **[low] [TODO marker]** `L18680–18682`: `% TODO Phase 4: the catalogue table (which GWTC events the trained model flags …) and the Gravity Spy glitch row.` LaTeX comment, so invisible in the PDF, but a planning marker in the book source. Fix: move to planning.
- **[low] [count]** `L17946–17950` (DCGAN): "**Eight** design guidelines (strided convs instead of pooling, BN everywhere except …, no hidden FC layers, ReLU in $G$ / LeakyReLU in $D$, Adam with specific hyperparams)" lists five, and the paper's "Architecture guidelines for stable DCGANs" box has five. Fix: "Five".
- **[low] [inconsistency]** `L19355–19357` (Pong): "at every opponent speed (1.0 / 1.5 / 2.0 pixels a frame: state $+14.45$ / $+13.45$ / $+9.80$, pixels $+17.75$ / $+15.60$ / $+14.45$)" — at the 1.5 training speed the state value is the three-seed mean ($13.45$, matching L19354) but the pixel value is seed 1 alone ($+15.60$) rather than the mean $+15.47$ quoted one line earlier. Fix: use the mean, or say the speed sweep is one seed.
- **[low] [inconsistency]** `L18412–18414` (reflow): "after reflow one Euler step lands at $4.9\times$ the floor where the independent coupling **needs ten**" — Table `tab:boltzmann_reflow`: independent at NFE 10 is $8.6\times$, still worse than $4.9\times$; it only beats $4.9\times$ somewhere between NFE 10 and 50 ($3.2\times$). Fix: "where the independent coupling is still at $8.6\times$ after ten".
- **[low] [clarity / count]** `L19408` (Leduc): "Two things change relative to the **three games around it**" — the chapter has three games in total (Pong, Leduc, tic-tac-toe); the games around Leduc are two. Also `L19400`: "the first game in this **section** with hidden information" → chapter. Fix both.
- **[low] [inconsistency]** `L19276–19280` vs `L19352–19353`: the chapter opener promises "each with its own exact instrument … and, for Pong, a twin fed the six numbers"; the Pong section then reports "The state twin was meant to be the ceiling and is not". Not wrong, but the opener oversells; "exact" does not apply to Pong. Fix: "and, for Pong, the scripted opponent and a state-fed twin".
- **[low] [jargon]** `L18918`: "the closed forms, the **Lanczos ceiling** and every table are \texttt{scripts/demos/nqs\_metrics.py}" — the section's exact references are described as enumeration ($N=12$) and Jordan–Wigner/Pfeuty ($N=64$); "Lanczos" appears here for the first and only time in the chapter. Fix: "the exact energies" or say which $N$ Lanczos covers.
- **[low] [clarity]** `L18197–18200` (Stable Diffusion): "**Three** components are pretrained and frozen during SD's main training (VAE + text encoder) or constrained-frozen (CLIP); only the UNet trains." The text encoder *is* CLIP, so the parenthetical lists the same thing twice and "three" does not resolve. Fix: "Two components, the VAE and the CLIP text encoder, are frozen; only the UNet trains."
- **[low] [clarity]** `L19077–19079` (CASP): "The training set is the information the field had, a date cut; purging the 82 chains homologous to a target is an ablation, and **is worth nothing**." Ambiguous between "changes nothing" and "is worthless". Fix: "and moves no column".
- **[low] [positional]** positional words tied to layout: `L17747` "The bestiary entries below", `L17910` "the subsection after this one" (it is a `\section`), `L18105` "Everything above is discrete", `L18114` "the trainer above", `L18169` "the bestiary DDPM entry below", `L18261` "the entries below", `L18455` "the Boltzmann generator above", `L19013`/`L19199` "The entry after it" / "the entry below", `L19757` "The entries below", `L19799` "(next entry)". The sections and `\subsection*` entries have no labels to cite instead; at minimum change "subsection after this one" to "\S~\ref{sec:bestiary_diffusion}".
- **[low] [template drift]** `L17698` "\paragraph{TinyGPT, in passing.}" — the only demo in the two chapters whose lead paragraph announces itself as an aside; with the ladder landed this heading should match the others ("\paragraph{A char-level transformer against an $n$-gram ladder.}").
- **[low] [caption rule]** captions carrying run recipe rather than describing the graphic: `tab:leduc_arms` L19474 "six minutes a seed on one card"; `tab:ttt_arms` L19564 "twenty iterations and 2.5 minutes on one card …, the same binary with \texttt{n=4}"; `tab:muzero_ttt_arms` L19695–97 the same; `fig:ddpm_mnist` L18150–51 argues ("arrives at a digit the training set never contained"). Fix: move timings into the "Every arm…" paragraph.
- **[low] [style]** `L17757` and `L17637` use "Ch~\ref{…}" where the rest of the range (and book) writes "Chapter~\ref{…}"; `L18116`/`L18117` "32x32", "256x256" with ASCII x where every other entry uses `$\times$`; `L19867` a Unicode em dash "—" inside prose where the file uses `---`; `L19243–19245` two consecutive blank lines before the `verbatim` and after it (harmless).
- **[low] [hygiene]** `L19684–19685`: "at $4 \times 4$ all three initialisations **run end** unbeaten both sides" — stray word; "all three initialisations end unbeaten".
- **[low] [citations]** `L19604–19606`: "Grimm et al.\ 2020's value-equivalence principle; He, Moerland, de Vries and Oliehoek 2023" are the only two citations in the two chapters with no `\href`/venue. Fix: add arXiv links (2011.03506; 2306.xxxx).
- **[low] [repetition]** the "novelty lives in the training procedure, not layer design" sentence closes five entries (DDPM L18182–83 "The lesson is the same one CLIP and NeRF taught"; Boltzmann L18433–35 "The lesson is the one CLIP, NeRF and DDPM taught"; NeRF L18930; CLIP L18960–62 "identical to NeRF's"; LLaVA by implication) and both section leads (L18755–57, L18264–68). Deliberate refrain, but by the fifth repetition it reads as a tic; two instances would carry it.
- **[low] [unverifiable]** `L18140–18141`: "the two intermediate arms, $\eta = 0.25$ and $\eta = 0.5$, sit in order between the first two rows" — not in the table. `L19440`: "the paper's Leduc curves are (150--200 milli-antes per game read from its Figure 1a)". Fine as prose; noting only that a reader cannot check them.

#### Overall

The two chapters are the strongest-structured part of the bestiary: every demo opens on the same move (what the target is, what the exact instrument is, "Three things change relative to …"), brackets its table at both ends, and closes with the gates that make the numbers trustworthy — the Boltzmann, NQS, CASP16 and MuZero sections in particular are models of how to report a small experiment against an exact answer. The catalogue entries are terse and consistent in form. The one structural gap is the TinyGPT section: the chapter's title demo has no results table, its one bracket number is a train loss presented beside a held-out one, and the measured Kneser–Ney ladder that would fix both has been sitting in `runs/` since 10-22 — landing it also lets the "in passing" heading go. Beyond that, the fixes are local: the Game-theory opener needs to admit MuZero's codegen piece, a handful of numbers (LIGO's "half", the Boltzmann "last digit", the DDPM floor, Whisper's totals) need to agree with their own tables, and two Pong/AlphaZero sentences still narrate development rather than the shipped state.

