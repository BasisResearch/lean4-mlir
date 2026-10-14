#!/bin/bash
# deploy/mac_setup.sh — from a fresh clone on an Apple Silicon Mac to `lake run mnist` on the GPU,
# one rung at a time. deploy/MAC.md is the runbook; this is its commands.
#
#   bash deploy/mac_setup.sh            # every stage, in order
#   bash deploy/mac_setup.sh smoke      # start at a stage (check venv jax smoke data lean mnist)
#   bash deploy/mac_setup.sh smoke data # only the stages named
#
# Each stage proves one layer before the next one leans on it, and stops at the first failure
# with the layer named, so the log says where it broke:
#   check  the box: arm64, macOS 26+, Xcode command-line tools, Python 3.12+, elan, disk
#   venv   .venv with jax-graft (JAX's Metal PJRT plugin, platform "mtl") and its compiled
#          plugin package, metal-pjrt-core
#   jax    JAX itself computes on the "mtl" device — the plugin works before any of our code
#   smoke  ffi/libpjrt_ffi.so (our PJRT shim) and ffi/test_pjrt_smoke.c: load the plugin, create
#          a Metal client, run verified_mlir/linear_fwd.mlir against the host's answer, compile
#          the other five MNIST renders — the shim works before any Lean
#   data   MNIST into data/mnist/
#   lean   the toolchain (elan installs it from lean-toolchain), Mathlib's prebuilt cache, and
#          the three MNIST trainers
#   mnist  `lake run mnist`: linear, MLP and CNN on the GPU
#
# Everything is teed to runs/<date>-mac-setup/setup.log, with the box's facts in
# runs/<date>-mac-setup/manifest.txt. When a stage fails, that log is what to send back.
#
# Written for macOS's /bin/bash 3.2 (no associative arrays, no ${x,,}, no mapfile).
set -euo pipefail
cd "$(dirname "$0")/.."

# Under Rosetta (a Terminal set to "Open using Rosetta", or an Intel bash first on PATH) an
# Apple Silicon Mac reports x86_64, and everything this script starts would be Intel too. The
# plugin is arm64-only, so re-run natively; /bin/bash is a universal binary.
if [ "$(uname -s)" = Darwin ] && [ "$(sysctl -n sysctl.proc_translated 2>/dev/null)" = 1 ]; then
  if [ "$(sysctl -n hw.optional.arm64 2>/dev/null)" = 1 ]; then
    echo "mac_setup: this shell runs under Rosetta (x86_64); re-running natively as arm64"
    exec arch -arm64 /bin/bash "$0" "$@"
  fi
fi

ALL="check venv jax smoke data lean mnist"
JAX_GRAFT_SPEC=${JAX_GRAFT_SPEC:-jax-graft==0.0.5}   # the release this runbook was written against

if [ $# -eq 0 ]; then STAGES=$ALL
elif [ $# -eq 1 ]; then
  case " $ALL " in *" $1 "*) ;; *) echo "unknown stage '$1' (one of: $ALL)" >&2; exit 2 ;; esac
  STAGES=${ALL#*"$1"}; STAGES="$1$STAGES"          # from that stage to the end
else STAGES="$*"
fi

STAGE=${STAGES%% *}   # the stage running, for die's resume line
LOGDIR=runs/$(date +%F)-mac-setup
mkdir -p "$LOGDIR"
LOG=$LOGDIR/setup.log
exec > >(tee -a "$LOG") 2>&1
echo "════ mac_setup $(date '+%F %T') — stages: $STAGES"

say ()  { printf '\n━━━ %s\n' "$*"; }
ok ()   { printf '  ✓ %s\n' "$*"; }
die ()  { printf '\n  ✗ %s\n\n  The log is %s. Fix the above, then resume with:\n    bash deploy/mac_setup.sh %s\n' "$1" "$LOG" "$STAGE" >&2; exit 1; }
want () { case " $STAGES " in *" $1 "*) STAGE=$1; return 0 ;; *) return 1 ;; esac; }

