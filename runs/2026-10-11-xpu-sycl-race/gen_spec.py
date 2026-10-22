"""Write stress.c's spec for one verified_mlir/ function: `<n_in> <n_out>`, a `<rank> <dims…>`
line per input, an `<elements>` line per output, read off the func.func signature.

    python3 gen_spec.py ../../verified_mlir/cnn_train_step.mlir cnn_train_step > cnn.spec
"""
import math, re, sys

src = open(sys.argv[1]).read()
m = re.search(r'func.func (?:public )?@' + sys.argv[2] + r'\((.*?)\)\s*->\s*\((.*?)\)\s*\{', src, re.S)
ins = re.findall(r'tensor<([^>]*)>', m.group(1))
outs = re.findall(r'tensor<([^>]*)>', m.group(2))
dims = lambda t: [int(d) for d in t.split('x')[:-1]]
print(len(ins), len(outs))
for t in ins:
    print(len(dims(t)), *dims(t))
for t in outs:
    print(math.prod(dims(t)))
