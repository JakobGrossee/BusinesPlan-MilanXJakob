// Bambini Business Plan - Premium Design
// Refined visual identity with geometric accents and modern typography

#set document(
  title: "Bambini toller plan Business Plan 2026",
  author: "Bambini GmbH (i.Gr.)",
)

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
  font: "Inter",
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
  kpi-card("💰", "49,99 €", "Preis pro Familie", color: primary),
  kpi-card("⚡", "109 €", "Monatl. Kosten", color: info),
  kpi-card("📊", "~13 €", "Blended CAC", color: success),
  kpi-card("🚀", "86k €", "Umsatz Jahr 1", color: accent),
)

#v(1em)

*Bambini* ist eine digitale Plattform, die Eltern in Deutschland hilft, Sozialleistungen wie Elterngeld, Kindergeld und Elternzeit in einer zentralen Anwendung zu beantragen. Wir lösen ein konkretes Problem: *80 Milliarden Euro* stehen jährlich für Familienleistungen bereit – aber *bis zu 70% kommen nie bei den Familien an*, weil der Antragsprozess zu komplex ist.#footnote[BMFSFJ 2021]

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
    #text(size: 9pt, fill: muted)[Seiten Anträge und Leitfäden#footnote([#link("https://www.ifo.de/pressemitteilung/2025-10-15/ueber-500-verschiedene-sozialleistungen-deutschland")[ifo Institut]])]
  ],

  box(fill: danger.lighten(92%), inset: 12pt, radius: 6pt, width: 100%)[
    #text(size: 20pt, weight: "bold", fill: danger)[~8.000 €] \
    #text(size: 9pt, fill: muted)[möglicher Verlust pro Familie]
  ],
  box(fill: danger.lighten(92%), inset: 12pt, radius: 6pt, width: 100%)[
    #text(size: 20pt, weight: "bold", fill: danger)[70%] \
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
  #metric-row([Produktpreis (Einmalzahlung)], [*49,99 €*])
  #metric-row([Monatliche Betriebskosten], [*109 €*])
  #metric-row([Break-Even], [*3 Kunden/Monat*])
  #metric-row([Blended Customer Acquisition Cost], [*~13 €*])
  #metric-row([Jahr 1 Umsatz (realistisch)], [*86.000 €*])
  #metric-row([Jahr 1 Gewinn (realistisch)], [*#text(fill: green)[+64.000 €]*])
]

== Finanzierungsbedarf

#highlight-box(title: "Kapitalbedarf: ~22.000 €", color: info)[
  - GmbH-Gründung (Notarkosten + Stammkapital): 13.700 €
  - Betriebskosten (6 Monate Runway): 654 €
  - Marketing-Budget (initial): 5.000 €
  - Puffer: 2.646 €
]
#pagebreak()
== Strategische Partnerschaft

