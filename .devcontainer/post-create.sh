#!/bin/bash
set -euo pipefail

WORKSPACE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# Install Claude Code.
curl -fsSL https://claude.ai/install.sh | bash

# Note: uv and a managed Python are baked into the image (see .devcontainer/Dockerfile).

# Use the agnoster oh-my-zsh theme.
sed -i 's/^ZSH_THEME=.*/ZSH_THEME="agnoster"/' "${HOME}/.zshrc"

# git safe directory
git config --global --add safe.directory "${WORKSPACE_DIR}"

# Sync the project environment (incl. dev tools).
cd "${WORKSPACE_DIR}" && "${HOME}/.local/bin/uv" sync

# Enable the pre-commit hooks (ruff + pyrefly) for this clone.
"${HOME}/.local/bin/uv" run pre-commit install
