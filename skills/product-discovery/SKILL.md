---
name: Product Discovery
description: Use when the user runs /start-discovery, mentions validating a product idea, running the MIT framework, or opens a folder with project-state.json. Guides through the 24-step MIT Disciplined Entrepreneurship framework autonomously, generating Excel models, Word documents, and PowerPoint presentations.
version: 1.0.0
---

## When This Skill Activates

- User opens a folder containing `project-state.json` → resume existing project
- User runs `/start-discovery` with a product idea
- User mentions "validate my idea", "MIT framework", "product discovery", "disciplined entrepreneurship"

## Resuming an Existing Project

When `project-state.json` exists:
1. Read the file and announce current step and progress
2. If `humanActionPending: true` → read `humanActionFile`; if the template has been filled in, incorporate findings and proceed; if still blank, re-show the human action checkpoint prompt for the previous step
3. If `activePivot` is set → work inside that pivot folder, not the root
4. Continue from `currentStep` — do not repeat completed steps
5. Load any relevant agent context files

## Starting Fresh

Ask: *"What's your product idea? (1-2 sentences)"*

Create the full project OS structure:

```
CLAUDE.md                               ← root: phase gates, agent routing, version
ROADMAP.md                              ← living roadmap with versioned phases
interview-backlog.md                    ← continuous validation queue, add from any phase
inbox.md                                ← quick capture for mid-session ideas
IDEA.md
project-state.json

PHASE-1-MARKET-SELECTION/deliverables/
PHASE-2-USER-RESEARCH/deliverables/
PHASE-3-VALUE-PROPOSITION/deliverables/
PHASE-4-BUSINESS-MODEL/deliverables/
PHASE-5-VALIDATION/deliverables/
PHASE-6-EXECUTION/deliverables/
DELIVERABLES-SUMMARY/

requirements/
  CLAUDE.md
src/
  CLAUDE.md
tests/
  CLAUDE.md
  unit/ integration/ e2e/ quality-reports/
feedback/
  CLAUDE.md
  sessions/ logs/ synthesis/ decisions/
releases/
```

`opportunity-map.xlsx` is NOT created here — it is created at the project root at Step 7 and becomes the spine shared across all phases from that point forward.

### Root file content

**`CLAUDE.md`** (root):
```markdown
# [Product Name]

## Current Version: v0.1 — Discovery

## Phase Gates
| Version | Phase | Gate Condition |
|---------|-------|---------------|
| v0.1 | Discovery | Beachhead selected, 5+ interviews done, opportunity map validated |
| v0.2 | MUP Design | PRD.md done, all screens designed, HTML mockups built, 3+ user-testing sessions |
| v1.0-alpha | Build | All epics in requirements/epics/ marked done |
| v1.0 | Launch | Beta users onboarded, feedback capture live, PMF survey run |
| v1.1+ | Growth | Continuous — driven by opportunity-map.xlsx and feedback |

## Agent Routing
- Discovery (v0.1) → supervisor-agent, reads project-state.json
- MUP Design + Requirements (v0.2) → requirements-agent, reads requirements/CLAUDE.md
- Coding (v1.0-alpha) → read requirements/CLAUDE.md, pick up epic from requirements/epics/
- Feedback synthesis (v1.0+) → feedback-agent, reads feedback/CLAUDE.md

## Key Files
- `opportunity-map.xlsx` — source of truth for all features and priorities (created at Step 7)
- `ROADMAP.md` — phase milestones and current status
- `interview-backlog.md` — add to this from any phase, any agent, any time
- `inbox.md` — new ideas captured mid-session; agent routes them to opportunity map or backlog
```

**`ROADMAP.md`**:
```markdown
# Roadmap

## v0.1 — Discovery
**Status:** In Progress

- [ ] Beachhead market selected (Steps 1–2)
- [ ] 5+ user interviews completed (Steps 3–6)
- [ ] Opportunity map built and validated (Step 7)
- [ ] Business model stress-tested (Steps 9–18)
- [ ] Key assumptions tested (Steps 19–22)

## v0.2 — MUP Design
**Status:** Not Started

- [ ] PRD.md complete (derived from opportunity-map.xlsx)
- [ ] Design system defined
- [ ] All screens designed and specced
- [ ] HTML mockups built
- [ ] Clickthrough user testing: 3+ sessions done
- [ ] Design synthesis reviewed, opportunity map updated

## v1.0-alpha — Build
**Status:** Not Started

← Epics populated here by requirements-agent after PRD is approved

## v1.0 — Launch
**Status:** Not Started

- [ ] Beta users onboarded
- [ ] Feedback capture live (typeform / usability / interview)
- [ ] PMF survey run (target: >40% very disappointed)

## v1.1+ — Growth
**Status:** Not Started

← Populated from opportunity-map.xlsx as feedback comes in
```

