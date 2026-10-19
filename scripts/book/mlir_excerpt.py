#!/usr/bin/env python3
"""Cut named SSA ops out of a verified_mlir/ artifact, re-wrapped for a book listing.

    python3 scripts/book/mlir_excerpt.py verified_mlir/cnn_train_step.mlir v62 v63 v64 ... v53

A `...` argument prints a `// ...` elision line. The output pastes into a `verbatim` block as is:
book_listings.py joins wrapped lines back into ops the same way (MLIR_NEW), drops the same
`precision` default and skips `//` lines, so what this prints is what the gate accepts.

Logical lines are joined as the artifact has them (continuations start with anything but
`%name =`, `return`, `^`, `}`, `//`), the default `precision = [DEFAULT, DEFAULT]` is dropped,
and each is wrapped at WIDTH with a CONT-space hanging indent at preferred break points.
"""
import re, sys
WIDTH, CONT = 76, 6
NEW = re.compile(r'^\s*(%\w+\s*=|return\b|stablehlo\.return\b|\^|\}|func\.func|module|//)')
BREAKS = [' : (', ' -> ', ' applies ', ' dim_numbers', ' window', ' {batch_group_count', ', ']

def logical(path):
    out = []
    for l in open(path):
        if not l.strip(): continue
        if NEW.match(l) or not out: out.append(l.strip())
        else: out[-1] += ' ' + l.strip()
    return out

def wrap(s):
    s = s.replace(', precision = [DEFAULT, DEFAULT]', '')
    lines, cur = [], s
    while len(cur) > WIDTH - (CONT if lines else 0):
        limit = WIDTH - (CONT if lines else 0)
        best = -1
        for b in BREAKS:
            p = cur.rfind(b, 0, limit)
            while p > 0 and (b == ', ' and (cur[:p].count('[') > cur[:p].count(']') or cur[:p].count('<') > cur[:p].count('>'))):
                p = cur.rfind(b, 0, p)
            if b == ', ': p = p + 1 if p > 0 else -1   # keep the comma on the upper line
            if p > best: best = p
        if best <= 0: best = cur.rfind(' ', 0, limit)
        if best <= 0: break
        lines.append(cur[:best].rstrip()); cur = cur[best:].lstrip()
    lines.append(cur)
    return [lines[0]] + [' ' * CONT + l for l in lines[1:]]

path, names = sys.argv[1], sys.argv[2:]
ops = {m.group(1): l for l in logical(path) for m in [re.match(r'%(\w+)\s*=', l)] if m}
for n in names:
    if n == '...': print('// ...'); continue
    if n not in ops: sys.exit(f'no %{n} in {path}')
    print('\n'.join(wrap(ops[n])))
