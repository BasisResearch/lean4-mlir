#!/bin/bash
# deploy/arc_setup.sh — from a fresh clone on a Linux box with an Intel Arc (Battlemage) card to
# `lake run mnist` and `lake run cifar` on the GPU, one rung at a time. deploy/ARC_B50.md is the
# runbook; this is its commands.
#
#   bash deploy/arc_setup.sh            # every stage, in order
#   bash deploy/arc_setup.sh smoke      # start at a stage (check venv jax smoke suite data lean mnist cifar)
#   bash deploy/arc_setup.sh smoke data # only the stages named
#
# Each stage proves one layer before the next one leans on it, and stops at the first failure
# with the layer named, so the log says where it broke:
#   check  the box: an Intel display device bound to `xe` (kernel 7.0 for the B50), its BAR at
#          full VRAM (Resizable BAR — the runtime sees no device without it), Intel's Level Zero
#          runtime, gcc, Python 3.12+, elan, disk
#   venv   .venv-xpu with Intel's plugin (jax_oneapi_pjrt, platform "oneapi"), its oneAPI runtime
#          as pip wheels (jax_oneapi_plugin[with-oneapi]) and jax — never the pinned .venv
#   jax    JAX itself computes on the "oneapi" device — the plugin works before any of our code
#   smoke  ffi/libpjrt_ffi.so (our PJRT shim) and ffi/test_pjrt_smoke.c: load the plugin, create
#          a client, run verified_mlir/linear_fwd.mlir against the host's answer, compile the
#          other five MNIST renders — the shim works before any Lean
#   suite  scripts/platform/check.sh, tiers 0–2: the shim's guards and 16 train steps against
#          XLA:CPU goldens (~5 min) — what admits a platform to PLATFORMS.md
#   data   MNIST into data/mnist/, CIFAR-10 into data/cifar-10/
#   lean   the toolchain (elan installs it from lean-toolchain), Mathlib's prebuilt cache, and
#          the five trainers
#   mnist  `lake run mnist`: linear, MLP and CNN on the GPU (~1 min)
#   cifar  `lake run cifar`: the six optimizer arms on the GPU (~10½ min on a B50)
#
# Imagenette is not a stage: on minerva the card leaves the bus ~2 min into sustained full load
# (ARC_B50.md §5), so it runs by hand until that is fixed.
#
# Everything is teed to runs/<date>-arc-setup/setup.log, with the box's facts in
# runs/<date>-arc-setup/manifest.txt. When a stage fails, that log is what to send back.
set -euo pipefail
cd "$(dirname "$0")/.."

ALL="check venv jax smoke suite data lean mnist cifar"
ONEAPI_VERSION=${ONEAPI_VERSION:-0.11.2}   # the plugin release this runbook was written against
JAX_VERSION=${JAX_VERSION:-0.11.2}         # the jax that plugin is built against
VENV=.venv-xpu

if [ $# -eq 0 ]; then STAGES=$ALL
elif [ $# -eq 1 ]; then
  case " $ALL " in *" $1 "*) ;; *) echo "unknown stage '$1' (one of: $ALL)" >&2; exit 2 ;; esac
  STAGES=${ALL#*"$1"}; STAGES="$1$STAGES"          # from that stage to the end
else STAGES="$*"
fi

STAGE=${STAGES%% *}   # the stage running, for die's resume line
LOGDIR=runs/$(date +%F)-arc-setup
mkdir -p "$LOGDIR"
LOG=$LOGDIR/setup.log
exec > >(tee -a "$LOG") 2>&1
echo "════ arc_setup $(date '+%F %T') — stages: $STAGES"

say ()  { printf '\n━━━ %s\n' "$*"; }
ok ()   { printf '  ✓ %s\n' "$*"; }
warn () { printf '  ⚠ %s\n' "$*"; }
die ()  { printf '\n  ✗ %s\n\n  The log is %s. Fix the above, then resume with:\n    bash deploy/arc_setup.sh %s\n' "$1" "$LOG" "$STAGE" >&2; exit 1; }
want () { case " $STAGES " in *" $1 "*) STAGE=$1; return 0 ;; *) return 1 ;; esac; }