#box(
  fill: warm-bg,
  inset: 18pt,
  radius: 8pt,
  width: 100%,
  stroke: (left: 4pt + accent),
)[
  Bambini hat bereits eine *Partnerschaft mit ARAG Versicherung* geschlossen. ARAG möchte unsere Lösung in ihre Kundenreise integrieren – eine Testkundin steht bereit. Diese Partnerschaft liefert Kunden mit *CAC = 0 €* und validiert unser Geschäftsmodell.
] // das hier ggf. nicht so schreiben -> partnerschaft besteht in der Art und Weise noch nicht

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
      #text(size: 28pt, weight: "bold", fill: danger)[80 Mrd. €]
      #v(-2pt)
      Jährliches Budget für Familienleistungen in Deutschland
    ],
    [
      #text(size: 28pt, weight: "bold", fill: danger)[bis zu 70%]
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

    step-number(4, color: accent),
    [
      *Der Rest passiert automatisch* #badge("24–48h", color: accent) \
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
== KI-Assistent: Ella

Bambini integriert einen KI-gestützten Assistenten, der Fragen zu Elterngeld, Kindergeld und Familienleistungen beantwortet – 24/7 in einfacher Sprache.

#grid(
  columns: (1fr, 1fr),
  column-gutter: 15pt,
  box(fill: success.lighten(93%), inset: 14pt, radius: 8pt, width: 100%)[
    #text(weight: "bold", fill: success)[Was Ella kann]
    #v(6pt)
    - Versteckte Bonusse finden (€100–€500 extra)
    - Alle Fristen überwachen
    - Fragen 24/7 kostenlos beantworten
    - Personalisierte Tipps für jede Familie
  ],
  box(fill: info.lighten(93%), inset: 14pt, radius: 8pt, width: 100%)[
    #text(weight: "bold", fill: info)[Technische Umsetzung]
    #v(6pt)
    - System Prompt Stuffing (kein Fine-Tuning)
    - FAQ-Content + BEEG-Auszüge im Kontext
    - Supabase Edge Functions
    - Markdown-Rendering im Client
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

  [Kosten], [*49,99 €* (für alle)], [39,99–89,99 €], [39,99 €], [Kostenlos],

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
      #text(size: 40pt, weight: "bold", fill: dark)[685.000]
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
      #text(size: 40pt, weight: "bold", fill: primary)[~308.000]
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
    #text(weight: "bold", size: 12pt, fill: info)[Akademiker & Berufstätige]
    #v(4pt)
    #text(size: 28pt, weight: "bold")[~171.000] #text(size: 9pt, fill: muted)[Familien/Jahr]

    #v(5pt)
    #text(size: 9pt, fill: muted)[25% der neuen Eltern (städtisch, höhere Bildung)]
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
    #text(size: 28pt, weight: "bold")[~137.000] #text(size: 9pt, fill: muted)[Familien/Jahr]

    #v(5pt)
    #text(size: 9pt, fill: muted)[20% der neuen Eltern (Geburtenrate: 1,84 vs. 1,23)]
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
    #text(size: 48pt, weight: "bold", fill: primary)[49,99 €]
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
    "Bambini kostet weniger als du damit verdienst." \
    Durchschnitt: €303 extra pro Familie. €49,99 Investment = #text(fill: success, weight: "bold")[605% ROI].
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
    #text(weight: "bold", fill: dark)[Monatliche Kosten]
    #v(10pt)
    #table(
      columns: (1fr, auto),
      stroke: none,
      inset: 5pt,
      [Hosting (Vercel)], [4 €],
      [Supabase], [0 € (Free Tier)],
      [Entwicklung (Tools, APIs)], [90 €],
      [QES (Signatur)], [15 €],
      table.hline(stroke: 0.5pt + surface),
      [*Gesamt monatlich*], [*109 €*],
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
      [E-Mail-Hosting], [20 €],
      [QES-Zertifikat (80€/3J)], [~27 €],
      table.hline(stroke: 0.5pt + surface),
      [*Gesamt jährlich*], [*~1.355 €*],
    )
    #v(12pt)
    #text(size: 9pt, fill: muted)[
      Extrem schlanke Kostenstruktur durch moderne Cloud-Architektur
    ]
  ],
)

== Break-Even-Analyse

#highlight-box(title: "Break-Even: 3 Kunden pro Monat", color: success)[
  #grid(
    columns: (1fr, 1fr, 1fr),
    column-gutter: 15pt,
    align: center,
    [
      #text(size: 9pt, fill: muted, tracking: 0.3pt)[MONATL. FIXKOSTEN]
      #v(2pt)
      #text(size: 18pt, weight: "bold")[109 €]
    ],
    [
      #text(size: 9pt, fill: muted, tracking: 0.3pt)[PREIS PRO KUNDE]
      #v(2pt)
      #text(size: 18pt, weight: "bold")[49,99 €]
    ],
    [
      #text(size: 9pt, fill: muted, tracking: 0.3pt)[BREAK-EVEN]
      #v(2pt)
      #text(size: 18pt, weight: "bold", fill: success)[3 Kunden]
    ],
  )

  #v(10pt)

  Bei der aktuellen Kostenstruktur ist Bambini ab dem *3. zahlenden Kunden pro Monat* operativ profitabel. Dies ist ein außergewöhnlich niedriger Break-Even für ein B2C-SaaS-Produkt.
]

