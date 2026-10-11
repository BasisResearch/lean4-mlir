# ViT-Ti verified smoke at DeiT's batch (4 × 256), no clip — `vit-default-emabf16-4gpu`, 2026-10-11, ares

Two capped windows (`ONCE=1 LEAN_MLIR_MAX_STEPS=400 LEAN_MLIR_PROBE_WARM=200`, the §3a pattern) of the
new render `vitin_emadp256x4wxdropeps0000001erfbf16` (831 operands, 0 clip ops, 75 LN-ε constants), the
re-emitted DeiT-as-timm shim (per-batch Mixup/CutMix draw, img_mean fill, adjacent RA copies), and the
driver's per-epoch schedule + constant EMA decay. XLA compiled and stepped; loss 6.94 at step 0.

| SHIM_WORKERS | min | median | p90 | mean | starvation (med − min) |
|---|---|---|---|---|---|
| 4 | 330 | **638** | 803 | 640 | 308 ms |
| 8 | 328 | 766 | 981 | 738 | 438 ms |

ms per optimizer step of 1024 rows, median over steps 201–400. The compute floor is the min, 330 ms
(the 10-06 run at 4 × 128 ran 299 ms a 512-row step, so the doubled batch costs ~10 % more than 2×
per row — fine); everything above it is the feed. Eight producers contend for the CPU and lose.

ETA at w4: 1,251 steps × 0.638 s ≈ 800 s an epoch + the streamed eval ≈ 300 epochs in ~70 h on this
box. The conf's `ETA=` carries it; the 3060 box is unmeasured at this batch.
