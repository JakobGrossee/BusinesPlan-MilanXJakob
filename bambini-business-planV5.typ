// ═══════════════════════════════════════════════════════════════════════════
// BAMBINI BUSINESS PLAN — V5 (DRAFT)
// Editorial-/Working-Paper-Stil. Inspiriert von chemicoms-paper / splendid-mdpi.
//
// Rein graphische Überarbeitung von V4:
//   - Inhalt, Variablen und Berechnungen sind 1:1 aus V4 übernommen.
//   - Keine Farbverläufe, ein Akzentton, Linien statt Flächen.
//   - Body in Serif (Working-Paper-Look), Sans für Headings/Tabellen/Captions.
//   - Tabellen im Booktabs-Stil (3 horizontale Linien, kein Zellfill).
//   - Cover als zurückgenommene MDPI-Titelseite mit Mini-Abstract.
//
// Build:
//   typst compile bambini-business-planV5.typ bambini-business-planV5.pdf
// ═══════════════════════════════════════════════════════════════════════════

#import "@preview/lilaq:0.4.0" as lq

#set document(
  title: "Bambini Business Plan 2026-2028",
  author: "Bambini GmbH (i.Gr.)",
)


// ═══════════════════════════════════════════════════════════════════════════
// ZENTRALE VARIABLEN (1:1 aus V4)
// ═══════════════════════════════════════════════════════════════════════════

// ─── Preis- & Geschäftsmodell ────────────────────────────────────────────────
#let free-price = 0
#let premium-price = 9.99
#let premium-start = "Juli 2026"
#let competitor-price-low = 40
#let competitor-price-high = 50

// ─── Nutzer- & Conversion-Annahmen ───────────────────────────────────────────
#let active-users-q1 = 100
#let active-users-q2 = 250
#let active-users-q3 = 550
#let active-users-q4 = 900
#let active-users-year1 = active-users-q1 + active-users-q2 + active-users-q3 + active-users-q4

#let conversion-q1 = 0.00
#let conversion-q2 = 0.05
#let conversion-q3 = 0.08
#let conversion-q4 = 0.10
#let conversion-year2 = 0.10
#let conversion-year3 = 0.12

#let premium-users-q1 = calc.round(active-users-q1 * conversion-q1)
#let premium-users-q2 = calc.round(active-users-q2 * conversion-q2)
#let premium-users-q3 = calc.round(active-users-q3 * conversion-q3)
#let premium-users-q4 = calc.round(active-users-q4 * conversion-q4)
#let premium-users-year1 = premium-users-q1 + premium-users-q2 + premium-users-q3 + premium-users-q4

#let active-users-year2 = 5000
#let active-users-year3 = 12000
#let premium-users-year2 = calc.round(active-users-year2 * conversion-year2)
#let premium-users-year3 = calc.round(active-users-year3 * conversion-year3)

#let paid-cases-per-premium-y1 = 1.0
#let paid-cases-per-premium-y2 = 1.4
#let paid-cases-per-premium-y3 = 2.0
#let paid-cases-y1 = calc.round(premium-users-year1 * paid-cases-per-premium-y1)
#let paid-cases-y2 = calc.round(premium-users-year2 * paid-cases-per-premium-y2)
#let paid-cases-y3 = calc.round(premium-users-year3 * paid-cases-per-premium-y3)

#let revenue-y1 = paid-cases-y1 * premium-price
#let revenue-y2 = paid-cases-y2 * premium-price
#let revenue-y3 = paid-cases-y3 * premium-price

// ─── Quartalsumsätze (Jahr 1) ────────────────────────────────────────────────
#let revenue-q1 = premium-users-q1 * premium-price
#let revenue-q2 = premium-users-q2 * premium-price
#let revenue-q3 = premium-users-q3 * premium-price
#let revenue-q4 = premium-users-q4 * premium-price

// ─── Fixkosten ───────────────────────────────────────────────────────────────
#let cost-hosting = 4
#let cost-supabase = 0
#let cost-dev-tools = 90
#let cost-qes-monthly = 15
#let cost-steuerberater = 150
#let cost-email-annual = 20
#let cost-qes-annual = 27

#let monthly-fixed-costs = cost-hosting + cost-supabase + cost-dev-tools + cost-qes-monthly + cost-steuerberater
#let annual-fixed-costs-y1 = (monthly-fixed-costs * 12) + cost-email-annual + cost-qes-annual
#let annual-fixed-costs-y2 = 4500
#let annual-fixed-costs-y3 = 6500

// ─── Marketing / Akquisition ─────────────────────────────────────────────────
#let acquisition-cost-per-active-user-y1 = 2.00
#let acquisition-cost-per-active-user-y2 = 1.50
#let acquisition-cost-per-active-user-y3 = 1.00
#let marketing-y1 = active-users-year1 * acquisition-cost-per-active-user-y1
#let marketing-y2 = active-users-year2 * acquisition-cost-per-active-user-y2
#let marketing-y3 = active-users-year3 * acquisition-cost-per-active-user-y3

// ─── KI-Kosten ───────────────────────────────────────────────────────────────
#let ai-cost-per-request = 0.01
#let avg-ai-requests-free = 5
#let avg-ai-requests-premium = 12

#let ai-requests-y1 = (active-users-year1 * avg-ai-requests-free) + (premium-users-year1 * avg-ai-requests-premium)
#let ai-requests-y2 = (active-users-year2 * avg-ai-requests-free) + (premium-users-year2 * avg-ai-requests-premium)
#let ai-requests-y3 = (active-users-year3 * avg-ai-requests-free) + (premium-users-year3 * avg-ai-requests-premium)

#let ai-cost-y1 = ai-requests-y1 * ai-cost-per-request
#let ai-cost-y2 = ai-requests-y2 * ai-cost-per-request
#let ai-cost-y3 = ai-requests-y3 * ai-cost-per-request

// ─── Variable Premium-Kosten ─────────────────────────────────────────────────
#let variable-cost-per-paid-case = 1.50
#let variable-costs-y1 = paid-cases-y1 * variable-cost-per-paid-case
#let variable-costs-y2 = paid-cases-y2 * variable-cost-per-paid-case
#let variable-costs-y3 = paid-cases-y3 * variable-cost-per-paid-case

// ─── Externe Beratung / Puffer ───────────────────────────────────────────────
#let legal-compliance-y1 = 500
#let legal-compliance-y2 = 300
#let legal-compliance-y3 = 300
#let contingency-y1 = 1200
#let contingency-y2 = 1800
#let contingency-y3 = 2400

// ─── Gründung & Kapitalbedarf ────────────────────────────────────────────────
#let cost-notar-min = 698
#let cost-notar-max = 850
#let cost-handelsregister = 100
#let cost-gewerbe-max = 125
#let cost-transparenz = 19.80
#let founding-costs-min = cost-notar-min + cost-handelsregister + 100 + cost-transparenz
#let founding-costs-max = cost-notar-max + cost-handelsregister + cost-gewerbe-max + cost-transparenz
#let stammkapital = 12500
#let minimum-formation-need = stammkapital + founding-costs-max
#let recommended-funding = 22000

// ─── Gesamtkosten & Ergebnisse ───────────────────────────────────────────────
#let total-costs-y1 = founding-costs-max + annual-fixed-costs-y1 + marketing-y1 + ai-cost-y1 + variable-costs-y1 + legal-compliance-y1 + contingency-y1
#let total-costs-y2 = annual-fixed-costs-y2 + marketing-y2 + ai-cost-y2 + variable-costs-y2 + legal-compliance-y2 + contingency-y2
#let total-costs-y3 = annual-fixed-costs-y3 + marketing-y3 + ai-cost-y3 + variable-costs-y3 + legal-compliance-y3 + contingency-y3

#let result-y1 = revenue-y1 - total-costs-y1
#let result-y2 = revenue-y2 - total-costs-y2
#let result-y3 = revenue-y3 - total-costs-y3
#let cumulative-result-y1 = result-y1
#let cumulative-result-y2 = result-y1 + result-y2
#let cumulative-result-y3 = result-y1 + result-y2 + result-y3

// ─── Liquidität ──────────────────────────────────────────────────────────────
#let cash-start = recommended-funding
#let cash-end-y1 = cash-start + result-y1
#let cash-end-y2 = cash-end-y1 + result-y2
#let cash-end-y3 = cash-end-y2 + result-y3
#let cash-minimum = calc.min(cash-end-y1, cash-end-y2, cash-end-y3)

// ─── Marktdaten ──────────────────────────────────────────────────────────────
#let births-per-year = 685000
#let serviceable-market = 308000
#let family-budget-billion = 80
#let non-takeup-rate = 0.70
#let market-share-y1 = active-users-year1 / serviceable-market * 100
#let market-share-y3 = active-users-year3 / serviceable-market * 100

// ─── Szenarien ───────────────────────────────────────────────────────────────
#let scenario-conservative-factor = 0.50
#let scenario-optimistic-factor = 1.50
#let active-users-conservative = calc.round(active-users-year1 * scenario-conservative-factor)
#let active-users-optimistic = calc.round(active-users-year1 * scenario-optimistic-factor)
#let paid-cases-conservative = calc.round(paid-cases-y1 * scenario-conservative-factor)
#let paid-cases-optimistic = calc.round(paid-cases-y1 * scenario-optimistic-factor)
#let revenue-conservative = paid-cases-conservative * premium-price
#let revenue-optimistic = paid-cases-optimistic * premium-price

#let result-conservative = revenue-conservative - founding-costs-max - annual-fixed-costs-y1 - (marketing-y1 * scenario-conservative-factor) - (ai-cost-y1 * scenario-conservative-factor) - (variable-costs-y1 * scenario-conservative-factor) - legal-compliance-y1 - contingency-y1
#let result-optimistic = revenue-optimistic - founding-costs-max - annual-fixed-costs-y1 - (marketing-y1 * scenario-optimistic-factor) - (ai-cost-y1 * scenario-optimistic-factor) - (variable-costs-y1 * scenario-optimistic-factor) - legal-compliance-y1 - contingency-y1


