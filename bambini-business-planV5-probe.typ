// ═══════════════════════════════════════════════════════════════════════════
// BAMBINI BUSINESS PLAN — V5 PROBE (Cover + Executive Summary)
// Editorial-/MDPI-Stil — rein graphische Überarbeitung von V4.
// Inhalt, Variablen und Berechnungen sind unverändert aus V4 übernommen.
// ═══════════════════════════════════════════════════════════════════════════

#set document(
  title: "Bambini Business Plan 2026-2028 — V5 Probe",
  author: "Bambini GmbH (i.Gr.)",
)

// ───────────────────────────────────────────────────────────────────────────
// VARIABLEN (1:1 aus V4 übernommen — nur die für Cover + ES benötigten)
// ───────────────────────────────────────────────────────────────────────────

#let free-price = 0
#let premium-price = 9.99
#let premium-start = "Juli 2026"
#let competitor-price-low = 40
#let competitor-price-high = 50

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

#let paid-cases-per-premium-y1 = 1.0
#let paid-cases-per-premium-y2 = 1.4
#let paid-cases-per-premium-y3 = 2.0
#let paid-cases-y1 = calc.round(premium-users-year1 * paid-cases-per-premium-y1)
#let paid-cases-y2 = calc.round(active-users-year2 * conversion-year2 * paid-cases-per-premium-y2)
#let paid-cases-y3 = calc.round(active-users-year3 * conversion-year3 * paid-cases-per-premium-y3)

#let revenue-y1 = paid-cases-y1 * premium-price
#let revenue-y2 = paid-cases-y2 * premium-price
#let revenue-y3 = paid-cases-y3 * premium-price

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

#let acquisition-cost-per-active-user-y1 = 2.00
#let marketing-y1 = active-users-year1 * acquisition-cost-per-active-user-y1
#let marketing-y2 = active-users-year2 * 1.50
#let marketing-y3 = active-users-year3 * 1.00

#let ai-cost-per-request = 0.01
#let avg-ai-requests-free = 5
#let avg-ai-requests-premium = 12
#let ai-cost-y1 = ((active-users-year1 * avg-ai-requests-free) + (premium-users-year1 * avg-ai-requests-premium)) * ai-cost-per-request
#let ai-cost-y2 = ((active-users-year2 * avg-ai-requests-free) + (active-users-year2 * conversion-year2 * avg-ai-requests-premium)) * ai-cost-per-request
#let ai-cost-y3 = ((active-users-year3 * avg-ai-requests-free) + (active-users-year3 * conversion-year3 * avg-ai-requests-premium)) * ai-cost-per-request

#let variable-cost-per-paid-case = 1.50
#let variable-costs-y1 = paid-cases-y1 * variable-cost-per-paid-case
#let variable-costs-y2 = paid-cases-y2 * variable-cost-per-paid-case
#let variable-costs-y3 = paid-cases-y3 * variable-cost-per-paid-case

#let legal-compliance-y1 = 500
#let legal-compliance-y2 = 300
#let legal-compliance-y3 = 300
#let contingency-y1 = 1200
#let contingency-y2 = 1800
#let contingency-y3 = 2400

#let cost-notar-max = 850
#let cost-handelsregister = 100
#let cost-gewerbe-max = 125
#let cost-transparenz = 19.80
#let founding-costs-max = cost-notar-max + cost-handelsregister + cost-gewerbe-max + cost-transparenz
#let stammkapital = 12500
#let minimum-formation-need = stammkapital + founding-costs-max
#let recommended-funding = 22000

#let total-costs-y1 = founding-costs-max + annual-fixed-costs-y1 + marketing-y1 + ai-cost-y1 + variable-costs-y1 + legal-compliance-y1 + contingency-y1
#let total-costs-y2 = annual-fixed-costs-y2 + marketing-y2 + ai-cost-y2 + variable-costs-y2 + legal-compliance-y2 + contingency-y2
#let total-costs-y3 = annual-fixed-costs-y3 + marketing-y3 + ai-cost-y3 + variable-costs-y3 + legal-compliance-y3 + contingency-y3

#let result-y1 = revenue-y1 - total-costs-y1
#let result-y2 = revenue-y2 - total-costs-y2
#let result-y3 = revenue-y3 - total-costs-y3

