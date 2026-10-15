# Design Workbench Skills

A portable pack of **six agent skills** for designing, implementing, and reviewing web interfaces. Five focused skills plus one orchestrator that explicitly reads and coordinates all five.

## Included

| Skill | Purpose |
|---|---|
| `design-taste-frontend` | Art direction and original, less-generic public-facing page design; includes its scripts, references, and assets. |
| `web-design-guidelines` | Practical web-interface review against the current public Vercel guidance. |
| `playwright-cli` | Browser automation using the official Playwright CLI skill. |
| `awesome-design-md` | Local reference library of 84 DESIGN.md examples. |
| `image-to-code` | Reconstruct a responsive, accessible design system from a screenshot or mockup. |
| `design-workbench` | Orchestrates all five focused skills in one implementation/review workflow. |

## Install

Requirements: Git, Node.js/npm, and an agent that reads Agent Skills (`SKILL.md`). On Linux, the optional browser setup may need permission to install Google Chrome.

```bash
git clone https://github.com/arthurmi681/design-workbench-skills.git
cd design-workbench-skills
./install.sh
```

By default skills are copied to `~/.agents/skills/`. Set `AGENT_SKILLS_DIR` to install elsewhere:

```bash
AGENT_SKILLS_DIR="$HOME/.claude/skills" ./install.sh
```

The installer installs `@playwright/cli`, asks it to install its agent skill globally, and installs Chrome for browser runs. If you do not need browser automation or cannot install Chrome yet, use `./install.sh --no-browser`; the Playwright skill and CLI are still installed, but browser-driven checks will need a browser later.

Then start a new agent session (some agents only discover skills at startup) and ask it to use **Design Workbench**. The focused skills can also be triggered individually.

To validate the checked-out pack without installing anything:

```bash
./test.sh
```

To remove only the six pack skill folders from the selected target:

```bash
AGENT_SKILLS_DIR="$HOME/.agents/skills" ./uninstall.sh
```

## Important limitations

- The upstream Image-to-Code repository's full helper kit is **not** included. The included skill has a complete manual/project-native workflow and explicitly does not claim that upstream-only scripts (`npm run verify`, `contrast.py`, etc.) ran. If a project specifically requires those helpers, install the upstream kit separately.
- DESIGN.md samples are inspiration, not current brand documentation. Do not copy another company's logo, imagery, text, or distinctive identity.
- The Vercel guidelines skill fetches current checklist content from its upstream URL at review time. Offline reviews must disclose that the checklist could not be refreshed.
- Playwright browser installation can require system package permissions. `--no-browser` skips that part.

## Sources and licensing

See [`THIRD_PARTY_NOTICES.md`](THIRD_PARTY_NOTICES.md) and [`SOURCES.md`](SOURCES.md). Bundled components retain their respective licenses; the root MIT license applies only to original pack installer, orchestration, and documentation content, not to separately licensed third-party files.
