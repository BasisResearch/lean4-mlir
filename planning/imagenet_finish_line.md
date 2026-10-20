# imagenet_finish_line.md — what stands between `lake run imagenet` and a paper-accurate book

**Written 2026-10-19** on atlas, from a six-way read-only audit of HEAD `e9e59edc` (ResNet, MobileNet,
EfficientNet, ConvNeXt, ViT, cross-cutting). Each net's emitted JAX trainer, shim, verified render and
conf were read against the upstream code (torchvision, RSB + timm, TF-slim, tf-models, tensorflow/tpu
EfficientNet, facebookresearch/ConvNeXt, DeiT). This file is the work list for the next session;
`imagenet_parity.md` §10–§11 stay the history.

**Where things stand.**
- On a GPU box all 28 prechecks pass: the 14 `imagenetRows` rows and their 14 JAX peers. That was
  simulated on atlas with a fake plugin, python and binaries.
- Every render and generated file a conf names exists, and `regen_jax_generated.sh check` is clean.
  (On atlas `lake run imagenet` refuses every row, but only for box reasons: no plugin, no GPU, no
  binaries. The local `jax/.lake/build` MNv4 copies are also stale since 3333bbd5; `sync` fixes that.)
- **Recipes clean against upstream, nothing left to build:**
  - MNv2: TF-slim's README.
  - MNv4 `full`: the tf-models yaml, with 3333bbd5's 26-entry ramp and centre-crop fallback on both paths.
  - B0: TF EfficientNet.
  - ConvNeXt T/S/B: the `*-emabf16` confs.
  - ViT Ti/S/B: DeiT.
  - RSB A3/A2/A1: clean apart from F6.

## Approved scope (the user, 2026-10-19), in order

### 1. ConvNeXt-T: point the Ch. 8 row at the faithful conf — ✅ 2026-10-19

`imagenetRows` (`lakefile.lean:2367`) and its per-job script (`:2418`) name `cnx-default-4gpu`. That is
the one-shot recipe behind the landed 09-18 run: 4 × 64 = 256, lr 2.5e-4, clip 1.0, no EMA.

The official recipe is `cnx-default-emabf16-4gpu`: 4 × 64 × k16 = 4096, lr 4e-3, no clip, EMA 0.9999
from step 0, `G2_STEPS=4992`. The book's own TODO (~`content.tex:11837`) already names it.

- [x] Swap the row to `cnx-default-emabf16-4gpu` and add a `script «cnx-default-emabf16-4gpu»`.
      Drop `cnx-default-4gpu`'s script and move it to the axis-sibling list.
- [x] Fix the garbled sibling sentence in the `imagenetRows` docstring (~`:2352`). "(ConvNeXt-T with
      the EMA shadow)" is spliced into the S/B "f32 at 4 × 32" clause.
- [x] `cnx-default-4gpu.conf` header: it says the emabf16 conf "sources this file" and that the Ch. 8
      row "names this file". Neither is true after this step. Same claim at `imagenet_parity.md:338`.
- [x] Note in that conf that it does NOT reproduce the landed 81.30 any more. The app now always
      passes `minLR 1e-6` (`MainConvNeXtImagenet.lean:88`), and the conf runs the erf render, not
      tanh. Either freeze it, or say so.
- [x] Book: the pair table (`content.tex:11963`, `:11972`, `:11980`) describes the one-shot run
      (2.5e-4, "global-norm 1.0, this book's addition", batch 256). Leave the numbers and keep the
      TODO marker, but make the marker say the row now runs the official recipe and the pair is owed.

### 2. R34: the published pair did not share a train crop — ✅ 2026-10-19 (rerun prepared, not launched)