#let births-per-year = 685000
#let serviceable-market = 308000
#let family-budget-billion = 80
#let non-takeup-rate = 0.70


// ───────────────────────────────────────────────────────────────────────────
// FORMATIERUNGSHELFER (1:1 aus V4)
// ───────────────────────────────────────────────────────────────────────────

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

// Ein Akzent (Aubergine, hält subtile Brand-Verbindung).
// Alternative: rgb("#1F3A5F") für Navy (Bank-/Kanzlei-Look).
#let accent       = rgb("#5B3A4E")
#let accent-soft  = rgb("#F2EDF0")   // 6 % Tönung für sehr sparsame Box-Hintergründe

#let ink          = rgb("#1A1A1A")
#let ink-soft     = rgb("#3D3D3D")
#let muted        = rgb("#6B6B6B")
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

// Body in Serif (signalisiert Reife / Working-Paper-Look).
// Sans nur für Headings, Tabellen, Captions, Labels.
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
// PAGE SETUP — schlichte Linien-Marginalien statt Verlaufsbalken
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

// Variante mit dezenter Tönung – sparsam einsetzen
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

// Kleines Outline-Tag
#let tag(content, color: accent) = {
  box(stroke: 0.6pt + color, inset: (x: 6pt, y: 2pt), radius: 2pt)[
    #text(font: sans, fill: color, weight: "regular",
          size: 7.5pt, tracking: 1pt)[#upper(content)]
  ]
}

// Marginalien-Label (noch zurückhaltender als tag)
#let label-text(content) = {
  text(font: sans, size: 7.5pt, fill: muted,
       weight: "regular", tracking: 1.4pt)[#upper(content)]
}

// Metric-Zeile (für Tabellen-Listen)
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


// ═══════════════════════════════════════════════════════════════════════════
// COVER — MDPI-/Working-Paper-Stil
// ═══════════════════════════════════════════════════════════════════════════

#page(header: none, footer: none, margin: (x: 3cm, y: 3cm))[

  // Kopfzeile: dezente Marginalie, dünne schwarze Linie
  #grid(
    columns: (1fr, auto),
    align: (left, right),
    text(font: sans, size: 8pt, fill: muted, tracking: 1.5pt)[
      #upper("Bambini GmbH (i. Gr.)  ·  Bucerius Law School")
    ],
    text(font: sans, size: 8pt, fill: muted, tracking: 1.5pt)[
      #upper("Mai 2026  ·  Iteration 4")
    ],
  )

  #v(2pt)
  #line(length: 100%, stroke: 0.6pt + ink)

  #v(3.5cm)

  // Logo zentriert, deutlich kleiner als in V4 (war 250pt)
  #align(center)[
    #image("bambini-logo.png", width: 140pt)
  ]

  #v(2.2cm)

  // Titel und Subtitel rein typografisch
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

  // Autoren-/Team-Block im MDPI-Stil
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
// EXECUTIVE SUMMARY — Editorial-Layout
// ═══════════════════════════════════════════════════════════════════════════

