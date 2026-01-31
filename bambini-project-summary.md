# Bambini Project Summary — ARAG Integration & Elterngeld V2

**Last Updated:** 2026-01-31  
**Status:** Active Development  
**Critical Path:** ARAG Integration → Legal Verification → V2 Refactor

---

## 1. Project Overview

**Bambini** is an application enabling parents to claim German social benefits (Elterngeld, Kindergeld, Elternzeit) in one centralized platform.

### Current State
- **V1 Elterngeld flow**: Functional but unverified against BEEG (Bundeselterngeld- und Elternzeitgesetz)
- **V2 Elterngeld refactor**: Planned (~4,500 lines, 8 phases), not started
- **ARAG partnership**: Signed, integration pending

---

## 2. Competing Priorities

| Priority | Item | External Dependency | Blocks V2? |
|----------|------|---------------------|------------|
| 1 | ARAG FAQ + AI Chat Integration | Yes (partner deadline) | No |
| 2 | Legal verification of V1 domain logic | No | Should precede V2 |
| 3 | Elterngeld V2 Refactor | No | N/A |

**Key Insight:** ARAG integration is decoupled from V2 refactor. Ship ARAG deliverables on V1 while V2 development continues separately.

---

## 3. ARAG Integration Requirements

### User Flow
```
ARAG Website → /faq/elterngeld (or /partner/arag/elterngeld)
    → FAQ page with AI chatbox
    → Pre-made questions with pre-made answers (no LLM call)
    → Freeform questions answered by LLM
    → CTA: "Start Application" (leads to Bambini wizard)
```

### Technical Components

**3.1 FAQ System**
- Route structure: `/faq` → `/faq/:topic` (elterngeld, elternzeit, kindergeld, bambini)
- ARAG customers land directly on `/faq/elterngeld` or `/partner/arag/elterngeld`
- Native users access via landing page
- Existing `FAQ.tsx` content (7 Elterngeld, 4 Elternzeit, 6 Kindergeld questions) serves as foundation

**3.2 AI Chat Widget**
- **Collapsed state:** Input field + example question chips
- **Expanded state:** Full chat interface
- **Pre-made Q&A:** No LLM call, faster, cheaper, quality-controlled
- **Freeform questions:** Supabase edge function → LLM with knowledge base
- **Persistent elements:** "Start Application" CTA, "Back to FAQ" navigation

**3.3 Knowledge Base Architecture**
- **Approach:** System prompt stuffing (not fine-tuning, not RAG)
- **Content:** FAQ content + key BEEG excerpts (~5-10k tokens fits in context)
- **Output format:** Markdown, rendered client-side with `react-markdown`
- **Diagrams:** Pre-built SVG/React components referenced by name (not dynamically generated)

**3.4 Edge Function Structure**
```
supabase/functions/elterngeld-chat/
├── index.ts          # Handler
├── knowledge.ts      # System prompt + FAQ content
└── types.ts          # Request/response types
```

**3.5 Partner Attribution**
- Route: `/partner/arag` or query param `?ref=arag`
- Optional co-branding via partner config

---

## 4. Legal Verification (V1)

### Scope
Verify existing domain logic against BEEG:
- `validation.ts`
- `calculator.ts`
- `constraints.ts`

### Rationale
- V1 has 179 tests — safest place to fix bugs
- If bugs found post-refactor, unclear whether bug is from refactor or pre-existing
- Verified logic carries forward unchanged into V2

### Output
- Document discrepancies as issues
- Fix bugs in existing domain layer
- This becomes the verified foundation for V2

---

## 5. V2 Refactor (Deferred)

- Detailed plan exists in `/.planning/Elterngeldupdate/04-implementation-plan.md`
- 8 phases, ~4,500 lines
- **Prerequisite:** Complete legal verification first
- **Not blocking:** ARAG integration

---

## 6. Recommended Execution Order

### Phase 1: ARAG FAQ + Chat (Ship Independently)
1. Restructure FAQ into `/faq/:topic` routes
2. Build ChatWidget component + Supabase edge function
3. Create ARAG-specific entry point with attribution

### Phase 2: Legal Verification
1. Review V1 logic against BEEG
2. Document discrepancies
3. Fix bugs in domain layer

### Phase 3: V2 Refactor
1. Follow existing 8-phase plan
2. Port verified domain logic

---

## 7. Explicit Non-Goals (Defer)

- General-purpose diagram generation system
- Over-engineered partner management system
- Blocking ARAG on V2 completion

---

## 8. Open Questions / Decisions Needed

- [x] Business Case — Completed (see bambini-timeline-businesscase.md)
- [x] Timeline — Completed (ARAG Feb 2026, Legal März 2026, V2 Mai 2026)
- [x] CAC Research — Completed (Blended CAC ~13 €)
- [ ] ARAG deadline (exact date?)
- [ ] Co-branding requirements from ARAG
- [ ] Legal review resource availability
- [ ] Pre-made question/answer content finalization

---

## 9. Business Case Summary

| Kennzahl | Wert |
|----------|------|
| Preis | 49,99 € |
| Monatliche Fixkosten | 109 € |
| Break-Even | 3 Kunden/Monat |
| Blended CAC (realistisch) | ~13 € |
| Jahr 1 Kunden (realistisch) | 1.720 |
| Jahr 1 Umsatz | 86.000 € |
| Jahr 1 Gewinn | +64.000 € |
| Finanzierungsbedarf (GmbH + Runway) | ~22.000 € |

---

## 10. File References

| Item | Location |
|------|----------|
| V2 Implementation Plan | `/.planning/Elterngeldupdate/04-implementation-plan.md` |
| Existing FAQ Content | `FAQ.tsx` |
| Domain Logic (verify) | `validation.ts`, `calculator.ts`, `constraints.ts` |
| Test Suite | 179 tests in domain layer |
| **Business Case & Timeline** | `bambini-timeline-businesscase.md` |
| **CAC Research Report** | `Bambini_CAC_Report_2026.md` |
| **TikTok Channel Analysis** | `Bambini_TikTok_Deep_Dive.md` |

---

## 11. Context for Future Chats

When resuming work, specify:
1. Which phase you're working on (ARAG / Legal / V2)
2. Which component (FAQ routing, ChatWidget, edge function, legal review)
3. Any new constraints or deadline changes

This document assumes V1 remains operational for ARAG users while V2 development proceeds in parallel.
