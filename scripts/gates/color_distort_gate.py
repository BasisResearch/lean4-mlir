#!/usr/bin/env python3
"""TF-slim's `distort_color` (fast mode) as the emitted pipeline runs it, against a numpy twin.

`TrainConfig.colorDistortSlim` (planning/recipe_prep.md §6, `imagenet_parity.md` D12) emits, after
the crop, the resize and the flip, on the image in [0, 1]:

    img = tf.image.random_brightness(img, 32. / 255.)
    img = tf.image.random_saturation(img, 0.5, 1.5)
    img = tf.clip_by_value(img, 0.0, 1.0)

— `inception_preprocessing.distort_color(image, color_ordering=0, fast_mode=True)`, the one branch
`train_image_classifier.py` ever ran for MobileNetV2 (it passes no `fast_mode`, so the default;
`num_distort_cases = 1`, so `color_ordering` is always 0). The hue / contrast ops and the four
orderings are the NON-fast mode, which the recipe did not use.

## What is tied, and against what

`random_brightness` / `random_saturation` draw a scalar and call `adjust_brightness` /
`adjust_saturation`; the second is a C++ kernel (`adjust_saturation_op.cc`): RGB → HSV, `S` scaled and
CLAMPED to [0, 1], HSV → RGB. The twin below is that kernel in numpy — written from its source, not
from `tf.image.rgb_to_hsv` — and is itself checked against `tf.image.adjust_saturation` first, so a
wrong transcription fails before it is used as a reference.

Then the EMITTED `_imagenet_decode_random_crop_flip` is executed verbatim, with its three random
ops replaced by deterministic ones (the whole image for the crop, no flip, a fixed δ and a fixed
scale) and compared with the twin's `clip(saturate(decoded/255 + δ, f))` at several (δ, f). Nothing
in the function's text is edited: the replacement is of `tf.image.*` symbols in the namespace it
runs in. At a 224 × 224 source the crop is the whole image and the resize is the identity (bilinear
and bicubic both are, at scale 1), so the decoded pixels ARE the twin's input.

Controls, as every gate here carries them: the two ops in the other order, and a different scale,
both measurably far from the emitted result; and the text itself — `/ 255.0` before, brightness
before saturation before the clip, all inside the one function.

⚠ The order control only has teeth at a scale ABOVE 1. Found while writing it: `adjust_saturation`
returns `v + f·range·(w − 1)` per channel (`w` the sector weight, from the hue), which is linear in
`v` with coefficient 1, so adding δ to every channel commutes with it EXACTLY — unless the clamp
`min(1, s·f)` engages, which needs `s·f > 1`. At slim's lower bound 0.5 the two orders are the same
function to f32 round-off (measured 2.4e-7); at the upper bound 1.5 they differ by up to 0.13 of
full scale on this image. So the control runs at 1.5, and the text check is what pins the order at
every scale.

    scripts/gates/color_distort_gate.py jax/generated/generated_mobilenet_v2_imagenet_full.py
    scripts/gates/color_distort_gate.py jax/.lake/build/generated_mobilenet_v2_imagenet_shim.py
"""
import os, re, sys, types
import numpy as np

os.environ.setdefault("TF_CPP_MIN_LOG_LEVEL", "2")
os.environ.setdefault("CUDA_VISIBLE_DEVICES", "")
import tensorflow as tf  # noqa: E402

RTOL = 2e-5     # f32: the /255 · 255 round trip and the kernel's own summation order


# ── the numpy twin of TF's adjust_saturation kernel ─────────────────────────────────────────
def rgb_to_hsv(rgb):
    r, g, b = rgb[..., 0], rgb[..., 1], rgb[..., 2]
    vmax = np.maximum(r, np.maximum(g, b))
    vmin = np.minimum(r, np.minimum(g, b))
    rng = vmax - vmin
    s = np.where(vmax > 0, rng / np.where(vmax > 0, vmax, 1.0), 0.0)
    with np.errstate(divide="ignore", invalid="ignore"):
        norm = 1.0 / (6.0 * rng)
        h = np.where(r == vmax, norm * (g - b),
                     np.where(g == vmax, norm * (b - r) + 2.0 / 6.0, norm * (r - g) + 4.0 / 6.0))
    h = np.where(rng <= 0, 0.0, h)
    h = np.where(h < 0, h + 1.0, h)
    return h.astype(np.float32), s.astype(np.float32), vmax.astype(np.float32)


