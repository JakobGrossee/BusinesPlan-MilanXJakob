// Bambini Business Plan - Premium Design
// Refined visual identity with geometric accents and modern typography
// VERSION MIT VARIABLEN UND AUTOMATISCHEN BERECHNUNGEN

#import "@preview/cetz:0.3.1": canvas, draw

#set document(
  title: "Bambini Business Plan 2026",
  author: "Bambini GmbH (i.Gr.)",
)

// ═══════════════════════════════════════════════════════════════════════════
// ZENTRALE VARIABLEN - HIER ANPASSEN FÜR AUTOMATISCHE NEUBERECHNUNG
// ═══════════════════════════════════════════════════════════════════════════

// ─── Preismodell ─────────────────────────────────────────────────────────────
#let product-price = 49.99          // Produktpreis in Euro
#let b2b-pepy = 4                   // B2B: Price per Employee per Year
#let b2b-case-fee = 25              // B2B: Gebühr pro Fall

// ─── Monatliche Betriebskosten ───────────────────────────────────────────────
#let cost-hosting = 4               // Vercel Hosting
#let cost-supabase = 0              // Supabase (Free Tier)
#let cost-dev-tools = 90            // Entwicklung (Tools, APIs)
#let cost-qes-monthly = 15          // QES (Signatur) monatlich

// ─── Jährliche Kosten ────────────────────────────────────────────────────────
#let cost-email-annual = 20         // E-Mail-Hosting jährlich
#let cost-qes-annual = 27           // QES-Zertifikat (80€/3J ≈ 27€/Jahr)

// ─── Gründungskosten (Min/Max) ───────────────────────────────────────────────
#let cost-notar-min = 681
#let cost-notar-max = 850
#let cost-handelsregister-min = 150
#let cost-handelsregister-max = 250
#let cost-gewerbe-min = 30
#let cost-gewerbe-max = 45
#let cost-transparenz = 19.80       // Transparenzregister (fix)
#let stammkapital = 12500           // GmbH Stammkapital

// ─── Marketing & CAC nach Kanal ──────────────────────────────────────────────
#let cac-arag = 0
#let cac-tiktok = 20
#let cac-meta = 28
#let cac-seo = 0
#let cac-referral = 12

#let share-arag = 0.25              // 25%
#let share-tiktok = 0.30            // 30%
#let share-meta = 0.20              // 20%
#let share-seo = 0.10               // 10%
#let share-referral = 0.15          // 15%

// ─── Kundenprognose (Quartale) ───────────────────────────────────────────────
#let customers-q1 = 50             // Monate 1-3
#let customers-q2 = customers-q1 * 2.0    // Monate 4-6 (+100%)
#let customers-q3 = customers-q2 * 1.7    // Monate 7-9 (+70%)
#let customers-q4 = customers-q3 * 1.6    // Monate 10-12 (+60%)

#let cac-q1 = 18
#let cac-q2 = 15
#let cac-q3 = 13
#let cac-q4 = 11

// ─── Marktdaten ──────────────────────────────────────────────────────────────
#let births-per-year = 685000       // Geburten pro Jahr in DE
#let serviceable-market-ratio = 0.45 // Anteil Serviceable Market
#let non-takeup-rate = 0.70         // Nichtinanspruchnahme
#let family-budget-billion = 80     // Budget Familienleistungen in Mrd. €

// ─── Zielgruppensegmente ─────────────────────────────────────────────────────
#let segment-a-ratio = 0.25         // Akademiker & Berufstätige
#let segment-b-ratio = 0.20         // Menschen mit Sprachbarrieren

// ─── Szenario-Multiplikatoren ────────────────────────────────────────────────
#let scenario-conservative = 0.74   // Konservativ: 74% des realistischen
#let scenario-optimistic = 1.45     // Optimistisch: 145% des realistischen

// ─── Mehrjahresplanung ───────────────────────────────────────────────────────
#let year2-growth = 2.69            // Wachstumsfaktor Jahr 2
#let year3-growth = 2.0             // Wachstumsfaktor Jahr 3

// ─── B2B Beispielrechnung ────────────────────────────────────────────────────
#let b2b-example-employees = 200
#let b2b-example-cases = 12
#let b2b-pilot-companies = 8
#let b2c-year1-customers = 1000


// ═══════════════════════════════════════════════════════════════════════════
// AUTOMATISCHE BERECHNUNGEN
// ═══════════════════════════════════════════════════════════════════════════

// ─── Kostenberechnungen ──────────────────────────────────────────────────────
#let monthly-fixed-costs = cost-hosting + cost-supabase + cost-dev-tools + cost-qes-monthly
#let annual-fixed-costs = (monthly-fixed-costs * 12) + cost-email-annual + cost-qes-annual

#let founding-costs-min = cost-notar-min + cost-handelsregister-min + cost-gewerbe-min + cost-transparenz
#let founding-costs-max = cost-notar-max + cost-handelsregister-max + cost-gewerbe-max + cost-transparenz

#let total-capital-min = stammkapital + founding-costs-min
#let total-capital-max = stammkapital + founding-costs-max

// ─── Blended CAC ─────────────────────────────────────────────────────────────
#let blended-cac = (cac-arag * share-arag) + (cac-tiktok * share-tiktok) + (cac-meta * share-meta) + (cac-seo * share-seo) + (cac-referral * share-referral)

// ─── Break-Even ──────────────────────────────────────────────────────────────
#let break-even-monthly = calc.ceil(monthly-fixed-costs / (product-price - blended-cac))

// ─── Kundenprognose Jahr 1 ───────────────────────────────────────────────────
#let customers-year1 = customers-q1 + customers-q2 + customers-q3 + customers-q4
#let revenue-year1 = customers-year1 * product-price

// ─── Marketing-Kosten Jahr 1 ─────────────────────────────────────────────────
#let marketing-q1 = customers-q1 * cac-q1
#let marketing-q2 = customers-q2 * cac-q2
#let marketing-q3 = customers-q3 * cac-q3
#let marketing-q4 = customers-q4 * cac-q4
#let marketing-year1 = marketing-q1 + marketing-q2 + marketing-q3 + marketing-q4

// ─── Umsatz pro Quartal ──────────────────────────────────────────────────────
#let revenue-q1 = customers-q1 * product-price
#let revenue-q2 = customers-q2 * product-price
#let revenue-q3 = customers-q3 * product-price
#let revenue-q4 = customers-q4 * product-price

// ─── Ergebnis pro Quartal (nach Marketing und anteiligen Fixkosten) ──────────
#let result-q1 = revenue-q1 - marketing-q1
#let result-q2 = revenue-q2 - marketing-q2
#let result-q3 = revenue-q3 - marketing-q3
#let result-q4 = revenue-q4 - marketing-q4

// ─── Gesamtkosten Jahr 1 ─────────────────────────────────────────────────────
#let total-costs-year1 = annual-fixed-costs + marketing-year1
#let profit-year1 = revenue-year1 - total-costs-year1

// ─── Gewichteter CAC Jahr 1 ──────────────────────────────────────────────────
#let weighted-cac-year1 = marketing-year1 / customers-year1

// ─── Monthly Break-Even Data (für Chart) ────────────────────────────────────
// Monatliche Kundenverteilung (gleichmäßig über Quartal)
#let customers-per-month-q1 = customers-q1 / 3
#let customers-per-month-q2 = customers-q2 / 3
#let customers-per-month-q3 = customers-q3 / 3
#let customers-per-month-q4 = customers-q4 / 3

// Monatliche Marketing- und Fixkosten
#let monthly-marketing-q1 = marketing-q1 / 3
#let monthly-marketing-q2 = marketing-q2 / 3
#let monthly-marketing-q3 = marketing-q3 / 3
#let monthly-marketing-q4 = marketing-q4 / 3

#let monthly-revenue-q1 = revenue-q1 / 3
#let monthly-revenue-q2 = revenue-q2 / 3
#let monthly-revenue-q3 = revenue-q3 / 3
#let monthly-revenue-q4 = revenue-q4 / 3

// Kumulative Werte für jeden Monat (0-12)
#let cumulative-revenue = (
  0, // Monat 0 (Start)
  monthly-revenue-q1,
  monthly-revenue-q1 * 2,
  monthly-revenue-q1 * 3, // Ende Q1
  monthly-revenue-q1 * 3 + monthly-revenue-q2,
  monthly-revenue-q1 * 3 + monthly-revenue-q2 * 2,
  revenue-q1 + revenue-q2, // Ende Q2
  revenue-q1 + revenue-q2 + monthly-revenue-q3,
  revenue-q1 + revenue-q2 + monthly-revenue-q3 * 2,
  revenue-q1 + revenue-q2 + revenue-q3, // Ende Q3
  revenue-q1 + revenue-q2 + revenue-q3 + monthly-revenue-q4,
  revenue-q1 + revenue-q2 + revenue-q3 + monthly-revenue-q4 * 2,
  revenue-year1 // Ende Jahr 1
)

#let cumulative-costs = (
  founding-costs-max, // Initiale Kosten
  founding-costs-max + monthly-fixed-costs + monthly-marketing-q1,
  founding-costs-max + monthly-fixed-costs * 2 + monthly-marketing-q1 * 2,
  founding-costs-max + monthly-fixed-costs * 3 + marketing-q1, // Ende Q1
  founding-costs-max + monthly-fixed-costs * 4 + marketing-q1 + monthly-marketing-q2,
  founding-costs-max + monthly-fixed-costs * 5 + marketing-q1 + monthly-marketing-q2 * 2,
  founding-costs-max + monthly-fixed-costs * 6 + marketing-q1 + marketing-q2, // Ende Q2
  founding-costs-max + monthly-fixed-costs * 7 + marketing-q1 + marketing-q2 + monthly-marketing-q3,
  founding-costs-max + monthly-fixed-costs * 8 + marketing-q1 + marketing-q2 + monthly-marketing-q3 * 2,
  founding-costs-max + monthly-fixed-costs * 9 + marketing-q1 + marketing-q2 + marketing-q3, // Ende Q3
  founding-costs-max + monthly-fixed-costs * 10 + marketing-q1 + marketing-q2 + marketing-q3 + monthly-marketing-q4,
  founding-costs-max + monthly-fixed-costs * 11 + marketing-q1 + marketing-q2 + marketing-q3 + monthly-marketing-q4 * 2,
  founding-costs-max + annual-fixed-costs + marketing-year1 // Ende Jahr 1
)

// Kumulativer Gewinn/Verlust
#let cumulative-profit = (
  cumulative-revenue.at(0) - cumulative-costs.at(0),
  cumulative-revenue.at(1) - cumulative-costs.at(1),
  cumulative-revenue.at(2) - cumulative-costs.at(2),
  cumulative-revenue.at(3) - cumulative-costs.at(3),
  cumulative-revenue.at(4) - cumulative-costs.at(4),
  cumulative-revenue.at(5) - cumulative-costs.at(5),
  cumulative-revenue.at(6) - cumulative-costs.at(6),
  cumulative-revenue.at(7) - cumulative-costs.at(7),
  cumulative-revenue.at(8) - cumulative-costs.at(8),
  cumulative-revenue.at(9) - cumulative-costs.at(9),
  cumulative-revenue.at(10) - cumulative-costs.at(10),
  cumulative-revenue.at(11) - cumulative-costs.at(11),
  cumulative-revenue.at(12) - cumulative-costs.at(12),
)

// ─── Marktberechnungen ───────────────────────────────────────────────────────
#let serviceable-market = calc.round(births-per-year * serviceable-market-ratio)
#let segment-a-size = calc.round(births-per-year * segment-a-ratio)
#let segment-b-size = calc.round(births-per-year * segment-b-ratio)
#let market-share-year1 = (customers-year1 / serviceable-market) * 100

