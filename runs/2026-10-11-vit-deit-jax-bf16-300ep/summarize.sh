#!/usr/bin/env bash
# Archive helper for the ViT-Ti (DeiT-Ti) JAX reference, `default` recipe as DeiT runs it (batch 1024, lr 1e-3, timm per-epoch schedule, no clip, constant EMA), bf16, 300 epochs (3060 box).
# Rebuilds every number RESULTS.md quotes from the logs. Read-only on the run; safe to re-run.
# The trainer scores the EMA shadow on all 50,000 every FIFTH epoch (`val skipped` otherwise);
# train loss is logged every epoch. Checkpoints live OUTSIDE the repo, in /home/skoonce/vit_tiny_jax_2611/.
set -u
cd /home/skoonce/lean/proof_verify_demo/verify-v2 || exit 1
R=runs/2026-10-11-vit-deit-jax-bf16-300ep
CSV=${OUT:-$R}/vit_jax_curve.csv
# `[Epoch N] lr=… loss(train_avg)=… val_top1=C/50000 (0.xxxx) val_top5=0.xxxx …` on scored epochs,
# `[Epoch N] lr=… loss(train_avg)=…  [… val skipped]` on the rest — LAST line per epoch wins
awk '/^\[Epoch [0-9]+\] lr=/ {
       e=$2; sub(/\]/,"",e); e+=0; l=$4; sub(/loss\(train_avg\)=/,"",l); lr=$3; sub(/lr=/,"",lr)
       loss[e]=l; lrs[e]=lr; if (e>mx) mx=e
       if (match($0,/val_top1=[0-9]+/)) { c=substr($0,RSTART+9,RLENGTH-9); match($0,/val_top5=[0-9.]+/)
         t5=substr($0,RSTART+9,RLENGTH-9); top1[e]=sprintf("%.3f",c/500); top5[e]=sprintf("%.3f",t5*100) } }
     END { print "epoch,lr,train_loss,top1,top5"
           for (e=1;e<=mx;e++) if (e in loss) printf "%d,%s,%s,%s,%s\n", e, lrs[e], loss[e], top1[e], top5[e] }' "$R/full.log" > "$CSV"
echo "curve -> $CSV ($(($(wc -l < "$CSV")-1)) epochs, $(awk -F, 'NR>1 && $4!=""' "$CSV" | wc -l) scored)"
echo "--- final"; tail -1 "$CSV" | awk -F, '{printf "e%s top1 %s top5 %s (EMA; train loss %s)\n",$1,$4,$5,$3}'
echo "--- tail, scored epochs 276-300 (e280, 285, …, 300)"
awk -F, 'NR>1 && $1>=276 && $4!="" {a+=$4; b+=$5; n++; if(!mn||$4<mn)mn=$4; if($4>mx)mx=$4} END{printf "mean %.3f / %.3f over %d   top-1 range %.3f..%.3f\n", a/n, b/n, n, mn, mx}' "$CSV"
echo "--- launches"; echo "trainer launches: $(grep -c 'launched PID=' "$R/master.log")   thermal: $(grep -c '🌡' "$R/master.log")"
grep -E 'COMPLETE' "$R/master.log"; grep -aoE 'Total time: [0-9.]+s' "$R/full.log" | tail -1 | awk '{sub(/s$/,"",$3); printf "trainer total %.0f s = %.2f h\n", $3, $3/3600}'
echo "--- pace"
grep -aoE '\[[0-9.]+s train' "$R/full.log" | tr -d '[s' | awk '{n++; s+=$1; if(!mn||$1<mn)mn=$1; if($1>mx)mx=$1} END{printf "train %.1f s/epoch mean over %d (min %.1f, max %.1f)\n", s/n, n, mn, mx}'
grep -aoE '\(([0-9.]+)ms/step avg\)' "$R/full.log" | tail -1 | sed 's/^/last running mean /'
tail -n +2 "$R/epoch_clock.tsv" | awk -F'\t' 'NR>1{d=$2-p; n++; s+=d; if(!mn||d<mn)mn=d; if(d>mx)mx=d} {p=$2}
  END{printf "%d epoch-clock gaps, mean %.0f s, min %d, max %d (eval every 5th epoch included)\n", n, s/n, mn, mx}'
echo "--- EDAC"; tail -n +2 "$R/edac.tsv" | awk -F'\t' '{ce+=$4; ue+=$5} END{printf "rows %d, corrected %d, uncorrectable %d\n", NR, ce, ue}'
echo "--- ⭐ against the 10-01 JAX run (batch 512, ramped EMA; runs/2026-10-01-vit-jax-bf16-300ep/vit_jax_curve.csv, read in place), scored epochs"
awk -F, 'FILENAME==ARGV[1] && FNR>1 && $4!="" {n[$1+0]=$4; nl[$1+0]=$3; next}
         FNR>1 && $4!="" && (($1+0) in n) {e=$1+0; if (e==25||e==50||e==100||e==150||e==200||e==250||e==300)
           printf "e%-3d top1 new %.3f  old %.3f  Δ %+.2f   train loss new %s old %s\n", e, n[e], $4, n[e]-$4, nl[e], $3
           if (e>=276) {a+=n[e]; b+=$4; k++} }
         END{if(k) printf "e276-300 scored mean: new %.3f  old %.3f  Δ %+.3f (n=%d)\n", a/k, b/k, (a-b)/k, k}' "$CSV" runs/2026-10-01-vit-jax-bf16-300ep/vit_jax_curve.csv
