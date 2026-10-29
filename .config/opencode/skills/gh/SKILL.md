---
name: GitHub CLI
description: Use when inspecting GitHub repositories or pull requests with gh, including metadata, diffs, checks, reviews, and comments, or performing an explicitly authorized GitHub action.
---

Use `gh` for GitHub operations.

## Pull requests

- View PR metadata, description, and review state with `gh pr view <number>`.
- View PR discussion comments with `gh pr view <number> --comments`.
- Inspect the proposed changes with `gh pr diff <number>`.
- Check CI status with `gh pr checks <number>`.

## Inline review comments

`gh pr view --comments` will not include every inline review comment. To retrieve the full set of
inline review comments, use the REST API endpoint:

```sh
gh api --paginate \
  -H "Accept: application/vnd.github+json" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  /repos/OWNER/REPO/pulls/PULL_NUMBER/comments
```

Replace `OWNER`, `REPO`, and `PULL_NUMBER` with the relevant repository and pull request number.

## Remote actions

Follow the global authorization rules before performing any GitHub mutation. Preparing a title or
body, recommending an action, or showing a command does not authorize that action.

When creating a pull request is explicitly authorized, use `gh pr create --fill-verbose` when the
commit subjects and bodies are suitable for the PR title and description; otherwise provide them
explicitly.
