---
name: image-to-code
description: Reconstruct an interface from a screenshot, reference image, or mockup using an inferred design system, accessible components, and visual browser verification. Use when implementing a visual UI reference.
---

# Image to Code

Reconstruct the design language from a reference, not copyrighted imagery, logos, or copy. Treat pixel-perfect matching as an aspiration, not a promise.

## Local kit

The complete upstream `plugin87/ux-ui-agent-skills` kit is bundled in this skill's `kit/` directory under its MIT license. Resolve `SKILL_DIR` as the directory containing this `SKILL.md`, then set `KIT_DIR="$SKILL_DIR/kit"`. Check that `KIT_DIR/tokens/`, `KIT_DIR/taste/`, `KIT_DIR/scripts/`, `KIT_DIR/frameworks/`, and `KIT_DIR/components/` exist before using kit-specific resources. If one is missing, stop and report an incomplete installation; do not guess file contents.

Use the kit's guidance as needed:
- `${KIT_DIR}/.claude/rules/` for accessibility, tokens, typography, components, frameworks, and review guidance.
- `${KIT_DIR}/.claude/skills/design-tokens/SKILL.md` for DTCG token structure.
- `${KIT_DIR}/taste/design-taste.md` and `${KIT_DIR}/taste/aesthetic-systems.md` for visual direction.
- `${KIT_DIR}/frameworks/adapter-protocol.md` and `${KIT_DIR}/components/` for implementation patterns.

## Workflow

1. **Read the reference.** Record palette roles, typography, spacing/density, radius/depth, layout archetype, and content sequence. Separate observations from guesses.
2. **Inspect the target project.** Reuse its stack and established conventions. Read relevant kit rules and design-token instructions; use sibling `design-taste-frontend` when installed for a full public-facing page.
3. **Define the system.** Infer one coherent token theme. Verify color pairs with the kit's contrast tools when applicable; adjust failing combinations to meet accessibility requirements.
4. **Implement.** Build shared primitives and requested screens using semantic, token-driven components, keyboard support, meaningful states, and original or authorized assets. Do not reproduce protected imagery, logos, or copy.
5. **Render and compare.** Use the installed Playwright CLI to capture the result at relevant widths. Compare against the reference and fix the largest visual and functional mismatches first.
6. **Verify honestly.** Run relevant project tests and the kit checks that are applicable and supported. Examples include `python3 "$KIT_DIR/scripts/contrast.py"`, `python3 "$KIT_DIR/scripts/validate_contrast.py"`, and `node "$KIT_DIR/scripts/measure_render.mjs"`. Run kit package commands from `KIT_DIR` only when their purpose matches the task. A package-level `npm run verify` checks that kit/package's own gates; it does **not** by itself prove that the user's target project passes. Install kit dependencies only if a selected check actually requires them.
7. **Report.** State what was implemented, which checks actually ran, results, any assumptions, and any unavailable checks. Never claim pixel-perfect matching, WCAG conformance, or a passing gate without evidence.

Upstream source and license: `plugin87/ux-ui-agent-skills`; full snapshot and MIT license are under `kit/` and `kit/LICENSE`.
