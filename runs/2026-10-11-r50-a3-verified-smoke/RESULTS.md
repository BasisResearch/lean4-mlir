# Verified RSB-A3 smoke, the timm-recipe driver (2026-10-11)

`ONCE=1 LEAN_MLIR_MAX_STEPS=400 LEAN_MLIR_PROBE_WARM=200 RUNDIR=<here> scripts/supervise.sh
r50-a3-wxclip4x128-bf16-4gpu` on 4× 4060 Ti (`once.log`), then 24 micro-steps again after the driver
gained its schedule banner (`once_banner.log`):

    train 1281167, test 50000; bs 128, ResNet-50 (ImageNet-1k, 160² train) lambaccdp4x128wxclipbcebf16
      (cosine→0.000001+warmup 5ep, baseLR 0.008000), He init
    ▸ LR SCHEDULE: per epoch (timm CosineLRScheduler, t_in_epochs) — warmup 0.000100→0.008000 over 5 epochs,
      then cosine over all 100 epochs to the floor 0.000001; the rate is constant within an epoch
    PROBE: 307 ms/step (median of 200 steps 201..400)
    PROBE-SPREAD: min=275 med=307 p90=324 mean=306 ms/step (starvation wait = med-min = 32 ms)

* The 160² render selects A3, and the driver now passes `schedPerEpoch` / `warmupLRInit 1e-4` /
  `minLR 1e-6` on it (`apps/imagenette/MainResnet50Imagenet.lean`, the `rsb` condition; the a2 / a1
  recipes take the same). The floor in the first line is the first visible sign; the second line is
  the schedule's own.
* The shim is the re-emitted `generated_resnet50_imagenet_short_shim.py`: Mixup or CutMix drawn per
  batch at 0.5, RandAugment's fill at img_mean (`rng.random() < 0.500000`, `_RA_FILL`; reproducible
  under `SHIM_DETERMINISM=1`, distinct across seeds).
* 307 ms/step against the conf's 282–285 on file: ~24 h for the 100 epochs at this rate, inside
  the ETA's "~22 h"; the 32 ms starvation wait says the feed, not the graph.
* No checkpoint under the new tag 2611 was written (the probe stops before an epoch ends), so the
  real run starts fresh; `LEAN_MLIR_DUMP_CORRECT` is appended in PRECHECK and writes
  `bitmaps/a3_…_e{N}.bin` from the first epoch on.
