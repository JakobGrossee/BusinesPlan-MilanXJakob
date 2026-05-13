// Bambini Businessplan 2026–2028
// Iteration 3: Freemium-Modell, konservative Wirtschaftlichkeit, OpenRouter Zero Data Retention

#set document(
  title: "Bambini Businessplan 2026–2028",
  author: "Bambini GmbH (i.Gr.)",
)

// ============================================================================
// ZENTRALE ANNAHMEN
// ============================================================================

// ─── Produkt & Preise ────────────────────────────────────────────────────────
#let free-price = 0
#let premium-price = 9.99
#let premium-start = "Juli 2026"
#let ai-cost-per-request = 0.01
#let ai-free-limit = 10
#let avg-ai-requests-free = 5
#let avg-ai-requests-premium = 12

// ─── Nutzer- und Conversion-Annahmen ────────────────────────────────────────
#let active-users-q1 = 100
#let active-users-q2 = 250
#let active-users-q3 = 550
#let active-users-q4 = 900
#let active-users-year1 = active-users-q1 + active-users-q2 + active-users-q3 + active-users-q4

#let conversion-q1 = 0.00
#let conversion-q2 = 0.00
#let conversion-q3 = 0.05
#let conversion-q4 = 0.08
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

// Zusätzliche Antragsarten erhöhen mittelfristig die Zahl kostenpflichtiger Fälle je zahlender Familie.
#let paid-cases-per-premium-y1 = 1.0
#let paid-cases-per-premium-y2 = 1.4
#let paid-cases-per-premium-y3 = 2.0

#let paid-cases-y1 = calc.round(premium-users-year1 * paid-cases-per-premium-y1)
#let paid-cases-y2 = calc.round(premium-users-year2 * paid-cases-per-premium-y2)
#let paid-cases-y3 = calc.round(premium-users-year3 * paid-cases-per-premium-y3)

#let revenue-y1 = paid-cases-y1 * premium-price
#let revenue-y2 = paid-cases-y2 * premium-price
#let revenue-y3 = paid-cases-y3 * premium-price

// ─── Kostenstruktur ─────────────────────────────────────────────────────────
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

// Akquisitionskosten pro aktivem Nutzer: Fokus auf ARAG, organische Kanäle und begrenzte Tests bezahlter Kanäle.
#let acquisition-cost-per-active-user-y1 = 1.20
#let acquisition-cost-per-active-user-y2 = 0.90
#let acquisition-cost-per-active-user-y3 = 0.65
#let marketing-y1 = active-users-year1 * acquisition-cost-per-active-user-y1
#let marketing-y2 = active-users-year2 * acquisition-cost-per-active-user-y2
#let marketing-y3 = active-users-year3 * acquisition-cost-per-active-user-y3

#let ai-requests-y1 = (active-users-year1 * avg-ai-requests-free) + (premium-users-year1 * avg-ai-requests-premium)
#let ai-requests-y2 = (active-users-year2 * avg-ai-requests-free) + (premium-users-year2 * avg-ai-requests-premium)
#let ai-requests-y3 = (active-users-year3 * avg-ai-requests-free) + (premium-users-year3 * avg-ai-requests-premium)
#let ai-cost-y1 = ai-requests-y1 * ai-cost-per-request
#let ai-cost-y2 = ai-requests-y2 * ai-cost-per-request
#let ai-cost-y3 = ai-requests-y3 * ai-cost-per-request

#let variable-cost-per-paid-case = 1.50
#let variable-costs-y1 = paid-cases-y1 * variable-cost-per-paid-case
#let variable-costs-y2 = paid-cases-y2 * variable-cost-per-paid-case
#let variable-costs-y3 = paid-cases-y3 * variable-cost-per-paid-case

#let legal-compliance-y1 = 2000
#let legal-compliance-y2 = 1500
#let legal-compliance-y3 = 1500
#let contingency-y1 = 1200
#let contingency-y2 = 1800
#let contingency-y3 = 2400

// ─── Gründung & Kapitalbedarf ───────────────────────────────────────────────
#let cost-notar-max = 850
#let cost-handelsregister-max = 100
#let cost-gewerbe-max = 125
#let cost-transparenz = 19.80
#let founding-costs-max = cost-notar-max + cost-handelsregister-max + cost-gewerbe-max + cost-transparenz
#let stammkapital = 12500
#let minimum-formation-need = stammkapital + founding-costs-max
#let recommended-funding = 22000

#let total-costs-y1 = founding-costs-max + annual-fixed-costs-y1 + marketing-y1 + ai-cost-y1 + variable-costs-y1 + legal-compliance-y1 + contingency-y1
#let total-costs-y2 = annual-fixed-costs-y2 + marketing-y2 + ai-cost-y2 + variable-costs-y2 + legal-compliance-y2 + contingency-y2
#let total-costs-y3 = annual-fixed-costs-y3 + marketing-y3 + ai-cost-y3 + variable-costs-y3 + legal-compliance-y3 + contingency-y3

#let result-y1 = revenue-y1 - total-costs-y1
#let result-y2 = revenue-y2 - total-costs-y2
#let result-y3 = revenue-y3 - total-costs-y3
#let cumulative-result-y1 = result-y1
#let cumulative-result-y2 = result-y1 + result-y2
#let cumulative-result-y3 = result-y1 + result-y2 + result-y3

#let cash-end-y1 = recommended-funding + revenue-y1 - total-costs-y1
#let cash-end-y2 = cash-end-y1 + revenue-y2 - total-costs-y2
#let cash-end-y3 = cash-end-y2 + revenue-y3 - total-costs-y3
#let cash-minimum = calc.min(cash-end-y1, cash-end-y2, cash-end-y3)

