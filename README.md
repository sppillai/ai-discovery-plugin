# AI Product Discovery Plugin

A Claude Code plugin that runs the **MIT Disciplined Entrepreneurship** 24-step validation framework for any product idea — with four AI agents doing the research, and you doing the real-world work only you can do.

## About MIT Disciplined Entrepreneurship

[Disciplined Entrepreneurship](https://entrepreneurship.mit.edu/disciplined-entrepreneurship/) was created by **Bill Aulet**, Managing Director of the [Martin Trust Center for MIT Entrepreneurship](https://entrepreneurship.mit.edu). It is a structured, 24-step framework for building successful startups — developed from decades of research and teaching at MIT and refined through thousands of entrepreneurs worldwide.

The core insight is that entrepreneurship is not a talent you're born with — it's a discipline you can learn. The framework forces founders to answer hard questions in the right order: Who exactly is your customer? What is their life like today? Why would they pay for your solution? What's the business model? How do you get to them? Each answer builds on the last, and skipping steps is how startups waste months building things nobody wants.

The framework is documented in the book **[Disciplined Entrepreneurship: 24 Steps to a Successful Startup](https://www.amazon.com/Disciplined-Entrepreneurship-Steps-Successful-Startup/dp/1118692284)** (Wiley, 2013) and the companion **[Disciplined Entrepreneurship Workbook](https://www.amazon.com/Disciplined-Entrepreneurship-Workbook-Bill-Aulet/dp/1119365791)** (Wiley, 2017). Additional resources, case studies, and instructor materials are available at the [MIT Entrepreneurship website](https://entrepreneurship.mit.edu).

> This plugin is an independent implementation of the DE framework for use with Claude Code. It is not affiliated with or endorsed by MIT or Bill Aulet. All intellectual credit for the framework belongs to Bill Aulet and the Martin Trust Center for MIT Entrepreneurship.

---

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
claude plugin marketplace add nextlevelbuilder/ui-ux-pro-max-skill
```

The agents also fetch relevant [Lenny's Podcast](https://www.lennyspodcast.com) transcripts at each step via the [ChatPRD transcript archive](https://github.com/ChatPRD/lennys-podcast-transcripts) to ground analysis in real expert patterns.

## Installation

### Step 1 — Install the plugin

```bash
claude plugin marketplace add sppillai/ai-discovery-plugin
claude plugin install ai-product-discovery
```

### Step 2 — Install required skill packs

```bash
claude plugin marketplace add phuryn/pm-skills
claude plugin marketplace add nextlevelbuilder/ui-ux-pro-max-skill
```

### Step 3 — Verify everything is installed

```bash
claude plugin list
```

You should see `ai-product-discovery@ai-discovery`, `pm-skills`, and `ui-ux-pro-max-skill` all listed as enabled.

### Updating to a newer version

```bash
claude plugin marketplace update sppillai/ai-discovery-plugin
claude plugin update ai-product-discovery@ai-discovery
```

The plugin identifier includes `@ai-discovery` — this is the marketplace name Claude Code derives from the repo. Always use the full identifier when updating.

### Local install (alternative)

```bash
git clone https://github.com/sppillai/ai-discovery-plugin
claude plugin install /path/to/ai-discovery-plugin
```

## Requirements

- Claude Code with plugin support
- `anthropic-skills` for Excel, Word, and PowerPoint generation
- Brave Search MCP for real market data (optional but strongly recommended)

---

## Attribution

### External Claude Code Skill Repos

This plugin invokes skills from the following open-source repositories. Full credit to their authors:

| Repo | Author | License | What it contributes |
|------|--------|---------|---------------------|
| [phuryn/pm-skills](https://github.com/phuryn/pm-skills) | [@phuryn](https://github.com/phuryn) | MIT | 49 PM skills spanning discovery, strategy, delivery, finance, AI readiness, and career — installed as `pm-skills` marketplace |
| [deanpeters/Product-Manager-Skills](https://github.com/deanpeters/Product-Manager-Skills) | [Dean Peters](https://github.com/deanpeters) | CC BY-NC-SA 4.0 | 47 PM skills (fork of phuryn/pm-skills) with pedagogic framing; same skill set including JTBD, discovery interviews, pricing advisor, growth advisor, PRD development, and epic breakdown |
| [nextlevelbuilder/ui-ux-pro-max-skill](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill) | [@nextlevelbuilder](https://github.com/nextlevelbuilder) | MIT | Design system generator covering style, color palette, typography, and anti-patterns for 161 product types |
| [ChatPRD/lennys-podcast-transcripts](https://github.com/ChatPRD/lennys-podcast-transcripts) | [ChatPRD](https://github.com/ChatPRD) | — | Indexed archive of 269 Lenny's Podcast episodes; fetched at each step as a real-world expert reference |

### Lenny's Podcast

The agents fetch episode transcripts from [Lenny's Podcast](https://www.lennyspodcast.com) — hosted by **Lenny Rachitsky** — at each step of the framework. The podcast is one of the most respected product and growth resources, featuring in-depth conversations with founders, PMs, and investors from companies including Airbnb, Figma, Notion, Stripe, Linear, and many others. All transcript content belongs to Lenny Rachitsky and the respective guests.

### Frameworks and Methodologies Referenced in the Skills

The external skill repos draw on established product management frameworks and the work of leading practitioners. Attribution for the key methodologies used throughout this workflow:

**Product Strategy & Market Research**
- **Jobs to Be Done (JTBD)** — [Clayton Christensen](https://claytonchristensen.com) (Harvard Business School), [Tony Ulwick](https://jobs-to-be-done.com) (Strategyn), and [Bob Moesta](https://therewiredgroup.com) (ReWired Group)
- **Opportunity Solution Tree** — [Teresa Torres](https://www.producttalk.org) (Product Talk)
- **Business Model Canvas** — [Alexander Osterwalder](https://www.strategyzer.com) and Yves Pigneur, *Business Model Generation* (Wiley, 2010)
- **Lean Canvas** — [Ash Maurya](https://leanfoundry.com), adapted from the Business Model Canvas
- **Ansoff Matrix** — Igor Ansoff, *Corporate Strategy* (McGraw-Hill, 1965)
- **Porter's Five Forces** — [Michael E. Porter](https://www.isc.hbs.edu) (Harvard Business School), *Competitive Strategy* (Free Press, 1980)

**User Research & Discovery**
- **Discovery Interview Methodology** — [Steve Blank](https://steveblank.com), *The Four Steps to the Epiphany* (2003), and [Bob Moesta](https://therewiredgroup.com)
- **Empathy Mapping** — [Dave Gray](https://xplaner.com), XPLANE
- **Customer Journey Mapping** — widely attributed to multiple practitioners; formalized in service design literature

**Validation & Experimentation**
- **Pretotyping** — [Alberto Savoia](https://www.pretotyping.org) (Google), *The Right It* (HarperBusiness, 2019)
- **Product-Market Fit Survey ("40% very disappointed")** — [Sean Ellis](https://seanellis.me), founder of GrowthHackers
- **Build–Measure–Learn loop** — [Eric Ries](https://theleanstartup.com), *The Lean Startup* (Crown Business, 2011)

**Pricing**
- **Van Westendorp Price Sensitivity Meter** — Peter Van Westendorp (1976), widely used in SaaS pricing research
- **Value-Based Pricing frameworks** — [Madhavan Ramanujam](https://www.simon-kucher.com) and Georg Tacke, *Monetizing Innovation* (Wiley, 2016)

**Growth & Go-to-Market**
- **McKinsey Growth Pyramid** — McKinsey & Company
- **Growth Loops** — [Brian Balfour](https://brianbalfour.com) (Reforge) and the Reforge growth framework
- **North Star Metric** — [Sean Ellis](https://seanellis.me); formalized by Amplitude in *North Star Playbook*
- **OKRs (Objectives & Key Results)** — Andy Grove (Intel), popularized by [John Doerr](https://www.whatmatters.com), *Measure What Matters* (Portfolio/Penguin, 2018)

**Execution**
- **Pre-mortem technique** — [Gary Klein](https://www.kleinsinsights.com), *Sources of Power* (MIT Press, 1998)
- **MoSCoW prioritization** — Dai Clegg (Dynamic Systems Development Method, 1994)
- **Story Points & Agile Sprints** — [Ken Schwaber](https://kenschwaber.wordpress.com) and Jeff Sutherland, *Scrum: The Art of Doing Twice the Work in Half the Time* (Crown Business, 2014)
