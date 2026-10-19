#!/usr/bin/env python3
"""Every Lean-looking identifier the book sets in `\\texttt{}` must name a real declaration.

    python3 scripts/book/book_prose_idents.py          # exit 1 on an unresolved identifier
    python3 scripts/book/book_prose_idents.py --list   # print every candidate and its verdict

`blueprint-checkdecls` resolves the names in `\\lean{}` lines; the prose cites hundreds more
in `\\texttt{}` (`conv\\_back\\_bridge\\_1to2` survived two renames that way). A `\\texttt` token
is a candidate when it is a single dotted identifier with an underscore, a dot, or an interior
capital, is not an environment variable (all caps), a file, a flag or an MLIR op. It resolves
when the full name, or the name under any namespace, is a declaration in a `.ilean` under
`.lake/build/lib/lean` (this project) or `.lake/packages/*/.lake/build/lib/lean` (Mathlib and
the other dependencies) — so the oleans must be built first — or a namespace of one, or when
the token occurs verbatim in the project's own sources (LeanMlir/, Bestiary/, apps/, jax/,
demos/, tests/, scripts/, verified_mlir/): hypothesis names, render slugs, MLIR op names and
the Mathlib lemmas the proofs call all resolve that way, and a Mathlib lemma the book cites
but no proof uses is exactly the drift this catches. What is left over and not Lean lives in
scripts/gates/book_prose_idents_allow.txt, one per line.
"""
import glob, json, os, re, sys

TEX = 'blueprint/src/content.tex'
ALLOW = 'scripts/gates/book_prose_idents_allow.txt'
TT = re.compile(r'\\texttt\{((?:[^{}]|\{[^{}]*\})*)\}')
IDENT = re.compile(r"^[A-Za-z_][A-Za-z0-9_'.₀-₉]*$")
NOT_EXT = ('.lean', '.py', '.sh', '.mlir', '.md', '.json', '.tsv', '.yml', '.yaml', '.txt', '.log',
           '.c', '.h', '.conf', '.tex', '.csv', '.npz', '.png', '.jpg', '.pdf', '.so', '.html')

def candidates(tex):
    out = []
    for m in TT.finditer(tex):
        tok = m.group(1).replace('\\_', '_').replace('\\&', '&').replace('{}', '').replace('\\\\', '')
        tok = tok.strip().rstrip('.,;:')
        if not IDENT.match(tok): continue
        if tok.endswith(NOT_EXT) or '/' in tok: continue
        if tok.upper() == tok: continue                      # LEAN_MLIR_SEED, PJRT, …
        if '_' not in tok and '.' not in tok and not re.search(r'[a-z][A-Z]', tok): continue
        out.append((tex.count('\n', 0, m.start()) + 1, tok))
    return out

SRC_ROOTS = ['LeanMlir', 'Bestiary', 'apps', 'jax', 'demos', 'tests', 'scripts', 'verified_mlir', 'lakefile.lean']
SRC_EXT = ('.lean', '.py', '.sh', '.mlir', '.json', '.conf', '.yml', '.c', '.h')
WORD = re.compile(r"[A-Za-z_][A-Za-z0-9_'.]*")

def source_words():
    words = set()
    for root in SRC_ROOTS:
        paths = [root] if os.path.isfile(root) else glob.glob(os.path.join(root, '**', '*'), recursive=True)
        for p in paths:
            if not p.endswith(SRC_EXT) or not os.path.isfile(p): continue
            try: txt = open(p, errors='replace').read()
            except Exception: continue
            for w in WORD.findall(txt):
                words.add(w.rstrip('.'))
            base = os.path.basename(p)                     # render slugs: verified_mlir/<slug>_train_step.mlir
            words.add(base); words.add(base.rsplit('.', 1)[0])
            for suffix in ('_train_step', '_fwd_eval', '_fwd'):
                if base.rsplit('.', 1)[0].endswith(suffix): words.add(base.rsplit('.', 1)[0][: -len(suffix)])
    return words

def index():
    names = set(); shorts = set()
    roots = ['.lake/build/lib/lean'] + glob.glob('.lake/packages/*/.lake/build/lib/lean')
    for root in roots:
        for p in glob.iglob(os.path.join(root, '**', '*.ilean'), recursive=True):
            try:
                decls = json.load(open(p)).get('decls', {})
            except Exception:
                continue
            for n in decls:
                names.add(n)
                parts = n.split('.')
                for i in range(1, len(parts)):
                    shorts.add('.'.join(parts[i:]))
                    names.add('.'.join(parts[:i]))      # every namespace prefix
    return names, shorts

def main():
    listing = '--list' in sys.argv
    tex = open(TEX).read()
    allow = set()
    if os.path.exists(ALLOW):
        allow = {l.strip() for l in open(ALLOW) if l.strip() and not l.startswith('#')}
    names, shorts = index()
    if not names:
        print('no .ilean files found: build the project first', file=sys.stderr); sys.exit(2)
    words = source_words()
    bad = []
    seen = set()
    for line, tok in candidates(tex):
        ok = tok in names or tok in shorts or tok in words or tok in allow
        if not ok and '.' in tok:                          # `TrainConfig.labelSmoothing`, `toSpecs.size`:
            parts = tok.split('.')                         # a declaration, then field or method names
            for k in range(len(parts) - 1, 0, -1):
                head = '.'.join(parts[:k])
                if (head in names or head in shorts or head in words) and all(q in words for q in parts[k:]):
                    ok = True; break
        if listing and tok not in seen:
            print(f'{"ok " if ok else "BAD"} L{line:<6d} {tok}')
        seen.add(tok)
        if not ok: bad.append((line, tok))
    if bad and not listing:
        for line, tok in bad: print(f'content.tex:{line}: \\texttt{{{tok}}} names no declaration')
        print(f'\n{len(bad)} unresolved identifiers in {len(seen)} candidates '
              f'({len(names)} declarations indexed). Rename, or add a non-Lean token to {ALLOW}.')
    if not listing:
        print(f'{len(seen) - len({t for _, t in bad})} of {len(seen)} \\texttt identifiers resolve') if not bad else None
    sys.exit(1 if bad else 0)

if __name__ == '__main__':
    main()
