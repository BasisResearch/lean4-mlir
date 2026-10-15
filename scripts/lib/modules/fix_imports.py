"""Apply Lean's own `consider adding `...import M`` suggestions from a lake log: a `meta import M`
for #eval/#guard needs, a `public import M` where a decl was reachable only at meta phase."""
import re,sys
log=open(sys.argv[1],encoding='utf-8').read()
FIX={}
want={}
for f,kind,m in re.findall(r"error: (\S+\.lean):\d+:\d+: [^\n]*consider adding `(public meta import|meta import|import) ([\w.]+)`",log):
    m=FIX.get(m,m); line=('meta import ' if 'meta' in kind else 'public import ')+m
    want.setdefault(f,set()).add(line)
for f,ls in want.items():
    L=open(f,encoding='utf-8').read().split('\n')
    last=max(i for i,l in enumerate(L) if re.match(r'^(public |meta )*import ',l))
    new=[l for l in sorted(ls) if l not in L]
    L[last+1:last+1]=new
    open(f,'w',encoding='utf-8').write('\n'.join(L))
    for l in new: print(f,l)
