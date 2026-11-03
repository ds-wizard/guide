# Content-retention audit — 3 November 2026

Compared all **126 original pages** on `origin/develop` with their current 5.0 destinations, including moved and merged pages. Re-read removed prose, warnings, code examples and historical tables; compared restored pages with the pre-audit 5.0 text as well. **39 pages** received restorations or corrections. The page-by-page decisions are in [content-retention-audit.json](content-retention-audit.json).

## Restored

- Full Jinja variables, functions, filters, tests, asset helpers, reply-extraction options and examples
- A self-contained context 19.0 reference: 61 object classes, 368 direct public attributes/properties, helper signatures, raw JSON fields and examples
- Complete template metadata, compatibility rules, format/step and local TDK settings; template metamodel history from 1 through 18.2 alongside 19.0
- Historical knowledge-model, context and template schema tables, including their version-specific changes and release introductions
- TDK installation, commands, environment/shared configuration, translation extraction, plus the current context-generation, validation and batch-rendering instructions
- Editor metadata, versioning guidance, creation shortcuts and continuation after editor deletion; library menu actions and dependency warnings
- Smaller setup details: secrets example, dashboard/login announcements, authentication time units, user-list controls, encrypted submission properties, installed-plugin information and language Save reminder
- Markdown and Jinja syntax examples, preserving their original instructional purpose with native RST formatting
- Rendering-plugin hooks, a concrete custom-step example, plugin registration and optional-feature guards
- Secret-rotation procedure, storage/database troubleshooting and capacity/recovery considerations

## Corrections retained rather than restoring obsolete instructions

- Deleting a knowledge-model editor discards unpublished changes; it does not delete its published models
- Project migration preserves named history. Older claims that migration itself discards named versions were not reinstated
- Template deletion can remove dependencies in 5.0; the former blanket “cannot delete a used template” rule was not restored
- Current roles, permissions, PO translations, content identifiers and navigation replace former fixed-role, bundle and application-switching instructions
- In context 19.0, `extras.project` and `extras.submissions` remain supported; only the deprecated questionnaire alias was removed. A file reply exposes its linked file object
- Publishing includes editable license metadata; the instructions now match the actual form
- Historical schema links were checked against the local schema repository. Unpublished files are labelled; their historical rows remain
- The old incomplete automation sample used undefined variables and the previous response contract. The current assignment example and SDK link remain instead
- Old universal Enter-to-confirm shortcut, fixed hardware claims and old client customization paths were not reinstated without support in the current implementation

## Deliberate consolidation and pending items

- Duplicate profile and grouping pages are mapped to their current destinations; merging a page does not remove its distinct usable information
- Legacy API Integration migration pages remain removed as explicitly requested; historical template migration guidance remains
- Historical wording explains earlier formats and must not be read as current configuration instructions
- Earlier videos remain either marked as showing an earlier interface or inventoried for review. The DSW screenshot TODOs and FW outdated-image labels remain
- Exact OpenID setup steps restored in the previous correction remain intact
- No 5.1/5.2 promises or user-facing DSW workspaces were added

## Evidence and verification

Static checks used the original guide sources, current OS/shared frontend and FW frontend, backend configuration/services and engine-tools. The local engine-tools reference was refreshed to `a780164` for the shared renderer/models. The WeasyPrint 66.0 historical dependency was also checked against the `v4.22.0` package manifest.

The context reference is derived from the actual public object/wire implementation; stale upstream prose was corrected where it disagreed. Official provider connection instructions are cited directly on the Connected AIs page. AI Prefill's supported flow remains based on the user's explicit confirmation.

Final build, link/navigation and proofreading results are recorded in [content-retention-validation.json](content-retention-validation.json). Application flows and destructive procedures were not executed. Historical releases were not individually runtime-tested. No deployment, Notion edit or screenshot regeneration was performed.
