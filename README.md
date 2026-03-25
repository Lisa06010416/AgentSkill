# Agent Skill Repo

This repository is used to develop, organize, and deploy reusable skills for different agent platforms. It keeps platform-specific skill packages in one place so they can be edited here first and then deployed only where needed.

## Repository Layout

- `claud/skills/`: Claude skills
- `claud/system_prompt/`: Claude system prompts
- `claud/agent/`: Claude agent configs
- `codex/skills/`: Codex skills
- `codex/system_prompt/`: Codex system prompts
- `codex/agent/`: Codex agent configs
- `cursor/skills/`: Cursor rules or Cursor-specific variants
- `cursor/system_prompt/`: Cursor system prompts
- `cursor/agent/`: Cursor agent configs

Each skill should stay self-contained inside its own folder.

## Currently Available Skills

### Skills

- `github-writing-style`: Draft and normalize GitHub contribution text — branch names, PR titles, squash-merge titles, and commit messages.
- `code-review`: Code review guidelines and conventions.

### System Prompts

- `general`: Language rules (respond in Traditional Chinese; write code/files/comments in English) and clean code comment standards.

## Notes

- Deploy the individual skill folder, not the whole repository.
- Keep platform-specific files inside their own top-level folder.
- Prefer symlinks for personal installs when possible.
- Any change must be applied to all three platforms (`claud/`, `codex/`, `cursor/`) by default.
