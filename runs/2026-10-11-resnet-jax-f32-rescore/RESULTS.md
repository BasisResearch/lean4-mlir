# ResNet references rescored through an f32 forward (2026-10-11)

The three ResNet reference reruns (mars, 2026-10-07: `runs/2026-10-07-r34-jax-bf16-90ep`,
`…-r50-2018-jax-bf16-90ep`, `…-r50-a3-jax-bf16-100ep`) trained and scored through a bf16 forward,
where the verified path scores in f32 — the one thing ch 5's R34 marker owed and the first clause of
its R50 marker. Their final `.state.npz` (BN running stats + weights) were copied to
`/home/skoonce/resnet/mars_2610/` and scored over the full 50,000 with `jax/scripts/eval_full50k.py`
at the in-training protocol (224 / 0.875 for the torchvision pair, 224 / 0.95 for A3, which is also
timm's protocol for all three), once through the trainer's own bf16 forward and once through f32
(`EVAL_DTYPE=f32`: `DT` / `CONV_DT` rebound to float32 before the first trace). `run.sh`; logs here.

| net | training log (bf16) | scorer, bf16 forward | scorer, f32 forward | only bf16 / only f32 / net |
|---|---|---|---|---|
| R34 (e90)      | 74.140 / 91.820 | 74.13 / 91.83 (37,064) | **74.14 / 91.83** (37,070) | 41 / 47 / +6 |
| R50-2018 (e90) | 76.796 / 93.360 | 76.79 / 93.37 (38,396) | **76.76 / 93.39** (38,379) | 63 / 46 / −17 |
| R50-A3 (e100)  | 77.742 / 93.650 | 77.74 / 93.67 (38,870) | **77.75 / 93.65** (38,875) | 84 / 89 / +5 |

**The bf16 eval forward is worth ≤ 0.03 points on every ResNet pair.** It moves 0.2–0.35 % of the
images (88 / 109 / 173 disagreements), nearly symmetrically; the net is +6, −17, +5 images, and
McNemar on the A3 pair of forwards gives p = 0.76. The f32 numbers are what ch 5 should quote for the
reference, since the verified column already scores in f32; the markers' "score the reference through
an fp32 forward" clause is paid, and it changes nothing a reader would notice.

Scorer-vs-log: the scorer's bf16 pass lands within 6–8 images of the training log on each net
(37,064 vs 37,070; 38,396 vs 38,398; 38,870 exactly, top-5 46,833 vs 46,825). Same checkpoint, same
forward; the scorer batches 200 where the trainer's validation batches differently, and bf16 matmul
rounding is not batch-shape invariant. The f32 pass is the reference-grade number.

Per-image bitmaps, `bitmaps/<net>_jax_{module,f32}.bin` (50,000 bytes, stream order = tfds file order,
gitignored like every `runs/**/*.bin`): `DUMP_CORRECT` is the JAX twin of the verified driver's
`LEAN_MLIR_DUMP_CORRECT`, and the two streams walk the validation split in the same unshuffled order
(the shim shuffles the train split only), so a JAX bitmap pairs image-for-image with a verified one.

## McNemar pairings, JAX f32 against the verified half (same 50,000, same order)
The verified final-epoch bitmaps came over from the 3060 box (`bitmaps/r34_momdp64bf16_e90.bin`,
`bitmaps/r50-2018_momdp64bf16_e90.bin`, `bitmaps/a3_lambaccdp4x128wxclipbcebf16_e100.bin`; their set
counts 37,084 / 38,545 / 38,957 are the book's 74.17 / 77.09 / 77.91 exactly). `scripts/demos/mcnemar.py
bitmaps/<net>_jax_f32.bin <verified>`:

| pair | JAX f32 | verified | both right / both wrong | only JAX / only verified | net | discordant | McNemar p |
|---|---|---|---|---|---|---|---|
| R34      | 74.14 (37,070) | 74.17 (37,084) | 34,378 / 10,224 | 2,692 / 2,706 | +14  | 5,398 (10.8 %) | 0.86 |
| R50-2018 | 76.76 (38,379) | 77.09 (38,545) | 36,151 /  9,227 | 2,228 / 2,394 | +166 | 4,622 (9.2 %)  | **0.015** |
| R50-A3   | 77.75 (38,875) | 77.91 (38,957) | 36,909 /  9,077 | 1,966 / 2,048 | +82  | 4,014 (8.0 %)  | 0.20 |

R34 and A3: the two checkpoints are not separable on this validation set. **R50-2018: they are** — the
verified checkpoint is 166 net images ahead of the reference's, p = 0.015 as a paired comparison of
these two trained models. That is a statement about the two checkpoints, not the two implementations:
one seed per arm, and the two paths disagree on 9 % of images regardless of which is ahead, which is
the ordinary spread of two runs of one recipe. Deciding whether the verified path's 2018 run is
systematically ahead (its bf16 training forward rounds differently; the feed is a different program
with the same augmentation) needs seeds per arm, not a second look at this pair. The f32 rescore moved
the reference −17 on 2018 (bf16 forward: p would read 0.03 against the bf16 bitmap, 38,396 vs 38,545).
