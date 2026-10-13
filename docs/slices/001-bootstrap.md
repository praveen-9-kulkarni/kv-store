# 001: Bootstrap

## Goal
A repo where every later slice is a reviewable PR with a doc and a tag.

## Decisions
### Design direction
- Options: Dynamo-style AP vs Raft-based CP
- Chose: Dynamo-style (leaderless, tunable quorums)
- Why: covers hashing, replication, quorums, gossip, conflict handling in one design; Raft can follow as a comparison.
- Consequences: no strong consistency guarantees until we add quorums and versioning.

### Storage and transport
- Chose: WAL + snapshot (LSM optional later); REST between nodes (gRPC optional later).
- Why: simplest to reason about and debug with `curl`.

### Tracing history
- Chose: one tag per merged slice plus `docs/journal.md` and `scripts/file-history.sh`.
- Why: `git diff slice-A slice-B -- file` answers "what changed in this file in that step".

## Proof
`./gradlew test` passes; CI green on the PR.

## Code state
- Ref: initial commit on `main` (Spring Initializr skeleton), then this slice's diff.
- Files: `.cursor/`, `.github/workflows/ci.yml`, `docs/`, `scripts/file-history.sh`