// ═══════════════════════════════════════════════════════════════════════════
// FORMATIERUNGSHELFER (1:1 aus V4)
// ═══════════════════════════════════════════════════════════════════════════

#let intfmt(value) = {
  if value < 0 { "-" + intfmt(-value) }
  else {
    let rounded = calc.round(value)
    if rounded >= 1000 {
      let thousands = calc.floor(rounded / 1000)
      let remainder = calc.rem(rounded, 1000)
      let remainder-str = str(remainder)
      while remainder-str.len() < 3 { remainder-str = "0" + remainder-str }
      str(thousands) + "." + remainder-str
    } else { str(rounded) }
  }
}

#let euro(value) = {
  if value < 0 { "-" + euro(-value) }
  else if value >= 1000000 { str(calc.round(value / 1000000, digits: 1)).replace(".", ",") + " Mio. €" }
  else if value >= 1000 { intfmt(value) + " €" }
  else if value == calc.floor(value) { str(calc.round(value)) + " €" }
  else { str(calc.round(value, digits: 2)).replace(".", ",") + " €" }
}

#let euro-compact(value) = {
  if value < 0 { "-" + euro-compact(-value) }
  else if value >= 1000 { str(calc.round(value / 1000, digits: 1)).replace(".", ",") + "k €" }
  else { euro(value) }
}

#let signed-euro-compact(value) = {
  if value > 0 { "+" + euro-compact(value) }
  else if value < 0 { euro-compact(value) }
  else { euro-compact(0) }
}

#let pct(value) = str(calc.round(value, digits: 1)).replace(".", ",") + "%"

#let num(value) = {
  if value >= 1000000 { str(calc.round(value / 1000000, digits: 2)) + " Mio." }
  else if value >= 1000 { intfmt(value) }
  else { str(calc.round(value)) }
}


// ═══════════════════════════════════════════════════════════════════════════
// EDITORIAL PALETTE — ein Akzent, viel Neutral
// ═══════════════════════════════════════════════════════════════════════════

// Ein gedämpfter Akzent: Aubergine. Hält subtile Brand-Verbindung zum
// bisherigen Lila, ohne Pitch-Deck-Optik. Alternative: rgb("#1F3A5F") Navy
// für maximalen Bank-Look.
#let accent       = rgb("#5B3A4E")
#let accent-soft  = rgb("#F2EDF0")   // 6 % Akzent-Tönung, sehr sparsam einsetzen

// Neutralskala
#let ink          = rgb("#1A1A1A")
#let ink-soft     = rgb("#3D3D3D")
#let muted        = rgb("#6B6B6B")
#let muted-soft   = rgb("#9A9A9A")
#let rule         = rgb("#D4D4D4")
#let rule-soft    = rgb("#EAEAEA")
#let paper        = rgb("#FFFFFF")
#let paper-tint   = rgb("#FAFAFA")

// Semantik – ausschließlich für Vorzeichen in Ergebniszeilen
#let pos          = rgb("#2F6F4E")
#let neg          = rgb("#8B2E2E")


// ═══════════════════════════════════════════════════════════════════════════
// TYPOGRAFIE
// ═══════════════════════════════════════════════════════════════════════════

#let serif = ("Source Serif 4", "Source Serif Pro", "EB Garamond", "Charter", "Georgia")
#let sans  = ("Inter", "Source Sans 3", "Source Sans Pro", "Helvetica Neue", "Arial")

#set text(
  font: serif,
  size: 10pt,
  fill: ink,
  lang: "de",
  hyphenate: true,
)

#set par(
  justify: true,
  leading: 0.62em,
  spacing: 0.85em,
)


// ═══════════════════════════════════════════════════════════════════════════
// PAGE SETUP
// ═══════════════════════════════════════════════════════════════════════════

#set page(
  paper: "a4",
  margin: (x: 2.6cm, top: 2.5cm, bottom: 2.2cm),
  header: context {
    if counter(page).get().first() > 2 [
      #grid(
        columns: (1fr, auto, 1fr),
        align: (left, center, right),
        text(font: sans, size: 8pt, fill: muted, tracking: 1.2pt)[
          #upper("Bambini Business Plan")
        ],
        text(font: sans, size: 8pt, fill: muted)[
          #counter(page).display()
        ],
        text(font: sans, size: 8pt, fill: muted, tracking: 1.2pt)[
          #upper("Mai 2026")
        ],
      )
      #v(2pt)
      #line(length: 100%, stroke: 0.4pt + rule)
    ]
  },
  footer: context {
    if counter(page).get().first() > 2 [
      #line(length: 100%, stroke: 0.4pt + rule)
      #v(3pt)
      #grid(
        columns: (1fr, 1fr),
        align: (left, right),
        text(font: sans, size: 7.5pt, fill: muted)[
          Bambini GmbH (i. Gr.) · Hamburg
        ],
        text(font: sans, size: 7.5pt, fill: muted)[
          bambini-claims.de
        ],
      )
    ]
  },
)


// ═══════════════════════════════════════════════════════════════════════════
// HEADINGS — typografisch, keine Verlaufsbalken
// ═══════════════════════════════════════════════════════════════════════════

#set heading(numbering: "1.1")

#show heading.where(level: 1): it => {
  v(1.4em)
  let n = counter(heading).display()
  block[
    #text(font: sans, size: 9pt, weight: "regular", fill: muted, tracking: 1.5pt)[
      #upper("Kapitel " + n)
    ]
    #v(2pt)
    #text(font: sans, size: 17pt, weight: "semibold", fill: ink)[#it.body]
    #v(4pt)
    #line(length: 100%, stroke: 0.6pt + ink)
  ]
  v(0.8em)
}

#show heading.where(level: 2): it => {
  v(1em)
  text(font: sans, size: 11.5pt, weight: "semibold", fill: ink)[#it.body]
  v(0.3em)
}

#show heading.where(level: 3): it => {
  v(0.5em)
  text(font: sans, size: 9.5pt, weight: "semibold", fill: ink-soft, style: "italic")[#it.body]
  v(0.15em)
}


// ═══════════════════════════════════════════════════════════════════════════
// EDITORIAL COMPONENTS
// ═══════════════════════════════════════════════════════════════════════════

// Standard-Hervorhebung: dünner Akzentstrich links, kein Fill
#let callout(title: none, body) = {
  block(
    width: 100%,
    inset: (left: 14pt, right: 4pt, y: 8pt),
    stroke: (left: 1.5pt + accent, rest: 0pt),
  )[
    #if title != none {
      text(font: sans, size: 8.5pt, weight: "semibold",
           fill: accent, tracking: 1.2pt)[#upper(title)]
      v(4pt)
    }
    #body
  ]
}

// Variante mit dezenter Akzent-Tönung – sparsam einsetzen
#let callout-soft(title: none, body) = {
  block(
    width: 100%,
    fill: accent-soft,
    inset: 14pt,
    stroke: none,
  )[
    #if title != none {
      text(font: sans, size: 8.5pt, weight: "semibold",
           fill: accent, tracking: 1.2pt)[#upper(title)]
      v(4pt)
    }
    #body
  ]
}

// KPI im Editorial-Stil: Label oben klein, Zahl groß in Ink
#let kpi(value, label) = {
  block(
    width: 100%,
    inset: (top: 10pt, bottom: 10pt, x: 0pt),
    stroke: (top: 0.6pt + ink, bottom: 0.4pt + rule, rest: 0pt),
  )[
    #text(font: sans, size: 7.5pt, weight: "regular",
          fill: muted, tracking: 1.3pt)[#upper(label)]
    #v(3pt)
    #text(font: sans, size: 17pt, weight: "semibold", fill: ink)[#value]
  ]
}

// Outline-Tag (ersetzt die alten Pill-Badges)
#let tag(content, color: accent) = {
  box(stroke: 0.6pt + color, inset: (x: 6pt, y: 2pt), radius: 2pt)[
    #text(font: sans, fill: color, weight: "regular",
          size: 7.5pt, tracking: 1pt)[#upper(content)]
  ]
}

// Marginalien-Label
#let label-text(content) = {
  text(font: sans, size: 7.5pt, fill: muted,
       weight: "regular", tracking: 1.4pt)[#upper(content)]
}

// Schritt-Marker: Outline-Kreis mit Ziffer (kein Verlauf)
#let step(n) = {
  box(width: 22pt, height: 22pt, stroke: 0.8pt + ink, radius: 50%, inset: 0pt)[
    #align(center + horizon)[
      #text(font: sans, size: 10pt, weight: "regular", fill: ink)[#str(n)]
    ]
  ]
}

// Dotted-Leader-Zeile für Listen
#let metric-row(label, value) = {
  grid(
    columns: (1fr, auto),
    align: (left + horizon, right + horizon),
    text(fill: ink-soft)[#label],
    text(weight: "semibold", fill: ink, font: sans, size: 9.5pt)[#value],
  )
  v(4pt)
  line(length: 100%, stroke: 0.3pt + rule-soft)
  v(4pt)
}

// Risiko-/Mitigations-Karte im Editorial-Stil
// Ersetzt die V4-Variante mit farbigem Linkenrand und gefüllter Pill.
#let risk-card(id, title, level, body) = {
  block(
    width: 100%,
    inset: (left: 14pt, right: 4pt, top: 8pt, bottom: 10pt),
    stroke: (left: 1.5pt + accent, rest: 0pt),
  )[
    #grid(
      columns: (1fr, auto),
      align: (left + horizon, right + horizon),
      text(font: sans, size: 9pt, weight: "semibold", fill: ink)[
        #text(fill: accent)[#id] #h(6pt) #title
      ],
      tag(level, color: muted),
    )
    #v(6pt)
    #text(size: 9pt, fill: ink-soft)[#body]
  ]
}

// Roadmap-Phase als typografische Timeline-Zeile
#let phase(periode, titel, content, kpi) = {
  grid(
    columns: (75pt, 1fr),
    column-gutter: 18pt,
    row-gutter: 0pt,

    block[
      #text(font: sans, size: 8pt, weight: "semibold",
            fill: accent, tracking: 1.2pt)[#upper(periode)]
    ],
    block[
      #text(font: sans, size: 10.5pt, weight: "semibold", fill: ink)[#titel]
      #v(4pt)
      #text(size: 9.5pt)[#content]
      #v(3pt)
      #text(size: 8pt, fill: muted, style: "italic")[#kpi]
    ],
  )
  v(8pt)
  line(length: 100%, stroke: 0.3pt + rule-soft)
  v(8pt)
}