#let serviceable-market = 308000
#let births-per-year = 685000
#let market-share-y1 = active-users-year1 / serviceable-market * 100
#let market-share-y3 = active-users-year3 / serviceable-market * 100

// ============================================================================
// FORMATIERUNG
// ============================================================================

#let primary = rgb("#4A3F8F")
#let accent = rgb("#C76B2A")
#let success = rgb("#2F855A")
#let danger = rgb("#C53030")
#let info = rgb("#2B6CB0")
#let dark = rgb("#1A202C")
#let muted = rgb("#667085")
#let surface = rgb("#E5E7EB")
#let light-bg = rgb("#F8FAFC")

#let intfmt(value) = {
  if value < 0 {
    "−" + intfmt(-value)
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
    "−" + euro(-value)
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
    "−" + euro-compact(-value)
  } else if value >= 1000 {
    str(calc.round(value / 1000, digits: 1)).replace(".", ",") + "k €"
  } else {
    euro(value)
  }
}

#let signed-euro-compact(value) = {
  if value > 0 {
    "+" + euro-compact(value)
  } else {
    euro-compact(value)
  }
}

#let pct(value) = str(calc.round(value, digits: 1)).replace(".", ",") + "%"

#let kpi(value, label, color: primary) = box(
  fill: color.lighten(92%),
  stroke: 1pt + color.lighten(55%),
  inset: 12pt,
  radius: 8pt,
  width: 100%,
)[
  #align(center)[
    #text(size: 18pt, weight: "bold", fill: color)[#value]
    #v(3pt)
    #text(size: 8pt, fill: muted)[#label]
  ]
]

#let note(title, body, color: primary) = box(
  fill: color.lighten(94%),
  stroke: (left: 3pt + color, rest: 1pt + color.lighten(70%)),
  inset: 12pt,
  radius: 7pt,
  width: 100%,
)[
  #text(weight: "bold", fill: color, size: 10pt)[#title]
  #v(5pt)
  #text(size: 9pt, fill: dark)[#body]
]

#let small-caption(body) = text(size: 8pt, fill: muted)[#body]

#set page(
  paper: "a4",
  margin: (x: 2.1cm, y: 2.2cm),
  header: context {
    if counter(page).get().first() > 1 [
      #set text(size: 8pt, fill: muted)
      #grid(columns: (1fr, 1fr), align: (left, right), [Bambini Businessplan], [Mai 2026])
      #v(-2pt)
      #line(length: 100%, stroke: 0.8pt + surface)
    ]
  },
  footer: context {
    if counter(page).get().first() > 1 [
      #line(length: 100%, stroke: 0.5pt + surface)
      #v(4pt)
      #set text(size: 8pt, fill: muted)
      #grid(columns: (1fr, 1fr), align: (left, right), [bambini-claims.de], [#counter(page).display()])
    ]
  },
)

#set text(font: ("Roboto", "Arial"), size: 10pt, fill: dark, lang: "de")
#set par(justify: true, leading: 0.58em)
#set heading(numbering: "1.1")

#show heading.where(level: 1): it => [
  #pagebreak(weak: true)
  #v(0.4em)
  #text(size: 20pt, weight: "bold", fill: primary)[#it.body]
  #v(0.2em)
  #line(length: 100%, stroke: 1.2pt + primary.lighten(55%))
  #v(0.8em)
]

#show heading.where(level: 2): it => [
  #v(0.8em)
  #text(size: 13pt, weight: "bold", fill: dark)[#it.body]
  #v(0.25em)
]

// ============================================================================
// TITELSEITE
// ============================================================================

#align(center)[
  #v(1.5cm)
  #image("bambini-logo.png", width: 80pt)
  #v(1.0cm)
  #text(size: 28pt, weight: "bold", fill: primary)[Bambini]
  #v(0.2cm)
  #text(size: 16pt, fill: muted)[Businessplan 2026–2028]
  #v(0.8cm)
  #text(size: 11pt, fill: dark)[Kostenloser Elterngeld-Self-Service mit schrittweiser Monetarisierung]
  #v(1.2cm)
]