#pagebreak()

// ============================================================================
// CUSTOMER ACQUISITION
// ============================================================================

= Customer Acquisition Strategy

== Ziel-CAC

#box(fill: light-bg, inset: 16pt, radius: 8pt, width: 100%)[
  #metric-row([Produktpreis], [*49,99 €*])
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
  [*0 €*],
  [Sofort (März 2026)],
  [#text(fill: success, weight: "bold")[✓ Strategisch am wertvollsten]],

  [TikTok Ads], [15–25 €], [Sofort], [#text(fill: success, weight: "bold")[✓ Niedrigster Paid CAC]],

  [Meta/Instagram Ads], [20–35 €], [Sofort], [#text(fill: success)[✓ Ergänzungskanal]],

  [SEO/Content], [~0 €], [6–12 Monate], [#text(fill: success)[✓ Langfristig aufbauen]],

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
  #text(weight: "bold", size: 12pt)[Realistischer Kanal-Mix ergibt Blended CAC von ~13 €]

  #v(10pt)

  #table(
    columns: (1fr, auto, auto, auto),
    stroke: none,
    inset: 8pt,
    fill: (x, y) => if y == 0 { success.lighten(80%) } else { none },
    [*Kanal*], [*Anteil*], [*CAC*], [*Gewichtet*],
    [ARAG-Partnerschaft], [25%], [0 €], [0,00 €],
    [TikTok Ads], [30%], [20 €], [6,00 €],
    [Meta Ads], [20%], [28 €], [5,60 €],
    [SEO/Organic], [10%], [0 €], [0,00 €],
    [Referrals], [15%], [12 €], [1,80 €],
    table.hline(stroke: 1.5pt + success),
    [*Blended CAC*], [*100%*], [], [*~13 €*],
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

  [Monate 1–3], [120], [18 €], [2.160 €], [6.000 €], [+3.840 €],
  [Monate 4–6], [300], [15 €], [4.500 €], [15.000 €], [+10.500 €],
  [Monate 7–9], [500], [13 €], [6.500 €], [25.000 €], [+18.500 €],
  [Monate 10–12], [800], [11 €], [8.800 €], [40.000 €], [+31.200 €],
  [*Jahr 1 Gesamt*], [*1.720*], [*13 €*], [*22.000 €*], [*86.000 €*], [*+64.000 €*],
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
      #text(size: 20pt, weight: "bold")[1.280]
      #v(4pt)
      #text(size: 9pt, fill: muted)[Umsatz:] *64.000 €* \
      #text(size: 9pt, fill: muted)[Gewinn:] *+30.800 €*
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
      #text(size: 20pt, weight: "bold", fill: success)[1.720]
      #v(4pt)
      #text(size: 9pt, fill: muted)[Umsatz:] *86.000 €* \
      #text(size: 9pt, fill: muted)[Gewinn:] *+64.000 €*
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
      #text(size: 20pt, weight: "bold")[2.500]
      #v(4pt)
      #text(size: 9pt, fill: muted)[Umsatz:] *125.000 €* \
      #text(size: 9pt, fill: muted)[Gewinn:] *+100.000 €*
    ]
  ],
)

== 3-Jahres-Ausblick

#table(
  columns: (auto, auto, auto, auto, auto),
  fill: (x, y) => if y == 0 { primary } else if calc.odd(y) { light-bg } else { white },
  stroke: 0.5pt + surface,
  inset: 12pt,
  align: (left, center, right, right, right),

  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Jahr]],
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Marktanteil]],
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Kunden]],
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Umsatz]],
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Kum. Gewinn]],

  [Jahr 1], [0,6%], [1.720], [86.000 €], [64.000 €],
  [Jahr 2], [1,5%], [4.620], [231.000 €], [~180.000 €],
  [Jahr 3], [3,0%], [9.240], [462.000 €], [~400.000 €],
)
#v(-0.8em)
#text(size: 8pt, fill: muted)[
  Annahmen: Konstanter Preis 49,99 €, sinkender CAC durch Brand Awareness und Referrals, Serviceable Market 308.000 Familien/Jahr
]

