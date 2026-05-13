// Bambini Business Plan V4 - Iteration 4
// V2-Visualdesign + V3-Inhalt (Freemium, OpenRouter ZDR, konservative GuV)
// Adressiert vollständig die Meeting-Kritik vom 06.05.2026 (Sebastian / Just Perta)

#import "@preview/cetz:0.3.1": canvas, draw
#import "@preview/lilaq:0.4.0" as lq

#set document(
  title: "Bambini Business Plan 2026-2028",
  author: "Bambini GmbH (i.Gr.)",
)

// ═══════════════════════════════════════════════════════════════════════════
// ZENTRALE VARIABLEN
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

// Quartalslogik: Q1 = Apr-Jun 2026 (laufend), Q2 = Jul-Sep 2026 (Premium-Start),
// Q3 = Okt-Dez 2026, Q4 = Jan-Mär 2027 - Year 1 = 12 Monate ab Launch
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

// Mittelfristig: zusätzliche Antragsarten erhöhen Fälle pro zahlender Familie
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
// Annahmen Free-Akquisition (kostenfreier Self-Service): SEO + Partnerschaften +
// kontrollierte Paid-Tests. Premium-Conversion erfolgt produktintern, nicht über
// separate Paid-Akquisition.
#let acquisition-cost-per-active-user-y1 = 2.00
#let acquisition-cost-per-active-user-y2 = 1.50
#let acquisition-cost-per-active-user-y3 = 1.00
#let marketing-y1 = active-users-year1 * acquisition-cost-per-active-user-y1
#let marketing-y2 = active-users-year2 * acquisition-cost-per-active-user-y2
#let marketing-y3 = active-users-year3 * acquisition-cost-per-active-user-y3

// ─── KI-Kosten (OpenRouter, Zero Data Retention) ─────────────────────────────
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

// ─── Externe Beratung (ad hoc) / Puffer ─────────────────────────────────────
// Hinweis: Laufende Buchhaltung & Steuerberater sind in den Fixkosten enthalten.
// Hier nur ad-hoc-Aufwendungen für externe Rechtsberatung (Anwalt, AGB-Prüfung).
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

// Vereinfachte Szenarienergebnisse: variable Anteile skalieren mit Nutzerzahl,
// Fixkosten und Gründung bleiben konstant.
#let result-conservative = revenue-conservative - founding-costs-max - annual-fixed-costs-y1 - (marketing-y1 * scenario-conservative-factor) - (ai-cost-y1 * scenario-conservative-factor) - (variable-costs-y1 * scenario-conservative-factor) - legal-compliance-y1 - contingency-y1
#let result-optimistic = revenue-optimistic - founding-costs-max - annual-fixed-costs-y1 - (marketing-y1 * scenario-optimistic-factor) - (ai-cost-y1 * scenario-optimistic-factor) - (variable-costs-y1 * scenario-optimistic-factor) - legal-compliance-y1 - contingency-y1


// ═══════════════════════════════════════════════════════════════════════════
// FORMATIERUNGSFUNKTIONEN
// ═══════════════════════════════════════════════════════════════════════════

#let intfmt(value) = {
  if value < 0 {
    "-" + intfmt(-value)
  } else {
    let rounded = calc.round(value)
    if rounded >= 1000 {
      let thousands = calc.floor(rounded / 1000)
      let remainder = calc.rem(rounded, 1000)
      let remainder-str = str(remainder)
      while remainder-str.len() < 3 {
        remainder-str = "0" + remainder-str
      }
      str(thousands) + "." + remainder-str
    } else {
      str(rounded)
    }
  }
}

#let euro(value) = {
  if value < 0 {
    "-" + euro(-value)
  } else if value >= 1000000 {
    str(calc.round(value / 1000000, digits: 1)).replace(".", ",") + " Mio. €"
  } else if value >= 1000 {
    intfmt(value) + " €"
  } else if value == calc.floor(value) {
    str(calc.round(value)) + " €"
  } else {
    str(calc.round(value, digits: 2)).replace(".", ",") + " €"
  }
}

#let euro-compact(value) = {
  if value < 0 {
    "-" + euro-compact(-value)
  } else if value >= 1000 {
    str(calc.round(value / 1000, digits: 1)).replace(".", ",") + "k €"
  } else {
    euro(value)
  }
}

#let signed-euro-compact(value) = {
  if value > 0 {
    "+" + euro-compact(value)
  } else if value < 0 {
    euro-compact(value)
  } else {
    euro-compact(0)
  }
}

#let pct(value) = str(calc.round(value, digits: 1)).replace(".", ",") + "%"

#let num(value) = {
  if value >= 1000000 {
    str(calc.round(value / 1000000, digits: 2)) + " Mio."
  } else if value >= 1000 {
    intfmt(value)
  } else {
    str(calc.round(value))
  }
}


// ═══════════════════════════════════════════════════════════════════════════
// FARBPALETTE (übernommen aus V2)
// ═══════════════════════════════════════════════════════════════════════════

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


// ═══════════════════════════════════════════════════════════════════════════
// PAGE SETUP
// ═══════════════════════════════════════════════════════════════════════════

#set page(
  paper: "a4",
  margin: (x: 2.2cm, y: 2.5cm),
  header: context {
    if counter(page).get().first() > 2 [
      #set text(size: 8.5pt, fill: muted, tracking: 0.5pt)
      #grid(
        columns: (1fr, 1fr),
        align: (left, right),
        [BAMBINI BUSINESS PLAN], [MAI 2026],
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


// ═══════════════════════════════════════════════════════════════════════════
// CUSTOM COMPONENTS (übernommen aus V2)
// ═══════════════════════════════════════════════════════════════════════════

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

#let metric-row(label, value) = {
  grid(
    columns: (1fr, auto),
    align: (left + horizon, right + horizon),
    [#text(fill: muted)[#label] #box(width: 1fr, repeat[#text(fill: rgb("#E2E8F0"))[.]])],
    text(weight: "bold", fill: dark)[#value],
  )
  v(6pt)
}

#let badge(content, color: primary) = {
  box(
    fill: color,
    inset: (x: 10pt, y: 5pt),
    radius: 12pt,
  )[#text(fill: white, weight: "bold", size: 8.5pt, tracking: 0.3pt)[#content]]
}

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

#let risk-card(title, level, level-color, description) = {
  box(
    fill: white,
    inset: 14pt,
    radius: 8pt,
    width: 100%,
    stroke: (left: 4pt + level-color, rest: 1pt + surface),
  )[
    #grid(
      columns: (1fr, auto),
      [*#title*], badge(level, color: level-color),
    )
    #v(6pt)
    #text(size: 9pt, fill: muted)[#description]
  ]
}


// ═══════════════════════════════════════════════════════════════════════════
// COVER PAGE
// ═══════════════════════════════════════════════════════════════════════════

#page(header: none, footer: none, margin: 0pt)[
  #block(width: 100%, height: 6pt, fill: gradient.linear(primary, accent))

  #v(1fr)

  #align(center)[
    #block(width: 80pt, height: 3pt, fill: gradient.linear(primary, accent), radius: 2pt)
    #v(1.2cm)

    #image("bambini-logo.png", width: 250pt)

    #v(0.5cm)

    #text(size: 13pt, fill: muted, tracking: 1pt, weight: "medium")[
      KOSTENLOSER ELTERNGELD-SELF-SERVICE MIT KI-UNTERSTÜTZUNG
    ]

    #v(3cm)

    #grid(
      columns: (1fr, auto, 1fr),
      align: (right + horizon, center + horizon, left + horizon),
      column-gutter: 12pt,
      line(length: 80pt, stroke: 1pt + surface),
      box(width: 8pt, height: 8pt, fill: primary, radius: 50%),
      line(length: 80pt, stroke: 1pt + surface),
    )

    #v(3cm)

    #text(size: 32pt, weight: "bold", fill: dark, tracking: -0.5pt)[Business Plan]

    #v(0.4cm)

    #text(size: 12pt, fill: muted)[
      Geschäftsplan 2026-2028 · GmbH-Gründung & Wachstumsfinanzierung
    ]

    #v(3cm)

    #grid(
      columns: (auto, auto, auto),
      column-gutter: 10pt,
      badge("Mai 2026", color: primary),
      badge("Iteration 4", color: accent),
      badge("Vorgründungsgesellschaft", color: info),
    )
  ]

  #v(1fr)

  #block(width: 100%, height: 6pt, fill: gradient.linear(accent, primary))
]


