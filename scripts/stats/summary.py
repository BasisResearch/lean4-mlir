"""The CI step summary's statistics tables, as Markdown on stdout.

    python3 scripts/stats/summary.py            # Bestiary + Codebase tables
    python3 scripts/stats/summary.py --decls    # also the per-proof-file declaration table

Lines come from `scc` (code / comment / blank, Lean's nested `/- -/` handled), over `git ls-files`,
so untracked and build trees never count. Declaration counts come from `Decls.lean`, which reads
the elaborated environment: it needs the proof modules built, and a module without an olean
shows `—`. Called by proofs.yml (no `--decls`, its slice builds a fraction of the proofs) and
certs.yml (`--decls`, after `lake build Certs`).
"""
import json, re, subprocess, sys, tempfile
from collections import defaultdict
from pathlib import Path

ROOT = Path(subprocess.check_output(["git", "rev-parse", "--show-toplevel"], text=True).strip())
SCC = "scc"
PROOFS = "LeanMlir/Proofs/"
BUCKETS = ["Foundation", "Architectures", "Nets", "Float", "Codegen", "Certificates", "Training"]


def tracked(*pats):
    return subprocess.check_output(["git", "ls-files", "--", *pats], text=True, cwd=ROOT).split()


def scc_counts(files):
    """{path: (code, comment, blank, lines)} for every file scc recognises."""
    out = subprocess.check_output([SCC, "--by-file", "-f", "json", "--no-cocomo", *files],
                                  text=True, cwd=ROOT)
    return {f["Location"]: (f["Code"], f["Comment"], f["Blank"], f["Lines"])
            for lang in json.loads(out) for f in lang["Files"]}


def total(counts, files):
    s = [0, 0, 0, 0]
    for f in files:
        for i, v in enumerate(counts.get(f, (0, 0, 0, 0))):
            s[i] += v
    return s


def decls(proof_files):
    """{module path: (thm, def, inst, type, axiom)} for the proof files that have an olean."""
    built = [f for f in proof_files
             if (ROOT / ".lake/build/lib/lean" / f).with_suffix(".olean").exists()]
    with tempfile.TemporaryDirectory() as d:
        mods, tsv = Path(d) / "modules.txt", Path(d) / "decls.tsv"
        mods.write_text("".join(f[:-len(".lean")].replace("/", ".") + "\n" for f in built))
        subprocess.run(["lake", "env", "lean", "--run", "scripts/stats/Decls.lean", mods, tsv],
                       cwd=ROOT, check=True, stdout=sys.stderr)
        rows = [l.split("\t") for l in tsv.read_text().splitlines()]
    return {m.replace(".", "/") + ".lean": tuple(map(int, r)) for m, *r in rows}


def main(argv):
    global SCC
    want_decls = "--decls" in argv
    if "--scc" in argv:
        SCC = argv[argv.index("--scc") + 1]

    lean = [f for f in tracked("*.lean")
            if Path(f).name != "lakefile.lean" and not f.startswith(("jax/", "historical/mnist-lean4/"))]
    proofs = sorted(f for f in lean if f.startswith(PROOFS))
    bestiary = sorted(tracked("Bestiary/*.lean"))
    ffi = tracked("ffi/*.c", "ffi/*.h")
    trainers = [f for f in tracked("apps/*.lean", "historical/*.lean") if Path(f).name.startswith("Main")]
    counts = scc_counts(sorted(set(lean) | set(bestiary) | set(ffi) | set(trainers)))
    md = []
    p = md.append

    if want_decls:
        d = decls(proofs)
        p("## Build Statistics\n")
        p("Declarations as Lean elaborated them (`scripts/stats/Decls.lean`); lines from `scc`.\n")
        p("| File | Theorems | Defs | Instances | Types | Axioms | Code | Comments | Lines |")
        p("|------|---------:|-----:|----------:|------:|-------:|-----:|---------:|------:|")
        tot = [0] * 5
        for f in proofs:
            c = counts.get(f, (0, 0, 0, 0))
            if f in d:
                cols = [str(x) for x in d[f]]
                tot = [a + b for a, b in zip(tot, d[f])]
            else:
                cols = ["—"] * 5
            p(f"| `{f[len(PROOFS):]}` | {' | '.join(cols)} | {c[0]} | {c[1]} | {c[3]} |")
        c = total(counts, proofs)
        p(f"| **Total** | " + " | ".join(f"**{x}**" for x in tot) + f" | **{c[0]}** | **{c[1]}** | **{c[3]}** |")
        missing = [f for f in proofs if f not in d]
        if missing:
            p(f"\n{len(missing)} file(s) not built in this run (`—`): "
              + ", ".join(f"`{f[len(PROOFS):]}`" for f in missing))
        p("")

    p("## Bestiary Entries\n")
    p("| File | Variants | Code | Lines |")
    p("|------|---------:|-----:|------:|")
    tv = 0
    for f in bestiary:
        # each `def X : NetSpec` is a variant (architecture + sizes + tiny fixtures)
        v = len(re.findall(r"^def [A-Za-z0-9_]+ : NetSpec", (ROOT / f).read_text(), re.M))
        tv += v
        c = counts.get(f, (0, 0, 0, 0))
        p(f"| `{Path(f).name}` | {v} | {c[0]} | {c[3]} |")
    c = total(counts, bestiary)
    p(f"| **Total ({len(bestiary)} files)** | **{tv}** | **{c[0]}** | **{c[3]}** |\n")

    p("## Codebase Statistics\n")
    p("| Component | Files | Code | Comments | Blank | Lines |")
    p("|-----------|------:|-----:|---------:|------:|------:|")
    def row(name, files, bold=False):
        c = total(counts, files)
        cells = [str(len(files))] + [str(x) for x in c]
        if bold:
            cells = [f"**{x}**" for x in cells]
        p(f"| {name} | " + " | ".join(cells) + " |")
    row("Proofs", proofs)
    for b in BUCKETS:
        row(f"— {b}", [f for f in proofs if f.startswith(f"{PROOFS}{b}/")])
    row("Core Library", [f for f in lean if (f.startswith("LeanMlir/") and not f.startswith(PROOFS))
                         or f == "LeanMlir.lean"])
    row("Bestiary", bestiary)
    row("Trainers", trainers)
    row("Demos", [f for f in lean if f.startswith("demos/") and f.count("/") == 1])
    row("Tests", [f for f in lean if f.startswith("tests/")])
    row("FFI (C)", ffi)
    row("**Total Lean**", lean, bold=True)
    row("**Total C**", ffi, bold=True)
    print("\n".join(md))


if __name__ == "__main__":
    main(sys.argv[1:])