// ═══════════════════════════════════════════════════════════════════════════
// TABELLEN-STIL — Booktabs (3 Linien, kein Zellfill)
// ═══════════════════════════════════════════════════════════════════════════

#set table(
  stroke: none,
  inset: (x: 8pt, y: 6pt),
)

// Sans-Serif für Tabelleninhalte (ruhiger, klarer)
#show table.cell: it => {
  set text(font: sans, size: 9pt)
  it
}

// Booktabs-Helper: Header-Zelle (kein Fill, nur fett + Sans)
#let th(body) = table.cell[#text(font: sans, size: 9pt, weight: "semibold", fill: ink)[#body]]


// ═══════════════════════════════════════════════════════════════════════════
// COVER — MDPI-/Working-Paper-Stil
// ═══════════════════════════════════════════════════════════════════════════

#page(header: none, footer: none, margin: (x: 3cm, y: 3cm))[

  // Kopfzeile: dezente Marginalie + dünne Linie
  #grid(
    columns: (1fr, auto),
    align: (left, right),
    text(font: sans, size: 8pt, fill: muted, tracking: 1.5pt)[
      #upper("Bambini GmbH (i. Gr.)  ·  Bucerius Law School")
    ],
    text(font: sans, size: 8pt, fill: muted, tracking: 1.5pt)[
      #upper("Mai 2026  ·  Iteration 5")
    ],
  )
  #v(2pt)
  #line(length: 100%, stroke: 0.6pt + ink)

  #v(3.5cm)

  #align(center)[
    #image("bambini-logo.png", width: 140pt)
  ]

  #v(2.2cm)

  #text(font: sans, size: 9pt, fill: muted, tracking: 2pt)[
    #upper("Geschäftsplan 2026 – 2028")
  ]
  #v(8pt)
  #text(font: serif, size: 32pt, weight: "regular", fill: ink, tracking: -0.5pt)[
    Bambini Business Plan
  ]
  #v(6pt)
  #text(font: serif, size: 14pt, fill: ink-soft, style: "italic")[
    Kostenloser Elterngeld-Self-Service mit KI-Unterstützung
  ]
  #v(10pt)
  #text(font: sans, size: 10.5pt, fill: muted)[
    GmbH-Gründung und Wachstumsfinanzierung
  ]

  #v(1fr)

  // Autoren-/Team-Block
  #line(length: 100%, stroke: 0.4pt + rule)
  #v(8pt)

  #grid(
    columns: (1fr, 1fr),
    column-gutter: 24pt,
    row-gutter: 6pt,

    text(font: sans, size: 8.5pt, weight: "semibold", fill: ink, tracking: 0.8pt)[
      #upper("Gründerteam")
    ],
    text(font: sans, size: 8.5pt, weight: "semibold", fill: ink, tracking: 0.8pt)[
      #upper("Kontakt")
    ],

    text(size: 9pt)[
      Milan Kohlhaase, Jakob Große-Eggebrecht, \
      Mika Tomii, Michaela Idawain, Merit Lachmann \
      #v(2pt)
      #text(fill: muted, size: 8pt, font: sans)[Bucerius Law School, Hamburg]
    ],
    text(size: 9pt)[
      info\@bambini-claims.de \
      bambini-claims.de \
      #v(2pt)
      #text(fill: muted, size: 8pt, font: sans)[Stand: Mai 2026]
    ],
  )

  #v(14pt)
  #line(length: 100%, stroke: 0.4pt + rule)
  #v(10pt)

  // Mini-Abstract im MDPI-Stil
  #text(font: sans, size: 8pt, weight: "semibold",
        fill: muted, tracking: 1.2pt)[#upper("Zusammenfassung")]
  #v(6pt)
  #text(size: 9.5pt, fill: ink-soft)[
    Bambini entwickelt einen kostenlosen, KI-gestützten Self-Service für die
    Elterngeld-Beantragung. Marktstart April 2026, kostenpflichtige
    Zusatzleistung ab #premium-start (#euro(premium-price) pro Fall).
    Empfohlener Finanzierungsrahmen: #euro(recommended-funding) für
    GmbH-Gründung und Validierungsphase.
  ]

  #v(8pt)
  #text(font: sans, size: 8pt, weight: "semibold",
        fill: muted, tracking: 1.2pt)[#upper("Schlagworte")]
  #v(4pt)
  #text(font: sans, size: 9pt, fill: ink-soft)[
    Elterngeld · Familienleistungen · LegalTech · GovTech ·
    Freemium · KI-Assistenz · GmbH-Gründung
  ]
]


// ═══════════════════════════════════════════════════════════════════════════
// TABLE OF CONTENTS
// ═══════════════════════════════════════════════════════════════════════════

#page(header: none, footer: none)[
  #v(1.5cm)

  #text(font: sans, size: 9pt, fill: muted, tracking: 1.5pt)[
    #upper("Inhaltsverzeichnis")
  ]
  #v(4pt)
  #line(length: 100%, stroke: 0.6pt + ink)
  #v(0.8cm)

  #set text(font: serif, size: 10.5pt)
  #show outline.entry.where(level: 1): it => {
    v(0.4em)
    text(font: sans, weight: "semibold", fill: ink)[#it]
  }
  #show outline.entry.where(level: 2): it => {
    text(font: serif, fill: ink-soft, size: 10pt)[#it]
  }

  #outline(title: none, indent: 1.2em, depth: 2)
]


// ═══════════════════════════════════════════════════════════════════════════
// 1. EXECUTIVE SUMMARY
// ═══════════════════════════════════════════════════════════════════════════

= Executive Summary

#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  column-gutter: 14pt,
  kpi([0 €], "Basisversion"),
  kpi([#euro(premium-price)], "Premium ab Juli 26"),
  kpi([#num(active-users-year1)], "Aktive Nutzer J1"),
  kpi([#euro-compact(recommended-funding)], "Finanzierungsrahmen"),
)

#v(1em)

#text(size: 11pt, fill: ink-soft)[
  *Bambini* entwickelt eine digitale Unterstützung für Eltern bei der
  Beantragung von *Elterngeld*. Der Marktstart erfolgt mit einem kostenlosen
  Self-Service: Nutzer werden strukturiert durch die erforderlichen Angaben
  geführt und erhalten einen vorbereiteten Antrag. Die Einreichung erfolgt
  in der kostenlosen Variante zunächst durch den Nutzer selbst.
]

#v(0.6em)

Der kostenlose Einstieg ist eine bewusste strategische Entscheidung.
Bestehende Anbieter verlangen für vergleichbare Self-Service-Angebote
typischerweise *#competitor-price-low – #competitor-price-high €*.
Bambini bietet diesen Grundnutzen kostenlos an, um die Einstiegshürde zu
senken, eine Nutzerbasis aufzubauen und den Prozess anhand realer
Anwendungsfälle zu validieren. Differenzierung entsteht zusätzlich über
*BambiniAI* — einen KI-gestützten Assistenten, der in dieser Form bislang
von keinem Wettbewerber angeboten wird.

#v(0.6em)

#grid(
  columns: (1fr, 1fr),
  column-gutter: 18pt,

  callout(title: [Startprodukt])[
    Kostenloser Elterngeld-Self-Service mit strukturierter Datenerfassung,
    Plausibilitätsprüfung, Antragserstellung und begrenztem Zugang zu BambiniAI.
  ],
  callout(title: [Monetarisierung])[
    Ab #premium-start wird eine standardisierte Antragseinreichung bzw.
    Abwicklung für #euro(premium-price) pro Fall getestet. Weitere
    Antragsarten (Kindergeld, Elternzeit) folgen erst nach Validierung des
    Elterngeld-Prozesses.
  ],
)

#v(1em)

=== Eckdaten und wirtschaftliche Prognose

#grid(
  columns: (1fr, 1fr),
  column-gutter: 24pt,

  [
    #label-text("Markt & Kapital")
    #v(8pt)
    #metric-row([Serviceable Market], [~#num(serviceable-market) Fam./Jahr])
    #metric-row([Aktive Nutzer Jahr 1], [#num(active-users-year1)])
    #metric-row([Zahlende Fälle Jahr 1], [~#num(paid-cases-y1)])
    #metric-row([Mindestbedarf Gründung], [#euro-compact(minimum-formation-need)])
    #metric-row([Finanzierungsrahmen], [#euro-compact(recommended-funding)])
  ],

  [
    #label-text("Drei-Jahres-Prognose")
    #v(8pt)

    #table(
      columns: (1fr, auto, auto),
      align: (left, right, right),
      table.hline(stroke: 0.8pt + ink),
      th[Periode], th[Umsatz], th[Ergebnis],
      table.hline(stroke: 0.4pt + ink),

      [Jahr 1], [#euro-compact(revenue-y1)],
      table.cell[#text(font: sans, fill: if result-y1 < 0 { neg } else { pos },
        weight: "semibold")[#signed-euro-compact(result-y1)]],

      [Jahr 2], [#euro-compact(revenue-y2)],
      table.cell[#text(font: sans, fill: if result-y2 < 0 { neg } else { pos },
        weight: "semibold")[#signed-euro-compact(result-y2)]],

      [Jahr 3], [#euro-compact(revenue-y3)],
      table.cell[#text(font: sans, fill: if result-y3 < 0 { neg } else { pos },
        weight: "semibold")[#signed-euro-compact(result-y3)]],

      table.hline(stroke: 0.8pt + ink),
    )

    #v(4pt)
    #text(size: 8pt, fill: muted, style: "italic")[
      Konservatives Basisszenario. Profitabilität ab Skalierung weiterer
      Antragsarten.
    ]
  ],
)

#v(0.8em)

Die wirtschaftliche Planung versteht *das erste Geschäftsjahr als
Validierungs- und Aufbaujahr*. Umsätze entstehen erst ab Juli 2026 durch die
kostenpflichtige Zusatzleistung. Profitabilität ist geplant ab Skalierung der
Zusatzleistungen, weiterer Antragsarten (Kindergeld, Elternzeit ab 2027) und
möglicher weiterer Erlöse.


// ═══════════════════════════════════════════════════════════════════════════
// 2. AUSGANGSSITUATION & PROBLEMSTELLUNG
// ═══════════════════════════════════════════════════════════════════════════
#pagebreak()

= Ausgangssituation und Problemstellung

== Marktkontext

#grid(
  columns: (1fr, 1fr),
  column-gutter: 24pt,
  [
    #text(font: sans, size: 26pt, weight: "semibold", fill: ink)[
      #family-budget-billion Mrd. €
    ]
    #v(2pt)
    #text(size: 9.5pt, fill: ink-soft)[
      Jährliches Budget für Familienleistungen in Deutschland.
    ]
  ],
  [
    #text(font: sans, size: 26pt, weight: "semibold", fill: accent)[
      bis zu #calc.round(non-takeup-rate * 100) %
    ]
    #v(2pt)
    #text(size: 9.5pt, fill: ink-soft)[
      Nichtinanspruchnahme durch Komplexität \
      #text(size: 8pt, fill: muted, style: "italic")[Quelle: BMFSFJ 2021]
    ]
  ],
)

#v(0.4em)
#line(length: 100%, stroke: 0.4pt + rule)
#v(0.6em)

Deutschland verfügt über eines der umfangreichsten Systeme für
Familienleistungen weltweit. Die tatsächliche Inanspruchnahme liegt deutlich
unter dem Anspruchsniveau. Insbesondere der Elterngeld-Antrag ist für viele
Familien schwer verständlich: zahlreiche unterschiedliche
Lebenssachverhalte, umfangreiche Nachweispflichten, unterschiedliche
Zuständigkeiten der Länder und Folgen fehlerhafter Angaben oder verpasster
Fristen führen dazu, dass Ansprüche nicht oder nicht vollständig realisiert
werden.

#v(0.4em)

#callout[
  #text(style: "italic")[
    „Das Antragsformular ist extrem kompliziert, wenig bürgerfreundlich und
    nicht barrierefrei."
  ]
  #h(1fr)
  #text(font: sans, fill: muted, size: 8.5pt)[— Hannover.de, Offizielle Stadtwebsite]
]

