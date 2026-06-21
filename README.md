# PROJECT_NAME

> Generated from the agent + devcontainer scaffolding template.
> Replace this README with your project's own once initialized.

## What this template gives you

- **Agent layer (`.agents/`)** — vendor-neutral config served to Claude Code (and any
  agent that reads `AGENTS.md`) via two symlinks:
  - `CLAUDE.md` → `.agents/AGENTS.md`
  - `.claude` → `.agents`
  - Inside: `settings.json` (a commit-message reminder hook), `styleguide.md`,
    and `skills/commit-messages/`. Add project-specific subagents under `agents/` if
    a repo needs them.
- **Devcontainer (`.devcontainer/`)** — minimal Ubuntu + `uv` + managed Python, with
  Claude state persisted across rebuilds and host SSH keys shared in. No GPU/NAS
  assumptions; add project-specific system libraries in the `Dockerfile`.
- **Python tooling** — `pyproject.toml` (hatchling + `uv` dev group), `ruff` + `pyrefly`
  config, and a `.pre-commit-config.yaml` wiring both through `uv run`.
- **CI** — `.gitlab-ci.yml` runs `ruff` lint + format-check and `pyrefly` type-check on
  the same `uv` image as the devcontainer. (On GitHub, swap in an equivalent workflow.)

## Using it

1. **Create your repo from this template** — on GitHub use *Use this template*; on
   GitLab fork or create from it (Settings → General → Project templates, or just clone
   and re-point the remote).
2. **Initialize** — fill in the project name, package, etc.:
   ```bash
   bash scripts/init-template.sh
   ```
   This substitutes the `PROJECT_*` placeholders, renames `src/project_package/`, and
   tells you how to delete itself. (Prefer doing it by hand? Find-and-replace
   `PROJECT_NAME`, `project_package`, `PROJECT_DESCRIPTION`, `PROJECT_AUTHOR`,
   `PROJECT_EMAIL`, then rename the package dir.)
3. **Open in the devcontainer** — VS Code → *Reopen in Container*. `post-create.sh`
   installs Claude Code, runs `uv sync`, and enables the pre-commit hooks.

## Placeholders

| Placeholder           | Meaning                              | Example       |
| --------------------- | ------------------------------------ | ------------- |
| `PROJECT_NAME`        | Distribution name (dashes ok)        | `calib-serve` |
| `project_package`     | Import package (underscores)         | `calib_serve` |
| `PROJECT_DESCRIPTION` | One-line description                 | —             |
| `PROJECT_AUTHOR`      | Author name                          | —             |
| `PROJECT_EMAIL`       | Author email                         | —             |

## Customizing per repo

- **System libraries**: add `apt-get install` lines to `.devcontainer/Dockerfile`.
- **Python version**: change `uv python install` in the Dockerfile and `requires-python`
  in `pyproject.toml`.
- **Not a Python project?** Drop `pyproject.toml`, `.pre-commit-config.yaml`, the `src/`
  package, and the Python lines in `post-create.sh`; the `.agents/` layer and devcontainer
  skeleton stay useful as-is.
