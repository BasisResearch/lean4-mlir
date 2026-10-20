# MobileNetV2 1.0, the slim README recipe at 420 epochs, bf16 — JAX reference path

**✅ 71.84 % top-1 / 90.53 % top-5** (35,920 / 50,000), epoch 420/420.
* Landed 2026-10-17 19:11:10 UTC.
* **48.7 h** wall clock (175,287 s of trainer time), on attempt 1.
* Zero restarts.

The JAX half of the 420-epoch MNv2 pair (recipe_prep §6, `6762494c` + D23 `36d8d6cf`: the slim README's
command on every row). The verified half is `runs/2026-10-17-mnv2-default-verified/` (71.69 / 90.52), run
next on this box.
* Job `scripts/jobs/mnv2-full-jax-4gpu.conf`, launched 2026-10-15 18:29:24 UTC on ares (4× 4060 Ti) via
  `launch.sh`.
* Fresh start: `/home/skoonce/mnv2_full_jax_2612/` did not exist.
* Tree at `6bcdb7f3`.

## The run, from its own output

* `lr=0.120000  batch_size=256 (4 devices x 64)  epochs=420  params=3504872`
* `steps_per_epoch=5004  total_steps=2101680`
* ~407 s train per epoch (~81 ms a step, feed-bound) + ~10 s validation, every epoch

Trainer: `jax/.lake/build/generated_mobilenet_v2_imagenet_full.py`. Final state
`/home/skoonce/mnv2_full_jax_2612/mobilenet_v2_imagenet_full.state.npz`.

`rescore.sh` rescores that state over the full 50k through f32 with the per-image top-1 bitmap
(`bitmaps/`, not committed): 35,921 / 45,268 = 71.84 / 90.54, one image off the in-training 35,920
(`rescore_f32.log`). Paired with the verified run's e420 bitmap, McNemar p = 0.30.

## Curve (top-1 / top-5)

| epoch | 5 | 10 | 50 | 100 | 200 | 300 | 400 | **420** |
|---|---|---|---|---|---|---|---|---|
| top-1 | 48.65 | 56.19 | 65.41 | 67.93 | 70.20 | 71.27 | 71.69 | **71.84** |
| top-5 | 73.84 | 80.20 | 86.53 | 88.12 | 89.52 | 90.20 | 90.52 | **90.53** |