#pagebreak()

// ============================================================================
// FINANZIERUNGSBEDARF
// ============================================================================

= Finanzierungsbedarf

== Kapitalbedarf: ~22.000 €

#box(
  fill: white,
  inset: 0pt,
  radius: 12pt,
  width: 100%,
  stroke: 1pt + info.lighten(60%),
  clip: true,
)[
  #block(width: 100%, fill: info.lighten(90%), inset: (x: 20pt, y: 12pt))[
    #text(weight: "bold", fill: info, size: 11pt, tracking: 0.3pt)[AUFSCHLÜSSELUNG KAPITALBEDARF]
  ]

  #block(inset: 20pt)[
    #table(
      columns: (1fr, auto),
      stroke: none,
      inset: 8pt,

      [*GmbH-Gründung*], [],
      [#h(1em) Notar], [~750 €],
      [#h(1em) Handelsregister], [~150 €],
      [#h(1em) Markenanmeldung (DPMA)], [~300 €],
      [#h(1em) Stammkapital (gebunden)], [12.500 €],
      [#h(1em) #text(weight: "bold")[Subtotal Gründung]], [#text(weight: "bold")[13.700 €]],

      [], [],

      [*Betrieb & Marketing*], [],
      [#h(1em) Runway 6 Monate (Betriebskosten)], [654 €],
      [#h(1em) Marketing-Budget (initial)], [5.000 €],
      [#h(1em) Puffer / Unvorhergesehenes], [2.646 €],
      [#h(1em) #text(weight: "bold")[Subtotal Betrieb]], [#text(weight: "bold")[8.300 €]],

      table.hline(stroke: 1.5pt + info),

      [#text(weight: "bold", size: 13pt, fill: info)[Gesamtbedarf]],
      [#text(weight: "bold", size: 13pt, fill: info)[~22.000 €]],
    )
  ]
]

#pagebreak()

== Verwendung der Mittel

#grid(
  columns: (1fr, 1fr),
  column-gutter: 15pt,

  // Visual breakdown
  box(
    fill: light-bg,
    inset: 20pt,
    radius: 10pt,
    width: 100%,
  )[
    #text(weight: "bold", fill: dark)[Mittelverwendung]
    #v(15pt)

    #grid(
      columns: (auto, 1fr, auto),
      column-gutter: 10pt,
      row-gutter: 8pt,
      align: (center + horizon, left + horizon, right + horizon),

      box(fill: primary, width: 12pt, height: 12pt, radius: 3pt), [Stammkapital], text(weight: "bold")[62%],

      box(fill: info, width: 12pt, height: 12pt, radius: 3pt), [Marketing], text(weight: "bold")[23%],

      box(fill: success, width: 12pt, height: 12pt, radius: 3pt), [Gründungskosten], text(weight: "bold")[9%],

      box(fill: accent, width: 12pt, height: 12pt, radius: 3pt), [Betrieb & Puffer], text(weight: "bold")[6%],
    )

    #v(15pt)

    // Visual bars
    #block(width: 100%, height: 10pt, radius: 5pt, clip: true)[
      #grid(
        columns: (62%, 23%, 9%, 6%),
        block(width: 100%, height: 10pt, fill: primary),
        block(width: 100%, height: 10pt, fill: info),
        block(width: 100%, height: 10pt, fill: success),
        block(width: 100%, height: 10pt, fill: accent),
      )
    ]
  ],

  // Runway explanation
  box(
    fill: primary.lighten(95%),
    inset: 20pt,
    radius: 10pt,
    width: 100%,
    stroke: 1pt + primary.lighten(75%),
  )[
    #text(weight: "bold", fill: primary-dark)[Hinweis zum Stammkapital]

    #v(10pt)

    Die 12.500 € Stammkapital bleiben im Unternehmen und können für den Geschäftsbetrieb verwendet werden.

    #v(12pt)

    #text(size: 9pt, fill: muted, tracking: 0.3pt)[EFFEKTIVER KAPITALBEDARF]
    #v(2pt)
    #text(size: 28pt, weight: "bold", fill: primary)[~9.500 €]
    #v(4pt)
    #text(size: 9pt, fill: muted)[
      (Gründung + Marketing + Puffer)
    ]
  ],
)

== Finanzierungsquellen
// weiß nicht, ob es so schlau ist Familien und Freunde als Finanzierungsquelle aufzuführen, da wir ja gerade durch den Plan die Leute als Investoren gewinnen wollen. 


#highlight-box(title: "Empfehlung: Friends & Family Round", color: primary)[
  Bei einem Kapitalbedarf von ~22.000 € und der bereits bestehenden ARAG-Partnerschaft empfiehlt sich eine Finanzierung aus dem Familien- und Freundeskreis:

  #v(10pt)

  #grid(
    columns: (1fr, 1fr),
    column-gutter: 15pt,
    [
      #text(fill: success, weight: "bold")[✓] *Schnelle Umsetzung* – kein langwieriger VC-Prozess \
      #text(fill: success, weight: "bold")[✓] *Keine Verwässerung* – oder nur minimale Beteiligung
    ],
    [
      #text(fill: success, weight: "bold")[✓] *Validierter Business Case* – ARAG als Proof of Concept \
      #text(fill: success, weight: "bold")[✓] *Niedriges Risiko* – Break-Even bei nur 3 Kunden/Monat
    ],
  )
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
    [7], [Erste Testkundin durchläuft Flow],
    [8–9], [Prüfung der Behördenreaktionen auf erste Anträge],
    [9], [ARAG-Integration möglich],
  )

  #v(8pt)

  #box(fill: primary.lighten(93%), inset: 10pt, radius: 6pt, width: 100%)[
    *Ergebnis:* Technische Integration bereit, erste Anträge bei Behörden eingereicht und Rückmeldungen ausgewertet.
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
// Mehrsprachigkeit sollte eigenltich nicht erst in KW 23+ kommen 

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
    [Zugang für 137.000+ Familien mit Sprachbarrieren],

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

Neben dem B2C-Modell eröffnet sich eine zusätzliche Wachstumschance: *Unternehmen, die Bambini als Employee Benefit für werdende Eltern anbieten.* Das ARAG-Modell zeigt bereits, dass Partner bereit sind, unsere Lösung in ihre Benefits-Pakete zu integrieren.

=== Marktpotenzial

In Deutschland gibt es rund *260.000 Unternehmen mit 50+ Mitarbeitern* #footnote[deutschland.de: German SMEs – Facts and Figures, 2024. 11,3% der 2,6M Unternehmen haben 50+ FTE.] – der Kernmarkt für HR-Software. Bei konservativer Penetration von 15% ergibt sich ein adressierbarer Markt von ~38.700 Unternehmen mit einem geschätzten jährlichen Umsatzpotenzial von *155–580 Mio. €*. #footnote[Market Research Future: Germany Human Capital Management Software Market, 2024. HCM-Software-Markt: €1,375B (2024), 7,8% CAGR bis 2035.]

=== Value Proposition & ROI

#grid(
  columns: (1fr, 1fr),
  column-gutter: 12pt,

  box(fill: light-bg, inset: 14pt, radius: 6pt, width: 100%)[
    #text(weight: "bold", fill: primary)[Für HR-Abteilungen]
    #v(4pt)
    #text(size: 9pt)[
      - Admin-Aufwand: *-5–8 Std. pro Fall* #footnote[Abgeleitet aus Beratungskosten (TKare: €99–209, Einfach Elterngeld: €549) bei €60/Std. HR-Vollkosten.]
      - Compliance-Sicherheit
      - Moderne Employee Benefit
    ]
  ],

  box(fill: light-bg, inset: 14pt, radius: 6pt, width: 100%)[
    #text(weight: "bold", fill: success)[Für CFO/Geschäftsführung]
    #v(4pt)
    #text(size: 9pt)[
      - *+20% längere Mitarbeiterbindung* #footnote[Cocoon: Paid Leave Benchmarks 2025. Unternehmen mit Parental Leave Support haben 20% längere median tenure.]
      - Payback: *12–18 Monate*
      - Recruiting-Differentiator #footnote[Roland Berger Employee Benefits Study 2024: 89% der HR-Leiter priorisieren Retention; 32% planen 2025 Family/Care Benefits.]
    ]
  ],
)

