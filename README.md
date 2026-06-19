<img src="assets/social-card.png" alt="AI Product Discovery OS — Claude Code Plugin" width="100%"/>

# AI Product Discovery OS

![Version](https://img.shields.io/badge/version-1.3.0-6366F1?style=flat-square) ![License](https://img.shields.io/badge/license-MIT-22c55e?style=flat-square) ![Claude Code](https://img.shields.io/badge/Claude_Code-Plugin-A5B4FC?style=flat-square) ![Framework](https://img.shields.io/badge/MIT_DE-24_steps-94A3B8?style=flat-square)

---

## The problem

Solo founders waste 3–6 months building products nobody wants. Not because they're bad at building — because they skip the hard questions. Who exactly is your customer? What does their life look like today? Would they actually pay for this? Most founders jump straight to building and find out the answer too late.

Existing AI tools make building faster. None of them make you validate first.

## What this is

A Claude Code plugin that runs the full product lifecycle — from first idea through discovery, design, code, launch, and continuous feedback — all in one git repository, with AI agents at every phase.

You describe your idea. Six AI agents take it through the full **MIT Disciplined Entrepreneurship 24-step framework**, then translate the validated opportunity map into a complete Minimum Usable Product design, HTML mockups, machine-readable requirements, and agent-executable epics. Coding agents build it. Feedback agents synthesise what users say and feed it back into the opportunity map. The cycle continues.

Everything — discovery, design specs, source code, tests, user feedback, and the evolving roadmap — lives in one folder, checked into git, with a shared opportunity map as the spine that connects every phase.

## Quick start

```bash
# 1. Install the plugin
claude plugin marketplace add sppillai/ai-discovery-plugin
claude plugin install ai-product-discovery

# 2. Install required skill packs
claude plugin marketplace add phuryn/pm-skills
claude plugin marketplace add nextlevelbuilder/ui-ux-pro-max-skill

# 3. Verify document-skills is available (powers all Excel/Word/PowerPoint output)
claude plugin list | grep document-skills
# Expected: document-skills@anthropic-agent-skills  ✔ enabled
# Not there? Run: claude plugin install document-skills@anthropic-agent-skills

# 4. Create a project folder and start
mkdir my-product-idea && cd my-product-idea
claude  # open Claude Code in this folder
# then run: /start-discovery
```

---

## Where to use it

Requires **Claude Code** — works in all Claude Code surfaces:

| Surface | How to access | Notes |
|---------|--------------|-------|
| **Claude Code CLI** | `claude` in your terminal | Recommended — best for long sessions |
| **Claude Desktop — Cowork** | Cowork tab in the Claude desktop app | Use "Work in a project" to point at your folder |
| **Claude Desktop — Code** | Code tab in the Claude desktop app | Same as the CLI, built into the app |
| **VS Code extension** | Install "Claude Code" from VS Code marketplace | Run `/start-discovery` in the Claude panel |
| **JetBrains extension** | Install from JetBrains Marketplace | Works in IntelliJ, WebStorm, PyCharm, etc. |

> **Not compatible with**: claude.ai web chat, OpenAI Codex, ChatGPT, GitHub Copilot, Cursor, or Windsurf. Plugins require the Claude Code CLI.

---

## How it works

1. Run `/start-discovery` and describe your product idea in 1–2 sentences
2. Four AI agents work through all 24 steps — generating research, spreadsheets, Word docs, and PowerPoint decks
3. After every step you get a checkpoint: approve the output, give feedback to revise, or paste in your real-world findings
4. At 10 steps, the AI tells you exactly what real-world action to take and waits for you to return with results
5. All deliverables are saved to your project folder as they're created

**Resuming**: open the project folder again in Claude Code — the plugin reads `project-state.json` and picks up exactly where you left off, including any pending human action.

### Steps that require your real-world input

At these 10 steps, the AI creates a findings template and waits for you:

| Step | What you do | Why it can't be skipped |
|------|-------------|------------------------|
| 3 — End User Profile | List 5–10 people you know who match the user profile | Seeds the real interview pipeline |
| 6 — User Validation | Conduct 5 customer discovery interviews | The most important step — real signal beats AI assumption |
| 11 — Pricing Strategy | Run 3–5 willingness-to-pay conversations | Grounds the LTV/CAC model in real data |
| 12 — Customer Acquisition | Map 10 potential early customers from your network | Validates go-to-market assumptions |
| 15 — Business Model | Share the canvas with 2–3 advisors | Tests revenue model before financial modeling |
| 19 — Key Assumptions | Review and rank the assumption matrix | Add what the AI missed from your direct experience |
| 20 — MVP Design | Pick one experiment and commit to a start date | The AI can't decide what you'll actually execute |
| 22 — PMF Confirmation | Run the Sean Ellis survey with 40+ users | The quantitative gate before building anything |
| 23 — Development Plan | Decide team structure and approve the tech stack | Gates the entire build timeline |
| 24 — Launch Prep | Execute the launch checklist | The AI drafts everything; you pull the trigger |

---

## Product lifecycle phases

| Version | Phase | What happens |
|---------|-------|-------------|
| **v0.1** | Discovery | MIT DE 24-step framework — market research, user interviews, opportunity map, business model, PMF validation |
| **v0.2** | MUP Design | PRD.md, design system, screen specs, HTML clickthrough mockups, user testing, epic breakdown |
| **v1.0-alpha** | Build | Coding agents pick up epics and build; you review and give instructions |
| **v1.0** | Launch | Beta users, feedback capture live, PMF survey |
| **v1.1+** | Growth | Feedback synthesis updates opportunity map; new priorities emerge; cycle continues |

### The 24 discovery steps (v0.1)

| Phase | Steps | What gets built |
|-------|-------|-----------------|
| **1 — Market Selection** | 1–2 | Target market segment, beachhead selection, TAM analysis |
| **2 — User Research** | 3–6 | End user profile, current state process map, personas, lifecycle + before/after map, interview guide |
| **3 — Value Proposition** | 7–8 | Opportunity map (root), value prop grounded in top opportunity, full PRD, feature prioritization |
| **4 — Business Model** | 9–18 | Revenue streams, pricing, LTV/CAC, GTM channels, financial model, investor deck |
| **5 — Validation** | 19–22 | Assumption matrix, MVP design, MVP scope, PMF confirmation |
| **6 — Execution** | 23–24 | Development roadmap, tech architecture, launch plan |

## What we added to the framework

The MIT DE framework tells you **what** to validate in the right order. What it doesn't enforce is the connective tissue between user pain and the features you commit to building. Without that thread, value propositions become generic, feature lists are driven by gut feel, and no one can answer "why are we building this?" when the PRD is written.

This plugin adds a structured pain-to-feature chain across Steps 3, 5, 6, 7, and 8:

| Step | What's added | Why it matters |
|------|-------------|----------------|
| **3 — End User Profile** | Current state process map — a step-by-step map of what the user does TODAY, with pain severity (1–5) and emotional state at each step | Creates the "before picture" that everything downstream anchors to |
| **5 — Lifecycle Use Case** | Before & After transformation sheet added to the journey map Excel | Makes the value the product delivers concrete: each step of today's process mapped against what changes with the product |
| **6 — User Validation** | Interview findings loop back to update the process map — pain severity is re-scored based on real confirmation rate, new pains are added, every row marked as AI-assumed or interview-confirmed | Replaces AI assumptions with real evidence before the value prop is written |
| **7 — Value Proposition** | Opportunity map built from the top-severity pain points before the value prop is drafted — each pain becomes an opportunity with Impact × Confidence priority score | Value prop is written from the highest-ranked opportunity, not generic benefit language |
| **8 — Product Specification** | Every feature in the PRD links to a row in the opportunity map — features without a link are flagged "Needs validation" | Every feature can answer: which specific pain does this solve, how severe is it, and what process step does it change |

The result is a PRD where features are not invented — they are derived from real user pain, validated by interviews, and prioritised by opportunity impact.

---

## What you get

Every phase produces real files. The full project folder across the lifecycle:

```
your-product/
│
│  ── Root: project spine ──────────────────────────────────────────
├── CLAUDE.md                          ← phase gates, agent routing, current version
├── ROADMAP.md                         ← versioned phases v0.1 → v1.1+
├── opportunity-map.xlsx               ← the spine: pain→opportunity, updated every phase
├── interview-backlog.md               ← continuous validation queue across all phases
├── inbox.md                           ← mid-session idea capture
├── IDEA.md
├── project-state.json
│
│  ── v0.1 Discovery: MIT DE 24 steps ─────────────────────────────
├── PHASE-1-MARKET-SELECTION/
│   └── deliverables/
│       ├── market-segmentation-matrix.xlsx
│       └── tam-analysis.xlsx
├── PHASE-2-USER-RESEARCH/
│   ├── step-3-network-map.md          ← your findings template
│   ├── step-6-interview-findings.md   ← your findings template
│   └── deliverables/
│       ├── current-state-process-map.xlsx    ← today's process with pain severity
│       ├── current-state-process-map-v2.xlsx ← updated after interviews
│       ├── personas.docx
│       ├── user-journey-map.xlsx             ← adoption journey + before/after
│       └── interview-guide.docx
├── PHASE-3-VALUE-PROPOSITION/
│   └── deliverables/
│       ├── PRD-seed.docx              ← seeds requirements/PRD.md
│       └── feature-prioritization.xlsx
├── PHASE-4-BUSINESS-MODEL/
│   └── deliverables/
│       ├── tam-sam-som.xlsx
│       ├── ltv-cac-model.xlsx
│       ├── business-model-canvas.docx
│       ├── burn-rate-analysis.xlsx
│       ├── financial-projections.xlsx
│       └── investor-deck.pptx
├── PHASE-5-VALIDATION/
│   └── deliverables/
│       ├── assumption-matrix.xlsx
│       ├── mvp-scope.docx
│       └── pmf-validation-report.docx
├── PHASE-6-EXECUTION/
│   └── deliverables/
│       ├── technical-roadmap.xlsx
│       ├── product-architecture-deck.pptx
│       ├── go-to-market-plan.docx
│       └── launch-checklist.xlsx
├── DELIVERABLES-SUMMARY/
│   ├── executive-summary-deck.pptx
│   ├── complete-discovery-report.docx
│   └── next-steps.md
│
│  ── v0.2 MUP Design ─────────────────────────────────────────────
├── requirements/
│   ├── CLAUDE.md                      ← gate status + coding agent instructions
│   ├── PRD.md                         ← machine-readable, derived from opportunity-map.xlsx
│   ├── design/
│   │   ├── design-system.md
│   │   ├── screens/                   ← one .md per screen, full annotated spec
│   │   ├── mockups/                   ← HTML clickthrough files, self-contained
│   │   └── user-testing/              ← session notes + synthesis
│   └── epics/
│       └── epic-001-[name]/
│           ├── spec.md                ← what to build + opportunity row addressed
│           ├── acceptance-criteria.md
│           ├── design-ref.md          ← exact screen(s) to implement
│           └── status.md              ← not-started / in-progress / in-review / done
│
│  ── v1.0-alpha Build ────────────────────────────────────────────
├── src/
│   └── CLAUDE.md                      ← stack, conventions, do-not rules
│
│  ── v1.0-alpha Tests ────────────────────────────────────────────
├── tests/
│   ├── CLAUDE.md
│   ├── unit/
│   ├── integration/
│   ├── e2e/
│   └── quality-reports/
│
│  ── v1.0+ Feedback ─────────────────────────────────────────────
├── feedback/
│   ├── CLAUDE.md                      ← auto-update rules
│   ├── sessions/                      ← typeform, usability studies, interviews
│   ├── logs/                          ← usage signals, analytics
│   ├── synthesis/                     ← agent-generated themes
│   └── decisions/                     ← items awaiting human review
│
│  ── Releases ────────────────────────────────────────────────────
└── releases/
    └── v1.0/
        ├── release-notes.md
        └── retrospective.md
```

## Pivoting

When interviews, PMF results, or any step reveals a wrong assumption:

- **Minor pivot** — re-runs specific steps in-place, saves old files as `-v1.md`
- **Major pivot** — creates a `PIVOT-1/` folder, carries over steps still valid, and restarts from the earliest invalidated step with a `PIVOT-RATIONALE.md` capturing what you learned

At Step 22, if the PMF score is below 40%, the Supervisor proactively asks whether to pivot the problem, solution, or segment.

---

## Agents

| Agent | Phase | Responsibility |
|-------|-------|---------------|
| **Supervisor** | v0.1 | Orchestrates all 24 discovery steps, manages pivots, generates final report |
| **PM Market Strategist** | v0.1 | Market research, TAM, business model, pricing (Steps 1–2, 9–18) |
| **UX Research Agent** | v0.1 | User interviews, personas, journey mapping, PMF (Steps 3–6, 22) |
| **Architect Agent** | v0.1 | Value prop, opportunity map, product spec, MVP planning (Steps 7–8, 20–21, 23) |
| **Requirements Agent** | v0.2 | PRD.md, design system, screen specs, HTML mockups, user testing, epic breakdown |
| **Feedback Agent** | v1.0+ | Synthesises user feedback, updates opportunity map, flags pivots, updates roadmap |

At each step, discovery agents surface a **💬 Expert Insight** block with a real quote from a relevant [Lenny's Podcast](https://www.lennyspodcast.com) episode — attributed to the guest, applied directly to your situation.

## External skill packs

The agents invoke these Claude Code skill packs at the right steps. Install them as part of setup:

| Skill pack | Install required? | What it adds |
|-----------|:-----------------:|-------------|
| `document-skills@anthropic-agent-skills` | Check first — often pre-installed | Excel, Word, and PowerPoint file generation (used at every phase). Published by Anthropic. In your plugin list it shows as `document-skills`, but the agents call it via the `anthropic-skills:` namespace — both resolve to the same plugin. |
| [phuryn/pm-skills](https://github.com/phuryn/pm-skills) | Yes | 49 PM skills — discovery, strategy, pricing, finance, go-to-market |
| [nextlevelbuilder/ui-ux-pro-max-skill](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill) | Yes | Design system generator for 161 product types (Steps 8 and 23) |
| [ChatPRD/lennys-podcast-transcripts](https://github.com/ChatPRD/lennys-podcast-transcripts) | No — fetched live | 269 Lenny's Podcast transcripts, fetched at each step |

---

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

### Step 2b — Check for document-skills (Excel / Word / PowerPoint generation)

This plugin is published by Anthropic and is often already installed with Claude Code. Check first:

```bash
claude plugin list | grep document-skills
```

If you see `document-skills@anthropic-agent-skills  ✔ enabled` — you're good, nothing to do.

If it's missing or shows `✘ failed`:

```bash
claude plugin install document-skills@anthropic-agent-skills
```

> **Why it shows up as `document-skills` but agents call `anthropic-skills:`** — the `anthropic-agent-skills` plugin registers its skills under the `anthropic-skills:` namespace. Both names refer to the same installed plugin. This is not a separate install.

### Step 3 — Verify everything is enabled

```bash
claude plugin list
```

You should see all of these with `✔ enabled`:

```
ai-product-discovery@ai-discovery
document-skills@anthropic-agent-skills
pm-skills@...
ui-ux-pro-max-skill@...
```

### Updating

```bash
claude plugin marketplace update ai-discovery
claude plugin update ai-product-discovery@ai-discovery
```

The `@ai-discovery` suffix is the marketplace name Claude Code assigns to this repo — always use it when updating.

### Local install

```bash
git clone https://github.com/sppillai/ai-discovery-plugin
claude plugin install /path/to/ai-discovery-plugin
```

## Requirements

- **Claude Code** — CLI, desktop app, VS Code extension, or JetBrains extension
- **`document-skills@anthropic-agent-skills`** — Excel, Word, and PowerPoint generation. Published by Anthropic; often pre-installed. Verify with `claude plugin list | grep document-skills` (see Installation → Step 2b if missing).
- **`phuryn/pm-skills`** and **`nextlevelbuilder/ui-ux-pro-max-skill`** — community skill packs (see Installation → Step 2)
- **Brave Search MCP** — live market data at Steps 1–2 and 9–18 (optional but strongly recommended)

---

## About MIT Disciplined Entrepreneurship

[Disciplined Entrepreneurship](https://entrepreneurship.mit.edu/disciplined-entrepreneurship/) was created by **Bill Aulet**, Managing Director of the [Martin Trust Center for MIT Entrepreneurship](https://entrepreneurship.mit.edu). It is a structured, 24-step framework for building successful startups — developed from decades of research and teaching at MIT and refined through thousands of entrepreneurs worldwide.

The framework forces founders to answer hard questions in the right order: Who exactly is your customer? What is their life like today? Why would they pay for your solution? What's the business model? How do you get to them? Each answer builds on the last, and skipping steps is how startups waste months building things nobody wants.

Documented in **[Disciplined Entrepreneurship: 24 Steps to a Successful Startup](https://www.amazon.com/Disciplined-Entrepreneurship-Steps-Successful-Startup/dp/1118692284)** (Wiley, 2013) and the **[Disciplined Entrepreneurship Workbook](https://www.amazon.com/Disciplined-Entrepreneurship-Workbook-Bill-Aulet/dp/1119365791)** (Wiley, 2017).

> This plugin is an independent implementation of the DE framework. It is not affiliated with or endorsed by MIT or Bill Aulet. All intellectual credit for the framework belongs to Bill Aulet and the Martin Trust Center for MIT Entrepreneurship.

---

## Attribution

### External Claude Code skill repos

| Repo | Author | License | What it contributes |
|------|--------|---------|---------------------|
| [phuryn/pm-skills](https://github.com/phuryn/pm-skills) | [@phuryn](https://github.com/phuryn) | MIT | 49 PM skills spanning discovery, strategy, delivery, finance, AI readiness, and career |
| [deanpeters/Product-Manager-Skills](https://github.com/deanpeters/Product-Manager-Skills) | [Dean Peters](https://github.com/deanpeters) | CC BY-NC-SA 4.0 | 47 PM skills (fork of phuryn/pm-skills) with pedagogic framing |
| [nextlevelbuilder/ui-ux-pro-max-skill](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill) | [@nextlevelbuilder](https://github.com/nextlevelbuilder) | MIT | Design system generator for 161 product types |
| [ChatPRD/lennys-podcast-transcripts](https://github.com/ChatPRD/lennys-podcast-transcripts) | [ChatPRD](https://github.com/ChatPRD) | — | Indexed archive of 269 Lenny's Podcast episodes |

### Lenny's Podcast

The agents fetch episode transcripts from [Lenny's Podcast](https://www.lennyspodcast.com) — hosted by **Lenny Rachitsky** — at each step of the framework. All transcript content belongs to Lenny Rachitsky and the respective guests.

### Frameworks and methodologies

The external skill repos draw on the following established frameworks:

**Product strategy & market research** — Jobs to Be Done ([Clayton Christensen](https://claytonchristensen.com), [Tony Ulwick](https://jobs-to-be-done.com), [Bob Moesta](https://therewiredgroup.com)) · Opportunity Solution Tree ([Teresa Torres](https://www.producttalk.org)) · Business Model Canvas ([Alexander Osterwalder](https://www.strategyzer.com)) · Lean Canvas ([Ash Maurya](https://leanfoundry.com)) · Porter's Five Forces ([Michael E. Porter](https://www.isc.hbs.edu))

**User research & discovery** — Discovery Interview Methodology ([Steve Blank](https://steveblank.com)) · Empathy Mapping ([Dave Gray](https://xplaner.com)) · Customer Journey Mapping

**Validation & experimentation** — Pretotyping ([Alberto Savoia](https://www.pretotyping.org)) · Product-Market Fit Survey ([Sean Ellis](https://seanellis.me)) · Build–Measure–Learn ([Eric Ries](https://theleanstartup.com))

**Pricing** — Van Westendorp Price Sensitivity Meter · Value-Based Pricing ([Madhavan Ramanujam](https://www.simon-kucher.com))

**Growth & go-to-market** — Growth Loops ([Brian Balfour](https://brianbalfour.com)) · North Star Metric ([Sean Ellis](https://seanellis.me)) · OKRs (Andy Grove / [John Doerr](https://www.whatmatters.com))

**Execution** — Pre-mortem ([Gary Klein](https://www.kleinsinsights.com)) · MoSCoW prioritization · Agile Sprints ([Ken Schwaber](https://kenschwaber.wordpress.com))
