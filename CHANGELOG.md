# Changelog

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
