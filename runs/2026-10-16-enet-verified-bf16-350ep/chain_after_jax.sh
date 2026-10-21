#!/usr/bin/env bash
# ▶ 2026-10-16 EfficientNet-B0 TF-recipe pair copy of runs/2026-10-11-vit-deit-verified-bf16-300ep/chain_after_jax.sh: RUNDIRs, units enet-tf-jax / enet-tf-ver / enetv-* and the job enet-default-4gpu retargeted. Brett, 2026-10-16: "i'll have you do efficient net next, same idea".
# ▶ 2026-10-11 DeiT-recipe rerun copy of runs/2026-10-01-vit-verified-bf16-300ep/chain_after_jax.sh: RUNDIR, the emadp256x4wxdropeps0000001erfbf16 checkpoint, units enet-tf-ver / enetv-* / enet-tf-jax and 1251 steps an epoch retargeted. Brett, 2026-10-11: "and then after that i'd have you do enet-default-4gpu basically".
# ▶ ViT-Ti 300ep copy (2026-10-01) of the MNv2 run, itself a copy of the MNv4 chain; Brett, 2026-09-27: "great work start the run" (2026-10-01).
# Launch the EfficientNet-B0 verified 350-ep run once the EfficientNet-B0 JAX 350-ep run (unit enet-tf-jax) has ended with ✅ COMPLETE and the GPUs are idle. Launches
# NOTHING if the JAX run ended any other way — it writes CHAIN_EVENT and exits.
cd /home/skoonce/lean/proof_verify_demo/verify-v2 || exit 1
RD=runs/2026-10-16-enet-verified-bf16-350ep
JRD=runs/2026-10-16-enet-full-jax-bf16-350ep
while systemctl --user is-active -q enet-tf-jax; do sleep 60; done
if ! grep -q '✅ COMPLETE' "$JRD/master.log"; then
  { echo "⛔ NOT LAUNCHED $(date -u '+%F %T') UTC — enet-tf-jax ended without ✅ COMPLETE:"; tail -5 "$JRD/master.log"; } > "$RD/CHAIN_EVENT"; exit 0; fi
sleep 30; for i in $(seq 1 60); do nvidia-smi --query-compute-apps=pid --format=csv,noheader | grep -q . || break; sleep 10; done
if nvidia-smi --query-compute-apps=pid --format=csv,noheader | grep -q .; then
  { echo "⛔ NOT LAUNCHED $(date -u '+%F %T') UTC — GPUs still busy 10 min after enet-tf-jax ended:"; nvidia-smi --query-compute-apps=pid,used_memory --format=csv,noheader; } > "$RD/CHAIN_EVENT"; exit 0; fi
echo "▶ launching $(date -u '+%F %T') UTC" > "$RD/CHAIN_EVENT"
systemd-run --user --unit=enetv-log-ts --working-directory="$PWD" bash $RD/log_ts.sh
# ⛔ --setenv=PATH: the conf's precheck runs `lake build` (pc_exe); the MNv4 chain lacked it.
systemd-run --user --unit=enet-tf-ver --working-directory="$PWD" --setenv=PATH="$PATH" \
  --setenv=RUNDIR=$RD \
  scripts/supervise.sh enet-default-4gpu
sleep 10
systemctl --user is-active -q enet-tf-ver || { echo "⛔ enet-tf-ver not active 10 s after launch" >> "$RD/CHAIN_EVENT"; exit 0; }
for w in epoch_clock loader_rss fault_watch edac_watch; do
  systemd-run --user --unit=enetv-${w//_/-} --working-directory="$PWD" bash $RD/$w.sh; done
echo "✅ launched enet-tf-ver + 5 watchers" >> "$RD/CHAIN_EVENT"