# The first Intel display-class device (class 0x03xxxx, vendor 0x8086) on the bus, as a sysfs
# path, or "" if there is none. An Intel iGPU would match too; minerva's Ryzen has none.
find_arc () {
  local d
  for d in /sys/bus/pci/devices/*; do
    case "$(cat "$d/class" 2>/dev/null)" in
      0x03*) [ "$(cat "$d/vendor" 2>/dev/null)" = 0x8086 ] && { echo "$d"; return 0; } ;;
    esac
  done
  return 0
}

# The largest memory BAR of sysfs device $1, in MiB (its `resource` file: start end flags).
largest_bar_mib () {
  awk '{ s = strtonum($1); e = strtonum($2); if (e > s) { m = (e - s + 1) / 1048576; if (m > best) best = m } }
       END { printf "%d\n", best }' "$1/resource"
}

# The newest python >= 3.12 on PATH, or "" if there is none.
find_python () {
  for p in python3.14 python3.13 python3.12 python3; do
    command -v "$p" > /dev/null 2>&1 || continue
    if "$p" -c 'import sys; sys.exit(0 if sys.version_info >= (3, 12) else 1)' 2> /dev/null; then
      command -v "$p"; return 0
    fi
  done
  return 0
}

# ─── check ───────────────────────────────────────────────────────────────────
if want check; then
  say "check: the box"
  [ "$(uname -s)" = Linux ] || die "not Linux ($(uname -s)) — Intel's plugin ships for Linux x86_64 only"
  [ "$(uname -m)" = x86_64 ] || die "not x86_64 ($(uname -m)) — Intel's plugin ships for Linux x86_64 only"
  ARC=$(find_arc)
  [ -n "$ARC" ] || die "no Intel display device on the PCI bus — is the card seated and powered? (lspci -nn | grep -i 8086)"
  bdf=${ARC##*/}
  ok "Intel GPU at $bdf ($(cat "$ARC/device"))"
  drv=$(basename "$(readlink "$ARC/driver" 2>/dev/null)" 2>/dev/null || true)
  [ "$drv" = xe ] || die "$bdf is bound to '${drv:-nothing}', not xe — kernel $(uname -r)'s xe does not know this card. Battlemage Pro (B50/B60) needs kernel 7.0: on Ubuntu 24.04, sudo apt install linux-generic-hwe-24.04, reboot"
  ok "xe driver, kernel $(uname -r)"
  bar=$(largest_bar_mib "$ARC")
  [ "$bar" -ge 4096 ] || die "$bdf's largest BAR is ${bar} MiB — Intel's compute runtime reports NO device below full VRAM (clinfo: 0 platforms; zeInit: UNINITIALIZED). Turn on Above 4G Decoding and Resizable BAR in the BIOS; on minerva's ASUS Pro WS X570-ACE that took BIOS 5601 (3601 left the B50 at 256 MB in either slot), and pci=realloc did not help"
  ok "BAR: ${bar} MiB (Resizable BAR on)"
  ldconfig -p 2>/dev/null | grep -q 'libze_loader\.so\.1' || die "no Level Zero loader (libze1) — Intel's runtime: sudo add-apt-repository ppa:kobuk-team/intel-graphics && sudo apt install libze1 libze-intel-gpu1 intel-opencl-icd xpu-smi (Ubuntu 24.04's own 23.43 runtime predates Battlemage)"
  ldconfig -p 2>/dev/null | grep -q 'libze_intel_gpu\.so\.1' || die "Level Zero loader present but no Intel GPU driver for it (libze-intel-gpu1) — see the PPA line above"
  ok "Level Zero: libze_loader + libze_intel_gpu"
  if command -v xpu-smi > /dev/null 2>&1; then ok "xpu-smi: $(xpu-smi discovery 2>/dev/null | sed -n 's/.*Device Name:[[:space:]]*//p' | head -1)"
  else warn "no xpu-smi — optional, but scripts/platform/env.sh detects the backend by it (this script sets PLATFORM_BACKEND=xpu itself)"
  fi
  command -v gcc > /dev/null || die "no gcc — sudo apt install build-essential"
  ok "C compiler: $(gcc --version | head -1)"
  PY=$(find_python)
  if [ -n "$PY" ]; then ok "python: $PY ($("$PY" -V 2>&1))"
  elif command -v uv > /dev/null 2>&1; then ok "no python >= 3.12 on PATH; uv is, and the venv stage will use it"
  else die "no python >= 3.12 on PATH and no uv — sudo apt install python3 (24.04 has 3.12), or https://docs.astral.sh/uv/"
  fi
  if ! command -v lake > /dev/null 2>&1 && [ ! -x "$HOME/.elan/bin/lake" ]; then
    die "no elan/lake — install it with:
    curl https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh -sSf | sh -s -- -y --default-toolchain none
  then open a new terminal (or: source ~/.elan/env)"
  fi
  ok "elan: $(command -v elan || echo "$HOME/.elan/bin/elan")"
  free_gb=$(df -BG --output=avail . | awk 'NR==2 {gsub("G",""); print $1}')
  [ "$free_gb" -ge 20 ] || die "only ${free_gb} GB free here — the oneAPI wheels (~3 GB), Mathlib's cache and the build want ~20 GB"
  ok "disk: ${free_gb} GB free"
