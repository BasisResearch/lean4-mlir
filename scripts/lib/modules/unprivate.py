"""From a lake log, find `Unknown identifier X ... A private declaration X (from the current module)`
errors and drop `private` from X's declaration in that file. Prints what it changed."""
import re,sys
log=open(sys.argv[1],encoding='utf-8').read()
hits=set(re.findall(r"error: (\S+\.lean):\d+:\d+: [^\n]*\n(?:[^\n]*\n){0,8}?Note: A private declaration `([^`]+)` \(from the current module\)",log))
# a dotted private name (`Hand.ofCards`) is reported as an unknown constant, with no note
hits|=set(re.findall(r"error: (\S+\.lean):\d+:\d+: Unknown constant `([^`]+)`",log))
for f,n in sorted(hits):
    s=open(f,encoding='utf-8').read(); short=re.escape(n.split('.')[-1])
    pat=re.compile(r'^((?:@\[[^\]]*\]\s*)?)private\s+((?:noncomputable\s+|protected\s+|partial\s+|unsafe\s+)*(?:def|theorem|lemma|abbrev|instance|structure|inductive|opaque|axiom|class)\s+'+r'(?:[\w.]*\.)?'+short+r'\b)',re.M)
    s2,k=pat.subn(r'\1\2',s)
    if k: print(f,n,k); open(f,"w",encoding="utf-8").write(s2)
