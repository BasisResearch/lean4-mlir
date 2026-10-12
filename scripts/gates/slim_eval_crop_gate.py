#!/usr/bin/env python3
"""TF-slim's `preprocess_for_eval` as the emitted eval decode runs it, against TF's own ops and a numpy twin.

`TrainConfig.evalCropSlim` with `evalCropTf` and `resizeLegacyTf1` (planning/recipe_prep.md §6,
`imagenet_parity.md` D23) emits MobileNetV2's validation decode as

    img = tf.io.decode_jpeg(image_bytes, channels=3)                   # whole, as slim's decoder did
    oy = int((h - h * _CROP_PCT) / 2) in float64, ox likewise          # tf.image.central_crop's arithmetic
    img = tf.image.crop_to_bounding_box(img, oy, ox, h - 2*oy, w - 2*ox)
    return tf.compat.v1.image.resize_bilinear([img], [_IMG_SIZE, _IMG_SIZE])[0]

Found by this gate's first run: `tf.io.decode_and_crop_jpeg` (TF TPU EfficientNet's and tf-models' own
call, which the `evalCropTf` forms keep) is NOT the whole decode's window when the window is not
iMCU-aligned — one column differs, by up to ~20 grey levels, which the resize then spreads. slim's
dataset decoder decoded whole and `central_crop` cut the tensor, so the emitted form decodes whole.

— `inception_preprocessing.preprocess_for_eval(image, 224, 224, central_fraction=0.875)`, the validation
`research/slim/nets/mobilenet/README.md`'s command scores through: `tf.image.central_crop(0.875)` keeps the
centred 0.875 of BOTH sides (the JPEG's own aspect), then `tf.image.resize_bilinear` (TF 1: no antialias,
`half_pixel_centers=False`) takes the window to the square, which does not keep it. The pipeline then
normalises by (x − 127.5) / 127.5 = slim's (x / 255 − 0.5) · 2. tf-models' form (`evalCropTf` alone,
MobileNetV4) crops a square of the SHORTER side; timm's (every other pair) resizes the short side first.

## What is tied, and against what

① TF's own ops in slim's text — `decode_jpeg → convert_image_dtype → central_crop(0.875) →
   resize_bilinear → (x − 0.5) · 2` — against the EMITTED `_imagenet_decode_center_crop`, executed
   verbatim from the generated module (its `tf` the real module) and followed by the pipeline's
   normalisation, on JPEGs at eight shapes: odd and even sides, portrait, landscape, square, a strip, an
   upsample. Pass: max |Δ| ≤ 1e-4 of the [−1, 1] range (the scaling order moves f32 rounding only).
② A numpy twin of TF 1's bilinear grid — `src = dst · in / out`, `floor`, `min(lo + 1, in − 1)`, the
   lerp — on `central_crop`'s window, against the emitted result in grey levels. Pass: max |Δ| ≤ 0.05.
   This is the check with teeth: TF 2's `tf.image.resize` centres the grid on half pixels instead.

Controls, which must go red (max |Δ| > 1 grey level on some shape): TF 2's `tf.image.resize(BILINEAR,
antialias=False)` in the legacy kernel's place; timm's `_imagenet_decode_center_crop_timm` from the same
module; tf-models' shorter-side square resized by TF 2's bilinear (the MobileNetV4 form). The text
itself: `tf.compat.v1.image.resize_bilinear` and `(hd - hd * _CROP_PCT) / 2` inside the eval decode,
`_CROP_PCT` at 0.875, timm's form present under the `_timm` name for `SHIM_EVAL_SIZE` / `PROTOCOL=timm`.

Usage:
    .venv/bin/python scripts/gates/slim_eval_crop_gate.py jax/generated/generated_mobilenet_v2_imagenet_full.py \
        [jax/generated/generated_mobilenet_v2_imagenet_full_shim.py ...]
"""
import os, sys
import numpy as np
os.environ.setdefault("TF_CPP_MIN_LOG_LEVEL", "3")
import tensorflow as tf

