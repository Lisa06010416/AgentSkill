diff --git a//Users/llin07/Documents/GitHub/AgentSkill/README.md b//Users/llin07/Documents/GitHub/AgentSkill/README.md
new file mode 100644
--- /dev/null
+++ b//Users/llin07/Documents/GitHub/AgentSkill/README.md
@@ -0,0 +1,34 @@
+# Agent Skill Repo
+
+This repository is used to develop, organize, and deploy reusable skills for different agent platforms. It keeps platform-specific skill packages in one place so they can be edited here first and then deployed only where needed.
+
+## Repository Layout
+
+- `codex_skills/`: skills for Codex
+- `claud_skills/`: skills for Claude
+- `cursor_skills/`: Cursor rules or Cursor-specific variants
+
+Each skill should stay self-contained inside its own folder.
+
+## Currently Available Skills
+
+### Codex Skills
+
+- `github-writing-style`: Helps Codex draft and normalize GitHub contribution text such as branch names, PR titles, squash-merge titles, and commit messages using short, searchable, action-oriented conventions.
+
+### Claude Skills
+
+- `github-writing-style`: Helps Claude draft and normalize GitHub contribution text such as branch names, PR titles, squash-merge titles, and commit messages using short, searchable, action-oriented conventions.
+
+## Workflow
+
+1. Edit skills in this repository first.
+2. Commit and push changes here.
+3. Deploy only the specific skill or rule you need.
+4. Prefer symlinks when the target platform supports them.
+
+## Notes
+
+- Deploy the individual skill folder, not the whole repository.
+- Keep platform-specific files inside their own top-level folder.
+- Prefer symlinks for personal installs when possible.
