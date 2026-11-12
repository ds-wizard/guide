# DSW 5.0 guide work log

## 3 November 2026

- Fetched origin/develop and switched the clean DSW guide checkout to develop at 5d045d4
- Adapted shared 5.0 text from the FW guide after reviewing the OS frontend menu, routes, permissions, settings, startup and Docker layout, public backend handlers/config/migration and engine-tools. Evidence and conflicts are recorded in maintenance/5.0-source-review.md
- Reworked navigation and prose for DSW: direct user creation, instance-wide roles/permission matrix, user groups, project migration, content editors/libraries, PO interface/email translations and Registry account keys. Added appearance/command-palette and support instructions
- Excluded user-facing workspaces and all FW-only flows. The shared raw document-context workspace property is technical metadata only. No 5.1/5.2 feature promises
- Updated self-hosting configuration, API/client paths, current template/context metadata, privacy/terms settings and 5.0 upgrade guidance. Historical 4.x upgrade notes retained. Corrected the old assertion that project migration drops named versions; the current migration appends events rather than deleting named history
- Removed all old inline screenshots and their binary assets; replaced image locations with visible native Sphinx TODOs. The screenshot manifest records future capture locations. Five older video embeds removed pending relevance review, with URLs retained in maintenance/video-review.json
- Applied the reviewed Furo/Nunito style with OS DSW orange branding, responsive home cards, intrinsic logo dimensions and the single sidebar-position restoration mechanism. No tracking scripts, image-swapping extension or new dependency

## Verification and remaining work

- Strict HTML and LaTeX-source builds plus local link/navigation/app-guide-link validation are run before delivery; final results recorded in maintenance/validation.json
- Still to do: supply a DSW 5.0 capture environment, create example data, take and review screenshots, and replace the TODOs. Review/re-record relevant videos. No application flows were runtime-tested without an environment
- No commit/push, PR, Read the Docs settings change, deployment or Notion edit is part of this update

### Final verification

- 126 source pages, all reachable from the index; no orphan, duplicate toctree parent, missing target or cycle
- Final strict HTML and LaTeX-source builds pass using the DSW guide's existing Sphinx 8.2.3 environment. The earlier prepared draft also built with Sphinx 9.1.0; requirements and hosted build settings remain unchanged
- 25,087 generated local references and all 38 current OS-client guide links checked successfully. External sites were not live-tested
- 129 visible screenshot TODOs inventoried; 99 legacy inline image assets removed. No old application screenshots remain in rendered pages
- Browser review: dark home page, light project-creation page with TODOs, permission matrix and expanded navigation. Removed unused front-page illustration spacing. No actual PDF was compiled or inspected in this update
- `git diff --check` passes. Preview: http://127.0.0.1:8772/index.html. Source edits are local on develop; no commit/push or release

## Compact navigation labels — 3 November 2026

- Restored context-specific toctree titles: List, Editors, Create, Detail, Compare, Import, Preview, Migration, Templates and Settings; applied across Knowledge Models, Document Templates, Projects and related feature menus
- Kept descriptive article titles, URLs, anchors and the actual Knowledge Model editor-tab name unchanged. Native toctree labels only; no new CSS or JavaScript
- Both guide previews retained on separate ports: FW 8769, DSW 8772. Strict HTML builds and rendered navigation-label checks run before delivery

## Factual, editorial, flow and link audit — 3 November 2026

- Audited all 126 pages structurally and checked core claims against current OS sources. Corrected 30 RST pages plus native mobile-title configuration; details and source evidence in maintenance/guide-audit-2026-11-03.md
- Corrected sharing/history/template permissions, reversion effects, integration-link claims, model-preview flow, editor markers and rendering-plugin imports. Removed orphaned video prose, unsupported legacy sizing/security assurances and internal release-policy claims. Reordered existing navigation entries without removing targets
- Shortened long paragraphs; fixed one real external 404; updated native Publish heading and mobile header. Reviewed representative desktop/phone pages in both themes
- Strict HTML/LaTeX-source builds, 25,103 local references, 38 frontend help targets and diff checks pass. External check has zero broken URLs; anchor-check scope is recorded in the audit. 129 screenshot TODOs remain
- Pending: screenshot environment, application acceptance and PDF visual review. Recorded the app's misleading private-project tooltip separately; no app code changed. No commit/push, release, deployment or Notion edit

