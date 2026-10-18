# Intel Arc Pro B50 — the verified MNIST and CIFAR tiers on oneAPI

**Status: works — every rung green on minerva's Arc Pro B50 (2026-10-12/13). TODO: full
Imagenette runs.** MNIST and CIFAR-10 train end to end on the GPU and match CUDA; all seven
Imagenette nets train, but only 60-step probes have been done, because on minerva the card falls
off the PCIe bus under load — two minutes into sustained 70 W, and once (10-18) three minutes into
the suite (§4).

The trainers reach a GPU through a PJRT plugin that the shim (`ffi/pjrt_ffi.c`) `dlopen`s, so an
Intel card needs Intel's plugin and nothing else from this repo's side. The plugin is
`jax_oneapi_pjrt` (Intel's OpenXLA plugin, platform `oneapi`, PJRT API 0.115 against our header's
0.90), with its oneAPI runtime — SYCL, oneDNN, MKL — as pip wheels from
`jax_oneapi_plugin[with-oneapi]`. Getting the card visible to that runtime was most of the work
(§1); one shim workaround for a race in Intel's SYCL runtime was the rest (§3).

The card: Arc Pro B50 16 GB (8086:e212, Battlemage, 70 W, slot-powered — no auxiliary
connector), behind its own internal PCIe switch, on x8 Gen4.

## Requirements

| | |
|---|---|
| box | Linux x86_64. minerva: ASUS Pro WS X570-ACE, Ubuntu 24.04 |
| kernel | **7.0** (Ubuntu 24.04: `linux-generic-hwe-24.04`). 6.8's `xe` has no B50 ID |
| BIOS | **Resizable BAR on, BAR at full VRAM (16 GB).** At 256 MB Intel's runtime sees no device at all (§1) |
| runtime | Intel's Level Zero GPU runtime from `ppa:kobuk-team/intel-graphics`: `libze1`, `libze-intel-gpu1`, `intel-opencl-icd`, `xpu-smi` |
| tools | gcc, Python 3.12+, elan |
| disk | ~20 GB: the oneAPI wheels (~3 GB), Mathlib's prebuilt cache, the build |

## Run it

```bash
git clone https://github.com/brettkoonce/lean4-mlir && cd lean4-mlir
bash deploy/arc_setup.sh                 # every rung, in order
bash deploy/arc_setup.sh smoke           # resume from a rung after fixing it
```

| rung | proves | when it fails, the problem is in |
|---|---|---|
| `check` | an Intel GPU bound to `xe`, its BAR at full VRAM, the Level Zero runtime, gcc, Python, elan, disk | the box: kernel, BIOS, Intel's packages |
| `venv` | `.venv-xpu` with `jax_oneapi_pjrt` + `jax_oneapi_plugin[with-oneapi]` + `jax`, all 0.11.2 — never the pinned `.venv` | pip / the wheels |
| `jax` | JAX computes on the `oneapi` device, with `JAX_PLATFORMS=oneapi` so it cannot fall back to the CPU quietly | the plugin itself, independent of this repo |
| `smoke` | `ffi/test_pjrt_smoke.c` through the real shim: create the client, run `verified_mlir/linear_fwd.mlir` against the host's answer, compile the other five MNIST renders | the shim ↔ plugin seam |
| `suite` | `scripts/platform/check.sh --backend xpu`, tiers 0–2: the shim's guards and 16 train steps against XLA:CPU goldens (§2) | the plugin's numerics, op by op |
| `data` | MNIST into `data/mnist/`, CIFAR-10 into `data/` | the network |
| `lean` | elan installs the toolchain, `lake exe cache get` fetches Mathlib, and the five MNIST and CIFAR trainers build | the Lean build |
| `mnist` | `lake run mnist`: linear, MLP and CNN, on the GPU | the trainers on oneAPI |
| `cifar` | `lake run cifar`: the six optimizer arms, ~10½ min | sustained conv training (where §3 showed up) |

Everything is teed to `runs/<date>-arc-setup/setup.log`, with the box's kernel, GPU, BAR, link,
runtime and package versions in `manifest.txt` beside it. Each trainer's own log lands under
`runs/<date>-<trainer>/`, as on the other platforms. Imagenette is not a rung: run it by hand
(`lake run imagenette`, or one net with `./run.sh <net> 0 xpu`) once §4 is settled on your box.

## What is Arc-specific

