# ResNet-50-2018 Bag-of-Tricks verified smoke — 2026-10-22, ares (4× 4060 Ti)

`r50-2018-bf16-4gpu` through the supervisor (`ONCE=1 LEAN_MLIR_G2_STEPS=50`, `run.sh`; chained after the
R34 pair by `after_r34.sh`), the first GPU execution of `resnet50in_momdp64wxbf16` (no bias decay; 427d8cda).
Exe rebuilt on ares; DRY_RUN prechecks green. Render compiled in 22.2 s (592 outputs, 4 replicas);
`INIT: zero-γ on 16 residual-closing BNs`, BN decay 0.9; 50 steps, epoch loss 6.976, lr 0.02;
validation over all 50,000: 0.354 / 1.138 %; the `bot` checkpoint (306,684,384 B + `.bn` + `.epoch`)
written, then deleted so the run starts at 0.
