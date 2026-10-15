# Sources and snapshot versions

The files are bundled snapshots, except the Playwright package which the installer intentionally fetches at the latest npm version. Upstream updates may change behavior; review diffs before updating the pack.

| Included component | Upstream | Snapshot |
|---|---|---|
| Taste Frontend | https://github.com/Leonxlnx/taste-skill | `f624f37a8c650b9cc550253104925efe4c8de246` |
| Vercel web-interface guidance reference | https://github.com/vercel-labs/agent-skills/tree/main/skills/web-design-guidelines | `063bee94c3f4df8453406c830b0a7df0f2860278`; pack contains an independent adapter. Live checklist: https://raw.githubusercontent.com/vercel-labs/web-interface-guidelines/main/command.md |
| Awesome DESIGN.md collection | https://github.com/VoltAgent/awesome-design-md | `3b605329240ce735b510037cca322f1831fdd7f8` |
| Image-to-Code | https://github.com/plugin87/ux-ui-agent-skills/tree/main/.claude/skills/image-to-code | `62092bd83bc3df0bcb9a2b3b643305ab11c547da`; adapted skill document, MIT license retained; full helper kit excluded. |
| Playwright CLI | https://www.npmjs.com/package/@playwright/cli | Snapshot docs from `0.1.22`; installer obtains latest at install time. Apache-2.0. |
| Design Workbench | Original orchestration for this pack | Pack version `1.0.0`. |
