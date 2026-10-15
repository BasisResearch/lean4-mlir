"""Print the local import cone of the given modules: `cone.py <root> <Mod> ...`."""
import re,sys,os
root=sys.argv[1]; mods=sys.argv[2:]
def path(m): return os.path.join(root,*m.split('.'))+'.lean'
seen=set(); st=list(mods)
while st:
    m=st.pop()
    if m in seen: continue
    p=path(m)
    if not os.path.exists(p): continue
    seen.add(m)
    for line in open(p,encoding='utf-8'):
        mm=re.match(r'^\s*(?:public\s+|meta\s+)*import\s+(.*)',line)
        if mm:
            for t in mm.group(1).split():
                if t.startswith('--'): break
                st.append(t)
for m in sorted(seen): print(m)
