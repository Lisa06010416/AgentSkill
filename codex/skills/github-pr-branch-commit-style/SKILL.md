---
name: github-pr-branch-commit-style
description: Draft and normalize GitHub writing conventions for branch names, PR titles, and commit messages. Use when Codex needs to propose, rewrite, or validate repository contribution text such as feature branches, bugfix branches, pull request names, squash-merge titles, or commit history wording.
---

# Github Writing Style

## Overview

Apply one consistent style for GitHub collaboration text. Prefer short, searchable, and action-oriented wording that makes branch lists, PR queues, and commit history easy to scan.

## Quick Workflow

1. Identify the change type: `feature`, `fix`, `refactor`, `docs`, `test`, `chore`, `perf`, or `hotfix`.
2. Extract the smallest useful scope from the work item, file area, or behavior change.
3. Generate the correct artifact format:
   - branch name: lowercase, hyphenated, no filler words
   - PR title: imperative summary with optional scope prefix
   - commit message: Conventional Commit style unless the user or repo clearly uses another convention
4. If the input is vague, infer a concise scope instead of copying the full ticket text.
5. If the repository already shows a different style, match the existing repo style and keep the same clarity goals.

## Branch Names

Use this pattern:

```text
<type>/<short-scope>
```

Rules:

- Keep everything lowercase.
- Use hyphens, not spaces or underscores.
- Keep the scope under about 3 to 6 words.
- Lead with the change type.
- Remove ticket-system filler like `task`, `work`, `update`, `stuff`.
- Keep identifiers only when they add value, for example `feature/proj-142-user-avatar-upload`.

Preferred examples:

- `feature/user-avatar-upload`
- `fix/login-rate-limit`
- `refactor/payment-status-parser`
- `docs/setup-env-vars`
- `hotfix/checkout-null-guard`

Avoid:

- `feature/add-a-new-feature-for-user-profile`
- `fix_bug_login`
- `branch-for-pricing-page`
- `misc/changes`

## PR Titles

Use this pattern:

```text
<Type>: <imperative summary>
```

Where `<Type>` is usually one of:

- `Feat`
- `Fix`
- `Refactor`
- `Docs`
- `Test`
- `Chore`
- `Perf`

Rules:

- Write the summary in imperative mood.
- Capitalize the first word after the colon.
- Focus on user-visible intent or engineering outcome.
- Avoid ending punctuation.
- Keep it readable in a PR list without opening the description.
- If useful, add a narrow scope prefix: `Fix(auth): Prevent duplicate refresh calls`.

Preferred examples:

- `Feat: Add avatar upload to profile settings`
- `Fix: Prevent duplicate order submissions`
- `Refactor: Simplify payment state mapping`
- `Docs: Clarify local development setup`
- `Test: Cover retry behavior for webhook sync`

Avoid:

- `Update stuff`
- `Fixed bug`
- `PR for login issue`
- `Feat: added avatar upload`

## Commit Messages

Use Conventional Commits by default:

```text
<type>(<scope>): <imperative summary>
```

The scope is optional when it does not help.

Preferred types:

- `feat`
- `fix`
- `refactor`
- `docs`
- `test`
- `chore`
- `perf`
- `build`
- `ci`

Rules:

- Keep the type lowercase.
- Keep the summary imperative and specific.
- Do not end the summary with a period.
- Keep the first line concise, ideally under 72 characters.
- Split unrelated changes into separate commits when possible.
- Use body text only when the why matters more than the what.

Preferred examples:

- `feat(profile): add avatar upload flow`
- `fix(auth): prevent duplicate refresh requests`
- `refactor(payments): isolate status normalization`
- `docs(readme): clarify uv setup`
- `test(sync): cover webhook retry path`

Avoid:

- `update code`
- `fix stuff`
- `misc changes`
- `feat: Added feature`

## Style Heuristics

- Prefer concrete nouns over abstract wording.
- Prefer the affected domain over the implementation detail.
- Prefer one outcome per artifact.
- Shorten aggressively when the branch, PR, or commit list will already provide surrounding context.
- Preserve ticket IDs only when the team relies on them.

## Response Format

When the user asks for help, return the result in the smallest useful form:

- for one item: give only the requested branch name, PR title, or commit message
- for multiple options: give 3 concise candidates
- for a mixed request: group under `Branch`, `PR`, and `Commit`

If the request is ambiguous, make a reasonable assumption and state it in one short line.

## References

Read [references/examples.md](./references/examples.md) when you need more before-and-after rewrites or quick mapping from raw task descriptions to polished GitHub text.
