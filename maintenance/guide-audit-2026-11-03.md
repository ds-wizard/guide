# DSW guide audit — 3 November 2026

## Scope and evidence

Checked all 126 guide pages for navigation, links, stale terminology, paragraph length and unwanted FW scope. Verified high-impact workflow claims against the OS frontend main 4a4c858c, public wizard-server 787919f and engine-tools 1ad8186. This is source verification with representative HTML visual checks, not a runtime acceptance test of every application flow.

## Corrected facts and flows

- Project sharing now states who can change access and distinguishes private sharing from instance-wide ALL Projects permissions
- Named-history management and reverting are owner-only. Reverting removes later events, associated named versions and later uploaded files; the warning and sharing matrix now say so. Evidence: frontend Projects/Detail.elm and Questionnaire/Panel/VersionHistory.elm; backend Shared/Service/Project/Version/ProjectVersionService.hs, lines 118–159
- Project-template permissions now distinguish marking an existing project from starting a new one, which also requires Create Projects. Evidence: Common/Data/Feature.elm projectsCreateCustom and WizardRolePermission
- Integration answers are no longer promised to contain a link unconditionally; their display comes from the answer template, and free text requires Allow Custom Reply
- Published-model preview is read-only. Added the actual questionUuid deep-link method and explained generated preview replies carried into Create project. Evidence: KnowledgeModels/Routes.elm and KnowledgeModels/Preview.elm
- Template file editing describes the actual unsaved indicator, tab-strip pane control and temporary empty folders instead of the old asterisk/location claims. Evidence: DocumentTemplateEditors/Editor.elm and Editor/Files.elm
- Rendering plugins now use dsw.templating and dsw_templating_plugins. The old import path/entry point was obsolete. The complete Python/TOML example passed syntax checks; interfaces verified against dsw-templating exports, plugins/specs.py, plugins/manager.py and steps/base.py
- Removed five dangling video notes/instructions; split long editor/template paragraphs and corrected typos
- Reordered project detail around Questionnaire first, and editor flow around edit/settings, preview, publish. Settings follow the OS menu order; menu aliases remain concise. All page targets retained
- Document-template page heading is Publish, as requested
- Native html_title now keeps the mobile header to DSW 5.0 Guide; no new CSS/JS mechanism
- Removed unverified older RAM/concurrency guarantees and the blanket UID rule. Replaced unpinned generic upgrade pulls with Compose commands that use configured target-version tags, and linked the prerequisite 4.35 migration
- Removed unsupported claims that no security vulnerabilities had ever been reported and an unverified internal release/JIRA/ZAP procedure. Retained a private reporting channel and practical deployment precautions; this does not establish the product's vulnerability status
- Updated obsolete component links and the broken XlsxWriter page-setup link. The replacement page and set_paper anchor were checked in its official HTML

## Validation

- Strict HTML and LaTeX-source generation pass; git diff --check passes
- 126/126 pages reachable; no missing toctree targets, duplicate parents, orphan pages or cycles
- 25,103 local references and all 38 OS application help targets pass
- Live external link check: {'ignored': 1, 'working': 158, 'redirected': 1}. No broken external URL remains. GitHub sign-in redirects are expected; external fragments were not generally checked
- No standalone prose paragraph at least 80 words in the scan, excluding lists, code and directive blocks
- Visually checked Sharing and template Files in desktop light mode; renderer text/code and the role matrix at phone width in dark mode; Publish/menu in desktop dark mode. Restored the temporary viewport override
- All 129 screenshot TODOs retained and their manifest refreshed

## Remaining work and source discrepancy

- Screenshots and actual application-flow acceptance await the DSW environment. The audit did not compile/inspect the downloadable PDF or perform a vulnerability scan
- The app's private-project tooltip still says “accessible only by you” in engine-frontend/packages/elm-common/elm/Common/Pages/Projects/Components/ProjectSharing.elm:64, while backend ProjectAcl.hs:70–73 permits a role with View ALL Projects. The guide now describes the permission exception. This is a source-level wording discrepancy, not a reproduced access-control failure; no product source changed
- No Notion edit, deployment, commit, push or release
