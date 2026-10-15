"""Convert a non-module Lean file to the module system, preserving today's semantics:
`module`, `public import` for each header import, then `@[expose] public section`."""
import re,sys
for p in sys.argv[1:]:
    lines=open(p,encoding='utf-8').read().split('\n')
    if any(l.strip()=='module' for l in lines[:5]): continue
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
    open(p,'w',encoding='utf-8').write('\n'.join(out))
