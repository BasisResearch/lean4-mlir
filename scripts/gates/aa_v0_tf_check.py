#!/usr/bin/env python3
"""aa_v0_tf_check.py — EfficientNet-B0's emitted AutoAugment against TF TPU EfficientNet's own
`autoaugment.py` (`TrainConfig.autoAugmentTf`), not timm's rendering of it.

  .venv/bin/python scripts/gates/aa_v0_tf_check.py [jax/generated/<an autoAugmentTf trainer>.py]
  .venv/bin/python scripts/gates/aa_v0_tf_check.py --control <a timm-form file>   # must go RED

`scripts/parity/aa_v0_timm_check.py` pins the policy TABLE against timm 1.0.28, which transcribes
TF's `policy_v0()` op for op, and that table is unchanged here. What TF's own code does differently
from timm's is the geometry, and this gate pins those four rows — read off
tensorflow/tpu `models/official/efficientnet/autoaugment.py` (master, 2026-10-12):

  1. the 25 sub-policies of `policy_v0()`, in order, with TF's op names ('TranslateY', not timm's
     'TranslateYRel');
  2. TranslateY in ABSOLUTE pixels: `(level / _MAX_LEVEL) * translate_const` with
     `distort_image_with_autoaugment`'s `HParams(cutout_const=100, translate_const=250)` — 225 px
     at the table's level 9 — randomly negated; timm moves 0.45 of the side;
  3. the geometric ops resample NEAREST (`contrib_image.{transform,rotate,translate}`'s default; no
     interpolation argument is passed) — a rotated image contains only source pixel values and the
     fill — at the `wrap`/`unwrap` replace value 128 (timm: PIL bicubic at img_mean);
  4. Posterize through TF's shift ops, whose kernels clamp a shift to the bit width minus one, so
     `posterize(image, 0)` keeps the top bit (timm/PIL: a black image); the TF clamp is MEASURED
     here on `tf.bitwise.right_shift` itself, not assumed;
  5. the level mappings TF's `level_to_arg` gives: enhance `(l/10)·1.8 + 0.1`, shear `(l/10)·0.3`,
     rotate `(l/10)·30`, Posterize `int((l/10)·4)`, Solarize `int((l/10)·256)`, SolarizeAdd
     `int((l/10)·110)`.

Our side is exec'd out of the generated file (the `_AA_MAX … def _imagenet_decode_random_crop_flip`
block, as the timm check does), never restated. `--control` runs the same checks on a timm-form
file (the committed B0 trainer before 2026-10-12, or any `autoAugmentV0` file without
`autoAugmentTf`) and must report failures on rows 2–4.
"""
import argparse, os, subprocess, sys, tempfile
import numpy as np
os.environ.setdefault("TF_CPP_MIN_LOG_LEVEL", "3")
os.environ.setdefault("CUDA_VISIBLE_DEVICES", "")
import tensorflow as tf

ROOT = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
DEFAULT = "jax/generated/generated_efficientnet_b0_imagenet_full.py"

