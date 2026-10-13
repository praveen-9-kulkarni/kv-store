#!/usr/bin/env bash
# Usage: scripts/file-history.sh <path>
# Lists every slice tag whose range changed <path>, then the full per-commit history.
set -euo pipefail
f="${1:?usage: file-history.sh <path>}"
prev=""
for t in $(git tag --list 'slice-*' --sort=version:refname); do
  range="${prev:+$prev..}$t"
  if [ -n "$(git log --format=%h "$range" -- "$f" | head -1)" ]; then
    echo "$t: $(git diff --shortstat "${prev:-$(git hash-object -t tree /dev/null)}" "$t" -- "$f")"
  fi
  prev="$t"
done
echo "--- commits"
git log --follow --format='%h %ad %s' --date=short -- "$f"
