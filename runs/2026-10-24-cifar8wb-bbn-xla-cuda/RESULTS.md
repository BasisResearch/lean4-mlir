# CIFAR-10 batch-statistics BN, the "Run it first" transcript — ares (one 4060 Ti, CUDA/XLA), 2026-10-24

`run.sh`: `cifar8wb-bbn-ablation data sgd`, default seed, 40 epochs at the constant lr, the batch-BN
successor of `../2026-09-01-cifar8w-bn-xla-cuda/` (per-image BN, 74.91). Epoch 40: 7,741 / 10,000 =
**77.41 %**, top-5 98.47 %, 95 % CI 76.58–78.22 (`cifar8wb-bbn.log`).