## Full nested TOC verification — 3 November 2026

- Reproduced stale long labels on the generated FW Compare page despite correct source aliases. Earlier incremental builds did not rewrite every dependent sidebar
- Completed the nested Publish alias and rebuilt with native Sphinx -E -a, refreshing every HTML page. Documented this rebuild in README; no extra runtime mechanism
- Compared all explicit toctree aliases on every rendered sidebar, including 404 prefixes: 129 pages and 4644 labels pass. No missing targets, unexpected orphans, duplicate parents or cycles; standalone 404 is intentional
- Evidence: maintenance/toc-render-check.json. Article titles/URLs retained. Both preview servers continue running; no push or publication

## Settings navigation and legacy integration page removal — 3 November 2026

- Grouped Settings into Users & Access, Projects, Appearance, Features & Integrations, Translations, and Plan & Usage, matching the 5.0 app menu. Used native Sphinx group pages because nested toctree captions do not appear in Furo's sidebar; existing article URLs retained
- Removed the Legacy API Integration migration page and its toctree entry; removed stale generated HTML/source/doctree from the preview output. Project and knowledge-model migration pages retained
- Matched FW sidebar behavior with scroll-behavior:auto; reused the existing inline position restoration. Cypress verifies unchanged scrollTop (124px), clicked link position and all 91 sampled frames during navigation
- Verification: full strict HTML rebuild, every rendered sidebar alias, internal links and toctree topology pass; both groups visually inspected. Evidence in maintenance/toc-render-check.json and maintenance/menu-navigation-check.json. No outstanding issue for this request; previews remain on DSW 8772 and FW 8769

## Pull request preparation — 3 November 2026

- Fetched origin/develop and verified it matches the checkout base (5d045d4). Created docs/dsw-5-guide for a pull request targeting develop; the existing preview/production release cycle remains
- Included the 5.0 guide content, native navigation groups and sidebar stability fix, DSW branding/fonts/templates, screenshot TODO inventory, README and review evidence
- Re-ran clean strict HTML and LaTeX-source builds successfully. Validated 130 reachable source pages, 27,059 local references and all 38 application help targets; no orphan pages, duplicate parents or cycles. git diff --check passes
- Remaining work: replace the 129 screenshot TODOs when the DSW environment is ready, then inspect the rendered downloadable PDF and run application-flow acceptance checks. This PR does not claim those checks are finished

## Restore original OpenID setup instructions — 3 November 2026

- Restored the original numbered Microsoft Azure (34 steps), ORCID (18 steps) and Custom provider (12 steps) instructions and advanced scope explanations from the pre-5.0 guide, following the user's wording and sequence
- Limited 5.0 edits to the current Settings navigation, root callback URL, Client Secret Value and Advanced configuration labels, and Create versus Save. Retained current FW captures / DSW screenshot TODOs; restored the existing FW automation section with its current internal guide link
- Strict HTML and LaTeX-source builds pass in both guides. Provider instructions were restored from the original guide, not independently revalidated against live provider portals. No identity-provider or application configuration changed

## Full content-retention audit — 3 November 2026

- Compared all 126 original pages against mapped 5.0 pages; restored/corrected 39 pages. Retained useful reference detail, examples, warnings and metamodel history rather than replacing them with short summaries or external links
- Re-read restored pages and compared against the pre-audit 5.0 text to retain newer migration/security/source/workspace cautions too
- Corrected outdated examples and publishing metadata against current code. Kept exact OpenID steps, current navigation, supported 5.0 flows and authorized legacy migration-page removal
- Detailed decisions, evidence, limitations and verification: maintenance/content-retention-audit.md, content-retention-audit.json and content-retention-validation.json
- No screenshot capture/regeneration, application-data change, deployment, Notion edit, commit or push in this audit

