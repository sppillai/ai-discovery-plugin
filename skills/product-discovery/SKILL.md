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
2. Continue from `currentStep` — do not repeat completed steps
3. Load any relevant agent context files

## Starting Fresh

Ask: *"What's your product idea? (1-2 sentences)"*

Create folder structure:
```
project-state.json
IDEA.md
PHASE-1-MARKET-SELECTION/deliverables/
PHASE-2-USER-RESEARCH/deliverables/
PHASE-3-VALUE-PROPOSITION/deliverables/
PHASE-4-BUSINESS-MODEL/deliverables/
PHASE-5-VALIDATION/deliverables/
PHASE-6-EXECUTION/deliverables/
DELIVERABLES-SUMMARY/
```

## Deliverables Map

All generated files by phase:

### Phase 1 — Market Selection
- `step-1-target-market-segment.md`
- `deliverables/market-segmentation-matrix.xlsx` ← invoke `anthropic-skills:xlsx`
- `step-2-beachhead-market.md`
- `deliverables/tam-analysis.xlsx` ← invoke `anthropic-skills:xlsx`

### Phase 2 — User Research
- `step-3-end-user-profile.md`
- `step-4-personas.md`
- `deliverables/personas.docx` ← invoke `anthropic-skills:docx`
- `step-5-lifecycle-use-case.md`
- `deliverables/user-journey-map.xlsx` ← invoke `anthropic-skills:xlsx`
- `step-6-user-validation.md`
- `deliverables/interview-guide.docx` ← invoke `anthropic-skills:docx`

### Phase 3 — Value Proposition
- `step-7-value-proposition.md`
- `step-8-product-specification.md`
- `deliverables/PRD.docx` ← invoke `anthropic-skills:docx`
- `deliverables/feature-prioritization.xlsx` ← invoke `anthropic-skills:xlsx`

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

After completing each step, the agent presents a summary and waits for approval before proceeding:

```
✅ Step N complete — [one-line summary of what was produced]

📄 Deliverables: [list files created]

👉 Does this look right, or should I revise anything before continuing to Step N+1?
   → Type "yes" to continue / describe what to change
```

- **"yes" / "continue"** → immediately begin next step
- **Any feedback** → revise current step, re-present, wait for approval again
- `project-state.json` is saved **before** showing the checkpoint so no work is lost if session ends

## External Skills — Integration Map

At each step, agents invoke external PM skills to enrich analysis. These require separate plugin installation:

```
claude plugin marketplace add phuryn/pm-skills
claude plugin marketplace add deanpeters/Product-Manager-Skills
claude plugin marketplace add nextlevelbuilder/ui-ux-pro-max-skill
```

| Step | External Skills to Invoke |
|------|--------------------------|
| 1 | `phuryn:pm-market-research` (segmentation), `phuryn:pm-go-to-market` (beachhead) |
| 2 | `phuryn:pm-product-strategy` (startup-canvas), `deanpeters:opportunity-solution-tree` |
| 3 | `deanpeters:jobs-to-be-done` |
| 4 | `phuryn:pm-market-research` (persona-development), `deanpeters:user-story` |
| 5 | `phuryn:pm-product-discovery` (interview-script), `deanpeters:customer-journey-mapping-workshop` |
| 6 | `deanpeters:discovery-interview-prep`, `phuryn:pm-product-discovery` (interview-script, summarize-interview) |
| 7 | `deanpeters:positioning-statement`, `phuryn:pm-product-strategy` (value-proposition) |
| 8 | `deanpeters:prd-development`, `phuryn:pm-execution` (PRD, user-stories), `ui-ux-pro-max` |
| 9 | `phuryn:pm-product-strategy` (monetization-strategy) |
| 10 | `phuryn:pm-market-research` (market-sizing) |
| 11 | `deanpeters:finance-based-pricing-advisor`, `phuryn:pm-product-strategy` (pricing-strategy) |
| 12 | `phuryn:pm-go-to-market` (growth-loops), `deanpeters:organic-growth-advisor` |
| 13 | `phuryn:pm-go-to-market`, `phuryn:pm-marketing-growth` |
| 14 | `phuryn:pm-product-strategy` (ansoff-matrix) |
| 15 | `phuryn:pm-product-strategy` (business-model-canvas, lean-canvas, swot-analysis, porters-five-forces) |
| 16 | `deanpeters` finance suite (32 SaaS metrics) |
| 17 | `deanpeters:finance-based-pricing-advisor`, `phuryn:pm-data-analytics` (cohort-analysis, retention-analysis) |
| 18 | `phuryn:pm-marketing-growth` (positioning, North Star), `phuryn:pm-product-strategy` (product-vision) |
| 19 | `phuryn:pm-product-discovery` (identify-assumptions, prioritize-assumptions) |
| 20 | `phuryn:pm-product-discovery` (brainstorm-experiments-new), `phuryn:pm-execution` (pre-mortem) |
| 21 | `phuryn:pm-execution` (user-stories, sprints), `phuryn:pm-product-discovery` (metrics-dashboard) |
| 22 | `deanpeters:organic-growth-advisor`, `phuryn:pm-product-discovery` (metrics-dashboard, opportunity-solution-tree) |
| 23 | `ui-ux-pro-max`, `phuryn:pm-execution` (roadmap, OKRs), `deanpeters:epic-breakdown-advisor` |
| 24 | `phuryn:pm-go-to-market`, `phuryn:pm-marketing-growth`, `phuryn:pm-execution` (stakeholder-mapping) |

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