// ═══════════════════════════════════════════════════════════════════════════
// TABLE OF CONTENTS
// ═══════════════════════════════════════════════════════════════════════════

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


// ═══════════════════════════════════════════════════════════════════════════
// 1. EXECUTIVE SUMMARY
// ═══════════════════════════════════════════════════════════════════════════

= Executive Summary // an sich ein sehr guter text den ich auch so übernehmen würde hier oben aber ggf. bereits auch wirtschaftliche prognosen aufnehmen

#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  column-gutter: 10pt,
  stat-card([0 €], "Basisversion", color: primary),
  stat-card([#euro(premium-price)], "Premium ab Juli 2026", color: accent),
  stat-card([#num(active-users-year1)], "aktive Nutzer Jahr 1", color: info),
  stat-card(euro-compact(recommended-funding), "Finanzierungsrahmen", color: success),
)

#v(1em)

*Bambini* entwickelt eine digitale Unterstützung für Eltern bei der Beantragung von *Elterngeld*. Der Marktstart erfolgt mit einem kostenlosen Self-Service: Nutzer werden strukturiert durch die erforderlichen Angaben geführt und erhalten einen vorbereiteten Antrag. Die Einreichung erfolgt in der kostenlosen Variante zunächst durch den Nutzer selbst.

Der kostenlose Einstieg ist eine bewusste strategische Entscheidung. Bestehende Anbieter verlangen für vergleichbare Self-Service-Angebote typischerweise *#competitor-price-low - #competitor-price-high €*. Bambini bietet diesen Grundnutzen kostenlos an, um die Einstiegshürde zu senken, eine Nutzerbasis aufzubauen und den Prozess anhand realer Anwendungsfälle zu validieren. Differenzierung entsteht zusätzlich über *BambiniAI* - einen KI-gestützten Assistenten, der in dieser Form bislang von keinem Wettbewerber angeboten wird.

#v(0.5em)

#grid(
  columns: (1fr, 1fr),
  column-gutter: 12pt,
  highlight-box(title: [Startprodukt], color: primary)[
    Kostenloser Elterngeld-Self-Service mit strukturierter Datenerfassung, Plausibilitätsprüfung, Antragserstellung und begrenztem Zugang zu BambiniAI.
  ],
  highlight-box(title: [Monetarisierung], color: accent)[
    Ab #premium-start wird eine standardisierte Antragseinreichung bzw. Abwicklung für #euro(premium-price) pro Fall getestet. Weitere Antragsarten (Kindergeld, Elternzeit) folgen erst nach Validierung des Elterngeld-Prozesses. // hier noch eindeutiger formulieren was wir verkaufen
  ],
)

#v(0.6em)
#pagebreak()
=== Eckdaten & wirtschaftliche Prognose

#grid(
  columns: (1fr, 1fr),
  column-gutter: 12pt,
  box(fill: light-bg, inset: 14pt, radius: 8pt, width: 100%)[
    #text(weight: "bold", size: 9pt, fill: muted, tracking: 0.5pt)[#upper("Markt & Kapital")]
    #v(8pt)
    #metric-row([Serviceable Market], [*~#num(serviceable-market) Fam./Jahr*])
    #metric-row([Aktive Nutzer Jahr 1], [*#num(active-users-year1)*])
    #metric-row([Zahlende Fälle Jahr 1], [*~#num(paid-cases-y1)*])
    #metric-row([Mindestbedarf Gründung], [*#euro-compact(minimum-formation-need)*])
    #metric-row([Finanzierungsrahmen], [*#euro-compact(recommended-funding)*])
  ],
  box(fill: light-bg, inset: 14pt, radius: 8pt, width: 100%)[
    #text(weight: "bold", size: 9pt, fill: muted, tracking: 0.5pt)[#upper("Drei-Jahres-Prognose")]
    #v(8pt)
    #table(
      columns: (1fr, auto, auto),
      stroke: none,
      inset: 4pt,
      align: (left, right, right),
      [], [*Umsatz*], [*Ergebnis*],
      table.hline(stroke: 0.5pt + surface),
      [Jahr 1], [#euro-compact(revenue-y1)], text(fill: if result-y1 < 0 { danger } else { success }, weight: "bold")[#signed-euro-compact(result-y1)],
      [Jahr 2], [#euro-compact(revenue-y2)], text(fill: if result-y2 < 0 { danger } else { success }, weight: "bold")[#signed-euro-compact(result-y2)],
      [Jahr 3], [#euro-compact(revenue-y3)], text(fill: if result-y3 < 0 { danger } else { success }, weight: "bold")[#signed-euro-compact(result-y3)],
    )
    #v(4pt)
    #text(size: 8pt, fill: muted)[Konservatives Basisszenario. Profitabilität geplant ab Skalierung weiterer Antragsarten.]
  ],
)

#v(0.6em)

Die wirtschaftliche Planung versteht *das erste Geschäftsjahr als Validierungs- und Aufbaujahr*. Umsätze entstehen erst ab Juli 2026 durch die kostenpflichtige Zusatzleistung. Die Validierungsphase dient zugleich dem Aufbau verlässlicher Kontakte zu den zuständigen Elterngeldstellen und der Sicherung der Behördenakzeptanz für die spätere standardisierte Antragseinreichung. Profitabilität ist geplant ab Skalierung der Zusatzleistungen, weiterer Antragsarten (Kindergeld, Elternzeit ab 2027) sowie aus Partner- und B2B-Erlösen (z. B. Corporate Benefit ab 2027).

// ═══════════════════════════════════════════════════════════════════════════
// 2. AUSGANGSSITUATION & PROBLEMSTELLUNG
// ═══════════════════════════════════════════════════════════════════════════
#pagebreak()

= Ausgangssituation & Problemstellung

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

Deutschland verfügt über eines der umfangreichsten Systeme für Familienleistungen weltweit. Die tatsächliche Inanspruchnahme liegt deutlich unter dem Anspruchsniveau. Insbesondere der Elterngeld-Antrag ist für viele Familien schwer verständlich: zahlreiche unterschiedliche Lebenssachverhalte, umfangreiche Nachweispflichten, unterschiedliche Zuständigkeiten der Länder und Folgen fehlerhafter Angaben oder verpasster Fristen führen dazu, dass Ansprüche nicht oder nicht vollständig realisiert werden.

#v(0.3em)

#box(
  fill: light-bg,
  inset: 14pt,
  radius: 8pt,
  width: 100%,
  stroke: (left: 3pt + primary-light),
)[
  _"Das Antragsformular ist extrem kompliziert, wenig bürgerfreundlich und nicht barrierefrei."_
  #h(1fr)
  #text(fill: muted, size: 9pt)[- Hannover.de, Offizielle Stadtwebsite]
]

== Marktgröße & Zielgruppen

#grid(
  columns: (1fr, 1fr),
  column-gutter: 15pt,
  box(
    fill: light-bg,
    inset: 18pt,
    radius: 10pt,
    width: 100%,
    stroke: (bottom: 4pt + primary),
  )[
    #align(center)[
      #text(size: 9pt, fill: muted, tracking: 0.5pt, weight: "medium")[GEBURTEN PRO JAHR (TAM)]
      #v(4pt)
      #text(size: 36pt, weight: "bold", fill: dark)[#num(births-per-year)]
      #v(4pt)
      #text(size: 9pt, fill: muted)[in Deutschland]
    ]
  ],
  box(
    fill: primary.lighten(93%),
    inset: 18pt,
    radius: 10pt,
    width: 100%,
    stroke: (bottom: 4pt + primary),
  )[
    #align(center)[
      #text(size: 9pt, fill: muted, tracking: 0.5pt, weight: "medium")[SERVICEABLE MARKET (SAM)]
      #v(4pt)
      #text(size: 36pt, weight: "bold", fill: primary)[~#num(serviceable-market)]
      #v(4pt)
      #text(size: 9pt, fill: muted)[Familien/Jahr (~45%)]
    ]
  ],
)

