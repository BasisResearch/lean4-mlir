#!/usr/bin/env python3
"""The MobileNetV2 shim (TF-slim's pipeline)'s first batch, hashed: reproducible at one seed, distinct at another (the
SHIM_DETERMINISM=1 replay the repeated_aug / bce_target gates use; the mixing-off leg of mixup_gate.py
does not apply to a shim that mixes nothing). Usage: .venv/bin/python shim_hash.py <shim.py>"""
import hashlib, os, subprocess, sys
import numpy as np
script = sys.argv[1]
def first_batch(seed):
    e = dict(os.environ); e.update(SHIM_DETERMINISM="1", SHIM_BATCH="8", SHIM_SEED=str(seed),
                                   SHIM_NCLASSES="1000", SHIM_MIX="off", CUDA_VISIBLE_DEVICES="")
    p = subprocess.Popen([sys.executable, script], stdout=subprocess.PIPE, stderr=subprocess.DEVNULL, env=e)
    def rd(n):
        buf = b""
        while len(buf) < n:
            c = p.stdout.read(n - len(buf))
            if not c: raise SystemExit(f"shim closed early ({len(buf)}/{n} bytes)")
            buf += c
        return buf
    assert rd(4) == b"LMSH", "bad preamble magic"
    ver, batch, flat, nc = np.frombuffer(rd(16), dtype=np.int32)
    rows = int(np.frombuffer(rd(4), dtype=np.int32)[0])
    t = rd(4 * batch * nc); x = rd(4 * batch * flat)
    p.kill()
    return int(flat), hashlib.sha256(t + x).hexdigest()[:16]
f0, a = first_batch(0); _, b = first_batch(0); _, c = first_batch(1)
print(f"flat={f0} (= 3*224*224: {f0 == 3*224*224})  seed0={a}  seed0_again={b}  seed1={c}")
print("REPRODUCIBLE" if a == b else "NOT REPRODUCIBLE", "/", "SEED-DISTINCT" if a != c else "SEED-INDISTINCT")
