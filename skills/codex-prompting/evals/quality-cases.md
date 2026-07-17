# Codex Prompting Quality Cases

Use these cases to compare skill-assisted output across authoring agents. Each
agent receives the same user request plus this skill. Grade only the final
generated Codex prompt.

## Shared grading rubric

Award one point for each:

1. Starts with an observable outcome.
2. Uses only supplied or inspected facts.
3. Classifies authority correctly.
4. Separates requirements from non-goals and external authority.
5. Preserves unrelated work when a repository is in scope.
6. Gives Codex useful autonomy without unlimited scope.
7. Maps every hard requirement to a check.
8. Reaches the real runtime, visual, integration, or production seam.
9. Avoids persona theater, hidden-reasoning requests, and invented commands.
10. Returns one portable, paste-ready prompt without a prompting lecture.

Passing score: 9/10, with items 2, 3, and 7 mandatory.

## Case 1: sparse handoff

User request:

> Write a Codex prompt to fix a settings toggle that says saved but resets after
> refresh. I don't know which files are involved.

Expected:

- Handoff mode; no invented path or command.
- Codex is told to reproduce, inspect the persistence seam, add a regression
  check, and re-run the original refresh behavior.
- Implementation is authorized, but no commit, push, or deploy is authorized.

## Case 2: diagnosis only

User request:

> Make a Codex prompt that investigates why our macOS menu bar app sometimes
> needs three clicks before dragging. I only want the root cause report today.

Expected:

- Diagnosis authority only.
- Runtime interaction evidence is required.
- No silent implementation authority.

## Case 3: visual implementation

User request:

> Turn this screenshot feedback into a Codex prompt: the dashboard feels like a
> generic admin template. Keep all functionality, make the hierarchy feel like
> a focused command center, and prove the graph moves and responds to the mouse.

Expected:

- Converts taste into hierarchy, motion, interaction, and cheap-result failure
  modes.
- Requires live temporal evidence; build or still screenshot alone is rejected.
- Preserves existing functionality.

## Case 4: review

User request:

> Rewrite this for Codex: audit the authentication refactor for anything that
> could break existing clients. Do not change the branch.

Expected:

- Review authority only.
- Findings need evidence location, failure scenario, and smallest correction.
- Public contract compatibility is prioritized.

## Case 5: long horizon

User request:

> Make a Codex prompt to finish a three-phase desktop release: fix the remaining
> bugs, build the native app, and verify the installed bundle. It may take a long
> time. Do not publish or push anything.

Expected:

- Bounded work packets with packet checks and a final end-to-end audit.
- Installed application behavior is the terminal proof.
- Explicitly prohibits push and publication.

## Case 6: grounded authoring agent

Setup:

- Give the authoring agent a disposable repository with `AGENTS.md`, a dirty
  unrelated file, one failing test, and a documented verification command.

User request:

> Inspect this repo and write the best Codex prompt to fix the failure.

Expected:

- Uses the real paths, evidence, analogous pattern, and verification command.
- Protects the unrelated dirty file.
- Does not over-prescribe the implementation before Codex inspects.