Final verification: strict HTML and LaTeX-source builds passed; 27415 local references checked; no link/image errors, missing toctree targets, or rendered alias errors. All 21 earlier template-metamodel entries and 62 schema-history rows retained. OpenID pages match the preceding fix exactly. `git diff --check` passed. Browser review covered restored technical-reference layout. The existing previews were rebuilt.

## DSW mediakit 5.0 screenshots — 3 November 2026

- Added 117 unique Cypress screenshots in 118 placements from the upgraded DSW mediakit instance. Replaced matching placeholders only; retained 13 visible TODOs for unavailable or separately staged examples
- Native RST figures include alt text and constrained display widths (480px dialogs, 520px cropped forms, 760px full views, without upscaling). Modals preserve the actual grey backdrop; detail views collapse the app sidebar where useful
- Updated maintenance/screenshot-todos.json and screenshot-integration.json with the current environment and remaining examples. Retained the semantic KM migration diagram
- Common upgraded to 2.8.3 and My Experiment migrated with user approval. Exactly two original projects remain; LS/H2020 still show update examples. Czech screenshot locales enabled, English remains default
- Verification: 116/118 captures passed together and the two document previews passed in a focused follow-up; exact temporary settings restoration verified. Strict HTML/LaTeX-source builds, local links/images, toctree labels and 38 application help links pass. Local review: http://127.0.0.1:8772/
- Remaining environment/template issues: ../dsw-screenshots/ISSUES.md. No commit, push or guide publication

## Screenshot/content refinement — 3 November 2026

- Removed the News article and profile navigation reference following the confirmed DSW scope. The shared client contains News code; this is a product-scope exclusion, not a claim that no implementation exists
- Removed the personal Submission Settings screenshot and redundant email-upload image; retained the useful explanatory text
- Sidebar restores its position but uses only the new page's active ancestors, so visited branches no longer accumulate open
- Rechecked upgrade guidance against the OS 5.0 migration and deployment experience: added the verified duplicate-ID prerequisite and corrected Docker instructions to start the server before workers. Historical upgrade notes retained; Document Context 19.0 deferred to the separate contributor PR
- FAQ source requires Claude authentication; requested readable contents rather than inventing its questions

### Final review of the refinement batch

- Integrated 118 distinct images in 120 placements; 12 remaining screenshot TODOs. Added sharing with multiple collaborators/group, populated files/documents/user groups, cropped preferences, last-row menus, saved settings and their visible dashboard/login result, and demo OpenID configuration
- Added five DSW FAQ questions: concepts, automatic saving, unanswered questions, PDF/Word generation and separate interface/questionnaire languages. Source: the supplied AI Assistant Questions — FAQ Input.txt; unverified AI answers and commercial-only topics excluded
- Browser navigation Knowledge Models → Projects confirmed the old section closes while the new section opens. Strict HTML build, 27,800 local references, all 38 app help links and sidebar labels pass. Screenshot dimension review also corrected two clipped images
- Upgrade guidance now explicitly orders server migration before worker startup and notes duplicate content IDs. Exact provider setup instructions and historical upgrade material retained. Document Context 19.0 reserved for the separate contributor PR
- Review at http://127.0.0.1:8772/; remaining environment/template findings remain in ../dsw-screenshots/ISSUES.md. No commit or publication

## Final proofreading and outstanding inventory — 3 November 2026

