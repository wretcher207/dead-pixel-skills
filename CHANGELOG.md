# Changelog

All notable changes to Dead Pixel Skills are documented here.

## Unreleased

### Added

- `youtube-thumbnail-director` 1.0.0, an agent-agnostic thumbnail direction and
  review skill for 16:9 and 9:16, which checks the running agent's capabilities
  and names its deliverable before starting.
- `youtube-thumbnail-director-claude` 1.0.0, the same job rewritten around what
  Claude Code can do: find real assets in the repository, build the image in
  code, then read the result back and revise it at feed size.
- `hey-dude` 1.0.0, a portable and scope-bounded session-start skill.
- `later-dude` 1.0.0, a portable session-closeout skill with explicit external
  action gates.
- Repository-wide structural and portability validation for every released
  skill.

## 0.2.0 - 2026-07-17

### Added

- First public release of `codex-prompting`.
- Agent-agnostic grounded and handoff modes.
- Portable prompt blueprints for compact, standard, visual, diagnostic,
  review, and long-horizon work.
- Trigger and quality evaluation cases.
- Local package validator and Agent Skills metadata.