SHAPES = [(375, 500), (500, 375), (333, 499), (224, 224), (257, 257), (120, 1600), (100, 100), (480, 640)]
FRACTION = 0.875


def make_jpegs(seed=0):
    rng = np.random.default_rng(seed)
    out = []
    for h, w in SHAPES:
        yy, xx = np.mgrid[0:h, 0:w].astype(np.float32)
        base = np.stack([127 + 100 * np.sin(yy / 23.0 + xx / 31.0),
                         127 + 100 * np.cos(xx / 17.0 - yy / 41.0),
                         127 + 100 * np.sin((xx + yy) / 13.0)], -1)
        img = np.clip(base + rng.normal(0, 40, size=(h, w, 3)), 0, 255).astype(np.uint8)
        out.append(((h, w), tf.io.encode_jpeg(img, quality=95).numpy()))
    return out


def extract_fn(src, name):
    """The emitted function NAME, def line through its first `    return`."""
    lines = src.split("\n")
    i0 = next(i for i, l in enumerate(lines) if l.startswith(f"def {name}("))
    i1 = next(i for i in range(i0 + 1, len(lines)) if lines[i].startswith("    return"))
    return "\n".join(lines[i0:i1 + 1])


def load_module_bits(path):
    src = open(path).read()
    ns = {"tf": tf, "np": np}
    for name in ("_IMG_SIZE", "_CROP_PADDING", "_CROP_PCT", "_MEAN_RGB", "_STD_RGB"):
        line = next(l for l in src.split("\n") if l.startswith(name + " "))
        exec(line.split("#")[0], ns)
    body = extract_fn(src, "_imagenet_decode_center_crop")
    timm_body = extract_fn(src, "_imagenet_decode_center_crop_timm")
    exec(body, ns); exec(timm_body, ns)
    return src, ns, body


def slim_reference(b, size):
    img = tf.image.convert_image_dtype(tf.io.decode_jpeg(b, channels=3), tf.float32)
    img = tf.image.central_crop(img, FRACTION)
    img = tf.compat.v1.image.resize_bilinear(img[None], [size, size])[0]
    return ((img - 0.5) * 2.0).numpy()


def legacy_bilinear_np(x, out_h, out_w):
    """TF 1's ResizeBilinear grid (align_corners=False, half_pixel_centers=False), in float64."""
    in_h, in_w = x.shape[:2]
    def grid(n_in, n_out):
        src = np.arange(n_out, dtype=np.float64) * (n_in / n_out)
        lo = np.floor(src).astype(np.int64)
        hi = np.minimum(lo + 1, n_in - 1)
        return lo, hi, (src - lo)[:, None]
    ylo, yhi, ty = grid(in_h, out_h)
    xlo, xhi, tx = grid(in_w, out_w)
    x = x.astype(np.float64)
    top = x[ylo][:, xlo] * (1 - tx) + x[ylo][:, xhi] * tx
    bot = x[yhi][:, xlo] * (1 - tx) + x[yhi][:, xhi] * tx
    return top * (1 - ty[:, :, None].reshape(out_h, 1, 1)) + bot * ty[:, :, None].reshape(out_h, 1, 1)


def central_window_np(arr):
    h, w = arr.shape[:2]
    oy = int((float(h) - float(h) * FRACTION) / 2)
    ox = int((float(w) - float(w) * FRACTION) / 2)
    return arr[oy:h - oy, ox:w - ox]


def tfmodels_square(b, size):
    """tf-models' center_crop_image_v2 + resize_image (the MobileNetV4 form): a square of the shorter side."""
    shape = tf.cast(tf.io.extract_jpeg_shape(b), tf.float32)
    cs = FRACTION * tf.minimum(shape[0], shape[1])
    off = tf.cast((shape - cs) / 2.0, tf.int32)
    csi = tf.cast(cs, tf.int32)
    img = tf.io.decode_and_crop_jpeg(b, tf.stack([off[0], off[1], csi, csi]), channels=3)
    return tf.image.resize(img, [size, size], method=tf.image.ResizeMethod.BILINEAR, antialias=False).numpy()