// ─── Szenario-Berechnungen ───────────────────────────────────────────────────
#let customers-conservative = calc.round(customers-year1 * scenario-conservative)
#let revenue-conservative = customers-conservative * product-price
#let marketing-conservative = customers-conservative * blended-cac
#let profit-conservative = revenue-conservative - annual-fixed-costs - marketing-conservative

#let customers-optimistic = calc.round(customers-year1 * scenario-optimistic)
#let revenue-optimistic = customers-optimistic * product-price
#let marketing-optimistic = customers-optimistic * blended-cac
#let profit-optimistic = revenue-optimistic - annual-fixed-costs - marketing-optimistic

// ─── Mehrjahresplanung ───────────────────────────────────────────────────────
#let customers-year2 = calc.round(customers-year1 * year2-growth)
#let revenue-year2 = customers-year2 * product-price
#let market-share-year2 = (customers-year2 / serviceable-market) * 100

#let customers-year3 = calc.round(customers-year2 * year3-growth)
#let revenue-year3 = customers-year3 * product-price
#let market-share-year3 = (customers-year3 / serviceable-market) * 100

// ─── B2B Berechnungen ────────────────────────────────────────────────────────
#let b2b-example-annual = b2b-example-employees * b2b-pepy
#let b2b-example-usage = b2b-example-cases * b2b-case-fee
#let b2b-example-total = b2b-example-annual + b2b-example-usage
#let b2b-pilot-revenue = b2b-pilot-companies * b2b-example-total
#let b2c-pilot-revenue = b2c-year1-customers * product-price
#let hybrid-year1-revenue = b2c-pilot-revenue + b2b-pilot-revenue

// ─── Verwendung der Mittel ───────────────────────────────────────────────────
#let runway-months = 6
#let ops-reserve = monthly-fixed-costs * runway-months
#let marketing-reserve = 5000
#let buffer = stammkapital - ops-reserve - marketing-reserve

// ─── Anteilsberechnungen für Mittelverwendung ────────────────────────────────
#let total-funds = total-capital-max
#let marketing-share = (marketing-reserve / total-funds) * 100
#let founding-share-min = (founding-costs-min / total-funds) * 100
#let founding-share-max = (founding-costs-max / total-funds) * 100
#let ops-share = (ops-reserve / total-funds) * 100
#let buffer-share = (buffer / total-funds) * 100


// ═══════════════════════════════════════════════════════════════════════════
// FORMATIERUNGSFUNKTIONEN
// ═══════════════════════════════════════════════════════════════════════════

// Euro-Formatierung
#let euro(value) = {
  if value >= 1000000 {
    str(calc.round(value / 1000000, digits: 1)) + " Mio. €"
  } else if value >= 1000 {
    let rounded = calc.round(value)
    let thousands = calc.floor(rounded / 1000)
    let remainder = calc.rem(rounded, 1000)
    let remainder-str = str(remainder)
    // Pad with zeros
    while remainder-str.len() < 3 {
      remainder-str = "0" + remainder-str
    }
    str(thousands) + "." + remainder-str + " €"
  } else if value == calc.floor(value) {
    str(calc.round(value)) + " €"
  } else {
    str(calc.round(value, digits: 2)).replace(".", ",") + " €"
  }
}

// Kompakte Euro-Formatierung für Tabellen
#let euro-compact(value) = {
  if value >= 1000 {
    str(calc.round(value / 1000, digits: 0)) + "k €"
  } else {
    str(calc.round(value)) + " €"
  }
}

// Prozent-Formatierung
#let pct(value) = {
  str(calc.round(value, digits: 1)) + "%"
}

// Tausender-Formatierung
#let num(value) = {
  if value >= 1000000 {
    str(calc.round(value / 1000000, digits: 2)) + " Mio."
  } else if value >= 1000 {
    str(calc.round(value / 1000, digits: 0)) + ".000"
  } else {
    str(calc.round(value))
  }
}


// ─── Color Palette ───────────────────────────────────────────────────────────
#let primary = rgb("#6B46C1")
#let primary-light = rgb("#9F7AEA")
#let primary-dark = rgb("#44337A")
#let accent = rgb("#ED8936")
#let accent-light = rgb("#FBD38D")
#let success = rgb("#38A169")
#let danger = rgb("#E53E3E")
#let info = rgb("#3182CE")
#let dark = rgb("#1A202C")
#let muted = rgb("#718096")
#let light-bg = rgb("#F7FAFC")
#let warm-bg = rgb("#FFFAF0")
#let surface = rgb("#EDF2F7")

// ─── Page Setup ──────────────────────────────────────────────────────────────
#set page(
  paper: "a4",
  margin: (x: 2.2cm, y: 2.5cm),
  header: context {
    if counter(page).get().first() > 2 [
      #set text(size: 8.5pt, fill: muted, tracking: 0.5pt)
      #grid(
        columns: (1fr, 1fr),
        align: (left, right),
        [BAMBINI BUSINESS PLAN], [FEBRUAR 2026],
      )
      #v(-3pt)
      #line(length: 100%, stroke: (
        paint: gradient.linear(primary, accent),
        thickness: 1.5pt,
      ))
    ]
  },
  footer: context {
    if counter(page).get().first() > 2 [
      #line(length: 100%, stroke: 0.5pt + surface)
      #v(5pt)
      #set text(size: 8pt, fill: muted)
      #grid(
        columns: (1fr, 1fr, 1fr),
        align: (left, center, right),
        [#image("bambini-logo.png", width: 30pt)],
        [bambini-claims.de],
        [
          #box(
            fill: primary,
            inset: (x: 8pt, y: 3pt),
            radius: 10pt,
          )[#text(fill: white, weight: "bold")[#counter(page).display()]]
        ],
      )
    ]
  },
)

// ─── Typography ──────────────────────────────────────────────────────────────
#set text(
  font: ("Roboto", "Helvetica Neue", "Arial"),
  size: 10.5pt,
  fill: dark,
  lang: "de",
)

#set par(
  justify: true,
  leading: 0.75em,
)

#set heading(numbering: "1.1")

// Section headings — large purple with decorative accent bar
#show heading.where(level: 1): it => {
  v(1em)
  block(width: 100%)[
    #box(
      width: 5pt,
      height: 28pt,
      fill: gradient.linear(primary, accent, dir: ttb),
      radius: 2pt,
    )
    #h(12pt)
    #text(size: 20pt, weight: "bold", fill: primary-dark, tracking: -0.3pt)[#it.body]
  ]
  v(3pt)
  line(length: 100%, stroke: 0.75pt + surface)
  v(0.6em)
}

#show heading.where(level: 2): it => {
  v(1em)
  text(size: 13pt, weight: "bold", fill: dark, tracking: -0.2pt)[#it.body]
  v(0.4em)
}

#show heading.where(level: 3): it => {
  v(0.6em)
  text(size: 10.5pt, weight: "bold", fill: muted)[#it.body]
  v(0.2em)
}

// ─── Custom Components ───────────────────────────────────────────────────────

// Accent box with gradient left border
#let highlight-box(title: none, content, color: primary) = {
  block(
    width: 100%,
    fill: color.lighten(93%),
    stroke: (
      left: (
        paint: gradient.linear(color, color.lighten(40%), dir: ttb),
        thickness: 4pt,
      ),
    ),
    inset: 18pt,
    radius: (right: 6pt),
  )[
    #if title != none [
      #text(weight: "bold", fill: color, size: 11pt, tracking: 0.3pt)[#upper(title)]
      #v(8pt)
    ]
    #content
  ]
}

// Modern stat card with colored top accent
#let stat-card(number, label, color: primary) = {
  box(
    width: 100%,
    fill: white,
    stroke: 1pt + rgb("#E2E8F0"),
    radius: 8pt,
    clip: true,
  )[
    #block(width: 100%, height: 3pt, fill: gradient.linear(color, color.lighten(30%)))
    #align(center)[
      #v(12pt)
      #text(size: 22pt, weight: "bold", fill: color)[#number]
      #v(2pt)
      #text(size: 8pt, fill: muted, tracking: 0.5pt, weight: "medium")[#upper(label)]
      #v(10pt)
    ]
  ]
}

// Metric row with dotted leader
#let metric-row(label, value) = {
  grid(
    columns: (1fr, auto),
    align: (left + horizon, right + horizon),
    [#text(fill: muted)[#label] #box(width: 1fr, repeat[#text(fill: rgb("#E2E8F0"))[.]])],
    text(weight: "bold", fill: dark)[#value],
  )
  v(6pt)
}

// Badge component
#let badge(content, color: primary) = {
  box(
    fill: color,
    inset: (x: 10pt, y: 5pt),
    radius: 12pt,
  )[#text(fill: white, weight: "bold", size: 8.5pt, tracking: 0.3pt)[#content]]
}

// Number callout for process steps
#let step-number(n, color: primary) = {
  box(
    width: 32pt,
    height: 32pt,
    fill: gradient.linear(color, color.lighten(25%)),
    radius: 50%,
  )[
    #align(center + horizon)[
      #text(fill: white, weight: "bold", size: 14pt)[#n]
    ]
  ]
}

// KPI card for key metrics
#let kpi-card(icon, number, label, color: primary) = {
  box(
    width: 100%,
    fill: white,
    stroke: 1pt + color.lighten(70%),
    radius: 10pt,
    inset: 14pt,
  )[
    #align(center)[
      #text(size: 18pt)[#icon]
      #v(4pt)
      #text(size: 20pt, weight: "bold", fill: color)[#number]
      #v(2pt)
      #text(size: 8pt, fill: muted, tracking: 0.4pt)[#upper(label)]
    ]
  ]
}

// ============================================================================
// COVER PAGE
// ============================================================================

#page(header: none, footer: none, margin: 0pt)[
  // Top accent bar
  #block(width: 100%, height: 6pt, fill: gradient.linear(primary, accent))

  #v(1fr)

  #align(center)[
    // Geometric decoration
    #block(width: 80pt, height: 3pt, fill: gradient.linear(primary, accent), radius: 2pt)
    #v(1.2cm)

    // Brand name
    #image("bambini-logo.png", width: 250pt)

    #v(0.3cm)

    #text(size: 13pt, fill: muted, tracking: 1pt, weight: "medium")[
      ELTERNGELD OHNE STRESS
    ]

    #v(0.3cm)

    #text(size: 11pt, fill: accent, style: "italic")[
      Mehr Geld für deine Familie.
    ]

    #v(2.5cm)

    // Large decorative divider
    #grid(
      columns: (1fr, auto, 1fr),
      align: (right + horizon, center + horizon, left + horizon),
      column-gutter: 12pt,
      line(length: 80pt, stroke: 1pt + surface),
      box(width: 8pt, height: 8pt, fill: primary, radius: 50%),
      line(length: 80pt, stroke: 1pt + surface),
    )

    #v(2.5cm)

    // Title block
    #text(size: 32pt, weight: "bold", fill: dark, tracking: -0.5pt)[Business Plan]

    #v(0.4cm)

    #text(size: 12pt, fill: muted)[
      Geschäftsplan für die GmbH-Gründung und Wachstumsfinanzierung
    ]

    #v(3cm)

    // Info badges
    #grid(
      columns: (auto, auto, auto),
      column-gutter: 15pt,
      badge("Februar 2026", color: primary), badge("GmbH i.Gr.", color: info),
    )
  ]

  #v(1fr)

  // Bottom accent bar
  #block(width: 100%, height: 6pt, fill: gradient.linear(accent, primary))
]

// ============================================================================
// TABLE OF CONTENTS
// ============================================================================

#page(header: none)[
  #v(2cm)

  #grid(
    columns: (auto, 1fr),
    column-gutter: 15pt,
    align: (left + horizon, left + bottom),
    text(size: 28pt, weight: "bold", fill: primary-dark, tracking: -0.5pt)[Inhalt],
    line(length: 100%, stroke: 1pt + surface),
  )

  #v(1.5cm)

  #set text(size: 11pt)
  #outline(
    title: none,
    indent: 1.5em,
    depth: 2,
  )
]

