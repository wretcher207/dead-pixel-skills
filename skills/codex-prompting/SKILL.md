---
name: codex-prompting
description: Use this skill when the user wants an agent to create, rewrite, critique, or harden a paste-ready prompt for OpenAI Codex from a rough request, bug report, screenshot, specification, or repository task. Covers implementation, diagnosis, review, UI work, refactors, and long-running execution. Do not use it merely because the current agent is Codex or because the user wants the target task executed.
license: See LICENSE.txt
compatibility: Agent Skills compatible. The authoring agent may use repository, file, image, or web tools when available; the generated prompt targets OpenAI Codex.
metadata:
  author: David Russell, Dead Pixel Design
  version: "0.2.0"
---

# Codex Prompting

Act as a prompt compiler. Convert the user's intent and available evidence into
one prompt that another agent can paste into OpenAI Codex.

The current agent is the **authoring agent**. Codex is the **target agent**.
Never assume they are the same product or have the same tools, context,
permissions, modes, or formatting features.

Do not execute the target task unless the user separately asks for that work.

## Output contract

Return:

1. One brief note only when it explains a material prompt-design decision.
2. One paste-ready Codex prompt in a plain Markdown fenced block.
3. An optional one-line Codex model or mode suggestion only when it materially
   helps and is verified against current official guidance.

Do not require writing blocks, artifacts, XML, proprietary tool names, or other
authoring-agent features. Do not append alternate prompts unless asked.

## 1. Establish authority and outcome

Classify the target task before writing:

- **Explain or analyze:** inspect and report; no edits.
- **Diagnose:** reproduce or trace the cause; no fix unless authorized.
- **Implement or fix:** edit and verify the requested change.
- **Review or audit:** report evidence-backed findings; no edits unless asked.
- **Visual implementation:** change the experience and verify the rendered,
  interactive result.
- **Long-horizon execution:** complete a multi-part outcome through bounded,
  verified work packets.

State the observable end condition near the start of the generated prompt.
Words such as "review," "look at," or "investigate" do not authorize edits,
commits, pushes, deployments, messages, purchases, publication, or deletion.

Completion criterion: the target task has one unambiguous authority class and
an outcome Codex can recognize as complete.

## 2. Choose an evidence mode

Use the strongest mode the authoring agent can support.

### Grounded mode

When repository, artifact, image, log, runtime, or web access is available,
inspect enough evidence to replace guesses with facts:

- Confirm the working directory and nested repository.
- Read applicable `AGENTS.md` files and the project sources they identify.
- Check working-tree state and preserve unrelated changes.
- Locate the real implementation seam, analogous pattern, tests, build path,
  and runtime or deployment surface.
- Inspect supplied screenshots, recordings, logs, traces, and specifications.
- Prefer live runtime, backend, installed-app, or production evidence over stale
  handoffs and recollection.

Include only evidence that changes the solution. Point to authoritative files
instead of pasting large source bodies.

### Handoff mode

When the authoring agent cannot inspect the target environment:

- Use only facts supplied by the user.
- Do not invent paths, commands, APIs, dependencies, or current behavior.
- Tell Codex what it must inspect before acting.
- Leave a placeholder only when a missing user-controlled value is essential
  to run the prompt. Otherwise let Codex discover the technical detail.
- State assumptions that could change the result.

Completion criterion: every factual claim in the generated prompt is supplied,
observed, clearly labeled as an assumption, or delegated to Codex to discover.

## 3. Select proportional depth

- **Compact:** one behavior, one likely seam, one or two checks.
- **Standard:** a non-trivial implementation, bug, review, or UI change.
- **Long horizon:** dependent phases, cross-system work, or work likely to cross
  context compaction.

Use the smallest structure that reliably carries the task. Read only the
matching template in [prompt blueprints](references/prompt-blueprints.md).

Completion criterion: removing another section would create a meaningful
ambiguity, authority risk, or verification gap.

## 4. Compile the completion contract

Include the parts that materially change execution:

- **Goal:** observable end state and user impact.
- **Evidence:** current behavior, reproduction, sources, and relevant paths.
- **Requirements:** behaviors that must exist.
- **Invariants:** behavior, interfaces, data, or design that must remain intact.
- **Freedom:** implementation choices Codex may make after inspection.
- **Non-goals:** nearby work that is genuinely outside scope.
- **Authority:** external, costly, destructive, or irreversible actions that
  remain unapproved.
- **Verification:** checks that prove each hard requirement.
- **Report:** concise evidence Codex must return at completion.

Write requirements as observable facts. Prefer "Refreshing preserves the saved
value" to "make persistence robust." Do not prescribe a library, architecture,
or algorithm unless compatibility, product meaning, or known failure evidence
requires it.

For visual work, translate taste into hierarchy, composition, behavior, motion,
accessibility, and concrete failure modes. A build is not visual proof; require
inspection of the real target state and temporal evidence for interaction or
animation.

Completion criterion: every hard requirement maps to an observable check.

## 5. Give Codex bounded autonomy

For implementation prompts, tell Codex to:

1. Inspect the current state and applicable instructions.
2. Make reasonable in-scope implementation decisions without asking about
   ordinary technical details.
3. Complete the next bounded unit.
4. Run the smallest relevant check.
5. Repair failures caused by the work.
6. Re-check the original acceptance criteria.
7. Continue while an unmet criterion has a runnable, authorized next step.

Require a change of approach after two materially identical failures. If no
runnable path remains, Codex should report the exact blocker and preserve the
evidence gathered.

Protect unrelated working-tree changes. Do not grant authority to commit, push,
merge, deploy, publish, send, buy, or delete unless the user granted it.

For long tasks, keep the goal near the beginning and repeat the completion
contract near the end. A plan is an execution ledger, not proof of completion.
Mention `/plan` or `/goal` only when the current Codex surface supports them and
the task benefits from them.

Completion criterion: Codex can proceed without routine questions while still
stopping before scope expansion or unapproved external action.

## 6. Build the verification ladder

Order evidence from cheap and local to authoritative:

1. Focused reproduction, test, typecheck, or static check.
2. Adjacent regression tests.
3. Project verification or build.
4. Runtime, UI, native app, service, or integration proof.
5. Production or authoritative external-state proof when authorized.

Do not invent commands. Require Codex to discover the project's real checks.
Distinguish preview, production, domain routing, backend state, billing, and
payout state when those seams matter.

Completion criterion: the ladder reaches the actual user-facing seam, not merely
the nearest convenient proxy.

## 7. Run the final audit

Before returning the prompt, verify all of the following:

- The first sentence names the target outcome.
- Source truth is separated from assumptions.
- The target authority and non-goals are clear.
- The prompt does not depend on capabilities unique to the authoring agent.
- Codex can discover missing technical details without invented placeholders.
- Every hard requirement has an observable check.
- Verification reaches the real runtime, integration, visual, or production
  seam when required.
- Unrelated work and unapproved external actions are protected.
- The prompt contains no persona theater, chain-of-thought request,
  contradiction, filler, or unverified command.
- The prompt is no longer than necessary.

If any check fails, revise before returning.

## Current Codex facts and maintenance

Use [the research snapshot](references/research.md) only when the user asks for
prompting methodology, current Codex behavior, model or mode advice, or an
update to this skill. Ordinary prompt generation does not need the research
file.

If current product behavior matters and the snapshot is older than 90 days,
verify official OpenAI Codex documentation before relying on it. Treat issue
reports as operational evidence, not product guarantees.
