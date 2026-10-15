---
name: design-workbench
description: "Coordinate all five installed UI/design skills in one deliberate pass: Taste frontend direction, Web Design Guidelines, Playwright CLI, Awesome DESIGN.md references, and Image-to-Code. Use when asked to combine these design skills, build or refine a web UI from a visual reference, or perform a full design-and-implementation pass."
---

# Design Workbench — combined five-skill workflow

When this skill triggers, explicitly load and use all five installed skills below in the same task. Read each `SKILL.md` before acting; do not assume an automatic skill invocation mechanism.

1. `design-taste-frontend/SKILL.md`
2. `web-design-guidelines/SKILL.md`
3. `playwright-cli/SKILL.md`
4. `awesome-design-md/SKILL.md`
5. `image-to-code/SKILL.md`

Resolve each relative path under the same installed skills root as this `design-workbench` skill. If the runtime does not expose sibling paths, locate the skill root or ask the user to install the pack before proceeding.

## Combined pass

1. **Classify the task.** Inspect the project, user brief, brand constraints, content, and any provided screenshot. Distinguish public-facing marketing pages from dashboards/app screens; use the Taste skill for its stated scope and Image-to-Code when a visual reference exists. Still load all five references, but apply each only where relevant.
2. **Synthesize direction.** Use Taste to develop a specific concept and page structure when applicable. Consult the DESIGN.md reference library for a small number of relevant precedents, then create an original, project-appropriate system rather than copying. For a screenshot task, infer tokens and layout through Image-to-Code.
3. **Implement.** Reuse the project's stack, tokens, and dependencies. Preserve truthful content; never invent testimonials, metrics, or proof. Build responsive, accessible states and avoid decorative complexity without purpose.
4. **Inspect live output.** Use Playwright CLI to open the local preview, review snapshots/screenshots at desktop and mobile widths, test key interactions, and iterate on visible defects. Do not stop at code review if a runnable preview is available.
5. **Audit.** Apply the Vercel Web Design Guidelines to relevant UI files. Fetch the current guidelines as instructed by that skill when network access is available; otherwise state the limitation. Fix high-severity issues, then repeat visual checks.
6. **Report.** Summarize changes, checks run, remaining issues, assumptions, and any unperformed source-specific Image-to-Code kit checks. Never report a check as passed unless it was actually run.

## Limits and safety

- The upstream Image-to-Code helper kit is not bundled in this installation. Follow its SKILL.md limitation; use project-local equivalents and be explicit about missing helpers.
- The bundled DESIGN.md files are examples, not current authoritative brand documentation. Verify before relying on time-sensitive details.
- Do not install packages, send data to third parties, or deploy/publish solely because a source skill mentions it; stay within the user's request and project permissions.
- The Playwright skill can interact with the browser. Keep tasks read-only or local unless the user explicitly requested otherwise; get confirmation before high-impact external actions.