// ============================================================================
// EXECUTIVE SUMMARY
// ============================================================================

= Executive Summary

#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  column-gutter: 10pt,
  kpi-card("💰", euro(product-price), "Preis pro Familie", color: primary),
  kpi-card("⚡", euro(monthly-fixed-costs), "mtl. Fixkosten", color: info),
  kpi-card("📊", [~#euro(calc.round(blended-cac))], "Blended CAC", color: success),
  kpi-card("🚀", euro-compact(revenue-year1), "Umsatz Jahr 1", color: accent),
)

#v(1em)

*Bambini* ist eine digitale Plattform, die Eltern in Deutschland hilft, Sozialleistungen wie Elterngeld, Kindergeld und Elternzeit in einer zentralen Anwendung zu beantragen. Wir lösen ein konkretes Problem: *#family-budget-billion Milliarden Euro* stehen jährlich für Familienleistungen bereit – aber *bis zu #calc.round(non-takeup-rate * 100)%* kommen nie bei den Familien an, weil der Antragsprozess zu komplex ist.#footnote[BMFSFJ 2021]

== Das Problem

Das deutsche System der Familienleistungen ist ein Bürokratie-Dschungel:

#grid(
  columns: (1fr, 1fr),
  column-gutter: 12pt,
  row-gutter: 12pt,
  box(fill: danger.lighten(92%), inset: 12pt, radius: 6pt, width: 100%)[
    #text(size: 20pt, weight: "bold", fill: danger)[130+] \
    #text(size: 9pt, fill: muted)[zuständige Stellen bundesweit]
  ],
  box(fill: danger.lighten(92%), inset: 12pt, radius: 6pt, width: 100%)[
    #text(size: 20pt, weight: "bold", fill: danger)[500+] \
    #text(
      size: 9pt,
      fill: muted,
    )[Seiten Anträge und Leitfäden#footnote([#link("https://www.ifo.de/pressemitteilung/2025-10-15/ueber-500-verschiedene-sozialleistungen-deutschland")[ifo Institut]])]
  ],

  box(fill: danger.lighten(92%), inset: 12pt, radius: 6pt, width: 100%)[
    #text(size: 20pt, weight: "bold", fill: danger)[~8.000 €] \
    #text(size: 9pt, fill: muted)[möglicher Verlust pro Familie]
  ],
  box(fill: danger.lighten(92%), inset: 12pt, radius: 6pt, width: 100%)[
    #text(size: 20pt, weight: "bold", fill: danger)[#calc.round(non-takeup-rate * 100)%] \
    #text(size: 9pt, fill: muted)[Nichtinanspruchnahme]
  ],
)

#v(0.5em)

Die Stadt Hannover warnt explizit: _"Das Antragsformular ist extrem kompliziert, wenig bürgerfreundlich und nicht barrierefrei."_ #footnote[#link("https://www.hannover.de/Leben-in-der-Region-Hannover/Verwaltungen-Kommunen/Die-Verwaltung-der-Landeshauptstadt-Hannover/Dezernate-und-Fachbereiche-der-LHH/Jugend,-Familie-Sport/Fachbereich-Jugend-und-Familie/Elterngeldstelle/Elterngeld-beantragen")[hannover.de]]

#pagebreak()

== Unsere Lösung

Bambini macht Schluss mit dem Antrag-Chaos:

#grid(
  columns: (1fr, 1fr, 1fr),
  column-gutter: 10pt,
  box(fill: success.lighten(92%), inset: 12pt, radius: 6pt, width: 100%, stroke: (top: 3pt + success))[
    #align(center)[
      #text(size: 16pt)[📝]
      #v(4pt)
      *1. Erfassen*
      #v(4pt)
      #text(size: 8.5pt, fill: muted)[Intelligentes Ausfüllen, KI-gestützte Dokumentenerkennung]
    ]
  ],
  box(fill: info.lighten(92%), inset: 12pt, radius: 6pt, width: 100%, stroke: (top: 3pt + info))[
    #align(center)[
      #text(size: 16pt)[🔍]
      #v(4pt)
      *2. Finden*
      #v(4pt)
      #text(size: 8.5pt, fill: muted)[Automatischer Check aller Leistungen, Schritt-für-Schritt]
    ]
  ],
  box(fill: primary.lighten(92%), inset: 12pt, radius: 6pt, width: 100%, stroke: (top: 3pt + primary))[
    #align(center)[
      #text(size: 16pt)[📮]
      #v(4pt)
      *3. Versenden*
      #v(4pt)
      #text(size: 8.5pt, fill: muted)[Einmalige Eingabe, direkter digitaler Versand]
    ]
  ],
)

== Geschäftsmodell

#box(fill: light-bg, inset: 18pt, radius: 8pt, width: 100%)[
  #metric-row([Produktpreis (Einmalzahlung)], [*#euro(product-price)*])
  #metric-row([Monatliche Betriebskosten], [*#euro(monthly-fixed-costs)*])
  #metric-row([Break-Even], [*#break-even-monthly Kunden/Monat*])
  #metric-row([Blended Customer Acquisition Cost], [*~#euro(calc.round(blended-cac))*])
  #metric-row([Jahr 1 Umsatz (realistisch)], [*#euro-compact(revenue-year1)*])
  #metric-row([Jahr 1 Gewinn (realistisch)], [*#text(fill: green)[+#euro-compact(profit-year1)]*])
]
== Finanzierungsbedarf

#box(
  width: 100%,
  fill: success.lighten(93%),
  stroke: 2pt + success,
  radius: 8pt,
  inset: 8pt,
)[
  #align(center)[
    #text(size: 9pt, weight: "bold", fill: success)[Gesamtkapitalbedarf]
    #text(size: 13pt, weight: "bold", fill: success)[#euro(total-capital-min) – #euro(total-capital-max)]
    #text(size: 7pt, fill: muted)[Stammkapital (#euro(stammkapital)) + Gründungskosten (#euro(founding-costs-min) – #euro(founding-costs-max))]
  ]
]

#grid(
  columns: (1fr, 1fr),
  column-gutter: 15pt,
  row-gutter: 15pt,
  [
    // Stammkapital mit Verwendung
    #box(
      width: 100%,
      fill: info.lighten(93%),
      stroke: 2pt + info,
      radius: 10pt,
      inset: 16pt,
    )[
      #align(center)[
        #text(size: 14pt, weight: "bold", fill: info)[Stammkapital]
        #text(size: 20pt, weight: "bold", fill: info)[#euro(stammkapital)]
      ]

      #v(10pt)
      #line(length: 100%, stroke: 1pt + info.lighten(50%))
      #v(10pt)

      #text(size: 8pt, fill: muted, weight: "bold")[VERWENDUNG]
      #v(6pt)

      #box(
        width: 100%,
        fill: white,
        stroke: 1pt + info.lighten(70%),
        radius: 6pt,
        inset: 10pt,
      )[
        #metric-row([Betriebskosten (#runway-months M.)], euro(ops-reserve))
        #metric-row([Marketing (#runway-months M.)], euro(marketing-reserve))
        #metric-row([Puffer], euro(buffer))
      ]
    ]
  ],
  [
    // Gründungskosten Spanne mit Aufschlüsselung
    #box(
      width: 100%,
      fill: accent.lighten(93%),
      stroke: 2pt + accent,
      radius: 10pt,
      inset: 16pt,
    )[
      #align(center)[
        #text(size: 14pt, weight: "bold", fill: accent)[Gründungskosten]
        #text(size: 16pt, weight: "bold", fill: accent)[#euro(founding-costs-min) – #euro(founding-costs-max)]
      ]

      #v(10pt)
      #line(length: 100%, stroke: 1pt + accent.lighten(50%))
      #v(10pt)

      #text(size: 8pt, fill: muted, weight: "bold")[AUFSCHLÜSSELUNG]
      #v(6pt)

      #box(
        width: 100%,
        fill: white,
        stroke: 1pt + accent.lighten(70%),
        radius: 6pt,
        inset: 10pt,
      )[
        #grid(
          columns: (1fr, auto, auto),
          column-gutter: 8pt,
          row-gutter: 4pt,

          [], [#text(size: 7pt, fill: muted)[Min.]], [#text(size: 7pt, fill: muted)[Max.]],
          [#text(size: 8pt)[Notarkosten]], [#text(size: 8pt)[#euro(cost-notar-min)]], [#text(size: 8pt)[#euro(cost-notar-max)]],
          [#text(size: 8pt)[Handelsregister]], [#text(size: 8pt)[#euro(cost-handelsregister-min)]], [#text(size: 8pt)[#euro(cost-handelsregister-max)]],
          [#text(size: 8pt)[Gewerbeanmeldung]], [#text(size: 8pt)[#euro(cost-gewerbe-min)]], [#text(size: 8pt)[#euro(cost-gewerbe-max)]],
          [#text(size: 8pt)[Transparenzregister]], [#text(size: 8pt)[#euro(cost-transparenz)]], [#text(size: 8pt)[#euro(cost-transparenz)]],
        )
      ]
    ]
  ],
)

#pagebreak()

== Verwendung der Mittel

#grid(
  columns: (1fr, 1fr),
  column-gutter: 15pt,

  // Visual breakdown
  box(
    fill: gray.lighten(96%),
    inset: 20pt,
    radius: 10pt,
    width: 100%,
  )[
    #text(weight: "bold", fill: black)[Mittelverwendung]
    #v(15pt)

    #grid(
      columns: (auto, 1fr, auto),
      column-gutter: 10pt,
      row-gutter: 8pt,
      align: (center + horizon, left + horizon, right + horizon),

      box(fill: info, width: 12pt, height: 12pt, radius: 3pt), [Marketing], text(weight: "bold")[#pct(marketing-share)],

      box(fill: accent, width: 12pt, height: 12pt, radius: 3pt), [Gründungskosten], text(weight: "bold")[#pct(founding-share-min)-#pct(founding-share-max)],

      box(fill: rgb("#ae00ff"), width: 12pt, height: 12pt, radius: 3pt), [Betriebskosten], text(weight: "bold")[#pct(ops-share)],

      box(fill: success, width: 12pt, height: 12pt, radius: 3pt), [Puffer/Stammkapital], text(weight: "bold")[#pct(buffer-share)],
    )

    #v(15pt)

    // Visual bars
    #block(width: 100%, height: 10pt, radius: 5pt, clip: true)[
      #grid(
        columns: (36%, 8%, 5%, 51%),
        block(width: 100%, height: 10pt, fill: info),
        block(width: 100%, height: 10pt, fill: accent),
        block(width: 100%, height: 10pt, fill: rgb("#ae00ff")),
        block(width: 100%, height: 10pt, fill: success),
      )
    ]
  ],

  // Runway explanation
  box(
    fill: info.lighten(93%),
    inset: 20pt,
    radius: 10pt,
    width: 100%,
    stroke: 2pt + info,
  )[
    #text(weight: "bold", fill: info)[Hinweis zum Stammkapital]

    #v(10pt)

    Die #euro(stammkapital) Stammkapital sind nicht gebunden und und können für den Geschäfsbetrieb verwendet werden.

    #v(12pt)

    #text(size: 9pt, fill: muted, tracking: 0.3pt, weight: "bold")[GESAMTKAPITALBEDARF]
    #v(2pt)
    #text(size: 22pt, weight: "bold", fill: info)[#euro(total-capital-min) – #euro(total-capital-max)]
    #v(4pt)
    #text(size: 9pt, fill: muted)[
      (Stammkapital #euro(stammkapital) + Gründungskosten #euro(founding-costs-min)-#euro(founding-costs-max))
    ]
  ],
)


== Strategische Partnerschaft

#box(
  fill: warm-bg,
  inset: 18pt,
  radius: 8pt,
  width: 100%,
  stroke: (left: 4pt + accent),
)[
  Bambini plant eine *Partnerschaft mit ARAG SE*. Die ARAG möchte unsere Lösung in ihre Kundenreise integrieren. Diese Partnerschaft liefert Kunden mit sehr niedrigen *CAC* und validiert unser Geschäftsmodell.
]

