#!/usr/bin/env bash
# Archive helper for the EfficientNet-B0 VERIFIED TF-recipe run, `emarmstfdp64dropdowneps0001bf16`, 350 epochs (3060 box)
# ▶ 2026-10-21 copy of runs/2026-10-14-vit-deit-verified-smx-bf16-300ep/summarize.sh, retargeted to this run and its JAX half (runs/2026-10-16-enet-full-jax-bf16-350ep/).
# — and the PAIR with its JAX reference, read IN PLACE from runs/2026-10-16-enet-full-jax-bf16-350ep/
# (run that directory's summarize.sh first; nothing is copied here). Both score the EMA shadow on all
# 50,000 EVERY epoch, so the pair is compared on every epoch.
set -u
cd /home/skoonce/lean/proof_verify_demo/verify-v2 || exit 1
R=runs/2026-10-16-enet-verified-bf16-350ep
CSV=${OUT:-$R}/enet_verified_curve.csv
JCSV=${JOUT:-runs/2026-10-16-enet-full-jax-bf16-350ep}/enet_jax_curve.csv
[ -s "$JCSV" ] || { echo "⛔ $JCSV missing — run the JAX run's summarize.sh first"; exit 1; }
awk '/^Epoch [0-9]+\/350: loss=/ { split($2,a,"/"); e=a[1]+0; l=$3; sub(/loss=/,"",l); loss[e]=l }
     /^  epoch [0-9]+: test_acc = / { e=$2; sub(/:/,"",e); c=0
       for (i=1;i<=NF;i++) if ($i ~ /^[0-9.]+%$/) { c++; v=$i; gsub(/%/,"",v); if (c==1) t1=v; else if (c==2) t5=v }
       if (c>=2) { top1[e+0]=t1; top5[e+0]=t5; if (e+0>mx) mx=e+0 } }
     END { print "epoch,train_loss,top1,top5"; for (e=1;e<=mx;e++) if (e in top1) printf "%d,%s,%s,%s\n", e, loss[e], top1[e], top5[e] }' "$R/full.log" > "$CSV"
echo "curve -> $CSV ($(($(wc -l < "$CSV")-1)) scored epochs)"
echo "--- final"; grep -aE '^  epoch 350: ' "$R/full.log" | tail -1
echo "--- best"; awk -F, 'NR>1 && $3>b {b=$3; e=$1} END{printf "best top1 %.3f at e%d\n", b, e}' "$CSV"
echo "--- tail e326-350, every epoch"
awk -F, 'NR>1 && $1>=326 {a+=$3; b+=$4; n++; if(!mn||$3<mn)mn=$3; if($3>mx)mx=$3} END{printf "mean %.3f / %.3f over %d   top-1 range %.3f..%.3f\n", a/n, b/n, n, mn, mx}' "$CSV"
echo "--- ⭐ the pair, 50-epoch windows (verified − JAX), every epoch"
awk -F, 'FILENAME==ARGV[1] && FNR>1 {jl[$1]=$3; j1[$1]=$4; j5[$1]=$5; next}
  FNR>1 && ($1 in j1) { w=int(($1-1)/50); if (w>mw) mw=w
          a[w]+=$3-j1[$1]; b[w]+=$4-j5[$1]; c[w]+=$2-jl[$1]; v[w]+=$3; j[w]+=j1[$1]; n[w]++
          if ($1>=326) { ta+=$3-j1[$1]; tb+=$4-j5[$1]; tc+=$2-jl[$1]; tn++ }
          if ($3>j1[$1]) up++; else if ($3<j1[$1]) dn++ }
  END { for (w=0; w<=mw; w++) printf "e%3d-%3d  verified %6.2f  JAX %6.2f   Δtop1 %+5.2f  Δtop5 %+5.2f  (n=%d)   Δtrain-loss %+.4f\n", w*50+1, w*50+50, v[w]/n[w], j[w]/n[w], a[w]/n[w], b[w]/n[w], n[w], c[w]/n[w]
        printf "e326-350  Δtop1 %+.3f  Δtop5 %+.3f  Δtrain-loss %+.4f (n=%d)\n", ta/tn, tb/tn, tc/tn, tn
        printf "epochs verified ahead on top-1: %d, behind: %d\n", up, dn }' "$JCSV" "$CSV"
echo "--- endpoint"; awk -F, 'FILENAME==ARGV[1] && FNR>1 {j1[$1]=$4; j5[$1]=$5; next} FNR>1 && $1==350 {printf "e350 verified %s / %s   JAX %s / %s   Δ %+.3f / %+.3f\n", $3, $4, j1[350], j5[350], $3-j1[350], $4-j5[350]}' "$JCSV" "$CSV"
echo "--- launches / restarts"
echo "supervisor starts: $(grep -c ' START job=' "$R/master.log")   trainer launches: $(grep -c 'launched PID=' "$R/master.log")   planned rests: $(grep -c '💤' "$R/master.log")   thermal: $(grep -c '🌡' "$R/master.log")"
grep -aE 'resuming from checkpoint at epoch' "$R/full.log" | sed 's/^ *//' | tr '\n' ';'; echo
echo "ema_bn restored on resume: $(grep -ac 'resumed BN running stats + ema_bn' "$R/full.log")"
grep -E 'COMPLETE' "$R/master.log"
s=$(grep -oE '^\[sup\] [0-9-]+ [0-9:]+ START' "$R/master.log" | head -1 | awk '{print $2" "$3}')
f=$(grep -oE '^\[sup\] [0-9-]+ [0-9:]+ ✅ COMPLETE' "$R/master.log" | tail -1 | awk '{print $2" "$3}')
awk -v a="$(date -u -d "$s" +%s)" -v b="$(date -u -d "$f" +%s)" 'BEGIN{printf "wall %s → %s = %.2f h\n", "'"$s"'", "'"$f"'", (b-a)/3600}'
echo "--- pace (epoch-clock gaps, eval of all 50,000 included)"
tail -n +2 "$R/epoch_clock.tsv" | awk -F'\t' 'NR>1{d=$2-p; n++; s+=d; if(!mn||d<mn)mn=d; if(d>mx)mx=d; if(d>740) printf "  slow e%d %d s\n", $1, d} {p=$2} END{printf "%d gaps, mean %.0f s, min %d, max %d\n", n, s/n, mn, mx}'
echo "--- loaders: any producer whose arena-class memory passed 6 GiB"
awk -F'\t' 'NR>1 && $6>6 {last[$3]=$2" "$4" "$6} END{for(k in last){split(last[k],a," "); printf "  pid %s last seen e%s, age %.1f h, arena %s GiB\n", k, a[1], a[2]/3600, a[3]}}' "$R/loader_rss.tsv"
awk -F'\t' 'NR>1 && $6>mx {mx=$6; e=$2} END{printf "  peak arena-class %s GiB (e%s)\n", mx, e}' "$R/loader_rss.tsv"
grep -aoE 'shim respawn: producer [0-9] of 4 replaced after epoch [0-9]+' "$R/full.log" | wc -l | awk '{print "  producer respawns: "$1}'
echo "--- EDAC"; tail -n +2 "$R/edac.tsv" | awk -F'\t' '{ce+=$4; ue+=$5} END{printf "rows %d, corrected %d, uncorrectable %d\n", NR, ce, ue}'
echo "--- bitmaps (LOCAL ONLY): $(ls "$R"/bitmaps/enet_*_e*.bin 2>/dev/null | wc -l) scored epochs"
