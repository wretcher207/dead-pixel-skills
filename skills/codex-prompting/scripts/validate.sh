#!/usr/bin/env bash
set -euo pipefail

skill_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
skill_file="$skill_dir/SKILL.md"
errors=0

fail() {
  printf 'FAIL: %s\n' "$1" >&2
  errors=$((errors + 1))
}

pass() {
  printf 'PASS: %s\n' "$1"
}

[[ -f "$skill_file" ]] || fail "SKILL.md exists"

name="$(awk -F': ' '$1 == "name" {print $2; exit}' "$skill_file")"
description="$(awk '$1 == "description:" {print substr($0, 14); exit}' "$skill_file")"
parent="$(basename "$skill_dir")"

[[ "$name" == "$parent" ]] && pass "name matches directory" || fail "name must match directory"
[[ "$name" =~ ^[a-z0-9]+(-[a-z0-9]+)*$ ]] && pass "name follows Agent Skills syntax" || fail "invalid name"
(( ${#description} > 0 && ${#description} <= 1024 )) && pass "description length is valid" || fail "description must be 1-1024 characters"

for required in LICENSE.txt references/prompt-blueprints.md references/research.md evals/trigger-queries.json evals/quality-cases.md; do
  [[ -f "$skill_dir/$required" ]] && pass "$required exists" || fail "$required is missing"
done

if rg -n "/Users/|ghostintheshell|~/workspace|David's repo" "$skill_dir/SKILL.md" "$skill_dir/references" "$skill_dir/evals" >/dev/null; then
  fail "portable files contain a local absolute path or private machine identifier"
else
  pass "portable files contain no private machine paths"
fi

if rg -n ':::writing|ask_user_dictation|apply_patch tool|functions\.' "$skill_dir/SKILL.md" "$skill_dir/references" >/dev/null; then
  fail "instructions depend on an authoring-agent-specific feature"
else
  pass "instructions contain no authoring-agent-specific feature"
fi

if (( errors > 0 )); then
  printf '%d validation check(s) failed\n' "$errors" >&2
  exit 1
fi

printf 'Skill validation passed\n'
