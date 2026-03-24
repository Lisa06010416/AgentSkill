# Agent Skill Repo Guide

This repo is the source of truth for custom agent behaviors used across Codex, Cursor, and Claude.

## Folder Layout

- `codex_skills/`: skills intended for Codex
- `cursor_skills/`: rules or skill-like packages intended for Cursor
- `claud_skills/`: skills intended for Claude Code

Each platform should keep its artifacts self-contained in its own folder.

Example Codex / Claude skill:

```text
codex_skills/
  github-writing-style/
    SKILL.md
    agents/
    references/
```

Example Cursor rule package:

```text
cursor_skills/
  github-writing-style/
    github-writing-style.mdc
    references/
```

## Recommended Workflow

1. Edit the source files in this repo first.
2. Commit and push changes here.
3. Deploy each skill or rule using the mechanism expected by that platform.
4. Prefer symlinks where the platform supports local filesystem discovery.

This keeps version control in one place and avoids editing installed copies by accident.

---

## Codex

### Official discovery locations

Codex discovers skills from multiple scopes, not just one local folder:

- Repository scope: `.agents/skills` from the current working directory up to the repo root
- User scope: `~/.agents/skills`
- Admin scope: `/etc/codex/skills`

Codex also supports symlinked skill folders.

### Codex skill structure

A Codex skill is a directory with:

- `SKILL.md` (required)
- `references/` (optional)
- `assets/` (optional)
- `agents/openai.yaml` (optional)
- scripts or helper files as needed

### Recommended deployment

Run these commands from the repo root. For personal cross-project skills, install to:

```bash
mkdir -p ~/.agents/skills
rm -rf ~/.agents/skills/github-writing-style
ln -s "$(pwd)/codex_skills/github-writing-style" ~/.agents/skills/github-writing-style
```

For repository-specific skills, prefer committing them directly into the target repo:

```text
<repo>/.agents/skills/<skill-name>/
```

Do not assume `~/.codex/skills` is the canonical default skill directory unless you have explicitly customized your local environment to use it.

---

## Claude Code

### Official discovery locations

Claude Code supports skills at multiple scopes:

- Personal skills: `~/.claude/skills`
- Project skills: `.claude/skills`
- Nested project skills: subdirectory `.claude/skills` folders inside a repo
- Plugin-distributed skills: `skills/` inside a Claude plugin

### Claude skill structure

A Claude skill is a directory whose entrypoint is:

```text
<skill-name>/SKILL.md
```

Supporting files can live next to `SKILL.md` (examples, scripts, templates, references, etc.).

### Recommended deployment

Run these commands from the repo root. For personal cross-project skills:

```bash
mkdir -p ~/.claude/skills
rm -rf ~/.claude/skills/github-writing-style
ln -s "$(pwd)/claud_skills/github-writing-style" ~/.claude/skills/github-writing-style
```

For project-specific skills, prefer committing them directly into the target repo:

```text
<repo>/.claude/skills/<skill-name>/
```

If you later package shared Claude capabilities as a plugin, move them into the plugin’s `skills/` directory instead of copying ad hoc folders around.

---

## Cursor

### Use Rules or plugin-based distribution, not a guessed local “skills” folder

Cursor’s documented customization model is centered on:

- Rules stored as `.md` or `.mdc`
- Remote Rules added from GitHub
- Plugins distributed as Git repositories

Cursor documentation explicitly describes:

- `.md` / `.mdc` rules
- `.mdc` frontmatter for metadata and targeting
- adding remote rules from GitHub via Settings → Rules
- plugin distribution through Git repositories

Because of that, this repo should treat Cursor artifacts as source-managed rules or plugin content, not as folders copied into an assumed local skill directory.

### Recommended Cursor layout in this repo

```text
cursor_skills/
  github-writing-style/
    github-writing-style.mdc
    references/
```

### Recommended deployment options

#### Option A: project-local rule

Copy the rule into the target repository:

```text
<repo>/.cursor/rules/github-writing-style.mdc
```

#### Option B: Remote Rule from GitHub

Keep the rule in this repo and install it in Cursor through:

- Settings
- Rules
- Add Rule
- Remote Rule (GitHub)

#### Option C: plugin distribution

If you are packaging a broader Cursor extension, keep it in a plugin repository rather than treating it as a manually copied local skill folder.

Do not hardcode a `<cursor-skill-dir>` in this README unless you have verified a concrete local convention for your own setup.

---

## Generic Patterns

### Codex personal install

```bash
mkdir -p ~/.agents/skills
rm -rf ~/.agents/skills/<skill-name>
ln -s "$(pwd)/codex_skills/<skill-name>" ~/.agents/skills/<skill-name>
```

### Claude personal install

```bash
mkdir -p ~/.claude/skills
rm -rf ~/.claude/skills/<skill-name>
ln -s "$(pwd)/claud_skills/<skill-name>" ~/.claude/skills/<skill-name>
```

### Cursor project rule install

```bash
mkdir -p <repo>/.cursor/rules
cp ./cursor_skills/<rule-folder>/<rule-file>.mdc <repo>/.cursor/rules/
```

---

## Notes

- Copy or link the individual skill folder, not the whole repo.
- Prefer symlinks for Codex and Claude personal installs so local usage always tracks the repo version.
- For Codex and Claude, project-scoped skills are usually better committed directly into the target repository.
- For Cursor, prefer repo-local `.cursor/rules`, GitHub Remote Rules, or plugin packaging.
- Keep platform-specific metadata isolated to that platform’s folder.
- When a skill or rule changes, redeploy it if the platform does not track the source folder automatically.
