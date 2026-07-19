---
name: later-dude
description: "Use when the user is ending a work session and wants the work safely closed out: later dude, wrap up, close this out, ship it and save, save everything, or we're done for today. Reviews the selected task, verifies its state, preserves a concise handoff, and identifies any explicit approval still needed to commit, push, deploy, publish, or otherwise change external state."
license: See LICENSE.txt
compatibility: Agent Skills compatible. Works with any project documentation and version-control system. Git, remote access, and a configured memory system are optional.
metadata:
  author: David Russell, Dead Pixel Design
  version: "1.0.0"
---

# Later, dude

End a work session with a **clean handoff**: account for the selected work,
preserve what the next session needs, and make no irreversible assumptions.
This is the end-of-session partner to `hey-dude`.

## 1. Reconcile the selected work

- Limit the review to projects and files touched or explicitly named in the
  session. Do not scan unrelated directories for old work.
- Check the selected project's instructions, working-tree state, and the
  requested outcome.
- Separate completed, verified work from incomplete work, failures, and
  user-controlled decisions.
- Run the smallest relevant verification that can still reveal a meaningful
  defect. Do not claim a build, test, preview, or push proves production state
  unless it actually tests that state.

Completion criterion: every session deliverable is classified as verified,
incomplete, blocked, or awaiting approval.

## 2. Ship only with authority

Check the project's documented release flow before proposing a Git or deploy
action. Keep the following actions behind explicit user or project-granted
authority:

- committing changes;
- pushing, merging, tagging, or creating a remote repository;
- deploying, publishing, sending, purchasing, deleting, or changing live data.

When authority is present, stage only the session's files, use the project’s
real checks, and report the authoritative end state. When authority is absent,
leave the work intact and state the exact command or decision the user must
approve. Never use a broad staging command to sweep in unrelated work.

Completion criterion: no change is represented as shipped unless its required
authority and verification both exist.

## 3. Preserve the next session

Update the existing handoff or status document when the project has one. Create
a short `HANDOFF.md` only when no equivalent document exists and project
instructions allow it. Keep it a resume note, not a diary:

- date and current verified status;
- what changed and where it lives;
- decisions and their rationale;
- open blockers or approvals needed;
- one concrete next action.

If the user's environment has a configured memory system and permission to use
it, save only durable, non-sensitive lessons that are not already captured by
the project documentation. Otherwise, the project handoff is sufficient.

Completion criterion: a new agent can locate the selected project and take the
next action without reconstructing the session from chat history.

## 4. Report

Lead with the closeout verdict:

- **Verified:** delivered work and checks that passed.
- **Saved:** handoff or documentation updated.
- **Needs approval:** any commit, push, deploy, publication, or other external
  action not authorized.
- **Next:** the single best next action.

Do not manufacture a lesson, handoff, or memory entry when the session produced
nothing durable.

## Example

> User: “Later dude.”

The agent checks only the project worked on in this session, runs its relevant
local verification, updates the established handoff, and reports whether the
changes are ready for an explicitly approved commit or release.
