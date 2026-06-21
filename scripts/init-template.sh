#!/usr/bin/env bash
# One-shot initializer for a repo created from this template.
#
# Replaces the PROJECT_* placeholders, renames the source package directory, and
# (optionally) removes itself. Run once, right after cloning your new repo:
#
#   bash scripts/init-template.sh
#
# It will prompt for each value; press Enter to accept the shown default.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

ask() {  # ask <prompt> <default> -> echoes the answer
  local prompt="$1" default="$2" reply
  read -r -p "$prompt [$default]: " reply || true
  printf '%s' "${reply:-$default}"
}

dir_default="$(basename "$ROOT")"
PROJECT_NAME="$(ask 'Project name (distribution, e.g. calib-serve)' "$dir_default")"
# Default package = project name with dashes -> underscores.
pkg_default="$(printf '%s' "$PROJECT_NAME" | tr '-' '_')"
PROJECT_PACKAGE="$(ask 'Python package (import name, e.g. calib_serve)' "$pkg_default")"
PROJECT_DESCRIPTION="$(ask 'One-line description' 'TODO: describe the project')"
PROJECT_AUTHOR="$(ask 'Author name' 'TODO')"
PROJECT_EMAIL="$(ask 'Author email' 'dev@example.com')"

echo
echo "Applying:"
echo "  PROJECT_NAME        = $PROJECT_NAME"
echo "  PROJECT_PACKAGE     = $PROJECT_PACKAGE"
echo "  PROJECT_DESCRIPTION = $PROJECT_DESCRIPTION"
echo "  PROJECT_AUTHOR      = $PROJECT_AUTHOR"
echo "  PROJECT_EMAIL       = $PROJECT_EMAIL"
echo

# Substitute placeholders in all tracked, regular (non-symlink) files. The package token
# is the lowercase `project_package` (it must be a valid Python module name); the rest are
# uppercase PROJECT_* string placeholders. All are distinct tokens, so order is safe.
subst() {  # subst <placeholder> <value>
  local token="$1" value="$2"
  grep -rIl --exclude-dir=.git -e "$token" . 2>/dev/null | while read -r f; do
    [ -L "$f" ] && continue   # never rewrite symlinks (CLAUDE.md, .claude)
    sed -i "s|$token|$value|g" "$f"
  done
}
subst PROJECT_DESCRIPTION "$PROJECT_DESCRIPTION"
subst project_package     "$PROJECT_PACKAGE"
subst PROJECT_AUTHOR      "$PROJECT_AUTHOR"
subst PROJECT_EMAIL       "$PROJECT_EMAIL"
subst PROJECT_NAME        "$PROJECT_NAME"

# Rename the source package directory.
if [ -d "src/project_package" ] && [ "$PROJECT_PACKAGE" != "project_package" ]; then
  mv "src/project_package" "src/$PROJECT_PACKAGE"
fi

echo "Done. Review the changes, then remove this script:"
echo "  rm scripts/init-template.sh && rmdir scripts 2>/dev/null || true"