=== Preismodell & Beispielrechnung

Empfohlenes *Hybrid-Modell*: 3–5 € pro Mitarbeiter/Jahr (PEPY) + 25–35 € pro aktivem Nutzungsfall.

#box(fill: primary.lighten(95%), inset: 12pt, radius: 6pt, width: 100%)[
  *Beispiel: Unternehmen mit 200 Mitarbeitern*
  - Basis: 200 × 4 € = *800 €/Jahr*
  - Plus: 12 Fälle × 25 € = *300 €*
  - *Gesamt: 1.100 €/Jahr* (vs. 12 × 549 € = 6.588 € bei externer Beratung #footnote[Einfach Elterngeld Premium: €549 pro Familie, 2025.])
]

=== Zielgruppen & Partner-Strategie

#table(
  columns: (2fr, 1fr, 2fr),
  fill: (x, y) => if y == 0 { info } else if calc.odd(y) { light-bg } else { white },
  stroke: 0.5pt + surface,
  inset: 10pt,

  table.cell(fill: info)[#text(fill: white, weight: "bold", size: 9pt)[SEGMENT]],
  table.cell(fill: info)[#text(fill: white, weight: "bold", size: 9pt)[VOLUMEN]],
  table.cell(fill: info)[#text(fill: white, weight: "bold", size: 9pt)[STRATEGIE]],

  [Tech-Unternehmen (50–500 FTE)],
  [~5.000],
  [LinkedIn Outreach, Personio Integration #footnote[Personio ist Marktführer für HR-Software im deutschen SME-Segment (50–500 FTE). People Managing People: Personio Pricing 2025.]],

  [Consulting (Big 4, McKinsey, BCG)],
  [Premium],
  [Direct Sales, höherer PEPY],

  [Versicherungen (ARAG-Expansion)],
  [Allianz, ERGO],
  [Partnerschaft: Bundle mit Family Insurance],
)

=== Finanzielle Projektion: Hybrid-Modell (Jahr 1)

#highlight-box(color: success)[
  #grid(
    columns: (2fr, 1fr),
    column-gutter: 15pt,
    [
      *B2C:* 1.000 Kunden × 49,99 € \
      *B2B:* 15 Unternehmen × Ø 2.500 € \
      #v(4pt)
      #text(weight: "bold", size: 11pt)[Jahr 1 Total (Hybrid)]
    ],
    [
      50.000 € \
      37.500 € \
      #v(4pt)
      #text(weight: "bold", size: 11pt, fill: success)[87.500 €]
    ],
  )
  #v(6pt)
  #text(size: 8pt, fill: muted)[
    Vorteil: Ähnlicher Umsatz wie B2C-only (86.000 €), aber mit *vorhersehbareren Recurring Revenues* und geringerer Kanalabhängigkeit.
  ]
]

