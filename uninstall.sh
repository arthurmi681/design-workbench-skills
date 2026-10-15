#!/usr/bin/env bash
set -euo pipefail
TARGET="${AGENT_SKILLS_DIR:-$HOME/.agents/skills}"
MARKER="$TARGET/.design-workbench-skills-backup"
BACKUP_DIR=""
[ -f "$MARKER" ] && BACKUP_DIR="$(cat "$MARKER")"
for skill in design-taste-frontend web-design-guidelines playwright-cli awesome-design-md image-to-code design-workbench; do
  if [ -d "$TARGET/$skill" ]; then
    rm -rf -- "$TARGET/$skill"
    echo "Removed pack skill $TARGET/$skill"
  fi
  if [ -n "$BACKUP_DIR" ] && [ -d "$BACKUP_DIR/$skill" ]; then
    mv -- "$BACKUP_DIR/$skill" "$TARGET/$skill"
    echo "Restored previous skill $TARGET/$skill"
  fi
done
rm -f -- "$MARKER"
rmdir "$BACKUP_DIR" 2>/dev/null || true
echo "Pack files removed from $TARGET. The npm CLI and installed browser binaries were left untouched."