def hsv_to_rgb(h, s, v):
    c = s * v
    m = v - c
    dh = h * 6.0
    cat = dh.astype(np.int32)
    fmodu = np.mod(dh, 2.0)            # the kernel's two `while` loops, into [0, 2)
    x = c * (1.0 - np.abs(fmodu - 1.0))
    zero = np.zeros_like(c)
    rr = np.select([cat == 0, cat == 1, cat == 2, cat == 3, cat == 4, cat == 5], [c, x, zero, zero, x, c], zero)
    gg = np.select([cat == 0, cat == 1, cat == 2, cat == 3, cat == 4, cat == 5], [x, c, c, x, zero, zero], zero)
    bb = np.select([cat == 0, cat == 1, cat == 2, cat == 3, cat == 4, cat == 5], [zero, zero, x, c, c, x], zero)
    return np.stack([rr + m, gg + m, bb + m], axis=-1).astype(np.float32)


def np_adjust_saturation(rgb, scale):
    h, s, v = rgb_to_hsv(rgb.astype(np.float32))
    s = np.minimum(1.0, np.maximum(0.0, s * np.float32(scale))).astype(np.float32)
    return hsv_to_rgb(h, s, v)


def np_adjust_brightness(rgb, delta):
    return (rgb.astype(np.float32) + np.float32(delta)).astype(np.float32)   # no clip: TF's float path


def np_distort_color_fast(rgb01, delta, scale):
    """slim's fast-mode `distort_color` at `color_ordering = 0`: brightness, saturation, clip."""
    x = np_adjust_brightness(rgb01, delta)
    x = np_adjust_saturation(x, scale)
    return np.clip(x, 0.0, 1.0).astype(np.float32)


# ── the emitted function, run verbatim with its randomness pinned ───────────────────────────
def extract_decode_fn(path):
    src = open(path).read().split("\n")
    i0 = next(i for i, l in enumerate(src) if l.startswith("def _imagenet_decode_random_crop_flip"))
    i1 = next(i for i in range(i0 + 1, len(src)) if src[i].startswith("    return img"))
    body = src[i0:i1 + 1]
    consts = {}
    for name in ("_IMG_SIZE", "_TRAIN_SIZE", "_CROP_PADDING"):
        for l in src:
            if l.startswith(name + " "):
                consts[name] = eval(l.split("=", 1)[1].split("#")[0].strip())
                break
    return "\n".join(body), consts, body


def make_tf_proxy(delta, scale, calls):
    """`tf` with the three random ops pinned. Everything else resolves to the real module."""
    class ImageProxy:
        def __getattr__(self, n): return getattr(tf.image, n)
        def sample_distorted_bounding_box(self, shape, **kw):
            calls.append(("crop", dict(kw)))
            return (tf.stack([0, 0, 0]), tf.stack([shape[0], shape[1], 3]), None)
        def random_flip_left_right(self, img, seed=None):
            calls.append(("flip", {})); return img
        def random_brightness(self, img, max_delta, seed=None):
            calls.append(("brightness", {"max_delta": float(max_delta)}))
            return tf.image.adjust_brightness(img, delta)
        def random_saturation(self, img, lower, upper, seed=None):
            calls.append(("saturation", {"lower": float(lower), "upper": float(upper)}))
            return tf.image.adjust_saturation(img, scale)
    class TFProxy:
        image = ImageProxy()
        def __getattr__(self, n): return getattr(tf, n)
    return TFProxy()


def run_emitted(body, consts, image_bytes, delta, scale):
    calls = []
    ns = {"tf": make_tf_proxy(delta, scale, calls), "np": np, "_AUG_SEED": None, **consts}
    exec(body, ns)
    out = ns["_imagenet_decode_random_crop_flip"](image_bytes)
    return np.asarray(out, dtype=np.float32), calls


