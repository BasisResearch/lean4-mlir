# ResNet-50-2018 Bag-of-Tricks rerun, verified half — 76.99 / 93.51 (ares 4× 4060 Ti, 2026-10-23/24)

Ch 5's 2018-recipe R50 rerun (`planning/imagenet_finish_line.md` item 7, code 427d8cda): no bias decay
(`resnet50in_momdp64wxbf16`), zero-γ on the 16 residual-closing BNs, BN decay 0.9; SGD momentum 0.9,
lr 0.1 at 256 (4 × 64), cosine with a 5-epoch warmup, ls 0.1, 90 epochs, 224 / crop 0.875, bf16 train
/ f32 eval. `r50-2018-bf16-4gpu`, `CKPT_TAG=bot`, Arm B (loader respawn every 10 epochs; 8 respawns
logged). Launched by `../2026-10-22-r50-2018-bot-jax/queue.sh` after the JAX half: 08:25 → 14:33 UTC,
30.1 h, ~20.1 min an epoch, one attempt, no restarts.

| epoch | 30 | 60 | 90 |
|---|---|---|---|
| verified top-1 / top-5 | 59.48 / 83.12 | 68.91 / 89.25 | **76.99 / 93.51** |
| JAX (same recipe) | 58.18 / 81.79 | 68.35 / 88.84 | 77.00 / 93.51 |

`rescore.sh` rescored the e90 `bot` checkpoint with `score-checkpoint resnet50-in-2018` (38,494 /
46,756, the in-training count exactly, top-5 one image off) and the JAX e90 state through
`eval_full50k.py` at EVAL_DTYPE=f32 (38,505 / 46,755; its in-training count was 38,499), each with a
per-image bitmap (`bitmaps/`, gitignored). McNemar (`mcnemar.txt`), JAX f32 against verified on the
same 50,000:

| both right | both wrong | only JAX | only verified | net | discordant | exact p |
|---|---|---|---|---|---|---|
| 36,179 | 9,180 | 2,326 | 2,315 | +11 JAX | 4,641 (9.3 %) | **0.88** |

The two checkpoints are not separated on the 50k. Against the landed pair (JAX 76.76 through the same
f32 rescore, verified 77.09; verified +166 net, McNemar 0.015) the JAX half moved +0.25 and the verified
half −0.10, and the landed pair's 0.33-point gap closes to 0.02.
One seed per arm.