**`interview-backlog.md`**:
```markdown
# Interview & Validation Backlog

Add to this from any phase. When running an interview or usability session,
the agent generates the guide from open items relevant to that user type.

| # | What to validate | Source | Phase | Opportunity row | Status |
|---|-----------------|--------|-------|-----------------|--------|
|   |                 |        |       |                 | Open   |
```

**`inbox.md`**:
```markdown
# Ideas Inbox

Drop new ideas here mid-session — during code review, user conversation, or discovery.
The requirements-agent or feedback-agent processes this: adds to opportunity-map.xlsx,
flags items needing user validation, and adds those to interview-backlog.md.

---
```

**`requirements/CLAUDE.md`**:
```markdown
# Requirements — v0.2 MUP Design

**Gate Status:** Not yet open — discovery (v0.1) must complete first.

## For Coding Agents (once gate opens)
1. Read PRD.md for full product context and scope
2. Pick one epic from epics/ where status.md = "not-started"
3. Read the epic's design-ref.md → find the screen spec in design/screens/
4. Read acceptance-criteria.md before writing any code
5. Update status.md: "in-progress" when starting, "in-review" when done
6. Never build outside an active epic — new ideas go in ../inbox.md
```

**`src/CLAUDE.md`**:
```markdown
# Source Code — v1.0-alpha

**Gate Status:** Not yet open — requirements/CLAUDE.md gate must be open first.

## Requirements Reference
- PRD: ../requirements/PRD.md
- Active epics: ../requirements/epics/
- Design specs: ../requirements/design/screens/
- HTML mockups: ../requirements/design/mockups/

## Rules
- Never build a feature not covered by an active epic
- New ideas go in ../inbox.md — do not implement inline
- Run tests in ../tests/ before marking any epic "in-review"
- Every non-obvious decision: comment starting with WHY:
```

**`tests/CLAUDE.md`**:
```markdown
# Tests — v1.0-alpha

Unit in unit/, integration in integration/, end-to-end in e2e/.
Quality reports: quality-reports/YYYY-MM-DD.md after each run.

Reference ../requirements/epics/[epic]/acceptance-criteria.md before writing tests.
```

**`feedback/CLAUDE.md`**:
```markdown
# Feedback — v1.0+

**Gate Status:** Not yet open — product must be launched first.

## Feedback Sources
- sessions/ — typeform exports, usability study notes, interview transcripts
- logs/ — usage signals, analytics exports

## Auto-Update Rules (applied during synthesis)
- 3+ users independently surface the same pain → auto-append to ../opportunity-map.xlsx
  at "Medium" confidence, flag in synthesis doc for human review
- 1-2 users mention a new pain → add to ../interview-backlog.md only, do not update opportunity map
- Pattern contradicts a core assumption → recommend which steps to re-run, flag as potential pivot

## Processing New Feedback
1. Read all unprocessed files in sessions/ and logs/
2. Generate synthesis/YYYY-MM-DD.md
3. Apply auto-update rules to ../opportunity-map.xlsx
4. Create decisions/YYYY-MM-DD-for-review.md if human input is needed
5. Update ../interview-backlog.md with new validation questions
6. Update ../ROADMAP.md Growth section if new priorities emerge
```

## Deliverables Map

All generated files by phase:

### Root — Project OS Files (created at project start)
- `CLAUDE.md` ← phase gates + agent routing
- `ROADMAP.md` ← versioned phase milestones
- `interview-backlog.md` ← continuous validation queue
- `inbox.md` ← quick capture
- `opportunity-map.xlsx` ← **created at Step 7**, lives at root, spine of entire project

### Phase 1 — Market Selection (v0.1 Discovery)
- `step-1-target-market-segment.md`
- `deliverables/market-segmentation-matrix.xlsx` ← invoke `anthropic-skills:xlsx`
- `step-2-beachhead-market.md`
- `deliverables/tam-analysis.xlsx` ← invoke `anthropic-skills:xlsx`