#pagebreak()

// ============================================================================
// MARKT & PROBLEM
// ============================================================================

= Das Problem: Der Bürokratie-Dschungel

== Marktkontext

#highlight-box(color: danger)[
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 20pt,
    [
      #text(size: 28pt, weight: "bold", fill: danger)[#family-budget-billion Mrd. €]
      #v(-2pt)
      Jährliches Budget für Familienleistungen in Deutschland
    ],
    [
      #text(size: 28pt, weight: "bold", fill: danger)[bis zu #calc.round(non-takeup-rate * 100)%]
      #v(-2pt)
      Nichtinanspruchnahme durch Komplexität \
      #text(size: 8pt, fill: muted)[(Quelle: BMFSFJ 2021)]
    ],
  )
]

Deutschland hat eines der großzügigsten Systeme für Familienleistungen weltweit. Aber das System ist so komplex, dass Millionen von Familien ihre Ansprüche nicht vollständig nutzen.

== Die konkreten Hürden

#grid(
  columns: (1fr,),
  row-gutter: 10pt,
  ..for (num, desc) in (
    (
      "130+",
      "Verschiedene zuständige Stellen – Je nach Bundesland, Kommune und Leistungsart unterschiedliche Ansprechpartner",
    ),
    ("500+", "Seiten Anträge & Leitfäden – Unverständliche Behördensprache, keine einheitliche Struktur"),
    (
      "~8.000 €",
      "Möglicher Verlust pro Familie – Durch falsche Berechnung, verpasste Fristen, unbekannte Zusatzleistungen",
    ),
  ) {
    (
      grid(
        columns: (auto, 1fr),
        column-gutter: 12pt,
        align: (center + horizon, left + horizon),
        box(
          fill: gradient.linear(primary, primary-light),
          inset: (x: 10pt, y: 8pt),
          radius: 6pt,
        )[#text(fill: white, weight: "bold", size: 11pt)[#num]],
        text(size: 10pt)[*#desc*],
      ),
    )
  }
)

== Zitate aus der Praxis

#box(
  fill: light-bg,
  inset: 18pt,
  radius: 8pt,
  width: 100%,
  stroke: (left: 3pt + primary-light),
)[
  _"Das ab dem 01.01.2023 bundesweit zu verwendende Antragsformular ist *extrem kompliziert, wenig bürgerfreundlich und nicht barrierefrei*. Wir raten daher dringend davon ab, das Antragsformular [...] auszufüllen."_

  #v(4pt)
  #align(right)[#text(fill: muted, size: 9pt)[— *Hannover.de*, Offizielle Stadtwebsite]]
]

#v(0.4em)

#box(
  fill: light-bg,
  inset: 18pt,
  radius: 8pt,
  width: 100%,
  stroke: (left: 3pt + primary-light),
)[
  _"Für den Kinderzuschlag wird die Nichtinanspruchnahme aktuell auf *50 bis 70 Prozent* geschätzt."_

  #v(4pt)
  #align(right)[#text(fill: muted, size: 9pt)[— *BMFSFJ*, Eigene Schätzungen 2021]]
]


// ============================================================================
// DIE LÖSUNG
// ============================================================================

= Unsere Lösung: Die Bambini-Plattform

#align(center)[
  #box(
    fill: primary.lighten(93%),
    inset: (x: 30pt, y: 12pt),
    radius: 20pt,
  )[
    #text(size: 14pt, style: "italic", fill: primary)[
      "Schluss mit Anträgen. Mehr Zeit für dein Kind."
    ]
  ]
]

#v(0.8em)
Bambini ist der persönliche Assistent, der den Elterngeld-Antrag ausfüllt und dir so nicht nur eine Menge Zeit spart, sondern auch die maximale Leistung sicherstellt.

== Der Bambini-Prozess

#box(
  fill: primary.lighten(96%),
  inset: 20pt,
  radius: 10pt,
  width: 100%,
  stroke: 1pt + primary.lighten(80%),
)[
  #grid(
    columns: (auto, 1fr),
    column-gutter: 15pt,
    row-gutter: 20pt,

    step-number(1),
    [
      *Antrag starten* #badge("5 Min", color: success) \
      Beantworte 10 einfache Fragen zu deiner Familie, deinem Einkommen, deiner Elternzeit-Planung. Bambini zeigt dir sofort: So viel Elterngeld bekommst du!
    ],

    step-number(2),
    [
      *Alle Extras entdecken* #badge("3 Min", color: success) \
      Kindergeld? Partnerschaftsbonus? Elterngeld Plus? Geschwisterbonus? Bambini zeigt dir *alles*, auf das deine Familie Anspruch hat.
    ],

    step-number(3),
    [
      *Dokumente hochladen* #badge("2 Min", color: success) \
      Foto von Geburtsurkunde, Gehaltsnachweis, Elternzeitplanung hochladen. KI-gestützte Dokumentenerkennung extrahiert die Daten automatisch.
    ],

    step-number(4, color: success),
    [
      *Der Rest passiert automatisch* #badge("✓", color: success) \
      Der Antrag wird automatisch generiert und an die zuständige Behörde gesendet. Du musst dich um nichts mehr kümmern.
    ],
  )
]

#v(1em)

#align(center)[
  #box(
    fill: gradient.linear(success, success.darken(15%)),
    inset: (x: 25pt, y: 14pt),
    radius: 10pt,
  )[
    #text(fill: white, weight: "bold", size: 11.5pt)[
      Ergebnis: Vollständiger Antrag ohne Fehler ‒ Alles vom Sofa aus, innerhalb weniger Minuten.
    ]
  ]
]

#pagebreak()
== KI-Assistent: BambiniAI

Bambini integriert einen KI-gestützten Assistenten, der Fragen zu Elterngeld, Kindergeld und Familienleistungen beantwortet – 24/7 in einfacher Sprache.

#grid(
  columns: (1fr, 1fr),
  column-gutter: 15pt,
  box(fill: success.lighten(93%), inset: 14pt, radius: 8pt, width: 100%)[
    #text(weight: "bold", fill: success)[Was BambiniAI kann]
    #v(6pt)
    - Versteckte Boni finden (€100–€500 extra)
    - Alle Fristen überwachen
    - Fragen 24/7 kostenlos beantworten
    - Personalisierte Tipps für jede Familie
  ],
  box(fill: info.lighten(93%), inset: 14pt, radius: 8pt, width: 100%)[
    #text(weight: "bold", fill: info)[Technische Umsetzung]
    #v(6pt)
    - System Prompt Stuffing (kein Fine-Tuning)
    - FAQ-Content + BEEG-Auszüge via RAG
    - Ansprechendes Rendering im Client
  ],
)

== Differenzierung zum Wettbewerb

#table(
  columns: (2fr, 1fr, 1fr, 1fr, 1fr),
  fill: (x, y) => if y == 0 { primary.lighten(88%) } else if calc.odd(y) { light-bg } else { white },
  stroke: 0.5pt + surface,
  inset: 10pt,

  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Kriterium]],
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Bambini]],
  table.cell(fill: primary.lighten(88%))[*"Formie"*],
  table.cell(fill: primary.lighten(88%))[*"Elterngeldbuddy"*],
  table.cell(fill: primary.lighten(88%))[*Staat*],

  [Unterstützte Leistungen],
  [*5+* (Elterngeld, Elternzeit, Kindergeld, etc.)],
  [1 (Elterngeld)],
  [1 (Elterngeld)],
  [Viele, komplex],

  [Vollständig Digital], [*Ja* (direkter Versand)], [Nein (selbst drucken)], [Nein (selbst drucken)], [Teilweise],

  [Kosten], [*#euro(product-price)* (für alle)], [39,99–89,99 €], [39,99 €], [Kostenlos],

  [Optimale Kombination],
  [#text(fill: success, weight: "bold")[✓]],
  [#text(fill: danger)[✗]],
  [#text(fill: danger)[✗]],
  [#text(fill: danger)[✗]],

  [Datenspeicherung],
  [#text(fill: success, weight: "bold")[✓]],
  [#text(fill: danger)[✗]],
  [#text(fill: danger)[✗]],
  [#text(fill: danger)[✗]],
)

#pagebreak()

// ============================================================================
// MARKT
// ============================================================================

= Marktgröße & Zielgruppen

== Total Addressable Market (TAM)

#grid(
  columns: (1fr, 1fr),
  column-gutter: 15pt,
  box(
    fill: light-bg,
    inset: 20pt,
    radius: 10pt,
    width: 100%,
    stroke: (bottom: 4pt + primary),
  )[
    #align(center)[
      #text(size: 9pt, fill: muted, tracking: 0.5pt, weight: "medium")[GEBURTEN PRO JAHR]
      #v(4pt)
      #text(size: 40pt, weight: "bold", fill: dark)[#num(births-per-year)]
      #v(4pt)
      #text(size: 9pt, fill: muted)[in Deutschland]
    ]
  ],
  box(
    fill: primary.lighten(93%),
    inset: 20pt,
    radius: 10pt,
    width: 100%,
    stroke: (bottom: 4pt + primary),
  )[
    #align(center)[
      #text(size: 9pt, fill: muted, tracking: 0.5pt, weight: "medium")[SERVICEABLE MARKET]
      #v(4pt)
      #text(size: 40pt, weight: "bold", fill: primary)[~#num(serviceable-market)]
      #v(4pt)
      #text(size: 9pt, fill: muted)[Familien pro Jahr]
    ]
  ],
)

== Zielgruppensegmentierung

#grid(
  columns: (1fr, 1fr),
  column-gutter: 15pt,

  // Segment 1
  box(
    fill: white,
    inset: 18pt,
    radius: 10pt,
    width: 100%,
    stroke: 1pt + info.lighten(60%),
  )[
    #box(fill: info, inset: (x: 10pt, y: 4pt), radius: 4pt)[
      #text(fill: white, weight: "bold", size: 9pt)[SEGMENT A]
    ]
    #v(8pt)
    #text(weight: "bold", size: 12pt, fill: info)[Akademikerfamilien]
    #v(4pt)
    #text(size: 28pt, weight: "bold")[~#num(segment-a-size)] #text(size: 9pt, fill: muted)[Familien/Jahr]

    #v(5pt)
    #text(size: 9pt, fill: muted)[#calc.round(segment-a-ratio * 100)% der Familien]
    #v(8pt)

    - Zeit ist wertvoller als Geld
    - Anspruchsvolle Karrieren
    - Digital-affin
    - Suchen Leistungsoptimierung
  ],

  // Segment 2
  box(
    fill: white,
    inset: 18pt,
    radius: 10pt,
    width: 100%,
    stroke: 1pt + primary.lighten(60%),
  )[
    #box(fill: primary, inset: (x: 10pt, y: 4pt), radius: 4pt)[
      #text(fill: white, weight: "bold", size: 9pt)[SEGMENT B]
    ]
    #v(8pt)
    #text(weight: "bold", size: 12pt, fill: primary)[Menschen mit Sprachbarrieren]
    #v(4pt)
    #text(size: 28pt, weight: "bold")[~#num(segment-b-size)] #text(size: 9pt, fill: muted)[Familien/Jahr]

    #v(5pt)
    #text(size: 9pt, fill: muted)[#calc.round(segment-b-ratio * 100)% der Familien (Geburtenrate: 1,84 vs. 1,23)]
    #v(8pt)

    - Schwer verständliche Bürokratie
    - Keine Kenntnis der Ansprüche
    - Verpasste Fristen häufig
    - Tausende Euro Verlust möglich
  ],
)


// ============================================================================
// GESCHÄFTSMODELL
// ============================================================================

#pagebreak()

= Geschäftsmodell & Unit Economics

== Preismodell

#box(
  stroke: 2pt + gradient.linear(primary, accent),
  inset: 0pt,
  radius: 12pt,
  width: 100%,
  clip: true,
)[
  // Header bar
  #block(
    width: 100%,
    fill: gradient.linear(primary, primary-dark),
    inset: (x: 20pt, y: 10pt),
  )[
    #align(center)[
      #text(fill: white.darken(10%), size: 9pt, tracking: 1pt, weight: "medium")[BAMBINI FAMILIENPAKET]
    ]
  ]

  #align(center)[
    #v(18pt)
    #text(size: 48pt, weight: "bold", fill: primary)[#euro(product-price)]
    #v(2pt)
    #text(size: 12pt, fill: muted)[Einmalzahlung · Kein Abo · Alles inklusive]
    #v(15pt)
  ]

  #block(inset: (x: 25pt, bottom: 20pt))[
    #grid(
      columns: (1fr, 1fr),
      column-gutter: 20pt,
      [
        #text(fill: success, weight: "bold")[✓] Kompletter Elterngeld-Antrag \
        #text(fill: success, weight: "bold")[✓] Kindergeld-Antrag \
        #text(fill: success, weight: "bold")[✓] Elternzeit-Planung
      ],
      [
        #text(fill: success, weight: "bold")[✓] Expert-Überprüfung \
        #text(fill: success, weight: "bold")[✓] 90 Tage Support \
        #text(fill: success, weight: "bold")[✓] Fertige Antragsdatei
      ],
    )
  ]
]

