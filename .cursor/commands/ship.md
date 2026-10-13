# Ship changes to a PR

Turn local work into a feature branch, commit, push, and open a PR, **only after the user approves** the branch name, commit message, PR title, summary, and test plan.

## Phase 1: Suggest only (no git writes)

1. Run `git status`, `git diff` (staged + unstaged), `git diff main...HEAD` if already on a feature branch, and `git log -5 --oneline`.
2. Include intentional untracked files; warn on likely secrets.
3. Draft from the real diff only: branch `feature/<short-kebab>`, full + short commit message, PR title, Summary (1–3 bullets), Test plan (checklist).
4. Remind me of slice housekeeping: `docs/slices/NNN-*.md` written, `docs/journal.md` row added, tag `slice-NNN-name` to create after merge.

Output format: Branch / Commit (full + shorter) / PR title / Summary / Test plan. Then stop and ask for confirmation. Do not run `git add`, `git switch -c`, `git commit`, `git push`, or `gh pr create` in this phase.

## Phase 2: Wait for approval

Proceed only on a clear Go (e.g. "Go", "ship it") with branch, commit message, PR title, summary and test plan settled. Ask once if ambiguous.

## Phase 3: Execute (after explicit Go)

1. Resolve host from `origin`; print origin, host, `gh api user --hostname <host> -q .login`, and `git config user.email` before any `gh` write.
2. `git switch -c <branch>` if on `main`; stage intended files (no secrets).
3. Commit with the approved message via HEREDOC. Do not skip hooks.
4. `git push -u origin HEAD`.
5. `gh pr create` against `main` with `## Summary` and `## Test plan`. Return the URL.
6. After I merge: on request, tag `slice-NNN-name` on the merge commit and push the tag.

## Constraints

- Never invent changes not in the diff. Never commit onto `main`.
- Never amend unless explicitly asked.
- No AI/tool branding in commit or PR text.
