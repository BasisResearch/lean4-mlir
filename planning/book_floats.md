# book_floats.md — every figure and table cited by number

Started 2026-10-15, from the editors' one note on v0.7.2: every figure gets an index, "Figure 1-2.
(caption)". Three of the four parts are done. This file is the fourth: the prose pass.

## 0. Done (2026-10-15)

* **The number style.** `print.tex` and `web.tex` number figures and tables within the chapter
  as `1-2`, appendices as `A-1`, the one table before Chapter 1 as plain `1`; the `caption`
  package gives "Figure 1-2. Caption" in `small`, table captions above the table.
* **Every graphic is a float.** 33 TikZ diagrams and plots, 11 dependency-graph `\input`s and all
  82 tables were set in a bare `center`, unnumbered. Each is now `figure[H]` / `table[H]` with
  a one-sentence `\caption` and a `\label{fig:...}` / `\label{tab:...}`. Book total: 63 figures
  (19 already captioned) and 82 tables. `[H]` keeps every one where it was, so no page reflowed
  beyond the caption lines (233 to 237 pages).
* **The gate.** `scripts/book/book_floats.py` fails on a `tikzpicture`, `tabular`,
  `\includegraphics` or `\input{figures/...}` outside a float, and on a float without exactly
  one caption and one correctly prefixed label. It runs first in `blueprint.yml`.
* **Code listings are out of scope for now** (134 `verbatim` blocks). In this house style they
  would be "Example 1-1."; revisit if the editors ask.

## 1. The pass: cite each float by number — done 2026-10-15

The editors' style implies, and every house style that numbers floats expects, that the text
cites each one by number. Done in four commits on 2026-10-15: the 17 positional phrases, then
Chapters 1–4 (with the note fold below), Chapters 5–9, and the bestiary and appendices. All 145
floats are cited by `Figure~\ref` / `Table~\ref` before they appear, and
`book_floats.py --strict` (on in CI) fails the build on one that is not.

`python3 scripts/book/book_floats.py --refs` is the census: one line per float, with the lines
that `\ref` it, or `NONE`.

**The note fold is done too (2026-10-15).** Every `\noindent` note after a float was split:
setup (the net, the recipe, batch shape, what was scored over what, what a column or whisker
is, the `runs/` directory) into the caption, argument left in the prose, and a note that was
wholly caption deleted. The rules below are what was applied.

| where | figures | tables | uncited |
|---|---|---|---|
| Front matter | 0 | 1 | 1 |
| Ch 1 MNIST: linear classifier | 3 | 0 | 2 |
| Ch 2 MNIST: 1D MLP | 4 | 0 | 4 |
| Ch 3 MNIST: 2D CNN | 5 | 0 | 5 |
| Ch 4 CIFAR with BatchNorm | 4 | 2 | 6 |
| Ch 5 ResNet-34 | 8 | 12 | 20 |
| Ch 6 MobileNetV2 | 6 | 10 | 16 |
| Ch 7 EfficientNet | 4 | 5 | 9 |
| Ch 8 ConvNeXt | 4 | 8 | 12 |
| Ch 9 Vision Transformer | 6 | 7 | 13 |
| Ch 10 Bestiary of Architectures | 18 | 30 | 43 |
| Appendix A Data availability | 0 | 2 | 2 |
| Appendix B Getting started | 0 | 4 | 4 |
| Appendix C On Verification | 1 | 1 | 1 |

### Rules

* Every float is cited at least once, by `Figure~\ref{fig:...}` / `Table~\ref{tab:...}`,
  before it appears. The colon lead-in is usually the place: "Per-epoch test accuracy, the
  median of five runs each:" becomes "Figure 4-3 is the per-epoch test accuracy, ...".
* No positional words. "Below", "above", "the curve that follows" assume a page layout;
  production may float what `[H]` pins, and the web and ebook have no pages. Grep for
  `(table|figure|curve|plot|chart|row|column)s? (below|above)` and `(below|above):$`.
* `planning/book_xrefs.md` §0 applies: a ref names where something is; it does not assert
  what it says. A same-section "Table 5-3 is the reference run" is a name. A cross-chapter
  "Table 5-3's 74.14" is a number carried through a ref, and is not fine.
* **The `\noindent` notes.** 89 floats are followed by a `\noindent` paragraph that reads as a
  caption ("MNIST MLP (784→512→512→10), SGD 0.1, 12 epochs, log-scale mean training loss per
  epoch (`runs/...`)."). Decide per float: what a reader needs to read the graphic standalone
  (the setup, *n*, the source directory) moves into the caption, and what argues something
  stays in the prose. A note that is wholly caption is deleted once folded in.
* Captions added on 2026-10-15 are one sentence and say what the graphic is, not what it shows.
  The 19 older demo captions are paragraphs. After the fold, a caption may run to three
  sentences; the demo captions are the upper bound, not the target.

### Tooling to add with the pass

* `book_floats.py --strict`: also fail on a float with no citing `\ref`. Turn it on in CI when
  the census reads zero `NONE`; until then it is a report.
* `book_xrefs.py`'s `REF` pattern knows `Table~\ref` since 2026-10-15, so the cross-reference
  census covers the new citations.

### Order

Chapter by chapter, one commit each, with `scripts/book/blueprint_preview.py` diffed before
each. Chapters 1–4 first (17 floats, the most-read pages), then the four ImageNet chapters,
whose floats repeat a pattern (reference table and curve, verified table, side-by-side table,
epoch table and curve, recipe diff) so one chapter's wording carries to the next, then the
bestiary and the appendices.

## 2. Open

* `[H]` everywhere is a manuscript choice. If the publisher's production floats figures
  (`[tbp]`), the positional-word rule above is what keeps the prose correct.
* The legend line after Figure 1-2 (`\depgraphlegend{} Every chapter's theorems section opens
  with its own.`) could fold into that figure's caption.
* Front-matter numbering: the one table before Chapter 1 is "Table 1". Some houses use "P-1"
  for a preface; the front matter here is an introduction, not a preface. Ask if it matters.
