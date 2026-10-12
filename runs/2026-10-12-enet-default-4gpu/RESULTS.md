# EfficientNet-B0 ImageNet, the verified trainer on the TF-recipe render — smoke (2026-10-12)

`ONCE=1 LEAN_MLIR_MAX_STEPS=400 LEAN_MLIR_PROBE_WARM=200 RUNDIR=runs/2026-10-12-enet-default-4gpu
scripts/supervise.sh enet-default-4gpu` — the conf's own precheck (every grep in it) and launch,
one capped window on four cards, the render `efficientnetin_emarmstfdp64dropdowneps0001bf16`
(TF1's RMSProp, TF's decay set `wn`, D3's padding) and the shim with TF's pipeline.

* PROBE 121 ms/step median of steps 201..400 (min 119, p90 122, mean 120; starvation 2 ms) →
  606 s/epoch + ~85 s eval/ckpt → ~67 h for 350 epochs (`enet-default-4gpu.conf`'s ETA). The
  2026-09-25 probe on the PIL-bicubic feed read 148 ms: the shim's nearest AutoAugment and TF 1's
  bicubic are the cheaper feed.
* `banners.log`: the driver's recipe banners from a 3-step run under the same conf (the smoke's
  stdout went through the supervisor; `master.log` is its record).
* No checkpoint written under the new variant (the window ends inside epoch 1).