fi

# ─── venv ────────────────────────────────────────────────────────────────────
if want venv; then
  say "venv: $VENV with jax_oneapi_pjrt $ONEAPI_VERSION"
  if [ ! -x $VENV/bin/python3 ]; then
    PY=$(find_python)
    if [ -n "$PY" ]; then
      # Ubuntu's python3 without python3.X-venv cannot make a venv with pip in it; make one
      # without and install with the system pip's --python instead (pip >= 22.3).
      "$PY" -m venv $VENV 2>/dev/null || { rm -rf $VENV; "$PY" -m venv --without-pip $VENV; } \
        || die "python -m venv failed"
    else uv venv --python 3.12 $VENV || die "uv venv failed"
    fi
    ok "created $VENV ($($VENV/bin/python3 -V))"
  else
    ok "reusing $VENV ($($VENV/bin/python3 -V))"
  fi
  pkgs=("jax==$JAX_VERSION" "jax_oneapi_pjrt==$ONEAPI_VERSION" "jax_oneapi_plugin[with-oneapi]==$ONEAPI_VERSION")
  if [ -x $VENV/bin/pip ]; then $VENV/bin/pip install -q "${pkgs[@]}" || die "pip install ${pkgs[*]} failed"
  elif python3 -m pip --version > /dev/null 2>&1; then
    python3 -m pip --python $VENV/bin/python3 install -q "${pkgs[@]}" || die "pip --python install ${pkgs[*]} failed"
  elif command -v uv > /dev/null 2>&1; then
    uv pip install -q --python $VENV/bin/python3 "${pkgs[@]}" || die "uv pip install ${pkgs[*]} failed"
  else die "$VENV has no pip, and neither the system python's pip nor uv is there to install into it — sudo apt install python3-pip (or python3.12-venv, then rm -rf $VENV and rerun)"
  fi
  vers=$($VENV/bin/python3 - << 'EOF'
import importlib.metadata as m
def v(p):
    try: return m.version(p)
    except m.PackageNotFoundError: return "MISSING"
print(", ".join(f"{p} {v(p)}" for p in ("jax", "jaxlib", "jax-oneapi-pjrt", "jax-oneapi-plugin", "intel-sycl-rt")))
EOF
)
  echo "  installed: $vers"
  case "$vers" in *MISSING*) die "a package is missing — see pip's output above" ;; esac
  ls $VENV/lib/python3.*/site-packages/jax_plugins/xla_oneapi/xla_oneapi_plugin.so > /dev/null 2>&1 \
    || die "jax_oneapi_pjrt installed, but its xla_oneapi_plugin.so is not where scripts/platform/env.sh looks"
  ok "plugin: $(ls $VENV/lib/python3.*/site-packages/jax_plugins/xla_oneapi/xla_oneapi_plugin.so)"