# tensorflow/tpu models/official/efficientnet/autoaugment.py `policy_v0()`, verbatim order.
TF_POLICY_V0 = [
    [('Equalize', 0.8, 1), ('ShearY', 0.8, 4)],
    [('Color', 0.4, 9), ('Equalize', 0.6, 3)],
    [('Color', 0.4, 1), ('Rotate', 0.6, 8)],
    [('Solarize', 0.8, 3), ('Equalize', 0.4, 7)],
    [('Solarize', 0.4, 2), ('Solarize', 0.6, 2)],
    [('Color', 0.2, 0), ('Equalize', 0.8, 8)],
    [('Equalize', 0.4, 8), ('SolarizeAdd', 0.8, 3)],
    [('ShearX', 0.2, 9), ('Rotate', 0.6, 8)],
    [('Color', 0.6, 1), ('Equalize', 1.0, 2)],
    [('Invert', 0.4, 9), ('Rotate', 0.6, 0)],
    [('Equalize', 1.0, 9), ('ShearY', 0.6, 3)],
    [('Color', 0.4, 7), ('Equalize', 0.6, 0)],
    [('Posterize', 0.4, 6), ('AutoContrast', 0.4, 7)],
    [('Solarize', 0.6, 8), ('Color', 0.6, 9)],
    [('Solarize', 0.2, 4), ('Rotate', 0.8, 9)],
    [('Rotate', 1.0, 7), ('TranslateY', 0.8, 9)],
    [('ShearX', 0.0, 0), ('Solarize', 0.8, 4)],
    [('ShearY', 0.8, 0), ('Color', 0.6, 4)],
    [('Color', 1.0, 0), ('Rotate', 0.6, 2)],
    [('Equalize', 0.8, 4), ('Equalize', 0.0, 8)],
    [('Equalize', 1.0, 4), ('AutoContrast', 0.6, 2)],
    [('ShearY', 0.4, 7), ('SolarizeAdd', 0.6, 7)],
    [('Posterize', 0.8, 2), ('Solarize', 0.6, 10)],
    [('Solarize', 0.6, 8), ('Equalize', 0.6, 1)],
    [('Color', 0.8, 6), ('Rotate', 0.4, 5)],
]
TRANSLATE_CONST = 250.0   # distort_image_with_autoaugment: HParams(cutout_const=100, translate_const=250)
FILL = 128                # build_and_apply_nas_policy: replace_value = [128, 128, 128]


def load_block(path):
    src = open(path).read().split("\n")
    a = next(i for i, l in enumerate(src) if l.startswith("_AA_MAX"))
    b = next(i for i, l in enumerate(src) if l.startswith("def _imagenet_decode_random_crop_flip"))
    g = {"tf": tf, "os": os, "np": np}
    exec("\n".join(src[a:b]), g)
    return g


rng = np.random.default_rng(0)
IMG = rng.integers(0, 256, (64, 64, 3), dtype=np.uint8)


