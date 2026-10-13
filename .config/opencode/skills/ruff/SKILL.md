---
name: ruff
description: Use when a Ruff rule or how to fix it is unclear, including rules found in noqa and ruff: ignore comments.
---

Look up a Ruff rule only when the rule or how to fix it is unclear. The documentation helps explain
why the rule exists and how to fix violations.

First, use `ruff rule <rule-code-or-name>` to read the documentation for the installed Ruff version.
Use the project's usual command prefix when needed, such as `uv run`.

If Ruff is unavailable or the latest online documentation is needed, fetch the official rule page.
Rule pages use a human-readable slug:

```text
https://docs.astral.sh/ruff/rules/<rule-name>/
```

When only a code is known, fetch this URL instead:

```text
https://docs.astral.sh/ruff/rules/<rule-code>/
```

Rule-code URLs redirect to the canonical rule-name page; follow that redirect.
