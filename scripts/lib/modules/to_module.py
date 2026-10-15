"""Convert a non-module Lean file to the module system, preserving today's semantics:
`module`, `public import` for each header import, then `@[expose] public section`.

`modularize(text)` is the conversion itself; the cert generators call it on what they emit, so a
regenerated file comes out exactly as the committed one. Run as a script it converts files in place."""
import re,sys

def modularize(text):
    lines=text.split('\n')
    if any(l.strip()=='module' for l in lines[:5]): return text
    i=0; out=['module','']
    # header: imports, blank lines, and line comments only
    last_import=-1
    while i<len(lines):
        l=lines[i]
        if re.match(r'^import\s',l): out.append('public '+l); last_import=len(out)-1
        elif l.strip()=='' or l.lstrip().startswith('--'): out.append(l)
        else: break
        i+=1
    at = last_import+1 if last_import>=0 else 2
    out[at:at]=["","@[expose] public section"] if last_import>=0 else ["@[expose] public section",""]
    out+=lines[i:]
    return '\n'.join(out)

if __name__=='__main__':
    for p in sys.argv[1:]:
        s=open(p,encoding='utf-8').read(); t=modularize(s)
        if t!=s: open(p,'w',encoding='utf-8').write(t)
