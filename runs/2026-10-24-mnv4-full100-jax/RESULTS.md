# MobileNetV4-Conv-M, the paper tier at 256² cut to 100 epochs, JAX reference half — 77.74 / 93.50 (ares 4× 4060 Ti, 2026-10-24/25)

`mnv4-full100-jax-4gpu` after 3333bbd5 (tf-models' 26-entry drop-path ramp, the centre-crop fallback),
fresh lineage `~/mnv4_full100_dp26_2624/`. Queued JAX then verified by `queue.sh` (unit
`mnv4-e100-queue`): 15:27 → 13:55 UTC, 22.5 h (~806 s train + 13 s val an epoch), one attempt, no
restarts. e100: 38,870 / 50,000 = **77.74 / 93.50**, val loss 0.960. The 10-14 run before 3333bbd5 read
77.39 / 93.46 (`../2026-10-14-mnv4-full100-jax/`). The pair and the epoch table:
`../2026-10-24-mnv4-full100-verified/RESULTS.md`. Not the paper's 79.9 % (500 epochs).
