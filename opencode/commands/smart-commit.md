---
description: Analyze changes and commit each logical change separately
subtask: true
---

You are about to commit all uncommitted changes in this repository. Each commit must cover exactly **one logical change** (not one file — group related file changes together).

Follow these steps:

1. Run `git status` and `git diff HEAD` to see every staged, unstaged, and untracked change.
2. Read the diffs carefully. Group the changes into logical units. A logical unit is a single coherent purpose — e.g. one bug fix, one new feature, one refactor, one config change. Related changes across multiple files belong in the same commit.
3. Check the recent commit history with `git log --oneline -10` and match the existing commit message style.
4. For each logical group, in a sensible order (dependencies first):
   a. Stage **only** the files belonging to that group using `git add <paths>`.
   b. Write a commit message following **Conventional Commits**: `<type>: <short description>`. Common types: `feat`, `fix`, `refactor`, `docs`, `chore`, `test`.
   c. Run `git commit -m "<message>"`.
5. After all commits are made, run `git log --oneline -20` and report a summary of every commit you created.

Rules:
- Never commit files that contain secrets (`.env`, credentials, API keys).
- Never commit database files (`*.db`), `target/`, `dist/`, or `.trunk/`.
- Never run `git push`.
- Never amend existing commits.
- Do not create empty commits.
- If there are no changes to commit, say so and stop.
