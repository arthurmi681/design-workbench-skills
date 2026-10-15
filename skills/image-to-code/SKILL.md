---
name: image-to-code
description: Reconstruct an interface from a screenshot, reference image, or mockup using an inferred design system, accessible components, and visual browser verification. Use when implementing a visual UI reference.
---

# Image to Code

Reconstruct the design language from a reference, not copyrighted imagery, logos, or copy. Treat pixel-perfect matching as an aspiration, not a promise.

## Workflow

1. Inspect the reference and record palette roles, typography, spacing/density, radius/depth, layout archetype, and content sequence. Separate observed facts from guesses.
2. Inspect the target project and its existing design system. Reuse its stack and conventions; do not invent or install dependencies without need.
3. Define one coherent theme with reusable tokens. Check text/background contrast and preserve semantic HTML, keyboard focus, responsive layouts, and meaningful states.
4. Implement shared primitives and complete the requested screen/content, using original or authorized assets. Avoid copying protected brand assets or text.
5. Render the result in a real browser, capture a screenshot, compare against the reference at relevant widths, and fix the largest visual and functional mismatches first.
6. Run available project tests, lint, and accessibility checks. Report any missing checks accurately.

## Upstream kit limitation

The source skill expects the full `plugin87/ux-ui-agent-skills` kit (including `tokens/`, `taste/`, `frameworks/`, `components/`, and project scripts) at a specific relative path. This installation includes the selected skill document but **not** that full kit, so its source-specific scripts (`contrast.py`, `measure_render.mjs`, `npm run verify`, etc.) are unavailable. Do not claim those gates passed or invent their output. Use equivalent checks already present in the project; if a workflow specifically requires the upstream kit, tell the user it must be installed separately.

Upstream source: `plugin87/ux-ui-agent-skills`, MIT license in `LICENSE`.