== Marktgröße und Zielgruppen

#grid(
  columns: (1fr, 1fr),
  column-gutter: 24pt,
  [
    #label-text("Geburten pro Jahr (TAM)")
    #v(6pt)
    #text(font: sans, size: 30pt, weight: "semibold", fill: ink)[
      #num(births-per-year)
    ]
    #v(4pt)
    #text(size: 9pt, fill: muted)[in Deutschland]
  ],
  [
    #label-text("Serviceable Market (SAM)")
    #v(6pt)
    #text(font: sans, size: 30pt, weight: "semibold", fill: accent)[
      ~#num(serviceable-market)
    ]
    #v(4pt)
    #text(size: 9pt, fill: muted)[Familien/Jahr (~45 %)]
  ],
)

#v(0.4em)
#line(length: 100%, stroke: 0.4pt + rule)
#v(0.4em)

*Primäre Zielgruppen:* Berufstätige Eltern mit begrenzter Zeit für die
Antragstellung, Eltern mit komplexeren Einkommenssituationen sowie Familien
mit Sprach- oder Verständnishürden, die überproportional von der
Antrags-Komplexität betroffen sind. Hinzu kommen Nutzer aus Partnerkanälen,
die eine niedrigschwellige digitale Unterstützung erwarten.

== Marktanalyse und Wettbewerbsumfeld

Der Markt ist nicht gänzlich unerschlossen, aber fragmentiert. Drei
Anbietergruppen prägen das Bild:

#v(0.3em)

#grid(
  columns: (1fr, 1fr, 1fr),
  column-gutter: 18pt,
  [
    #text(font: sans, size: 9pt, weight: "semibold", fill: accent, tracking: 1pt)[
      #upper("Staatliche Angebote")
    ]
    #v(4pt)
    #line(length: 100%, stroke: 0.4pt + rule)
    #v(6pt)
    #text(size: 9pt, fill: ink-soft)[
      Behördliche Formulare und Informationen — kostenlos, jedoch komplex,
      fragmentiert nach Bundesländern und ohne durchgängige Prozessführung.
    ]
  ],
  [
    #text(font: sans, size: 9pt, weight: "semibold", fill: accent, tracking: 1pt)[
      #upper("Private Self-Service-Anbieter")
    ]
    #v(4pt)
    #line(length: 100%, stroke: 0.4pt + rule)
    #v(6pt)
    #text(size: 9pt, fill: ink-soft)[
      Typischerweise *#competitor-price-low – #competitor-price-high €* für
      Antragsvorbereitung. Fokus meist auf einzelne Leistung (z. B. nur
      Elterngeld). Ausdrucken erfolgt durch den Nutzer selbst.
    ]
  ],
  [
    #text(font: sans, size: 9pt, weight: "semibold", fill: accent, tracking: 1pt)[
      #upper("Lücke für Bambini")
    ]
    #v(4pt)
    #line(length: 100%, stroke: 0.4pt + rule)
    #v(6pt)
    #text(size: 9pt, fill: ink-soft)[
      Bisher fehlt die Kombination aus *kostenlosem Einstieg*,
      Zusammenfassung aller gewöhnlichen Anträge und perspektivisch
      Antragsabwicklung in einer Hand.
    ]
  ],
)


// ═══════════════════════════════════════════════════════════════════════════
// 3. LÖSUNG & PRODUKT
// ═══════════════════════════════════════════════════════════════════════════
#pagebreak()

= Lösung und Produkt

== Startumfang: Elterngeld-Self-Service

Der initiale Produktumfang ist bewusst konturiert. Bambini startet mit
Elterngeld, weil der Antrag zugleich relevant, komplex und für viele Familien
zeitkritisch ist. Der Nutzer wird durch einen strukturierten Prozess geführt
und erhält am Ende einen vorbereiteten Antrag.

#v(0.4em)

#grid(
  columns: (auto, 1fr),
  column-gutter: 18pt,
  row-gutter: 14pt,

  step(1),
  [
    *Daten erfassen* — Strukturierte Eingabe der für den Elterngeld-Antrag
    erforderlichen Informationen zu Familie, Einkommen und Elternzeit-Planung.
    Optional: KI-gestützte Hilfe bei Einzelfragen über BambiniAI.
  ],

  step(2),
  [
    *Plausibilität und Anspruch prüfen* — Hinweise auf unvollständige oder
    widersprüchliche Angaben, Berechnung des voraussichtlichen Anspruchs und
    Hinweise auf relevante Fristen.
  ],

  step(3),
  [
    *Vorbereiteten Antrag erhalten* — Bambini erzeugt das fertige
    Antragsdokument zur weiteren Verwendung durch den Nutzer. Die
    *Einreichung erfolgt in der Free-Variante durch den Nutzer selbst.* Eine
    standardisierte Einreichung bzw. Abwicklung wird ab Juli 2026 als
    kostenpflichtige Zusatzleistung angeboten.
  ],
)

#v(0.6em)

#callout(title: [BambiniAI — KI-Assistent als Differenzierung])[
  Ergänzend zum Antragsprozess steht Nutzern ein KI-gestützter Assistent zur
  Verfügung, der allgemeine Fragen zum Elterngeld beantwortet, Begriffe
  erklärt und auf benötigte Unterlagen hinweist. Damit reduziert Bambini den
  Aufwand der Nutzer noch einmal spürbar gegenüber bestehenden
  Self-Service-Angeboten.

  #v(6pt)

  *Die KI-Nutzung ist kein wesentlicher Kostentreiber:* Pro Freitextanfrage
  fallen lediglich rund *#euro(ai-cost-per-request)* an. Selbst bei intensiver
  Nutzung bleiben die KI-Kosten in einer Größenordnung, die das
  Geschäftsmodell auch im kostenfreien Einstieg tragfähig lässt.
]

#pagebreak()

== Wettbewerbspositionierung

