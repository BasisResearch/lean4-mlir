#!/usr/bin/env bash
# Imagenette EfficientNet-B0, the verified AdamW trainer, on the D3 render (TF SAME at the four
# strided depthwises). Re-measures ch 7's 89.96 % (runs/2026-08-12-enet-imagenette-xla-cuda, the
# symmetric artifact). Fresh checkpoint lineage: `LEAN_MLIR_CKPT_TAG=d3` — the old
# `.lake/build/efficientnet_adam_ckpt_xla.bin` sits at epoch 4 and would be resumed otherwise.
cd "$(dirname "$0")/../.."
export LEAN_MLIR_LOWERER=xla LEAN_MLIR_CKPT_TAG=d3 RUN_LOG_DIR=runs/2026-10-12-enet-imagenette-d3
exec ./run.sh efficientnet-verified-adam 3 cuda
