# Module-system migration helpers

Used to move the `Proofs` cone to Lean's module system (`module` / `public import` /
`@[expose] public section`). Bottom-up, one import cone at a time:

    python3 scripts/lib/modules/cone.py . <root modules...> > cone.txt   # files to convert
    python3 scripts/lib/modules/to_module.py $(sed 's|\.|/|g;s|$|.lean|' cone.txt)
    # then loop until green:
    lake build <Target> > build.log 2>&1 || {
      python3 scripts/lib/modules/unprivate.py   build.log  # private helper used in an exposed def
      python3 scripts/lib/modules/fix_imports.py build.log  # Lean's own "consider adding `…import M`"
      python3 scripts/lib/modules/meta_mirror.py build.log  # #eval/#guard crashed the interpreter
    }

Each fixer reads a lake log and edits files in place; rerun the build after each round.