#v(0.5em)

*Primäre Zielgruppen:* Berufstätige Eltern mit begrenzter Zeit für die Antragstellung, Eltern mit komplexeren Einkommenssituationen sowie Familien mit Sprach- oder Verständnishürden, die überproportional von der Antrags-Komplexität betroffen sind. Hinzu kommen Nutzer aus Partnerkanälen, die eine niedrigschwellige digitale Unterstützung erwarten.

== Marktanalyse & Wettbewerbsumfeld

Der Markt ist nicht gänzlich unerschlossen, aber fragmentiert. Drei Anbietergruppen prägen das Bild: *staatliche Angebote* (kostenlos, jedoch komplex und nach Bundesländern fragmentiert), *private Self-Service-Anbieter* (typischerweise #competitor-price-low – #competitor-price-high €, meist auf eine einzelne Leistung beschränkt) sowie eine bislang unbesetzte Lücke für ein integriertes, kostenloses Angebot.

#v(0.3em)

Bambini setzt genau dort an: ein *kostenloser Elterngeld-Self-Service*, der Antragserstellung, KI-gestützte Hilfe und perspektivisch die Verknüpfung weiterer Familienleistungen (Kindergeld, Elternzeit) in einer durchgängigen Nutzerführung bündelt. Eine detaillierte Gegenüberstellung der Leistungsmerkmale folgt in Abschnitt 3 (Wettbewerbspositionierung).


// ═══════════════════════════════════════════════════════════════════════════
// 3. LÖSUNG & PRODUKT
// ═══════════════════════════════════════════════════════════════════════════
#pagebreak()

= Lösung & Produkt

== Startumfang: Elterngeld-Self-Service

Der initiale Produktumfang ist bewusst konturiert. Bambini startet mit Elterngeld, weil der Antrag zugleich relevant, komplex und für viele Familien zeitkritisch ist. Der Nutzer wird durch einen strukturierten Prozess geführt und erhält am Ende einen vorbereiteten Antrag.

#v(0.3em)

#box(
  fill: primary.lighten(96%),
  inset: 18pt,
  radius: 10pt,
  width: 100%,
  stroke: 1pt + primary.lighten(80%),
)[
  #grid(
    columns: (auto, 1fr),
    column-gutter: 15pt,
    row-gutter: 16pt,

    step-number(1),
    [
      *Daten erfassen* - Strukturierte Eingabe der für den Elterngeld-Antrag erforderlichen Informationen zu Familie, Einkommen und Elternzeit-Planung. Optional: KI-gestützte Hilfe bei Einzelfragen über BambiniAI.
    ],

    step-number(2),
    [
      *Plausibilität & Anspruch prüfen* - Hinweise auf unvollständige oder widersprüchliche Angaben, Berechnung des voraussichtlichen Anspruchs und Hinweise auf relevante Fristen.
    ],

    step-number(3),
    [
      *Vorbereiteten Antrag erhalten* - Bambini erzeugt das fertige Antragsdokument zur weiteren Verwendung durch den Nutzer. Die *Einreichung erfolgt in der Free-Variante durch den Nutzer selbst.* Eine standardisierte Einreichung bzw. Abwicklung wird ab Juli 2026 als kostenpflichtige Zusatzleistung angeboten.
    ],
  )
]

#v(0.5em)

#highlight-box(color: info, title: [BambiniAI - KI-Assistent als Differenzierung])[
  Ergänzend zum Antragsprozess steht Nutzern ein KI-gestützter Assistent zur Verfügung, der allgemeine Fragen zum Elterngeld beantwortet, Begriffe erklärt und auf benötigte Unterlagen hinweist. Damit reduziert Bambini den Aufwand der Nutzer noch einmal spürbar gegenüber bestehenden Self-Service-Angeboten.

  #v(6pt)

  *Die KI-Nutzung ist kein wesentlicher Kostentreiber:* Pro Freitextanfrage fallen lediglich rund *#euro(ai-cost-per-request)* an. Selbst bei intensiver Nutzung bleiben die KI-Kosten in einer Größenordnung, die das Geschäftsmodell auch im kostenfreien Einstieg tragfähig lässt.
]
#pagebreak()
== Wettbewerbspositionierung