- **`scripts/platform/env.sh`**'s `xpu` arm points `PJRT_PLUGIN` at
  `.venv-xpu/…/jax_plugins/xla_oneapi/xla_oneapi_plugin.so` and puts `.venv-xpu/lib` on
  `LD_LIBRARY_PATH`: the plugin finds its oneAPI runtime only through that path. The backend is
  picked by `xpu-smi` on PATH and an Intel display device on the bus; with an AMD card also in the
  box it picks `rocm`, and `PLATFORM_BACKEND=xpu` selects the Arc (`arc_setup.sh` sets it).
- **`ffi/pjrt_ffi.c`** serializes host-to-device uploads when the plugin's platform name is
  oneAPI/SYCL/XPU — `h2d_serial()`, §3. Every other platform is unchanged. Its startup line says
  which: `[pjrt_ffi] h2d: SERIAL — one upload in flight (oneAPI default …)`.
- **`run.sh`** accepts the `xpu` backend; the GPU index becomes `ZE_AFFINITY_MASK`.
- **bf16 works.** Tier 2's bf16 rows pass, so the bf16 renders apply. Unlike the Mac there is no
  float32-only restriction.

## Measured

Arc Pro B50 16 GB in minerva (Ryzen, X570, x8 Gen4 through a riser), kernel 7.0.0-38,
`jax_oneapi_pjrt` 0.11.2 (`intel-sycl-rt` 2025.1.1), the shim's serial uploads on.

| | per epoch | result | CUDA (README) |
|---|---|---|---|
| suite, tiers 0–2 | — | 21 pass, 0 fail, 3 skips (two-device tests, one card) | — |
| `smoke`: `linear_fwd` vs the host | — | max error 1.7e-06; all six MNIST renders compile | — |
| MNIST linear, 12 ep | ~0.25 s | **92.10 %** | 92.10 % |
| MNIST MLP, 12 ep | ~0.45 s | **97.83 %** | 97.78 % (median of 30) |
| MNIST CNN, 12 ep | ~1.5 s | **98.74 %** | 98.78 % (median of 30) |
| CIFAR-10 `lake run cifar`, 6 × 40 ep | ~2–3 s | **76.77 %** best arm (BN, Nesterov); 10½ min for all six | 76.3 % |
| ResNet-34, Imagenette 224² | ~1 min (187 ms/step) | 60-step probe only; ~1.4 h for 80 ep. TODO: full run (§4) | 89.99 % |

CIFAR's six arms, 40 epochs each (2026-10-12; [`runs/2026-10-12-cifar8w-ablation/`](../runs/2026-10-12-cifar8w-ablation/),
[`…-bn-ablation/`](../runs/2026-10-12-cifar8w-bn-ablation/)). Times run from client start, so
they include compiling and evaluation.

| net | optimizer | time | test accuracy |
|---|---|---|---|
| no BN | SGD | 74 s | 69.69% |
| no BN | Nesterov | 100 s | 74.65% |
| no BN | AdamW | 103 s | 75.09% |
| BN | SGD | 107 s | 74.97% |
| BN | Nesterov | 119 s | 76.77% |
| BN | AdamW | ~120 s | 75.48% |

The seven Imagenette nets (2026-10-13), each 60 steps at batch 32 in probe mode
(`LEAN_MLIR_MAX_STEPS=60 LEAN_MLIR_PROBE_WARM=20 LEAN_MLIR_SKIP_EVAL=1`), the step time the
median over steps 21–60. Spreads were within 3 ms and data starvation 2 ms or less; all seven ran
clean. "Full run" is 80 epochs × 295 steps, its eval share an estimate (about +14%: the probes ran
with eval off).

| net | ms/step | training only | full run (est.) |
|---|---|---|---|
| ViT-Tiny | 80 | 32 min | ~36 min |
| MobileNetV2 | 110 | 43 min | ~50 min |
| MobileNetV4-Conv-M | 125 | 49 min | ~56 min |
| EfficientNet-B0 | 128 | 50 min | ~57 min |
| ResNet-34 | 187 | 74 min | ~1.4 h |
| ConvNeXt-T | 241 | 95 min | ~1.8 h |
| ResNet-50 | 287 | 113 min | ~2.1 h |
| **`lake run imagenette`** | | **~7.6 h** | **~8½–9 h** |

**TODO: full runs.** An 80-epoch ResNet-34 to completion once §4 is fixed, then the other six
Imagenette nets; a second card for the suite's two-device tests and the DP path.

## What to expect

- **The plugin is experimental.** JAX prints `Platform 'oneapi' is experimental`. One runtime bug
  has been found and worked around in the shim (§3); expect the next one to show up under
  sustained training, not in the suite.
- **The BAR is the whole bring-up.** If `clinfo` shows no platform or `zeInit` fails, look at
  the BAR size before anything else (§1).
