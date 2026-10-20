# MobileNetV2 1.0, the slim README recipe at 420 epochs, bf16 — verified path

**✅ 71.69 % top-1 / 90.52 % top-5** (35,843 / 50,000, 95 % CI 71.29–72.08), epoch 420/420.
* Landed 2026-10-20 10:54:20 UTC.
* **63.7 h** wall clock, on attempt 2.
* One restart: a corrected PCIe AER (Data Link Layer `Timeout`) on the chipset's upstream bridge
  (`20:01.1`, not a GPU) at 2026-10-19 17:41:51 UTC, at step 2,800 of epoch 308. The supervisor killed the
  run on it, as its AER policy does, and resumed from the e307 checkpoint 15 s later; about 25 minutes
  were lost. It is the same bridge as the MNv4 JAX run's BadTLP on 2026-10-14.

The verified half of the 420-epoch MNv2 pair. The JAX half is `runs/2026-10-15-mnv2-full-jax/`
(71.84 / 90.53), run first on this box.
* Job `scripts/jobs/mnv2-default-4gpu.conf`, launched 2026-10-17 19:13:08 UTC on ares (4× 4060 Ti) via
  `launch.sh`.
* Render `emarmstfdp64wxdwdoeps0001bf16` (4 × 64 data-parallel, global 256), XLA through PJRT. EMA
  shadow at decay min(0.9999, (1+t)/(10+t)); eval and checkpoint score the shadow, through
  `mobilenetv2in_fwd_eval_eps0001`.
* Tree at `6bcdb7f3`, the exe built on Lean 4.35.0, unchanged for the whole run.
* `ffi/libpjrt_ffi.so` was rebuilt before launch: the first dry run's precheck refused it as older than
  `ffi/pjrt_ffi.c` (the Metal commits `4fb09f4f` / `f995900c`). That change is Apple-only `#ifdef`s
  plus an option read only when `LEAN_MLIR_PJRT_PLATFORM` is set, so the Linux path is the one measured
  before. The second dry run is `dryrun.log`.
* No checkpoint for this variant existed, so it was a fresh start.
* Per-epoch top-1 bitmaps went to `bitmaps/` (`*.bin`, not committed).
* `full.log` is committed as `full.log.gz`: at 2.3 MB the plain file is over the repo's 2 MB per-file cap.

~545 s an epoch including the streamed f32 eval and checkpoint, 5,004 steps an epoch.

## Curve (top-1 / top-5)

| epoch | 5 | 10 | 50 | 100 | 200 | 300 | 400 | **420** |
|---|---|---|---|---|---|---|---|---|
| top-1 | 48.48 | 56.12 | 65.25 | 67.70 | 69.99 | 70.92 | 71.70 | **71.69** |
| top-5 | 73.49 | 79.91 | 86.52 | 88.24 | 89.56 | 90.37 | 90.50 | **90.52** |

## Against the JAX half

| | top-1 e420 | top-5 e420 | top-1, e400–420 mean |
|---|---|---|---|
| verified (this run) | **71.69** | **90.52** | 71.68 |
| JAX (`2026-10-15-mnv2-full-jax`) | 71.84 | 90.53 | 71.73 |
| Δ | **−0.15** | −0.01 | −0.05 |

The pair ties: −0.15 (77 images) is well inside one run's ±0.40 95 % half-width, and the curves sit on
each other the whole way (e23: 30,771 vs 30,774 correct). The 350-epoch pair this replaces was
JAX 71.63 against verified 71.12, a −0.51 gap. McNemar needs a JAX bitmap, which the trainer does not write; the checkpoint
is `/home/skoonce/mnv2_full_jax_2612/mobilenet_v2_imagenet_full.state.npz` for a rescore.