#v(0.8em)

#align(center)[
  #text(size: 10.5pt, style: "italic", fill: muted)[
    "Familien bekommen im Durchschnitt €1.500+/Monat an staatlichen Leistungen (Elterngeld + Kindergeld). Bambini kostet einmalig #euro(product-price) #sym.arrow #text(fill: success, weight: "bold")[#pct(product-price / 1500 * 100) für jahrelange Ersparnisse]."

  ]
]

== Kostenstruktur

#grid(
  columns: (1fr, 1fr),
  column-gutter: 15pt,

  // Monthly costs
  box(
    fill: white,
    inset: 18pt,
    radius: 8pt,
    width: 100%,
    stroke: 1pt + surface,
  )[
    #text(weight: "bold", fill: dark)[Monatliche Betriebskosten]
    #v(10pt)
    #table(
      columns: (1fr, auto),
      stroke: none,
      inset: 5pt,
      [Hosting (Vercel)], [#euro(cost-hosting)],
      [Supabase], [#euro(cost-supabase) (Free Tier)],
      [Entwicklung (Tools, APIs)], [#euro(cost-dev-tools)],
      [QES (Signatur)], [#euro(cost-qes-monthly)],
      table.hline(stroke: 0.5pt + surface),
      [*Gesamt monatlich*], [*#euro(monthly-fixed-costs)*],
    )
  ],

  // Annual costs
  box(
    fill: white,
    inset: 18pt,
    radius: 8pt,
    width: 100%,
    stroke: 1pt + surface,
  )[
    #text(weight: "bold", fill: dark)[Jährliche Kosten]
    #v(10pt)
    #table(
      columns: (1fr, auto),
      stroke: none,
      inset: 5pt,
      [E-Mail-Hosting], [#euro(cost-email-annual)],
      [QES-Zertifikat (80€/3J)], [~#euro(cost-qes-annual)],
      [Monatliche Betriebskosten x12], [#euro(monthly-fixed-costs * 12)],
      table.hline(stroke: 0.5pt + surface),
      [*Gesamt jährlich*], [*#euro(annual-fixed-costs)*],
    )
  ],
)

== Break-Even-Analyse


// ═══════════════════════════════════════════════════════════════════════════
// KUMULATIVER BREAK-EVEN (mit lilaq)
// ═══════════════════════════════════════════════════════════════════════════

#import "@preview/lilaq:0.4.0" as lq

Der kumulative Break-Even-Point – ab dem alle Anfangsinvestitionen amortisiert sind – wird mit ca. *47 zahlenden Kunden* erreicht. Dies berücksichtigt initiale Investitionen und Marketingkosten (CAC). Die monatliche Break-Even-Rechnung liegt dagegen bereits bei *3 Kunden pro Monat*, da hier nur die laufenden Fixkosten (109 € monatlich) gedeckt werden müssen.

#v(0.5em)

#box(
  fill: white,
  inset: 18pt,
  radius: 10pt,
  width: 100%,
  stroke: 1pt + surface,
)[
  // Title
  #text(weight: "bold", size: 11pt)[Kumulatives Ergebnis über 12 Monate]

  #v(12pt)

  // Prepare data arrays for lilaq (months 0-12)
  #let months = (0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12)
  #let revenue-values = cumulative-revenue
  #let costs-values = cumulative-costs
  #let profit-values = cumulative-profit

  // Create the chart using lilaq
  #lq.diagram(
    width: 14cm,
    height: 6cm,
    xlabel: [Monat],
    ylabel: [Euro (€)],
    ylim: (0, 30000),
    ygrid: false,
    xgrid: false,
    
    // Revenue line (green)
    lq.plot(
      months, 
      revenue-values, 
      stroke: 2pt + success,
      mark: none,
      label: [Umsatz],
    ),
    
    // Costs line (red)
    lq.plot(
      months, 
      costs-values, 
      stroke: 2pt + danger,
      mark: none,
      label: [Kosten],
    ),
    
    // Profit line (purple)
    lq.plot(
      months, 
      profit-values, 
      stroke: 2.5pt + primary,
      mark: none,
      label: [Ergebnis],
    ),
    

  )

  #v(4pt)
  #align(center)[
    #text(size: 8pt, fill: success, weight: "bold")[
      ● Break-Even erreicht in Monat 3 (Ergebnislinie kreuzt Null)
    ]
  ]

  #v(8pt)

  // End value labels
  #grid(
    columns: (1fr, 1fr, 1fr),
    column-gutter: 12pt,
    align: center,
    [
      #text(size: 8pt, fill: success)[Umsatz Ende Jahr 1]
      #v(2pt)
      #text(size: 11pt, fill: success, weight: "bold")[#euro-compact(revenue-year1)]
    ],
    [
      #text(size: 8pt, fill: primary)[Gewinn Ende Jahr 1]
      #v(2pt)
      #text(size: 11pt, fill: primary, weight: "bold")[+#euro-compact(profit-year1)]
    ],
    [
      #text(size: 8pt, fill: danger)[Kosten Ende Jahr 1]
      #v(2pt)
      #text(size: 11pt, fill: danger, weight: "bold")[#euro-compact(total-costs-year1)]
    ],
  )
]

#v(0.8em)

// Compact KPI row
#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  column-gutter: 8pt,

  box(fill: light-bg, inset: 10pt, radius: 6pt, width: 100%)[
    #align(center)[
      #text(size: 8pt, fill: muted)[INITIALE KOSTEN]
      #v(2pt)
      #text(size: 14pt, weight: "bold")[#euro(founding-costs-max)]
    ]
  ],

  box(fill: success.lighten(92%), inset: 10pt, radius: 6pt, width: 100%, stroke: 1pt + success.lighten(50%))[
    #align(center)[
      #text(size: 8pt, fill: muted)[BREAK-EVEN]
      #v(2pt)
      #text(size: 14pt, weight: "bold", fill: success)[Monat 3]
    ]
  ],

  box(fill: light-bg, inset: 10pt, radius: 6pt, width: 100%)[
    #align(center)[
      #text(size: 8pt, fill: muted)[GEWINN JAHR 1]
      #v(2pt)
      #text(size: 14pt, weight: "bold", fill: success)[+#euro-compact(profit-year1)]
    ]
  ],

  box(fill: light-bg, inset: 10pt, radius: 6pt, width: 100%)[
    #align(center)[
      #text(size: 8pt, fill: muted)[CAC Mnt. 1-3]
      #v(2pt)
      #text(size: 14pt, weight: "bold")[#euro(cac-q1)]
    ]
  ],
)

#v(0.8em)

#highlight-box(title: [monatlicher Break-Even: ab 3 zahlenden Kunden], color: success)[
  #grid(
    columns: (1fr, 1fr, 1fr),
    column-gutter: 15pt,
    align: center,
    [
      #text(size: 9pt, fill: muted, tracking: 0.3pt)[MONATL. FIXKOSTEN]
      #v(2pt)
      #text(size: 18pt, weight: "bold")[#euro(monthly-fixed-costs)]
    ],
    [
      #text(size: 9pt, fill: muted, tracking: 0.3pt)[NETTO PRO KUNDE]
      #v(2pt)
      #text(size: 18pt, weight: "bold")[#euro(product-price - blended-cac)]
      #v(2pt)
      #text(size: 7pt, fill: muted)[#euro(product-price) − #euro(blended-cac) CAC]
    ],
    [
      #text(size: 9pt, fill: muted, tracking: 0.3pt)[BREAK-EVEN]
      #v(2pt)
      #text(size: 18pt, weight: "bold", fill: success)[#break-even-monthly Kunden]
    ],
  )

  #v(8pt)
  #text(size: 8pt, fill: muted)[
    Netto pro Kunde: #euro(product-price) − #euro(blended-cac) = #euro(product-price - blended-cac) | 
    Break-Even: #euro(monthly-fixed-costs) ÷ #euro(product-price - blended-cac) ≈ #break-even-monthly Kunden
  ]

  #v(10pt)

]


// Hinweis Personalkosten
#box(
  fill: accent.lighten(92%),
  inset: 12pt,
  radius: 6pt,
  width: 100%,
  stroke: (left: 3pt + accent),
)[
  #text(weight: "bold", fill: accent.darken(20%), size: 9pt)[Hinweis Personalkosten:]
  #h(8pt)
  #text(size: 8pt)[
    Diese Projektion geht von unbezahlter Gründerarbeit in der Startphase aus. Weitere Personalkosten sind insofern nicht geplant.
  ]
]


#pagebreak()

// ============================================================================
// CUSTOMER ACQUISITION
// ============================================================================

= Customer Acquisition Strategy

== Ziel-CAC

#box(fill: light-bg, inset: 16pt, radius: 8pt, width: 100%)[
  #metric-row([Produktpreis], [*#euro(product-price)*])
  #metric-row([Ziel-CAC (Maximum)], [*< 30 €*])
  #metric-row([Optimaler CAC], [*15–20 €*])
  #metric-row([CAC:LTV-Verhältnis (Ziel)], [*1:2 bis 1:3*])
]

== CAC nach Kanal