#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  column-gutter: 8pt,
  kpi([0 €], [Basisversion Elterngeld], color: primary),
  kpi([9,99 €], [Zusatzleistung ab Juli 2026], color: accent),
  kpi([#intfmt(active-users-year1)], [aktive Nutzer Jahr 1], color: info),
  kpi([#euro-compact(recommended-funding)], [empfohlener Finanzierungsrahmen], color: success),
)

#v(1.1cm)

#note(
  [Einordnung],
  [Diese Fassung ersetzt das bisherige Modell einer sofort zahlungspflichtigen Komplettlösung durch einen konservativeren Ansatz: Bambini startet fokussiert mit Elterngeld, bietet die Basisversion kostenlos an und testet kostenpflichtige Zusatzleistungen erst nach technischer und rechtlicher Stabilisierung.],
  color: info,
)

#v(2cm)

#align(center)[
  #text(size: 9pt, fill: muted)[Bambini GmbH (i.Gr.) · Hamburg · Stand: Mai 2026]
]

#pagebreak()

#outline(title: [Inhalt], depth: 2)

// ============================================================================
// 1. EXECUTIVE SUMMARY
// ============================================================================

= Executive Summary

Bambini entwickelt eine digitale Unterstützung für Eltern bei der Beantragung von Elterngeld. Der Marktstart erfolgt zunächst mit einem kostenlosen Self-Service: Nutzer werden strukturiert durch die erforderlichen Angaben geführt und erhalten einen vorbereiteten Antrag. Die Einreichung erfolgt in der kostenlosen Version weiterhin durch den Nutzer selbst.

Der kostenlose Einstieg ist bewusst gewählt. Bestehende Anbieter verlangen für vergleichbare Self-Service-Angebote typischerweise etwa 40–50 €. Bambini bietet diesen Grundnutzen kostenlos an, um die Einstiegshürde zu senken, eine Nutzerbasis aufzubauen und den Prozess anhand realer Anwendungsfälle zu validieren.

#v(0.4em)

#grid(
  columns: (1fr, 1fr),
  column-gutter: 12pt,
  note(
    [Startprodukt],
    [Kostenloser Elterngeld-Self-Service mit strukturierter Datenerfassung, Plausibilitätsprüfung, Antragserstellung und begrenztem Zugang zu BambiniAI.],
    color: primary,
  ),
  note(
    [Monetarisierung],
    [Ab Juli 2026 wird eine standardisierte Antragseinreichung bzw. Abwicklung für #euro(premium-price) pro Fall getestet. Weitere Leistungen folgen erst nach Validierung.],
    color: accent,
  ),
)

#v(0.4em)

BambiniAI ergänzt den Antragprozess als KI-gestützte Orientierungshilfe. Der Assistent beantwortet allgemeine Fragen zum Elterngeld, erklärt einzelne Prozessschritte und verweist auf relevante Informationen. BambiniAI ersetzt keine Rechtsberatung. Freitextanfragen werden für kostenlose Nutzer durch Nutzungslimits begrenzt; Standardfragen sollen vorrangig über geprüfte FAQ-Inhalte beantwortet werden.

Die KI-Komponenten werden über OpenRouter mit aktivierter Zero Data Retention betrieben. Personenbezogene Daten werden in KI-Anfragen so weit wie möglich reduziert. Die Kerninfrastruktur verbleibt in europäischen Systemen. Zero Data Retention wird dabei als risikomindernde technische Maßnahme verstanden, nicht als alleinige datenschutzrechtliche Absicherung.

#v(0.4em)

Die wirtschaftliche Planung ist bewusst konservativ. Jahr 1 dient primär der Produktvalidierung und dem Aufbau eines belastbaren Nutzerkanals. Unter den aktuellen Annahmen erreicht Bambini im ersten Jahr ca. #intfmt(active-users-year1) aktive Nutzer und ca. #intfmt(paid-cases-y1) zahlende Zusatzleistungsfälle. Der erwartete Jahr-1-Umsatz liegt damit nur bei rund #euro-compact(revenue-y1). Ein operativer Gewinn ist im ersten Jahr nicht geplant.

#v(0.4em)

#box(fill: light-bg, stroke: 1pt + surface, inset: 12pt, radius: 8pt, width: 100%)[
  #table(
    columns: (2fr, 1fr),
    stroke: none,
    inset: 5pt,
    [*Kennzahl*], [*Annahme*],
    table.hline(stroke: 0.5pt + surface),
    [Serviceable Market], [ca. #intfmt(serviceable-market) Familien/Jahr],
    [Aktive Nutzer Jahr 1], [#intfmt(active-users-year1)],
    [Zahlende Fälle Jahr 1], [#intfmt(paid-cases-y1)],
    [Umsatz Jahr 1], [#euro-compact(revenue-y1)],
    [Ergebnis Jahr 1], [#signed-euro-compact(result-y1)],
    [Mindestbedarf GmbH-Gründung], [#euro-compact(minimum-formation-need)],
    [Empfohlener Finanzierungsrahmen], [#euro-compact(recommended-funding)],
  )
]

#v(0.4em)

Der wesentliche Finanzierungsbedarf ergibt sich aus GmbH-Gründung, laufenden Fixkosten, begrenztem Marketingbudget, rechtlicher Prüfung, technischer Absicherung und einem Kostenpuffer. Die Planung berücksichtigt ausdrücklich Risiken aus Datenschutz, Haftung, Monetarisierung, KI-Kosten und zeitlicher Verfügbarkeit des studentischen Gründerteams.

// ============================================================================
// 2. AUSGANGSSITUATION UND PROBLEM
// ============================================================================

= Ausgangssituation und Problem

== Komplexität des Elterngeld-Antrags

Elterngeld ist eine zentrale Familienleistung. Der Antrag ist für viele Familien dennoch schwer verständlich. Gründe sind insbesondere die Vielzahl unterschiedlicher Lebenssachverhalte, umfangreiche Nachweispflichten, unterschiedliche Zuständigkeiten der Länder und die Folgen fehlerhafter Angaben oder verpasster Fristen.

Für Eltern entsteht dadurch ein praktisches Zugangsproblem: Der Anspruch besteht zwar dem Grunde nach, die Antragstellung ist aber zeitaufwendig und fehleranfällig. Gerade in der Zeit rund um Geburt, Elternzeitplanung und Einkommensveränderungen fehlt häufig die Kapazität, sich in die Details des Verfahrens einzuarbeiten.

#v(0.4em)

#grid(
  columns: (1fr, 1fr),
  column-gutter: 12pt,
  kpi([#intfmt(births-per-year)], [Geburten pro Jahr in Deutschland], color: info),
  kpi([~#intfmt(serviceable-market)], [adressierbarer Markt pro Jahr], color: primary),
)

== Zielgruppen

Bambini adressiert zunächst Eltern, die den Elterngeld-Antrag grundsätzlich selbst stellen können, aber Unterstützung bei Struktur, Verständnis und Vollständigkeit benötigen. Besonders relevant sind:

- berufstätige Eltern mit begrenzter Zeit für die Antragstellung,
- Eltern mit komplexeren Einkommenssituationen,
- Eltern mit Unsicherheit bei Fristen, Nachweisen und Formularlogik,
- Familien mit Sprach- oder Verständnishürden,
- Nutzer aus Partnerkanälen wie ARAG, die eine niedrigschwellige digitale Unterstützung erwarten.

Der kostenlose Einstieg erleichtert den Zugang auch für Familien, die zwar Unterstützungsbedarf haben, aber nicht bereit sind, für einen reinen Self-Service unmittelbar 40–50 € zu zahlen.

== Bestehende Angebote

Der Markt ist nicht leer. Es gibt staatliche Informationen, behördliche Formulare und private Self-Service-Angebote. Aus Nutzersicht bestehen jedoch weiterhin Lücken: Staatliche Angebote sind häufig komplex und fragmentiert; private Anbieter sind meist kostenpflichtig und fokussieren sich auf einzelne Leistungen. Eine niedrigschwellige Kombination aus kostenlosem Self-Service, erklärender Unterstützung und späterer optionaler Abwicklung ist bisher kaum sichtbar.

// ============================================================================
// 3. LÖSUNG UND PRODUKTUMFANG
// ============================================================================

= Lösung und Produktumfang

== Startumfang

Der initiale Produktumfang ist bewusst eng begrenzt. Bambini startet mit Elterngeld, weil der Antrag zugleich relevant, komplex und für viele Familien zeitkritisch ist. Der Nutzer wird durch einen strukturierten Prozess geführt und erhält am Ende einen vorbereiteten Antrag.

#v(0.3em)

#table(
  columns: (1.4fr, 2.5fr),
  stroke: 0.5pt + surface,
  inset: 8pt,
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Bestandteil]],
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Beschreibung]],

  [Datenerfassung], [Strukturierte Eingabe der für den Elterngeld-Antrag erforderlichen Informationen.],
  [Plausibilitätsprüfung], [Hinweise auf unvollständige oder widersprüchliche Angaben.],
  [Antragserstellung], [Erzeugung eines vorbereiteten Antragsdokuments zur weiteren Verwendung durch den Nutzer.],
  [BambiniAI], [Begrenzte KI-gestützte Orientierung bei allgemeinen Fragen zum Elterngeld und zum Prozess.],
  [ARAG-Einstieg], [Partnerfähige FAQ- und Einstiegstrecke für Nutzer aus dem ARAG-Kontext.],
)

== Was zum Marktstart bewusst nicht versprochen wird

Um rechtliche, technische und operative Risiken zu begrenzen, wird Bambini zum Marktstart nicht als vollständig ausgebautes Portal für sämtliche Familienleistungen positioniert. Insbesondere werden folgende Punkte nicht als bereits verfügbar dargestellt:

- automatische vollständige Behördenintegration,
- individuelle Rechtsberatung,
- umfassende rechtliche Einzelfallprüfung,
- parallele Abdeckung sämtlicher Familienleistungen,
- unbegrenzte KI-Nutzung für kostenlose Nutzer.

Diese Einschränkungen sind kein Nachteil der Planung, sondern Teil eines kontrollierten Markteintritts. Bambini soll zunächst den Kernprozess Elterngeld stabil abbilden und erst danach weitere Leistungen ergänzen.

== BambiniAI

BambiniAI unterstützt Nutzer bei allgemeinen Fragen zum Elterngeld und zur Bedienung der Plattform. Der Assistent kann Begriffe erklären, auf benötigte Unterlagen hinweisen und häufige Unsicherheiten im Prozess adressieren. Die Antworten dienen der allgemeinen Orientierung und ersetzen keine Rechtsberatung.

Zur Kosten- und Qualitätskontrolle werden Standardfragen vorrangig über geprüfte FAQ-Inhalte beantwortet. Freitextanfragen an das KI-Modell werden für kostenlose Nutzer begrenzt. Die Kosten pro Freitextanfrage liegen derzeit bei ca. #euro(ai-cost-per-request); in der Planung wird dennoch mit Nutzungslimits, Budgetgrenzen und technischer Überwachung gearbeitet.

// ============================================================================
// 4. GESCHÄFTSMODELL UND PREISMODELL
// ============================================================================

= Geschäftsmodell und Preismodell

== Freemium-Ansatz

Bambini verfolgt zum Marktstart ein Freemium-Modell. Die Basisversion des Elterngeld-Self-Service ist kostenlos. Dadurch wird die Einstiegshürde für Nutzer gesenkt und Bambini kann sich gegenüber bestehenden kostenpflichtigen Self-Service-Angeboten differenzieren.

Die Monetarisierung erfolgt schrittweise über optionale Zusatzleistungen. Ab #premium-start soll zunächst eine standardisierte Antragseinreichung bzw. Abwicklung für #euro(premium-price) pro Fall getestet werden. Der Preis ist bewusst niedrig angesetzt. Die Leistung darf deshalb nicht als umfassende individuelle Prüfung oder rechtsberatungsnaher Vollservice verstanden werden, sondern als klar begrenzter standardisierter Prozess.

#v(0.4em)

#table(
  columns: (1.2fr, 1fr, 2.5fr),
  stroke: 0.5pt + surface,
  inset: 8pt,
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Angebot]],
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Preis]],
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Inhalt]],

  [Basisversion], [0 €], [Elterngeld-Self-Service, vorbereiteter Antrag, begrenzter BambiniAI-Zugang, Einreichung durch Nutzer.],
  [Zusatzleistung], [#euro(premium-price)], [Standardisierte Einreichung bzw. Abwicklung des Antrags, zunächst ab Juli 2026 und in begrenztem Umfang.],
  [Perspektive], [offen], [Weitere Antragsarten, höhere Service-Tiefe und mögliche Partner-/B2B-Angebote nach Validierung.],
)

