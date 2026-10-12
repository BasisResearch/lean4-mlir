# Apple Silicon Mac — the verified MNIST tier on Metal

**Status: prepared, not yet run.** Everything Mac-side below was written on Linux. The script
stops at the first rung that fails, and that rung's log is what fixes the next revision.

The trainers reach a GPU through a PJRT plugin that the shim (`ffi/pjrt_ffi.c`) `dlopen`s, so a
Mac needs a Metal plugin and nothing else. The plugin is
[jax-graft](https://github.com/dfm/jax-graft) (formerly metal-pjrt-plugin). It is XLA's GPU
compiler with a Metal backend, built from the XLA in jaxlib 0.11.2, and the JAX platform it
registers is named `mtl`. Its compiled library is the `metal-pjrt-core` wheel, which exports
the standard `GetPjrtApi` the shim already calls on CUDA. Apple's own `jax-metal` is not used:
JAX dropped it from its install docs in January 2026.

## Requirements

| | |
|---|---|
| Mac | Apple Silicon (any M-series). jax-graft's published numbers are from an 8 GB M3 Air, and an M1 is untested upstream |
| macOS | **26 or later**: jax-graft's wheel is `macosx_26_0_arm64`. macOS 26 runs on every Apple Silicon Mac, the 2020 M1 Air included |
| tools | Xcode command-line tools (`xcode-select --install`), Python 3.12+ (Homebrew, python.org or uv), elan |
| disk | ~15 GB: Mathlib's prebuilt cache plus the build |

## Run it

```bash
git clone https://github.com/brettkoonce/lean4-mlir && cd lean4-mlir
bash deploy/mac_setup.sh                 # every rung, in order
bash deploy/mac_setup.sh smoke           # resume from a rung after fixing it
```

| rung | proves | when it fails, the problem is in |
|---|---|---|
| `check` | arm64, macOS 26+, compiler, Python, elan, disk | the box |
| `venv` | `.venv` with `jax-graft==0.0.5`, which pulls in jax, jaxlib and `metal-pjrt-core` | pip / the wheel |
| `jax` | JAX computes on the `mtl` device, with `JAX_PLATFORMS=mtl` so it cannot fall back to the CPU quietly | the plugin itself, independent of this repo |
| `smoke` | `ffi/test_pjrt_smoke.c` through the real shim: create the Metal client, run `verified_mlir/linear_fwd.mlir` against the host's answer, compile the other five MNIST renders | the shim ↔ plugin seam: client options, compile options, the StableHLO text |
| `data` | MNIST into `data/` | the network |
| `lean` | elan installs the toolchain, `lake exe cache get` fetches Mathlib, and the three MNIST trainers build | the Lean build on macOS |
| `mnist` | `lake run mnist`: linear, MLP and CNN, trained on the GPU | the trainers on Metal |

Everything is teed to `runs/<date>-mac-setup/setup.log`, with the box's chip, memory, GPU cores,
macOS and package versions in `manifest.txt` beside it. Each trainer's own log lands under
`runs/<date>-mnist-*/`, as on the other platforms.

## What is Mac-specific

- **`scripts/platform/env.sh`** has a `metal` backend, chosen when `uname -s` is Darwin. It
  points `PJRT_PLUGIN` at the venv's `metal_pjrt_core/pjrt_c_api_mtl_plugin.dylib` and, unless
  they are already set, exports the client options that `jax_graft/__init__.py` passes:

  | variable | value | becomes the client option |
  |---|---|---|
  | `LEAN_MLIR_PJRT_PLATFORM` | `METAL` | `platform_name`: the GPU client's StreamExecutor platform. Without it the client looks for CUDA |
  | `LEAN_MLIR_ALLOCATOR` | `platform` | `allocator`: XLA's pass-through allocator. The plugin caches and budgets buffers itself |
  | `LEAN_MLIR_PREALLOCATE` | `0` | `preallocate` |
  | `LEAN_MLIR_MEM_FRACTION` | `1.0` | `memory_fraction`: the real budget is the plugin's, scaled by `METAL_PJRT_MEMORY_FRACTION` (default: half of RAM) |
  | `LEAN_MLIR_STAGE_H2D` | `0` | `should_stage_host_to_device_transfers`: unified memory, nothing to stage through |

- **`ffi/pjrt_ffi.c`** reads `LEAN_MLIR_PJRT_PLATFORM`, which is unset (and the option absent)
  everywhere else. On macOS only, it calls `PJRT_Plugin_Initialize` before creating the client,
  as JAX does, and searches the venv's plugin path by default. The Linux build is unchanged.
- **`run.sh`** accepts the `metal` backend. There is one GPU, so the index argument is ignored.

## What to expect

- **Float32 only.** Apple GPUs have no float64, and the MNIST renders use none. jax-graft
  refuses an unsupported op at compile time, naming it, rather than computing it wrongly, so
  op-coverage trouble surfaces in the `smoke` rung.
- **Small steps are dispatch-bound.** A round trip to the GPU costs ~175 µs on the plugin's M3
  measurements, so MNIST's small steps will not show the GPU off. The run is the point, not the
  time.
- **The GPU also drives the display.** jax-graft splits work to stay clear of macOS's GPU
  watchdog. Stop a run with Ctrl-C, never `kill -9`.
- **8 GB machines.** MNIST itself fits easily. The Lean build of the trainers is the heavier
  part, and has not been measured on an 8 GB Mac.

## After it runs

Send back `runs/<date>-mac-setup/` (the log and manifest) and the `runs/<date>-mnist-*/` logs.
A green `mnist` rung earns the Mac a row of numbers in `scripts/platform/support.tsv`, and with
it `PLATFORMS.md`.
