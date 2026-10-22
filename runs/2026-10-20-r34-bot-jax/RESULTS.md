# ResNet-34 Bag-of-Tricks rerun, JAX reference half — 73.98 / 91.70 (ares 4× 4060 Ti, 2026-10-20/21)

`r34-default-jax-4gpu`: the re-emitted `generated_resnet34_imagenet.py` (427d8cda: `WD_MASK`, BN
momentum 0.9, 16 zero-γ inits; torchvision's RandomResizedCrop), checkpoints in
`/home/skoonce/r34_bot_jax/`. 18:24 → 07:04 UTC, 12.7 h (~492 s train + 14 s val an epoch), one
attempt, no restarts. e90: 36,990 / 50,000 = 73.98 / 91.70 in training. The pair and the epoch table:
`../2026-10-20-r34-bot-verified/RESULTS.md`. Landed predecessor: 74.14 (10-07).
