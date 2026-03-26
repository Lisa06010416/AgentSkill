#!/usr/bin/env bash
# Injects github-writing-style guidelines when the prompt involves git artifacts
# (commit messages, branch names, PR titles, merge summaries).

export CLAUDE_HOOK_INPUT
CLAUDE_HOOK_INPUT=$(cat)

python3 - <<'EOF'
import json, sys, re, os

try:
    data = json.loads(os.environ.get("CLAUDE_HOOK_INPUT", "{}"))
    prompt = data.get("prompt", "")
except Exception:
    print('{"continue": true}')
    sys.exit(0)

pattern = re.compile(r'\bcommit\b|\bbranch\b|\bpull.?request\b|\bpr\b|\bmerge\b', re.IGNORECASE)
if not pattern.search(prompt):
    print('{"continue": true}')
    sys.exit(0)

skill_path = os.path.expanduser("~/.claude/skills/github-pr-branch-commit-style/SKILL.md")
if not os.path.exists(skill_path):
    print('{"continue": true}')
    sys.exit(0)

with open(skill_path) as f:
    skill = f.read()

print(json.dumps({"continue": True, "content": skill}))
EOF
