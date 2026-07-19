# Dead Pixel Skills

Reusable agent skills created by David Russell and Dead Pixel Design.

## Available skills

### [`codex-prompting`](skills/codex-prompting/SKILL.md)

An agent-agnostic prompt compiler that turns a rough request, bug report,
screenshot, specification, or repository task into one grounded, paste-ready
prompt for OpenAI Codex.

It helps any Agent Skills-compatible authoring agent:

- distinguish prompt authoring from task execution;
- ground prompts in available evidence without inventing missing facts;
- set explicit authority, scope, constraints, and completion criteria;
- choose verification proportional to the risk of the requested work;
- produce portable Markdown that does not depend on the authoring agent.

### [`hey-dude`](skills/hey-dude/SKILL.md)

A portable session-start bookend. It focuses a resume on one selected project,
checks its current instructions, handoff, and working state, then moves into
the requested work without scanning personal memory stores or unrelated work.

### [`later-dude`](skills/later-dude/SKILL.md)

A portable end-of-session bookend. It verifies the selected work, preserves a
concise handoff, and requires explicit authority before committing, pushing,
deploying, publishing, or otherwise changing external state.

## Install

Copy the skill directory into the skills location used by your agent:

```sh
git clone https://github.com/wretcher207/dead-pixel-skills.git
cp -R dead-pixel-skills/skills/codex-prompting YOUR_AGENT_SKILLS_DIRECTORY/
cp -R dead-pixel-skills/skills/hey-dude YOUR_AGENT_SKILLS_DIRECTORY/
cp -R dead-pixel-skills/skills/later-dude YOUR_AGENT_SKILLS_DIRECTORY/
```

Common personal skill directories include:

| Agent | Directory |
| --- | --- |
| Codex and shared Agent Skills clients | `~/.agents/skills/` |
| Claude Code | `~/.claude/skills/` |
| OpenCode | `~/.config/opencode/skills/` |
| Hermes | `~/.hermes/skills/` |
| Oh My Pi | `~/.pi/skills/` |

Restart the agent after installation if it does not automatically reload
skills.

## Use

Ask your agent to create or improve a prompt for Codex:

> Use the codex-prompting skill to turn this request into a paste-ready Codex
> prompt: [describe the work]

The skill writes the prompt. It does not execute the target task unless you
separately request execution.

For session bookends:

> Use the hey-dude skill to resume the selected project.

> Use the later-dude skill to close out this session and preserve a handoff.

## Validate

```sh
./scripts/validate-skills.sh
```

## License

[MIT](LICENSE). Individual skill directories may repeat the license so they can
be distributed independently.
