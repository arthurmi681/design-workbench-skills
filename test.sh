#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
skills=(design-taste-frontend web-design-guidelines playwright-cli awesome-design-md image-to-code design-workbench)
for skill in "${skills[@]}"; do
  file="$ROOT/skills/$skill/SKILL.md"
  [ -s "$file" ] || { echo "FAIL: missing $file" >&2; exit 1; }
  awk 'NR == 1 && $0 != "---" { exit 1 } NR > 1 && $0 == "---" { found = 1; exit } END { if (!found) exit 1 }' "$file" || { echo "FAIL: invalid frontmatter delimiters: $file" >&2; exit 1; }
  grep -Eq '^name: [a-z0-9-]+$' "$file" || { echo "FAIL: missing skill name: $file" >&2; exit 1; }
  grep -q '^description:' "$file" || { echo "FAIL: missing description: $file" >&2; exit 1; }
  echo "OK: $skill"
done
[ "$(find "$ROOT/skills/awesome-design-md/references/design-md" -name DESIGN.md | wc -l)" -eq 84 ] || { echo 'FAIL: expected 84 DESIGN.md references' >&2; exit 1; }
bash -n "$ROOT/install.sh" "$ROOT/uninstall.sh" "$ROOT/test.sh"

tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT
mkdir -p "$tmp/bin" "$tmp/home/.agents/skills/design-taste-frontend" "$tmp/home/.agents/skills/playwright-cli"
printf 'user-taste-skill\n' > "$tmp/home/.agents/skills/design-taste-frontend/old.txt"
printf 'user-playwright-skill\n' > "$tmp/home/.agents/skills/playwright-cli/old.txt"
cat > "$tmp/bin/npm" <<'MOCK_NPM'
#!/usr/bin/env bash
if [ "${1:-}" = prefix ]; then printf '%s\n' "$FAKE_NPM_PREFIX"; exit 0; fi
exit 0
MOCK_NPM
cat > "$tmp/bin/playwright-cli" <<'MOCK_PLAYWRIGHT'
#!/usr/bin/env bash
if [ "${1:-}" = install ] && [[ " $* " == *" --skills=agents "* ]]; then
  mkdir -p "$HOME/.agents/skills/playwright-cli"
  printf 'mock playwright skill\n' > "$HOME/.agents/skills/playwright-cli/SKILL.md"
fi
exit 0
MOCK_PLAYWRIGHT
chmod +x "$tmp/bin/npm" "$tmp/bin/playwright-cli"
export HOME="$tmp/home" FAKE_NPM_PREFIX="$tmp/npm-global" PATH="$tmp/bin:$PATH"
AGENT_SKILLS_DIR="$HOME/.agents/skills" "$ROOT/install.sh" --no-browser >/dev/null
[ -s "$HOME/.agents/skills/design-workbench/SKILL.md" ]
[ -s "$HOME/.agents/skills/playwright-cli/SKILL.md" ]
[ -f "$HOME/.agents/skills/.design-workbench-skills-backup" ]
AGENT_SKILLS_DIR="$HOME/.agents/skills" "$ROOT/uninstall.sh" >/dev/null
[ "$(cat "$HOME/.agents/skills/design-taste-frontend/old.txt")" = user-taste-skill ]
[ "$(cat "$HOME/.agents/skills/playwright-cli/old.txt")" = user-playwright-skill ]
[ ! -e "$HOME/.agents/skills/design-workbench" ]
echo 'OK: install/uninstall preserves and restores existing skills; 84 DESIGN.md references present.'