# The newest native (arm64) python >= 3.12 on PATH (jax-graft's floor), or "" if there is none.
# An Intel python (an old /usr/local Homebrew) runs under Rosetta even from a native shell, and
# pip would then look for an x86_64 wheel of the plugin, which does not exist.
find_python () {
  for p in python3.14 python3.13 python3.12 python3; do
    command -v "$p" > /dev/null 2>&1 || continue
    if "$p" -c 'import platform, sys; sys.exit(0 if sys.version_info >= (3, 12) and platform.machine() == "arm64" else 1)' 2> /dev/null; then
      command -v "$p"; return 0
    fi
  done
  return 0
}

# ─── check ───────────────────────────────────────────────────────────────────
if want check; then
  say "check: the box"
  [ "$(uname -s)" = Darwin ] || die "not macOS ($(uname -s)) — this script is for a Mac"
  [ "$(uname -m)" = arm64 ] || die "not Apple Silicon ($(uname -m), and not Rosetta on an M-series Mac, which re-runs natively) — jax-graft needs an M-series Mac"
  ok "Apple Silicon: $(sysctl -n machdep.cpu.brand_string), $(( $(sysctl -n hw.memsize) / 1073741824 )) GB"
  macos=$(sw_vers -productVersion)
  [ "${macos%%.*}" -ge 26 ] || die "macOS $macos — jax-graft needs macOS 26 or later (System Settings → General → Software Update)"
  ok "macOS $macos"
  xcode-select -p > /dev/null 2>&1 || die "no Xcode command-line tools — run: xcode-select --install"
  command -v cc > /dev/null || die "no C compiler on PATH, though xcode-select -p is set — reinstall the command-line tools"
  ok "C compiler: $(cc --version | head -1)"
  PY=$(find_python)
  if [ -n "$PY" ]; then ok "python: $PY ($("$PY" -V 2>&1), arm64)"
  elif command -v uv > /dev/null 2>&1; then ok "no python >= 3.12 on PATH; uv is, and the venv stage will use it"
  else die "no native (arm64) python >= 3.12 on PATH, and no uv. An Intel python (e.g. an old Homebrew in /usr/local) does not count: the plugin has no x86_64 wheel. Install one: brew install python@3.13 with Homebrew in /opt/homebrew (or https://docs.astral.sh/uv/)"
  fi
  if ! command -v lake > /dev/null 2>&1 && [ ! -x "$HOME/.elan/bin/lake" ]; then
    die "no elan/lake — install it with:
    curl https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh -sSf | sh -s -- -y --default-toolchain none
  then open a new terminal (or: source ~/.elan/env)"
  fi
  elan_bin=$(command -v elan || echo "$HOME/.elan/bin/elan")
  case "$(lipo -archs "$elan_bin" 2>/dev/null)" in
    *arm64*) ;;
    "") ;;   # lipo could not read it: let the lean stage find out
    *) die "elan at $elan_bin is an Intel binary ($(lipo -archs "$elan_bin")), so it would install an Intel Lean whose trainers cannot load the arm64 plugin. Reinstall it from a native shell: rm -rf ~/.elan, then the elan-init.sh line above" ;;
  esac
  ok "elan: $elan_bin"
  free_gb=$(df -g . | awk 'NR==2 {print $4}')
  [ "$free_gb" -ge 15 ] || die "only ${free_gb} GB free here — Mathlib's cache and the build want ~15 GB"
  ok "disk: ${free_gb} GB free"
fi

