# ResNet-34 Bag-of-Tricks rerun, verified half — IN PROGRESS (launched 2026-10-20, ares 4× 4060 Ti)

Ch 5's R34 rerun (`planning/imagenet_finish_line.md` items 2 + 7): no bias decay, zero-γ, BN decay
0.9 on both halves; torchvision's RandomResizedCrop on both. Queued by
`runs/2026-10-20-r34-bot-jax/queue.sh` (JAX first, then verified). Smokes:
`runs/2026-10-20-r34-bot-{verified,jax}-smoke/`. Result: pending.
Verified half: `r34-default-bf16-4gpu` at `momdp64wxbf16`, `CKPT_TAG=bot`, Arm B (loader respawn every 10 epochs).
