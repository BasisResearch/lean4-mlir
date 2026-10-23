"""The CI step summary's statistics tables, as Markdown on stdout.

    python3 scripts/stats/summary.py                                # Bestiary + Codebase tables
    python3 scripts/stats/summary.py --decls Certs                  # + per-proof-file declarations
    python3 scripts/stats/summary.py --decls CertsHeavy --except Certs   # only that table, only
                                                                    # the rows Certs cannot count

Lines come from `scc` (code / comment / blank, Lean's nested `/- -/` handled), over `git ls-files`,
so untracked and build trees never count. Declaration counts come from `Decls.lean`, which reads
the elaborated environment, so `--decls LIB` counts the proof files in LIB's import closure and
needs LIB built: a file in the closure without an olean is an error, not a `—`. Files outside it
show `—`, and the note says which lib builds them. Called by proofs.yml (no `--decls`, its slice
builds a fraction of the proofs), certs.yml (`--decls Certs`) and certs-heavy.yml
(`--decls CertsHeavy --except Certs`, the 16 heavy-only files).
"""
import json, re, subprocess, sys, tempfile
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "lib"))
from lean_graph import lakefile_text, lib_roots, libs, reachable

ROOT = Path(subprocess.check_output(["git", "rev-parse", "--show-toplevel"], text=True).strip())
SCC = "scc"
PROOFS = "LeanMlir/Proofs/"
# which workflow builds (and counts) a lib this run leaves out
WORKFLOW = {"CertsHeavy": "certs-heavy.yml"}
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


def mod(f):
    return f[:-len(".lean")].replace("/", ".")


def closure(text, lib):
    return reachable(lib_roots(text, f"«{lib}»"), strict=False)


def decls(proof_files):
    """{module path: (thm, def, inst, type, axiom)}; every file must have an olean."""
    unbuilt = [f for f in proof_files
               if not (ROOT / ".lake/build/lib/lean" / f).with_suffix(".olean").exists()]
    if unbuilt:
        sys.exit("error: no olean for " + ", ".join(unbuilt[:5])
                 + (f" and {len(unbuilt) - 5} more" if len(unbuilt) > 5 else "") + " — build the lib first")
    built = proof_files
    with tempfile.TemporaryDirectory() as d:
        mods, tsv = Path(d) / "modules.txt", Path(d) / "decls.tsv"
        mods.write_text("".join(mod(f) + "\n" for f in built))
        subprocess.run(["lake", "env", "lean", "--run", "scripts/stats/Decls.lean", mods, tsv],
                       cwd=ROOT, check=True, stdout=sys.stderr)
        rows = [l.split("\t") for l in tsv.read_text().splitlines()]
    return {m.replace(".", "/") + ".lean": tuple(map(int, r)) for m, *r in rows}


def arg(argv, flag):
    return argv[argv.index(flag) + 1] if flag in argv else None


def decls_table(p, counts, proofs, lib, exclude):
    """The per-proof-file declaration table for the files in `lib`'s closure, minus `exclude`'s."""
    text = lakefile_text()
    inlib = closure(text, lib)
    skip = closure(text, exclude) if exclude else set()
    rows = [f for f in proofs if mod(f) not in skip]
    d = decls([f for f in rows if mod(f) in inlib])
    title = f"## Build Statistics — files outside `{exclude}`" if exclude else "## Build Statistics"
    p(f"{title}\n")
    p(f"Declarations as Lean elaborated them after `lake build {lib}` (`scripts/stats/Decls.lean`); "
      "lines from `scc`.\n")
    p("| File | Theorems | Defs | Instances | Types | Axioms | Code | Comments | Lines |")
    p("|------|---------:|-----:|----------:|------:|-------:|-----:|---------:|------:|")
    tot = [0] * 5
    for f in rows:
        c = counts.get(f, (0, 0, 0, 0))
        if f in d:
            cols = [str(x) for x in d[f]]
            tot = [a + b for a, b in zip(tot, d[f])]
        else:
            cols = ["—"] * 5
        p(f"| `{f[len(PROOFS):]}` | {' | '.join(cols)} | {c[0]} | {c[1]} | {c[3]} |")
    c = total(counts, rows)
    p(f"| **Total ({len(d)} of {len(rows)} files)** | " + " | ".join(f"**{x}**" for x in tot)
      + f" | **{c[0]}** | **{c[1]}** | **{c[3]}** |")
    outside = [f for f in rows if f not in d]
    if outside:
        # say who builds each `—` file, so a deliberate gap does not read as a failure
        by = {}
        for l in libs(text):
            if l.strip("«»") in (lib, "Apps"):
                continue
            for m in closure(text, l.strip("«»")):
                by.setdefault(m, l.strip("«»"))
        groups = {}
        for f in outside:
            groups.setdefault(by.get(mod(f)), []).append(f"`{f[len(PROOFS):]}`")
        parts = []
        for owner, fs in sorted(groups.items(), key=lambda kv: (kv[0] is None, kv[0] or "")):
            what = (f"in `{owner}`, counted by {WORKFLOW.get(owner, 'its own workflow')}" if owner
                    else "built by no lib on purpose (see each file's header)")
            parts.append(f"<details><summary>{len(fs)} {what}</summary>\n\n{', '.join(fs)}\n\n</details>")
        p(f"\n`—`: {len(outside)} files outside `{lib}`.\n")
        p("\n".join(parts))
    p("")


def main(argv):
    global SCC
    lib, exclude = arg(argv, "--decls"), arg(argv, "--except")
    SCC = arg(argv, "--scc") or SCC

    lean = [f for f in tracked("*.lean")
            if Path(f).name != "lakefile.lean" and not f.startswith(("jax/", "historical/mnist-lean4/"))]
    proofs = sorted(f for f in lean if f.startswith(PROOFS))
    bestiary = sorted(tracked("Bestiary/*.lean"))
    ffi = tracked("ffi/*.c", "ffi/*.h")
    trainers = [f for f in tracked("apps/*.lean", "historical/*.lean") if Path(f).name.startswith("Main")]
    counts = scc_counts(sorted(set(lean) | set(bestiary) | set(ffi) | set(trainers)))
    md = []
    p = md.append

    if lib:
        decls_table(p, counts, proofs, lib, exclude)
    if exclude:  # the heavy run adds its rows only; the other tables are certs.yml's
        print("\n".join(md))
        return

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
