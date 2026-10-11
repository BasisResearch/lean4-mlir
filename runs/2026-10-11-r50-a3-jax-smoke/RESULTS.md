# JAX RSB-A3 smoke, the timm-recipe emit (2026-10-11)

`run.sh`: the re-emitted `generated_resnet50_imagenet_rsbfaithful.py` with `steps_per_epoch = 40`
(`trainer_a3smoke.patch`; 10 optimizer steps an epoch under `GRAD_ACCUM = 4`), on 4× 4060 Ti, killed
after epoch 7 (`smoke.log`). What it had to show, and showed:

    eval: f32 forward (evalF32)
    [Epoch 1] lr=0.0001   loss(train_avg)=0.7058 val_top1=38/50000 ...  [69.4s train, 31.0s val]
    eval: f32 forward (evalF32)
    [Epoch 2] lr=0.00168  loss(train_avg)=0.3447 val_top1=47/50000 ...  [29.6s train, 17.3s val]
    eval: f32 forward (evalF32)
    [Epoch 3] lr=0.00326  ...

* The rate is timm's `CosineLRScheduler` stepped once an epoch: 1e-4 at epoch 1 (`warmup_lr`),
  1e-4 + (8e-3 − 1e-4)/5 = 1.68e-3 at epoch 2, 3.26e-3 at epoch 3 — under accumulation, which the ViT
  smokes never exercised (`scripts/gates/sched_timm_gate.py --trainer …rsbfaithful.py`: 1.08e-16
  against timm 1.0.28 over the 100 epochs).
* `eval: f32 forward (evalF32)` before every validation and the trace-order assertion silent: the
  ImageNet validation loop scores through f32 on this trainer too (R50 validates every epoch, so it
  is the loop's second branch).
* The validation pass costs ~17 s an epoch at f32 on 4 cards (31 s on the first, with the trace).
* Not a training result: 40 micro-batches an epoch.

The recipe values are rwightman's own A3 args files (pytorch-image-models discussion #924, the two
`…-fusedlamb-cosine-lr0.00800-…-args.yaml.txt` attachments): `warmup_lr 0.0001`, `min_lr 1e-06`,
`mixup_switch_prob 0.5` with `mixup_mode batch`, `aa rand-m6-mstd0.5-inc1`, `crop_pct 0.95`, no clip,
no EMA, `cooldown_epochs 10` (not taken: the paper counts 100, and 1e-6 moves nothing).