#table(
  columns: (1.6fr, 1.2fr, 1.2fr, 1.4fr),
  align: (left, left, left, left),

  table.hline(stroke: 0.8pt + ink),
  th[Kriterium], th[Bambini], th[Private Anbieter], th[Staatliche Angebote],
  table.hline(stroke: 0.4pt + ink),

  [Elterngeld-Self-Service],
  [#text(weight: "semibold")[kostenlos]],
  [#competitor-price-low – #competitor-price-high €],
  [kostenlos, aber komplex],

  [Antragserstellung],
  [#text(fill: pos, weight: "semibold")[✓]],
  [#text(fill: pos, weight: "semibold")[✓]],
  [teilweise digital, je nach Bundesland],

  [Einreichung durch Anbieter],
  [ab Juli 2026 (#euro(premium-price))],
  [meist nicht Kernleistung],
  [—],

  [KI-Unterstützung],
  [#text(weight: "semibold")[ja (BambiniAI)]],
  [#text(fill: muted)[kaum]],
  [#text(fill: muted)[nein]],

  [Antragsverknüpfung],
  [#text(weight: "semibold")[Kindergeld, Elternzeit u. w.]],
  [meist einzelne Leistung],
  [einzelne Leistungen, getrennt],

  table.hline(stroke: 0.8pt + ink),
)

#v(0.6em)

#callout(title: [Strategischer Vorteil — Antragsverknüpfung])[
  Bambini ist nicht nur eine Vorbereitung für einen einzelnen Antrag, sondern
  *die zentrale Datenbasis der Familie*. Einmal erfasste Angaben (Identität,
  Einkommen, Familiensituation) werden über alle weiteren Antragsarten hinweg
  übernommen. Daraus entstehen besonders attraktive Kombinationsmöglichkeiten:

  #v(4pt)
  - *Elterngeld + Kindergeld:* gemeinsamer Stichtag, gemeinsame
    Einkommensgrundlage — eine Eingabe, zwei Anträge.
  - *Elternzeit + Elterngeld:* aufeinander abgestimmte Zeiträume, automatische
    Plausibilitätsprüfung.
  - *Folgeleistungen:* Kinderzuschlag, Mutterschaftsgeld u. a. profitieren
    von bereits validierten Stammdaten.

  #v(4pt)
  Wettbewerber adressieren typischerweise nur einzelne Antragsarten ohne
  Datenkontinuität. Mit der kostenlosen Variante erreicht Bambini bereits
  denselben Funktionsumfang wie kostenpflichtige Self-Service-Angebote
  (#competitor-price-low – #competitor-price-high €); Differenzierung
  entsteht zusätzlich über BambiniAI und die Antragsverknüpfung.
]


// ═══════════════════════════════════════════════════════════════════════════
// 4. GESCHÄFTSMODELL & KUNDENGEWINNUNG
// ═══════════════════════════════════════════════════════════════════════════
#pagebreak()

= Geschäftsmodell und Kundengewinnung

== Freemium-Modell mit flexibler Preisarchitektur

Bambini verfolgt zum Marktstart ein Freemium-Modell. Die Basisversion des
Elterngeld-Self-Service ist kostenlos. Die Monetarisierung erfolgt
schrittweise über optionale Zusatzleistungen.

Die Preisarchitektur bleibt bewusst flexibel. Sollte sich im Verlauf 2026
zeigen, dass die Zahlungsbereitschaft deutlich höher ist als angenommen,
kann ab Q4 2026 oder Q1 2027 die Umstellung auf ein vollständig
kostenpflichtiges Modell geprüft werden — etwa ein *Vollservice-Paket für
ca. 39 €* (inkl. Antragserstellung, KI-Begleitung und standardisierter
Einreichung) bei gleichzeitig schlankerer kostenloser Variante. Die
Entscheidung wird datenbasiert auf Grundlage des Premium-Pilots getroffen.

#v(0.4em)

#grid(
  columns: (1fr, 1fr),
  column-gutter: 18pt,
  [
    #label-text("Basis (B2C)")
    #v(6pt)
    #text(font: sans, size: 24pt, weight: "semibold", fill: ink)[0 €]
    #v(4pt)
    #text(size: 9.5pt, fill: ink-soft)[
      Elterngeld-Self-Service, vorbereiteter Antrag, begrenzter
      BambiniAI-Zugang. Einreichung durch den Nutzer. Ziel: Nutzerbasis
      aufbauen, Produkt validieren.
    ]
  ],
  [
    #label-text([Premium (ab #premium-start)])
    #v(6pt)
    #text(font: sans, size: 24pt, weight: "semibold", fill: accent)[
      #euro(premium-price)
    ]
    #v(4pt)
    #text(size: 9.5pt, fill: ink-soft)[
      Standardisierte Einreichung bzw. Abwicklung des Antrags. Bewusst eng
      definiert — *keine* individuelle Rechtsberatung. Erweitertes
      Servicepaket folgt nach Validierung.
    ]
  ],
)

#v(0.8em)

== Conversion-Annahmen Jahr 1

Jahr 1 wird als Zeitraum von zwölf Monaten ab Markteinführung verstanden
(Q2 2026 — Q1 2027). Die Wirtschaftlichkeitsplanung unterscheidet zwischen
aktiven Nutzern und zahlenden Fällen. Die kostenpflichtige Zusatzleistung
startet im *Juli 2026*; die Conversion baut sich erst danach schrittweise auf.

#v(0.4em)

#table(
  columns: (1.6fr, 1fr, 1fr, 1fr, 1fr),
  align: (left, right, right, right, right),

  table.hline(stroke: 0.8pt + ink),
  th[Kennzahl], th[Apr–Jun 26], th[Jul–Sep 26], th[Okt–Dez 26], th[Jan–Mär 27],
  table.hline(stroke: 0.4pt + ink),

  [Aktive Nutzer], [#num(active-users-q1)], [#num(active-users-q2)], [#num(active-users-q3)], [#num(active-users-q4)],
  [Conversion in Premium], [#pct(conversion-q1 * 100)], [#pct(conversion-q2 * 100)], [#pct(conversion-q3 * 100)], [#pct(conversion-q4 * 100)],
  [Zahlende Fälle], [#num(premium-users-q1)], [#num(premium-users-q2)], [#num(premium-users-q3)], [#num(premium-users-q4)],
  [Umsatz], [#euro(revenue-q1)], [#euro(revenue-q2)], [#euro(revenue-q3)], [#euro(revenue-q4)],

  table.hline(stroke: 0.8pt + ink),
)

#v(0.4em)
#text(size: 8.5pt, fill: muted, style: "italic")[
  „Aktive Nutzer" meint Nutzer, die den Elterngeld-Prozess ernsthaft
  beginnen oder abschließen, nicht bloße Website-Besucher.
  Conversion-Annahmen sind bewusst niedrig gewählt; Jahr 2 und Jahr 3 sind
  mit #pct(conversion-year2 * 100) bzw. #pct(conversion-year3 * 100)
  angesetzt, sofern der Premium-Prozess stabil läuft.
]

== Kanal-Mix

Die Kundengewinnung wird nicht auf teure bezahlte Akquisition gestützt.
Da die Basisversion kostenlos ist und Monetarisierung erst später erfolgt,
müssen Akquisitionskosten niedrig bleiben.

#v(0.4em)

#table(
  columns: (1.4fr, 2.5fr, 1.2fr),
  align: (left, left, left),

  table.hline(stroke: 0.8pt + ink),
  th[Kanal], th[Rolle], th[Kostenannahme],
  table.hline(stroke: 0.4pt + ink),

  [Partnerschaften (z. B. ARAG)],
  [Qualifizierte Nutzer aus Versicherungs- und Beratungskontexten.
   Vertrauensaufbau durch Drittpartei.],
  [niedrig / nahe 0 €],

  [SEO und Inhalte],
  [Langfristiger Aufbau über Ratgeber, FAQ und Suchanfragen zum Elterngeld.],
  [niedrig],

  [TikTok / Meta],
  [Begrenzte Tests zur Validierung von Botschaften und Zielgruppen.],
  [kontrolliertes Budget],

  [Referrals],
  [Weiterempfehlungen nach ersten positiven Nutzererfahrungen.],
  [niedrig],

  table.hline(stroke: 0.8pt + ink),
)

#v(0.6em)

#callout(title: [Akquisitionskosten — differenziert nach Free und Premium])[
  Akquisition zielt zunächst auf den *kostenlosen* Self-Service. Für Jahr 1
  wird mit durchschnittlich *#euro(acquisition-cost-per-active-user-y1) pro
  aktivem Free-Nutzer* gerechnet (Y2: #euro(acquisition-cost-per-active-user-y2),
  Y3: #euro(acquisition-cost-per-active-user-y3)) — primär getragen durch
  Partnerschaften und SEO, ergänzt durch kontrollierte Paid-Tests.

  #v(4pt)

  Die *Conversion in Premium erfolgt produktintern* (Upsell aus dem
  Free-Funnel), nicht über separate Paid-Akquisition. Eine Bewerbung der
  Premium-Variante über bezahlte Kanäle ist erst dann sinnvoll, wenn der
  durchschnittliche Lifetime-Value pro zahlender Familie durch zusätzliche
  Antragsarten und höherwertige Pakete deutlich über #euro(premium-price)
  steigt.
]


// ═══════════════════════════════════════════════════════════════════════════
// 5. WIRTSCHAFTLICHKEIT
// ═══════════════════════════════════════════════════════════════════════════
#pagebreak()

= Wirtschaftlichkeit

== Planungslogik

Die Finanzplanung folgt einem konservativen Freemium-Modell. Die
Basisversion erzeugt zunächst keine direkten Umsätze. Umsätze entstehen erst
ab Juli 2026 durch die kostenpflichtige Zusatzleistung. *Jahr 1 ist als
Validierungs- und Aufbaujahr geplant*. Aufwendungen sind bewusst großzügig
kalkuliert (inkl. Puffer für unvorhergesehene Kosten).

== Drei-Jahres-Gewinn- und Verlustrechnung

#table(
  columns: (2.5fr, auto, auto, auto),
  align: (left, right, right, right),

  table.hline(stroke: 0.8pt + ink),
  th[Position], th[Jahr 1], th[Jahr 2], th[Jahr 3],
  table.hline(stroke: 0.4pt + ink),

  [#text(weight: "semibold")[Umsatzerlöse]
   #text(size: 8pt, fill: muted)[ (#num(paid-cases-y1) / #num(paid-cases-y2) / #num(paid-cases-y3) zahl. Fälle)]],
  [#euro-compact(revenue-y1)],
  [#euro-compact(revenue-y2)],
  [#euro-compact(revenue-y3)],

  [Gründungskosten (einmalig)],
  [−#euro-compact(founding-costs-max)], [—], [—],

  [Fixkosten (Hosting, Tools, QES, Steuerberater)],
  [−#euro-compact(annual-fixed-costs-y1)],
  [−#euro-compact(annual-fixed-costs-y2)],
  [−#euro-compact(annual-fixed-costs-y3)],

  [Marketing / Akquisition],
  [−#euro-compact(marketing-y1)],
  [−#euro-compact(marketing-y2)],
  [−#euro-compact(marketing-y3)],

  [BambiniAI Tokens],
  [−#euro-compact(ai-cost-y1)],
  [−#euro-compact(ai-cost-y2)],
  [−#euro-compact(ai-cost-y3)],

  [Variable Kosten Premium-Fälle],
  [−#euro-compact(variable-costs-y1)],
  [−#euro-compact(variable-costs-y2)],
  [−#euro-compact(variable-costs-y3)],

  [Externe Beratung (Anwalt/Datenschutz, ad hoc)],
  [−#euro-compact(legal-compliance-y1)],
  [−#euro-compact(legal-compliance-y2)],
  [−#euro-compact(legal-compliance-y3)],

  [Puffer (unvorhergesehene Kosten)],
  [−#euro-compact(contingency-y1)],
  [−#euro-compact(contingency-y2)],
  [−#euro-compact(contingency-y3)],

  table.hline(stroke: 0.4pt + ink),

  [#text(weight: "semibold")[Jahresergebnis]],
  table.cell[#text(font: sans, weight: "semibold",
    fill: if result-y1 < 0 { neg } else { pos })[#signed-euro-compact(result-y1)]],
  table.cell[#text(font: sans, weight: "semibold",
    fill: if result-y2 < 0 { neg } else { pos })[#signed-euro-compact(result-y2)]],
  table.cell[#text(font: sans, weight: "semibold",
    fill: if result-y3 < 0 { neg } else { pos })[#signed-euro-compact(result-y3)]],

  [#text(weight: "semibold")[Kumuliertes Ergebnis]],
  table.cell[#text(font: sans, weight: "semibold",
    fill: if cumulative-result-y1 < 0 { neg } else { pos })[#signed-euro-compact(cumulative-result-y1)]],
  table.cell[#text(font: sans, weight: "semibold",
    fill: if cumulative-result-y2 < 0 { neg } else { pos })[#signed-euro-compact(cumulative-result-y2)]],
  table.cell[#text(font: sans, weight: "semibold",
    fill: if cumulative-result-y3 < 0 { neg } else { pos })[#signed-euro-compact(cumulative-result-y3)]],

  table.hline(stroke: 0.8pt + ink),
)

#v(0.4em)
#text(size: 8.5pt, fill: muted, style: "italic")[
  Annahmen: Keine Personalkosten (unbezahlte Gründerarbeit in der Startphase).
  Laufende Buchhaltung und Steuerberatung sind in den Fixkosten enthalten;
  die Position „Externe Beratung" umfasst nur ad-hoc-Aufwendungen für externe
  Rechtsberatung (z. B. AGB-Prüfung, Datenschutz-Review). Conversion in
  Premium baut sich von 0 % über 5 % → 8 % → #pct(conversion-q4 * 100) auf,
  J2 / J3 mit #pct(conversion-year2 * 100) / #pct(conversion-year3 * 100).
  Mehrere Antragsarten ab Y2 erhöhen die Fälle pro zahlender Familie auf
  #paid-cases-per-premium-y2 (Y2) bzw. #paid-cases-per-premium-y3 (Y3).
  KI-Kosten ca. #euro(ai-cost-per-request)/Anfrage.
]

#pagebreak()
== Fixkostenübersicht

#table(
  columns: (1fr, auto, auto),
  align: (left, right, right),

  table.hline(stroke: 0.8pt + ink),
  th[Position], th[Monatlich], th[Jährlich],
  table.hline(stroke: 0.4pt + ink),

  [Hosting (Living-Bots.net)], [#euro(cost-hosting)], [#euro(cost-hosting * 12)],
  [Supabase], [#euro(cost-supabase) (Free Tier)], [#euro(cost-supabase)],
  [Entwicklung (Tools, APIs)], [#euro(cost-dev-tools)], [#euro(cost-dev-tools * 12)],
  [QES (Signatur)], [#euro(cost-qes-monthly)], [#euro(cost-qes-monthly * 12)],
  [Buchhaltung und Steuerberater], [#euro(cost-steuerberater)], [#euro(cost-steuerberater * 12)],
  [E-Mail-Hosting], [—], [#euro(cost-email-annual)],
  [QES-Zertifikat (anteilig)], [—], [~#euro(cost-qes-annual)],

  table.hline(stroke: 0.4pt + ink),

  [#text(weight: "semibold")[Gesamt]],
  [#text(weight: "semibold")[#euro(monthly-fixed-costs)]],
  [#text(weight: "semibold")[#euro(annual-fixed-costs-y1)]],

  table.hline(stroke: 0.8pt + ink),
)

#v(0.4em)
#text(size: 8.5pt, fill: muted, style: "italic")[
  Eine Berufshaftpflichtversicherung ist für das Geschäftsmodell nicht
  erforderlich (kein Beratungsmandat). Ein externer Datenschutzbeauftragter
  ist bei < 20 Mitarbeitern gesetzlich nicht vorgeschrieben (§ 38 BDSG).
]

#pagebreak()
== Drei-Jahres-Verlauf (kumulativ)

#text(font: sans, size: 9.5pt, weight: "semibold", fill: ink)[
  Kumulativer Verlauf Umsatz, Kosten und Ergebnis (Quartale 0 – 12)
]

#v(10pt)

// Quartalsweise kumulativer Verlauf über 3 Jahre
#let q-revenue = (
  0,
  revenue-q1,
  revenue-q1 + revenue-q2,
  revenue-q1 + revenue-q2 + revenue-q3,
  revenue-y1,
  revenue-y1 + revenue-y2 / 4,
  revenue-y1 + revenue-y2 / 2,
  revenue-y1 + revenue-y2 * 3 / 4,
  revenue-y1 + revenue-y2,
  revenue-y1 + revenue-y2 + revenue-y3 / 4,
  revenue-y1 + revenue-y2 + revenue-y3 / 2,
  revenue-y1 + revenue-y2 + revenue-y3 * 3 / 4,
  revenue-y1 + revenue-y2 + revenue-y3,
)

#let q-costs = (
  founding-costs-max,
  founding-costs-max + (total-costs-y1 - founding-costs-max) / 4,
  founding-costs-max + (total-costs-y1 - founding-costs-max) / 2,
  founding-costs-max + (total-costs-y1 - founding-costs-max) * 3 / 4,
  total-costs-y1,
  total-costs-y1 + total-costs-y2 / 4,
  total-costs-y1 + total-costs-y2 / 2,
  total-costs-y1 + total-costs-y2 * 3 / 4,
  total-costs-y1 + total-costs-y2,
  total-costs-y1 + total-costs-y2 + total-costs-y3 / 4,
  total-costs-y1 + total-costs-y2 + total-costs-y3 / 2,
  total-costs-y1 + total-costs-y2 + total-costs-y3 * 3 / 4,
  total-costs-y1 + total-costs-y2 + total-costs-y3,
)

#let q-profit = (
  q-revenue.at(0) - q-costs.at(0),
  q-revenue.at(1) - q-costs.at(1),
  q-revenue.at(2) - q-costs.at(2),
  q-revenue.at(3) - q-costs.at(3),
  q-revenue.at(4) - q-costs.at(4),
  q-revenue.at(5) - q-costs.at(5),
  q-revenue.at(6) - q-costs.at(6),
  q-revenue.at(7) - q-costs.at(7),
  q-revenue.at(8) - q-costs.at(8),
  q-revenue.at(9) - q-costs.at(9),
  q-revenue.at(10) - q-costs.at(10),
  q-revenue.at(11) - q-costs.at(11),
  q-revenue.at(12) - q-costs.at(12),
)

#let quarters = (0, 3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33, 36)
#let revenue-values = q-revenue.map(v => v / 1000)
#let costs-values = q-costs.map(v => v / 1000)
#let profit-values = q-profit.map(v => v / 1000)

#show lq.selector(lq.grid): hide
#lq.diagram(
  width: 14cm,
  height: 6.5cm,
  xlabel: text(font: sans, size: 9pt)[Monat],
  ylabel: text(font: sans, size: 9pt)[Kumulativ (Tsd. €)],
  xlim: (0, 36),
  xaxis: (mirror: false),
  yaxis: (mirror: false),

  lq.plot(quarters, revenue-values,
    stroke: 1.2pt + ink,
    mark: none,
    label: text(font: sans, size: 9pt)[Umsatz]),

  lq.plot(quarters, costs-values,
    stroke: (paint: ink, thickness: 1.2pt, dash: "dashed"),
    mark: none,
    label: text(font: sans, size: 9pt)[Kosten]),

  lq.plot(quarters, profit-values,
    stroke: 1.6pt + accent,
    mark: none,
    label: text(font: sans, size: 9pt)[Ergebnis]),
)

#v(10pt)

#grid(
  columns: (1fr, 1fr, 1fr),
  column-gutter: 14pt,
  align: left,
  [
    #label-text("Kum. Ergebnis Ende Jahr 1")
    #v(4pt)
    #text(font: sans, size: 12pt,
          fill: if cumulative-result-y1 < 0 { neg } else { pos },
          weight: "semibold")[#signed-euro-compact(cumulative-result-y1)]
  ],
  [
    #label-text("Kum. Ergebnis Ende Jahr 2")
    #v(4pt)
    #text(font: sans, size: 12pt,
          fill: if cumulative-result-y2 < 0 { neg } else { pos },
          weight: "semibold")[#signed-euro-compact(cumulative-result-y2)]
  ],
  [
    #label-text("Kum. Ergebnis Ende Jahr 3")
    #v(4pt)
    #text(font: sans, size: 12pt,
          fill: if cumulative-result-y3 < 0 { neg } else { pos },
          weight: "semibold")[#signed-euro-compact(cumulative-result-y3)]
  ],
)

#v(0.8em)

== Liquiditätsplanung und Kapitalbedarf

Der optimale Finanzierungsrahmen beträgt *#euro(recommended-funding)*. Er
umfasst die GmbH-Gründung, laufende Betriebskosten, Aufwendungen für
Marketing und einen Puffer für unvorhergesehene Kosten.

#v(0.4em)

#grid(
  columns: (1fr, 1fr),
  column-gutter: 18pt,

  block(
    width: 100%,
    inset: (top: 12pt, bottom: 12pt, x: 0pt),
    stroke: (top: 0.6pt + ink, bottom: 0.4pt + rule),
  )[
    #label-text("Mindestbedarf Gründung")
    #v(4pt)
    #text(font: sans, size: 22pt, weight: "semibold", fill: ink)[
      #euro-compact(minimum-formation-need)
    ]
    #v(4pt)
    #text(size: 8.5pt, fill: muted, style: "italic")[
      Stammkapital + Gründungskosten max.
    ]
  ],

  block(
    width: 100%,
    inset: (top: 12pt, bottom: 12pt, x: 0pt),
    stroke: (top: 0.6pt + accent, bottom: 0.4pt + rule),
  )[
    #label-text("Empfohlener Finanzierungsrahmen")
    #v(4pt)
    #text(font: sans, size: 22pt, weight: "semibold", fill: accent)[
      #euro-compact(recommended-funding)
    ]
    #v(4pt)
    #text(size: 8.5pt, fill: muted, style: "italic")[
      inkl. Puffer und Marketing-Tests
    ]
  ],
)

#v(0.6em)

#table(
  columns: (2fr, auto, auto, auto),
  align: (left, right, right, right),

  table.hline(stroke: 0.8pt + ink),
  th[Liquiditätsentwicklung], th[Ende J1], th[Ende J2], th[Ende J3],
  table.hline(stroke: 0.4pt + ink),

  [Anfangsbestand (Startfinanzierung #euro-compact(recommended-funding))],
  [#euro-compact(cash-start)], [#euro-compact(cash-end-y1)], [#euro-compact(cash-end-y2)],

  [+ Umsatzerlöse],
  [#euro-compact(revenue-y1)], [#euro-compact(revenue-y2)], [#euro-compact(revenue-y3)],

  [− Gesamtkosten],
  [#euro-compact(total-costs-y1)], [#euro-compact(total-costs-y2)], [#euro-compact(total-costs-y3)],

  table.hline(stroke: 0.4pt + ink),

  [#text(weight: "semibold")[Endbestand]],
  [#text(weight: "semibold")[#euro-compact(cash-end-y1)]],
  [#text(weight: "semibold")[#euro-compact(cash-end-y2)]],
  [#text(weight: "semibold")[#euro-compact(cash-end-y3)]],

  table.hline(stroke: 0.8pt + ink),
)


#pagebreak()
== Szenario-Vergleich (Jahr 1)

#grid(
  columns: (1fr, 1fr, 1fr),
  column-gutter: 14pt,

  block(
    width: 100%,
    inset: (top: 10pt, bottom: 10pt, left: 12pt, right: 8pt),
    stroke: (left: 1.2pt + muted, rest: 0pt),
  )[
    #tag("Konservativ — 50 %", color: muted)
    #v(8pt)
    #text(size: 9pt, fill: ink-soft)[
      Aktive Nutzer: *#num(active-users-conservative)* \
      Zahlende Fälle: *#num(paid-cases-conservative)* \
      Umsatz: *#euro(revenue-conservative)* \
      Ergebnis: #text(fill: neg, weight: "semibold")[#signed-euro-compact(result-conservative)]
    ]
  ],

  block(
    width: 100%,
    inset: (top: 10pt, bottom: 10pt, left: 12pt, right: 8pt),
    stroke: (left: 1.5pt + accent, rest: 0pt),
  )[
    #tag("Basis — 100 %", color: accent)
    #v(8pt)
    #text(size: 9pt, fill: ink-soft)[
      Aktive Nutzer: *#num(active-users-year1)* \
      Zahlende Fälle: *#num(paid-cases-y1)* \
      Umsatz: *#euro(revenue-y1)* \
      Ergebnis: #text(fill: neg, weight: "semibold")[#signed-euro-compact(result-y1)]
    ]
  ],

  block(
    width: 100%,
    inset: (top: 10pt, bottom: 10pt, left: 12pt, right: 8pt),
    stroke: (left: 1.2pt + muted, rest: 0pt),
  )[
    #tag("Optimistisch — 150 %", color: muted)
    #v(8pt)
    #text(size: 9pt, fill: ink-soft)[
      Aktive Nutzer: *#num(active-users-optimistic)* \
      Zahlende Fälle: *#num(paid-cases-optimistic)* \
      Umsatz: *#euro(revenue-optimistic)* \
      Ergebnis: #text(fill: neg, weight: "semibold")[#signed-euro-compact(result-optimistic)]
    ]
  ],
)

#v(0.6em)

#text(size: 9pt, fill: muted, style: "italic")[
  Auch das optimistische Szenario zeigt in Jahr 1 noch ein negatives Ergebnis.
  Dies ist eine Konsequenz des Freemium-Ansatzes: Die wesentlichen
  Kostentreiber (Gründung, Fixkosten, Recht) sind weitgehend fix; die Erlöse
  aus #euro(premium-price)/Fall können in 6 Monaten noch keine vollständige
  Deckung erreichen. Profitabilität ist geplant ab Skalierung der
  Zusatzleistungen (Y2/Y3) sowie zusätzlichen Antragsarten und möglichen
  Partner-/B2B-Erlösen.
]

#v(0.6em)

#callout(title: [Einordnung der Wirtschaftlichkeit])[
  Der Preis von #euro(premium-price) eignet sich für eine niedrigschwellige
  Zusatzleistung, trägt allein aber kein starkes Gewinnmodell. Für eine
  höhere langfristige Wirtschaftlichkeit sind erforderlich: (a) deutlich
  höhere Nutzerzahlen, (b) zusätzliche Antragsarten (Kindergeld, Elternzeit
  ab Y2), (c) höherwertige Servicepakete und (d) Partner-/B2B-Erlöse. Diese
  Erlöse werden in der Basisplanung *bewusst nicht als garantiert* angesetzt.
]


// ═══════════════════════════════════════════════════════════════════════════
// 6. RISIKEN & SWOT-ANALYSE
// ═══════════════════════════════════════════════════════════════════════════
#pagebreak()

= Risiken und SWOT-Analyse

== SWOT-Analyse

#grid(
  columns: (1fr, 1fr),
  column-gutter: 18pt,
  row-gutter: 14pt,

  // S
  block(
    width: 100%,
    inset: (left: 14pt, right: 4pt, top: 8pt, bottom: 10pt),
    stroke: (left: 1.5pt + accent, rest: 0pt),
  )[
    #text(font: sans, size: 9pt, weight: "semibold", fill: accent, tracking: 1.2pt)[
      #upper("S — Stärken (intern)")
    ]
    #v(6pt)
    #text(size: 9pt, fill: ink-soft)[
      - Niedrige Fixkosten (#euro(monthly-fixed-costs)/Mon.) — geringes Verlustrisiko
      - Kostenloser Einstieg = Markteintritt ohne Preisbarriere
      - BambiniAI als Differenzierung (kein Wettbewerber bietet Vergleichbares)
      - OpenRouter mit Zero Data Retention — datenschutzfreundliche KI-Nutzung
      - Partnerschaften mit Privaten und öffentlichen Stakeholdern möglich
      - Juristisches + technisches + Produkt-Know-how im Team
    ]
  ],

  // W
  block(
    width: 100%,
    inset: (left: 14pt, right: 4pt, top: 8pt, bottom: 10pt),
    stroke: (left: 1.5pt + muted, rest: 0pt),
  )[
    #text(font: sans, size: 9pt, weight: "semibold", fill: muted, tracking: 1.2pt)[
      #upper("W — Schwächen (intern)")
    ]
    #v(6pt)
    #text(size: 9pt, fill: ink-soft)[
      - Kein Track Record — Neugründung ohne Markthistorie
      - Studentisches Gründerteam — begrenzte operative Erfahrung und Kapazität
      - Begrenztes Marketingbudget in der Startphase
      - Abhängigkeit von unbezahlter Gründerarbeit
      - Behörden-Integration (Premium-Versand) noch nicht produktiv
      - Geringe initiale Zahlbereitschaft typisch für Freemium-Modelle
    ]
  ],

  // O
  block(
    width: 100%,
    inset: (left: 14pt, right: 4pt, top: 8pt, bottom: 10pt),
    stroke: (left: 1.5pt + accent, rest: 0pt),
  )[
    #text(font: sans, size: 9pt, weight: "semibold", fill: accent, tracking: 1.2pt)[
      #upper("O — Chancen (extern)")
    ]
    #v(6pt)
    #text(size: 9pt, fill: ink-soft)[
      - #calc.round(non-takeup-rate * 100) % Nichtinanspruchnahme = ungenutzter Markt
      - Verwaltungsdigitalisierung durch Gesetzgeber (OZG 2.0)
      - Kein dominanter Wettbewerber im Vollservice-Segment
      - Wachsende Akzeptanz KI-gestützter Verwaltungslösungen
      - Skalierung über zusätzliche Antragsarten (Kindergeld, Elternzeit)
      - B2B-Perspektive (Corporate Employee Benefit) ab 2027
    ]
  ],

  // T
  block(
    width: 100%,
    inset: (left: 14pt, right: 4pt, top: 8pt, bottom: 10pt),
    stroke: (left: 1.5pt + muted, rest: 0pt),
  )[
    #text(font: sans, size: 9pt, weight: "semibold", fill: muted, tracking: 1.2pt)[
      #upper("T — Risiken (extern)")
    ]
    #v(6pt)
    #text(size: 9pt, fill: ink-soft)[
      - *R1* — Haftung bei fehlerhafter Berechnung / RDG
      - *R2* — Datenschutz / DSGVO bei sensiblen Daten
      - *R3* — KI-Kosten höher als geplant
      - *R4* — Conversion in Premium bleibt zu niedrig
      - *R5* — Ressourcen / Examensphase Gründerteam
      - *R6* — Regulatorische Änderungen (BEEG, OZG)
      - *R7* — Akquisitionskosten höher als geplant
    ]
  ],
)

#v(0.4em)
#text(size: 8.5pt, fill: muted, style: "italic")[
  Die folgenden Mitigation-Karten adressieren systematisch die sieben
  identifizierten Risiken (R1 – R7). Jede Karte zeigt Risikolage und
  konkrete Gegenmaßnahmen.
]

#pagebreak()
== Mitigation R1 – R3: Haftung, Datenschutz, KI-Kosten

#risk-card(
  "R1", "Haftung / RDG", "Niedrig",
  [
    Bambini ist *technisches Hilfsmittel*, keine Rechtsberatung im Sinne des
    § 2 Abs. 1 RDG. Berechnungen sind rein rechnerisch, ohne individuelle
    rechtliche Würdigung. Nutzer bestätigen ihre Angaben vor Versand und
    behalten die Eigenverantwortung. BambiniAI gibt nur allgemeine
    Orientierung. Haftung ist in den AGB auf Vorsatz und grobe Fahrlässigkeit
    beschränkt (§ 309 Nr. 7 BGB-konform). Der Premium-Prozess bleibt bewusst
    standardisiert; eine Ausweitung der Service-Tiefe erfolgt erst nach
    erneuter rechtlicher Prüfung.
  ],
)

#risk-card(
  "R2", "Datenschutz / DSGVO", "Niedrig – Mittel",
  [
    Kerndaten verbleiben im EWR (Supabase Frankfurt, Living-Bots Bremen).
    Datenminimierung, klare Zweckbindung und Löschkonzept sind Teil des
    Produkts. KI-Anfragen laufen über OpenRouter mit Zero Data Retention. Ein
    externer Datenschutzbeauftragter ist bei < 20 MA gesetzlich nicht
    erforderlich (§ 38 BDSG). Datenschutzerklärung und AGB sind erstellt und
    veröffentlicht.
  ],
)

#risk-card(
  "R3", "KI-Kosten", "Niedrig",
  [
    Pro Freitextanfrage fallen lediglich rund *#euro(ai-cost-per-request)* an
    — KI-Nutzung ist damit *kein wesentlicher finanzieller Risikofaktor*.
    Zusätzlich greift FAQ-first (Standardfragen ohne Modellaufruf),
    Nutzungslimits, Tages- und Nutzerbudgets sowie eine Anbieter-/Modell-
    Whitelist via OpenRouter. Anomalie-Monitoring sichert das Modell
    zusätzlich gegen Missbrauch ab.
  ],
)

== Mitigation R4 – R7: Monetarisierung, Ressourcen, Markt

#risk-card(
  "R4", "Conversion zu niedrig", "Mittel",
  [
    Premium-Pilot ab Juli 2026 mit echter Nutzungsmessung. Preis-/
    Leistungstests. Schrittweise Ergänzung zusätzlicher Antragsarten zur
    Erhöhung der Fälle pro Premium-Nutzer (#paid-cases-per-premium-y1 →
    #paid-cases-per-premium-y2 → #paid-cases-per-premium-y3). Pivot-Optionen:
    höherwertige Servicepakete oder White-Label-Lösung.
  ],
)

#risk-card(
  "R5", "Ressourcen / Examen", "Mittel",
  [
    Schwerpunktstudium und Staatsexamensvorbereitung reduzieren
    Verfügbarkeit. Gegenmaßnahmen: enger MVP-Fokus auf Elterngeld,
    phasenweiser Ausbau, Priorisierung von Partnerschaften, Möglichkeit der
    Auslagerung an Werkstudierende oder Freelancer, *reduziertes
    Ausbauszenario* falls Verfügbarkeit unter Plan.
  ],
)

#risk-card(
  "R6", "Regulatorik (BEEG / OZG)", "Niedrig",
  [
    Modulare Architektur ermöglicht schnelle Anpassung an Gesetzesänderungen.
    OZG 2.0 ist zugleich *Chance*: Digitale Behördenschnittstellen
    begünstigen das Geschäftsmodell. Regelmäßige rechtliche Prüfung;
    begrenzter Leistungsumfang zum Start reduziert Anpassungslast.
  ],
)

#risk-card(
  "R7", "Akquisition / CAC", "Mittel",
  [
    Das *kostenlose Angebot* selbst wirkt als Akquisitionshebel: niedrige
    Einstiegshürde, organische Reichweite, Aufbau einer belastbaren
    Nutzerbasis ohne hohe Paid-Investitionen. Ergänzend diversifizierter Mix
    aus *Partnerschaften* (z. B. ARAG), SEO, Referrals und kontrollierten
    Paid-Tests. Bei steigenden Paid-Kosten Verlagerung auf organische und
    partnerschaftliche Kanäle. Kein hartes Wachstumsversprechen aus einzelnem
    Kanal.
  ],
)


// ═══════════════════════════════════════════════════════════════════════════
// 7. TEAM & ROADMAP
// ═══════════════════════════════════════════════════════════════════════════
#pagebreak()

= Team und Roadmap

== Gründerteam

#text(font: sans, size: 10pt, weight: "semibold", fill: ink)[
  Studierende der Bucerius Law School, Hamburg
]

#v(0.4em)

Entstanden im Rahmen des Hamburg Legal Hackathon 2025 (Motto: „Access to
Justice"). Das Team verbindet juristisches Verständnis, Produktarbeit und
technische Umsetzung — eine für ein Produkt im Bereich digitaler
Verwaltungszugang wesentliche Kombination.

#v(0.6em)

#figure(
  image("Teambild.jpg", width: 65%),
  caption: text(font: sans, size: 8pt, fill: muted)[
    Mika Tomii, Michaela Idawain, Milan Kohlhaase, Jakob Große-Eggebrecht
    und Merit Lachmann
  ],
  numbering: none,
)

#v(0.4em)

== Roadmap (Phasen, 3-Jahres-Überblick)

Die Roadmap ist bewusst phasenweise angelegt. Vorrang hat zunächst die
Stabilisierung des Elterngeld-Prozesses. Erst danach werden weitere
Antragsarten und zusätzliche Serviceleistungen ergänzt. Damit reduziert
Bambini technische, rechtliche und operative Risiken in der Startphase.

#v(0.6em)

#line(length: 100%, stroke: 0.6pt + ink)
#v(8pt)

#phase(
  "H1 2026",
  [GmbH-Gründung und Marktstart (Free)],
  [
    Elterngeld-MVP live · erste aktive Nutzer · Aufbau der initialen
    Nutzerbasis über Partnerschaften und SEO.
  ],
  [Ziel: ~#num(active-users-q1 + active-users-q2) aktive Nutzer · Umsatz: #euro(revenue-q1 + revenue-q2)],
)

#phase(
  "H2 2026",
  [Premium-Pilot und Stabilisierung],
  [
    Premium-Zusatzleistung (#euro(premium-price)) ab Juli 2026 ·
    standardisierte Antragseinreichung · Conversion-Messung ·
    Produktstabilisierung · erste belastbare Monetarisierungsdaten.
  ],
  [Ziel: ~#num(active-users-q3 + active-users-q4) weitere aktive Nutzer · Jahresumsatz: #euro-compact(revenue-y1)],
)

#phase(
  "2027",
  [Erweiterung Antragsarten und Skalierung],
  [
    Kindergeld und Elternzeit nach Stabilisierung von Elterngeld · weitere
    Partnerkanäle (Versicherer, Krankenkassen, Hebammen) · höherwertige
    Servicepakete in Prüfung.
  ],
  [Ziel: ~#num(active-users-year2) aktive Nutzer · Umsatz: #euro-compact(revenue-y2)],
)

#phase(
  "2028+",
  [Plattformausbau und B2B-Perspektive],
  [
    Weitere Familienleistungen (Kinderzuschlag, Mutterschaftsgeld) ·
    Corporate-Benefit-Angebote für Arbeitgeber als zusätzliche
    Wachstumsdimension · API-Behördenanbindung sofern verfügbar · höhere
    Service-Tiefe nach erneuter rechtlicher Prüfung.
  ],
  [Ziel: ~#num(active-users-year3) aktive Nutzer · Umsatz: #euro-compact(revenue-y3)],
)


// ═══════════════════════════════════════════════════════════════════════════
// 8. AUSBLICK
// ═══════════════════════════════════════════════════════════════════════════
#pagebreak()

= Ausblick

Bambini soll zunächst nicht durch Breite, sondern durch *Verlässlichkeit im
Kernprozess* überzeugen. Der erste Schwerpunkt liegt auf Elterngeld, weil
hier Komplexität, Bedarf und zeitliche Relevanz zusammenkommen. Aus dieser
Basis kann das Produkt in zwei Richtungen wachsen: weitere Leistungsarten
(horizontal) und höhere Service-Tiefe (vertikal).

#v(0.6em)

#table(
  columns: (auto, 1fr, 1fr),
  align: (left + horizon, left + horizon, left + horizon),

  table.hline(stroke: 0.8pt + ink),
  th[Zeitraum], th[Horizontale Skalierung], th[Vertikale Skalierung],
  table.hline(stroke: 0.4pt + ink),

  [#text(font: sans, weight: "semibold", fill: accent)[Aktuell]],
  [Elterngeld-Self-Service],
  [Antragserstellung (Free)],

  [#text(font: sans, weight: "semibold", fill: accent)[H2 2026]],
  [— (Fokus bleibt Elterngeld)],
  [+ Standardisierte Einreichung als Zusatzleistung (#euro(premium-price))],

  [#text(font: sans, weight: "semibold", fill: accent)[2027]],
  [+ Kindergeld, Elternzeit],
  [+ Höherwertige Servicepakete (nach rechtlicher Prüfung)],

  [#text(font: sans, weight: "semibold", fill: accent)[2028+]],
  [+ Kinderzuschlag, Mutterschaftsgeld],
  [+ B2B (Corporate Benefit), API-Behördenanbindung],

  table.hline(stroke: 0.8pt + ink),
)

#v(0.8em)

== Kernaussage

#callout-soft(title: [Was Bambini ist — und was Bambini bewusst nicht ist])[
  Bambini startet *fokussiert und konservativ*: kostenloser
  Elterngeld-Self-Service, als höherwertige Alternative zu Wettbewerbern.
  Im Anschluss findet eine monetarisierbare, kontrollierte Skalierung statt.

  #v(6pt)

  Der Plan setzt *nicht* auf sofortige Profitabilität, sondern auf
  *validiertes Nutzerwachstum, niedrige Fixkosten und einen schrittweisen
  Ausbau*. Jahr 1 ist als Validierungsjahr geplant; Profitabilität ist erst
  ab Skalierung der Zusatzleistungen, weiterer Antragsarten und möglicher
  Partner-/B2B-Erlöse vorgesehen.
]

#v(2em)

#align(center)[
  #line(length: 60pt, stroke: 0.6pt + ink)
  #v(8pt)
  #text(font: sans, size: 8pt, fill: muted, tracking: 1.5pt)[
    #upper("Kontakt  ·  info@bambini-claims.de  ·  bambini-claims.de  ·  Stand: Mai 2026")
  ]
]