- **A card that drops off the bus stays off it.** `CT write: non-zero status: 4294967295` in
  dmesg, then every read returns `0xFFFFFFFF`: only a power cycle at the wall brings it back (§4).

## After it runs

Send back `runs/<date>-arc-setup/` (the log and manifest), the suite's `runs/platform/<date>-<host>-xpu/`
and the `runs/<date>-mnist-*/` and `runs/<date>-cifar8w-*/` logs. A green `cifar` rung on a new
card earns it a row in `scripts/platform/support.tsv`, and with it `PLATFORMS.md`.

## §1 Bringing it up, in the order it cost time

1. **Kernel 7.0.** The 6.8 kernel's `xe` has no B50 ID, so install `linux-generic-hwe-24.04`
   (7.0.0-38 here). minerva stays on 24.04 because ROCm 7.2.4's apt repo stops at noble. The
   in-tree `amdgpu` kept working on 7.0.
2. **A 16 GB BAR is mandatory.** At 256 MB, Intel's compute runtime reports no device at all:
   `clinfo` shows 0 platforms, and `zeInit` fails with UNINITIALIZED. The only hint is a "Resizable
   BAR not detected" warning. BIOS 3601 (2021) on the ASUS Pro WS X570-ACE gave a 7900 XTX its
   32 GB but left the B50 at 256 MB in either slot, because the B50 sits behind its own internal
   PCIe switch. `pci=realloc` did not help. BIOS 5601 (2026-08) fixed it. Check with
   `lspci -vv -s 0d:00.0 | grep -A2 Resizable`; `arc_setup.sh check` reads it from sysfs.
3. **Userspace from `ppa:kobuk-team/intel-graphics`:** `libze1`, `libze-intel-gpu1`,
   `intel-opencl-icd`, `xpu-smi`. Noble's own 23.43 runtime predates Battlemage.
4. **`.venv-xpu`:** the two Intel packages and `jax`, 0.11.2. Keep this venv separate; never
   install into the pinned `.venv`. minerva has no `python3.12-venv`, so `arc_setup.sh` makes it
   with `python3 -m venv --without-pip` and installs with the system pip's `--python`.

Topology and noise you can ignore:

- The card's own link reads x1 2.5 GT/s. That is the internal switch's downstream port. The real
  link is the upstream bridge: root port `00:03.1` → `0b:00.0` (switch) → `0c:01.0` →
  `0d:00.0` (GPU), plus `0c:02.0` → `0e:00.0` (HDA audio), at x8 Gen4.
- `xe … PCODE Mailbox failed: -6` in dmesg has no visible effect.

## §2 The suite

```bash
scripts/platform/check.sh --backend xpu
```

Tiers 0–2 pass: 21 pass, 0 fail, plus 3 skips for the tests that need two devices
([`runs/platform/2026-10-11-minerva-xpu`](../runs/platform/2026-10-11-minerva-xpu/results.tsv)).
Every one of tier 2's 16 train-step graphs matches XLA:CPU within tolerance. That covers f32 and
bf16 across dense, conv, BN, depthwise, swish-SE, attention, ResNet-34 and ConvNeXt. The
expected-failures file,
[`scripts/platform/expected/xpu-arc-pro-b50.txt`](../scripts/platform/expected/xpu-arc-pro-b50.txt),
is empty.

The suite runs short graphs, so it caught neither §3 nor §4. Both showed up only under
sustained training.

## §3 The SYCL race, and the shim's workaround

With `jax_oneapi_pjrt` 0.11.2, which bundles `intel-sycl-rt` 2025.1.1, conv nets crashed
intermittently: about 8% of 12-epoch MNIST-CNN runs, and both CIFAR nets on their first try. The
crash is a use-after-free in libsycl's scheduler (`cleanupDependencyEvents`, or the abort
`urEventWait must not be called for an internal event`). It happens when several
`BufferFromHostBuffer` uploads are in flight at once: each one completes through a host callback
on an XLA thread, and SYCL's cleanup frees an event another host task is still waiting on. Under
stress it also caused GPU page faults, and once took the card off the bus.

Things that do not help:

- Waiting on each input's ready event before Execute.
- `SYCL_DISABLE_EXECUTION_GRAPH_CLEANUP=1`.
- sycl-rt 2025.3.3, which does not start with the 0.11.2 plugin.

The fix is to keep only one upload in flight. `ffi/pjrt_ffi.c`'s `h2d_serial()` waits for each
upload's completion and ready events before issuing the next. It is on by default when the
plugin's platform name is oneAPI/SYCL/XPU, and every other backend stays batched.
`PJRT_FFI_H2D_SERIAL=0|1` overrides the default, and the shim prints its choice at startup
(`[pjrt_ffi] h2d: SERIAL …`). With the fix, the stress loop ran 50,000 steps with 0 crashes,
against 5 crashes in 5 runs without it. It costs 8.5 → 10.3 ms per step in the stress loop. On
the real nets it disappears: parameters stay resident on the device, so only the batch is
uploaded.

