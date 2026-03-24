# Agent Skill Repo Guide

This repo is the source of truth for custom skills and rules.

## Layout

- `codex_skills/`: Codex skills
- `cursor_skills/`: Cursor rules or rule-like packages
- `claud_skills/`: Claude skills

Keep each skill self-contained in its own folder.

## Workflow

1. Edit skills in this repo first.
2. Commit and push here.
3. Deploy only the specific skill or rule you need.
4. Prefer symlinks when the platform supports them.

## Codex

Common install targets:

- user scope: `~/.agents/skills`
- repo scope: `<repo>/.agents/skills`

Personal install from the repo root:

```bash
mkdir -p ~/.agents/skills
rm -rf ~/.agents/skills/<skill-name>
ln -s "$(pwd)/codex_skills/<skill-name>" ~/.agents/skills/<skill-name>
```

Repo-local install:

```text
<repo>/.agents/skills/<skill-name>/
```

## Claude

Common install targets:

- user scope: `~/.claude/skills`
- repo scope: `<repo>/.claude/skills`

Personal install from the repo root:

```bash
mkdir -p ~/.claude/skills
rm -rf ~/.claude/skills/<skill-name>
ln -s "$(pwd)/claud_skills/<skill-name>" ~/.claude/skills/<skill-name>
```

Repo-local install:

```text
<repo>/.claude/skills/<skill-name>/
```

## Cursor

Prefer project rules or GitHub-hosted distribution.

Project-local install:

```bash
mkdir -p <repo>/.cursor/rules
cp ./cursor_skills/<rule-folder>/<rule-file>.mdc <repo>/.cursor/rules/
```

You can also keep Cursor rules in this repo and add them in Cursor as Remote Rules from GitHub.

## Notes

- Deploy the individual skill folder, not the whole repo.
- Prefer symlinks for Codex and Claude personal installs.
- Keep platform-specific files inside their own top-level folder.
- Redeploy copied rules after changes; symlinked installs update automatically.
