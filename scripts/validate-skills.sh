#!/usr/bin/env bash
set -euo pipefail

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
errors=0

fail() { printf 'FAIL: %s\n' "$1" >&2; errors=$((errors + 1)); }
pass() { printf 'PASS: %s\n' "$1"; }

for skill_dir in "$repo_dir"/skills/*; do
  [[ -d "$skill_dir" ]] || continue
  skill_file="$skill_dir/SKILL.md"
  name="$(awk -F': ' '$1 == "name" { print $2; exit }' "$skill_file" 2>/dev/null || true)"
  description="$(awk '$1 == "description:" { print substr($0, 14); exit }' "$skill_file" 2>/dev/null || true)"
  parent="$(basename "$skill_dir")"

  [[ -f "$skill_file" ]] && pass "$parent: SKILL.md exists" || { fail "$parent: missing SKILL.md"; continue; }
  [[ "$name" == "$parent" ]] && pass "$parent: name matches directory" || fail "$parent: name must match directory"
  [[ "$name" =~ ^[a-z0-9]+(-[a-z0-9]+)*$ && ${#name} -le 64 ]] && pass "$parent: name is valid" || fail "$parent: invalid name"
  (( ${#description} > 0 && ${#description} <= 1024 )) && pass "$parent: description is valid" || fail "$parent: invalid description"
  [[ -f "$skill_dir/LICENSE.txt" ]] && pass "$parent: bundled license exists" || fail "$parent: missing LICENSE.txt"

  if rg -n '/Users/|ghostintheshell|~/|wretcher207' "$skill_file" "$skill_dir/references" "$skill_dir/evals" 2>/dev/null; then
    fail "$parent: portable files contain a local path or private identifier"
  else
    pass "$parent: no local paths or private identifiers"
  fi
done

if command -v skills-ref >/dev/null 2>&1; then
  for skill_dir in "$repo_dir"/skills/*; do
    [[ -d "$skill_dir" ]] || continue
    skills-ref validate "$skill_dir"
  done
else
  printf 'SKIP: skills-ref is not installed; structural validation completed.\n'
fi

(( errors == 0 )) || exit 1
printf 'All skill validation passed.\n'