- The verified 74.17 (`runs/2026-09-22-r34-syncbn-bf16-90ep`) started before `aa974a95` (2026-10-06,
  torchvision's `RandomResizedCrop` on the torchvision-side recipes). It trained on TF's
  `sample_distorted_bounding_box` (`min_object_covered` 0.1, uniform aspect, whole-image fallback).
- The JAX 74.14 (`runs/2026-10-07-r34-jax-bf16-90ep`) trained torchvision's crop.
- `tab:r34_paths` (`content.tex:6755`) lists neither crop.
- The prose at `content.tex:6563` ("TensorFlow's sampler (10–100%)") is wrong for both halves.

- [x] Book: a `\textbf{[TODO: …]}` marker on the R34 section, in the file's existing marker style
      (e.g. `content.tex:7361`). It should say:
      - the verified half trained TF's sampler and the JAX half torchvision's;
      - the recipe is the DAWNBench one (item 3);
      - a verified rerun on the torchvision crop is owed.
- [x] Add a `train crop` row to `tab:r34_paths` that shows the two crops. Fix the 6563 prose to name
      what each half ran.
- [x] Prepare the verified rerun, but do not launch it (prepared 2026-10-19: `CKPT_TAG=tvcrop`, tagged `CKPT_EPOCH_FILE`, `pc_ckpt`, fresh RUNDIR in the header; `pc_crop` does grep the crop call) (launching needs the user's word). Two traps:
  - **Checkpoint tag.** `r34-default-bf16-4gpu.conf:142` keys the checkpoint on the variant alone, so
    the finished 09-22 checkpoint on the 3060 box reads as COMPLETE, and a launch exits 0 without
    training. Add a `CKPT_TAG` (as `mnv4-full-e100-4gpu` does), give the run a fresh RUNDIR, and
    have the PRECHECK refuse an untagged epoch-90 file.
  - **Crop check.** `precheck_r34_bf16_90` already has `pc_crop … torchvision bilinear`. Confirm it
    greps the committed R34 shim's crop, not just its existence.
- [x] The conf header (`r34-default-bf16-4gpu.conf:17–30`) still calls `r34-default-4gpu` the
      `imagenetRows` row and cites the retired fp32 74.14 / 91.86 pair. Update both.

### 3. R34 / R50-2018: the recipe is Bag of Tricks; DAWNBench is the lineage — ✅ 2026-10-19 (prose)

Pinned 2026-10-19 from the entries themselves (`stanford-futuredata/dawn-bench-entries`, the user's
`fastai/imagenet-fast` commit `1bc5aeec`, `imagenet_nv/main.py` at `c4b22555`):

| | CIFAR-10 entry (the user's, 2018-04-19) | ImageNet entry (2018-04-20) |
|---|---|---|
| net / epochs | WRN-22, fp16, 40 | ResNet-50, 45 |
| schedule | 1cycle (`use_clr_beta=(50, 12.5, 0.95, 0.85)`): lr/50 → 2.0 over 17.5 ep, back down over 17.5, anneal to lr/5000 over the last 5; momentum 0.95 ↔ 0.85 | warmup 0.1 → 0.4 over 4 ep, then ×0.1 at epochs 20, 34, 42 |
| wd / batch | 2e-4 / 128 per process, 8 V100 | 1e-4 / 128 per GPU, 1024 global |
| resizing | 32 px | progressive: 128 to ep 18, 224 to 41, 288 for the last 4 at batch 128 |
| augmentation | pad 4 + random crop, ColorJitter 0.25, rotate 2°, hflip | RandomResizedCrop (0.08, 1), hflip; val ×1.14 resize, centre crop |
| label smoothing | no | no |

Neither entry has cosine or label smoothing. The rows run cosine + 5-epoch warmup + smoothing 0.1 +
wd 1e-4 at batch 256 for 90 epochs, fixed 224: that is Bag of Tricks (He et al. 2018), exactly. So
the rows' recipe is Bag of Tricks and DAWNBench is the lineage (warmup-then-anneal first won at
scale there, in two forms on two datasets). The earlier call — "the recipe these rows emulate is
DAWNBench's" — would have needed step decay + progressive resizing (a rerun) or a label the code
does not support; the user chose the honest label.

- [x] Book: the cosine paragraph (`content.tex:~6547`) now says DAWNBench's two entries ran 1cycle
      (CIFAR-10) and warmup + step decay + progressive resizing (ImageNet), links both entries, and
      names Bag of Tricks as the cosine form the chapter's ImageNet rows run. The intro (`:254`)
      says "won the CIFAR-10 track … and trained ImageNet in 3 hours for $25". The R34 marker says
      "the recipe both rows run is Bag of Tricks".
- [x] `imagenet_parity.md` §10.1's R34 / R50-2018 row: source of truth is Bag of Tricks; disclosed
      deviations BN decay 0.99 on R34 and zero-γ on R50 only.
- [x] `MainResnet34Imagenet.lean:38` "He et al.'s own schedule" is correct as it stands; the conf
      headers' "the 2018 recipe" stay.
- The "3 for ResNet-34" at `content.tex:~6560` is the Imagenette recipe's warmup (AdamW, 3 ep,
  `:6342`); the ImageNet rows' 5 is a different recipe. Not a conflict.

### 4. Pairs the book publishes that predate their row's conf

The book says every row has run (`content.tex:18963`). Three rows now train a different recipe from
the run behind the book's number:

| row | book's pair (verified / JAX) | ran | the row now trains |
|---|---|---|---|
| MNv2 `mnv2-default-4gpu` | ~~71.12 / 71.63, `runs/2026-09-27-*`~~ → **71.69 / 71.84**, `runs/2026-10-17-mnv2-default-verified` / `2026-10-15-mnv2-full-jax` (landed 2026-10-20, McNemar p = 0.30) | the TF-slim README's 420 ep (`emarmstf…`) | ✅ the book's pair since 2026-10-20 |
| B0 `enet-default-4gpu` | 76.88 / 77.15, `09-12` / `jax/runs/enet_b0_imagenet_bf16_350ep` | pre-D3/D6/D13 | TF's code row for row (`emarmstf…`, SAME padding) |
| ConvNeXt-T (after item 1) | 81.30 / 81.53, `09-18` | one-shot 256, clip, tanh GELU | the official 4096 recipe |

- [x] Fix the `:18963` sentence. Each row either has run on its current recipe, or has a pair on an
      earlier recipe, named. — 2026-10-19: names the three, their earlier confs, and that the MNv2
      and B0 reruns launched 2026-10-19 with ConvNeXt-T queued behind them (the user's launch).
- [x] Each of the three chapters' TODO markers (MNv2 `:8730`, B0 `:10399`, ConvNeXt `:11837`) should
      say plainly that the published pair predates the faithful recipe. Check each one does. —
      MNv2 and B0 said "not yet run" and nothing about the pair; both now say the pair predates the
      recipe and the rerun launched. ConvNeXt's (item 1) says the pair is queued.
- [x] Also: the B0 sentence at ~`content.tex:10340–10344` says, in the present tense, that the rate
      multiplies the momentum buffer on both paths. D13 changed that, so put it in the past tense
      for the landed pair. — Done; it also says both paths took TF's form on 2026-10-12.
- [x] The row count: the book says "fourteen" but its side-quest table has 8 rows, 15 in all,
      including `mnv4-full-e100`. `imagenetRows` has 14. Make the book match. — The sentence now
      excepts the 100-epoch MNv4 job ("that pair's own and not a row"); 7 + 8 − 1 = 14.
- [x] Two small book fixes:
  - The R50-2018 curve ends at 76.80, the pre-rescore number; the table says 77.09. — Not a
    conflict: 77.09 is the verified column; the reference's 76.80 is the in-training bf16 read and
    76.76 its f32 rescore (`runs/2026-10-11-resnet-jax-f32-rescore`). `tab:r50_paths_epochs`'s
    caption now says so for the table and the curves.
  - README:57 still quotes ViT-Ti 72.42 and MNv4 76.68. The book has 71.61 and 77.35. — Already
    71.61 and 77.35 at HEAD; nothing to do.

### 5. F6: `floor`, not `round`, in the timm-protocol eval resize

- The site is `jax/Jax/Codegen.lean:724`: `target = tf.cast(tf.round(_IMG_SIZE / _CROP_PCT), tf.int32)`.
  timm and torchvision use `int(224 / crop_pct)`, i.e. floor.
- It only moves crop values where 224/crop is fractional:
  - 0.95 (RSB A3/A2/A1, and the A3 / MNv4 timm-protocol rescoring): 236 → 235.
  - 0.9: 249 → 248.
  - 0.875 is exact (256), so R34, R50-2018, ConvNeXt and ViT emit the same bytes.
- Planning ids: F6 (`imagenet_parity.md:520`), P-J (`vit_parity_todo.md:71`).

- [x] Change the target to `tf.math.floor` (2026-10-19; timm 1.0.28 `transforms_imagenet_eval`:
      `scale_size = math.floor(img_size / crop_pct)`, read off the pinned tag).
- [x] **Also check the long side.** torchvision's `Resize(int)` computes it as
      `int(size · long / short)`, which truncates. The emitted `nh` / `nw` use `tf.round`. Read
      torchvision's `_compute_resized_output_size` at the pinned version and match it. If it does
      truncate, this is the same fix. — It does (v0.28.0: `new_long = int(requested_new_short *
      long / short)`), so the emitter now computes `int(target · max(h, w) / min(h, w))` in float64
      and places it with `tf.where(w <= h, …)` the way torchvision assigns short/long. **This moves
      every timm-protocol emitter, not only the 0.95 ones**: at 0.875 the short side stays 256 but
      the long side truncates where it rounded up (a 350 × 500 image: 365, not 366). All 68
      `jax/generated/*.py` re-emitted, 7 lines each, nothing else in the diff.
- [x] Add a differential gate in the `crop_sampler_gate.py` mould: the emitted eval resize against
      torchvision's `Resize(int(224/crop)) + CenterCrop(224)` output size, at 0.875 / 0.9 / 0.95, on
      a few aspect ratios, plus a red control at the old `round`. Wire it where the sibling gates run
      (jax.yml, or the TF-gate list F9 names). — Part 4 of `scripts/gates/crop_sampler_gate.py`
      (2026-10-19): the emitted `_imagenet_decode_center_crop` exec'd out of the ViT-Ti shim (0.875)
      and the RSB shim (0.95), `_CROP_PCT` also set to 0.9, twelve shapes, torchvision's `F.resize`
      in `.venv-timm` as the reference; the pre-F6 text is the control and goes red at every crop.
      Ran green on atlas (`.venv-score` + a fresh `.venv-timm`); it rides the existing jax.yml step.
- [x] Re-emit with `scripts/regen_jax_generated.sh write` / `sync` / `check`. Expect only the
      0.95-crop (and any 0.9) trainers and shims to move. The rest must stay byte-identical; say
      which moved in the commit. — The expectation was wrong because of the long side (above):
      all 68 moved, each by the same 7-line block. `write` and `sync` done 2026-10-19 on atlas.
- [x] Update the confs whose prechecks grep the eval resize line. — None does: the prechecks grep
      `_CROP_PCT = 0.875`, the `_timm` function name and TF-slim's `oy = tf.cast(…)` line, none of
      which moved (`grep -n 'tf.round\|_CROP_PCT\|decode_center_crop' scripts/jobs/*.conf`).
- [x] **The landed A3 pair** (78.08 / 77.60) was scored at 236 — both halves rescored at 235 (JAX 2026-10-19, verified 2026-10-20 on ares: 78.05 / 93.97, McNemar at the headline bitmaps 1,891 / 2,126, p = 0.0002); the book's A3 pair is 77.58 / 78.05 since 2026-10-20:
  - Rescore both checkpoints at 235 on atlas's CPU; `runs/2026-10-12-r50-a3-jax/rescore.sh` is the
    template. — JAX half done (`rescore_f6.sh`, 2026-10-19): **77.58 / 93.66** at 235 against
    77.61 / 93.61 at 236, −13 images top-1, +24 top-5. The verified half: **done 2026-10-20** on ares
    (`rescore_f6.sh pre|f6`: 78.08 / 93.85 control, 78.05 / 93.97 at F6), the pair moved together. Its checkpoint (2611 `.bin` / `.bn` /
    `.epoch`) is on atlas at `~/lean/incoming/` since 2026-10-19, but atlas cannot score it:
    `score-checkpoint` through IREE `llvm-cpu` segfaults in the first invoke on `local-task` and
    runs single-threaded for hours on `local-sync` (noted in
    `runs/2026-10-12-r50-a3-rsb-bf16/rescore_f6.sh`, which is written for any PJRT box — ares, or
    a ROCm card through `historical/ROCM.md`'s fast path — as `pre` (the 236 control against
    ares's 39,039) and `f6`).
  - Report the move. Update the book only if it moves the printed digits; either way, note the
    protocol in the run READMEs. — It moves top-1 by 0.03; the book keeps 77.61 / 93.61 with a
    marker on the A3 section until the verified rescore lands. Noted in the run's RESULTS.md.
  - The MNv4 timm-protocol rescores, if any are printed, likewise. — None printed (D18 is open).
- [x] Mark F6 / P-J ✅ in both planning files (2026-10-19).

### 6. Docstrings and stale text

Lakefile, Tier 4 (line numbers as of `e9e59edc`):

- [ ] `:561` R34, and `:601 / :612 / :648`: "(all five)" shims. `scripts/gen_shims.sh` has more than that now.
- [ ] `:574` R50: "AdamW … NOT RSB-A3 — no LAMB, no bs2048, no gradient accumulation". The exe trains
      `momdp64` (2018) and `lambaccdp4x128` (RSB, LAMB accumulated to 2048). Same text at
      `MainResnet50Imagenet.lean:13`.
- [ ] `:582` MNv2 and `:609` B0: "Optimizer does NOT match the reference (RMSProp there, AdamW here)".
      Both run TF1 `ApplyRMSProp` now (`emarmstf…`).
- [ ] `:587–597` MNv4: says `B := 64`, names the `mnv4-default-4gpu` job, and says "drop-path … absent
      on this path". The row is `mnv4-full` at `mnv4in256_accdp8x128wxdropdowd01bf16`, 256², with
      the 26-entry ramp.
- [ ] `:615–622` ConvNeXt-T: "batch stays 32 per device … NOT the ConvNeXt paper recipe".
- [ ] `:642 / :655` ConvNeXt-S/B: "NOTHING has been trained", and the `adamdpwxclipdrop` variants.
      Name the `emaaccdp16x…` renders. Probed and smoked, not trained.
- [ ] `:660–668` ViT-Ti: "bs := 128", "SHIM_WORKERS=2", "NOT the DeiT recipe". It is now DeiT at
      4 × 256 = 1024, on the `smx` render.
- [ ] `:673–681` ViT-S: "FOUR-REPLICA ONLY — `adamdp128x4wxclipdrop` is the sole variant",
      `vits-default-g512-4gpu` as the job, "NOTHING has been trained".
- [ ] `:686–687` ViT-B: "per-device 32 (global 128, NOT the DeiT 512) … unmeasured". It runs
      `emaaccdp2x128x4…smx…`, global 1024.

Lakefile, `imagenetRows` docstring (`:2340–2362`):

- [ ] The ETAs are dated "measured 2026-10-05", but several confs were rewritten after that.
- [ ] It says the R50 ETAs are the 3060 box's; the R50 confs quote 4060 Ti numbers.
- [ ] The MNv4 100-epoch sibling is now `mnv4-full-e100-4gpu` / `mnv4-full100-jax-4gpu`, not
      `mnv4-default-4gpu` (the 224 tier, retired 6b5c6fcc).
- [ ] The garbled ConvNeXt clause (item 1).

Lakefile, the `script imagenet` docstring:

- [ ] It says `lake build imagenet` leaves the plan "nothing to warn about". The ConvNeXt-S/B and
      three ViT confs always warn "vit-ema-drop-render not built — layout gate skipped". Either add
      that exe to `target imagenet`, or soften the sentence.

Apps:

- [ ] `MainViTImagenet.lean:20–22, 36–38` (`emadp128x4wxclipdropbf16` at 512).
- [ ] `MainViTSImagenet.lean:30, 39` ("Nothing has been trained", the non-`smx` render name).
- [ ] `MainViTBImagenet.lean:24–57, 65, 100–102` ("GLOBAL 512" as DeiT's batch, "no wall clock
      probed", the non-`smx` name).
- [ ] `jax/MainVitImagenet.lean:107` ("bs512").
- [ ] `MainEfficientNetImagenet.lean:13–16, 33–35` (name `…dropdowxeps0001bf16`, omit `emarmstf`).
- [ ] `EfficientNetRender/Basic.lean:1252`: the banner says "EfficientNet-B0 AdamW train step" on
      the RMSProp render. This is a render-text change, so check `regen_verified_mlir check`
      afterwards.

Confs:

- [ ] `enet-full-jax-4gpu.conf:5,9` (`…dropdowx…`, "biases off decay"; its own ⭐ note contradicts both).
- [ ] `enet-default-4gpu.conf:36–37` ("PRE-SYNC-BN … re-probe owed"; the 10-12 smoke probed it).
- [ ] `r50-a3-wxclip4x128-bf16-4gpu.conf:41` ("2610 = the book's 77.91") and `r50-a3-jax-4gpu.conf:19`
      ("the book's 77.75"). The book is at 78.08 / 77.60, from tag 2611.
- [ ] `vitb-default-g512-4gpu.conf:6` (claims 5e-4; see Parked).

Book:

- [x] ViT patch-embed bias: the §9.6 sentence reads the right way round (0 here, DeiT's default
      U(±1/√768)); S/B start it at the default since 2026-10-20 (R4) and §9.7 says so.
- [ ] RSB, `tab:r50_a2_a1_time` (~`:7330`): the step times are 10-05's. The confs now say 476 ms per
      micro-batch (~99 h) verified and 1,440 ms per step JAX.
- [ ] The TODO at ~`:7362` says "A3's three [repeats] … ran on A3". A3 has no repeated augmentation.
- [ ] Ch. 9 never says its Imagenette ViT-Tiny trained the tanh GELU. Ch. 8 says it for ConvNeXt (`:10802`, `:11632`), but Ch. 9 only names the exact erf form, for the ImageNet recipe (~`:13855`). Add Ch. 8's sentence to the Imagenette ViT section: tanh on both paths (Definition `ax:geluScalar`); the ImageNet pairs compute the exact form (`ax:geluErfScalar`). This is text only. Imagenette stays tanh by the 2026-10-06 decision (`gelu_erf_and_torchvision_crop.md` §5 a), and its renders are unchanged, so nothing is re-rendered or re-run.

Planning (mark done what is done):

- [ ] `imagenet_parity.md` §11 says "uncommitted"; it is 3333bbd5.
- [ ] §10.4 and `recipe_prep.md` §9: the ViT-Ti pair (04c72553) and the MNv4 100-epoch pair
      (6bcdb7f3) landed.
- [ ] §10.4's ViT-S/B paragraph names the erf renders, not `smx` (`imagenet_parity.md:717, 763–774`).
- [ ] `mnv4_timm_parity.md:75` "QUEUED". The pair ran 09-26/27.
- [ ] `vit_parity_todo.md` §3: check P-B / P-D / P-E / P-F / P-I against the code, and mark them.
- [ ] `side_quest_runs.md`: batch-512 ViT ETAs, `vits-default-jax-4gpu` (now `vits-accum-jax-4gpu`),
      the clip renders, ConvNeXt-B "no accumulation render", MNv4 `mnv4in_…` at 224 with
      "1 − 0.075·i/20" (`:29–48, 104, 110–116`).
- [ ] `recipe_prep.md:274–275` still says /25.
- [ ] `global_bn_verified.md` §3.5 names retired MNv2/B0 variants.

## Where things stand — 2026-10-19, end of day

### R34 / R50-2018 against Bag of Tricks (He et al. 2018), row by row

The rows run the recipe's shape exactly — batch 256 at lr 0.1 (the paper's 1024 at 0.4 by its own
linear scaling), 5-epoch linear warmup from 0, cosine to 0, label smoothing 0.1, RandomResizedCrop
(8–100 %, 3/4–4/3) + hflip, resize-256 / centre-224 eval, half precision. These rows differ. Every
one is a training-time change, so "faithful" means a rerun of both halves, not an edit:

| | paper | our R34 | our R50-2018 | where it is in code |
|---|---|---|---|---|
| epochs | 120 | 90 | 90 | `epochs := 90` in both apps and JAX configs |
| optimizer | NAG (Nesterov) momentum 0.9 | heavy-ball 0.9 | heavy-ball 0.9 | `generated_resnet34_imagenet.py:893` `v = μ·v + g; p -= lr·v` |
| weight decay | 1e-4 on conv + FC weights only (no bias decay) | 1e-4 on every param, coupled | 1e-4 on every param | `wdExcludeNormBias` default false; `g + WD·p` on every leaf |
| zero-γ | yes, last BN of every block | **no** (γ = 1 everywhere) | yes | R50 app `zeroGammaInit := true`; R34 app/JAX never set it |
| init | Xavier | He uniform, √(6/fan_in) | He uniform | `init_params` "Xavier/Kaiming uniform" docstring; the bound is Kaiming's |
| colour aug | HSB jitter U[0.6, 1.4] + PCA noise N(0, 0.1) | none | none | shim: crop + flip only |
| BN running decay | 0.9 (MXNet) | **0.99** | 0.9 | `_bn(… momentum=0.99)` in the R34 trainer; R50 `bnMomentum := 0.9` |
| network | ResNet-50-D (the refined rows); plain ResNet-50 for the efficient rows | ResNet-34 — not in the paper | ResNet-B (torchvision v1.5, stride on the 3×3) | — |
| mixup / distillation | in the 79.29 headline | no | no | — |

Nearest paper rows for scale: plain ResNet-50, BS 256, warmup + zero-γ + no-bias-decay, step decay,
120 ep: 76.16 / 92.97 (Table 4). ResNet-50-D + cosine + label smoothing, 120 ep: 78.31 / 94.09
(Table 6). Our R50-2018 at 90 ep cosine + smoothing: 76.76 / 77.09.

**Decided (the user, 2026-10-19 evening): take the three rows that REDUCE drift against the later
chapters** — no-bias-decay (RSB, ConvNeXt and DeiT all skip norm/bias), zero-γ on R34 (R50 has
it), BN decay 0.9 on R34 (R50 and timm are at 0.9) — and disclose the rest (NAG, Xavier, the colour
pack, 120 epochs, ResNet-D), which no later net shares and which would lengthen every diff table.
Built as item 7 below; both pairs rerun, both halves, when the user launches.

### 7. Bag of Tricks, the three drift-reducing rows — ✅ built 2026-10-19 (reruns prepared, not launched)

What moved, both paths, each a training-time change (so the landed R34 and R50-2018 pairs stay
printed with their old rows, and the markers say the reruns are owed):

| row | JAX reference | verified path |
|---|---|---|
| no bias decay | `wdExcludeNormBias := true` on `resnet34ImagenetConfig` and `resnet50ImagenetConfig2018` → `WD_MASK` / `_wd_mask` in the emitted trainers (the SGD branch already masked the coupled L2) | new renders `resnet34in_momdp64wxbf16` / `resnet50in_momdp64wxbf16`: `wx` threaded through `resnet34AdamTrainStepText` (new trailing `wdExclude`, as R50's already had) → `wdNameBy` into `optOne`, `wdzConst`, and `r34AdamVariant` for the entry name; `#guard`s pin the spelling; CI's proofs.yml lists both |
| zero-γ on R34 | new `TrainConfig.zeroGammaInit` (default false); the `.residualBlock` emitter passes it to the block's conv2 BN (the bottleneck's was always on) | `Verified.Spec.idBlk` / `downBlk`: the second BN's γ is init kind 4 (0 under `zeroGammaInit`, 1 without — byte-identical for every driver that does not set it); `MainResnet34Imagenet.lean` sets it. `ParamLayouts.ResNet34Layout` carries the same kind, because `NetsCore` guards the two layouts equal (the first build caught it) |
| BN decay 0.9 on R34 | `bnMomentum := 0.9` | `bnMomentum := 0.9` (host-side EMA, eval-only) |

Confs: `r34-default-bf16-4gpu` → `VARIANT=momdp64wxbf16`, `CKPT_TAG=bot`, prechecks for `%wdz` in
the render and the two host-side flags in the app; `r50-2018-bf16-4gpu` → the same variant and tag;
`r34-default-jax-4gpu` / `r50-2018-jax-4gpu` → fresh `CKPT_BASE` (`…_bot_jax/`), prechecks for
`WD_MASK`, `momentum=0.9` and (R34) the 16 zero-γ inits. Book: ch 5's recipe prose carries the
full recipe and the disclosed non-rows; `tab:r34_paths` and `tab:r50_paths` print the landed
pairs' rows (every parameter decayed; R34 γ = 1, decay 0.99); the R34 marker and a new 2018 marker
after `tab:r50_paths` say both halves rerun.

- [x] Code, renders, confs, book, planning (this item).
- [x] `lake build` the two RenderB modules (writes the two renders), `regen_verified_mlir.sh check`
      clean apart from the two new files; `regen_jax_generated.sh write` moves only the R34 and
      R50-2018 trainers (+ any shim that carries `bnMomentum`), `check` clean after. — 2026-10-19 on
      atlas: two new renders (75 / 109 `%wdz` operands), no committed render moved; of 68 re-emitted
      trainers only `generated_resnet34_imagenet{,_short}.py` (BN 0.9, 16 zero-γ inits, `WD_MASK`)
      and `generated_resnet50_imagenet_2018.py` (`WD_MASK` alone) moved; both checks clean; full
      `lake build` + `TestVariantPredicates` green.
- [ ] `lake build resnet34-imagenet-verified resnet50-imagenet-verified` on the GPU box before launch
      (the prechecks refuse a binary older than the app files). Built on atlas 2026-10-19; the GPU
      box builds its own.
- [ ] Launch, the user's word: `r34-default-jax-4gpu` + `r34-default-bf16-4gpu` (~13 + 21 h),
      `r50-2018-jax-4gpu` + `r50-2018-bf16-4gpu` (~22 + 29 h). Fresh RUNDIRs. Then both pairs' rows
      and numbers in ch 5 move together.

### Every ImageNet row, as of tonight

| row | pair printed (reference / verified) | recipe the row runs | status |
|---|---|---|---|
| R34 | 74.14 / 74.17 | Bag of Tricks (deviations above, less the three rows of item 7) | crop + the three rows: **rerun of both halves prepared, not launched** (items 2, 7) |
| R50-2018 | 76.76 / 77.09 | Bag of Tricks (deviations above, less no-bias-decay) | no-bias-decay: **rerun of both halves prepared, not launched** (item 7) |
| R50-A3 | 77.58 / 78.05 at 235 | RSB-A3 + F6 | both halves rescored at timm's 235 (verified on ares 2026-10-20); book moved with them, marker gone |
| R50-A2 / A1 | — | RSB | side quest, not run; RASampler (F3) still index-level-less |
| MNv2 | 71.84 / 71.69 | TF-slim README, 420 ep | ✅ landed 2026-10-20 (JAX 48.7 h, verified 63.7 h on ares), McNemar p = 0.30; book moved 2026-10-20, marker gone |
| MNv4-Conv-M 100 ep | 77.35 headline | tf-models yaml, 100 ep | landed; D18 timm-protocol rescore open |
| MNv4-Conv-M 500 ep | — | tf-models yaml, 500 ep | not run; the row |
| B0 | 77.15 / 76.88 | TF EfficientNet, every row | pair predates recipe; **rerun of both halves launched 2026-10-19** (the user) |
| ConvNeXt-T | 81.53 / 81.30 | official (EMA, 4096 by k16) since item 1 | pair is the one-shot job; official pair **queued behind MNv2 and B0** |
| ConvNeXt-S / B | — | official | not run; `smx`-style smoke not needed; bf16-vs-fp32 question parked |
| ViT-Ti | 71.61 headline (EMA) | DeiT, 4 × 256 | landed (04c72553); EMA-vs-live headline parked; patch-embed bias stays 0, disclosed (S/B take it, R4; Ti takes it with whatever next reruns the pair — not worth a run on its own, the user 2026-10-20; the two Ti confs refuse the flag until then) |
| ViT-S / B | — | DeiT | not run; patch-embed bias at PyTorch's default on both paths (R4, 2026-10-20); smoke the `smx` renders first; ViT-B EMA-per-step check |

Book and planning, today: markers carry what each pair owes and nothing about the queue
(64fe5437); DAWNBench pinned and the ResNet rows named Bag of Tricks (443bdd7e); bestiary ResNet
entry current; intro rewritten (e26d2d45). Items 1, 2, 3, 4, 5 and 6
(087ff789) done. Still open from the audit: the Parked list below, D18, F3, the manifest + gate build.

## Parked: found by the audit, not yet approved (ask before doing)

**Launch hazards**, cheap to fix:
- `scripts/jobs/run_enet_verified.sh:20` sets `RUNDIR=runs/2026-09-12-enet-verified-350ep`, so a launch
  writes into the finished run's directory. Line 3 also names the retired `emarmsdp64dropdobf16` arm.
- `vit-default-4gpu`, `vits-default-g512-4gpu` and `vitb-default-g512-4gpu` set no
  `LEAN_MLIR_BASE_LR_U`. The drivers now default to 1e-3, so these confs would train at batch 512 with
  twice DeiT's scaled rate. Retire them, or pin 5e-4.
- `cnxs-default-4gpu` and `cnxb-default-4gpu` are CX-4 leftovers (f32, 4 × 32 = 128, clip, no lr or
  epochs set). Nothing references them as rows. Retire them.

**Precheck gaps:**
- The R34, R50-2018 and A3 confs never call `pc_pjrt_so`, so a stale `ffi/libpjrt_ffi.so` would not
  be caught on those three rows; the other eleven rows check it.
- R34 hard-refuses a missing binary in plan mode; the others warn through `pc_exe`.
- A3's PRECHECK stops at the first failure.
- ViT-B misreports a missing `.so` as "predates the allocator options" (conf :204).
- MNv4's `pc_crop … tf-centre` (`precheck.sh:129`) only greps `^    _cs = `, which EfficientNet's
  fallback also matches. None of the four MNv4 confs greps `0.875 * tf.minimum`.
- The ConvNeXt S/B JAX confs don't grep the last drop-path keep (`dpkeys[35]`).
- `jax_job.sh:32`'s `JAX_PY=$BOX_PY` is repo-relative but is used from inside `jax/`. Fine on ares and
  the 3060 box; a third box would break. This one is a suspicion.

**Recipe questions:**
- **ConvNeXt precision.** Upstream `main.py` defaults to `--use_amp False`, and TRAINING.md's commands
  don't pass it, so the official runs look fp32. Every ConvNeXt conf here is bf16, and the book says
  bf16 "carries over unchanged" (`content.tex:11981`). Confirm upstream, then disclose it.
- ~~**ViT patch-embed bias, R4.**~~ ✅ 2026-10-20: built; S/B carry it on both paths, Ti's pair stays
  disclosed (`recipe_prep.md` R4).
- **ViT headline.** It is the EMA shadow, but DeiT's `main.py` scores the live model. The book has
  both numbers; this is a judgement call on which to headline.
- **B0's BN statistic group.** TF's real group size is unread (`utils.TpuBatchNormalization`), so
  read it before claiming the global 256. Also the `bnFirst` running-stat seeding mismatch (B0-3).
- **RSB's BN group.** "512 (Ghost-BN)" vs timm's per-GPU 2048/n_gpu. Unverified.
- **Mixup λ under accumulation** (A2/A1 verified; the ConvNeXt shim) is drawn per micro-batch, not
  per global batch. Disclose it in the book.

**Builds:**
- **The recipe manifest + gate (§10.2 Phase 1) and generated book tables (Phase 5).** Neither exists:
  the only manifest is the MLIR one. This is why the hand-written tables drifted (item 4). It is the
  biggest build left if "paper-accurate" is to be checked rather than asserted.
- Index-level `RASampler` (F3).
- A heavy-ball row in `opt_step_tie` (§9.4).
- The TF-based gates in CI (F9).

**Runs owed.** Each needs the user's go. ETAs are the confs' figures, JAX + verified:

| pair | JAX conf | verified conf | box-hours |
|---|---|---|---|
| ~~MNv2, 420 ep~~ landed 2026-10-20 | `mnv2-full-jax-4gpu` | `mnv2-default-4gpu` | 48.7 + 63.7, measured |
| B0, TF 350 ep | `enet-full-jax-4gpu` | `enet-default-4gpu` | 49 + 67 |
| ConvNeXt-T | `cnx-default-jax-4gpu` | `cnx-default-emabf16-4gpu` | 76 + 109 |
| ConvNeXt-S | `cnxs-default-jax-4gpu` | `cnxs-default-emabf16-4gpu` | 106 + 144 |
| ConvNeXt-B | `cnxb-default-jax-4gpu` | `cnxb-default-emabf16-4gpu` | 151 + 219 |
| ViT-S | `vits-accum-jax-4gpu` | `vits-default-emabf16-4gpu` | ~72 + ~72 |
| ViT-B | `vitb-accum-jax-4gpu` | `vitb-default-emabf16-4gpu` | ~180 + ~188 |
| MNv4 `full`, 500 ep | `mnv4-full-jax-4gpu` | `mnv4-full-4gpu` | 112 + 75 |
| RSB-A2 | `r50-a2accum-jax-4gpu` | `r50-a2-bf16-4gpu` | ~75 + ~99 |
| RSB-A1 | `r50-a1-jax-4gpu` | `r50-a1-bf16-4gpu` | ~150 + ~193 |
| R34, verified only | — | `r34-default-bf16-4gpu` + tag (item 2) | ~21 |

- **ViT-S/B:** smoke the `smx` renders (60d88a93) on a GPU before launch. Their confs' ETAs come
  from the unshifted renders.
- **The ViT-B verified render:** check that its EMA updates once per optimizer step, not per
  micro-step, as the JAX accum trainer does (`generated_vit_b_imagenet_accum.py:1995`).
- **Total:** about 2,300 box-hours, roughly seven weeks on two boxes. Launch the long ones first.
- **D18**, the timm-protocol rescores of the landed MNv4-100 and ConvNeXt-T checkpoints, is still open.
