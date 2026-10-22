# ResNet-34 Bag-of-Tricks rerun, verified half — 74.14 / 91.85 (ares 4× 4060 Ti, 2026-10-21/22)

Ch 5's R34 rerun (`planning/imagenet_finish_line.md` items 2 + 7, code 427d8cda): no bias decay
(`momdp64wxbf16`), zero-γ on the 16 residual-closing BNs, BN decay 0.9, torchvision's
RandomResizedCrop; SGD momentum 0.9, lr 0.1 at 256 (4 × 64), cosine with a 5-epoch warmup, ls 0.1,
90 epochs, bf16 train / f32 eval. `r34-default-bf16-4gpu`, `CKPT_TAG=bot`, Arm B (loader respawn
every 10 epochs; 8 respawns logged). Launched by `../2026-10-20-r34-bot-jax/queue.sh` after the JAX
half: 07:04 → 06:31 UTC, 23.5 h, ~15.6 min an epoch, one attempt, no restarts.

| epoch | 30 | 60 | 90 |
|---|---|---|---|
| verified top-1 / top-5 | 57.88 / 82.24 | 64.67 / 86.58 | **74.14 / 91.85** |
| JAX (same recipe) | 56.84 / 81.47 | 64.56 / 86.59 | 73.98 / 91.70 |

Against the landed pair (verified 74.17, 09-22; JAX 74.14, 10-07) the three Bag-of-Tricks rows moved
neither half outside its run-to-run spread: verified −0.03, JAX −0.16. One seed per arm.
