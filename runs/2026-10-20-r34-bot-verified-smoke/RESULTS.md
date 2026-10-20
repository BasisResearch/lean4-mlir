# ResNet-34 Bag-of-Tricks verified smoke — 2026-10-20, ares (4× 4060 Ti)

`r34-default-bf16-4gpu` through the supervisor (`ONCE=1 LEAN_MLIR_G2_STEPS=50`, `run.sh`), the
first GPU execution of `resnet34in_momdp64wxbf16` (no bias decay, 427d8cda) with the host-side
zero-γ and BN decay 0.9; exe rebuilt on ares, `regen_jax_generated.sh box` 68/68 in sync.
Run before the conf moved to Arm B, so the loaders here are bare (no respawn).

- render compiled in 14.2 s (405 outputs, 4 replicas); 330 parameter tensors resident.
- `INIT: zero-γ on 16 residual-closing BNs`; `decay 0.900000` on 36 BN layers.
- 50 steps at global 256: loss 6.932 → epoch mean 6.959, lr 0.02 at the end of the cap (warmup).
- validation, all 50,000 streamed: 0.226% / 0.832% (above chance after 50 warmup steps).
- `bot` checkpoint written (261,572,064 B + `.bn` + `.epoch`), then deleted so the run starts at 0.

Too few steps to time the epoch; the conf's ~21.4 h is the 3060 box's 2026-09-16 probe.
