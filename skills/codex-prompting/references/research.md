# Codex Prompting Research

Last verified: 2026-07-17

This is maintenance evidence for the skill, not boilerplate for generated
prompts. Product facts can change; verify current official sources when they
affect a deliverable.

## Verified official guidance

### Codex prompts

OpenAI's Codex prompting documentation says a useful prompt names the desired
behavior, points to relevant code or reproduction steps, preserves important
constraints, and says how to verify the change. Larger prompts benefit from
goal, context, output, and boundaries, but no rigid formula is required.

Source: https://learn.chatgpt.com/docs/prompting

### Planning and persistent goals

OpenAI currently documents `/plan` for multi-step investigation before editing
and `/goal` after planning when Goal mode is available. These are
surface-dependent conveniences, not requirements for a good prompt.

Source: https://learn.chatgpt.com/docs/prompting

### Issue-shaped work and repository context

OpenAI describes prompts shaped like GitHub issues and recommends persistent
repository conventions in `AGENTS.md`. Current Codex documentation says scoped
`AGENTS.md` files are combined from root toward the working directory, with
nearer instructions taking precedence. The default combined project-document
limit is 32 KiB.

Sources:

- https://openai.com/business/guides-and-resources/how-openai-uses-codex/
- https://learn.chatgpt.com/docs/agent-configuration/agents-md

### Reasoning-model prompting

OpenAI recommends simple, direct instructions; clear delimiters; zero-shot
prompts before examples; explicit end goals and constraints; and iteration
against success criteria. It advises against requests for hidden chain of
thought such as "think step by step."

Source: https://developers.openai.com/api/docs/guides/reasoning-best-practices

### Current GPT-5.6 guidance

As of this verification date, `gpt-5.6-sol` is the flagship GPT-5.6 tier.
OpenAI recommends choosing reasoning effort by evaluating representative work,
using `medium` as a balanced starting point and reserving `max` for the hardest
quality-first work. Model recommendations must be refreshed when current model
availability matters.

Source: https://developers.openai.com/api/docs/guides/latest-model

### Agent Skills portability

The Agent Skills specification requires a directory containing `SKILL.md` with
valid `name` and `description` fields. It supports optional license,
compatibility, metadata, scripts, references, and assets. Relative references
and progressive disclosure are portable across compatible clients. Product-
specific files such as `agents/openai.yaml` are optional adapters and are not
part of the portable skill contract.

Sources:

- https://agentskills.io/specification
- https://learn.chatgpt.com/docs/build-skills

## Operational evidence, not product guarantees

Open reports in the `openai/codex` repository document two useful failure modes:

- Applicable `AGENTS.md` rules may be applied inconsistently later in a long
  session, so task-critical constraints should remain in the active prompt and
  be audited at completion.
- Goal/audit requirements have been reported as incomplete after context
  compaction, so long work benefits from a concise completion contract and a
  final audit against the original goal.

Sources:

- https://github.com/openai/codex/issues/25884
- https://github.com/openai/codex/issues/19910

These are user reports. Do not present them as universal Codex behavior.

## Synthesis used by this skill

1. Prompt the observable result, not hidden reasoning.
2. Ground the task in evidence available to the authoring agent.
3. Delegate inspection to Codex when the authoring agent lacks environment
   access; never fill the gap with invented facts.
4. Separate required behavior, implementation freedom, non-goals, and
   unapproved external actions.
5. Give non-trivial work a verification-backed completion contract.
6. Replace unlimited persistence language with a bounded inspect, act, check,
   repair, and re-check loop.
7. Prefer the shortest prompt that removes meaningful ambiguity.

## Maintenance procedure

1. Recheck official Codex prompting, `AGENTS.md`, skills, model guidance, and
   long-running-work documentation.
2. Check recent `openai/codex` issues only for repeatable operational evidence.
3. Change the skill only when new evidence changes prompt construction.
4. Keep official product behavior separate from issue reports and local habits.