fi

# The platform profile: the plugin path and .venv-xpu/lib (the oneAPI runtime) on LD_LIBRARY_PATH.
export PLATFORM_BACKEND=xpu
. scripts/platform/env.sh
[ "$PLATFORM_BACKEND" = xpu ] || die "scripts/platform/env.sh resolved backend '$PLATFORM_BACKEND', not xpu"

# ─── jax ─────────────────────────────────────────────────────────────────────
if want jax; then
  say "jax: JAX computes on the oneapi device"
  # JAX_PLATFORMS=oneapi makes a plugin that fails to start an error rather than a quiet CPU fallback.
  JAX_PLATFORMS=oneapi $VENV/bin/python3 - << 'EOF' 2>&1 | grep -v '^[IW][0-9]' || die "JAX could not compute on oneapi — the plugin itself does not work here (see the Python error above)"
import jax, jax.numpy as jnp
import numpy as np
d = jax.devices()[0]
assert str(d).startswith("oneapi"), f"default device is {d}, not oneapi"   # its backend reports "gpu"
xs = np.arange(12.0, dtype=np.float32).reshape(3, 4)
want = float((xs @ xs.T).sum())                      # the host's answer, not a constant
got = float((jnp.asarray(xs) @ jnp.asarray(xs).T).sum())
assert got == want, f"oneapi gave {got}, numpy on the CPU {want}"
print(f"  ✓ {d} ({d.device_kind}): (x @ x.T).sum() = {got}, as numpy on the CPU")
EOF
fi

# ─── smoke ───────────────────────────────────────────────────────────────────
if want smoke; then
  say "smoke: our PJRT shim on Intel's plugin, before any Lean"
  [ -n "${PJRT_PLUGIN:-}" ] || die "no plugin: $VENV has no jax_plugins/xla_oneapi/xla_oneapi_plugin.so — run the venv stage"
  echo "  PJRT_PLUGIN=$PJRT_PLUGIN"
  # The same one-liner the lakefile's ensurePjrtShim runs.
  gcc -fPIC -O2 -shared ffi/pjrt_ffi.c -ldl -o ffi/libpjrt_ffi.so || die "the shim did not compile"
  ok "built ffi/libpjrt_ffi.so"
  gcc -O2 ffi/test_pjrt_smoke.c -ldl -lm -o ffi/test_pjrt_smoke || die "the smoke test did not compile"
  # The shim's startup lines include `h2d: SERIAL` — its workaround for the plugin's SYCL race
  # (ARC_B50.md §3); "batched" here would mean the platform name was not recognised.
  PJRT_FFI_TRACE=1 ./ffi/test_pjrt_smoke 2>&1 | grep -v '^[IW][0-9]' \
    || die "the shim could not drive the plugin (its [pjrt_ffi] lines above name the call that failed)"
fi

# ─── suite ───────────────────────────────────────────────────────────────────
if want suite; then
  say "suite: scripts/platform/check.sh, tiers 0–2"
  bash scripts/platform/check.sh --backend xpu || die "the platform suite failed (results.tsv and logs/ under the runs/platform/ directory it named)"
fi

# ─── data ────────────────────────────────────────────────────────────────────
if want data; then
  say "data: MNIST and CIFAR-10"
  bash scripts/datasets/download_mnist.sh > /dev/null || die "the MNIST download failed"
  ok "$(ls data/mnist/*-ubyte | wc -l | tr -d ' ') MNIST files in data/mnist/"
  bash scripts/datasets/download_cifar.sh > /dev/null || die "the CIFAR-10 download failed"
  ok "CIFAR-10: $(ls -d data/cifar* 2>/dev/null | head -1)"