### Phase 2 — User Research
- `step-3-end-user-profile.md`
- `deliverables/current-state-process-map.xlsx` ← invoke `anthropic-skills:xlsx` (Step 3, 2 sheets: "Today's Process" with pain severity scores + "Opportunity Gaps" populated at Step 7)
- `step-4-personas.md`
- `deliverables/personas.docx` ← invoke `anthropic-skills:docx`
- `step-5-lifecycle-use-case.md`
- `deliverables/user-journey-map.xlsx` ← invoke `anthropic-skills:xlsx` (Step 5, 2 sheets: "Adoption Journey" + "Before & After (The Change)")
- `step-6-user-validation.md`
- `deliverables/interview-guide.docx` ← invoke `anthropic-skills:docx`
- `deliverables/current-state-process-map-v2.xlsx` ← updated after Step 6 interviews, adds Source column (AI-assumed / Interview-confirmed / Interview-discovered) to every pain point

### Phase 3 — Value Proposition (v0.1 Discovery)
- `step-7-value-proposition.md`
- **`../opportunity-map.xlsx`** ← invoke `anthropic-skills:xlsx` at project root (Step 7, 2 sheets: "Pain→Opportunity" ranked by Impact×Confidence + "Future State Journey")
- `step-8-product-specification.md`
- `deliverables/PRD.docx` ← invoke `anthropic-skills:docx` (feature requirements include "Opportunity Addressed" callout; user stories cite the pain point they address)
- `deliverables/feature-prioritization.xlsx` ← invoke `anthropic-skills:xlsx` (Sheet 1 includes Opportunity Link + Validation Status columns; features without an opportunity link are flagged "Needs validation")

### Phase 4 — Business Model
- Steps 9-18 markdown files
- `deliverables/tam-sam-som.xlsx` ← invoke `anthropic-skills:xlsx`
- `deliverables/ltv-cac-model.xlsx` ← invoke `anthropic-skills:xlsx`
- `deliverables/business-model-canvas.docx` ← invoke `anthropic-skills:docx`
- `deliverables/burn-rate-analysis.xlsx` ← invoke `anthropic-skills:xlsx`
- `deliverables/financial-projections.xlsx` ← invoke `anthropic-skills:xlsx`
- `deliverables/investor-deck.pptx` ← invoke `anthropic-skills:pptx`

### Phase 5 — Validation
- Steps 19-22 markdown files
- `deliverables/assumption-matrix.xlsx` ← invoke `anthropic-skills:xlsx`
- `deliverables/mvp-scope.docx` ← invoke `anthropic-skills:docx`
- `deliverables/mvp-prioritization.xlsx` ← invoke `anthropic-skills:xlsx`
- `deliverables/pmf-validation-report.docx` ← invoke `anthropic-skills:docx`

### Phase 6 — Execution
- Steps 23-24 markdown files
- `deliverables/technical-roadmap.xlsx` ← invoke `anthropic-skills:xlsx`
- `deliverables/product-architecture-deck.pptx` ← invoke `anthropic-skills:pptx`
- `deliverables/go-to-market-plan.docx` ← invoke `anthropic-skills:docx`
- `deliverables/launch-checklist.xlsx` ← invoke `anthropic-skills:xlsx`

### Final Summary
- `DELIVERABLES-SUMMARY/executive-summary-deck.pptx` ← invoke `anthropic-skills:pptx`
- `DELIVERABLES-SUMMARY/complete-discovery-report.docx` ← invoke `anthropic-skills:docx`
- `DELIVERABLES-SUMMARY/next-steps.md`

## Human Checkpoint After Every Step

After completing each step, agents present a checkpoint and wait for approval before proceeding.

### Format A — Autonomous steps (no real-world action needed)

```
✅ Step N complete — [one-line summary]

📄 Deliverables: [list files created]

👉 Does this look right, or should I revise anything before continuing to Step N+1?
   → Type "yes" to continue / describe what to change
```

### Format B — Steps requiring human real-world action

Used when the human must go do something the AI cannot (interviews, conversations, surveys, decisions). A findings template file is created before the checkpoint is shown.

```
✅ Step N complete — [one-line summary]

📄 Deliverables: [list files created]

🙋 Your Actions Required:
  1. [Specific task with clear instructions]
  2. [Additional task if needed]
  ↩ Come back and paste what you found, or type "skip" to continue with AI assumptions.

👉 Ready to continue to Step N+1?
   → Type "yes" or paste your findings / describe what to change
```

**Steps that use Format B**: 3, 6, 11, 12, 15, 19, 20, 22, 23, 24

