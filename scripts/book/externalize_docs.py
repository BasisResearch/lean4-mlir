#!/usr/bin/env python3
"""Point the shipped API docs at the hosted Mathlib docs, and ship only our own pages.

    python3 scripts/book/externalize_docs.py public/docs HOSTED_INDEX [--base URL]

doc-gen4 cannot link to an external docs site: every `ℝ`, `Finset.sum` or `simp` in a
signature becomes a relative link to a page it rendered itself, so `docs/` used to carry a
locally rebuilt Mathlib (+ core, Batteries, Aesop, …): ~3,500 modules of somebody else's
library on this domain, which crawlers mirrored however robots.txt was phrased. This runs
on the assembled tree and turns it into OUR pages plus links to
leanprover-community.github.io/mathlib4_docs.

HOSTED_INDEX is the hosted site's own `declarations/declaration-data.bmp` (doc-gen4's
search index, JSON despite the name). Links are resolved BY NAME through it, never by
path: the hosted docs follow Mathlib master and we pin a release, so a path can be stale
in either direction (on 2026-10-15 master had moved `Real` from Mathlib/Data/Real/Basic to
Mathlib/Basic/Real/Basic, leaving an empty deprecation stub at the old path). A
`Module.html#decl` link goes wherever the hosted index puts `decl`; failing that (a
declaration master renamed or removed), to the module's hosted page if it still exists;
failing that the page STAYS LOCAL and keeps being shipped. So is a module the hosted site
does not document at all (ImportGraph). The fallback pages are rewritten the same way,
and so on to a fixpoint; nothing ever links to a page that was deleted.

The search index (`declarations/declaration-data.bmp`) is then cut to the pages still
shipped, so search and find/ never offer a deleted page. A Mathlib name typed into our
search finds nothing; the root 404.html sends find/ misses and old docs/Mathlib/… URLs
to the hosted site.
"""
from __future__ import annotations

import argparse
import html
import json
import posixpath
import re
import sys
from pathlib import Path

HOSTED = "https://leanprover-community.github.io/mathlib4_docs/"

# Module namespaces that are OURS (same list as gen_sitemap.py's DOC_KEEP).
KEEP = ("LeanMlir",)

HREF = re.compile(r'href="([^"#]*\.html)(#[^"]*)?"')

NAV_OPEN = '<div class="module_list">'


def trim_navbar(text: str, base: str) -> str:
    """Keep only our top-level sections of navbar.html's module tree, plus one link out.

    The tree is one `<details class="nav_sect" data-path="./Root.html">` (or a bare
    `nav_link` div) per root namespace. Rewritten rather than deleted, every external
    module would still be listed: 600 KB of links in an iframe on every page.
    """
    start = text.find(NAV_OPEN)
    if start < 0:
        return text
    i, depth, keep, out = start + len(NAV_OPEN), 0, True, []
    tag = re.compile(r"<(/?)(details|div)\b[^>]*>")
    while True:
        m = tag.search(text, i)
        if m is None:
            return text   # unexpected shape: leave the navbar alone
        closing = m.group(1) == "/"
        if depth == 0 and closing:          # the module_list's own </div>
            body = "".join(out)
            link = (f'<div class="nav_link"><a href="{base}">Mathlib, core and other '
                    f'libraries &#8599;</a></div>')
            return text[: start + len(NAV_OPEN)] + body + link + text[m.start():]
        if depth == 0:                       # a root namespace begins
            seg_start = m.start()
            path = re.search(r'(?:data-path|href)="\./([^"/.]+)', text[m.start(): m.start() + 300])
            keep = bool(path) and path.group(1) in KEEP
        depth += -1 if closing else 1
        i = m.end()
        if depth == 0 and keep:
            out.append(text[seg_start: m.end()])


HOSTED_FIND = """<p>Mathlib, Lean core or another library? Their declarations are in the
<a id="hosted-find" href="{base}search.html">Mathlib docs</a>.</p>
<script>(function(){{var p=location.hash.slice(1);if(p)document.getElementById("hosted-find").href=
"{base}find/?pattern="+p+"#doc";}})();</script>"""


def is_ours(module: str) -> bool:
    return module.split(".")[0] in KEEP