== Conversion-Annahmen

Die Wirtschaftlichkeitsplanung unterscheidet zwischen aktiven Nutzern und zahlenden Fällen. Für Jahr 1 wird angenommen, dass die Monetarisierung erst im zweiten Halbjahr beginnt.

#v(0.3em)

#table(
  columns: (1fr, 1fr, 1fr, 1fr, 1fr),
  stroke: 0.5pt + surface,
  inset: 7pt,
  align: (left, right, right, right, right),
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Kennzahl]],
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Q1]],
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Q2]],
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Q3]],
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Q4]],

  [Aktive Nutzer], [#intfmt(active-users-q1)], [#intfmt(active-users-q2)], [#intfmt(active-users-q3)], [#intfmt(active-users-q4)],
  [Conversion], [#pct(conversion-q1 * 100)], [#pct(conversion-q2 * 100)], [#pct(conversion-q3 * 100)], [#pct(conversion-q4 * 100)],
  [Zahlende Fälle], [#intfmt(premium-users-q1)], [#intfmt(premium-users-q2)], [#intfmt(premium-users-q3)], [#intfmt(premium-users-q4)],
)

#small-caption([Aktive Nutzer meint Nutzer, die den Elterngeld-Prozess ernsthaft beginnen oder abschließen, nicht bloße Website-Besucher.])

== Wettbewerbspositionierung

#table(
  columns: (1.5fr, 1.6fr, 1.6fr, 1.6fr),
  stroke: 0.5pt + surface,
  inset: 7pt,
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Kriterium]],
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Bambini Startversion]],
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Private Anbieter]],
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Staatliche Angebote]],

  [Elterngeld-Self-Service], [kostenlos], [häufig ca. 40–50 €], [kostenlos, aber komplex],
  [Antragserstellung], [ja], [ja], [teilweise digital, je nach Bundesland],
  [Einreichung durch Anbieter], [geplant als Zusatzleistung], [meist nicht Kernleistung], [nicht anwendbar],
  [KI-Unterstützung], [begrenzt und kontrolliert], [kaum sichtbar], [nein],
  [Weitere Antragsarten], [geplant], [meist einzelne Leistung], [auf verschiedene Stellen verteilt],
)