def check_file(path, jpegs):
    print(f"── TF-slim preprocess_for_eval tie — {path} ──")
    src, ns, body = load_module_bits(path)
    size = ns["_IMG_SIZE"]
    ok = True

    # the text
    for pat, where in (("tf.compat.v1.image.resize_bilinear", body), ("(hd - hd * _CROP_PCT) / 2", body),
                       ("preprocess_for_eval (evalCropSlim)", body), ("def _imagenet_decode_center_crop_timm(", src)):
        hit = pat in where
        ok &= hit
        print(f"   text  {'✅' if hit else '❌'} {pat!r}")
    pct_ok = abs(ns["_CROP_PCT"] - FRACTION) < 1e-12
    ok &= pct_ok
    print(f"   text  {'✅' if pct_ok else '❌'} _CROP_PCT = {ns['_CROP_PCT']} (slim's central_fraction 0.875)")
    mean_ok = np.allclose(ns["_MEAN_RGB"].numpy(), 127.5) and np.allclose(ns["_STD_RGB"].numpy(), 127.5)
    ok &= mean_ok
    print(f"   text  {'✅' if mean_ok else '❌'} _MEAN_RGB / _STD_RGB = 127.5 (slim's (x/255 − 0.5)·2)")

    emitted = ns["_imagenet_decode_center_crop"]
    timm_fn = ns["_imagenet_decode_center_crop_timm"]
    w1 = w2 = 0.0
    c_tf2 = c_timm = c_models = 0.0
    print(f"   {'shape':>10}  ① slim ops [−1,1]   ② TF1 twin (grey)   ctrl TF2 half-pixel   ctrl timm   ctrl tf-models")
    for (h, w), b in jpegs:
        out = emitted(b).numpy()                                   # [0, 255] float32, size×size×3
        d1 = np.abs((out - 127.5) / 127.5 - slim_reference(b, size)).max()
        arr = tf.io.decode_jpeg(b, channels=3).numpy()
        win = central_window_np(arr)
        twin = legacy_bilinear_np(win, size, size)
        d2 = np.abs(out - twin).max()
        tf2 = tf.image.resize(win, [size, size], method=tf.image.ResizeMethod.BILINEAR, antialias=False).numpy()
        d_tf2 = np.abs(out - tf2).max()
        d_timm = np.abs(out - timm_fn(b).numpy()).max()
        d_models = np.abs(out - tfmodels_square(b, size)).max()
        w1, w2 = max(w1, d1), max(w2, d2)
        c_tf2, c_timm, c_models = max(c_tf2, d_tf2), max(c_timm, d_timm), max(c_models, d_models)
        print(f"   {h:>4}×{w:<5}  {d1:12.2e}        {d2:10.4f}         {d_tf2:10.2f}         {d_timm:8.2f}   {d_models:10.2f}")
    p1, p2 = w1 <= 1e-4, w2 <= 0.05
    r1, r2, r3 = c_tf2 > 1.0, c_timm > 1.0, c_models > 1.0
    ok &= p1 and p2 and r1 and r2 and r3
    print(f"   ① {'✅' if p1 else '❌'} max |Δ| {w1:.2e} ≤ 1e-4 against slim's own ops")
    print(f"   ② {'✅' if p2 else '❌'} max |Δ| {w2:.4f} ≤ 0.05 grey levels against the TF 1 grid twin")
    print(f"   controls {'✅' if (r1 and r2 and r3) else '❌'} red as required: TF2 half-pixel {c_tf2:.2f}, timm {c_timm:.2f}, tf-models {c_models:.2f} (> 1 grey level)")
    return ok


def main():
    if len(sys.argv) < 2:
        sys.exit(__doc__)
    jpegs = make_jpegs()
    ok = all([check_file(p, jpegs) for p in sys.argv[1:]])
    print("✅ slim eval crop gate: PASS" if ok else "❌ slim eval crop gate: FAIL")
    sys.exit(0 if ok else 1)


if __name__ == "__main__":
    main()
