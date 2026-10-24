# CIFAR-10 batch-statistics BN, six arms × five seeds — ares (4× 4060 Ti, CUDA/XLA), 2026-10-24

`SUITE=bbn scripts/sweeps/seed_sweep.sh` (`queue.sh`): `cifar8wb-bbn-ablation`, the wide eight-conv
net with batch-statistics BN and running-stat eval (planning/cifar-batch-bn-rerender.md), 40 epochs
at the constant lr, seeds 1–4 on cards 0–3 then seed 5 on card 0; ~6.6 min a seed. Final-epoch test
accuracy on all 10,000 (`sweep.log` OK lines; per-arm bitmaps in `bitmaps/`, gitignored):

| seed | sgd | mom | adam | bf16 sgd | bf16 mom | bf16 adam |
|---|---|---|---|---|---|---|
| 1 | 77.89 | 77.91 | 75.54 | 77.41 | 77.93 | 77.47 |
| 2 | 74.93 | 77.71 | 75.69 | 76.38 | 78.22 | 72.22 |
| 3 | 76.78 | 77.36 | 75.00 | 78.08 | 77.76 | 73.34 |
| 4 | 76.71 | 76.21 | 76.24 | 76.57 | 77.76 | 76.71 |
| 5 | 77.18 | 75.73 | 77.25 | 76.29 | 78.37 | 76.72 |
| **median** | 76.78 | 77.36 | 75.69 | 76.57 | **77.93** | 76.71 |
| sd | 1.09 | 0.96 | 0.85 | 0.77 | 0.28 | 2.35 |

No arm diverged; no NaN in any log. `cifar8-bbn-gradcheck` on this box fails tier 2 (rel 2–7 %, the
layer moving run to run) while tier 1 passes and the analytic ⟨g,δ⟩ at NVIDIA_TF32_OVERRIDE=0 matches
the 10-19 vmvx pass to three digits in every layer: the finite-difference side is fp32 GPU noise.
