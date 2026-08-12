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

### [`youtube-thumbnail-director`](skills/youtube-thumbnail-director/SKILL.md)

Direction, composition, and a quality gate for YouTube thumbnails in 16:9 and
9:16. It picks one packaging mechanism instead of decorating, protects the
fidelity of real screenshots and brand marks, and reviews its own output at
feed size before calling it done.

It checks what the running agent can actually do before promising anything.
Agents that can generate images produce finished files. Agents that can run code
build the thumbnail deterministically from assets the user already has. Agents
that can do neither deliver a paste-ready generation prompt and an ordered asset
list, which is a real deliverable rather than a failure.

### [`youtube-thumbnail-director-claude`](skills/youtube-thumbnail-director-claude/SKILL.md)

The same job, rewritten for Claude Code specifically. Claude cannot generate
images, so this variant leans on the two things it does well instead: reading a
repository to find the real assets, and building the thumbnail in code and then
looking at the result. It renders, views the file, downscales a copy to feed
size, views that too, and revises. When the image genuinely needs something
synthesized, it writes the prompt and asset list instead.

**Install one of the two, not both.** They cover the same request and will
compete for the trigger.

## Install

Copy the skill directory into the skills location used by your agent:

```sh
git clone https://github.com/wretcher207/dead-pixel-skills.git
cp -R dead-pixel-skills/skills/codex-prompting YOUR_AGENT_SKILLS_DIRECTORY/
cp -R dead-pixel-skills/skills/hey-dude YOUR_AGENT_SKILLS_DIRECTORY/
cp -R dead-pixel-skills/skills/later-dude YOUR_AGENT_SKILLS_DIRECTORY/
cp -R dead-pixel-skills/skills/youtube-thumbnail-director YOUR_AGENT_SKILLS_DIRECTORY/
```

For Claude Code, take the Claude variant instead of the line above:

```sh
cp -R dead-pixel-skills/skills/youtube-thumbnail-director-claude YOUR_AGENT_SKILLS_DIRECTORY/
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

For a thumbnail:

> Use the youtube-thumbnail-director skill. The video is titled "[title]". The
> assets are in [path]. I want 16:9 and 9:16.

The skill will tell you which of the three deliverables it is producing before
it starts, and will ask which image generator you are using if it needs to write
a prompt rather than build the image itself.

## Validate

```sh
./scripts/validate-skills.sh
```

## License

[MIT](LICENSE). Individual skill directories may repeat the license so they can
be distributed independently.