#table(
  columns: (2fr, auto, auto, 1fr),
  fill: (x, y) => if y == 0 { primary } else if calc.odd(y) { light-bg } else { white },
  stroke: 0.5pt + surface,
  inset: 10pt,

  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Kanal]],
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[CAC]],
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Zeitrahmen]],
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Empfehlung]],

  [ARAG-Partnerschaft],
  [*#euro(cac-arag)*],
  [Sofort (März 2026)],
  [#text(fill: success, weight: "bold")[✓ Strategisch am wertvollsten]],

  [TikTok Ads], [15–25 €], [Sofort], [#text(fill: success, weight: "bold")[✓ Niedrigster Paid CAC]],

  [Meta/Instagram Ads], [20–35 €], [Sofort], [#text(fill: success)[✓ Ergänzungskanal]],

  [SEO/Content], [~#euro(cac-seo)], [6–12 Monate], [#text(fill: success)[✓ Langfristig aufbauen]],

  [Referral-Programm], [10–20 €], [Nach 50–100 Kunden], [#text(fill: success)[✓ Nach erster Kundenbasis]],

  [Google Ads], [100–150 €], [Später], [#text(fill: danger)[✗ Zu teuer für MVP]],
)

#pagebreak()

== TikTok vs. Meta: Warum TikTok der Primärkanal ist

#grid(
  columns: (1fr, 1fr),
  column-gutter: 12pt,
  box(fill: rgb("#000000"), inset: 18pt, radius: 10pt, width: 100%)[
    #align(center)[#text(fill: white, weight: "bold", size: 16pt, tracking: 0.5pt)[TikTok]]
    #v(12pt)
    #text(fill: white)[
      CPM: *3–12 €* \
      Erwarteter CAC: *15–25 €* \
      Organic Reach: *Hoch* \
      Creator-Kosten: *100–500 €* \
      Zielgruppe 25–44: *42% der Nutzer*
    ]
  ],
  box(fill: rgb("#1877F2"), inset: 18pt, radius: 10pt, width: 100%)[
    #align(center)[#text(fill: white, weight: "bold", size: 16pt, tracking: 0.5pt)[Meta / IG]]
    #v(12pt)
    #text(fill: white)[
      CPM: *8–14 €* \
      Erwarteter CAC: *25–35 €* \
      Organic Reach: *Gering* \
      Creator-Kosten: *200–1.000 €* \
      Zielgruppe: *Übersättigt*
    ]
  ],
)

#v(0.8em)

*Entscheidende TikTok-Vorteile:*
- Educational Content hat *9,5% Engagement* (vs. 2,5% Durchschnitt)
- Kleine Accounts (unter 100k) haben *7,5% Engagement*
- Algorithmus bevorzugt Nischen-Content
- 39% der Nutzer suchen aktiv nach Produkten (wie Google)

== Blended CAC mit Kanal-Mix

#highlight-box(color: success)[
  #text(weight: "bold", size: 12pt)[Realistischer Kanal-Mix ergibt Blended CAC von ~#euro(calc.round(blended-cac))]

  #v(10pt)

  #table(
    columns: (1fr, auto, auto, auto),
    stroke: none,
    inset: 8pt,
    fill: (x, y) => if y == 0 { success.lighten(80%) } else { none },
    [*Kanal*], [*Anteil*], [*CAC*], [*Gewichtet*],
    [ARAG-Partnerschaft], [#pct(share-arag * 100)], [#euro(cac-arag)], [#euro(cac-arag * share-arag)],
    [TikTok Ads], [#pct(share-tiktok * 100)], [#euro(cac-tiktok)], [#euro(cac-tiktok * share-tiktok)],
    [Meta Ads], [#pct(share-meta * 100)], [#euro(cac-meta)], [#euro(cac-meta * share-meta)],
    [SEO/Organic], [#pct(share-seo * 100)], [#euro(cac-seo)], [#euro(cac-seo * share-seo)],
    [Referrals], [#pct(share-referral * 100)], [#euro(cac-referral)], [#euro(cac-referral * share-referral)],
    table.hline(stroke: 1.5pt + success),
    [*Blended CAC*], [*100%*], [], [*~#euro(calc.round(blended-cac))*],
  )
]

#pagebreak()

// ============================================================================
// FINANZPROGNOSE
// ============================================================================

= Finanzprognose

== 12-Monats-Projektion (Realistisches Szenario)

#table(
  columns: (auto, auto, auto, auto, auto, auto),
  fill: (x, y) => if y == 0 { primary } else if y == 5 { success.lighten(85%) } else if calc.odd(y) { light-bg } else {
    white
  },
  stroke: 0.5pt + surface,
  inset: 10pt,
  align: (left, center, center, right, right, right),

  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Zeitraum]],
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Kunden]],
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Ø CAC]],
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Marketing]],
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Umsatz]],
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Ergebnis]],

  [Monate 1–3], [#customers-q1], [#euro(cac-q1)], [#euro(marketing-q1)], [#euro(revenue-q1)], [+#euro(result-q1)],
  [Monate 4–6], [#customers-q2], [#euro(cac-q2)], [#euro(marketing-q2)], [#euro(revenue-q2)], [+#euro(result-q2)],
  [Monate 7–9], [#customers-q3], [#euro(cac-q3)], [#euro(marketing-q3)], [#euro(revenue-q3)], [+#euro(result-q3)],
  [Monate 10–12], [#customers-q4], [#euro(cac-q4)], [#euro(marketing-q4)], [#euro(revenue-q4)], [+#euro(result-q4)],
  [*Jahr 1 Gesamt*], [*#customers-year1*], [*#euro(calc.round(weighted-cac-year1))*], [*#euro(marketing-year1)*], [*#euro(revenue-year1)*], [*+#euro(profit-year1)*],
)

== Szenario-Vergleich

#grid(
  columns: (1fr, 1fr, 1fr),
  column-gutter: 10pt,

  // Conservative
  box(
    fill: white,
    inset: 18pt,
    radius: 10pt,
    width: 100%,
    stroke: 1pt + danger.lighten(50%),
  )[
    #align(center)[
      #badge("KONSERVATIV", color: danger)
      #v(3pt)
      #text(size: 8pt, fill: muted)[(Nur Paid Ads)]
      #v(12pt)
      #text(size: 9pt, fill: muted)[Kunden Y1] \
      #text(size: 20pt, weight: "bold")[#num(customers-conservative)]
      #v(4pt)
      #text(size: 9pt, fill: muted)[Umsatz:] *#euro-compact(revenue-conservative)* \
      #text(size: 9pt, fill: muted)[Gewinn:] *+#euro-compact(profit-conservative)*
    ]
  ],

  // Realistic
  box(
    fill: success.lighten(95%),
    inset: 18pt,
    radius: 10pt,
    width: 100%,
    stroke: 2pt + success,
  )[
    #align(center)[
      #badge("REALISTISCH", color: success)
      #v(3pt)
      #text(size: 8pt, fill: muted)[(Mit ARAG + Referrals)]
      #v(12pt)
      #text(size: 9pt, fill: muted)[Kunden Y1] \
      #text(size: 20pt, weight: "bold", fill: success)[#num(customers-year1)]
      #v(4pt)
      #text(size: 9pt, fill: muted)[Umsatz:] *#euro-compact(revenue-year1)* \
      #text(size: 9pt, fill: muted)[Gewinn:] *+#euro-compact(profit-year1)*
    ]
  ],

  // Optimistic
  box(
    fill: white,
    inset: 18pt,
    radius: 10pt,
    width: 100%,
    stroke: 1pt + info.lighten(50%),
  )[
    #align(center)[
      #badge("OPTIMISTISCH", color: info)
      #v(3pt)
      #text(size: 8pt, fill: muted)[(Starke Virality)]
      #v(12pt)
      #text(size: 9pt, fill: muted)[Kunden Y1] \
      #text(size: 20pt, weight: "bold")[#num(customers-optimistic)]
      #v(4pt)
      #text(size: 9pt, fill: muted)[Umsatz:] *#euro-compact(revenue-optimistic)* \
      #text(size: 9pt, fill: muted)[Gewinn:] *+#euro-compact(profit-optimistic)*
    ]
  ],
)

== 3-Jahres-Ausblick

#table(
  columns: (auto, auto, auto, auto, auto),
  fill: (x, y) => if y == 0 { primary } else if calc.odd(y) { light-bg } else { white },
  stroke: 0.5pt + surface,
  inset: 9pt,
  align: (left, center, right, right, right),

  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Jahr]],
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Marktanteil]],
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Kunden]],
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Umsatz]],
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Kum. Gewinn]],

  [Jahr 1], [#pct(market-share-year1)], [#num(customers-year1)], [#euro-compact(revenue-year1)], [#euro-compact(profit-year1)],
  [Jahr 2], [#pct(market-share-year2)], [#num(customers-year2)], [#euro-compact(revenue-year2)], [~180.000 €],
  [Jahr 3], [#pct(market-share-year3)], [#num(customers-year3)], [#euro-compact(revenue-year3)], [~400.000 €],
)
#v(-0.8em)
#text(size: 8pt, fill: muted)[
  Annahmen: Konstanter Preis #euro(product-price), sinkender CAC durch Brand Awareness und Referrals, Serviceable Market #num(serviceable-market) Familien/Jahr
]

#pagebreak()

// ============================================================================
// ROADMAP
// ============================================================================

= Roadmap & Meilensteine

== Timeline

// Phase 1
#box(
  fill: white,
  inset: 20pt,
  radius: 10pt,
  width: 100%,
  stroke: (left: 5pt + gradient.linear(primary, primary-light, dir: ttb), rest: 1pt + surface),
)[
  #grid(
    columns: (auto, 1fr),
    column-gutter: 15pt,
    align: (horizon, top),
    badge("KW 6–9", color: primary),
    [
      #text(weight: "bold", size: 13pt, fill: primary-dark)[Phase 1: Test- & Validierungsphase]
      #h(8pt)
      #text(fill: muted, size: 9pt)[Februar 2026]
    ],
  )

  #v(12pt)

  #table(
    columns: (auto, 1fr),
    fill: (x, y) => if y == 0 { primary.lighten(90%) } else if calc.odd(y) { white } else { light-bg },
    stroke: 0.5pt + surface,
    inset: 10pt,
    [*KW*], [*Meilenstein*],
    [6], [FAQ-Portal mit KI-Chatbot live],
    [7-8], [Erste Testkunden & Interaktion mit Behörden],
    [9], [ARAG-Integration möglich],
  )

  #v(8pt)

  #box(fill: primary.lighten(93%), inset: 10pt, radius: 6pt, width: 100%)[
    *Ergebnis:* Technische Integration bereit, erste Anträge bei Behörden eingereicht und Rückmeldungen hinsichtlich der Nutzererfahrung ausgewertet.
  ]
]

#v(8pt)

// Phase 2
#box(
  fill: white,
  inset: 20pt,
  radius: 10pt,
  width: 100%,
  stroke: (left: 5pt + gradient.linear(info, info.lighten(30%), dir: ttb), rest: 1pt + surface),
)[
  #grid(
    columns: (auto, 1fr),
    column-gutter: 15pt,
    align: (horizon, top),
    badge("KW 10–14", color: info),
    [
      #text(weight: "bold", size: 13pt, fill: info.darken(20%))[Phase 2: Marktstart]
      #h(8pt)
      #text(fill: muted, size: 9pt)[März – April 2026]
    ],
  )

  #v(12pt)

  #table(
    columns: (auto, 1fr),
    fill: (x, y) => if y == 0 { info.lighten(90%) } else if calc.odd(y) { white } else { light-bg },
    stroke: 0.5pt + surface,
    inset: 10pt,
    [*KW*], [*Meilenstein*],
    [10–11], [Produktoptimierung basierend auf Behördenfeedback],
    [12–13], [UX-Verbesserungen, Kundenfeedback-Integration, vollständige Mehrsprachigkeit],
    [14], [Vollständiger Marktstart],
  )

  #v(8pt)

  #box(fill: info.lighten(93%), inset: 10pt, radius: 6pt, width: 100%)[
    *Ergebnis:* Verifizierter, optimierter Elterngeld-Flow für alle Kunden.
  ]
]

#v(8pt)

// Phase 3
#box(
  fill: white,
  inset: 20pt,
  radius: 10pt,
  width: 100%,
  stroke: (left: 5pt + gradient.linear(success, success.lighten(30%), dir: ttb), rest: 1pt + surface),
)[
  #grid(
    columns: (auto, 1fr),
    column-gutter: 15pt,
    align: (horizon, top),
    badge("KW 15+", color: success),
    [
      #text(weight: "bold", size: 13pt, fill: success.darken(20%))[Phase 3: Skalierung]
      #h(8pt)
      #text(fill: muted, size: 9pt)[Ab Mai 2026]
    ],
  )

  #v(12pt)

  #table(
    columns: (auto, 1fr),
    fill: (x, y) => if y == 0 { success.lighten(90%) } else if calc.odd(y) { white } else { light-bg },
    stroke: 0.5pt + surface,
    inset: 10pt,
    [*KW*], [*Meilenstein*],
    [15–18], [Erweiterung auf zusätzliche Leistungsarten (Mutterschaftsgeld, KiZ)],
    [19–22], [Weitere Partnerschaften (Krankenkassen, Hebammen-Netzwerke)],
    [23+], [Premium-Features],
  )

  #v(8pt)

  #box(fill: success.lighten(93%), inset: 10pt, radius: 6pt, width: 100%)[
    *Ergebnis:* Vollständige Familienleistungs-Plattform mit skalierbarem Wachstum.
  ]
]