def module_of(rel: str) -> str:
    """docs-relative page path → module name (`Mathlib/Data/Real/Basic.html` → dotted)."""
    return rel[: -len(".html")].replace("/", ".")


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("docs", type=Path)
    ap.add_argument("hosted_index", type=Path)
    ap.add_argument("--base", default=HOSTED)
    ap.add_argument("--summary", type=Path, help="write a one-line Markdown summary here (the CI job summary)")
    a = ap.parse_args()
    docs, base = a.docs, a.base.rstrip("/") + "/"

    index_path = docs / "declarations" / "declaration-data.bmp"
    local = json.loads(index_path.read_text(encoding="utf-8"))
    hosted = json.loads(a.hosted_index.read_text(encoding="utf-8"))
    hosted_decls, hosted_mods = hosted["declarations"], hosted["modules"]

    # Every module page doc-gen4 rendered, by docs-relative path. The index's `url` is
    # `./Foo/Bar.html`.
    page_of = {m: info["url"].removeprefix("./") for m, info in local["modules"].items()}
    # External by PATH, not by the index: the doc/ tree rides a cache, so it can hold pages of
    # modules the index no longer lists (the 10-16 re-insert run left 701 such Mathlib/core
    # pages, all shipped). A page is a library's if it sits under a top-level directory other
    # than ours and doc-gen4's own (find/, declarations/), or is the top-level page of one.
    roots = {m.split(".")[0] for m in page_of} | {d.name for d in docs.iterdir() if d.is_dir()}
    roots -= set(KEEP) | {"find", "declarations", "src"}
    external = {p.relative_to(docs).as_posix() for p in docs.rglob("*.html")
                if p.relative_to(docs).parts[0] in roots
                or (len(p.relative_to(docs).parts) == 1 and p.stem in roots)}

    ext_stats = {"decl": 0, "module": 0, "kept": 0}

    def resolve(target: str, frag: str | None) -> str | None:
        """Hosted URL for the external page `target` (+ `#frag`), or None to keep it local."""
        if frag:
            name = html.unescape(frag[1:])
            hit = hosted_decls.get(name)
            if hit:
                ext_stats["decl"] += 1
                return base + hit["docLink"].removeprefix("./")
        mod = hosted_mods.get(module_of(target))
        if mod:
            ext_stats["module"] += 1
            return base + mod["url"].removeprefix("./") + (frag or "")
        ext_stats["kept"] += 1
        return None

    # doc-gen4 links a Mathlib name only when the name is in its db; a db that lost Mathlib
    # renders every `ℝ` as plain text and this pass finds nothing to rewrite (the 10-16
    # deploy). A green run would ship that; a red one keeps the last good site up.
    if external and not any("mathlib4_docs" in t or re.search(r'href="[^"]*Mathlib/[^"]*#', t)
                            for t in (f.read_text(encoding="utf-8") for f in (docs / "LeanMlir").rglob("*.html"))):
        print("::error::no LeanMlir page links a Mathlib declaration: doc-gen4's db is missing Mathlib")
        return 1

    # The navbar first, so the pass below neither rewrites nor keeps what it listed.
    nav = docs / "navbar.html"
    if nav.is_file():
        nav.write_text(trim_navbar(nav.read_text(encoding="utf-8"), base), encoding="utf-8")
    # doc-gen4's own 404 is where find/ sends a name it cannot find (`404.html#name`); a
    # Mathlib name is now always such a miss, so offer the hosted lookup.
    nf = docs / "404.html"
    if nf.is_file():
        t = nf.read_text(encoding="utf-8")
        anchor = '<div id="howabout"></div>'
        if anchor in t and "hosted-find" not in t:
            nf.write_text(t.replace(anchor, anchor + HOSTED_FIND.format(base=base)), encoding="utf-8")

    # Pages to rewrite: everything that is not an external module page, then any external
    # page a rewrite had to keep, until nothing new is kept.
    shipped = {p.relative_to(docs).as_posix() for p in docs.rglob("*.html")} - external
    todo, done = sorted(shipped), set()
    while todo:
        rel = todo.pop()
        if rel in done:
            continue
        done.add(rel)
        f = docs / rel
        text = f.read_text(encoding="utf-8")
        here = posixpath.dirname(rel)

        def sub(m: re.Match) -> str:
            href, frag = m.group(1), m.group(2)
            if "://" in href:
                return m.group(0)
            target = posixpath.normpath(posixpath.join(here, html.unescape(href)))
            if target not in external:
                return m.group(0)
            url = resolve(target, frag)
            if url is None:
                if target not in shipped:
                    shipped.add(target)
                    todo.append(target)
                return m.group(0)
            return f'href="{html.escape(url, quote=True)}"'

        new = HREF.sub(sub, text)
        if new != text:
            f.write_text(new, encoding="utf-8")

    # Delete the external pages nothing kept, then the directories they leave empty.
    removed = external - shipped
    for rel in removed:
        (docs / rel).unlink()
    for d in sorted((p for p in docs.rglob("*") if p.is_dir()), key=lambda p: -len(p.parts)):
        if not any(d.iterdir()):
            d.rmdir()

    # Cut the search index to what is still shipped.
    live_mods = {m for m, p in page_of.items() if p not in removed and (docs / p).is_file()}
    decls = {n: d for n, d in local["declarations"].items()
             if d["docLink"].removeprefix("./").split("#")[0] not in removed}
    local["declarations"] = decls
    local["modules"] = {m: {**info, "importedBy": [i for i in info.get("importedBy", []) if i in live_mods]}
                        for m, info in local["modules"].items() if m in live_mods}
    for key in ("instances", "instancesFor"):
        if key in local:
            local[key] = {k: [i for i in v if i in decls] for k, v in local[key].items()}
            local[key] = {k: v for k, v in local[key].items() if v}
    before = index_path.stat().st_size
    index_path.write_text(json.dumps(local, ensure_ascii=False, separators=(",", ":")), encoding="utf-8")

    kept_ext = sorted(shipped & external)
    print(f"external links → {base}: {ext_stats['decl']} by declaration, {ext_stats['module']} by module; "
          f"{ext_stats['kept']} stayed local")
    print(f"pages: {len(removed)} external deleted, {len(kept_ext)} external kept (no hosted page), "
          f"{len(shipped) - len(kept_ext)} ours")
    for p in kept_ext[:20]:
        print(f"  kept: {p}")
    if a.summary:
        # The drift gauge: links master could not serve keep our pinned page. A jump in
        # the local count after a Mathlib bump is where our release and master parted.
        n = ext_stats["decl"] + ext_stats["module"]
        kept = ", ".join(f"`{module_of(p)}`" for p in kept_ext[:5]) + (" …" if len(kept_ext) > 5 else "")
        a.summary.write_text(
            f"{n} to hosted ({ext_stats['decl']} by name, {ext_stats['module']} by module) · "
            f"{ext_stats['kept']} kept local, {len(kept_ext)} page(s){': ' + kept if kept_ext else ''}\n",
            encoding="utf-8")
    print(f"search index: {before / 1e6:.1f} MB → {index_path.stat().st_size / 1e6:.1f} MB, "
          f"{len(decls)} declarations, {len(local['modules'])} modules")
    return 0


if __name__ == "__main__":
    sys.exit(main())
