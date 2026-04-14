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

## Human Gates (Only 6 Pauses)

Pause ONLY at steps 2, 5, 8, 15, 20, 22. All other steps run automatically.

## Rules

- Run **fully autonomously** — no stopping between steps unless a human gate
- Use **brave-search** and **fetch** for real market data at every research step
- Generate **specific, detailed content** — no placeholders
- All Excel files: use formulas not hardcoded values, run recalc.py to verify zero errors
- All Word docs: professional formatting (Arial, headers, page numbers, TOC where appropriate)
- All PowerPoint decks: bold visual design, avoid bullet-heavy slides
- Update `project-state.json` after every step
