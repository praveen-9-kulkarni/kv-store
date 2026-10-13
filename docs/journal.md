# Journal: how the key-value store evolved

Each slice = one PR = one tag `slice-NNN-name`. Details live in `docs/slices/NNN-name.md`.

## See how a file evolved

```bash
scripts/file-history.sh src/main/java/com/project/kv_store/SomeFile.java   # slices + commits touching it
git show slice-003-name:<path>                                           # file as it was after a slice
git diff slice-003-name slice-004-name -- <path>                         # what one slice changed
git log --follow -p -- <path>                                            # full patch history
```

## Slices

| # | Tag | Concept | Doc |
|---|-----|---------|-----|
| 001 | slice-001-bootstrap | repo, CI, collaboration rules, docs scaffold | [001](slices/001-bootstrap.md) |