The repro and the upstream report are in
[`runs/2026-10-11-xpu-sycl-race/`](../runs/2026-10-11-xpu-sycl-race/). `repro.sh` sets
`PJRT_FFI_H2D_SERIAL=0` so that it still reproduces the bug. Drop the default once Intel ships a
plugin with a fixed runtime and the repro runs clean.


## §4 The open fault: the card leaves the bus under sustained load

ResNet-34 Imagenette has died three times, every time about 2:00–2:20 into full 70 W load:
the 2026-10-11 stress loop, 2026-10-12 (~2 min), and 2026-10-13 (2:18, then 2:02 under the
sensor log). The sequence in dmesg is always:

```
xe 0000:0d:00.0: [drm] *ERROR* GT0: CT write: non-zero status: 4294967295
```

Every MMIO read after that returns `0xFFFFFFFF`, and the device is wedged. No AER is logged.
The trainer dies on a Level Zero abort (`direct_submission_hw.inl`). **Only a full power cycle,
off at the wall, recovers it.** A PCI remove/rescan does not.

Ruled out:

- **The shim and the SYCL race:** §3's fix is in, and the failure is a link drop, not a libsycl
  fault.
- **Runtime PM:** it dropped again with `power/control=on` on `0b:00.0` through `0e:00.0`. The
  earlier `Unable to change power state from D3hot` line on `0c:02.0` was a symptom.
- **Thermal:** `hwmon` sampled at 1 Hz showed 70 W flat at the cap, GPU at 69–70 °C, VRAM at
  66–68 °C and the fan at 3070 rpm, all steady for a minute. Then it dropped at 2:02 with no
  precursor.

**2026-10-18: it dropped under the suite, not just under sustained load.** About three minutes into
`check.sh`'s tier 2 — short bursts of train steps, the load that passed in full on 10-11 — at
01:24:42, the same `CT write` line, the switch port `0c:02.0` stuck in D3hot, then wedged. And the
host itself had reset without a shutdown on 10-14 at 02:35, idle (the journal's last lines are
cron). So it is not a matter of minutes at 70 W: the card can fall off under a light load too, and
the box's own power is suspect along with the card's.

That leaves power or signal. **The leading suspect is slot power through the riser**, with the PSU
behind it. The B50 has
no auxiliary power connector and draws all 70 W through the slot, and on minerva that path runs
through a riser. A Gen4 signal-integrity problem on the same riser is the other candidate.

### The pass/fail test

A logged 4-minute ResNet-34 load. Pass means more than 5 minutes at 70 W. It has failed at
2:02–2:18 every time.

```bash
ulimit -c unlimited
LEAN_MLIR_MAX_STEPS=1300 LEAN_MLIR_PROBE_WARM=20 LEAN_MLIR_SKIP_EVAL=1 LEAN_MLIR_CKPT_TAG=hwtest \
  PLATFORM_BACKEND=xpu ./run.sh resnet34-verified-adam 0 xpu
```

Alongside it, log the sensors from `/sys/bus/pci/devices/0000:0d:00.0/hwmon/hwmon*/` once a
second:

- `energy1_input`: the card's energy counter. Take the delta for watts. The package power column
  is unreliable.
- `temp2`: the package.
- `temp3`: VRAM.
- `fan1_input`.

### Next steps, cheapest first

1. **Card directly in a motherboard slot, no riser** — and, given the host resets, a look at the
   PSU (its age and rating, and whether the resets stop with the B50 out). If it passes, the riser is the cause.
   Replace it with a powered riser, or with an OCuLink or MCIO dock that powers the slot from
   the PSU.
2. **Cap the power at 45 W.** `xpu-smi config --powerlimit` fails ("Power level 1 not found":
   the card has no sustain level), so use sysfs. The setting does not survive a reboot.
   ```bash
   echo 45000000 | sudo tee /sys/bus/pci/devices/0000:0d:00.0/hwmon/hwmon*/power1_cap
   ```
   If it survives at 45 W, the 70 W slot draw is implicated.
3. **Force Gen3 in the BIOS.** If that fixes it, the cause is signal integrity, not power.

When a full ResNet-34 run completes, fill in the `imagenette` cell in
[`scripts/platform/support.tsv`](../scripts/platform/support.tsv) and replace this section with
the cause.
