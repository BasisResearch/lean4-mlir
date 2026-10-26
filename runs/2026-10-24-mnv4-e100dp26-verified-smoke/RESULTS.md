# MNv4-Conv-M paper tier at 100 epochs, verified smoke — 2026-10-24, ares (4× 4060 Ti)

`mnv4-full-e100-4gpu` at the fresh `e100dp26` tag (`run.sh`), the first run of the verified binary
since 3333bbd5 (tf-models' 26-entry drop-path ramp, the centre-crop fallback). DRY_RUN prechecks green
on both confs. The conf's own `LEAN_MLIR_G2_STEPS=2496` overrides the 16 passed on the command line, so
the smoke ran one whole epoch (~10 min): loss 7.16 at step 0 → epoch mean 6.86, lr 0.000793 in the
warmup, the `.bn` companion and checkpoint written, then the run stopped and the checkpoint removed so
the pair starts at 0. Epoch 1 is not scored (`VAL_EVERY=5`).
