---
name: hey-dude
description: "Use when the user begins or resumes a work session and wants a focused catch-up before continuing: hey dude, pick this back up, where were we, resume, or what is the next step. Establishes current project truth from the selected workspace, handoff, and working tree, then proceeds with the requested work. Do not use for a general project audit or to scan unrelated directories."
license: See LICENSE.txt
compatibility: Agent Skills compatible. Requires read access to the selected project; Git status and repository documentation improve the result when available.
metadata:
  author: David Russell, Dead Pixel Design
  version: "1.0.0"
---

# Hey, dude

Start a work session with a **tight resume**: establish only the context needed
to take the next useful action. Then act. This skill is the start-of-session
partner to `later-dude`.

## 1. Establish the work boundary

- Use the project, branch, issue, handoff, or task the user named.
- If no project is identifiable from the conversation or current directory, ask
  one concise question rather than scanning the machine.
- Treat a user statement that something was already selected, checked, or done
  as current context. Seek only new evidence needed for the next action.

Completion criterion: there is one selected work area and one stated outcome.

## 2. Read the smallest authoritative context

Inspect, in this order when they exist:

1. Applicable project instructions such as `AGENTS.md`, `CLAUDE.md`, or a
   contributor guide.
2. The current handoff, issue, task list, or status document.
3. The working-tree and branch state, preserving unrelated changes.
4. The implementation, tests, logs, or live state directly relevant to the
   user's request.

Prefer current repository or runtime evidence over an old handoff. Treat a
handoff as a starting hypothesis, not a substitute for checking the seam it
describes. Do not read personal memory stores, credentials, or unrelated
projects unless the user explicitly places them in scope.

Completion criterion: the next action is grounded in current evidence, and any
stale or contradictory context is called out briefly.

## 3. Turn context into motion

Return a compact resume note only when it helps:

- **Current state:** the relevant verified facts.
- **Next action:** one runnable, in-scope step.
- **Blocker:** only if no safe next step exists.

Immediately perform the requested work when it is authorized. Do not stop at a
status summary if a safe, useful action remains. For a broad or dependent task,
make a short execution plan and keep it current as work completes.

Completion criterion: the requested work has begun, or the user has the exact
missing decision or authority needed to begin.

## Safety boundaries

- Never treat session-start language as authorization to change external state.
- Preserve uncommitted work that is outside the selected task.
- Do not create, send, publish, deploy, merge, or delete merely because past
  context mentions it.
- If the project has its own instructions, follow them unless the user gives a
  direct, applicable override.

## Example

> User: “Hey dude, pick up the settings-panel bug.”

The agent identifies the relevant project, reads its instructions and handoff,
checks the current branch and the settings-panel seam, then begins the approved
diagnosis or fix. It does not inventory every repository on the computer.
