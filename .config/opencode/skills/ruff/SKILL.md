---
name: ruff
description: Use when a Ruff rule's meaning, applicability, suppression, or correct fix is unclear, including rules referenced by noqa or ruff: ignore comments.
---

Use this skill only when a Ruff rule or its resolution is unclear.

1. Identify the exact rule code or name.
2. Read its documentation for the project's installed Ruff version with
   `ruff rule <rule-code-or-name>`. Use the project's usual command prefix when needed, such as
   `uv run`.
3. When applicability is unclear, inspect the relevant Ruff configuration, including rule selection,
   ignores, preview mode, and target Python version.
4. Explain why the rule exists and recommend a semantics-preserving fix. When suggesting an
   automatic fix, state whether Ruff classifies it as safe or unsafe.

If the project Ruff command is unavailable or online documentation is specifically needed, fetch the
official rule page. Do not assume it matches an older installed version. Rule pages use a
human-readable slug:

```text
https://docs.astral.sh/ruff/rules/<rule-name>/
```

When only a code is known, fetch this URL instead:

```text
https://docs.astral.sh/ruff/rules/<rule-code>/
```

Rule-code URLs redirect to the canonical rule-name page; follow that redirect.