#table(
  columns: (1.6fr, 1.4fr, 1.4fr, 1.4fr),
  fill: (x, y) => if y == 0 { primary.lighten(88%) } else if calc.odd(y) { light-bg } else { white },
  stroke: 0.5pt + surface,
  inset: 10pt,

  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Kriterium]],
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Bambini-Claims]],
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Private Anbieter]],
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Staatliche Angebote]],

  [Elterngeld-Self-Service],
  [*kostenlos*],
  [#competitor-price-low - #competitor-price-high €],
  [kostenlos, aber komplex],

  [Antragserstellung],
  [#text(fill: success, weight: "bold")[✓]],
  [#text(fill: success, weight: "bold")[✓]],
  [teilweise digital, je nach Bundesland],

  [Einreichung durch Anbieter],
  [geplant ab Juli 2026 (#euro(premium-price))],
  [meist nicht Kernleistung],
  [nicht anwendbar],

  [KI-Unterstützung],
  [*ja (BambiniAI)*],
  [#text(fill: danger)[kaum]],
  [#text(fill: danger)[nein]],

  [Weitere Antragsarten *verknüpft*],
  [*Kindergeld, Elternzeit u. w. - mit Datenübernahme*],
  [meist einzelne Leistung],
  [einzelne Leistungen, getrennt],
)

#v(0.4em)

#text(size: 9pt, fill: muted, style: "italic")[
  Hinweis: Die in der Tabelle aufgeführten Leistungsmerkmale sind technisch weitgehend fertiggestellt. Der vollständige Live-Gang einzelner Bestandteile — insbesondere die kostenpflichtige standardisierte Einreichung — erfolgt erst nach Abschluss der Validierungsphase und der Abstimmung mit den zuständigen Behörden.
]

#v(0.4em)

#highlight-box(color: primary, title: [Strategischer Vorteil: Antragsverknüpfung])[
  Bambini ist nicht nur eine Vorbereitung für einen einzelnen Antrag, sondern *die zentrale Datenbasis der Familie*. Einmal erfasste Angaben (Identität, Einkommen, Familiensituation) werden über alle weiteren Antragsarten hinweg übernommen. Daraus entstehen besonders attraktive Kombinationsmöglichkeiten:

  #v(4pt)
  - *Elterngeld + Kindergeld:* gemeinsamer Stichtag, gemeinsame Einkommensgrundlage - eine Eingabe, zwei Anträge.
  - *Elternzeit + Elterngeld:* aufeinander abgestimmte Zeiträume, automatische Plausibilitätsprüfung.
  - *Folgeleistungen:* Kinderzuschlag, Mutterschaftsgeld u. a. profitieren von bereits validierten Stammdaten.

  #v(4pt)
  Wettbewerber adressieren typischerweise nur einzelne Antragsarten ohne Datenkontinuität. Mit der kostenlosen Variante erreicht Bambini bereits denselben Funktionsumfang wie kostenpflichtige Self-Service-Angebote (#competitor-price-low - #competitor-price-high €); Differenzierung entsteht zusätzlich über BambiniAI und die Antragsverknüpfung.
]


// ═══════════════════════════════════════════════════════════════════════════
// 4. GESCHÄFTSMODELL & KUNDENGEWINNUNG
// ═══════════════════════════════════════════════════════════════════════════
#pagebreak()

= Geschäftsmodell & Kundengewinnung

== Freemium-Modell mit flexibler Preisarchitektur

Bambini verfolgt zum Marktstart ein Freemium-Modell. Die Basisversion des Elterngeld-Self-Service ist kostenlos. Die Monetarisierung erfolgt schrittweise über optionale Zusatzleistungen.

Die Preisarchitektur bleibt bewusst flexibel. Sollte sich im Verlauf 2026 zeigen, dass die Zahlungsbereitschaft deutlich höher ist als angenommen, kann ab Q4 2026 oder Q1 2027 die Umstellung auf ein vollständig kostenpflichtiges Modell geprüft werden - etwa ein *Vollservice-Paket für ca. 39 €* (inkl. Antragserstellung, KI-Begleitung und standardisierter Einreichung) bei gleichzeitig schlankerer kostenloser Variante. Die Entscheidung wird datenbasiert auf Grundlage des Premium-Pilots getroffen.

#v(0.1em)

#grid(
  columns: (1fr, 1fr),
  column-gutter: 15pt,
  box(fill: light-bg, inset: 16pt, radius: 8pt, width: 100%, stroke: (top: 3pt + primary, rest: 1pt + surface))[
    #text(weight: "bold", fill: dark)[Basis (B2C)]
    #v(6pt)
    #text(size: 28pt, weight: "bold", fill: primary)[0 €]
    #v(2pt)
    Elterngeld-Self-Service, vorbereiteter Antrag, begrenzter BambiniAI-Zugang. Einreichung durch den Nutzer. Ziel: Nutzerbasis aufbauen, Produkt validieren.
  ],
  box(fill: light-bg, inset: 16pt, radius: 8pt, width: 100%, stroke: (top: 3pt + accent, rest: 1pt + surface))[
    #text(weight: "bold", fill: dark)[Premium (ab #premium-start)]
    #v(6pt)
    #text(size: 28pt, weight: "bold", fill: accent)[#euro(premium-price)]
    #v(2pt)
    Standardisierte Einreichung bzw. Abwicklung des Antrags. Bewusst eng definiert - *keine* individuelle Rechtsberatung. Erweitertes Servicepaket folgt nach Validierung.
  ],
)

#v(0.1em)

== Conversion-Annahmen Jahr 1

Jahr 1 wird als Zeitraum von zwölf Monaten ab Markteinführung verstanden (Q2 2026 - Q1 2027). Die Wirtschaftlichkeitsplanung unterscheidet zwischen aktiven Nutzern und zahlenden Fällen. Die kostenpflichtige Zusatzleistung startet im *Juli 2026*; die Conversion baut sich erst danach schrittweise auf.

#v(0.1em)

#block(breakable: false)[
  #table(
    columns: (1.6fr, 1fr, 1fr, 1fr, 1fr),
    fill: (x, y) => if y == 0 { primary } else if calc.odd(y) { light-bg } else { white },
    stroke: 0.5pt + surface,
    inset: 9pt,
    align: (left, right, right, right, right),

    table.cell(fill: primary)[#text(fill: white, weight: "bold")[Kennzahl]],
    table.cell(fill: primary)[#text(fill: white, weight: "bold")[Apr-Jun 26]],
    table.cell(fill: primary)[#text(fill: white, weight: "bold")[Jul-Sep 26]],
    table.cell(fill: primary)[#text(fill: white, weight: "bold")[Okt-Dez 26]],
    table.cell(fill: primary)[#text(fill: white, weight: "bold")[Jan-Mär 27]],

    [Aktive Nutzer], [#num(active-users-q1)], [#num(active-users-q2)], [#num(active-users-q3)], [#num(active-users-q4)],
    [Conversion in Premium], [#pct(conversion-q1 * 100)], [#pct(conversion-q2 * 100)], [#pct(conversion-q3 * 100)], [#pct(conversion-q4 * 100)],
    [Zahlende Fälle], [#num(premium-users-q1)], [#num(premium-users-q2)], [#num(premium-users-q3)], [#num(premium-users-q4)],
    [Umsatz], [#euro(revenue-q1)], [#euro(revenue-q2)], [#euro(revenue-q3)], [#euro(revenue-q4)],
  )

  #v(6pt)
  #text(size: 8.5pt, fill: muted)[
    "Aktive Nutzer" meint Nutzer, die den Elterngeld-Prozess ernsthaft beginnen oder abschließen, nicht bloße Website-Besucher. Conversion-Annahmen sind bewusst niedrig gewählt; Jahr 2 und Jahr 3 sind mit #pct(conversion-year2 * 100) bzw. #pct(conversion-year3 * 100) angesetzt, sofern der Premium-Prozess stabil läuft.
  ]
]

== Kanal-Mix

Die Kundengewinnung wird nicht auf teure bezahlte Akquisition gestützt. Da die Basisversion kostenlos ist und Monetarisierung erst später erfolgt, müssen Akquisitionskosten niedrig bleiben.

#v(0.3em)

#table(
  columns: (1.4fr, 2.5fr, 1.2fr),
  fill: (x, y) => if y == 0 { primary } else if calc.odd(y) { light-bg } else { white },
  stroke: 0.5pt + surface,
  inset: 9pt,

  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Kanal]],
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Rolle]],
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Kostenannahme]],

  [Partnerschaften (z. B. ARAG)],
  [Qualifizierte Nutzer aus Versicherungs- und Beratungskontexten. Vertrauensaufbau durch Drittpartei.],
  [niedrig / nahe 0 € CAC],

  [SEO & Inhalte],
  [Langfristiger Aufbau über Ratgeber, FAQ und Suchanfragen zum Elterngeld.],
  [niedrig],

  [TikTok / Meta],
  [Begrenzte Tests zur Validierung von Botschaften und Zielgruppen.],
  [kontrolliertes Budget],

  [Referrals],
  [Weiterempfehlungen nach ersten positiven Nutzererfahrungen.],
  [niedrig],
)

#v(0.4em)

#highlight-box(color: info, title: [Akquisitionskosten - differenziert nach Free und Premium])[
  Akquisition zielt zunächst auf den *kostenlosen* Self-Service. Für Jahr 1 wird mit durchschnittlich *#euro(acquisition-cost-per-active-user-y1) pro aktivem Free-Nutzer* gerechnet (Y2: #euro(acquisition-cost-per-active-user-y2), Y3: #euro(acquisition-cost-per-active-user-y3)) - primär getragen durch Partnerschaften und SEO, ergänzt durch kontrollierte Paid-Tests.

  #v(4pt)

  Die *Conversion in Premium erfolgt produktintern* (Upsell aus dem Free-Funnel), nicht über separate Paid-Akquisition. Eine Bewerbung der Premium-Variante über bezahlte Kanäle ist erst dann sinnvoll, wenn der durchschnittliche Lifetime-Value pro zahlender Familie durch zusätzliche Antragsarten und höherwertige Pakete deutlich über #euro(premium-price) steigt.
]


// ═══════════════════════════════════════════════════════════════════════════
// 5. WIRTSCHAFTLICHKEIT
// (Datenschutz & RDG-Inhalte sind in die Risiko-Mitigation R1 / R2 verlagert.)
// ═══════════════════════════════════════════════════════════════════════════
#pagebreak()

= Wirtschaftlichkeit

== Planungslogik

Die Finanzplanung folgt einem konservativen Freemium-Modell. Die Basisversion erzeugt zunächst keine direkten Umsätze. Umsätze entstehen erst ab Juli 2026 durch die kostenpflichtige Zusatzleistung. *Jahr 1 ist als Validierungs- und Aufbaujahr geplant*. Aufwendungen sind bewusst großzügig kalkuliert (inkl. Puffer für unvorhergesehene Kosten).

== 3-Jahres-Gewinn- und Verlustrechnung

#table(
  columns: (2.5fr, auto, auto, auto),
  fill: (x, y) => if y == 0 { primary } else if y == 9 { primary.lighten(85%) } else if y == 10 {
    info.lighten(90%)
  } else if calc.odd(y) { light-bg } else { white },
  stroke: 0.5pt + surface,
  inset: 9pt,
  align: (left, right, right, right),

  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Position]],
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Jahr 1]],
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Jahr 2]],
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Jahr 3]],

  [*Umsatzerlöse* (#num(paid-cases-y1) / #num(paid-cases-y2) / #num(paid-cases-y3) zahlende Fälle)],
  [#euro-compact(revenue-y1)],
  [#euro-compact(revenue-y2)],
  [#euro-compact(revenue-y3)],

  [Gründungskosten (einmalig)],
  [-#euro-compact(founding-costs-max)],
  [-],
  [-],

  [Fixkosten (Hosting, Tools, QES, Steuerberater)],
  [-#euro-compact(annual-fixed-costs-y1)],
  [-#euro-compact(annual-fixed-costs-y2)],
  [-#euro-compact(annual-fixed-costs-y3)],

  [Marketing / Akquisition],
  [-#euro-compact(marketing-y1)],
  [-#euro-compact(marketing-y2)],
  [-#euro-compact(marketing-y3)],

  [Bambini AI Tokens],
  [-#euro-compact(ai-cost-y1)],
  [-#euro-compact(ai-cost-y2)],
  [-#euro-compact(ai-cost-y3)],

  [Variable Kosten Premium-Fälle],
  [-#euro-compact(variable-costs-y1)],
  [-#euro-compact(variable-costs-y2)],
  [-#euro-compact(variable-costs-y3)],

  [Externe Beratung (Anwalt/Datenschutz, ad hoc)],
  [-#euro-compact(legal-compliance-y1)],
  [-#euro-compact(legal-compliance-y2)],
  [-#euro-compact(legal-compliance-y3)],

  [Puffer (unvorhergesehene Kosten)],
  [-#euro-compact(contingency-y1)],
  [-#euro-compact(contingency-y2)],
  [-#euro-compact(contingency-y3)],

  [*Jahresergebnis*],
  [*#signed-euro-compact(result-y1)*],
  [*#signed-euro-compact(result-y2)*],
  [*#signed-euro-compact(result-y3)*],

  [*Kumuliertes Ergebnis*],
  [*#signed-euro-compact(cumulative-result-y1)*],
  [*#signed-euro-compact(cumulative-result-y2)*],
  [*#signed-euro-compact(cumulative-result-y3)*],
)

#v(0.3em)
#text(size: 8.5pt, fill: muted)[
  Annahmen: Keine Personalkosten (unbezahlte Gründerarbeit in der Startphase). Laufende Buchhaltung und Steuerberatung sind in den Fixkosten enthalten; die Position "Externe Beratung" umfasst nur ad-hoc-Aufwendungen für externe Rechtsberatung (z. B. AGB-Prüfung, Datenschutz-Review). Conversion in Premium baut sich von 0 % über 5 % → 8 % → #pct(conversion-q4 * 100) auf, J2 / J3 mit #pct(conversion-year2 * 100) / #pct(conversion-year3 * 100). Mehrere Antragsarten ab Y2 erhöhen die Fälle pro zahlender Familie auf #paid-cases-per-premium-y2 (Y2) bzw. #paid-cases-per-premium-y3 (Y3). KI-Kosten ca. #euro(ai-cost-per-request)/Anfrage.
]
#pagebreak()
== Fixkostenübersicht

#box(fill: white, inset: 14pt, radius: 8pt, width: 100%, stroke: 1pt + surface)[
  #table(
    columns: (1fr, auto, auto),
    stroke: none,
    inset: 5pt,
    [*Position*], [*Monatlich*], [*Jährlich*],
    table.hline(stroke: 0.5pt + surface),
    [Hosting (Living-Bots.net)], [#euro(cost-hosting)], [#euro(cost-hosting * 12)],
    [Supabase], [#euro(cost-supabase) (Free Tier)], [#euro(cost-supabase)],
    [Entwicklung (Tools, APIs)], [#euro(cost-dev-tools)], [#euro(cost-dev-tools * 12)],
    [QES (Signatur)], [#euro(cost-qes-monthly)], [#euro(cost-qes-monthly * 12)],
    [Buchhaltung & Steuerberater], [#euro(cost-steuerberater)], [#euro(cost-steuerberater * 12)],
    [E-Mail-Hosting], [-], [#euro(cost-email-annual)],
    [QES-Zertifikat (anteilig)], [-], [~#euro(cost-qes-annual)],
    table.hline(stroke: 1pt + surface),
    [*Gesamt*], [*#euro(monthly-fixed-costs)*], [*#euro(annual-fixed-costs-y1)*],
  )
]

#v(0.3em)
#text(size: 8.5pt, fill: muted)[
  Eine Berufshaftpflichtversicherung ist für das Geschäftsmodell nicht erforderlich (kein Beratungsmandat). Ein externer Datenschutzbeauftragter ist bei < 20 Mitarbeitern gesetzlich nicht vorgeschrieben (§ 38 BDSG).
]

#pagebreak()
== 3-Jahres-Verlauf (kumulativ)

#box(
  fill: white,
  inset: 18pt,
  radius: 10pt,
  width: 100%,
  stroke: 1pt + surface,
)[
  #text(weight: "bold", size: 11pt)[Kumulativer Verlauf Umsatz / Kosten / Ergebnis (Quartale 0-12)]

  #v(12pt)

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

  #let q-costs-y1-fixedish = founding-costs-max + (annual-fixed-costs-y1 / 4) + (legal-compliance-y1 / 4) + (contingency-y1 / 4)
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
    xlabel: [Monat],
    ylabel: [Kumulativ (Tsd. €)],
    xlim: (0, 36),
    xaxis: (mirror: false),
    yaxis: (mirror: false),

    lq.plot(
      quarters,
      revenue-values,
      stroke: 2pt + success,
      mark: none,
      label: [Umsatz],
    ),

    lq.plot(
      quarters,
      costs-values,
      stroke: 2pt + danger,
      mark: none,
      label: [Kosten],
    ),

    lq.plot(
      quarters,
      profit-values,
      stroke: 2.5pt + primary,
      mark: none,
      label: [Ergebnis],
    ),
  )

  #v(6pt)

  #grid(
    columns: (1fr, 1fr, 1fr),
    column-gutter: 12pt,
    align: center,
    [
      #text(size: 8pt, fill: muted)[Kum. Ergebnis Ende Jahr 1]
      #v(2pt)
      #text(size: 11pt, fill: if cumulative-result-y1 < 0 { danger } else { success }, weight: "bold")[#signed-euro-compact(cumulative-result-y1)]
    ],
    [
      #text(size: 8pt, fill: muted)[Kum. Ergebnis Ende Jahr 2]
      #v(2pt)
      #text(size: 11pt, fill: if cumulative-result-y2 < 0 { danger } else { success }, weight: "bold")[#signed-euro-compact(cumulative-result-y2)]
    ],
    [
      #text(size: 8pt, fill: muted)[Kum. Ergebnis Ende Jahr 3]
      #v(2pt)
      #text(size: 11pt, fill: if cumulative-result-y3 < 0 { danger } else { success }, weight: "bold")[#signed-euro-compact(cumulative-result-y3)]
    ],
  )
]

== Liquiditätsplanung & Kapitalbedarf

Der optimale Finanzierungsrahmen beträgt *#euro(recommended-funding)*. Er umfasst die GmbH-Gründung, laufende Betriebskosten, Aufwendungen für Marketing und einen Puffer für unvorhergesehene Kosten.

#v(0.3em)

#grid(
  columns: (1fr, 1fr),
  column-gutter: 12pt,

  box(
    fill: accent.lighten(93%),
    stroke: 2pt + accent,
    radius: 10pt,
    inset: 16pt,
    width: 100%,
  )[
    #align(center)[
      #text(size: 9pt, weight: "bold", fill: accent.darken(10%))[Mindestbedarf Gründung]
      #v(4pt)
      #text(size: 22pt, weight: "bold", fill: accent.darken(10%))[#euro-compact(minimum-formation-need)]
      #v(4pt)
      #text(size: 8pt, fill: muted)[Stammkapital + Gründungskosten max.]
    ]
  ],

  box(
    fill: success.lighten(93%),
    stroke: 2pt + success,
    radius: 10pt,
    inset: 16pt,
    width: 100%,
  )[
    #align(center)[
      #text(size: 9pt, weight: "bold", fill: success)[Empfohlener Finanzierungsrahmen]
      #v(4pt)
      #text(size: 22pt, weight: "bold", fill: success)[#euro-compact(recommended-funding)]
      #v(4pt)
      #text(size: 8pt, fill: muted)[inkl. Puffer & Marketing-Tests]
    ]
  ],
)

#v(0.4em)

#table(
  columns: (2fr, auto, auto, auto),
  fill: (x, y) => if y == 0 { info } else if calc.odd(y) { light-bg } else { white },
  stroke: 0.5pt + surface,
  inset: 9pt,
  align: (left, right, right, right),

  table.cell(fill: info)[#text(fill: white, weight: "bold")[Liquiditätsentwicklung]],
  table.cell(fill: info)[#text(fill: white, weight: "bold")[Ende J1]],
  table.cell(fill: info)[#text(fill: white, weight: "bold")[Ende J2]],
  table.cell(fill: info)[#text(fill: white, weight: "bold")[Ende J3]],

  [Anfangsbestand (Startfinanzierung #euro-compact(recommended-funding))],
  [#euro-compact(cash-start)],
  [#euro-compact(cash-end-y1)],
  [#euro-compact(cash-end-y2)],

  [\+ Umsatzerlöse],
  [#euro-compact(revenue-y1)],
  [#euro-compact(revenue-y2)],
  [#euro-compact(revenue-y3)],

  [- Gesamtkosten],
  [#euro-compact(total-costs-y1)],
  [#euro-compact(total-costs-y2)],
  [#euro-compact(total-costs-y3)],

  [*Endbestand*],
  [*#euro-compact(cash-end-y1)*],
  [*#euro-compact(cash-end-y2)*],
  [*#euro-compact(cash-end-y3)*],
)



#pagebreak()
== Szenario-Vergleich (Jahr 1)

#grid(
  columns: (1fr, 1fr, 1fr),
  column-gutter: 10pt,

  box(
    fill: white,
    inset: 16pt,
    radius: 10pt,
    width: 100%,
    stroke: 1pt + danger.lighten(50%),
  )[
    #align(center)[
      #badge("KONSERVATIV (50%)", color: danger)
      #v(8pt)
      #text(size: 9pt, fill: muted)[Aktive Nutzer:] *#num(active-users-conservative)* \
      #text(size: 9pt, fill: muted)[Zahlende Fälle:] *#num(paid-cases-conservative)* \
      #text(size: 9pt, fill: muted)[Umsatz:] *#euro(revenue-conservative)* \
      #text(size: 9pt, fill: muted)[Ergebnis:] *#text(fill: danger)[#signed-euro-compact(result-conservative)]*
    ]
  ],

  box(
    fill: primary.lighten(95%),
    inset: 16pt,
    radius: 10pt,
    width: 100%,
    stroke: 2pt + primary,
  )[
    #align(center)[
      #badge("BASIS (100%)", color: primary)
      #v(8pt)
      #text(size: 9pt, fill: muted)[Aktive Nutzer:] *#num(active-users-year1)* \
      #text(size: 9pt, fill: muted)[Zahlende Fälle:] *#num(paid-cases-y1)* \
      #text(size: 9pt, fill: muted)[Umsatz:] *#euro(revenue-y1)* \
      #text(size: 9pt, fill: muted)[Ergebnis:] *#text(fill: danger)[#signed-euro-compact(result-y1)]*
    ]
  ],

  box(
    fill: white,
    inset: 16pt,
    radius: 10pt,
    width: 100%,
    stroke: 1pt + info.lighten(50%),
  )[
    #align(center)[
      #badge("OPTIMISTISCH (150%)", color: info)
      #v(8pt)
      #text(size: 9pt, fill: muted)[Aktive Nutzer:] *#num(active-users-optimistic)* \
      #text(size: 9pt, fill: muted)[Zahlende Fälle:] *#num(paid-cases-optimistic)* \
      #text(size: 9pt, fill: muted)[Umsatz:] *#euro(revenue-optimistic)* \
      #text(size: 9pt, fill: muted)[Ergebnis:] *#text(fill: danger)[#signed-euro-compact(result-optimistic)]*
    ]
  ],
)

#v(0.5em)

#text(size: 9pt, fill: muted)[
  Auch das optimistische Szenario zeigt in Jahr 1 noch ein negatives Ergebnis. Dies ist eine Konsequenz des Freemium-Ansatzes: Die wesentlichen Kostentreiber (Gründung, Fixkosten, Recht) sind weitgehend fix; die Erlöse aus #euro(premium-price)/Fall können in 6 Monaten noch keine vollständige Deckung erreichen. Profitabilität ist geplant ab Skalierung der Zusatzleistungen (Y2/Y3) sowie zusätzlichen Antragsarten und möglichen Partner-/B2B-Erlösen.
]

#highlight-box(color: info, title: [Validierungsjahr und Behördenakzeptanz])[
  Das negative Jahresergebnis in Jahr 1 ist eingeplant: Es handelt sich nicht um ein wirtschaftliches Risiko, sondern um eine bewusste Investition in die *Validierungs- und Aufbauphase*.

  #v(4pt)

  Im Vordergrund stehen drei Ziele: der Aufbau verlässlicher Kontakte zu den zuständigen Elterngeldstellen, die Sicherung der *Behördenakzeptanz* für eine spätere standardisierte Antragseinreichung und der Nachweis operativer Belastbarkeit unter realen Bedingungen. Diese Vorarbeit ist Voraussetzung für die wirtschaftliche Skalierung über zusätzliche Antragsarten (Kindergeld, Elternzeit ab Y2), höherwertige Servicepakete und Partner-/B2B-Erlöse.
]


// ═══════════════════════════════════════════════════════════════════════════
// 6. RISIKEN & SWOT-ANALYSE
// ═══════════════════════════════════════════════════════════════════════════
#pagebreak()

= Risiken & SWOT-Analyse

== SWOT-Analyse

#table(
  columns: (1fr, 1fr),
  stroke: 1pt + surface,
  inset: 14pt,
  fill: (x, y) => {
    if x == 0 and y == 0 { success.lighten(93%) } else if x == 1 and y == 0 { danger.lighten(93%) } else if (
      x == 0 and y == 1
    ) { info.lighten(93%) } else if x == 1 and y == 1 { accent.lighten(90%) }
  },
  [
    #text(weight: "bold", fill: success, size: 10pt)[S - Stärken (intern)]
    #v(6pt)
    #text(size: 8.5pt)[
      - Niedrige Fixkosten (#euro(monthly-fixed-costs)/Mon.) - geringes Verlustrisiko
      - Kostenloser Einstieg = Markteintritt ohne Preisbarriere
      - BambiniAI als Differenzierung (kein Wettbewerber bietet Vergleichbares)
      - OpenRouter mit Zero Data Retention - datenschutzfreundliche KI-Nutzung
      - Partnerschaften mit Privaten und öffentlichen Stakeholdern möglich
      - Juristisches + technisches + Produkt-Know-how im Team
    ]
  ],
  [
    #text(weight: "bold", fill: danger, size: 10pt)[W - Schwächen (intern)]
    #v(6pt)
    #text(size: 8.5pt)[
      - Kein Track Record - Neugründung ohne Markthistorie
      - Studentisches Gründerteam - begrenzte operative Erfahrung und begrenzte zeitliche Kapazitäten
      - Begrenztes Marketingbudget in der Startphase
      - Abhängigkeit von unbezahlter Gründerarbeit
      - Behörden-Integration (Premium-Versand) noch nicht produktiv
      - Geringe initiale Zahlbereitschaft typisch für Freemium-Modelle
    ]
  ],

  [
    #text(weight: "bold", fill: info, size: 10pt)[O - Chancen (extern)]
    #v(6pt)
    #text(size: 8.5pt)[
      - #calc.round(non-takeup-rate * 100) % Nichtinanspruchnahme = ungenutzter Markt
      - Verwaltungsdigitalisierung durch Gesetzgeber (OZG 2.0)
      - Kein dominanter Wettbewerber im Vollservice-Segment
      - Wachsende Akzeptanz KI-gestützter Verwaltungslösungen
      - Skalierung über zusätzliche Antragsarten (Kindergeld, Elternzeit)
      - B2B-Perspektive (Corporate Employee Benefit) ab 2027
    ]
  ],
  [
    #text(weight: "bold", fill: accent.darken(10%), size: 10pt)[T - Risiken (extern)]
    #v(6pt)
    #text(size: 8.5pt)[
      - *R1* - Haftung bei fehlerhafter Berechnung / RDG
      - *R2* - Datenschutz / DSGVO bei sensiblen Daten
      - *R3* - KI-Kosten höher als geplant
      - *R4* - Conversion in Premium bleibt zu niedrig
      - *R5* - Ressourcen / Examensphase Gründerteam
      - *R6* - Regulatorische Änderungen (BEEG, OZG)
      - *R7* - Akquisitionskosten höher als geplant
    ]
  ],
)

#v(0.3em)
#text(size: 8.5pt, fill: muted)[
  Die folgenden Mitigation-Karten adressieren systematisch die sieben identifizierten Risiken (R1-R7). Jede Karte zeigt Risikolage und konkrete Gegenmaßnahmen.
]

#pagebreak()
== Mitigation R1-R3: Haftung, Datenschutz, KI-Kosten

#grid(
  columns: (1fr, 1fr, 1fr),
  column-gutter: 10pt,
  row-gutter: 10pt,

  box(
    fill: white,
    inset: 14pt,
    radius: 10pt,
    width: 100%,
    stroke: (left: 4pt + primary, rest: 1pt + surface),
  )[
    #text(weight: "bold", fill: primary-dark, size: 9.5pt)[R1 · Haftung / RDG]
    #v(2pt)
    #badge("Niedrig", color: success)
    #v(8pt)
    #text(size: 8.5pt)[
      - *Technisches Hilfsmittel*, keine Rechtsberatung (§ 2 Abs. 1 RDG)
      - Berechnungen rein rechnerisch, ohne rechtliche Würdigung
      - Nutzer bestätigen Angaben vor Versand → Eigenverantwortung
      - BambiniAI nur allgemeine Orientierung
      - AGB-Haftung auf Vorsatz/grobe Fahrlässigkeit beschränkt (§ 309 Nr. 7 BGB)
      - Premium-Prozess bewusst standardisiert; Ausweitung nur nach rechtlicher Prüfung
    ]
  ],

  box(
    fill: white,
    inset: 14pt,
    radius: 10pt,
    width: 100%,
    stroke: (left: 4pt + info, rest: 1pt + surface),
  )[
    #text(weight: "bold", fill: info, size: 9.5pt)[R2 · Datenschutz / DSGVO]
    #v(2pt)
    #badge("Niedrig-Mittel", color: accent)
    #v(8pt)
    #text(size: 8.5pt)[
      - Kerndaten verbleiben im EWR (Supabase Frankfurt, Living-Bots Bremen)
      - Datenminimierung, klare Zweckbindung, Löschkonzept produktseitig
      - KI-Anfragen über OpenRouter mit *Zero Data Retention*
      - Externer Datenschutzbeauftragter < 20 MA nicht erforderlich (§ 38 BDSG)
      - Datenschutzerklärung und AGB erstellt und veröffentlicht
    ]
  ],

  box(
    fill: white,
    inset: 14pt,
    radius: 10pt,
    width: 100%,
    stroke: (left: 4pt + accent, rest: 1pt + surface),
  )[
    #text(weight: "bold", fill: accent.darken(10%), size: 9.5pt)[R3 · KI-Kosten]
    #v(2pt)
    #badge("Niedrig", color: success)
    #v(8pt)
    #text(size: 8.5pt)[
      - Nur rund *#euro(ai-cost-per-request)* pro Freitextanfrage
      - FAQ-first: Standardfragen ohne Modellaufruf
      - Nutzungslimits, Tages- und Nutzerbudgets
      - Anbieter-/Modell-Whitelist via OpenRouter
      - Anomalie-Monitoring gegen Missbrauch
      - *Kein wesentlicher finanzieller Risikofaktor*
    ]
  ],
)

== Mitigation R4-R7: Monetarisierung, Ressourcen, Markt

#grid(
  columns: (1fr, 1fr),
  column-gutter: 12pt,
  row-gutter: 10pt,

  box(
    fill: white,
    inset: 14pt,
    radius: 10pt,
    width: 100%,
    stroke: (top: 3pt + danger, rest: 1pt + surface),
  )[
    #text(weight: "bold", fill: danger, size: 9.5pt)[R4 · Conversion zu niedrig]
    #v(2pt)
    #badge("Mittel", color: accent)
    #v(8pt)
    #text(size: 8.5pt)[
      Premium-Pilot ab Juli 2026 mit echter Nutzungsmessung. Preis-/Leistungstests. Schrittweise Ergänzung zusätzlicher Antragsarten zur Erhöhung der Fälle pro Premium-Nutzer (#paid-cases-per-premium-y1 → #paid-cases-per-premium-y2 → #paid-cases-per-premium-y3). Pivot-Optionen: höherwertige Servicepakete oder White-Label-Lösung.
    ]
  ],

  box(
    fill: white,
    inset: 14pt,
    radius: 10pt,
    width: 100%,
    stroke: (top: 3pt + danger, rest: 1pt + surface),
  )[
    #text(weight: "bold", fill: danger, size: 9.5pt)[R5 · Ressourcen / Examen]
    #v(2pt)
    #badge("Mittel", color: accent)
    #v(8pt)
    #text(size: 8.5pt)[
      Schwerpunktstudium und Staatsexamensvorbereitung reduzieren Verfügbarkeit. Gegenmaßnahmen: enger MVP-Fokus auf Elterngeld, phasenweiser Ausbau, Priorisierung von Partnerschaften, Möglichkeit der Auslagerung an Werkstudierende oder Freelancer, *reduziertes Ausbauszenario* falls Verfügbarkeit unter Plan.
    ]
  ],

  box(
    fill: white,
    inset: 14pt,
    radius: 10pt,
    width: 100%,
    stroke: (top: 3pt + accent, rest: 1pt + surface),
  )[
    #text(weight: "bold", fill: accent.darken(10%), size: 9.5pt)[R6 · Regulatorik (BEEG / OZG)]
    #v(2pt)
    #badge("Niedrig", color: success)
    #v(8pt)
    #text(size: 8.5pt)[
      Modulare Architektur ermöglicht schnelle Anpassung an Gesetzesänderungen. OZG 2.0 ist zugleich *Chance*: Digitale Behördenschnittstellen begünstigen das Geschäftsmodell. Regelmäßige rechtliche Prüfung; begrenzter Leistungsumfang zum Start reduziert Anpassungslast.
    ]
  ],

  box(
    fill: white,
    inset: 14pt,
    radius: 10pt,
    width: 100%,
    stroke: (top: 3pt + accent, rest: 1pt + surface),
  )[
    #text(weight: "bold", fill: accent.darken(10%), size: 9.5pt)[R7 · Akquisition / CAC]
    #v(2pt)
    #badge("Mittel", color: accent)
    #v(8pt)
    #text(size: 8.5pt)[
      Das *kostenlose Angebot* selbst wirkt als Akquisitionshebel: niedrige Einstiegshürde, organische Reichweite, Aufbau einer belastbaren Nutzerbasis ohne hohe Paid-Investitionen. Ergänzend diversifizierter Mix aus *Partnerschaften* (z. B. ARAG), SEO, Referrals und kontrollierten Paid-Tests. Bei steigenden Paid-Kosten Verlagerung auf organische und partnerschaftliche Kanäle. Kein hartes Wachstumsversprechen aus einzelnem Kanal.
    ]
  ],
)


// ═══════════════════════════════════════════════════════════════════════════
// 7. TEAM & ROADMAP
// ═══════════════════════════════════════════════════════════════════════════
#pagebreak()

= Team & Roadmap

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
    inset: (x: 20pt, y: 10pt),
  )[
    #text(fill: white, weight: "bold", size: 11pt)[
      Studierende der Bucerius Law School, Hamburg
    ]
  ]

  #block(inset: 16pt)[
    Entstanden im Rahmen des Hamburg Legal Hackathon 2025 (Motto: "Access to Justice"). Das Team verbindet juristisches Verständnis, Produktarbeit und technische Umsetzung - eine für ein Produkt im Bereich digitaler Verwaltungszugang wesentliche Kombination.

  ]
]

#v(0.5em)

#figure(
  image("Teambild.jpg", width: 60%),
  caption: [
    #text(size: 7pt, fill: muted)[
      Mika Tomii, Michaela Idawain, Milan Kohlhaase, Jakob Große-Eggebrecht & Merit Lachmann
    ]
  ],
  numbering: none,
)

== Roadmap (Phasen, 3-Jahres-Überblick)

Die Roadmap ist bewusst phasenweise angelegt. Vorrang hat zunächst die Stabilisierung des Elterngeld-Prozesses. Erst danach werden weitere Antragsarten und zusätzliche Serviceleistungen ergänzt. Damit reduziert Bambini technische, rechtliche und operative Risiken in der Startphase.

#v(0.3em)

#grid(
  columns: (auto, 1fr),
  column-gutter: 12pt,
  row-gutter: 12pt,
  align: (center + top, top),

  box(fill: primary, inset: (x: 10pt, y: 6pt), radius: 20pt)[
    #text(fill: white, weight: "bold", size: 9pt)[H1 2026]
  ],
  box(fill: primary.lighten(95%), inset: 12pt, radius: 8pt, width: 100%, stroke: (left: 3pt + primary))[
    *GmbH-Gründung & Marktstart (Free)*
    #v(4pt)
    #text(size: 9pt)[
      Elterngeld-MVP live · erste aktive Nutzer
    ]
    #v(4pt)
    #text(size: 8pt, fill: muted)[Ziel: ~#num(active-users-q1 + active-users-q2) aktive Nutzer · Umsatz: #euro(revenue-q1 + revenue-q2)]
  ],

  box(fill: info, inset: (x: 10pt, y: 6pt), radius: 20pt)[
    #text(fill: white, weight: "bold", size: 9pt)[H2 2026]
  ],
  box(fill: info.lighten(95%), inset: 12pt, radius: 8pt, width: 100%, stroke: (left: 3pt + info))[
    *Premium-Pilot & Stabilisierung*
    #v(4pt)
    #text(size: 9pt)[
      Premium-Zusatzleistung (#euro(premium-price)) ab Juli 2026 · standardisierte Antragseinreichung · Conversion-Messung · Produktstabilisierung · erste belastbare Monetarisierungsdaten
    ]
    #v(4pt)
    #text(size: 8pt, fill: muted)[Ziel: ~#num(active-users-q3 + active-users-q4) weitere aktive Nutzer · Jahresumsatz: #euro-compact(revenue-y1)]
  ],

  box(fill: success, inset: (x: 10pt, y: 6pt), radius: 20pt)[
    #text(fill: white, weight: "bold", size: 9pt)[2027]
  ],
  box(fill: success.lighten(95%), inset: 12pt, radius: 8pt, width: 100%, stroke: (left: 3pt + success))[
    *Erweiterung Antragsarten & Skalierung*
    #v(4pt)
    #text(size: 9pt)[
      Kindergeld und Elternzeit nach Stabilisierung von Elterngeld · weitere Partnerkanäle (Versicherer, Krankenkassen, Hebammen) · höherwertige Servicepakete in Prüfung
    ]
    #v(4pt)
    #text(size: 8pt, fill: muted)[Ziel: ~#num(active-users-year2) aktive Nutzer · Umsatz: #euro-compact(revenue-y2)]
  ],

  box(fill: accent, inset: (x: 10pt, y: 6pt), radius: 20pt)[
    #text(fill: white, weight: "bold", size: 9pt)[2028+]
  ],
  box(fill: accent.lighten(93%), inset: 12pt, radius: 8pt, width: 100%, stroke: (left: 3pt + accent))[
    *Plattformausbau & B2B-Perspektive*
    #v(4pt)
    #text(size: 9pt)[
      Weitere Familienleistungen (Kinderzuschlag, Mutterschaftsgeld) · Corporate-Benefit-Angebote für Arbeitgeber als zusätzliche Wachstumsdimension · API-Behördenanbindung sofern verfügbar · höhere Service-Tiefe nach erneuter rechtlicher Prüfung
    ]
    #v(4pt)
    #text(size: 8pt, fill: muted)[Ziel: ~#num(active-users-year3) aktive Nutzer · Umsatz: #euro-compact(revenue-y3)]
  ],
)


// ═══════════════════════════════════════════════════════════════════════════
// 8. AUSBLICK
// ═══════════════════════════════════════════════════════════════════════════
#pagebreak()

= Ausblick

Bambini soll zunächst nicht durch Breite, sondern durch *Verlässlichkeit im Kernprozess* überzeugen. Der erste Schwerpunkt liegt auf Elterngeld, weil hier Komplexität, Bedarf und zeitliche Relevanz zusammenkommen. Aus dieser Basis kann das Produkt in zwei Richtungen wachsen: weitere Leistungsarten (horizontal) und höhere Service-Tiefe (vertikal).

#v(0.5em)

#table(
  columns: (auto, 1fr, 1fr),
  stroke: none,
  inset: 8pt,
  align: (center + horizon, left + horizon, left + horizon),
  fill: (x, y) => {
    if y == 0 { surface } else if x == 1 { primary.lighten(96%) } else if x == 2 { accent.lighten(94%) }
  },
  table.header([], [*Horizontale Skalierung*], [*Vertikale Skalierung*]),

  box(fill: primary, inset: 6pt, radius: 4pt)[#text(fill: white, weight: "bold", size: 8pt)[Aktuell]],
  [Elterngeld-Self-Service],
  [Antragserstellung (Free)],

  box(fill: info, inset: 6pt, radius: 4pt)[#text(fill: white, weight: "bold", size: 8pt)[H2 2026]],
  [- (Fokus bleibt Elterngeld)],
  [+ Standardisierte Einreichung als Zusatzleistung (#euro(premium-price))],

  box(fill: success, inset: 6pt, radius: 4pt)[#text(fill: white, weight: "bold", size: 8pt)[2027]],
  [+ Kindergeld, Elternzeit],
  [+ Höherwertige Servicepakete (nach rechtlicher Prüfung)],

  box(fill: accent, inset: 6pt, radius: 4pt)[#text(fill: white, weight: "bold", size: 8pt)[2028+]],
  [+ Kinderzuschlag, Mutterschaftsgeld],
  [+ B2B (Corporate Benefit), API-Behördenanbindung],
)

#v(0.5em)

== Kernaussage

#highlight-box(color: success, title: [Was Bambini ist - und was Bambini bewusst nicht ist])[
  Bambini startet *fokussiert und konservativ*: kostenloser Elterngeld-Self-Service, als höherwertige Alternative zu Wettbewerbern. Im Anschluss findet eine monetarisierbare, kontrollierte Skalierung statt.

  #v(6pt)

  Der Plan setzt *nicht* auf sofortige Profitabilität, sondern auf *validiertes Nutzerwachstum, niedrige Fixkosten und einen schrittweisen Ausbau*. Jahr 1 ist als Validierungsjahr geplant; Profitabilität ist erst ab Skalierung der Zusatzleistungen, weiterer Antragsarten und möglicher Partner-/B2B-Erlöse vorgesehen.
]

#v(1em)

#align(center)[
  #line(length: 60pt, stroke: 1pt + surface)
  #v(0.8em)
  #text(size: 9pt, fill: muted)[
    *Kontakt:* info\@bambini-claims.de · *Web:* bambini-claims.de · *Stand:* Mai 2026
  ]
]
