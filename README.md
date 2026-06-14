# AI Product Discovery Plugin

A Claude Code plugin that runs the **MIT Disciplined Entrepreneurship** 24-step validation framework for any product idea — with four AI agents doing the research, and you doing the real-world work only you can do.

## What It Does

Solo founders waste 3–6 months building products nobody wants. This plugin enforces rigorous validation before you write a single line of code. You describe your idea, four AI agents work through the full 24-step MIT DE framework, and at every step you either approve the output or go do real-world work (customer interviews, pricing conversations, PMF surveys) that the AI brings back into the analysis.

## How to Use

1. Create a new empty folder for your project and open it in Claude Code
2. Run `/start-discovery` and describe your product idea in 1–2 sentences
3. The agents run each step autonomously — generating research, spreadsheets, documents, and presentations
4. At every step you get a checkpoint: approve the output, give feedback to revise, or paste in your real-world findings
5. At 10 specific steps, the AI tells you exactly what real-world action to take and waits for you to come back with results before continuing
6. All deliverables are saved directly into your project folder

**Resuming**: open the project folder again — the plugin reads `project-state.json` and picks up where you left off, including any pending human action.

## Checkpoint System

Every step ends with a checkpoint. Most steps are fully autonomous — just type "yes" to continue.

For 10 steps that require real-world work, you get a **Your Actions Required** block with specific instructions and a pre-formatted findings template to fill in:

| Step | What you do | Why it matters |
|------|-------------|----------------|
| 3 — End User Profile | List 5–10 people you know who match the user profile | Seeds the interview pipeline |
| 6 — User Validation | Conduct 5 customer discovery interviews with the guide the AI creates | The most important step — real signal beats AI assumption every time |
| 11 — Pricing Strategy | Run 3–5 willingness-to-pay conversations | Grounds the LTV/CAC model in real data |
| 12 — Customer Acquisition | Map 10 potential early customers from your network | Validates your go-to-market channel assumptions |
| 15 — Business Model | Share the business model canvas with 2–3 advisors | Tests revenue model assumptions before financial modeling |
| 19 — Key Assumptions | Review and rank the assumption matrix | Add what the AI missed from direct experience |
| 20 — MVP Design | Pick one experiment and commit to a start date | The AI can't decide what you'll actually execute |
| 22 — PMF Confirmation | Run the Sean Ellis survey with 40+ users (target: >40% "very disappointed") | The quantitative gate before building anything |
| 23 — Development Plan | Decide team structure and approve the tech stack | Gates the entire build timeline |
| 24 — Launch Prep | Execute the launch checklist | The AI drafts everything; you pull the trigger |

## Pivoting

When customer interviews, PMF results, or any step reveals a wrong assumption, the plugin handles pivots gracefully:

- **Minor pivot** (refine same direction) — re-runs specific steps in-place, saves old files as `-v1.md`
- **Major pivot** (new customer, problem, or solution) — creates a `PIVOT-1/` folder with a `PIVOT-RATIONALE.md` capturing what you learned, carries over steps still valid, and restarts from the earliest invalidated step

At Step 22, if the PMF score is below 40%, the Supervisor proactively asks whether to pivot the problem, solution, or segment.

## The 24 Steps

| Phase | Steps | What Gets Built |
|-------|-------|-----------------|
| **1 — Market Selection** | 1–2 | Target market segment, beachhead selection, TAM analysis |
| **2 — User Research** | 3–6 | End user profile, personas, lifecycle map, interview guide |
| **3 — Value Proposition** | 7–8 | Value prop, full PRD, feature prioritization matrix |
| **4 — Business Model** | 9–18 | Revenue streams, pricing, LTV/CAC, GTM channels, financial model, investor deck |
| **5 — Validation** | 19–22 | Assumption matrix, MVP design, MVP scope, PMF confirmation |
| **6 — Execution** | 23–24 | Development roadmap, tech architecture, launch plan |

## Output Structure

