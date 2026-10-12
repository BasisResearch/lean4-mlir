# EfficientNet-B0 ImageNet, the JAX reference at TF's own recipe — smoke (2026-10-12)

`run.sh`: `trainer_smoke.py` = `jax/generated/generated_efficientnet_b0_imagenet_full.py` with
`EPOCHS=2`, `steps_per_epoch=100`; four cards at the default arena, fresh params under
`~/enet_smoke_2612/`. Log `full.log`.

* lr 0.016 at 256 (4 × 64), the warmup reading 0.0032 at step 100 and 0.0064 at step 200
  (`0.016·(step+1)/500`); `eval: f32 forward (evalF32)` before each validation.
* 99 ms a step in the second epoch (9.9 s train for 100 steps; the first epoch's 55 s is the
  compile), ~12 s a 50,000-image validation → ~49 h for 350 epochs if the feed holds
  (`enet-full-jax-4gpu.conf`'s ETA). TF's pipeline — nearest AutoAugment, TF 1's bicubic — is
  cheaper than the PIL-bicubic path the previous B0 trainer fed.
* Exit 0, no RESOURCE_EXHAUSTED at the default arena.