def main():
    if len(sys.argv) < 2:
        sys.exit(__doc__)
    path = sys.argv[1]
    body, consts, lines = extract_decode_fn(path)
    print(f"── TF-slim distort_color (fast mode) tie — {path} ──")

    # ① the text: /255 before, brightness before saturation before the clip, the slim constants
    txt = [l.split("#")[0] for l in lines]
    def idx(pat):
        hits = [i for i, l in enumerate(txt) if pat in l]
        assert len(hits) == 1, f"{pat!r}: {len(hits)} hits in _imagenet_decode_random_crop_flip"
        return hits[0]
    i_div = idx("img = img / 255.0")
    i_br = idx("tf.image.random_brightness(img, 32. / 255.)")
    i_sat = idx("tf.image.random_saturation(img, 0.5, 1.5)")
    i_clip = idx("tf.clip_by_value(img, 0.0, 1.0) * 255.0")
    i_flip = idx("random_flip_left_right")
    assert i_flip < i_div < i_br < i_sat < i_clip, "slim's order is flip, /255, brightness, saturation, clip"
    assert not any("random_hue" in l or "random_contrast" in l for l in txt), "hue/contrast are the non-fast mode"
    print("  ✓ text: flip → /255 → brightness ±32/255 → saturation ×[0.5, 1.5] → clip → ×255; no hue, no contrast")

    # ② the twin against TF's own kernel, on random pixels (the transcription check)
    rng = np.random.default_rng(20261012)
    px = rng.random((64, 64, 3), dtype=np.float32)
    px[0, :8] = px[0, :1]                     # some grey rows (range 0): the h = 0 branch
    worst = 0.0
    for sc in (0.0, 0.5, 0.9, 1.0, 1.5, 2.5):
        ref = np.asarray(tf.image.adjust_saturation(tf.constant(px), sc))
        got = np_adjust_saturation(px, sc)
        worst = max(worst, float(np.max(np.abs(got - ref))))
    assert worst < 1e-5, f"numpy adjust_saturation is not TF's kernel: max |Δ| {worst:.2e}"
    print(f"  ✓ twin: numpy adjust_saturation = tf.image.adjust_saturation to {worst:.1e} over six scales")

    # ③ the emitted function, verbatim, at pinned draws, against the twin
    size = consts.get("_TRAIN_SIZE", consts["_IMG_SIZE"])
    yy, xx = np.mgrid[0:size, 0:size].astype(np.float32) / size
    img = np.stack([xx, yy, 0.5 + 0.5 * np.sin(6.28 * xx * yy)], axis=-1)
    img = np.clip(img * 255 + rng.normal(0, 8, img.shape), 0, 255).astype(np.uint8)
    jpeg = tf.io.encode_jpeg(tf.constant(img), quality=95).numpy()
    decoded = np.asarray(tf.io.decode_jpeg(jpeg, channels=3)).astype(np.float32)
    # the crop at the whole window must be the same decode: a control on the identity premise
    whole = np.asarray(tf.io.decode_and_crop_jpeg(jpeg, [0, 0, size, size], channels=3)).astype(np.float32)
    assert np.array_equal(decoded, whole), "decode_and_crop_jpeg at the whole window ≠ decode_jpeg"
    worst = 0.0
    for delta, scale in ((0.0, 1.0), (32.0 / 255.0, 0.5), (-32.0 / 255.0, 1.5), (0.1, 1.2), (-0.05, 0.7)):
        got, calls = run_emitted(body, consts, jpeg, delta, scale)
        kinds = [k for k, _ in calls]
        assert kinds == ["crop", "flip", "brightness", "saturation"], kinds
        assert abs(calls[2][1]["max_delta"] - 32.0 / 255.0) < 1e-9
        assert calls[3][1] == {"lower": 0.5, "upper": 1.5}
        want = np_distort_color_fast(decoded / 255.0, delta, scale) * 255.0
        rel = float(np.max(np.abs(got - want))) / 255.0
        worst = max(worst, rel)
        print(f"    δ={delta:+.4f} scale={scale:.2f}: max |Δ|/255 = {rel:.2e}")
    assert worst <= RTOL, f"emitted ≠ twin: {worst:.2e} > {RTOL:g}"
    print(f"  ✓ emitted _imagenet_decode_random_crop_flip = twin to {worst:.1e} at five (δ, scale)")

    # ④ controls: the other order, and the wrong scale, must be far from the emitted result
    delta, scale = 32.0 / 255.0, 1.5     # the clamp must engage for the order to show: see the header
    got, _ = run_emitted(body, consts, jpeg, delta, scale)
    swapped = np.clip(np_adjust_brightness(np_adjust_saturation(decoded / 255.0, scale), delta), 0, 1) * 255.0
    other = np_distort_color_fast(decoded / 255.0, delta, 0.5) * 255.0
    d_swap = float(np.max(np.abs(got - swapped))) / 255.0
    d_other = float(np.max(np.abs(got - other))) / 255.0
    assert d_swap > 1e-3 and d_other > 1e-2, f"controls dead: swapped {d_swap:.2e}, other scale {d_other:.2e}"
    print(f"  ✓ controls at scale 1.5: saturation-then-brightness differs by {d_swap:.2e}, scale 0.5 by {d_other:.2e}")
    print("✓ colour distortion is slim's fast-mode distort_color")
    return 0


if __name__ == "__main__":
    sys.exit(main())
