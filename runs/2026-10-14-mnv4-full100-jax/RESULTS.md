# MobileNetV4-Conv-M, the paper tier at 256² cut to 100 epochs, bf16 — JAX reference path

**✅ 77.39 % top-1 / 93.46 % top-5** (38,696 / 50,000, fp32 eval), epoch 100/100.
* Landed 2026-10-15 02:47:47 UTC.
* **11.67 h** of trainer time (42,004 s on the last attempt; 22.2 h wall clock), on attempt 2.
* One restart: a corrected PCIe AER (BadTLP) on the chipset's upstream bridge (`20:01.1` → `21:00.0`,
  not a GPU) at 2026-10-14 15:07:06 UTC, in epoch 48. The supervisor killed the run on it, as its AER
  policy does, and resumed from the e47 checkpoint 20 s later; about 10 minutes were lost.

The JAX half of the 100-epoch MNv4 pair (`078ad53f`, "the paper tier cut to 100 epochs, on both paths").
The verified half is `runs/2026-10-14-mnv4-full-e100/`, run next on this box.
* Job `scripts/jobs/mnv4-full100-jax-4gpu.conf` (recipe `full100` = `full` with `epochs := 100`, the
  shim identical), launched 2026-10-14 04:34:02 UTC on ares (4× 4060 Ti) via `launch.sh`.
* Fresh start: `/home/skoonce/mnv4_full100_r256_2614/` did not exist.
* Tree at `17d153db`, the same content as `078ad53f` after its rebase.

## The run, from its own output

* `lr=0.004000  batch_size=4096 (4 devices x 1024)  epochs=100  params=9715512`
* `steps_per_epoch=312  total_steps=31200`
* `grad-accum=8x  micro_batch=512 (4 devices x 128)  -> effective_batch=4096`
* `eval: f32 forward (evalF32)`, scored every 5th epoch
* ~790 s train per epoch (2.55 s an optimizer step, feed-bound) + ~11 s validation

Trainer: `jax/.lake/build/generated_mobilenet_v4_imagenet_full100.py`.

## Curve (top-1 / top-5)

| epoch | 5 | 10 | 25 | 50 | 75 | 90 | 95 | **100** |
|---|---|---|---|---|---|---|---|---|
| top-1 | 5.48 | 33.65 | 60.29 | 68.14 | 74.12 | 76.90 | 77.33 | **77.39** |
| top-5 | 15.53 | 58.95 | 83.35 | 88.68 | 91.92 | 93.20 | 93.49 | **93.46** |
