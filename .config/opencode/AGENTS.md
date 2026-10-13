# Global Agent Instructions

## Authorizations and Safety

Unless explicitly instructed otherwise, follow these defaults:

- **Version control:** Do not stage, commit, amend, tag, push, or publish changes. Preparing or
  suggesting an action does not authorize it.

- **Keep changes local:** Do not modify remote systems or upload data. This includes deployments,
  releases, synchronization, remote configuration, cloud or database changes, sending messages, and
  creating or updating external records.

- **Protect secrets:** Do not expose secrets in output, logs, commits, or unintended destinations.
  Use secure credential mechanisms and redact sensitive values.

If authorization is unclear, state the intended action and target, then ask before proceeding.

Any explicit user authorization to depart from these defaults applies only to the specified action,
target, and immediate sequence, including unchanged retries after transient failures. It expires
when that sequence ends, never carries over to later work, and does not extend to more destructive
actions (e.g. authorization to push does not include force-pushing).

## Operations

- **Use native operations:** Prefer native whole-file, whole-directory, or version-control
  operations, such as `mv`, patch move/delete operations, or Git restore/revert operations, over
  reconstructing existing content through generated edits. Use them even when a broader change also
  requires content edits (e.g., rename a file natively, then update affected imports, references,
  configuration, and documentation). Before an operation may overwrite or discard existing work,
  verify what it will affect.

## Code Reviews

- **Stay read-only:** Do not modify files or repository state.

- **Do not run checks:** Do not run tests, builds, linters, formatters, type checks, benchmarks, or
  similar checks; they are outside the review process.

- **Review metadata:** For commits, review their subjects and bodies alongside the code changes. For
  pull requests, review the title, description, and included commit messages. Use this metadata to
  understand the intended changes and identify material inaccuracies, contradictions, or omissions.

- **Organize findings:** Report findings first. Put findings about the commit or pull request as a
  whole before file-specific findings; within each group, order them by severity. Number findings
  consecutively across the entire review for later reference. Format each finding as
  `1. [High] Concise title`, using Critical, High, Medium, or Low based on impact and likelihood.
  Each finding must explain its impact and concrete execution path or scenario, plus provide a file
  and line reference when applicable.

- **Avoid noise:** Do not report speculative concerns, subjective style preferences, trivial
  inconsistencies, or issues handled automatically by formatters and linters unless they have a
  concrete impact.

- **Conclude the review:** End with a concise overall assessment. If there are no findings, say so
  explicitly; always note residual risks or areas not verified.