#page(header: none)[

  #v(0.5cm)

  #text(font: sans, size: 9pt, fill: muted, tracking: 1.5pt)[
    #upper("§ 1   ·   Executive Summary")
  ]
  #v(4pt)
  #line(length: 100%, stroke: 0.6pt + ink)
  #v(0.5cm)

  // KPI-Strip — dezente, typografische Variante statt Marketing-Tiles
  #grid(
    columns: (1fr, 1fr, 1fr, 1fr),
    column-gutter: 14pt,
    kpi([0 €], "Basisversion"),
    kpi([#euro(premium-price)], "Premium ab Juli 26"),
    kpi([#num(active-users-year1)], "Aktive Nutzer J1"),
    kpi([#euro-compact(recommended-funding)], "Finanzierungsrahmen"),
  )

  #v(1.2em)

  // Lead-Absatz (etwas größer, ruhiger Eingang)
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

  #v(0.8em)

  // Zwei zentrale Aussagen — als typografische Callouts statt bunte Boxen
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 18pt,

    callout(title: [Startprodukt])[
      Kostenloser Elterngeld-Self-Service mit strukturierter Datenerfassung,
      Plausibilitätsprüfung, Antragserstellung und begrenztem Zugang zu
      BambiniAI.
    ],
    callout(title: [Monetarisierung])[
      Ab #premium-start wird eine standardisierte Antragseinreichung bzw.
      Abwicklung für #euro(premium-price) pro Fall getestet. Weitere
      Antragsarten (Kindergeld, Elternzeit) folgen nach Validierung des
      Elterngeld-Prozesses.
    ],
  )

  #v(1em)

  // Subhead – klassisch, Sans-Serif klein
  #text(font: sans, size: 10.5pt, weight: "semibold", fill: ink)[
    Eckdaten und wirtschaftliche Prognose
  ]
  #v(0.3em)
  #line(length: 100%, stroke: 0.4pt + rule)
  #v(0.6em)

  #grid(
    columns: (1fr, 1fr),
    column-gutter: 24pt,

    // Linke Spalte: Markt & Kapital — als Listing
    [
      #text(font: sans, size: 8pt, weight: "semibold",
            fill: muted, tracking: 1.2pt)[#upper("Markt & Kapital")]
      #v(8pt)
      #metric-row([Serviceable Market], [~#num(serviceable-market) Fam./Jahr])
      #metric-row([Aktive Nutzer Jahr 1], [#num(active-users-year1)])
      #metric-row([Zahlende Fälle Jahr 1], [~#num(paid-cases-y1)])
      #metric-row([Mindestbedarf Gründung], [#euro-compact(minimum-formation-need)])
      #metric-row([Finanzierungsrahmen], [#euro-compact(recommended-funding)])
    ],

    // Rechte Spalte: 3-Jahres-Prognose als Booktabs-Tabelle
    [
      #text(font: sans, size: 8pt, weight: "semibold",
            fill: muted, tracking: 1.2pt)[#upper("Drei-Jahres-Prognose")]
      #v(8pt)

      #table(
        columns: (1fr, auto, auto),
        stroke: none,
        inset: (x: 4pt, y: 6pt),
        align: (left, right, right),

        table.hline(stroke: 0.8pt + ink),
        table.cell[#text(font: sans, size: 8.5pt, weight: "semibold", fill: ink)[Periode]],
        table.cell[#text(font: sans, size: 8.5pt, weight: "semibold", fill: ink)[Umsatz]],
        table.cell[#text(font: sans, size: 8.5pt, weight: "semibold", fill: ink)[Ergebnis]],
        table.hline(stroke: 0.4pt + ink),

        [Jahr 1],
        [#euro-compact(revenue-y1)],
        text(font: sans, fill: if result-y1 < 0 { neg } else { pos },
             weight: "semibold")[#signed-euro-compact(result-y1)],

        [Jahr 2],
        [#euro-compact(revenue-y2)],
        text(font: sans, fill: if result-y2 < 0 { neg } else { pos },
             weight: "semibold")[#signed-euro-compact(result-y2)],

        [Jahr 3],
        [#euro-compact(revenue-y3)],
        text(font: sans, fill: if result-y3 < 0 { neg } else { pos },
             weight: "semibold")[#signed-euro-compact(result-y3)],

        table.hline(stroke: 0.8pt + ink),
      )

      #v(4pt)
      #text(size: 8pt, fill: muted, style: "italic")[
        Konservatives Basisszenario. Profitabilität ab Skalierung weiterer
        Antragsarten.
      ]
    ],
  )

  #v(1em)

  Die wirtschaftliche Planung versteht *das erste Geschäftsjahr als
  Validierungs- und Aufbaujahr*. Umsätze entstehen erst ab Juli 2026 durch
  die kostenpflichtige Zusatzleistung. Profitabilität ist geplant ab
  Skalierung der Zusatzleistungen, weiterer Antragsarten (Kindergeld,
  Elternzeit ab 2027) und möglicher weiterer Erlöse.

  #v(1.5em)

  // Schlusszeile — typografische Signatur statt farbiger Footer-Pille
  #align(center)[
    #line(length: 60pt, stroke: 0.6pt + ink)
    #v(6pt)
    #text(font: sans, size: 8pt, fill: muted, tracking: 1.5pt)[
      #upper("Probedruck V5  ·  Editorial Style  ·  Cover und § 1")
    ]
  ]
]
