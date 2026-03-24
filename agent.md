# Agent Skill Repo Guide

This repo is used to develop, manage, and deploy skills for different platforms.

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

Cursor can reuse shared skills from Claude or Codex skill directories, so a separate personal install is often unnecessary.

Recommended default:

- keep shared skill content in `codex_skills/` or `claud_skills/`
- deploy those to `~/.agents/skills` or `~/.claude/skills`
- let Cursor read from the shared locations

Use `cursor_skills/` only when you want a Cursor-native artifact such as a project rule or a Cursor-specific skill variant.

Project-local rule install:

```bash
mkdir -p <repo>/.cursor/rules
cp ./cursor_skills/<rule-folder>/<rule-file>.mdc <repo>/.cursor/rules/
```

## Notes

- Deploy the individual skill folder, not the whole repo.
- Prefer symlinks for Codex and Claude personal installs.
- Keep platform-specific files inside their own top-level folder.
- Cursor can often reuse the Codex or Claude deployment instead of requiring its own copy.
- Redeploy copied rules after changes; symlinked installs update automatically.
