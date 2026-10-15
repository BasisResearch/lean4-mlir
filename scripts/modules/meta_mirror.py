"""For files whose elaboration crashed the interpreter or found no native code (an #eval/#guard reaching code imported
only at runtime phase), add a `meta import` alongside each local `public import`."""
import re,sys
log=open(sys.argv[1],encoding='utf-8').read()
mods={b for b in re.findall(r"✖ \[\d+/\d+\] Building (\S+)((?:(?!✖).)*)",log,re.S) if "libc++abi: terminating" in b[1] or "Could not find native implementation" in b[1]}
mods={b[0] for b in mods}
for m in sorted(mods):
    f=m.replace('.','/')+'.lean'; L=open(f,encoding='utf-8').read().split('\n')
    imps=[re.match(r'^public import (LeanMlir\S*)',l) for l in L]
    new=['meta import '+x.group(1) for x in imps if x and 'meta import '+x.group(1) not in L]
    last=max(i for i,l in enumerate(L) if re.match(r'^(public |meta )*import ',l))
    L[last+1:last+1]=new; open(f,'w',encoding='utf-8').write('\n'.join(L))
    print(f,len(new))
