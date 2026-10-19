#!/usr/bin/env bash
# Verified-path VJP oracle. For each of the three MNIST artifacts the proofs tie
# (verified_mlir/{linear,mlp,cnn}_train_step.mlir), run ONE SGD step through the book's own
# verified trainer (the committed text, the graph LinearFoldB / MlpFoldB / CnnFoldB certify), dump
# the init and the stepped parameters; run ONE step of the same net in JAX (autodiff) from that
# init on the same batch; diff the two updates tensor for tensor (diff_params.py).
#
# This is the oracle run.sh is not: run.sh's Lean side lowers its nets at run time through the
# reference MlirCodegen (unverified); here the Lean side IS the proven text.
#
# Usage: tests/vjp_oracle/run_verified.sh [linear mlp cnn]
# Env: VJP_ORACLE_DATA (data root with mnist/ under it; default data), LEAN_MLIR_LOWERER /
#      IREE_BACKEND / IREE_DEVICE for the verified side (the trainers' usual knobs), JAX_PLATFORMS.
set -u
cd "$(dirname "$0")/../.."  # → repo root
DATA=$(realpath "${VJP_ORACLE_DATA:-data}")
PY=${PYTHON:-.venv/bin/python3}

if command -v nvidia-smi >/dev/null 2>&1 || [ -e /dev/nvidia0 ]; then
  [ -z "${CUDA_VISIBLE_DEVICES:-}" ] && export CUDA_VISIBLE_DEVICES=0
fi

if [ "$#" -gt 0 ]; then NETS=("$@"); else NETS=(linear mlp cnn); fi
FAIL=0

for net in "${NETS[@]}"; do
  init_bin=/tmp/vov_init_${net}.bin
  lean_bin=/tmp/vov_lean_${net}.bin
  jax_base=/tmp/vov_jax_${net}
  lean_log=/tmp/vov_lean_${net}.log
  jax_log=/tmp/vov_jax_${net}.log
  rm -f "$init_bin" "$lean_bin" "${jax_base}.bin"

  # Verified side: the committed artifact through the book's trainer, one step, init + result dumped.
  LEAN_MLIR_INIT_DUMP="$init_bin" LEAN_MLIR_DUMP_PARAMS="$lean_bin" \
  LEAN_MLIR_MAX_EPOCHS=1 LEAN_MLIR_MAX_STEPS=1 \
    ./.lake/build/bin/mnist-${net}-verified "$DATA" > "$lean_log" 2>&1 \
    || { echo "FAIL  ${net}  verified side crashed (see $lean_log)"; FAIL=1; continue; }
  [ -f "$init_bin" ] && [ -f "$lean_bin" ] \
    || { echo "FAIL  ${net}  verified side wrote no init/params dump (see $lean_log)"; FAIL=1; continue; }

  # JAX side: emit the script, then run it ourselves from the dumped init, one step, params out.
  ( cd jax && ./.lake/build/bin/verified-oracle-${net} "$DATA" > /dev/null 2>&1 ) || true
  script=jax/.lake/build/generated_verified_oracle_${net}.py
  [ -f "$script" ] || { echo "FAIL  ${net}  JAX side did not emit $script"; FAIL=1; continue; }
  LEAN_MLIR_INIT_LOAD="$init_bin" LEAN_MLIR_NO_SHUFFLE=1 LEAN_MLIR_MAX_STEPS=1 \
  LEAN_MLIR_PARAMS_OUT="$jax_base" \
    $PY "$script" > "$jax_log" 2>&1 \
    || { echo "FAIL  ${net}  JAX side crashed (see $jax_log)"; FAIL=1; continue; }
  [ -f "${jax_base}.bin" ] || { echo "FAIL  ${net}  JAX side wrote no params (see $jax_log)"; FAIL=1; continue; }

  # One f32 step; the two lowerers' GEMM/conv reduction orders differ at ~1e-6 relative. Measured
  # 2026-10-19 (CI): linear 1.25e-6, mlp 1.24e-6, cnn 7.41e-6 worst relative — the conv net's
  # a-priori 1e-3 (for the max-pool's argmax tie-breaks on zero pixels) is tightened to 1e-4.
  tol=1e-4
  $PY tests/vjp_oracle/diff_params.py "$init_bin" "$lean_bin" "${jax_base}.bin" "$net" "$tol" || FAIL=1
done

exit $FAIL