# ─── venv ────────────────────────────────────────────────────────────────────
if want venv; then
  say "venv: .venv with $JAX_GRAFT_SPEC"
  if [ ! -x .venv/bin/python3 ]; then
    PY=$(find_python)
    if [ -n "$PY" ]; then "$PY" -m venv .venv || die "python -m venv failed"
    else uv venv --python 3.13 .venv || die "uv venv failed"
    fi
    ok "created .venv ($(.venv/bin/python3 -V))"
  else
    [ "$(.venv/bin/python3 -c 'import platform; print(platform.machine())')" = arm64 ] \
      || die ".venv's python is not arm64 (made under Rosetta?) — remove it (rm -rf .venv) and rerun this stage"
    ok "reusing .venv ($(.venv/bin/python3 -V))"
  fi
  if [ -x .venv/bin/pip ]; then
    .venv/bin/pip install -q -U pip
    .venv/bin/pip install -q "$JAX_GRAFT_SPEC" || die "pip install $JAX_GRAFT_SPEC failed"
  else
    uv pip install -q --python .venv/bin/python3 "$JAX_GRAFT_SPEC" || die "uv pip install $JAX_GRAFT_SPEC failed"
  fi
  vers=$(.venv/bin/python3 - << 'EOF'
import importlib.metadata as m
def v(p):
    try: return m.version(p)
    except m.PackageNotFoundError: return "MISSING"
print(", ".join(f"{p} {v(p)}" for p in ("jax", "jaxlib", "jax-graft", "metal-pjrt-core")))
EOF
)
  echo "  installed: $vers"
  case "$vers" in *MISSING*) die "a package is missing — metal-pjrt-core installs only on macOS arm64 (pip skips it elsewhere)" ;; esac
  ls .venv/lib/python3.*/site-packages/metal_pjrt_core/pjrt_c_api_mtl_plugin.dylib > /dev/null 2>&1 \
    || die "metal-pjrt-core installed, but its pjrt_c_api_mtl_plugin.dylib is not where scripts/platform/env.sh looks"
  ok "plugin: $(ls .venv/lib/python3.*/site-packages/metal_pjrt_core/pjrt_c_api_mtl_plugin.dylib)"
fi

# The platform profile: the plugin path and the Metal client options the shim reads.
. scripts/platform/env.sh
[ "$PLATFORM_BACKEND" = metal ] || die "scripts/platform/env.sh resolved backend '$PLATFORM_BACKEND', not metal"

# ─── jax ─────────────────────────────────────────────────────────────────────
if want jax; then
  say "jax: JAX computes on the mtl device"
  # JAX_PLATFORMS=mtl makes a plugin that fails to start an error rather than a quiet CPU fallback.
  JAX_PLATFORMS=mtl .venv/bin/python3 - << 'EOF' || die "JAX could not compute on mtl — the plugin itself does not work here (see the Python error above)"
import jax, jax.numpy as jnp
d = jax.devices()[0]
assert d.platform == "mtl", f"default device is {d.platform}, not mtl"
import numpy as np
xs = np.arange(12.0, dtype=np.float32).reshape(3, 4)
want = float((xs @ xs.T).sum())                      # the host's answer, not a constant
got = float((jnp.asarray(xs) @ jnp.asarray(xs).T).sum())
assert got == want, f"mtl gave {got}, numpy on the CPU {want}"
print(f"  ✓ {d} ({d.device_kind}): (x @ x.T).sum() = {got}, as numpy on the CPU")
EOF
fi

# ─── smoke ───────────────────────────────────────────────────────────────────
if want smoke; then
  say "smoke: our PJRT shim on the Metal plugin, before any Lean"
  [ -n "${PJRT_PLUGIN:-}" ] || die "no plugin: .venv has no metal_pjrt_core/pjrt_c_api_mtl_plugin.dylib — run the venv stage"
  echo "  PJRT_PLUGIN=$PJRT_PLUGIN"
  echo "  client options: platform_name=$LEAN_MLIR_PJRT_PLATFORM allocator=$LEAN_MLIR_ALLOCATOR preallocate=$LEAN_MLIR_PREALLOCATE memory_fraction=$LEAN_MLIR_MEM_FRACTION stage_h2d=$LEAN_MLIR_STAGE_H2D"
  # The same one-liner the lakefile's ensurePjrtShim runs (`gcc` is clang on macOS).
  cc -fPIC -O2 -shared ffi/pjrt_ffi.c -ldl -o ffi/libpjrt_ffi.so || die "the shim did not compile"
  ok "built ffi/libpjrt_ffi.so"
  cc -O2 ffi/test_pjrt_smoke.c -ldl -lm -o ffi/test_pjrt_smoke || die "the smoke test did not compile"
  PJRT_FFI_TRACE=1 ./ffi/test_pjrt_smoke || die "the shim could not drive the plugin (its [pjrt_ffi] lines above name the call that failed)"
