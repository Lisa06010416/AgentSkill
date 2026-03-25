# Agent Skill Repo Guide

This repo is used to develop, manage, and deploy skills for different platforms.

## Layout

* `codex/skills/`: Codex skills
* `codex/system_prompt/`: Codex system prompts
* `codex/agent/`: Codex agent configs
* `cursor/skills/`: Cursor rules or rule-like packages
* `cursor/system_prompt/`: Cursor system prompts
* `cursor/agent/`: Cursor agent configs
* `claud/skills/`: Claude skills
* `claud/system_prompt/`: Claude system prompts
* `claud/agent/`: Claude agent configs

Keep each skill self-contained in its own folder.

> **Default rule: every change — new skills, system prompts, agent configs, or any other content — must be applied to all three platforms (`claud/`, `codex/`, `cursor/`) unless explicitly told otherwise.**

## Codex

### Skills

Common install targets:

* user scope: `~/.agents/skills`

Personal install from the repo root:

```bash
mkdir -p ~/.agents/skills
rm -rf ~/.agents/skills/<skill-name>
ln -s "$(pwd)/codex/skills/<skill-name>" ~/.agents/skills/<skill-name>
```

### System Prompt

Personal install from the repo root:

```bash
mkdir -p ~/.agents/system_prompt
rm -rf ~/.agents/system_prompt/<prompt-name>
ln -s "$(pwd)/codex/system_prompt/<prompt-name>" ~/.agents/system_prompt/<prompt-name>
```

### Agent

Personal install from the repo root:

```bash
mkdir -p ~/.agents/agents
rm -rf ~/.agents/agents/<agent-name>
ln -s "$(pwd)/codex/agent/<agent-name>" ~/.agents/agents/<agent-name>
```

## Claude

### Skills

Common install targets:

* user scope: `~/.claude/skills`
* repo scope: `<repo>/.claude/skills`

Personal install from the repo root:

```bash
mkdir -p ~/.claude/skills
rm -rf ~/.claude/skills/<skill-name>
ln -s "$(pwd)/claud/skills/<skill-name>" ~/.claude/skills/<skill-name>
```

Repo-local install:

```text
<repo>/.claude/skills/<skill-name>/
```

### System Prompt

Personal install from the repo root:

```bash
mkdir -p ~/.claude/system_prompt
rm -rf ~/.claude/system_prompt/<prompt-name>
ln -s "$(pwd)/claud/system_prompt/<prompt-name>" ~/.claude/system_prompt/<prompt-name>
```

### Agent

Personal install from the repo root:

```bash
mkdir -p ~/.claude/agents
rm -rf ~/.claude/agents/<agent-name>
ln -s "$(pwd)/claud/agent/<agent-name>" ~/.claude/agents/<agent-name>
```

Repo-local install:

```text
<repo>/.claude/agents/<agent-name>/
```

## Cursor

### Skills

Whether to deploy the Cursor skill is a separate decision. Skip the Cursor deploy when:

* Cursor is already reading the skill from a shared Claude or Codex install location.
* The skill has no Cursor-specific behavior and the shared copy is sufficient.

Deploy the Cursor skill when:

* The skill contains Cursor-native content (project rules, `.mdc` files, Cursor-specific variants).
* The project requires a local `.cursor/rules/` copy that is not covered by a shared install.

Project-local rule install:

```bash
mkdir -p <repo>/.cursor/rules
cp ./cursor/skills/<rule-folder>/<rule-file>.mdc <repo>/.cursor/rules/
```

### System Prompt

Cursor system prompts are configured manually via the UI:

1. Open Cursor Settings (`Cmd + Shift + J`)
2. Select **Rules** in the sidebar
3. Paste the content of the prompt file into **User Rules**

### Agent

Cursor does not have a standalone agent config format. Use the Cursor Rules (`.mdc`) mechanism under `cursor/skills/` for agent-like behavior.

## Notes

* Deploy the individual skill folder, not the whole repo.
* Prefer symlinks for Codex and Claude personal installs.
* Keep platform-specific files inside their own top-level folder.
* Any change — skills, system prompts, agent configs, or other content — must be applied to all three platforms (`claud/`, `codex/`, `cursor/`) by default, unless explicitly told otherwise.
* Deploying the Cursor skill is optional — skip it when a shared Claude or Codex install already covers it; deploy it when Cursor-native content or a local `.cursor/rules/` copy is needed.
* Redeploy copied rules after changes; symlinked installs update automatically.
* For larger changes or new skills, check README.md to see if the skill description needs to be updated or added.
* Keep agent.md and CLAUDE.md in sync whenever either is modified.