=== Warum jetzt?

- *Mai 2025:* Digitale Elternzeit-Beantragung wird gesetzlich möglich #footnote[Sugrobov Rechtsanwälte: "Neue Ära des Arbeitsrechts – Digitale Antragstellung für Elternzeit ab Mai 2025".]
- *45% der Arbeitnehmer* suchen aktiv neue Jobs – social Benefits werden entscheidend #footnote[Gallup Workplace Study Germany 2024: 45% actively seeking or open to new opportunities.]
- *80–90% Markt unserviert* – kein dominanter Player im Parental Leave Admin-Segment #footnote[Synthese aus Wettbewerbsanalyse: MyCollective (2–3%), Voiio (5–8%), Back Technologies (unter 1%), BenefitatWork (3–5%). Market Research Future 2024.]

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

    #v(8pt)
    #text(size: 9pt, fill: muted)[
      Entstanden an der Bucerius Law School im Rahmen des Hamburg Legal Hackathon 2025 
      unter dem Motto „Access to Justice“.
    ]

    #v(15pt)

    // --- Hier dein ursprünglicher Screenshot-Block 1:1 ---

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
        #text(size: 9pt, fill: muted)[React, TypeScript, Supabase]
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
  #image("Teambild.jpg", width: 75%)
]

#v(0.6em)

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
    80 Mrd. € für Familien, bis zu 70% kommen nicht an
  ],

  box(fill: white, inset: 16pt, radius: 10pt, stroke: 1pt + success.lighten(50%), width: 100%)[
    #text(fill: success, weight: "bold", size: 11pt)[✓ Strategische Partnerschaft]
    #v(6pt)
    ARAG-Deal unterschrieben, Testkundin bereit
  ],

  box(fill: white, inset: 16pt, radius: 10pt, stroke: 1pt + success.lighten(50%), width: 100%)[
    #text(fill: success, weight: "bold", size: 11pt)[✓ Außergewöhnliche Unit Economics]
    #v(6pt)
    Break-Even bei 3 Kunden/Monat, CAC ~13 €
  ],

  box(fill: white, inset: 16pt, radius: 10pt, stroke: 1pt + success.lighten(50%), width: 100%)[
    #text(fill: success, weight: "bold", size: 11pt)[✓ Skalierbares Modell]
    #v(6pt)
    308.000 Familien/Jahr Serviceable Market
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
      Wir suchen ~22.000 € für die GmbH-Gründung und initiales Wachstum.
    ]

    #v(15pt)

    #text(size: 10pt, fill: muted)[Mit diesem Kapital erreichen wir:]

    #v(12pt)

    #grid(
      columns: (1fr, 1fr, 1fr),
      column-gutter: 10pt,
      box(fill: white, inset: 12pt, radius: 8pt, width: 100%, stroke: 1pt + primary.lighten(70%))[
        #align(center)[
          #text(size: 22pt, weight: "bold", fill: primary)[1.720]
          #v(2pt)
          #text(size: 9pt, fill: muted)[Kunden im ersten Jahr]
        ]
      ],
      box(fill: white, inset: 12pt, radius: 8pt, width: 100%, stroke: 1pt + primary.lighten(70%))[
        #align(center)[
          #text(size: 22pt, weight: "bold", fill: primary)[86.000 €]
          #v(2pt)
          #text(size: 9pt, fill: muted)[Umsatz Jahr 1]
        ]
      ],
      box(fill: white, inset: 12pt, radius: 8pt, width: 100%, stroke: 1pt + primary.lighten(70%))[
        #align(center)[
          #text(size: 22pt, weight: "bold", fill: primary)[64.000 €]
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
    #text(fill: white, weight: "bold", size: 14pt)[
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