fi

# ─── data ────────────────────────────────────────────────────────────────────
if want data; then
  say "data: MNIST"
  bash scripts/datasets/download_mnist.sh > /dev/null || die "the MNIST download failed"
  ok "$(ls data/mnist/*-ubyte | wc -l | tr -d ' ') MNIST files in data/mnist/"
fi

# ─── lean ────────────────────────────────────────────────────────────────────
if want lean; then
  say "lean: toolchain, Mathlib's prebuilt cache, the three MNIST trainers"
  [ -x "$HOME/.elan/bin/lake" ] && export PATH="$HOME/.elan/bin:$PATH"
  lake --version || die "elan could not install the toolchain in lean-toolchain ($(cat lean-toolchain))"
  lake exe cache get || die "Mathlib's prebuilt cache did not download"
  # Lake's trace hashes the C source and flags, not the architecture, so objects that a
  # Rosetta shell's `cc` once built stay "up to date" here and ld64.lld skips them as
  # x86_64 ("incompatible with target architecture arm64" → undefined lean_f32_*).
  # Rebuild them rather than trust them.
  for o in .lake/build/ffi/*.o; do
    [ -f "$o" ] || continue
    case "$(lipo -archs "$o" 2>/dev/null)" in
      arm64) ;;
      *) echo "  ▸ $o is $(lipo -archs "$o" 2>/dev/null || echo unreadable), not arm64: rebuilding the C objects"
         rm -f .lake/build/ffi/*.o .lake/build/ffi/*.o.* .lake/build/lib/libireeffi.a
         break ;;
    esac
  done
  for t in mnist-linear-verified mnist-mlp-verified mnist-cnn-verified; do
    echo "  ▸ lake build $t"
    lake build "$t" || die "lake build $t failed"
  done
  ok "built the three MNIST trainers"
fi

# ─── mnist ───────────────────────────────────────────────────────────────────
if want mnist; then
  say "mnist: lake run mnist on the GPU"
  [ -x "$HOME/.elan/bin/lake" ] && export PATH="$HOME/.elan/bin:$PATH"
  lake run mnist || die "lake run mnist failed (each trainer's log is under runs/$(date +%F)-mnist-*/)"
fi

# ─── manifest ────────────────────────────────────────────────────────────────
{
  echo "date         $(date '+%F %T %Z')"
  echo "repo         $(git rev-parse --short HEAD 2>/dev/null)$(git diff --quiet 2>/dev/null || echo ' (dirty)')"
  echo "chip         $(sysctl -n machdep.cpu.brand_string)"
  echo "memory       $(( $(sysctl -n hw.memsize) / 1073741824 )) GB"
  echo "gpu cores    $(system_profiler SPDisplaysDataType 2>/dev/null | awk -F': ' '/Total Number of Cores/ {print $2; exit}')"
  echo "macOS        $(sw_vers -productVersion) ($(sw_vers -buildVersion))"
  echo "lean         $(cat lean-toolchain)"
  [ -x .venv/bin/python3 ] && .venv/bin/python3 -c 'import importlib.metadata as m, platform
print("python      ", platform.python_version())
for p in ("jax", "jaxlib", "jax-graft", "metal-pjrt-core"):
    try: print(f"{p:<12} {m.version(p)}")
    except m.PackageNotFoundError: pass'
  [ -n "${PJRT_PLUGIN:-}" ] && echo "plugin md5   $(md5 -q "$PJRT_PLUGIN")"
  echo "stages run   $STAGES"
} > "$LOGDIR/manifest.txt" 2>/dev/null || true
say "done: $STAGES — log $LOG, box facts $LOGDIR/manifest.txt"
