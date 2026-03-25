---
name: code-review
description: Perform a structured code review on diffs, files, or selected code. Use when Codex is asked to review code changes, audit a pull request, check for bugs or security issues, or give feedback on code quality.
---

# Code Review

## Overview

Produce a clear, actionable code review. Focus on correctness, security, maintainability, and clarity. Be direct — flag real issues, not style preferences unless they affect readability at scale.

## Quick Workflow

1. Read the code or diff in full before commenting.
2. Identify the change type: new feature, bug fix, refactor, performance, or other.
3. Scan for issues in priority order: correctness → security → performance → maintainability → style.
4. Group findings by severity.
5. Suggest concrete fixes, not just observations.
6. End with an overall verdict.

## Severity Levels

Use exactly these four levels:

- **Critical** — Must fix before merge. Data loss, security vulnerability, crash, or broken contract.
- **Major** — Should fix before merge. Logic error, missing error handling, significant performance issue.
- **Minor** — Fix when convenient. Code smell, inconsistent naming, unclear variable.
- **Nit** — Optional. Pure style, trivial rename, personal preference.

## Review Checklist

### Correctness
- Does the logic match the stated intent?
- Are edge cases handled (null, empty, overflow, off-by-one)?
- Are errors and exceptions caught and handled correctly?
- Are async operations awaited or handled properly?

### Security
- Is user input validated and sanitized?
- Are there injection risks (SQL, command, XSS)?
- Is sensitive data logged or exposed?
- Are auth and permission checks in place?

### Performance
- Are there N+1 queries or redundant I/O?
- Is expensive work done inside loops unnecessarily?
- Are large allocations or copies avoidable?

### Maintainability
- Is the code easy to understand without comments?
- Are functions and variables named clearly?
- Is there dead code or unused imports?
- Are magic numbers or strings extracted to constants?

### Tests
- Are new behaviors covered by tests?
- Do tests actually assert the right things?
- Are edge cases tested?

## Response Format

Structure your review as:

```
## Summary
One or two sentences: what the change does and your overall impression.

## Issues

### Critical
- **[File:Line]** Description of the issue.
  ```suggestion
  corrected code here
  ```

### Major
- **[File:Line]** Description.

### Minor
- **[File:Line]** Description.

### Nits
- **[File:Line]** Description.

## Verdict
APPROVE / REQUEST CHANGES / COMMENT — one sentence reason.
```

Rules:
- Omit severity sections that have no findings.
- Include a code suggestion whenever a fix is non-obvious.
- If no issues are found, say so clearly and approve.
- Keep each finding to 1–3 sentences: what is wrong, why it matters, how to fix it.
- Do not repeat the same finding at multiple severity levels.
