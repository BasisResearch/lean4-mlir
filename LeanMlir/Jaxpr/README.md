# Jaxpr compiler correctness

The objective is universal end-to-end compiler correctness, from Jaxpr to
native execution. Every program in the source language must be covered.
Newton is an application of that theorem. Output certificates, test corpora,
and per-program translation validation do not meet this objective.

The implementation is incomplete. The current native theorems end at a data
projection of x86 execution. Full architectural execution remains required.

## Checked compiler stages

| Module | Result |
| --- | --- |
| `Compiler` | IEEE binary32 expressions to serialised stack code |
| `Control` | Comparisons, statements and explicitly bounded while loops to stack code |
| `SSA` | Every scalar Jaxpr to the executable stack-code backend |
| `Native/Bytes` | Little-endian word encoding and decoding |
| `Native/FloatBits` | Float32 representation roundtrip; raw sign and absolute-value masks |
| `Native/Memory` | Byte loads/stores, non-aliasing slots and preservation of other bytes |
| `Native/Instructions` | Concrete x86 encodings, decoder and data execution |
| `Native/Select` | Every scalar Jaxpr to x86 bytes under canonical-NaN data execution |
| `Native/NaNExecution` | Preservation for all raw-bit data executions, including arbitrary NaN representations; existence of executions |
| `Native/Addressing` | Generated code establishes RAX zero-extension before indexed accesses |
| `Native/CodeMemory` | Code bytes survive data stores; concrete separated address layout |
| `Native/Fetch` | All executions fetched from current memory preserve source outputs; executions exist |

`jaxpr_fetched_execution` quantifies over the source program, initial state and
every execution fetched from the loaded instruction image. Its companion proves
execution exists for every program and state with loaded, separated code. PC
advances by decoded lengths. Stores preserve code bytes. Neither theorem requires
a per-program certificate or an output comparison.

Source arithmetic uses Lean 4.35's kernel-visible `Float32` model. Operations
are add, subtract, multiply, divide, negate, absolute value and square root.
The bit bridge covers subnormals, signed zeros, infinities and NaNs. The
selector preserves evaluation order. Generated XORPS/ANDPS sequences use
the proved sign masks; arbitrary bitwise programs are not interchangeable
modulo NaN payloads.

The x86 encodings follow the [Intel SDM, Volume 2](https://cdrdv2-public.intel.com/835757/325383-sdm-vol-2abcd.pdf).
EAX holds indices and immediates. XMM0/XMM1 hold operands. Memory operands use
`[RDI + RAX*4]`. Writing EAX clears the high bits of RAX; the compiler proves
this invariant at indexed accesses without requiring it at entry.

## Required completion work

1. Connect the fetched data execution relation to architectural execution:
   canonical addresses, permissions, all register effects, MXCSR rounding and
   exception behaviour. Code fetch and separation are proved for the data model;
   architectural fault behaviour remains open.
2. Emit and prove ABI output stores, literal outputs, entry and return.
   Observing source atoms in final memory is the current data theorem's endpoint.
3. Extend native lowering through control flow, loop-carried values, tensors,
   index arithmetic and the concrete linear solve used by Newton. The current
   scalar frontend does not cover the complete exported Newton loop.
4. Prove the frontend correspondence with Jaxpr semantics. The current Python
   parser checks types and rejects unsupported primitives but remains trusted.
5. Instantiate numerical error contracts from the IEEE semantics and compose
   the native execution theorem with Newton's convergence/error theorems.

These are unfinished parts of the original objective. They are not exclusions
from the final theorem. The current modules supply no proof of stock XLA/IREE
or Lean's native compiler. The CLI executes the proved wordcode interpreter
through Lean's ordinary native runtime; it is not an emitted x86 Newton binary.

## Build and audit

```sh
lake build JaxprBackend jaxpr-newton-step
lake env lean LeanMlir/Jaxpr/Audit.lean
.lake/build/bin/jaxpr-newton-step 1065353216
```

The final command prints `1069547520 1048576000`, the binary32 representations
of the next iterate and residual for input 1. This is an execution smoke test.

The AWS gate checks twenty-four theorem closures and rejects dependencies beyond
`propext`, `Classical.choice` and `Quot.sound`. Native-evaluation axioms are
rejected. The proofs use core/Std; upstream neural-network proofs are outside
this target's import closure.

`Examples/NewtonStep.lean` is generated from the Python/Jaxpr step in
[VerifyNumericalAnalysis](https://github.com/BasisResearch/VerifyNumericalAnalysis).
That repository's `scripts/check_backend.sh` checks regeneration, builds the
compiler, audits axioms and runs exceptional-value CLI smoke tests.