// ============================================================================
// 5. KUNDENGEWINNUNG
// ============================================================================

= Kundengewinnung

== Grundsatz

Die Kundengewinnung wird nicht auf teure bezahlte Akquisition gestützt. Da die Basisversion kostenlos ist und die Monetarisierung erst später erfolgt, müssen Akquisitionskosten niedrig bleiben. Der Fokus liegt daher auf Partnerkanälen, organischen Inhalten und kontrollierten Tests bezahlter Kanäle.

ARAG wird zunächst als normaler Akquisitionskanal betrachtet. Nutzer aus dem ARAG-Kontext durchlaufen denselben Weg vom kostenlosen Angebot zur optionalen Zusatzleistung wie andere Nutzer. Eine garantierte Umsatzbeteiligung oder ein separater ARAG-Umsatz wird in der Basisplanung nicht unterstellt.

== Kanal-Mix

#table(
  columns: (1.4fr, 2.5fr, 1.2fr),
  stroke: 0.5pt + surface,
  inset: 8pt,
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Kanal]],
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Rolle]],
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Kostenannahme]],

  [ARAG], [Partnerkanal für qualifizierte Nutzer und Vertrauensaufbau.], [niedrig / 0 € CAC],
  [SEO & Inhalte], [Langfristiger Aufbau über Ratgeber, FAQ und Suchanfragen zum Elterngeld.], [niedrig],
  [TikTok / Meta], [Begrenzte Tests zur Validierung von Botschaften und Zielgruppen.], [kontrolliertes Budget],
  [Referrals], [Weiterempfehlungen nach ersten positiven Nutzererfahrungen.], [niedrig],
)

#v(0.3em)

Für Jahr 1 wird mit durchschnittlichen Akquisitionskosten von #euro(acquisition-cost-per-active-user-y1) pro aktivem Nutzer gerechnet. Diese Annahme ist nur tragfähig, wenn ARAG und organische Kanäle einen wesentlichen Anteil der Nutzer liefern. Steigende Paid-Media-Kosten würden die Planung belasten und werden deshalb als eigenes Risiko betrachtet.

// ============================================================================
// 6. TECHNOLOGIE, DATENSCHUTZ UND HAFTUNGSABGRENZUNG
// ============================================================================

= Technologie, Datenschutz und Haftungsabgrenzung

== Technische Architektur

Bambini nutzt eine schlanke Webarchitektur mit europäischer Kerninfrastruktur. Die Anwendung speichert die für den Prozess erforderlichen Daten in kontrollierten Systemen und vermeidet unnötige Datenweitergaben. KI-Funktionen werden über OpenRouter mit Zero Data Retention angebunden.