**Checkpoint response handling:**
- **"yes" / "continue"** → set `humanActionPending: false`, immediately begin next step
- **Pasted findings** → write findings into the template file, incorporate into next step's analysis, proceed
- **"skip"** → continue with AI-generated assumptions, note skip in project-state.json
- **Any revision request** → revise current step, re-present, wait for approval again
- `project-state.json` is saved **before** showing the checkpoint so no work is lost if the session ends

## Pivoting

When the human says "let's pivot", "wrong customer", "this isn't working" — or when the Step 22 PMF score is below 40% — the Supervisor triggers the pivot protocol.

**A pivot is a partial branch, not a full restart.** The PIVOT-N/ folder has the full 6-phase structure, but only re-runs from the earliest step the new direction invalidates. Steps before that point are copied from the original with a "Carried over" note.

### Restart point by what changed

The Supervisor asks "What changed?" and maps the answer to a restart step:

| What changed | Restart from | Steps carried over |
|-------------|-------------|-------------------|
| Target customer segment | Step 1 | None |
| Problem / pain point (same customer) | Step 3 | 1–2 |
| Solution / positioning (same customer, same problem) | Step 7 | 1–6 |
| Business model / revenue model | Step 9 | 1–8 |
| GTM channel / acquisition strategy only | Step 12 | 1–11 |
| Need different experiments | Step 19 | 1–18 |
| MVP scope only | Step 20 | 1–19 |

### Minor pivot
Re-run specific steps in-place. Save old files as `{name}-v1.md` before overwriting. No new folder.

### Major pivot — folder structure

```
my-project/
  project-state.json              ← original (activePivot → "PIVOT-1")
  PHASE-1-MARKET-SELECTION/
  ...
  PIVOT-1/                        ← partial branch from restart step
    PIVOT-RATIONALE.md            ← why, what changed, restart step, new hypothesis
    project-state.json            ← currentStep = restart step; stepsCompleted = carried-over
    PHASE-1-MARKET-SELECTION/     ← copied from original if steps 1–2 carried over
    PHASE-2-USER-RESEARCH/        ← copied from original if steps 3–6 carried over
    PHASE-3-VALUE-PROPOSITION/    ← fresh if restart ≤ step 7
    ...
  PIVOT-2/                        ← sibling (not nested) if a second pivot is needed
    ...
```

Carried-over files are prepended with: `> ⚠ Carried from original direction — validated and still applicable.`

At Step 22, if PMF < 40%, the Supervisor proactively asks: "PMF threshold not met — do you want to pivot the problem, solution, or segment, or continue to iterate?"

If a second pivot is needed while inside PIVOT-1/, PIVOT-2/ is created as a sibling at the root level — not nested inside PIVOT-1/.

## External Skills — Integration Map

At each step, agents invoke external PM skills to enrich analysis. These require separate plugin installation:

```
claude plugin marketplace add phuryn/pm-skills
claude plugin marketplace add nextlevelbuilder/ui-ux-pro-max-skill
```