- Ran whole-source checks for unfinished markers, long paragraphs, spelling/grammar patterns, commercial-only terminology and obsolete route references. Historical upgrade examples and exact provider steps retained
- Corrected wording on eight pages without removing reference material. Source comparison also corrected the KM editor migration action from Upgrade to the actual 5.0 label Update; Apply/Reject/Apply all/Publish verified in the current OS client
- Strict HTML build and link/image/toctree validation pass: 27,800 local references, all 38 application help targets, no orphan pages, duplicate parents or cycles. Patch whitespace check passes
- Confirmed all 12 remaining todo directives are screenshot/diagram placeholders, matching maintenance/screenshot-todos.json. They cover KM schema, Registry translations, acronym validation, three KM migration views, Connected Accounts, personal plugin settings, unsupported-format preview, two API-integration examples, and Registry catalogue/API keys
- Separate content handover: Document Context 19.0 and related contributor material are still expected in the other PR. No screenshot generation, instance data changes, commit or push during this proofreading pass

## KM migration screenshots and placeholder removal — 3 November 2026

- Added three real Cypress captures: clean Chemistry editor with update badge/menu, parent-version selection dialog, and a focused change-review card. Integrated in the existing KM migration instructions with alt text and established figure sizes
- Reused the existing outdated Chemistry editor; cancelled the temporary migration after capture and compared the editor DTO with its original snapshot exactly. No change applied or model published; no extra editor, model or project added
- Removed the other nine screenshot/diagram TODO directives as requested, preserving their explanations. Adjusted the knowledge-model introduction to avoid referring to a removed diagram
- Confirmed unsupported-format preview in the current OS client: Download preview message and Download button. Kept this explanation and removed its screenshot placeholder
- Guide now has 121 distinct screenshots in 123 placements, zero remaining TODO directives. HTML and LaTeX-source builds pass; 27,809 local references and all 38 app help targets pass, with no orphan pages, duplicate parents or cycles
- Document Context 19.0 and related material remain assigned to the separate contributor PR. No commit or push

## Document template metamodel and TDK update — 3 November 2026

- Reviewed engine-tools main a780164. Restored the pre-5.0 structure and full descriptions of Document Context, Metamodel Schemas, Template Specification and the Jinja step, and updated them to metamodel 19.0. These pages no longer defer to descriptions in engine-tools
- Entities come from the dsw-models graph module, because the upstream DocumentContext.md is out of date for knowledge-model entities. Replaced the old class diagram with four Mermaid diagrams generated from that module and committed as light and dark SVGs plus a PDF for the LaTeX build, see README
- Added metamodel 18.3 and 19.0 history with the migration tables, TDK installation, configuration, context generation and render options, extract_replies version 2, translations, Excel and Pandoc step corrections and worker upgrade notes
- Replaced the template_json_schema_v18-2.json link because dsw-schemas does not contain that file. Schemas for 18.1 to 19.0 are marked as not published
- Left out TDK workspace options because workspaces are outside the DSW guide's scope
- Restored the MS Word image compression note and the TDK Docker usage. Worker configuration details are intentionally not documented
- Strict HTML build passes. Not verified: the TDK and Docker commands were checked against source only and not run; rendered pages and the PDF were not reviewed

## TDK 5.0.0 page — 3 November 2026

- Reviewed the TDK page against engine-tools main a780164, which is planned for release as 5.0.0. Pinned the install and Docker examples to 5.0.0, which is not published yet; PyPI has 4.35.0 and Docker Hub has 5.0.0-rc.1
- Added named environments, default directories and files, and upgrade notes from TDK 4.x
- Strict HTML build passes. The commands were checked against source only and not run

## Combine local guide work with PR #289 — 3 November 2026

