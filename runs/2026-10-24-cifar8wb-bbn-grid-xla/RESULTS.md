# CIFAR-10 batch-statistics BN, head-width grid — ares (4× 4060 Ti, CUDA/XLA), 2026-10-24

`GPUS="1 2 3" scripts/sweeps/run_cifar8wb_bbn_grid_sweep.sh 25` (from `../2026-10-24-bbn-seeds/queue.sh`):
`cifar8wb-bbn-grid`, AdamW, cosine, 25 epochs, one seed per width, ~3.5 min wall on three cards.
Test accuracy on all 10,000 with the Wilson 95 % interval (`results.tsv`):

| fc width | 8 | 16 | 32 | 64 | 128 | 256 | 512 | 1024 | 2048 | 4096 |
|---|---|---|---|---|---|---|---|---|---|---|
| top-1 | 75.98 | 76.99 | 77.35 | 76.40 | 76.49 | 77.60 | **77.85** | 77.84 | 77.30 | 77.62 |

Every interval is ~±0.83; from fc16 up all ten overlap the best, so width buys at most ~1.9 points
(fc8 → fc512) and nothing past fc32 is separable.