def check(g, label):
    bad = []
    # 1. the table, TF's names
    ours = [[(n, float(p), int(m)) for n, p, m in sp] for sp in g["_AA_POLICY"]]
    theirs = [[(n, float(p), int(m)) for n, p, m in sp] for sp in TF_POLICY_V0]
    if ours != theirs:
        nrow = sum(1 for o, t in zip(ours, theirs) if o != t) + abs(len(ours) - len(theirs))
        bad.append(f"table: {nrow} sub-policies differ from TF's policy_v0 (names included)")
    ops = g["_AA_OPS"]
    # 2. TranslateY: absolute pixels, (l/10)*250, randomly negated
    if "TranslateY" not in ops:
        bad.append("no 'TranslateY' op (timm's 'TranslateYRel'?)")
    else:
        fn, argfn, signed = ops["TranslateY"]
        want = [m / 10.0 * TRANSLATE_CONST for m in range(11)]
        got = [float(argfn(m)) for m in range(11)]
        if not np.allclose(got, want, atol=1e-6):
            bad.append(f"TranslateY level->px: got {got[9]:.3f} at level 9, TF {want[9]:.1f} (translate_const 250, absolute)")
        if not signed:
            bad.append("TranslateY is not randomly negated")
        # the op itself: an integer shift by 25 px moves rows exactly and fills with 128
        out = np.asarray(fn(tf.constant(IMG), tf.constant(25.0)))
        moved = out[25:] if np.array_equal(out[25:], IMG[:-25]) else (out[:-25] if np.array_equal(out[:-25], IMG[25:]) else None)
        vac = out[:25] if moved is not None and np.array_equal(out[25:], IMG[:-25]) else out[-25:]
        if moved is None:
            bad.append("TranslateY by 25 px does not move rows by exactly 25 (not nearest / not pixels)")
        elif not np.all(vac == FILL):
            bad.append(f"TranslateY fill is not {FILL} (got {np.unique(vac)[:4]})")
    # 3. NEAREST: a 7° rotation emits only source pixel values and the fill
    fn, argfn, _ = ops["Rotate"]
    out = np.asarray(fn(tf.constant(IMG), tf.constant(7.0)))
    srcvals = {tuple(v) for v in IMG.reshape(-1, 3)} | {(FILL, FILL, FILL)}
    stray = sum(1 for v in out.reshape(-1, 3) if tuple(v) not in srcvals)
    if stray:
        bad.append(f"Rotate interpolates ({stray} output pixels are not source pixels or the fill): not NEAREST")
    fillpx = int(np.sum(np.all(out == FILL, axis=-1)))
    if fillpx == 0:
        bad.append("Rotate by 7° leaves no fill pixels, or the fill is not 128")
    # 4. Posterize: TF's clamp — measured on the op, then on the emitted function at 0 bits
    x = tf.constant(np.arange(256, dtype=np.uint8))
    rs = np.asarray(tf.bitwise.right_shift(x, tf.constant(8, tf.uint8)))
    if not np.array_equal(rs, np.arange(256, dtype=np.uint8) >> 7):
        bad.append("tf.bitwise.right_shift by 8 on uint8 does not clamp to 7 in this TF — the posterize claim moved")
    pfn = ops["Posterize"][0]
    p0 = np.asarray(pfn(tf.constant(IMG), 0))
    if not np.array_equal(p0, IMG & 0x80):
        bad.append("Posterize at 0 bits is not the top bit (timm's black image?)")
    p2 = np.asarray(pfn(tf.constant(IMG), 2))
    if not np.array_equal(p2, IMG & 0xC0):
        bad.append("Posterize at 2 bits is not the top two bits")
    # 5. level mappings, TF's level_to_arg
    want = {
        "Color": lambda l: l / 10 * 1.8 + 0.1, "Posterize": lambda l: int(l / 10 * 4),
        "Solarize": lambda l: int(l / 10 * 256), "SolarizeAdd": lambda l: int(l / 10 * 110),
        "Rotate": lambda l: l / 10 * 30.0, "ShearX": lambda l: l / 10 * 0.3, "ShearY": lambda l: l / 10 * 0.3,
    }
    for name, f in want.items():
        argfn = ops[name][1]
        got = [float(argfn(m)) for m in range(11)]
        if not np.allclose(got, [f(m) for m in range(11)], atol=1e-6):
            bad.append(f"{name} level->arg differs from TF's level_to_arg (level 9: ours {got[9]}, TF {f(9)})")
    return bad


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("path", nargs="?", default=DEFAULT)
    ap.add_argument("--control", help="a timm-form file; the checks must FAIL on it")
    a = ap.parse_args()
    path = a.path if os.path.isabs(a.path) else os.path.join(ROOT, a.path)
    bad = check(load_block(path), "ours")
    for b in bad:
        print(f"  ⛔ {b}")
    if bad:
        sys.exit(f"⛔ {os.path.relpath(path, ROOT)}: {len(bad)} row(s) differ from TF TPU EfficientNet's autoaugment.py")
    print(f"✅ {os.path.relpath(path, ROOT)}: the v0 table, TranslateY at (l/10)·250 px, NEAREST at fill 128, TF's posterize and level mappings")
    if a.control:
        cpath = a.control if os.path.isabs(a.control) else os.path.join(ROOT, a.control)
        cbad = check(load_block(cpath), "control")
        if len(cbad) < 3:
            sys.exit(f"⛔ control {os.path.relpath(cpath, ROOT)} came out green on {3 - len(cbad)} of the rows that separate TF's form from timm's — the gate is blind")
        print(f"✅ control {os.path.relpath(cpath, ROOT)}: red on {len(cbad)} row(s), as a timm-form file must be")


if __name__ == "__main__":
    main()
