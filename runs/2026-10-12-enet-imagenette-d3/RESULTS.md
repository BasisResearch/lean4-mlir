# EfficientNet-B0 on Imagenette, the verified AdamW trainer, on the D3 render (2026-10-12)

The ch 7 Imagenette number re-measured on the faithful net: the four strided depthwise
convolutions pad as TensorFlow's `SAME` (D3, a89fa9af) where the 2026-08-12 run
(`runs/2026-08-12-enet-imagenette-xla-cuda/`, 89.96 % / 98.45 %) trained the symmetric artifact.
Same recipe, seed, data and schedule: AdamW 1e-3 / wd 1e-4, cosine + 3-epoch warmup, label
smoothing 0.1, 80 epochs at batch 32, one 4060 Ti, XLA/PJRT; `launch.sh` is the command
(`LEAN_MLIR_CKPT_TAG=d3`, so the old checkpoint at epoch 4 was not resumed).

| | 2026-08-12 (symmetric) | 2026-10-12 (TF `SAME`) |
|---|---|---|
| epoch 80 top-1 / top-5 | 89.96 / 98.45 | **90.04 / 98.29** (3534 / 3858 of 3925) |
| best epoch | 90.14 | 90.17 |
| epochs 1–4 top-1 | 17.8, 34.5, 39.0, 64.2 | 19.3, 31.0, 38.9, 53.9 |
| wall | 40.5 min | 40.7 min (08:02:14 → 08:42:57) |

Within the split's 95 % CI either way (±1 point at 3,925 images): the padding is not a lever at this
scale, as the ImageNet parity gate's 0.37 / 0.048 of logit scale at random init suggested it would
not be once trained. The chapter's table and prose carry the new run; the log is
`efficientnet-verified-adam.log`.
