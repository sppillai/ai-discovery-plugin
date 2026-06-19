# Changelog

## [1.3.0] — 2026-06-19

### Added
- **Full product lifecycle OS** — the plugin now covers the complete journey from first idea to launched product and continuous feedback. Discovery (v0.1) is one phase of six; the project folder structure spans all of them.
- **Root-level project files** — every new project now creates `CLAUDE.md` (phase gates + agent routing), `ROADMAP.md` (versioned phases v0.1→v1.1+), `interview-backlog.md` (continuous validation queue), and `inbox.md` (mid-session idea capture) at the project root.
- **`opportunity-map.xlsx` at project root** — moved from `PHASE-3-VALUE-PROPOSITION/deliverables/` to the project root. It is now the spine of the entire system, shared across all phases from Step 7 through the Growth phase.
- **`interview-backlog.md`** — a single, continuously updated list of what to validate with users. Every phase (discovery, design review, post-build, post-launch) can add entries. Agents generate interview guides from open items.
- **`inbox.md`** — quick capture for new ideas mid-session (during code review, user conversations, or just thinking). Requirements-agent and feedback-agent process it: routes to opportunity map or interview backlog.
- **Lifecycle folder structure** — `requirements/`, `src/`, `tests/`, `feedback/`, `releases/` created at project start with phase-gated `CLAUDE.md` files.
- **Requirements agent** (v0.2 MUP Design) — reads the opportunity map and discovery outputs, writes `requirements/PRD.md`, creates design system, screen specs (one `.md` per screen), HTML clickthrough mockups, user testing templates, and breaks the PRD into coding-agent-executable epics with spec, acceptance criteria, design reference, and status.
- **Feedback agent** (v1.0+ Growth) — ingests typeform exports, usability study notes, interview transcripts, and usage logs. Auto-appends to opportunity map when 3+ users independently surface the same pain (Medium confidence). Queues 1–2 user signals for interview backlog. Flags assumption contradictions as pivot signals with recommended re-run path. Updates `ROADMAP.md` Growth section.
- **Versioned phases in ROADMAP.md** — v0.1 Discovery, v0.2 MUP Design, v1.0-alpha Build, v1.0 Launch, v1.1+ Growth. Each phase has milestone entries and gate conditions.
- **Architect agent** now adds low-confidence opportunity map rows to `interview-backlog.md` at Step 7.
- **Supervisor agent** initialises the full project OS on first session if `ROADMAP.md` doesn't exist. Updates `ROADMAP.md` v0.1 to complete and sets v0.2 as "Ready to Start" after Step 24.

### Changed
- "What you get" file tree updated to show the full lifecycle folder structure
- "What this is" description updated to reflect the full product OS, not just discovery
- Agents table expanded with Requirements Agent and Feedback Agent
- 24-steps table reorganised under "v0.1 Discovery" within the broader phase overview

## [1.2.0] — 2026-06-19

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
