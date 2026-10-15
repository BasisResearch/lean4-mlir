#!/usr/bin/env python3
"""Every graphic and table in the book is a numbered, captioned, labelled float.

    python3 scripts/book/book_floats.py            # the gate: exit 1 and one line per violation
    python3 scripts/book/book_floats.py --refs     # also: every float, and the lines that \\ref it

The publisher's house style numbers every figure and table ("Figure 1-2. Caption"), and a
TikZ diagram or a tabular set in a bare `center` gets no number at all, and no warning either.
Fails on a `tikzpicture`, `tabular`, `\\includegraphics` or `\\input{figures/...}` outside a
`figure` or `table` environment; a `figure` without exactly one `\\caption` and one
`\\label{fig:...}`, or a `table` without one `\\caption` and one `\\label{tab:...}`; and a label
used twice. `--refs` is the census for the pass that makes the prose cite each float by number
(planning/book_floats.md): a float with no citing line is listed with none.
"""
import re, sys

TEX = 'blueprint/src/content.tex'
GRAPHIC = re.compile(r'\\begin\{(tikzpicture|tabular\*?)\}|\\includegraphics|\\input\{figures/')
ENV = re.compile(r'\\(begin|end)\{(figure|table)\*?\}')
PREFIX = {'figure': 'fig:', 'table': 'tab:'}


def strip(lines):
    """comments and verbatim bodies blanked, line numbers kept"""
    out, verb = [], False
    for l in lines:
        if verb:
            verb = '\\end{verbatim}' not in l
            out.append(''); continue
        if '\\begin{verbatim}' in l and '\\end{verbatim}' not in l:
            verb = True
        out.append(re.sub(r'(?<!\\)%.*', '', l))
    return out


def floats(lines):
    """[(env, first line, last line, caption count, labels)] and the violations found on the way"""
    found, bad, cur = [], [], None
    for n, l in enumerate(lines, 1):
        for m in ENV.finditer(l):
            if m.group(1) == 'begin':
                if cur: bad.append('%d: %s nested inside the %s at line %d' % (n, m.group(2), cur[0], cur[1]))
                cur = [m.group(2), n, 0, []]
            elif cur:
                found.append((cur[0], cur[1], n, cur[2], cur[3])); cur = None
        if cur:
            cur[2] += len(re.findall(r'\\caption\{', l))
            cur[3] += re.findall(r'\\label\{([^}]*)\}', l)
        elif GRAPHIC.search(l):
            bad.append('%d: %s outside a figure or table' % (n, GRAPHIC.search(l).group(0)))
    for env, a, b, caps, labs in found:
        if caps != 1: bad.append('%d: %s with %d captions' % (a, env, caps))
        if len(labs) != 1 or not labs[0].startswith(PREFIX[env]):
            bad.append('%d: %s needs exactly one \\label{%s...}, has %s' % (a, env, PREFIX[env], labs or 'none'))
    return found, bad


def main():
    lines = strip(open(TEX).read().split('\n'))
    found, bad = floats(lines)
    labels = [l for f in found for l in f[4]]
    every = re.findall(r'\\label\{([^}]*)\}', '\n'.join(lines))
    bad += ['label %s defined %d times' % (l, every.count(l)) for l in sorted(set(labels)) if every.count(l) > 1]
    if '--refs' in sys.argv:
        for env, a, b, caps, labs in found:
            for lab in labs:
                cites = [n for n, l in enumerate(lines, 1) if not a <= n <= b and re.search(r'\\ref\{%s\}' % re.escape(lab), l)]
                print('%-6s %-32s line %-6d cited at %s' % (env, lab, a, ', '.join(map(str, cites)) or 'NONE'))
    for b in bad: print('%s:%s' % (TEX, b))
    print('%d figures, %d tables, %d violations' % (
        sum(f[0] == 'figure' for f in found), sum(f[0] == 'table' for f in found), len(bad)), file=sys.stderr)
    sys.exit(1 if bad else 0)


if __name__ == '__main__':
    main()
