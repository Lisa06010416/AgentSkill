# GitHub Writing Examples

Use these examples when the user gives rough task text and wants polished GitHub wording.

## Quick Mapping

| Raw request | Branch | PR | Commit |
| --- | --- | --- | --- |
| add user avatar upload | `feature/user-avatar-upload` | `Feat: Add avatar upload to profile settings` | `feat(profile): add avatar upload flow` |
| fix duplicate checkout submit | `fix/checkout-double-submit` | `Fix: Prevent duplicate order submissions` | `fix(checkout): prevent duplicate order submissions` |
| clean up payment parser | `refactor/payment-status-parser` | `Refactor: Simplify payment state mapping` | `refactor(payments): simplify status mapping` |
| update local setup docs | `docs/local-setup` | `Docs: Clarify local development setup` | `docs(readme): clarify local development setup` |
| add retry tests for webhook sync | `test/webhook-retry-sync` | `Test: Cover retry behavior for webhook sync` | `test(sync): cover webhook retry path` |

## Branch Rewrite Patterns

- `feature/add-a-new-feature-for-user-profile` -> `feature/user-profile`
- `fix_bug_login` -> `fix/login-bug`
- `branch/pricing-page-update` -> `feature/pricing-page`
- `hotfix/null issue on checkout page` -> `hotfix/checkout-null-guard`

## PR Rewrite Patterns

- `Update stuff` -> `Chore: Update shared lint configuration`
- `Fixed bug` -> `Fix: Prevent stale session redirects`
- `add profile page image support` -> `Feat: Add image upload to profile page`
- `refactor code in payment service` -> `Refactor: Simplify payment service state handling`

## Commit Rewrite Patterns

- `updated readme` -> `docs(readme): clarify project setup`
- `fix login` -> `fix(auth): prevent token refresh loop`
- `added tests` -> `test(api): cover invalid webhook signature`
- `cleanup` -> `refactor(core): extract request validation helper`

## Decision Shortcuts

- New user-facing capability: start with `feature/`, `Feat:`, `feat(...)`
- Bug fix or regression: start with `fix/`, `Fix:`, `fix(...)`
- Internal cleanup without behavior change: start with `refactor/`, `Refactor:`, `refactor(...)`
- Documentation-only change: start with `docs/`, `Docs:`, `docs(...)`
- Test-only change: start with `test/`, `Test:`, `test(...)`
