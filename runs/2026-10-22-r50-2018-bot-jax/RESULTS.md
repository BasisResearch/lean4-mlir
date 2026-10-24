# ResNet-50-2018 Bag-of-Tricks rerun, JAX reference half — 77.00 / 93.51 (ares 4× 4060 Ti, 2026-10-22/23)

`r50-2018-jax-4gpu`: the re-emitted `generated_resnet50_imagenet_2018.py` (427d8cda: `WD_MASK`, BN
momentum 0.9, 16 zero-γ inits), checkpoints in `/home/skoonce/r50_2018_bot_jax/`. 10:16 → 08:25 UTC,
22.2 h (~870 s train + 16 s val an epoch), one attempt, no restarts. e90: 38,499 / 50,000 = 77.00 /
93.51 in training; 38,505 / 46,755 = 77.01 / 93.51 through an f32 forward
(`../2026-10-22-r50-2018-bot-verified/rescore.sh`). The pair, the epoch table and McNemar (p = 0.88):
`../2026-10-22-r50-2018-bot-verified/RESULTS.md`. Landed predecessor: 76.80 in training, 76.76 through the f32 rescore.
