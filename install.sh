#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
TARGET="${AGENT_SKILLS_DIR:-$HOME/.agents/skills}"
INSTALL_BROWSER=1
for arg in "$@"; do
  case "$arg" in
    --no-browser) INSTALL_BROWSER=0 ;;
    -h|--help)
      echo "Usage: ./install.sh [--no-browser]"
      echo "Target: AGENT_SKILLS_DIR (default: $HOME/.agents/skills)"
      exit 0
      ;;
    *) echo "Unknown option: $arg" >&2; exit 2 ;;
  esac
done

if ! command -v npm >/dev/null 2>&1; then
  echo "Error: Node.js/npm is required to install Playwright CLI." >&2
  exit 1
fi

skills=(design-taste-frontend web-design-guidelines playwright-cli awesome-design-md image-to-code design-workbench)
for skill in "${skills[@]}"; do
  [ -s "$ROOT/skills/$skill/SKILL.md" ] || { echo "Missing skill: $ROOT/skills/$skill/SKILL.md" >&2; exit 1; }
done

mkdir -p "$TARGET"
BACKUP_DIR="$HOME/.cache/design-workbench-skills/backups/$(date -u +%Y%m%dT%H%M%SZ)-$$"
MARKER="$TARGET/.design-workbench-skills-backup"
SUCCESS=0
rollback() {
  [ "$SUCCESS" -eq 1 ] && return 0
  for skill in "${skills[@]}"; do
    rm -rf -- "$TARGET/$skill"
    if [ -d "$BACKUP_DIR/$skill" ]; then
      mv -- "$BACKUP_DIR/$skill" "$TARGET/$skill"
    fi
  done
  rm -f -- "$MARKER"
  rmdir "$BACKUP_DIR" 2>/dev/null || true
}
trap rollback EXIT

for skill in "${skills[@]}"; do
  if [ -e "$TARGET/$skill" ]; then
    mkdir -p "$BACKUP_DIR"
    mv -- "$TARGET/$skill" "$BACKUP_DIR/$skill"
    echo "Backed up existing $skill -> $BACKUP_DIR/$skill"
  fi
done

for skill in design-taste-frontend web-design-guidelines awesome-design-md image-to-code design-workbench; do
  cp -a -- "$ROOT/skills/$skill" "$TARGET/$skill"
  echo "Installed $skill -> $TARGET/$skill"
done

npm install -g @playwright/cli@latest
export PATH="$(npm prefix -g)/bin:$PATH"
playwright-cli install --skills=agents --global
CLI_SKILL="$HOME/.agents/skills/playwright-cli"
if [ "$TARGET" != "$HOME/.agents/skills" ]; then
  [ -s "$CLI_SKILL/SKILL.md" ] || { echo "Playwright agent skill was not created at $CLI_SKILL" >&2; exit 1; }
  cp -a -- "$CLI_SKILL" "$TARGET/playwright-cli"
fi

if [ "$INSTALL_BROWSER" -eq 1 ]; then
  playwright-cli install-browser chrome
else
  echo "Browser installation skipped (--no-browser)."
fi

if [ -d "$BACKUP_DIR" ]; then
  printf '%s\n' "$BACKUP_DIR" > "$MARKER"
  echo "Previous skills backed up at: $BACKUP_DIR"
fi
SUCCESS=1
trap - EXIT
printf '\nDone. Installed 6 skills under: %s\n' "$TARGET"
printf 'Start a new agent session if it does not discover skills immediately.\n'