#table(
  columns: (1.5fr, 2.8fr),
  stroke: 0.5pt + surface,
  inset: 8pt,
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Bereich]],
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Umsetzung]],

  [Anwendung], [Webbasierter Self-Service mit strukturierter Nutzerführung.],
  [Datenhaltung], [Europäische Kerninfrastruktur; Datensparsamkeit und zweckgebundene Verarbeitung.],
  [KI-Anbindung], [OpenRouter mit aktivierter Zero Data Retention; keine Nutzung der Anfragen zu Trainingszwecken.],
  [Kostenkontrolle], [FAQ-first-Ansatz, Nutzungslimits, Budgetgrenzen und technische Überwachung.],
  [Anbietersteuerung], [Freigabe bestimmter Modelle und Anbieter statt beliebiger Modellnutzung.],
)

== Datenschutz

Bambini verarbeitet sensible Familien- und Einkommensdaten. Datenschutz ist daher kein nachgelagerter Punkt, sondern Teil des Produkts. Die Planung sieht vor:

- Datenminimierung in Formularen und KI-Anfragen,
- klare Zweckbindung der verarbeiteten Informationen,
- Löschung bzw. Reduzierung nicht mehr benötigter Daten,
- getrennte Betrachtung von Kerndaten und KI-Anfragen,
- transparente Datenschutzerklärung und technische Zugriffsbeschränkungen.

Zero Data Retention reduziert das Risiko bei KI-Anfragen, ersetzt aber nicht die datenschutzrechtliche Gesamtprüfung. Anbieterbeziehungen, Unterauftragnehmer und Datenflüsse müssen gesondert dokumentiert werden.

== Haftungsabgrenzung und RDG

Bambini wird als technisches Hilfsmittel positioniert. Die Plattform strukturiert Informationen, prüft Plausibilitäten und erstellt vorbereitete Dokumente. Sie erbringt keine individuelle Rechtsberatung. Nutzer müssen Angaben prüfen und die Verantwortung für die Richtigkeit ihrer Informationen behalten.

Für die spätere Zusatzleistung ist entscheidend, dass der Prozess standardisiert bleibt und keine individuelle rechtliche Würdigung versprochen wird. Vor einer Ausweitung der Service-Tiefe ist eine erneute rechtliche Prüfung vorgesehen.

// ============================================================================
// 7. WIRTSCHAFTLICHKEIT
// ============================================================================

= Wirtschaftlichkeit

== Planungslogik

Die Finanzplanung folgt dem konservativen Freemium-Modell. Die Basisversion erzeugt zunächst keine direkten Umsätze. Umsätze entstehen erst ab Juli 2026 durch kostenpflichtige Zusatzleistungen. Deshalb ist Jahr 1 als Validierungs- und Aufbaujahr zu verstehen.

#v(0.3em)