fi

# ─── lean ────────────────────────────────────────────────────────────────────
TRAINERS="mnist-linear-verified mnist-mlp-verified mnist-cnn-verified cifar8w-ablation cifar8w-bn-ablation"
if want lean; then
  say "lean: toolchain, Mathlib's prebuilt cache, the five MNIST and CIFAR trainers"
  [ -x "$HOME/.elan/bin/lake" ] && export PATH="$HOME/.elan/bin:$PATH"
  lake --version || die "elan could not install the toolchain in lean-toolchain ($(cat lean-toolchain))"
  lake exe cache get || die "Mathlib's prebuilt cache did not download"
  for t in $TRAINERS; do
    echo "  ▸ lake build $t"
    lake build "$t" || die "lake build $t failed"
  done
  ok "built the five trainers"
fi

# ─── mnist ───────────────────────────────────────────────────────────────────
if want mnist; then
  say "mnist: lake run mnist on the GPU"
  [ -x "$HOME/.elan/bin/lake" ] && export PATH="$HOME/.elan/bin:$PATH"
  lake run mnist || die "lake run mnist failed (each trainer's log is under runs/$(date +%F)-mnist-*/)"
fi

# ─── cifar ───────────────────────────────────────────────────────────────────
if want cifar; then
  say "cifar: lake run cifar on the GPU"
  [ -x "$HOME/.elan/bin/lake" ] && export PATH="$HOME/.elan/bin:$PATH"
  lake run cifar || die "lake run cifar failed (each trainer's log is under runs/$(date +%F)-cifar8w-*/)"
fi

# ─── manifest ────────────────────────────────────────────────────────────────
{
  ARC=$(find_arc)
  echo "date         $(date '+%F %T %Z')"
  echo "repo         $(git rev-parse --short HEAD 2>/dev/null)$(git diff --quiet 2>/dev/null || echo ' (dirty)')"
  echo "host         $(hostname -s)"
  echo "cpu          $(sed -n 's/^model name[[:space:]]*: //p' /proc/cpuinfo | head -1)"
  echo "kernel       $(uname -r)"
  echo "os           $(. /etc/os-release 2>/dev/null; echo "${PRETTY_NAME:-?}")"
  if [ -n "$ARC" ]; then
    echo "gpu          ${ARC##*/} $(cat "$ARC/vendor"):$(cat "$ARC/device")$(command -v xpu-smi > /dev/null && xpu-smi discovery 2>/dev/null | sed -n 's/.*Device Name:[[:space:]]*/ /p' | head -1)"
    echo "bar          $(largest_bar_mib "$ARC") MiB"
    # The card's own link is its internal switch's port (x1 2.5 GT/s); the real one is upstream.
    up=$(readlink -f "$ARC/../..")
    echo "link         $(cat "$up/current_link_speed" 2>/dev/null) x$(cat "$up/current_link_width" 2>/dev/null) (upstream ${up##*/})"
  fi
  echo "level zero   $(dpkg-query -W -f='${Version}' libze-intel-gpu1 2>/dev/null || echo '?')"
  echo "lean         $(cat lean-toolchain)"
  [ -x $VENV/bin/python3 ] && $VENV/bin/python3 -c 'import importlib.metadata as m, platform
print("python      ", platform.python_version())
for p in ("jax", "jaxlib", "jax-oneapi-pjrt", "jax-oneapi-plugin", "intel-sycl-rt"):
    try: print(f"{p:<12} {m.version(p)}")
    except m.PackageNotFoundError: pass'
  [ -n "${PJRT_PLUGIN:-}" ] && echo "plugin md5   $(md5sum "$PJRT_PLUGIN" | cut -d' ' -f1)"
  echo "stages run   $STAGES"
} > "$LOGDIR/manifest.txt" 2>/dev/null || true
say "done: $STAGES — log $LOG, box facts $LOGDIR/manifest.txt"