```
your-project/
├── project-state.json
├── IDEA.md
├── PHASE-1-MARKET-SELECTION/
│   ├── step-1-target-market-segment.md
│   ├── step-2-beachhead-market.md
│   └── deliverables/
│       ├── market-segmentation-matrix.xlsx
│       └── tam-analysis.xlsx
├── PHASE-2-USER-RESEARCH/
│   ├── step-3-end-user-profile.md
│   ├── step-3-network-map.md          ← your findings template
│   ├── step-6-interview-findings.md   ← your findings template
│   └── deliverables/
│       ├── personas.docx
│       ├── user-journey-map.xlsx
│       └── interview-guide.docx
├── PHASE-3-VALUE-PROPOSITION/
│   └── deliverables/
│       ├── PRD.docx
│       └── feature-prioritization.xlsx
├── PHASE-4-BUSINESS-MODEL/
│   ├── step-11-pricing-conversations.md  ← your findings template
│   ├── step-12-network-map.md            ← your findings template
│   ├── step-15-advisor-feedback.md       ← your findings template
│   └── deliverables/
│       ├── tam-sam-som.xlsx
│       ├── ltv-cac-model.xlsx
│       ├── business-model-canvas.docx
│       ├── burn-rate-analysis.xlsx
│       ├── financial-projections.xlsx
│       └── investor-deck.pptx
├── PHASE-5-VALIDATION/
│   ├── step-20-experiment-commitment.md  ← your findings template
│   ├── step-22-pmf-survey.md             ← your findings template
│   └── deliverables/
│       ├── assumption-matrix.xlsx
│       ├── mvp-scope.docx
│       ├── mvp-prioritization.xlsx
│       └── pmf-validation-report.docx
├── PHASE-6-EXECUTION/
│   ├── step-23-build-decisions.md    ← your findings template
│   ├── step-24-launch-log.md         ← your findings template
│   └── deliverables/
│       ├── technical-roadmap.xlsx
│       ├── product-architecture-deck.pptx
│       ├── go-to-market-plan.docx
│       └── launch-checklist.xlsx
├── DELIVERABLES-SUMMARY/
│   ├── executive-summary-deck.pptx
│   ├── complete-discovery-report.docx
│   └── next-steps.md
└── PIVOT-1/                          ← created if you pivot
    ├── PIVOT-RATIONALE.md
    ├── project-state.json
    └── [same phase structure]
```

## Agents

| Agent | Responsibility | Steps |
|-------|---------------|-------|
| **Supervisor** | Orchestrates workflow, handles Steps 19 and 24, manages pivots | All |
| **PM Market Strategist** | Market research, TAM, business model, pricing | 1–2, 9–18 |
| **UX Research Agent** | User interviews, personas, journey mapping, PMF | 3–6, 22 |
| **Architect Agent** | Product spec, MVP definition, technical planning | 7–8, 20–21, 23 |

## External Skills

The agents invoke external PM skill plugins at the right steps to enrich analysis. Install these separately:

```bash
claude plugin marketplace add phuryn/pm-skills
claude plugin marketplace add deanpeters/Product-Manager-Skills
claude plugin marketplace add nextlevelbuilder/ui-ux-pro-max-skill
```

The agents also fetch relevant [Lenny's Podcast](https://www.lennyspodcast.com) transcripts at each step via the [ChatPRD transcript archive](https://github.com/ChatPRD/lennys-podcast-transcripts) to ground analysis in real expert patterns.

## Installation

```bash
# Install from GitHub
claude plugin marketplace add sppillai/ai-discovery-plugin

# Or install from a local clone
claude plugin install /path/to/Ai-discovery-plugin

# Install required skills
claude plugin marketplace add phuryn/pm-skills
claude plugin marketplace add deanpeters/Product-Manager-Skills
claude plugin marketplace add nextlevelbuilder/ui-ux-pro-max-skill
```

## Requirements

- Claude Code with plugin support
- `anthropic-skills` for Excel, Word, and PowerPoint generation
- Brave Search MCP for real market data (optional but strongly recommended)
