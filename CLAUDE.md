# Agent Skill Repo Guide

This repo is used to develop, manage, and deploy skills for different platforms.

## Layout

* `codex/skills/`: Codex skills
* `codex/agent_md/`: Codex agent instruction file (deploys as `AGENTS.md`)
* `codex/agents/`: Codex agent configs
* `cursor/skills/`: Cursor rules or rule-like packages
* `cursor/agent_md/`: Cursor agent instruction file (deploys as Cursor User Rules)
* `cursor/agents/`: Cursor agent configs
* `claud/skills/`: Claude skills
* `claud/agent_md/`: Claude agent instruction file (deploys as `~/.claude/CLAUDE.md`)
* `claud/agents/`: Claude agent configs

Keep each skill self-contained in its own folder.

> **Default rule: every change — new skills, agent_md files, agent configs, or any other content — must be applied to all three platforms (`claud/`, `codex/`, `cursor/`) unless explicitly told otherwise.**

## config/skills.json

`config/skills.json` is the registry of all available skills. Each entry has:

| Field | Description |
|---|---|
| `name` | skill folder name |
| `description` | what the skill does |
| `tags` | array of tags; default is `["ALL"]` |
| `default_install` | whether to install by default |

### Deploy rules

When deploying skills, always read `config/skills.json` to determine what to install:

- **No tag specified** — install only skills tagged `"ALL"` that have `default_install: true`.
- **Tag specified** — install only skills whose `tags` array contains the given tag and have `default_install: true`.
- **`default_install: false`** — never install unless the user explicitly requests that skill by name, regardless of tags.

### Keeping config/skills.json up to date

When a skill is significantly modified (new behavior, changed scope, renamed), check whether the `description` or `tags` in `config/skills.json` need updating before finishing the task.

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

### Agent MD

`codex/agent_md/AGENTS.md` deploys as the `AGENTS.md` agent instruction file.

Personal install (user-level):

```bash
cp "$(pwd)/codex/agent_md/AGENTS.md" ~/AGENTS.md
```

Project-level install:

```bash
cp "$(pwd)/codex/agent_md/AGENTS.md" <repo>/AGENTS.md
```

### Agent

Personal install from the repo root:

```bash
mkdir -p ~/.agents/agents
rm -rf ~/.agents/agents/<agent-name>
ln -s "$(pwd)/codex/agents/<agent-name>" ~/.agents/agents/<agent-name>
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

### Hooks

Skills may include a `hooks/trigger.sh` that auto-injects the skill when relevant keywords appear in the user's prompt. After installing a skill, register its hook in `~/.claude/settings.json`:

```json
{
  "hooks": {
    "UserPromptSubmit": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "bash ~/.claude/skills/<skill-name>/hooks/trigger.sh"
          }
        ]
      }
    ]
  }
}
```

Symlinked installs pick up hook changes automatically.

### Agent MD

`claud/agent_md/CLAUDE.md` deploys as `~/.claude/CLAUDE.md` (user-level agent instructions).

Personal install:

```bash
cp "$(pwd)/claud/agent_md/CLAUDE.md" ~/.claude/CLAUDE.md
```

Repo-local install:

```bash
cp "$(pwd)/claud/agent_md/CLAUDE.md" <repo>/CLAUDE.md
```

### Agent

Personal install from the repo root:

```bash
mkdir -p ~/.claude/agents
rm -rf ~/.claude/agents/<agent-name>
ln -s "$(pwd)/claud/agents/<agent-name>" ~/.claude/agents/<agent-name>
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

### Agent MD

`cursor/agent_md/user_rules.md` deploys as Cursor's User Rules (configured via UI).

1. Open Cursor Settings (`Cmd + Shift + J`)
2. Select **Rules** in the sidebar
3. Paste the content of `cursor/agent_md/user_rules.md` into **User Rules**

### Agent

Cursor does not have a standalone agent config format. Use the Cursor Rules (`.mdc`) mechanism under `cursor/skills/` for agent-like behavior.

## Notes

* Deploy the individual skill folder, not the whole repo.
* Prefer symlinks for Codex and Claude personal installs.
* Keep platform-specific files inside their own top-level folder.
* Any change — skills, agent_md files, agent configs, or other content — must be applied to all three platforms (`claud/`, `codex/`, `cursor/`) by default, unless explicitly told otherwise.
* Deploying the Cursor skill is optional — skip it when a shared Claude or Codex install already covers it; deploy it when Cursor-native content or a local `.cursor/rules/` copy is needed.
* Redeploy copied rules after changes; symlinked installs update automatically.
* For larger changes or new skills, update `config/skills.json` first, then check if `README.md` needs changes.
* Keep AGENTS.md and CLAUDE.md in sync whenever either is modified.
