# Coding Style and Guidelines

## Python Standards (Google Style)

- **Line Length**: Configured in `pyproject.toml` (`[tool.ruff] line-length`).
- **Indentation**: 4 spaces (no tabs).
- **Naming**:
  - `snake_case` for functions, variables, and modules.
  - `PascalCase` for classes.
  - `ALL_CAPS` for constants.
- **Docstrings**: Required for all public APIs (Summary + Args/Returns/Raises).
- **Imports**:
  - Use `import x` for modules.
  - Use `from x import y` for submodules only.
  - Group imports: standard library, third-party, application-specific.
- **Exceptions**: Use specific built-in exception classes. Never use bare `except:`.
- **Typing**: Type annotations are strongly encouraged for all public APIs.

## Project-Specific Conventions

- **Dependencies**: The project uses `uv`. Manage dependencies with `uv add` / `uv sync`; do not edit
  lockfiles by hand.
- **Linting & Typing**: The project uses `ruff` for linting/formatting and `pyrefly` for static typing.
  - You MUST run both `ruff` and `pyrefly` after each edit on a Python file.
  - Refer to `pyproject.toml` for the exact `ruff` and `pyrefly` configuration (line length, selected
    rules, excluded paths) so your local checks mirror CI.
  - Auto-fix lint/format issues with `ruff check --fix <file> && ruff format <file>`.
- **Secrets**: Never hardcode secrets. Keep credentials in environment variables or a secrets manager.
- **Architecture**:
  - Prefer explicit composition and delegation over complex inheritance or prototype-based cloning.
- **Testing**:
  - New features or bug fixes should include tests in a `tests/` subdirectory next to the source.