| Step | External Skills to Invoke |
|------|--------------------------|
| 1 | `pm-skills:tam-sam-som-calculator`, `pm-skills:pestel-analysis`, `pm-skills:acquisition-channel-advisor` |
| 2 | `pm-skills:lean-ux-canvas`, `pm-skills:opportunity-solution-tree` |
| 3 | `pm-skills:jobs-to-be-done` |
| 4 | `pm-skills:proto-persona`, `pm-skills:user-story` |
| 5 | `pm-skills:discovery-interview-prep`, `pm-skills:customer-journey-mapping-workshop` |
| 6 | `pm-skills:discovery-interview-prep`, `pm-skills:discovery-process` |
| 7 | `pm-skills:positioning-statement`, `pm-skills:opportunity-solution-tree` |
| 8 | `pm-skills:prd-development`, `pm-skills:user-story`, `pm-skills:user-story-mapping`, `ui-ux-pro-max-skill:ui-ux-pro-max` |
| 9 | `pm-skills:saas-revenue-growth-metrics`, `pm-skills:finance-metrics-quickref` |
| 10 | `pm-skills:tam-sam-som-calculator` |
| 11 | `pm-skills:finance-based-pricing-advisor`, `pm-skills:saas-economics-efficiency-metrics` |
| 12 | `pm-skills:acquisition-channel-advisor`, `pm-skills:organic-growth-advisor` |
| 13 | `pm-skills:acquisition-channel-advisor`, `pm-skills:organic-growth-advisor`, `pm-skills:positioning-workshop` |
| 14 | `pm-skills:product-strategy-session` |
| 15 | `pm-skills:lean-ux-canvas`, `pm-skills:pestel-analysis`, `pm-skills:positioning-workshop` |
| 16 | `pm-skills:business-health-diagnostic`, `pm-skills:saas-economics-efficiency-metrics`, `pm-skills:finance-metrics-quickref` |
| 17 | `pm-skills:finance-based-pricing-advisor`, `pm-skills:saas-revenue-growth-metrics`, `pm-skills:business-health-diagnostic` |
| 18 | `pm-skills:positioning-statement`, `pm-skills:saas-revenue-growth-metrics`, `pm-skills:product-strategy-session` |
| 19 | `pm-skills:lean-ux-canvas`, `pm-skills:prioritization-advisor` |
| 20 | `pm-skills:pol-probe`, `pm-skills:pol-probe-advisor`, `pm-skills:epic-hypothesis` |
| 21 | `pm-skills:user-story-mapping`, `pm-skills:epic-breakdown-advisor`, `pm-skills:saas-revenue-growth-metrics` |
| 22 | `pm-skills:organic-growth-advisor`, `pm-skills:saas-revenue-growth-metrics`, `pm-skills:opportunity-solution-tree` |
| 23 | `ui-ux-pro-max-skill:ui-ux-pro-max`, `pm-skills:roadmap-planning`, `pm-skills:epic-breakdown-advisor` |
| 24 | `pm-skills:acquisition-channel-advisor`, `pm-skills:organic-growth-advisor`, `pm-skills:roadmap-planning` |

## Lenny's Podcast — Research Reference

At each step, agents fetch relevant transcripts from the Lenny Rachitsky podcast archive to ground analysis in real-world expert patterns.

**Base URL**: `https://raw.githubusercontent.com/ChatPRD/lennys-podcast-transcripts/main/`

**Pattern**: fetch the topic index first to find relevant episodes, then fetch 1-2 episode transcripts for key insights.

| Step | Lenny Topic Index to Fetch |
|------|---------------------------|
| 1-2 | `index/product-strategy.md`, `index/entrepreneurship.md` |
| 3-4 | `index/customer-research.md`, `index/product-management.md` |
| 5-6 | `index/user-experience.md`, `index/customer-research.md` |
| 7-8 | `index/product-strategy.md`, `index/product-development.md` |
| 9-11 | `index/monetization.md`, `index/pricing.md` |
| 12-13 | `index/growth-strategy.md`, `index/go-to-market.md` |
| 14-15 | `index/business-strategy.md`, `index/product-market-fit.md` |
| 16-17 | `index/startup-growth.md` |
| 18 | `index/fundraising.md` |
| 19-21 | `index/experimentation.md`, `index/product-led-growth.md` |
| 22 | `index/product-market-fit.md` |
| 23-24 | `index/engineering.md`, `index/go-to-market.md` |

### How Lenny Insights Are Surfaced to the User

After fetching and reading Lenny transcripts at each step, agents **must** present a `💬 Expert Insight` block in the step output — shown to the user after the analysis, before the checkpoint. This is not optional and not hidden in the background.

```
💬 Expert Insight (Lenny's Podcast)
Episode: "[Episode title]" with [Guest name]
"[Direct quote or close paraphrase of the most relevant insight from the transcript]"
What this means for you: [1-2 sentences applying the insight to the user's specific situation and step]
```

Rules for this block:
- The quote must come from what was actually in the transcript, not fabricated
- If two episodes were read, pick the one with the most relevant insight for this step
- "What this means for you" must reference the user's actual product/market, not be generic
- If the transcript fetch fails, skip the block and note it — do not hallucinate a quote

## Rules

- **Pause after every step** — show checkpoint prompt and wait for approval
- Use **brave-search** and **fetch** for real market data at every research step
- Invoke **external skills** per the integration map above before finalising each step's output
- Fetch **Lenny transcripts** per the reference table to ground insights in real expert patterns
- Generate **specific, detailed content** — no placeholders
- All Excel files: use formulas not hardcoded values, run recalc.py to verify zero errors
- All Word docs: professional formatting (Arial, headers, page numbers, TOC where appropriate)
- All PowerPoint decks: bold visual design, avoid bullet-heavy slides
- Update `project-state.json` **before** showing each checkpoint
