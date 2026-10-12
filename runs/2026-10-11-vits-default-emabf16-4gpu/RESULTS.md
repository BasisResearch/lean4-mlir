# ViT-S verified at DeiT's batch (4 × 256), no clip — `vits-default-emabf16-4gpu`, 2026-10-11, ares (4× 4060 Ti)

The ViT-Ti DeiT-as-timm recipe (`vit-default-emabf16-4gpu`, 320f5045) at ViT-S's width, planning/recipe_prep.md §3.

## 1. Does 4 × 256 fit? — the device probe (`device_probe.sh`, `device_probe.log`)

Before any render was chosen, the candidate `vitsin_emadp256x4wxdropeps0000001erfbf16_train_step` was
rendered to a scratch directory (same bytes as the committed file) and measured as a bare device
executable at 4 replicas, the way `runs/2026-08-27-vitb-global512/` measured ViT-B — no trainer, no shim,
no parameter round trip:

| budget | peak | args | temp | of budget | executes |
|---|---|---|---|---|---|
| 11.68 GiB (the plugin's default 0.75) | **10.75 G** | 0.47 G | 9.95 G | 92 % | ✅ 587 ms/step (min 585.8, p10–p90 585.9–587.3, 5 reps) |
| 15.11 GiB (`XLA_PYTHON_CLIENT_MEM_FRACTION=0.97`) | 14.22 G | 0.47 G | 13.41 G | 94 % | ✅ 580 ms/step |

It fits the DEFAULT arena and runs there, so S is one-shot at DeiT's 1024 as Tiny is — no accumulation
render, and `LEAN_MLIR_MEM_FRACTION` stays unset for this net (the S driver's docstring: 0.97 starves what
lives outside the pool). The peak at the raised budget is larger because XLA rematerialises less when it
has room (the ViT-B README's finding; quote the budget with the peak). 587 ms a 1024-row step bare-device
against Tiny's 330 ms floor in the trainer at the same shape: S's step is ~1.8× Tiny's, so the shim feed
that starved Tiny (med 638 vs min 330) binds S less.

## 2. The smoke (`smoke_w4.log`)

One capped window (`ONCE=1 LEAN_MLIR_MAX_STEPS=400 LEAN_MLIR_PROBE_WARM=200`, the §3a pattern) of the
committed render through `scripts/supervise.sh vits-default-emabf16-4gpu` — the conf's prechecks, the
DeiT-as-timm shim (Tiny's: per-batch Mixup/CutMix draw, img_mean fill, adjacent RA copies), the driver's
per-epoch schedule banner and constant EMA decay. XLA compiled and stepped at 4 × 256; loss 6.92 at step 0,
6.93 at step 400 (lr 1e-6 — timm's epoch 0 is the warmup floor).

| SHIM_WORKERS | min | median | p90 | mean | starvation (med − min) |
|---|---|---|---|---|---|
| 4 | 641 | **650** | 668 | 653 | 9 ms |

ms per optimizer step of 1024 rows, median over steps 201–400. Against the bare-device 587 ms the
trainer adds ~60 ms (the drop-mask draw, the aux scalars, the resident handover), and the feed is NOT
binding — 9 ms of starvation where Tiny at the same shape read 308 (its step is ~2× shorter than the
producers' batch time; S's is not). No `w8` arm: the feed has nothing to give.

ETA at w4: 1,251 steps × 0.650 s ≈ 813 s an epoch + the streamed eval (196 invokes of the B = 256 f32
forward) ≈ 300 epochs in **~70–73 h** on this box; the conf's `ETA=` carries it. The smoke's checkpoint
under the new tag was deleted. ⚠ The EMA banner in this log says "TF warmup-corrected" over a run whose
decay is constant (`emaWarmup := false`, as the loop computes it); the banner was made to read the flag
after this smoke (`LeanMlir/Verified/Train.lean`), the arithmetic was never wrong.