- Fetched contributor commits 3163735 and 2a8d95d from docs/dsw-5-guide-dt-dev (PR #289, targeting docs/dsw-5-guide / PR #288). Saved local guide work in 11dfcb7 before combining the branches
- Resolved overlapping technical-reference changes using the contributor's current Document Context 19.0, TDK 5.0, specification and schema tables. Retained useful local context examples, worker extras, plugin example and rendering safeguards; kept all historical metamodel versions (66 schema-history rows in the combined reference)
- Preserved screenshots, FAQ, original OpenID steps, sidebar behaviour and zero-placeholder inventory. The pending Document Context handover is now incorporated
- Verification: clean strict HTML and LaTeX-source builds passed; 27,871 local references, all 38 application help targets and all rendered sidebar aliases pass. No orphan pages, duplicate parents, cycles or remaining screenshot TODOs. Full downloadable-PDF rendering remains separate
- Added the combined result on top of the contributor branch while retaining its two commits, ready for a normal fast-forward push to the existing PR

## 4 November 2026 — Screenshot hotfix

- Refreshed Document Template Editor preview using the author's fixed Questionnaire Report files, removing the obsolete Workspace row and collapsing the global sidebar
- Populated the API-key list with a temporary synthetic example for capture. The generated token was neither stored nor shown; the key was revoked after capture. Expired keys are hidden by the UI, so the initial expired-only example could not populate this view
- Verified both captures with Cypress and inspected the report cover. Existing guide text and screenshot widths retained
- Checked FW's old-UI/merger wording findings against DSW; no matching DSW wording or outdated UI screenshots were found. Its conceptual KM migration diagram remains valid
- Hotfix branch starts from main and will target both main and develop. Further fixes will use the same branch/PRs; no merge authorized

## 4 November 2026 — DSW workspace-reference audit

Removed internal workspace metadata from the Document Context explanations, metamodel 19 change summary and context class diagrams at the user's request. The underlying shared API/model still contains these technical fields; no schema or application behaviour was changed. Updated the diagram generator so regeneration keeps the DSW documentation free of these fields. No workspace references were found in the application walkthrough pages.

Verification: no workspace mentions remain in published-source text, Mermaid sources or rendered SVG diagrams. Strict HTML and LaTeX-source builds passed; generated search data has no pages linked to the removed terms.

## 4 November 2026 — Marek reference parity and schema links

Compared Marek Suchánek's DSW Document Context 19.0 and TDK updates (1b2aa0c, 2c209b5) with the FW reference pages. The substantive context, Jinja, Excel/Pandoc, specification, worker plugin and TDK material was already present; retained FW workspace additions and adapted links. Applied the remaining editor-settings link correction in FW. Checked dsw-schemas master through GitHub: the newer context/template schema files remain absent. Restored JSON Schema links for versions 18.1, 18.2, 18.3 and 19.0 in both schema tables as explicitly requested, despite expected 404 responses.

Verification: strict HTML and LaTeX-source builds passed for both guides. The schema 19.0 absence was confirmed by GitHub API HTTP 404; the repository tree lists no context/template schemas for 18.1–18.3 or 19.0. No full PDF render or external linkcheck was run; these missing links are intentional per request.

## Final guide review — 2026-11-04

- Read through shared and product-specific prose, preserving technical reference material, historical upgrade notes and the original OpenID procedure
- Corrected wording, cross-reference markup, screenshot captions and small factual inconsistencies; changes are limited to documentation and screenshot presentation
- Verified strict HTML and LaTeX-source builds with warnings treated as errors; checked local links, anchors, image mappings and TOC reachability
- Visually reviewed all raster-image contact sheets and selected full-size images; inspected representative rendered pages. This review did not rerun every application flow, render a fresh PDF or recrawl all external URLs
- Intentionally retained links to not-yet-published metamodel schemas as requested
- DSW: 131 source pages, 27,873 local references and 130 HTML image mappings pass; no TOC or image-reference errors
- Recreated the list-question screenshot including its items and Add control (targeted Cypress capture passes), aligned figure spacing and added a version-independent native 404 page
- Corrected integration-secret configuration against backend source: file-level secrets, Jinja references and stored-secret precedence; aligned private security reporting with the dedicated security page
- Reviewed on the existing hotfix branch so its earlier workspace-removal and screenshot fixes remain included. Continue the same PRs to main and develop; do not merge

## Upgrade guidelines hotfix — 10 November 2026

- Branch hotfix/5.0-upgrade-guidelines created from current main; prepare PRs to main and develop
- Move 5.0 into the version-by-version upgrade list as 4.35.X to 5.0.X; retain the API subsection anchor and add the upgrade-5-0 reference
- Add explicit OpenID callback/logout update for the move from /wizard to the root and private-window verification
- Tighten common startup instructions and present 5.0 changes as administrator actions
- Confirm additional required details against released server/tools source: old locale deletion, privacy/terms recovery, size-limit/env renames, multi-tenancy config, Registry account setup and custom client mounts
- Preserve every historical instruction from 4.34-to-4.35 onward byte-for-byte; evidence in maintenance/upgrade-guidelines-hotfix.json
- No FW-only features, deployment changes or application-code edits

- Verification: strict HTML and LaTeX-source builds pass; rendered heading/anchor checks and byte-for-byte comparison of historical sections pass. No external linkcheck or PDF render performed


## 2026-11-11 — Guide proofreading

- Base: `origin/hotfix/5.0-upgrade-guidelines-develop` at `8fc5d85850616aec5dd2c0055015f98dfe6ef367`; isolated branch `codex/guide-proofread`.
- Reviewed guide prose for grammar, unclear instructions, internal contradictions and repetitive AI-style wording. Shared prose was checked across DSW and FAIR Wizard while retaining product-specific scope and features.
- Edited 54 RST source files. Corrected import guidance, ORCID save instructions, rendering-reference wording, and language in knowledge-model and project workflows. Clarified worker multi-tenancy configuration against engine-tools source.
- Checked OpenID editing and user-group save behavior against the local shared frontend source at `4a4c858c`; rendering options and worker configuration against engine-tools `origin/main` at `bea50b8`.
- Verification: strict Sphinx HTML and LaTeX source builds passed with warnings treated as errors; `git diff --check` passed. All 49 code blocks in the edited RST files are unchanged.
- Limits: no live application or third-party sign-in test, external link audit, full implementation audit, or rendered PDF check. The Word image-compression advice still needs a test of the Pandoc output; see the document-template development notes.
- Original working copies and existing unfinished edits were left intact.


### Information-preservation recheck

- Rechecked the proofreading diff against its original base after the user asked about factual changes and accidental loss.
- The first pass did include intentional factual corrections and abridgement, rather than language-only edits. Restored the empty-secret distinction, preview/project workflow tip and first-tab detail. Corrected a sentence introduced in the metamodel overview.
- Restored the Registry content examples and cron scheduling example in deployment guidance.
- Retained explicit, documented factual corrections to contradictory instructions. Code examples and screenshots remain unchanged against the original base.
- Recheck verification: strict HTML and LaTeX source builds and diff whitespace checks passed. 49 code blocks and 75 image references were compared with the original base and retained. This does not establish the truth of every factual statement in the guide.


### Pandoc image-compression experiment

- Tested locally with Pandoc 3.9.0.2 using 1800×1200 PNG and JPEG images displayed at three inches. Used a default reference plus references with 72-DPI, 150-DPI and disabled-compression settings. Repeated the low-DPI case with Markdown input. A font-size change confirmed each custom reference was used.
- In all five original-image output cases, embedded PNG/JPEG bytes, SHA-256 hashes and dimensions matched the source files. The doNotAutoCompressPictures flag was copied; defaultImageDpi and discardImageEditingData were not. Independently resizing the two source images before generation reduced the embedded media and output size.
- Checked the result against Pandoc's 3.9.0.2 DOCX writer and Microsoft's OOXML/image-compression documentation. The guide now recommends optimizing source images or using Word's compression on the generated document, instead of promising compression through reference.docx.
- Scope: local Pandoc generation, not the deployed worker binary or a Microsoft Word open/save test. The shared worker source delegates conversion to Pandoc. The low-DPI output was rendered with bundled LibreOffice and its single page inspected.
