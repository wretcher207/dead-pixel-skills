# Codex Prompt Blueprints

Load only the branch that matches the target task. Remove any section that does
not change the result. Brackets are drafting cues, not required output.

## Compact

```markdown
[Implement/Diagnose/Review/Explain] [observable outcome] in [repository or
working directory]. Inspect the applicable AGENTS.md, [relevant evidence], and
the existing analogous implementation before acting. Preserve [invariant] and
unrelated changes. [Authority or non-goal.] Verify with [focused check] and
[real behavior check]. Report [concise evidence]. Do not stop at a plan when
implementation is authorized.
```

## Standard implementation

```markdown
Implement [observable outcome] in [repository or working directory].

Read the applicable AGENTS.md and inspect the current implementation, nearest
analogous pattern, working-tree state, and project verification path before
editing.

## Current evidence

[Observed or user-supplied current behavior and user impact.]

## Required behavior

- [Observable requirement]
- [Observable requirement]
- [Compatibility or product invariant]

## Boundaries and authority

- Preserve [important existing behavior].
- Keep [actual non-goal] outside scope.
- Do not commit, push, deploy, publish, send, purchase, or delete unless this
  prompt explicitly authorizes it.
- Preserve unrelated working-tree changes.

Choose the simplest implementation consistent with the existing architecture.
Ask only when a missing product decision would materially change the result or
new external authority is required.

## Completion contract

- [Focused reproduction or test passes.]
- [Adjacent regression/project verification passes.]
- [Runtime, integration, native, visual, or production behavior is directly
  verified at the real target seam.]
- Report changed files, exact verification evidence, and any true blocker.

Do not stop at a plan. Implement, verify, and audit the result against every
criterion above.
```

## Diagnosis or bug fix

For diagnosis-only work, use `Diagnose`, remove implementation authority, and
make the deliverable a cause report.

```markdown
[Diagnose/Fix] [specific failing behavior] in [repository].

Reproduce from this evidence:

1. [Step or artifact]
2. [Step]
3. [Observed result]

Expected: [behavior]
Actual: [behavior]

Inspect [known seam] but follow the evidence to the root cause. Preserve public
contracts and unrelated behavior. Do not patch around the symptom.

[If fixing is authorized:]
- Add or update the smallest meaningful regression test.
- Re-run the original reproduction after the change.
- Run the focused suite, then the project's standard verification.

Report the proven root cause, change, and exact results. If the full
reproduction is unavailable, distinguish what was proven from what remains
unverified.
```

## Visual or interaction implementation

```markdown
Implement [experience] in [repository]. Use [screenshot, video, or artifact] as
[target reference or negative baseline].

Read the applicable AGENTS.md and design system. Inspect the rendered
implementation before editing.

## Intended experience

[What users should understand or feel, grounded in product meaning.]

## Required behavior

- [Layout and hierarchy across target viewports]
- [Interaction and state behavior]
- [Motion or temporal behavior]
- [Accessibility, keyboard, and reduced-motion behavior]

## Failure modes

- Avoid [specific cheap-result pattern]; prefer [observable alternative].
- Preserve [existing functionality or visual invariant].

Choose implementation details after inspecting the current architecture. Add a
dependency only when it materially improves correctness or maintainability.

## Completion contract

- Focused checks and build pass.
- Inspect the real target surface at [viewports and states].
- Verify interaction or animation over time; a still image is insufficient.
- Compare the result against every required behavior.
- Install or deploy only when explicitly authorized and required for proof.
```

## Review or audit

```markdown
Review [artifact, diff, branch, or system] against [specification or risk].

This is a review request. Do not edit, commit, push, or publish.

Read [authoritative sources]. Inspect the real diff, runtime, and state rather
than relying on summaries.

Prioritize:

1. Correctness and regressions
2. Security, data loss, or irreversible behavior
3. Contract and compatibility violations
4. Missing tests or verification gaps
5. Maintainability issues that create concrete risk

Report only actionable findings, ordered by severity. For each finding include
the evidence location, failure scenario, and smallest viable correction. State
when no actionable findings remain. List residual verification gaps separately.
```

## Long-horizon execution

```markdown
Complete [verifiable end state] in [repository].

Read the applicable AGENTS.md, inspect the current state, and translate the goal
into bounded work packets in the active plan. The plan is an execution ledger,
not the deliverable.

Each packet must identify:

- Scope and likely files
- Observable output
- Smallest relevant check
- Dependencies
- Stop or rollback condition

Execution loop:

1. Re-read the goal and current packet.
2. Complete that packet plus necessary adjacent changes.
3. Run its check and repair failures caused by the work.
4. Record completed, failed, blocked, and next work.
5. Continue while an unmet acceptance criterion has a runnable, authorized step.

Do not begin optional polish while required criteria are incomplete. After two
materially identical failures, inspect the underlying seam and change approach.
Do not commit, push, merge, deploy, publish, send, purchase, or delete unless
explicitly authorized.

## Completion contract

- [Criterion with authoritative evidence]
- [Criterion with authoritative evidence]
- [End-to-end or production criterion]

Before finishing, audit the live result against every criterion. Report exact
proof and remaining external blockers. Do not infer completion from a plan,
compile, upload, deployment event, or still image when stronger proof is
required.
```
