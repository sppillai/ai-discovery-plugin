# Changelog

## [1.2.0] — 2026-06-14

### Added
- **Current state process map** (Step 3) — after profiling the end user, the UX agent now asks "Walk me through what you do TODAY when you need to [job]" and builds `current-state-process-map.xlsx` (2 sheets: step-by-step process with pain severity 1-5 + opportunity gaps column). This is the "before picture" that all downstream steps build on.
- **Before & After transformation sheet** (Step 5) — the user journey map Excel now has a second sheet "Before & After (The Change)" that loads the current state process steps and maps them side-by-side against the future state with the product. Color-coded before=red, after=green. Shows the transformation at each step.
- **Interview loopback to process map** (Step 6) — when interview findings are returned, the agent now updates the current state process map with real data: re-scores severity based on interview confirmation rate, adds newly discovered pain points, and marks each row as "AI-assumed / Interview-confirmed / Interview-discovered". Saved as `current-state-process-map-v2.xlsx`.
- **Opportunity map** (Step 7) — before writing the value proposition, the architect agent now creates `opportunity-map.xlsx` from the top-severity pain points. Sheet 1 "Pain→Opportunity" maps each pain to an opportunity with Impact × Confidence priority scoring. Sheet 2 "Future State Journey" shows the after-product workflow. The value proposition is now explicitly grounded in the top-ranked opportunity.
- **Feature traceability** (Step 8) — every feature in the PRD must link to an opportunity row in the opportunity map. The feature-prioritization.xlsx now includes "Opportunity Link" and "Validation Status" columns (formula: blank link → "Needs validation"). User stories in the PRD include an "Addresses:" line citing the specific pain they solve.

### Changed
- Value proposition format updated to reference a specific process pain point and mechanism rather than generic benefit language
- feature-prioritization.xlsx Sheet 1 column set expanded to include Opportunity Link and Validation Status

## [1.1.0] — 2026-06-14

### Added
- **Lenny's Podcast expert insights** — at every step, agents now surface a `💬 Expert Insight` block showing a real quote from a relevant Lenny Rachitsky episode, attributed to the guest, and applied directly to the user's product situation. Previously transcripts were used silently in the background.
- **Human action checkpoints** — 10 steps now create a findings template file and prompt the user to do real-world work (customer interviews, pricing conversations, PMF surveys) before continuing. Findings are written back into the analysis when the user returns.
- **Pivot protocol** — when discovery reveals a wrong assumption, the Supervisor creates a `PIVOT-N/` folder, carries over valid steps, and restarts from the earliest invalidated step. PMF score below 40% at Step 22 triggers a proactive pivot prompt.

### Fixed
- All external skill references corrected to use the `pm-skills:` namespace (previously referenced non-existent `phuryn:pm-*` sub-plugin namespaces that caused silent failures at every step)
- `ui-ux-pro-max` invocation corrected to `ui-ux-pro-max-skill:ui-ux-pro-max` at Steps 8 and 23

### Changed
- Install instructions clarified into 3 explicit steps with verification command
- Removed `deanpeters/Product-Manager-Skills` from required installs (redundant fork of `phuryn/pm-skills`)
- README attribution section expanded with full credit to all framework authors and practitioners

## [1.0.0] — 2026-06-01

Initial release. 24-step MIT Disciplined Entrepreneurship framework with four AI agents (Supervisor, PM Market Strategist, UX Research, Architect). Human checkpoint after every step. Excel, Word, and PowerPoint deliverables at each phase.