#table(
  columns: (2fr, 1fr, 1fr, 1fr),
  stroke: 0.5pt + surface,
  inset: 7pt,
  align: (left, right, right, right),
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Annahme]],
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Jahr 1]],
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Jahr 2]],
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Jahr 3]],

  [Aktive Nutzer], [#intfmt(active-users-year1)], [#intfmt(active-users-year2)], [#intfmt(active-users-year3)],
  [Conversion in Zusatzleistung], [gemischt], [#pct(conversion-year2 * 100)], [#pct(conversion-year3 * 100)],
  [Zahlende Nutzer], [#intfmt(premium-users-year1)], [#intfmt(premium-users-year2)], [#intfmt(premium-users-year3)],
  [Kostenpflichtige Fälle], [#intfmt(paid-cases-y1)], [#intfmt(paid-cases-y2)], [#intfmt(paid-cases-y3)],
  [Umsatz], [#euro-compact(revenue-y1)], [#euro-compact(revenue-y2)], [#euro-compact(revenue-y3)],
)

== Gewinn- und Verlustrechnung

Die folgende Darstellung enthält Fixkosten, variable Kosten, Marketing, KI-Kosten, rechtliche Prüfung und Puffer. Personalkosten der Gründer sind nicht enthalten, da die Gründerarbeit in der Startphase nicht vergütet wird.

#table(
  columns: (2fr, 1fr, 1fr, 1fr),
  stroke: 0.5pt + surface,
  inset: 7pt,
  align: (left, right, right, right),
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Position]],
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Jahr 1]],
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Jahr 2]],
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Jahr 3]],

  [Umsatzerlöse], [#euro-compact(revenue-y1)], [#euro-compact(revenue-y2)], [#euro-compact(revenue-y3)],
  [Gründungskosten], [−#euro-compact(founding-costs-max)], [—], [—],
  [Fixkosten], [−#euro-compact(annual-fixed-costs-y1)], [−#euro-compact(annual-fixed-costs-y2)], [−#euro-compact(annual-fixed-costs-y3)],
  [Marketing / Akquisition], [−#euro-compact(marketing-y1)], [−#euro-compact(marketing-y2)], [−#euro-compact(marketing-y3)],
  [KI-Nutzung], [−#euro-compact(ai-cost-y1)], [−#euro-compact(ai-cost-y2)], [−#euro-compact(ai-cost-y3)],
  [Variable Kosten Zusatzleistung], [−#euro-compact(variable-costs-y1)], [−#euro-compact(variable-costs-y2)], [−#euro-compact(variable-costs-y3)],
  [Recht / Datenschutz / Compliance], [−#euro-compact(legal-compliance-y1)], [−#euro-compact(legal-compliance-y2)], [−#euro-compact(legal-compliance-y3)],
  [Puffer], [−#euro-compact(contingency-y1)], [−#euro-compact(contingency-y2)], [−#euro-compact(contingency-y3)],
  [*Jahresergebnis*], [*#signed-euro-compact(result-y1)*], [*#signed-euro-compact(result-y2)*], [*#signed-euro-compact(result-y3)*],
  [*Kumuliertes Ergebnis*], [*#signed-euro-compact(cumulative-result-y1)*], [*#signed-euro-compact(cumulative-result-y2)*], [*#signed-euro-compact(cumulative-result-y3)*],
)

#v(0.3em)
#small-caption([Die Planung ist bewusst vorsichtig. Das Modell erreicht im Basisszenario erst ab Jahr 3 ein positives Jahresergebnis. Die kumulierten Anfangsaufwendungen werden in dieser konservativen Basisrechnung noch nicht vollständig ausgeglichen.])

== Liquiditätsplanung und Kapitalbedarf

Der empfohlene Finanzierungsrahmen beträgt #euro(recommended-funding). Er umfasst die GmbH-Gründung, laufende Betriebskosten, begrenzte Akquisition, rechtliche Prüfung und einen Puffer für unvorhergesehene Kosten.

#grid(
  columns: (1fr, 1fr),
  column-gutter: 12pt,
  kpi([#euro-compact(minimum-formation-need)], [Mindestbedarf Gründung inkl. Stammkapital], color: accent),
  kpi([#euro-compact(recommended-funding)], [empfohlener Finanzierungsrahmen], color: success),
)

#v(0.3em)

#table(
  columns: (2fr, 1fr, 1fr, 1fr),
  stroke: 0.5pt + surface,
  inset: 7pt,
  align: (left, right, right, right),
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Kennzahl]],
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Ende Jahr 1]],
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Ende Jahr 2]],
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Ende Jahr 3]],

  [Liquidität bei Startfinanzierung #euro-compact(recommended-funding)], [#euro-compact(cash-end-y1)], [#euro-compact(cash-end-y2)], [#euro-compact(cash-end-y3)],
)

#note(
  [Einordnung der Wirtschaftlichkeit],
  [Der Preis von 9,99 € eignet sich für eine niedrigschwellige Zusatzleistung, trägt aber allein kein starkes Gewinnmodell. Für eine höhere langfristige Wirtschaftlichkeit sind entweder deutlich höhere Nutzerzahlen, zusätzliche Antragsarten, höherwertige Servicepakete oder Partner-/B2B-Erlöse erforderlich. Diese Erlöse werden in der Basisplanung bewusst noch nicht als garantiert angesetzt.],
  color: info,
)

// ============================================================================
// 8. RISIKEN UND GEGENMASSNAHMEN
// ============================================================================

= Risiken und Gegenmaßnahmen

Die folgende Darstellung soll die wesentlichen Risiken nicht ausblenden, sondern nachvollziehbar einordnen. Für Investoren und Partner ist entscheidend, dass Risiken erkannt und mit konkreten Maßnahmen versehen werden.

#table(
  columns: (1.2fr, 2fr, 2.3fr),
  stroke: 0.5pt + surface,
  inset: 7pt,
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Risiko]],
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Beschreibung]],
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Gegenmaßnahme]],

  [Datenschutz], [Verarbeitung sensibler Familien- und Einkommensdaten.], [Datenminimierung, europäische Kerninfrastruktur, Zugriffsbeschränkungen, Dokumentation der Datenflüsse, Zero Data Retention für KI-Anfragen.],
  [Haftung / RDG], [Gefahr, als Rechtsberatung wahrgenommen zu werden.], [Positionierung als technisches Hilfsmittel, keine individuelle rechtliche Würdigung, Nutzerprüfung vor Einreichung, rechtliche Prüfung vor Ausweitung.],
  [KI-Kosten], [Kostenlose Nutzer könnten viele Freitextanfragen stellen.], [FAQ-first-Ansatz, Nutzungslimits, Budgetgrenzen, Monitoring und Missbrauchsschutz.],
  [Monetarisierung], [Kostenlose Nutzer konvertieren möglicherweise nicht ausreichend.], [Premium-Pilot ab Juli 2026, Preis-/Leistungstests, spätere Zusatzleistungen und Partneroptionen.],
  [Ressourcen], [Gründerteam studiert parallel; Schwerpunkt und Examensvorbereitung reduzieren Zeit.], [Fokus auf Elterngeld-MVP, phasenweiser Ausbau, Priorisierung der ARAG-Integration und externe Unterstützung bei Bedarf.],
  [Regulatorik], [Änderungen im Elterngeldrecht oder bei Behördenprozessen.], [Modulare Logik, regelmäßige rechtliche Prüfung und begrenzter Produktumfang zum Start.],
  [Akquisition], [Paid-Media-Kosten können höher ausfallen als geplant.], [Partnerkanäle, SEO, Referrals und reduzierte Paid-Tests statt Abhängigkeit von Anzeigen.],
)

== Ressourcenplanung und Umsetzungsrisiko

Bambini wird derzeit von einem studentischen Gründerteam aufgebaut. Die Teammitglieder studieren parallel an der Bucerius Law School. Ab dem Schwerpunktstudium und insbesondere während der späteren Staatsexamensvorbereitung ist mit einer geringeren zeitlichen Verfügbarkeit zu rechnen. Dieses Risiko wird in der Planung berücksichtigt.

Der Marktstart ist deshalb bewusst auf einen klar abgegrenzten Funktionsumfang beschränkt. Zunächst steht der kostenlose Elterngeld-Self-Service im Vordergrund. Weitere Antragsarten sowie kostenpflichtige Zusatzleistungen werden erst eingeführt, wenn der Kernprozess technisch stabil ist, rechtlich geprüft wurde und ausreichende Nutzungsdaten vorliegen.