#v(-0.3em)

== Meilenstein-Übersicht

#table(
  columns: (1fr, auto),
  fill: (x, y) => if y == 0 { primary } else if calc.odd(y) { light-bg } else { white },
  stroke: 0.5pt + surface,
  inset: 12pt,

  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Meilenstein]],
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Datum]],
  [ARAG-Integration möglich], [*Ende Februar 2026*],
  [Vollständiger Marktstart], [*Ende März / Anfang April 2026*],
  [Erweiterte Leistungen live], [*Mai 2026*],
  [Partnerschaften & Skalierung], [*Ab Juni 2026*],
)

#pagebreak()

// ============================================================================
// SKALIERBARKEIT
// ============================================================================

= Skalierbarkeit: Horizontal & Vertikal

Unser Wachstumspfad führt von den Kernfunktionen zur umfassenden Plattform – entlang zweier Achsen: *Horizontal* (neue Anspruchsarten) und *Vertikal* (Wertschöpfungstiefe).

== Horizontale Skalierung – Neue Anspruchsarten

Die horizontale Expansion erweitert die Plattform schrittweise um zusätzliche Familienleistungen. Jede neue Leistungsart nutzt die bestehende Infrastruktur (Dokumentenerkennung, Nutzerprofil, Versandlogik) und erzeugt so marginale Grenzkosten.

#box(
  fill: white,
  inset: 20pt,
  radius: 10pt,
  width: 100%,
  stroke: 1pt + info.lighten(60%),
)[
  #table(
    columns: (auto, 1fr, auto),
    fill: (x, y) => if y == 0 { info } else if calc.odd(y) { light-bg } else { white },
    stroke: 0.5pt + surface,
    inset: 12pt,
    align: (center, left, center),

    table.cell(fill: info)[#text(fill: white, weight: "bold")[Stufe]],
    table.cell(fill: info)[#text(fill: white, weight: "bold")[Leistungen]],
    table.cell(fill: info)[#text(fill: white, weight: "bold")[Status]],

    [1 – Kern],
    [Elterngeld, Kindergeld, Elternzeit],
    [#badge("LIVE", color: success)],

    [2],
    [Kinderzuschlag, Mutterschaftsgeld],
    [#badge("Q2 2026", color: info)],

    [3],
    [BAföG, Kita-Anspruch],
    [#badge("Q3 2026", color: primary)],

    [4],
    [Pflege, Unterhaltsvorschuss],
    [#badge("2027", color: primary-light)],

    [5],
    [EU-Expansion (grenzüberschreitende Ansprüche)],
    [#badge("VISION", color: muted)],
  )
]

#v(0.5em)

*Strategischer Vorteil:* Jede neue Leistungsart erhöht den Wert für bestehende Nutzer (Cross-Selling-Potenzial) und erschließt neue Zielgruppen – z.B. Pflegebedürftige Angehörige oder Studierende.

#pagebreak()
== Vertikale Skalierung – Wertschöpfungstiefe

Die vertikale Expansion vertieft den Service pro Leistungsart – vom reinen Antrag bis zur vollständigen Verwaltungsautomatisierung.

#box(
  fill: white,
  inset: 20pt,
  radius: 10pt,
  width: 100%,
  stroke: 1pt + primary.lighten(60%),
)[
  #table(
    columns: (auto, 1fr, 1fr),
    fill: (x, y) => if y == 0 { primary } else if calc.odd(y) { light-bg } else { white },
    stroke: 0.5pt + surface,
    inset: 12pt,
    align: (center, left, left),

    table.cell(fill: primary)[#text(fill: white, weight: "bold")[Stufe]],
    table.cell(fill: primary)[#text(fill: white, weight: "bold")[Serviceleistung]],
    table.cell(fill: primary)[#text(fill: white, weight: "bold")[Mehrwert]],

    [1 – Kern],
    [Antragsstellung],
    [Fehlerfreier Antrag, direkter digitaler Versand],

    [2],
    [Mehrsprachigkeit],
    [Zugang für #num(segment-b-size)+ Familien mit Sprachbarrieren],

    [3],
    [Widerspruch & Klage],
    [Automatisierte Widerspruchsschreiben bei Ablehnung],

    [4],
    [Optimierungsberatung],
    [KI-gestützte Empfehlungen zur Leistungsmaximierung],

    [5],
    [API-Anbindung Verwaltung],
    [Direkte Schnittstelle zu Behördensystemen],
  )
]

#v(0.5em)

*Strategischer Vorteil:* Die vertikale Tiefe erhöht die Kundenbindung und ermöglicht Premium-Pricing für Zusatzleistungen (z.B. Widerspruchsbegleitung als kostenpflichtiges Add-on).
#pagebreak()
== Skalierungsmodell im Überblick

#highlight-box(color: primary)[
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 25pt,

    [
      #text(weight: "bold", fill: info, size: 12pt, tracking: 0.3pt)[HORIZONTAL]
      #v(3pt)
      #text(size: 10pt, fill: muted)[Neue Anspruchsarten]

      #v(8pt)

      #box(fill: gradient.linear(primary, info), inset: 8pt, radius: 4pt, width: 100%)[
        #text(fill: white, size: 9pt)[Elterngeld, Kindergeld, Elternzeit]
      ]
      #v(3pt)
      #box(fill: info.lighten(20%), inset: 8pt, radius: 4pt, width: 100%)[
        #text(fill: white, size: 9pt)[Kinderzuschlag, Mutterschaftsgeld]
      ]
      #v(3pt)
      #box(fill: info.lighten(40%), inset: 8pt, radius: 4pt, width: 100%)[
        #text(size: 9pt)[BAföG, Kita-Anspruch]
      ]
      #v(3pt)
      #box(fill: info.lighten(60%), inset: 8pt, radius: 4pt, width: 100%)[
        #text(size: 9pt)[Pflege, Unterhaltsvorschuss]
      ]
      #v(3pt)
      #box(fill: info.lighten(75%), inset: 8pt, radius: 4pt, width: 100%)[
        #text(size: 9pt)[EU-Expansion]
      ]
    ],

    [
      #text(weight: "bold", fill: primary, size: 12pt, tracking: 0.3pt)[VERTIKAL]
      #v(3pt)
      #text(size: 10pt, fill: muted)[Wertschöpfungstiefe]

      #v(8pt)

      #box(fill: gradient.linear(primary, primary-light), inset: 8pt, radius: 4pt, width: 100%)[
        #text(fill: white, size: 9pt)[Antragsstellung]
      ]
      #v(3pt)
      #box(fill: primary.lighten(20%), inset: 8pt, radius: 4pt, width: 100%)[
        #text(fill: white, size: 9pt)[Mehrsprachigkeit]
      ]
      #v(3pt)
      #box(fill: primary.lighten(40%), inset: 8pt, radius: 4pt, width: 100%)[
        #text(size: 9pt)[Widerspruch & Klage]
      ]
      #v(3pt)
      #box(fill: primary.lighten(60%), inset: 8pt, radius: 4pt, width: 100%)[
        #text(size: 9pt)[Optimierungsberatung]
      ]
      #v(3pt)
      #box(fill: primary.lighten(75%), inset: 8pt, radius: 4pt, width: 100%)[
        #text(size: 9pt)[API-Anbindung Verwaltung]
      ]
    ],
  )

  #v(12pt)

  #grid(
    columns: (1fr, 1fr),
    column-gutter: 15pt,
    [
      #box(fill: gradient.linear(primary, info), width: 10pt, height: 10pt, radius: 50%)
      #h(5pt)
      #text(size: 9pt)[Aktueller Stand]
    ],
    [
      #box(fill: primary.lighten(65%), width: 10pt, height: 10pt, radius: 50%)
      #h(5pt)
      #text(size: 9pt)[Geplante Expansion]
    ],
  )
]

#pagebreak()

// ============================================================================
// B2B EXPANSION
// ============================================================================

== B2B Expansion: Corporate Employee Benefits

Neben dem B2C-Modell erschließt sich mittelfristig eine zusätzliche Wachstumsdimension: *Corporate Employee Benefits*. Die Möglichkeit der ARAG-Partnerschaft zeigt das grundsätzliche Interesse institutioneller Partner.

=== Marktcharakteristik

Der deutsche Markt für HR-Benefits-Software ist fragmentiert und wächst kontinuierlich. #footnote[Market Research Future: Germany Human Capital Management Software Market, 2024. HCM-Software-Markt: €1,375B (2024), 7,8% CAGR bis 2035.] Rund 260.000 Unternehmen mit 50+ Mitarbeitern #footnote[deutschland.de: German SMEs – Facts and Figures, 2024. 11,3% der 2,6M Unternehmen haben 50+ FTE.] bilden den grundsätzlich adressierbaren Markt für HR-Software-Lösungen.

=== Wertversprechen

#grid(
  columns: (1fr, 1fr),
  column-gutter: 12pt,

  box(fill: light-bg, inset: 14pt, radius: 6pt, width: 100%)[
    #text(weight: "bold", fill: primary)[Für HR-Abteilungen]
    #v(4pt)
    #text(size: 9pt)[
      - Zeitersparnis für Mitarbeiter: ~5–8 Std. pro für Elterngeldanträge pro Familie #footnote[Abgeleitet aus Beratungskosten (TKare: €99–209, Einfach Elterngeld: €549) bei €60/Std. HR-Vollkosten.]
      - Zeitersparnis für HR: Automatische Prüfung und Übermittlung von Elternzeitansprüchen
      - Standardisierte Prozesse
      - Entlastung bei komplexer Rechtslage
    ]
  ],

  box(fill: light-bg, inset: 14pt, radius: 6pt, width: 100%)[
    #text(weight: "bold", fill: success)[Für Geschäftsführung]
    #v(4pt)
    #text(size: 9pt)[
      - Attraktivität als Arbeitgeber
      - Mitarbeiterzufriedenheit in Familienphase
      - Signaleffekt: moderne Benefits #footnote[Roland Berger Employee Benefits Study 2024: 89% der HR-Leiter priorisieren Retention; 32% planen 2025 Family/Care Benefits.]
    ]
  ],
)

=== Preismodell & Beispielrechnung

*Hybrid-Ansatz (In Validierung):* Jahrespauschale (#b2b-pepy–5 € PEPY) + Nutzungsgebühr (#b2b-case-fee–35 € pro Fall).

#box(fill: primary.lighten(95%), inset: 12pt, radius: 6pt, width: 100%)[
  *Beispielrechnung: Unternehmen mit #b2b-example-employees Mitarbeitern*
  - Jahrespauschale: #b2b-example-employees × #euro(b2b-pepy) = *#euro(b2b-example-annual)*
  - Nutzung (angenommen #b2b-example-cases Fälle): #b2b-example-cases × #euro(b2b-case-fee) = *#euro(b2b-example-usage)*
  - *Gesamt: ~#euro(b2b-example-total)/Jahr*

  #v(4pt)
  #text(size: 8pt, fill: muted)[
    Vergleich: Externe Elterngeldberatung kostet 549 € pro Familie #footnote[Einfach Elterngeld Premium: €549 pro Familie, 2025.] (= #euro(549 * b2b-example-cases) für #b2b-example-cases Fälle).
  ]
]
#pagebreak()
=== Go-to-Market: Pragmatischer Stufenplan

