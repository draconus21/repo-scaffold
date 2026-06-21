---
name: commit-messages
description: How to write git commit messages for this project — short and clear. Use whenever composing a commit message for this repo.
---

# Commit Messages

Keep messages short and clear. State what changed and why, plainly — nothing more.

Write for a human reading `git log` later: a teammate should grasp the change at a
glance, without the diff in front of them. Favour plain language over jargon, and
explain intent rather than mechanics.

## Subject
- Imperative mood, ≤ ~50 chars, capitalized, no trailing period.
- Name the actual change, e.g. `Speed up collect_items with lazy path validation`.

## Body (only if the subject isn't self-explanatory)
- One or two short lines: what changed and, if not obvious, why.
- **Omit**: how the idea originated or what it "mirrors", per-file walkthroughs,
  restating the diff, and filler adjectives ("clean", "robust", "comprehensive").

## Trailer
End every commit with a Co-Authored-By line naming the Claude model actually
writing the commit (the current session's model — don't copy a stale name),
plus its context size in parentheses, e.g.:

```
Co-Authored-By: Claude Fable 5 (1M context) <noreply@anthropic.com>
```

## Example
```
Speed up collect_items with lazy path validation

Build split items with do_validation=False so per-item path resolution
(the startup bottleneck) is deferred to read time.

Co-Authored-By: Claude Fable 5 (1M context) <noreply@anthropic.com>
```