Zur Begrenzung des Umsetzungsrisikos sieht Bambini folgende Maßnahmen vor:

- Priorisierung des Elterngeld-Antrags, der ARAG-Integration, des Datenschutzes und der rechtlichen Prüfung.
- Schrittweiser Produktausbau statt paralleler Entwicklung mehrerer Antragsarten.
- Begrenzter Test kostenpflichtiger Zusatzleistungen, bevor operative Prozesse skaliert werden.
- Möglichkeit, bei positiver Nachfrage einzelne technische oder operative Aufgaben an Werkstudierende, Freelancer oder externe Dienstleister auszulagern.
- Reduziertes Ausbauszenario, falls die zeitliche Verfügbarkeit geringer ausfällt als geplant.

// ============================================================================
// 9. TEAM UND ROADMAP
// ============================================================================

= Team und Roadmap

== Gründerteam

Bambini entsteht aus einem studentischen Gründerteam der Bucerius Law School in Hamburg. Das Team verbindet juristisches Verständnis, Produktarbeit und technische Umsetzung. Diese Kombination ist für ein Produkt im Bereich digitaler Verwaltungszugang wesentlich: Die Lösung muss nicht nur technisch funktionieren, sondern auch rechtliche Grenzen, Nutzerverständnis und behördliche Praxis berücksichtigen.

#v(0.4em)

#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  column-gutter: 8pt,
  kpi([Recht], [Familien- und Sozialleistungsbezug], color: primary),
  kpi([Tech], [Webentwicklung und Datenlogik], color: info),
  kpi([Produkt], [Nutzerführung und Prozessdesign], color: accent),
  kpi([Partner], [ARAG und weitere Kanäle], color: success),
)

#v(0.5em)

#figure(
  image("Teambild.jpg", width: 58%),
  caption: [#text(size: 7pt, fill: muted)[Gründerteam / Projektteam Bambini]],
  numbering: none,
)

== Roadmap

Die Roadmap ist bewusst phasenweise angelegt. Vorrang hat zunächst die Stabilisierung des Elterngeld-Prozesses. Erst danach werden weitere Antragsarten und zusätzliche Serviceleistungen ergänzt. Dadurch reduziert Bambini technische, rechtliche und operative Risiken in der Startphase.

#table(
  columns: (1fr, 2fr, 2fr),
  stroke: 0.5pt + surface,
  inset: 8pt,
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Zeitraum]],
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Schwerpunkt]],
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Ergebnis]],

  [H1 2026], [Elterngeld-MVP, ARAG-Einstieg, BambiniAI mit Nutzungslimits.], [Kostenloser Self-Service live, erste aktive Nutzer und Feedback.],
  [H2 2026], [Rechtliche Prüfung, Premium-Pilot ab Juli, Produktstabilisierung.], [Test der kostenpflichtigen Antragseinreichung bzw. Abwicklung.],
  [2027], [Weitere Antragsarten, strukturierter Partnerkanal, kontrollierter Ausbau.], [Höhere Zahl aktiver Nutzer und erste belastbare Monetarisierungsdaten.],
  [2028+], [Plattformausbau, mögliche B2B-/Partnerangebote, höhere Service-Tiefe.], [Skalierbares Modell mit mehreren Leistungsarten und ergänzenden Erlösquellen.],
)

// ============================================================================
// 10. AUSBLICK
// ============================================================================

= Ausblick

Bambini soll zunächst nicht durch Breite, sondern durch Verlässlichkeit im Kernprozess überzeugen. Der erste Schwerpunkt liegt auf Elterngeld, weil hier Komplexität, Bedarf und zeitliche Relevanz zusammenkommen. Aus dieser Basis kann das Produkt in zwei Richtungen wachsen: weitere Leistungsarten und höhere Service-Tiefe.

#table(
  columns: (1fr, 2fr, 2fr),
  stroke: 0.5pt + surface,
  inset: 8pt,
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Dimension]],
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Nächster Schritt]],
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Perspektive]],

  [Leistungsarten], [Kindergeld und Elternzeit nach Stabilisierung des Elterngeld-Prozesses.], [Weitere Familienleistungen nur bei ausreichender technischer und rechtlicher Grundlage.],
  [Service-Tiefe], [Standardisierte Einreichung bzw. Abwicklung als 9,99-€-Zusatzleistung.], [Höherwertige Servicepakete erst nach Prüfung von Aufwand, Haftung und Nachfrage.],
  [Partner], [ARAG als Akquisitionskanal und Feedbackquelle.], [Weitere Partner wie Versicherer, Krankenkassen, Hebammen oder Arbeitgeber.],
  [B2B], [Noch nicht tragende Säule der Basisplanung.], [Perspektivisch Corporate-Benefit-Angebote für Arbeitgeber mit planbaren Partnererlösen.],
)

#v(0.5em)

#note(
  [Kernaussage],
  [Bambini startet bewusst fokussiert und konservativ: kostenloser Elterngeld-Self-Service, kontrollierter Einsatz von KI, klare rechtliche und datenschutzrechtliche Grenzen und spätere Monetarisierung über begrenzte Zusatzleistungen. Der Plan setzt nicht auf sofortige Profitabilität, sondern auf validiertes Nutzerwachstum, niedrige Fixkosten und einen schrittweisen Ausbau des Geschäftsmodells.],
  color: success,
)

#v(1em)

#align(center)[
  #line(length: 60pt, stroke: 1pt + surface)
  #v(0.8em)
  #text(size: 9pt, fill: muted)[Kontakt: info\@bambini-claims.de · Web: bambini-claims.de]
]
