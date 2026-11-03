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



## Document template metamodel and TDK update — 3 November 2026

- Reviewed engine-tools main a780164. Restored the pre-5.0 structure and full descriptions of Document Context, Metamodel Schemas, Template Specification and the Jinja step, and updated them to metamodel 19.0. These pages no longer defer to descriptions in engine-tools
- Entities come from the dsw-models graph module, because the upstream DocumentContext.md is out of date for knowledge-model entities. Replaced the old class diagram with four Mermaid diagrams generated from that module and committed as light and dark SVGs plus a PDF for the LaTeX build, see README
- Added metamodel 18.3 and 19.0 history with the migration tables, TDK installation, configuration, context generation and render options, extract_replies version 2, translations, Excel and Pandoc step corrections and worker upgrade notes
- Replaced the template_json_schema_v18-2.json link because dsw-schemas does not contain that file. Schemas for 18.1 to 19.0 are marked as not published
- Left out TDK workspace options because workspaces are outside the DSW guide's scope
- Restored the MS Word image compression note and the TDK Docker usage. Worker configuration details are intentionally not documented
- Strict HTML build passes. Not verified: the TDK and Docker commands were checked against source only and not run; rendered pages and the PDF were not reviewed
