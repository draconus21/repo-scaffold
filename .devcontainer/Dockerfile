# Minimal Ubuntu base for the devcontainer. Swap the tag if you need a different
# Ubuntu release.
FROM mcr.microsoft.com/devcontainers/base:ubuntu-22.04

# Project-specific system libraries go here. Most pure-Python projects need nothing;
# wheels that link native libraries at load time (image/video/CUDA/etc.) may. Add them as:
#
# RUN apt-get update \
#     && apt-get install -y --no-install-recommends \
#         <packages> \
#     && rm -rf /var/lib/apt/lists/*

# uv (environment + dependency manager) + a managed CPython, baked into the image as the
# non-root container user so they're cached and offline-ready. No devcontainers/python
# feature is needed — uv provisions Python itself; postCreate only runs `uv sync`, which
# needs the workspace bind mount (absent at build time). Adjust the Python version to match
# `requires-python` in pyproject.toml.
USER vscode
RUN curl -LsSf https://astral.sh/uv/install.sh | sh \
    && /home/vscode/.local/bin/uv python install 3.10
USER root
