# ViT-B verified at DeiT's batch as 2 × (4 × 128), accumulated, no clip — `vitb-default-emabf16-4gpu`, 2026-10-11, ares

The ViT-Ti DeiT-as-timm recipe (`vit-default-emabf16-4gpu`, 320f5045) at ViT-B's width, planning/recipe_prep.md §3.
DeiT-B's 8 × 128 does not fit four 16 GB cards one-shot (its 4 × 128 EMA render already peaks over the default
arena, `runs/2026-08-27-vitb-global512/`), so this is the first accumulating ViT render:
`vitbin_emaaccdp2x128x4wxdropeps0000001erfbf16` — `OptRecipe.adamwAccum 2` through `vitAdamTrainStepText`'s
`acc`, a fifth `[θ|m|v|G|E]` blob region and the `%aup` / `%akeep` scalars (1033 operands = 2 + 5 × 200 + 7 + 24);
the driver reads the 2 off the name and applies on every second micro-batch. Exact under LayerNorm.

## 1. Does it fit at 0.97? — the device probe (`device_probe.sh`, `device_probe.log`)

Bare device executable at 4 replicas (`scripts/probes/bf16_peak_memory.py`, `bf16_device_step.py`):

| budget | peak | args | temp | of budget | executes |
|---|---|---|---|---|---|
| 15.11 GiB (`XLA_PYTHON_CLIENT_MEM_FRACTION=0.97`) | **13.83 G** | 1.68 G | 10.53 G | 92 % | ✅ 813 ms a 512-row micro-batch (min 812.2, p10–p90 812.5–813.6, 5 reps) |
| 11.68 GiB (the default) | 11.13 G | 1.68 G | 7.83 G | 95 % | compiles only after XLA reports *"Can't reduce memory use below 9.58GiB by rematerialization; only reduced to 9.81GiB, down from 16.13GiB"* — not run |

0.97 is the budget, as for every `vitbin` 128x4 render; the conf sets it and greps the FFI shim for the
allocator option. `args` 1.68 G is the five parameter-sized regions (86.6M × 4 B × 5 = 1.73 GB) — the
accumulator costs one region over the clip render's four. Two micro-batches an optimizer step → ~1.63 s per
1024 rows bare-device, 1,251 optimizer steps an epoch.

## 2. The smoke (`smoke_w4.log`)

One capped window (`ONCE=1 LEAN_MLIR_MAX_STEPS=400 LEAN_MLIR_PROBE_WARM=200`) of the committed render
through `scripts/supervise.sh vitb-default-emabf16-4gpu` — the conf's prechecks, Tiny's DeiT-as-timm shim,
the driver's per-epoch schedule, the constant EMA decay and the accumulation cadence. The first attempt
(`smoke_refused_build.log`) was refused by `pc_exe`: the EMA-banner edit in `LeanMlir/Verified/Train.lean`
did not parse (a `\` continuation inside an interpolation), so the precheck's `lake build` failed and
nothing launched — the gate working as meant. Fixed, rebuilt, re-run (`smoke_w4.log`). The driver's
banners read:

    ▸ EMA: region 4 of 5 [θ|m|v|G|ema], shadow starts AT the weights, decay 0.999960 constant from step 0 (timm ModelEma, as DeiT scores; emaWarmup := false). EVAL AND CHECKPOINT SCORE THE SHADOW. ⚠ It advances on APPLY micro-batches only — once per optimizer step, as the reference does.
    ▸ GRADIENT ACCUMULATION: k = 2, blob region 3 of 5 [θ|m|v|G|ema]. Micro-batch 512 x 2 = EFFECTIVE BATCH 1024. 2502 micro-batches/epoch = 1251 updates/epoch

XLA compiled and stepped at 4 × 128 under `LEAN_MLIR_MEM_FRACTION=0.97`.

| SHIM_WORKERS | min | median | p90 | mean | starvation (med − min) |
|---|---|---|---|---|---|
| 4 | 854 | **859** | 863 | 859 | 5 ms |

ms per MICRO-step of 512 rows (the probe counts invokes), median over micro-steps 201–400; an optimizer
step of 1024 is two of them, ~1.72 s. Against the bare-device 813 ms the trainer adds ~45 ms; the feed is
not binding (5 ms of starvation).

ETA at w4: 2,502 micro-steps × 0.859 s ≈ 2,150 s an epoch + the streamed eval (1,563 invokes of the B = 32
f32 forward) ≈ 300 epochs in **~185–190 h** on this box; the conf's `ETA=` carries it. The smoke's checkpoint
under the new tag was deleted.
