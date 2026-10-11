#!/usr/bin/env python3
"""F3 gate: repeated augmentation's K copies sit ADJACENT in the stream (`TrainConfig.repeatedAugAdjacent`),
as timm's `RASampler` places them — its three indices of an image are consecutive, so the three
views land in the same optimizer step (planning/imagenet_parity.md F3).

Drives a generated shim exactly as `mixup_gate.py` does (`SHIM_MIX=off`, one-hot targets on the wire,
so a row's label is the argmax), reads a few train batches, and measures the fraction of adjacent
row pairs with equal labels. With K adjacent copies that fraction is (K−1)/K ≈ 0.667 for K = 3
(batch boundaries cost a little); a spread-across-batches stream reads ≈ 1/1000. Also holds that
adjacent equal-label rows are DIFFERENT images (independently augmented views, not one tensor
repeated), on every such pair.
CONTROL: the same shim with the re-shuffle put back — `--control synth` (the default) rewrites the
two `repeatedAugAdjacent` comment lines into the `ds.shuffle(…)` they replaced, in a temp copy — or
a shim emitted without the flag (`--control <path>`); it must read below 0.05, or the gate could not
see the shuffle creeping back. (Every RSB shim carries the flag since 2026-10-11, hence `synth`.)
Needs the tfds ImageNet under TFDS_DATA_DIR (the shim's own requirement); ~1 min a shim.
"""
import argparse, os, subprocess, sys, tempfile
import numpy as np

AP = argparse.ArgumentParser()
AP.add_argument("--script", default="jax/generated/generated_vit_tiny_imagenet_shim.py")
AP.add_argument("--control", default="synth",
                help="'synth': --script with its re-shuffle put back (default); a path: a shim with "
                     "repeatedAug > 1 and the flag OFF; '': skip the control")
AP.add_argument("--python", default=os.environ.get("SHIM_PY", ".venv/bin/python3"))
AP.add_argument("--batch", type=int, default=48)
AP.add_argument("--batches", type=int, default=3)
AP.add_argument("--nclasses", type=int, default=1000)
AP.add_argument("--img", type=int, default=224)
AP.add_argument("--k", type=int, default=3)
A = AP.parse_args()
FLAT = 3 * A.img * A.img

def stream(script):
    e = dict(os.environ); e.update(SHIM_DETERMINISM="1", SHIM_BATCH=str(A.batch), SHIM_SEED="0",
                                   SHIM_NCLASSES=str(A.nclasses), SHIM_MIX="off")
    p = subprocess.Popen([A.python, script], stdout=subprocess.PIPE, stderr=subprocess.DEVNULL, env=e)
    def rd(n):
        buf = b""
        while len(buf) < n:
            c = p.stdout.read(n - len(buf))
            if not c:
                raise SystemExit(f"shim {script} closed early ({len(buf)}/{n} bytes)")
            buf += c
        return buf
    assert rd(4) == b"LMSH", "bad preamble magic"
    ver, batch, flat, nc = np.frombuffer(rd(16), dtype=np.int32)
    assert (batch, flat, nc) == (A.batch, FLAT, A.nclasses), f"preamble {(ver, batch, flat, nc)}"
    out = []
    for _ in range(A.batches):
        rows = int(np.frombuffer(rd(4), dtype=np.int32)[0])
        assert rows == batch
        t = np.frombuffer(rd(4 * batch * nc), dtype=np.float32).reshape(batch, nc).copy()
        x = np.frombuffer(rd(4 * batch * flat), dtype=np.float32).reshape(batch, flat).copy()
        out.append((t.argmax(1), x))
    p.kill()
    return out

def adjacency(batches):
    eq = same = 0; pairs = 0
    for y, x in batches:
        for i in range(len(y) - 1):
            pairs += 1
            if y[i] == y[i + 1]:
                eq += 1
                if np.array_equal(x[i], x[i + 1]):
                    same += 1
    return eq / pairs, same

want = (A.k - 1) / A.k
frac, same = adjacency(stream(A.script))
ok = frac >= want - 0.1 and same == 0
print(f"{'✓' if ok else '⛔'} {os.path.basename(A.script)}: adjacent equal-label pairs {frac:.3f} "
      f"(want ≥ {want - 0.1:.2f} for K={A.k}); identical adjacent tensors: {same} (want 0)")
cok = True
if A.control:
    cpath, tmp = A.control, None
    if A.control == "synth":
        src = open(A.script).read()
        marker = "        # repeatedAugAdjacent: no re-shuffle"
        i = src.find(marker)
        if i < 0:
            sys.exit(f"⛔ {A.script} has no repeatedAugAdjacent block to put the shuffle back into")
        j = src.index("\n", src.index("\n", i) + 1) + 1          # the two comment lines
        src = src[:i] + "        ds = ds.shuffle(8192, seed=43, reshuffle_each_iteration=True)\n" + src[j:]
        tmp = tempfile.NamedTemporaryFile("w", dir=os.path.dirname(os.path.abspath(A.script)),
                                          prefix=".control_", suffix=".py", delete=False)
        tmp.write(src); tmp.close(); cpath = tmp.name
    try:
        cfrac, _ = adjacency(stream(cpath))
    finally:
        if tmp: os.unlink(tmp.name)
    cok = cfrac < 0.05
    label = "synth (the shim with its re-shuffle back)" if tmp else os.path.basename(A.control)
    print(f"{'✓' if cok else '⛔'} control {label}: {cfrac:.3f} (want < 0.05)")
sys.exit(0 if ok and cok else 1)
