# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This repository contains the **Bambini Business Plan** — a Typst-based document for the GmbH founding and growth financing of Bambini, a platform that helps German parents apply for social benefits (Elterngeld, Kindergeld, Elternzeit).

## Key Files

- `bambini-business-plan_variables.typ` — **Primary document**. Typst source with centralized variables at the top (lines 1–90) that drive all calculations automatically. This is the file to edit for any content or number changes.
- `bambini-business-plan.typ` — Earlier version without the variable system. Do not edit; kept for reference.
- `bambini-project-summary.md` — Technical project summary (ARAG integration, V2 refactor status)
- `bambini-timeline-businesscase.md` — Timeline and business case details
- `ProjectMemory.md` — Context for AI assistants about the project state

## Build Command

```bash
typst compile bambini-business-plan_variables.typ bambini-business-plan_variables.pdf
```

Requires [Typst](https://typst.app/) installed. The document uses these Typst packages (auto-downloaded):
- `@preview/cetz:0.3.1` — Canvas/drawing
- `@preview/lilaq:0.4.0` — Charts/diagrams

## Architecture: Variable System

The `_variables.typ` file is structured in three layers:

1. **Input Variables (lines 17–88)** — All tunable business parameters (prices, costs, growth rates, market data). Change these to update the entire document.
2. **Automatic Calculations (lines 94–253)** — Derived values (break-even, projections, scenarios). Never hardcode these.
3. **Document Content (lines 506+)** — Typst markup referencing variables via `#variable-name` or `#euro(value)`.

Key variable groups:
- Pricing: `product-price`, `b2b-pepy`, `b2b-case-fee`
- Costs: `cost-hosting`, `cost-dev-tools`, `monthly-fixed-costs` (calculated)
- Customer projections: `customers-q1` through `customers-q4` (Q2-Q4 are growth multipliers of previous quarter)
- Marketing: `cac-arag`, `cac-tiktok`, `share-arag`, etc. feed into `blended-cac`
- Scenarios: `scenario-conservative` (0.74x), `scenario-optimistic` (1.45x)

## Formatting Helpers

- `#euro(value)` — Format as Euro with thousand separators (e.g., "13.700 €")
- `#euro-compact(value)` — Compact format for tables (e.g., "14k €")
- `#pct(value)` — Percentage format
- `#num(value)` — Number with thousand separators

## Language

All document content is in **German**. Comments in the Typst source are in English. When editing content, maintain German language and formal-but-accessible tone.

## Important Context

- The business plan is for potential investors and the ARAG partnership
- ARAG partnership is signed but integration is pending
- The team consists of students from Bucerius Law School, Hamburg
- Current customer projection starts conservatively: 50 customers in Q1, growing via multipliers
- GmbH is "in Gründung" (in formation), total capital need is Stammkapital (12,500 €) + founding costs
