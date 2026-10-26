# MobileNetV4-Conv-M, the paper tier at 256² cut to 100 epochs, verified half — 77.42 / 93.48 (ares 4× 4060 Ti, 2026-10-25/26)

`mnv4-full-e100-4gpu` (render `accdp8x128wxdropdowd01bf16`, 4 × 128 accumulated ×8 to 4096, bf16 train /
f32 eval, `CKPT_TAG=e100dp26`, Arm B; 8 loader respawns) after 3333bbd5, smoked in
`../2026-10-24-mnv4-e100dp26-verified-smoke/`. Run after the JAX half by
`../2026-10-24-mnv4-full100-jax/queue.sh`: 13:55 → 07:32 UTC, 17.6 h (~10.6 min an epoch), one attempt,
no restarts. Per-epoch top-1 bitmaps in `bitmaps/` (gitignored).

| epoch | 30 | 60 | 90 | 100 |
|---|---|---|---|---|
| verified top-1 / top-5 | 59.23 / 82.13 | 70.55 / 89.93 | 76.90 / 93.23 | **77.42 / 93.48** |
| JAX (same recipe) | 60.97 / 83.86 | 69.08 / 89.00 | 77.25 / 93.34 | 77.74 / 93.50 |

e100: 38,708 / 50,000, 95 % CI 77.05–77.78; JAX 38,870 (−0.32 to verified). The 10-14 pair before
3333bbd5 read 77.39 JAX / 77.35 verified (`../2026-10-14-mnv4-full-e100/`): +0.35 JAX, +0.07 verified.
`rescore.sh` (10-26) scored the JAX e100 state through `eval_full50k.py` at EVAL_DTYPE=f32 on one card
beside the running 500-epoch job (38,870 / 46,750, the in-training count exactly) and paired it with the
verified half's in-training e100 bitmap (`mcnemar.txt`):

| pair | both right | both wrong | only A | only B | net | exact p |
|---|---|---|---|---|---|---|
| **JAX f32 vs verified, this pair** | 36,637 | 9,059 | 2,233 | 2,071 | +162 JAX | **0.014** |
| JAX f32 vs verified, the 10-14 pair | 36,521 | 9,154 | 2,170 | 2,155 | +15 JAX | 0.83 |
| verified 10-14 vs verified 10-24 | 36,573 | 9,189 | 2,103 | 2,135 | +32 10-24 | 0.63 |
| JAX 10-14 vs JAX 10-24 | 36,656 | 9,095 | 2,035 | 2,214 | +179 10-24 | 0.006 |

This pair separates: JAX is ahead by 0.32 on the 50k. The cause is the JAX checkpoint moving (+0.36 on
the 10-14 JAX, p = 0.006), not the verified one (+0.06, p = 0.63). Both runs picked up 3333bbd5 (the
verified banner's keeps are tf-models' 26-entry ramp; the shim has the centre-crop fallback). These are
statements about checkpoints, one seed per arm: a run-to-run move of this size is within what a second
seed can do, so it does not by itself say the recipe change helps one path and not the other.