#table(
  columns: (auto, 2fr, 2fr),
  fill: (x, y) => if y == 0 { info } else if calc.odd(y) { light-bg } else { white },
  stroke: 0.5pt + surface,
  inset: 10pt,

  table.cell(fill: info)[#text(fill: white, weight: "bold", size: 9pt)[PHASE]],
  table.cell(fill: info)[#text(fill: white, weight: "bold", size: 9pt)[ZIELGRUPPE]],
  table.cell(fill: info)[#text(fill: white, weight: "bold", size: 9pt)[ANSATZ]],

  [2026 Q2–Q4],
  [5–10 Pilotunternehmen (50–250 MA)],
  [Direkte Ansprache, Testpreise, Feedback-Schleifen],

  [2027 Q1+],
  [Mittelständische Tech- und Dienstleistungsunternehmen],
  [Integration in HR-Software (z.B. Personio) #footnote[Personio ist Marktführer für HR-Software im deutschen SME-Segment (50–500 FTE). People Managing People: Personio Pricing 2025.]],

  [Ab 2027 Q3],
  [Versicherungspartner, größere Arbeitgeber],
  [Strategische Kooperationen auf Basis validierter Pilotdaten],
)

=== Umsatzpotenzial (konservativ, Jahr 1)

#highlight-box(color: success)[
  #grid(
    columns: (2fr, 1fr),
    column-gutter: 15pt,
    [
      *B2C-Fokus:* #num(b2c-year1-customers) Kunden × #euro(product-price) \
      *B2B-Piloten (#b2b-pilot-companies Unternehmen):* Ø #b2b-pilot-companies × #euro(b2b-example-total) \
      #v(4pt)
      #text(weight: "bold", size: 11pt)[Gesamt Jahr 1 (Hybrid)]
    ],
    [
      #euro(b2c-pilot-revenue) \
      #euro(b2b-pilot-revenue) \
      #v(4pt)
      #text(weight: "bold", size: 11pt, fill: success)[#euro(hybrid-year1-revenue)]
    ],
  )
  #v(6pt)
  #text(size: 8pt, fill: muted)[
    *Strategie:* B2B als Upselling-Option neben primärem B2C-Fokus. Erst nach erfolgreicher Validierung (2027+) eigenständige Vertriebsressourcen.
  ]
]

=== Warum der Zeitpunkt passt

- *Mai 2025:* Digitale Elternzeit-Beantragung wird gesetzlich möglich #footnote[Sugrobov Rechtsanwälte: "Neue Ära des Arbeitsrechts – Digitale Antragstellung für Elternzeit ab Mai 2025".] – erhöht Akzeptanz digitaler Lösungen
- *Fachkräftemangel:* 45% der Arbeitnehmer offen für Jobwechsel #footnote[Gallup Workplace Study Germany 2024: 45% actively seeking or open to new opportunities.] – Family Benefits werden Differenzierungsfaktor
- *Fragmentierter Wettbewerb:* Kein dominanter Anbieter im Segment Parental Leave Administration #footnote[Synthese aus Wettbewerbsanalyse: MyCollective (2–3%), Voiio (5–8%), Back Technologies (unter 1%), BenefitatWork (3–5%). Market Research Future 2024.]

#pagebreak()

// ============================================================================
// RISIKEN
// ============================================================================

= Risiken & Mitigationsstrategien

#table(
  columns: (2fr, auto, 2fr),
  fill: (x, y) => if y == 0 { danger } else if calc.odd(y) { light-bg } else { white },
  stroke: 0.5pt + surface,
  inset: 12pt,

  table.cell(fill: danger)[#text(fill: white, weight: "bold")[Risiko]],
  table.cell(fill: danger)[#text(fill: white, weight: "bold")[Wahrsch.]],
  table.cell(fill: danger)[#text(fill: white, weight: "bold")[Mitigation]],

  [*Rechtliche Compliance* – Fehler im Antrag führen zu Haftung],
  [#badge("Mittel", color: accent)],
  [Rechtliche Verifikation gegen BEEG vor Go-Live; Haftungsausschlüsse; Versicherung prüfen],

  [*CAC höher als erwartet* – Marketing-Kanäle performen schlechter],
  [#badge("Mittel", color: accent)],
  [Diversifizierte Kanalstrategie; ARAG-Partnerschaft als CAC-0-Quelle; Fokus auf organisches Wachstum],

  [*Regulatorische Änderungen* – BEEG-Reform ändert Anforderungen],
  [#badge("Niedrig", color: success)],
  [Modulare Architektur erlaubt schnelle Anpassungen; Monitoring von Gesetzesänderungen],

  [*Wettbewerb* – Etablierte Player (Formie, Elterngeldbuddy) reagieren],
  [#badge("Mittel", color: accent)],
  [Differenzierung durch Vollständigkeit (5+ Leistungen), digitalen Versand, Mehrsprachigkeit],

  [*Partner-Abhängigkeit* – ARAG-Deal scheitert],
  [#badge("Niedrig", color: success)],
  [Diversifizierte Akquisitionsstrategie; ARAG ist einer von mehreren geplanten Kanälen],

  [*Technische Skalierung* – System kann Nachfrage nicht bewältigen],
  [#badge("Niedrig", color: success)],
  [Cloud-native Architektur (Supabase, Vercel) skaliert automatisch],
)

#pagebreak()

// ============================================================================
// TEAM
// ============================================================================

= Team & Organisation

== Gründerteam

#box(
  fill: white,
  inset: 0pt,
  radius: 12pt,
  width: 100%,
  stroke: 1pt + surface,
  clip: true,
)[
  #block(
    width: 100%,
    fill: gradient.linear(primary, primary-light),
    inset: (x: 20pt, y: 12pt),
  )[
    #text(fill: white, weight: "bold", size: 12pt)[
      Purpose-Driven Start-up von Hamburger Studierenden
    ]
  ]

  #block(inset: 20pt)[
    Das Bambini-Team vereint technische Entwicklung, rechtliches Verständnis und Produktdenken –
    mit dem Ziel, den Zugang zu Familienleistungen in Deutschland deutlich zu vereinfachen.

    #v(6pt)
    #text(size: 9pt, fill: muted)[
      Entstanden an der Bucerius Law School im Rahmen des Hamburg Legal Hackathon 2025
      unter dem Motto „Access to Justice".
    ]

    #v(15pt)

    #grid(
      columns: (1fr, 1fr),
      column-gutter: 15pt,
      row-gutter: 10pt,

      box(
        fill: primary.lighten(94%),
        inset: 12pt,
        radius: 6pt,
        width: 100%,
      )[
        #text(fill: primary, weight: "bold")[Full-Stack-Entwicklung]
        #v(3pt)
        #text(size: 9pt, fill: muted)[React, TypeScript, PostgreSQL]
      ],

      box(
        fill: accent.lighten(90%),
        inset: 12pt,
        radius: 6pt,
        width: 100%,
      )[
        #text(fill: accent.darken(10%), weight: "bold")[Produktdesign & UX]
        #v(3pt)
        #text(size: 9pt, fill: muted)[User Research, Prototyping]
      ],

      box(
        fill: success.lighten(92%),
        inset: 12pt,
        radius: 6pt,
        width: 100%,
      )[
        #text(fill: success, weight: "bold")[Rechtliche Expertise]
        #v(3pt)
        #text(size: 9pt, fill: muted)[Familienrecht, Sozialrecht]
      ],

      box(
        fill: info.lighten(92%),
        inset: 12pt,
        radius: 6pt,
        width: 100%,
      )[
        #text(fill: info, weight: "bold")[Business Development]
        #v(3pt)
        #text(size: 9pt, fill: muted)[Partnerschaften, Vertrieb]
      ],
    )
  ]
]

#v(1em)

#align(center)[
  #image("TeambildMika.jpg", width: 70%)
]
#align(center)[
  #text(size: 9pt, fill: muted)[
    Das Bambini-Team – Studierende der Bucerius Law School mit Fokus auf Tech, Recht und Produkt.
  ]
]

#pagebreak()

// ============================================================================
// ZUSAMMENFASSUNG
// ============================================================================

= Zusammenfassung & Call to Action

== Warum Bambini?

#grid(
  columns: (1fr, 1fr),
  column-gutter: 12pt,
  row-gutter: 12pt,

  box(fill: white, inset: 16pt, radius: 10pt, stroke: 1pt + success.lighten(50%), width: 100%)[
    #text(fill: success, weight: "bold", size: 11pt)[✓ Validiertes Problem]
    #v(6pt)
    #family-budget-billion Mrd. € für Familien, bis zu #calc.round(non-takeup-rate * 100)% kommen nicht an
  ],

  box(fill: white, inset: 16pt, radius: 10pt, stroke: 1pt + success.lighten(50%), width: 100%)[
    #text(fill: success, weight: "bold", size: 11pt)[✓ Strategische Partnerschaft]
    #v(6pt)
    ARAG-Deal unterschrieben, Testkunden bereit
  ],

  box(fill: white, inset: 16pt, radius: 10pt, stroke: 1pt + success.lighten(50%), width: 100%)[
    #text(fill: success, weight: "bold", size: 11pt)[✓ Außergewöhnliche Unit Economics]
    #v(6pt)
    Break-Even bei #break-even-monthly Kunden/Monat, CAC ~#euro(calc.round(blended-cac))
  ],

  box(fill: white, inset: 16pt, radius: 10pt, stroke: 1pt + success.lighten(50%), width: 100%)[
    #text(fill: success, weight: "bold", size: 11pt)[✓ Skalierbares Modell]
    #v(6pt)
    #num(serviceable-market) Familien/Jahr Serviceable Market
  ],
)

== Die Frage

#box(
  fill: primary.lighten(95%),
  inset: 25pt,
  radius: 12pt,
  width: 100%,
  stroke: 2pt + primary,
)[
  #align(center)[
    #text(size: 14pt, weight: "bold", fill: primary-dark)[
      Wir suchen ca. #euro-compact(total-capital-max) für die GmbH-Gründung und initiales Wachstum.
    ]

    #v(15pt)

    #text(size: 10pt, fill: muted)[Mit diesem Kapital erreichen wir:]

    #v(12pt)

    #grid(
      columns: (1fr, 1fr, 1fr),
      column-gutter: 10pt,
      box(fill: white, inset: 12pt, radius: 8pt, width: 100%, stroke: 1pt + primary.lighten(70%))[
        #align(center)[
          #text(size: 22pt, weight: "bold", fill: primary)[#num(customers-year1)]
          #v(2pt)
          #text(size: 9pt, fill: muted)[Kunden im ersten Jahr]
        ]
      ],
      box(fill: white, inset: 12pt, radius: 8pt, width: 100%, stroke: 1pt + primary.lighten(70%))[
        #align(center)[
          #text(size: 22pt, weight: "bold", fill: primary)[#euro-compact(revenue-year1)]
          #v(2pt)
          #text(size: 9pt, fill: muted)[Umsatz Jahr 1]
        ]
      ],
      box(fill: white, inset: 12pt, radius: 8pt, width: 100%, stroke: 1pt + primary.lighten(70%))[
        #align(center)[
          #text(size: 22pt, weight: "bold", fill: primary)[#euro-compact(profit-year1)]
          #v(2pt)
          #text(size: 9pt, fill: muted)[Gewinn Jahr 1]
        ]
      ],
    )
  ]
]

#v(0.8em)

#align(center)[
  #box(
    fill: gradient.linear(primary, primary-dark),
    inset: (x: 35pt, y: 16pt),
    radius: 10pt,
  )[
    #text(fill: white, weight: "bold", size: 13pt)[
      Gemeinsam können wir Bürokratie für Familien revolutionieren.
    ]
  ]
]

#align(center)[
  #line(length: 60pt, stroke: 1pt + surface)
  #v(1em)
  #text(size: 10pt, fill: muted)[
    *Kontakt:* info\@bambini-claims.de \
    *Web:* bambini-claims.de
  ]
]

#v(1.5em)
