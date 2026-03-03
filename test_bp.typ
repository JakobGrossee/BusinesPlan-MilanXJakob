// Bambini Business Plan - V3: Finaler Geschäftsplan nach Meeting-Optimierung
// Struktur: 8 Kapitel, sachliche Sprache, GuV-zentriert, SWOT, Cashflow
// Ziel: ~15 Seiten, klarer roter Faden, vom Ergebnis her gedacht

#import "@preview/cetz:0.3.1": canvas, draw
#import "@preview/lilaq:0.4.0" as lq

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
#let cost-hosting = 4               // Living-Bots.net Hosting
#let cost-supabase = 0              // Supabase (Free Tier)
#let cost-dev-tools = 90            // Entwicklung (Tools, APIs)
#let cost-qes-monthly = 15          // QES (Signatur) monatlich
#let cost-steuerberater = 150       // Buchhaltung & Steuerberater (monatl. Pauschale)

// ─── Jährliche Kosten ────────────────────────────────────────────────────────
#let cost-email-annual = 20         // E-Mail-Hosting jährlich
#let cost-qes-annual = 27           // QES-Zertifikat (80€/3J ≈ 27€/Jahr)

// ─── Gründungskosten (Min/Max) ───────────────────────────────────────────────
#let cost-notar-min = 698
#let cost-notar-max = 850
#let cost-handelsregister-min = 100
#let cost-handelsregister-max = 100
#let cost-gewerbe-min = 100
#let cost-gewerbe-max = 125
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
#let b2c-year1-customers = 592

// ─── Konservative Aufschläge (Puffer für unvorhergesehene Kosten) ────────────
#let contingency-monthly-y1 = 50    // Puffer/Monat Jahr 1
#let contingency-monthly-y2 = 100   // Puffer/Monat Jahr 2
#let contingency-monthly-y3 = 150   // Puffer/Monat Jahr 3

// ─── GuV-Steuerung Jahr 2 & 3 ───────────────────────────────────────────────
#let fixed-cost-growth-y2 = 1.15    // +15% Fixkosten Jahr 2 (Wachstum)
#let fixed-cost-growth-y3 = 1.30    // +30% Fixkosten Jahr 3
#let cac-decline-y2 = 0.80          // CAC sinkt 20% (Brand Awareness)
#let cac-decline-y3 = 0.65          // CAC sinkt 35% (Referrals, SEO)


// ═══════════════════════════════════════════════════════════════════════════
// AUTOMATISCHE BERECHNUNGEN
// ═══════════════════════════════════════════════════════════════════════════

// ─── Kostenberechnungen ──────────────────────────────────────────────────────
#let monthly-fixed-costs = cost-hosting + cost-supabase + cost-dev-tools + cost-qes-monthly + cost-steuerberater
#let annual-fixed-costs = (monthly-fixed-costs * 12) + cost-email-annual + cost-qes-annual

#let founding-costs-min = cost-notar-min + cost-handelsregister-min + cost-gewerbe-min + cost-transparenz
#let founding-costs-max = cost-notar-max + cost-handelsregister-max + cost-gewerbe-max + cost-transparenz

#let total-capital-min = stammkapital + founding-costs-min
#let total-capital-max = stammkapital + founding-costs-max

// ─── Blended CAC ─────────────────────────────────────────────────────────────
#let blended-cac = (cac-arag * share-arag) + (cac-tiktok * share-tiktok) + (cac-meta * share-meta) + (cac-seo * share-seo) + (cac-referral * share-referral)

// ─── Break-Even ──────────────────────────────────────────────────────────────
#let break-even-monthly = calc.ceil(monthly-fixed-costs / (product-price - blended-cac))
#let cum-break-even = calc.ceil(
  (founding-costs-max + (monthly-fixed-costs + contingency-monthly-y1) * 3) / (product-price - cac-q1)
)

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

// ─── Puffer für unvorhergesehene Kosten ─────────────────────────────────────
#let contingency-y1 = contingency-monthly-y1 * 12
#let contingency-y2 = contingency-monthly-y2 * 12
#let contingency-y3 = contingency-monthly-y3 * 12

// ─── Gesamtkosten Jahr 1 (inkl. Gründungskosten + Puffer) ───────────────────
#let total-costs-year1 = founding-costs-max + annual-fixed-costs + marketing-year1 + contingency-y1
#let profit-year1 = revenue-year1 - total-costs-year1

// ─── Gewichteter CAC Jahr 1 ──────────────────────────────────────────────────
#let weighted-cac-year1 = marketing-year1 / customers-year1

// ─── Marktberechnungen ───────────────────────────────────────────────────────
#let serviceable-market = calc.round(births-per-year * serviceable-market-ratio)
#let segment-a-size = calc.round(births-per-year * segment-a-ratio)
#let segment-b-size = calc.round(births-per-year * segment-b-ratio)
#let market-share-year1 = (customers-year1 / serviceable-market) * 100

// ─── Szenario-Berechnungen ───────────────────────────────────────────────────
#let customers-conservative = calc.round(customers-year1 * scenario-conservative)
#let revenue-conservative = customers-conservative * product-price
#let marketing-conservative = customers-conservative * blended-cac
#let profit-conservative = revenue-conservative - founding-costs-max - annual-fixed-costs - marketing-conservative - contingency-y1

#let customers-optimistic = calc.round(customers-year1 * scenario-optimistic)
#let revenue-optimistic = customers-optimistic * product-price
#let marketing-optimistic = customers-optimistic * blended-cac
#let profit-optimistic = revenue-optimistic - founding-costs-max - annual-fixed-costs - marketing-optimistic - contingency-y1

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

// ─── 3-Jahres-GuV Berechnungen ─────────────────────────────────────────────
#let guv-result-y1 = profit-year1

#let guv-fixed-y2 = calc.round(annual-fixed-costs * fixed-cost-growth-y2)
#let cac-effective-y2 = blended-cac * cac-decline-y2
#let marketing-year2-calc = calc.round(customers-year2 * cac-effective-y2)
#let guv-result-y2 = revenue-year2 - guv-fixed-y2 - marketing-year2-calc - contingency-y2

#let guv-fixed-y3 = calc.round(annual-fixed-costs * fixed-cost-growth-y3)
#let cac-effective-y3 = blended-cac * cac-decline-y3
#let marketing-year3-calc = calc.round(customers-year3 * cac-effective-y3)
#let guv-result-y3 = revenue-year3 - guv-fixed-y3 - marketing-year3-calc - contingency-y3

#let guv-cumulative-y1 = guv-result-y1
#let guv-cumulative-y2 = guv-cumulative-y1 + guv-result-y2
#let guv-cumulative-y3 = guv-cumulative-y2 + guv-result-y3

// ─── 3-Jahres-Daten für Chart (quartalsweise) ──────────────────────────────
#let total-costs-year2 = guv-fixed-y2 + marketing-year2-calc + contingency-y2
#let total-costs-year3 = guv-fixed-y3 + marketing-year3-calc + contingency-y3

#let quarterly-revenue-y2 = revenue-year2 / 4
#let quarterly-revenue-y3 = revenue-year3 / 4
#let quarterly-costs-y2 = total-costs-year2 / 4
#let quarterly-costs-y3 = total-costs-year3 / 4

#let cum-rev-3y = (
  0,
  revenue-q1,
  revenue-q1 + revenue-q2,
  revenue-q1 + revenue-q2 + revenue-q3,
  revenue-year1,
  revenue-year1 + quarterly-revenue-y2,
  revenue-year1 + quarterly-revenue-y2 * 2,
  revenue-year1 + quarterly-revenue-y2 * 3,
  revenue-year1 + revenue-year2,
  revenue-year1 + revenue-year2 + quarterly-revenue-y3,
  revenue-year1 + revenue-year2 + quarterly-revenue-y3 * 2,
  revenue-year1 + revenue-year2 + quarterly-revenue-y3 * 3,
  revenue-year1 + revenue-year2 + revenue-year3,
)

#let cum-costs-3y = (
  founding-costs-max,
  founding-costs-max + (monthly-fixed-costs + contingency-monthly-y1) * 3 + marketing-q1,
  founding-costs-max + (monthly-fixed-costs + contingency-monthly-y1) * 6 + marketing-q1 + marketing-q2,
  founding-costs-max + (monthly-fixed-costs + contingency-monthly-y1) * 9 + marketing-q1 + marketing-q2 + marketing-q3,
  total-costs-year1,
  total-costs-year1 + quarterly-costs-y2,
  total-costs-year1 + quarterly-costs-y2 * 2,
  total-costs-year1 + quarterly-costs-y2 * 3,
  total-costs-year1 + total-costs-year2,
  total-costs-year1 + total-costs-year2 + quarterly-costs-y3,
  total-costs-year1 + total-costs-year2 + quarterly-costs-y3 * 2,
  total-costs-year1 + total-costs-year2 + quarterly-costs-y3 * 3,
  total-costs-year1 + total-costs-year2 + total-costs-year3,
)

#let cum-profit-3y = (
  cum-rev-3y.at(0) - cum-costs-3y.at(0),
  cum-rev-3y.at(1) - cum-costs-3y.at(1),
  cum-rev-3y.at(2) - cum-costs-3y.at(2),
  cum-rev-3y.at(3) - cum-costs-3y.at(3),
  cum-rev-3y.at(4) - cum-costs-3y.at(4),
  cum-rev-3y.at(5) - cum-costs-3y.at(5),
  cum-rev-3y.at(6) - cum-costs-3y.at(6),
  cum-rev-3y.at(7) - cum-costs-3y.at(7),
  cum-rev-3y.at(8) - cum-costs-3y.at(8),
  cum-rev-3y.at(9) - cum-costs-3y.at(9),
  cum-rev-3y.at(10) - cum-costs-3y.at(10),
  cum-rev-3y.at(11) - cum-costs-3y.at(11),
  cum-rev-3y.at(12) - cum-costs-3y.at(12),
)

// ─── Cashflow / Liquiditätsplanung (quartalsweise, Jahr 1) ──────────────────
#let cf-start = stammkapital
#let cf-inflow-q1 = revenue-q1
#let cf-outflow-q1 = founding-costs-max + (monthly-fixed-costs * 3) + marketing-q1 + (contingency-monthly-y1 * 3)
#let cf-end-q1 = cf-start + cf-inflow-q1 - cf-outflow-q1

#let cf-inflow-q2 = revenue-q2
#let cf-outflow-q2 = (monthly-fixed-costs * 3) + marketing-q2 + (contingency-monthly-y1 * 3)
#let cf-end-q2 = cf-end-q1 + cf-inflow-q2 - cf-outflow-q2

#let cf-inflow-q3 = revenue-q3
#let cf-outflow-q3 = (monthly-fixed-costs * 3) + marketing-q3 + (contingency-monthly-y1 * 3)
#let cf-end-q3 = cf-end-q2 + cf-inflow-q3 - cf-outflow-q3

#let cf-inflow-q4 = revenue-q4
#let cf-outflow-q4 = (monthly-fixed-costs * 3) + marketing-q4 + (contingency-monthly-y1 * 3)
#let cf-end-q4 = cf-end-q3 + cf-inflow-q4 - cf-outflow-q4

#let cf-minimum = calc.min(cf-end-q1, cf-end-q2, cf-end-q3, cf-end-q4)


// ═══════════════════════════════════════════════════════════════════════════
// FORMATIERUNGSFUNKTIONEN
// ═══════════════════════════════════════════════════════════════════════════

#let euro(value) = {
  let rounded = calc.round(value, digits: 2)
  let int-part = calc.floor(rounded)
  let decimals = calc.round((rounded - int-part) * 100)
  let formatted = str(int-part).replace(regex("[0-9](?=([0-9]{3})+(?![0-9]))"), m => m.text + ".")
  formatted + "," + if decimals < 10 { "0" + str(decimals) } else { str(decimals) } + " €"
}

#let euro-compact(value) = {
  if value >= 1000000 {
    let m = calc.round(value / 1000000, digits: 1)
    str(m) + "M €"
  } else if value >= 1000 {
    let k = calc.round(value / 1000, digits: 0)
    str(k) + "k €"
  } else {
    euro(value)
  }
}

#let pct(value) = {
  let rounded = calc.round(value, digits: 1)
  str(rounded) + "%"
}

#let num(value) = {
  let rounded = calc.round(value, digits: 0)
  str(rounded).replace(regex("[0-9](?=([0-9]{3})+(?![0-9]))"), m => m.text + ".")
}


// ═══════════════════════════════════════════════════════════════════════════
// FARBEN & DESIGN
// ═══════════════════════════════════════════════════════════════════════════

#let color-primary = rgb("#1f5a3f")   // Bambini Grün (dunkel)
#let color-accent = rgb("#e8a735")   // Gold/Warm
#let color-success = rgb("#27ae60")  // Erfolgreich
#let color-warning = rgb("#f39c12")  // Warnung
#let color-danger = rgb("#e74c3c")   // Risiko
#let color-neutral = rgb("#7f8c8d")  // Neutral
#let color-light = rgb("#ecf0f1")    // Hell
#let color-dark = rgb("#2c3e50")     // Dunkel


// ═══════════════════════════════════════════════════════════════════════════
// SEITE SETUP
// ═══════════════════════════════════════════════════════════════════════════

#set page(
  paper: "a4",
  margin: (top: 2cm, bottom: 2cm, left: 2cm, right: 2cm),
  header: locate(loc => {
    let page-num = counter(page).at(loc).first()
    if page-num > 1 [
      #set text(size: 9pt, fill: color-neutral)
      #grid(
        columns: (1fr, 1fr),
        [*Bambini Business Plan*],
        align(right)[Seite #page-num]
      )
      #v(-8pt)
      #line(length: 100%, stroke: 0.5pt + color-light)
    ]
  }),
)

#set text(font: "Calibri", size: 11pt, lang: "de")
#set par(justify: true, leading: 1.3em)


// ═══════════════════════════════════════════════════════════════════════════
// TYPOGRAFIE & ÜBERSCHRIFTEN
// ═══════════════════════════════════════════════════════════════════════════

#show heading: it => {
  set text(fill: color-primary, weight: "bold")
  if it.level == 1 {
    set text(size: 24pt)
    block(spacing: 1em, it.body)
    line(length: 100%, stroke: 2pt + color-accent)
  } else if it.level == 2 {
    set text(size: 16pt)
    block(spacing: 0.8em, it.body)
  } else if it.level == 3 {
    set text(size: 13pt)
    block(spacing: 0.5em, it.body)
  } else {
    it
  }
}

#show link: it => underline(text(fill: color-primary, it))


// ═══════════════════════════════════════════════════════════════════════════
// CUSTOM KOMPONENTEN
// ═══════════════════════════════════════════════════════════════════════════

#let highlight-box(title, content, color: color-primary) = {
  block(
    fill: color.lighten(80%),
    stroke: 2pt + color,
    inset: 12pt,
    radius: 4pt,
    [
      #set text(fill: color, weight: "bold", size: 11pt)
      #title
      #v(4pt)
      #set text(fill: color-dark, weight: "regular", size: 10pt)
      #content
    ]
  )
}

#let stat-card(label, value, color: color-primary) = {
  block(
    fill: color.lighten(90%),
    stroke: 1pt + color,
    inset: 10pt,
    radius: 3pt,
    [
      #set text(size: 9pt, fill: color, weight: "bold")
      #label
      #v(2pt)
      #set text(size: 14pt, fill: color, weight: "bold")
      #value
    ]
  )
}

#let metric-row(label, value) = {
  grid(
    columns: (2fr, 1fr),
    align: (left, right),
    [#set text(size: 10pt, fill: color-dark) #label],
    [#set text(size: 10pt, weight: "bold", fill: color-primary) #value]
  )
}

#let badge(text, color: color-primary) = {
  box(
    fill: color.lighten(85%),
    stroke: 1pt + color,
    inset: (x: 6pt, y: 3pt),
    radius: 2pt,
    text(size: 9pt, fill: color, weight: "bold", text)
  )
}

#let step-number(num) = {
  circle(
    radius: 12pt,
    fill: color-primary,
    text(size: 10pt, weight: "bold", fill: white, str(num))
  )
}

#let kpi-card(label, value, unit: "") = {
  block(
    fill: color-light,
    stroke: 1pt + color-primary,
    inset: 10pt,
    radius: 3pt,
    [
      #set text(size: 9pt, fill: color-neutral)
      #label
      #v(3pt)
      #set text(size: 13pt, weight: "bold", fill: color-primary)
      #value #unit
    ]
  )
}

#let risk-card(title, description, mitigation, color: color-danger) = {
  block(
    fill: color.lighten(90%),
    stroke: 2pt + color,
    inset: 10pt,
    radius: 3pt,
    [
      #set text(weight: "bold", size: 10pt, fill: color)
      #title
      #v(4pt)
      #set text(size: 9pt, fill: color-dark, weight: "regular")
      *Beschreibung:* #description
      #v(2pt)
      *Maßnahmen:* #mitigation
    ]
  )
}


// ═══════════════════════════════════════════════════════════════════════════
// TITELSEITE
// ═══════════════════════════════════════════════════════════════════════════

#pagebreak(weak: false)

#block(height: 100%, {
  v(3cm)
  align(center, {
    image("bambini-logo.png", width: 120pt)
    v(1.5cm)

    set text(size: 32pt, weight: "bold", fill: color-primary)
    [Bambini]

    v(0.3cm)
    set text(size: 14pt, fill: color-neutral)
    [Business Plan 2026]

    v(0.5cm)
    set text(size: 11pt, fill: color-dark)
    [Die digitale Plattform für Familienleistungen]

    v(3cm)

    set text(size: 10pt, fill: color-dark)
    [
      *Bambini GmbH (in Gründung)*

      Bucerius Law School, Hamburg

      MÄRZ 2026
    ]
  })

  v(1fr)

  align(center, {
    set text(size: 9pt, fill: color-neutral)
    [Dieses Dokument ist vertraulich und nur für die Empfänger bestimmt.]
  })
})


// ═══════════════════════════════════════════════════════════════════════════
// INHALTSVERZEICHNIS
// ═══════════════════════════════════════════════════════════════════════════

#pagebreak(weak: false)

#heading(level: 1)[Inhaltsverzeichnis]

#v(0.5cm)

#set text(size: 10pt)

#grid(
  columns: (1fr, auto),
  gutter: 0.5cm,
  [1. Executive Summary], [3],
  [2. Ausgangssituation & Problemstellung], [4],
  [3. Zielsetzung], [5],
  [4. Lösung & Geschäftsmodell], [6–8],
  [5. Wirtschaftlichkeit], [9–11],
  [6. Risiken & SWOT-Analyse], [12–13],
  [7. Team & Zeitplan], [14],
  [8. Vision & Ausblick], [15],
)

#set text(size: 11pt)


// ═══════════════════════════════════════════════════════════════════════════
// KAPITEL 1: EXECUTIVE SUMMARY
// ═══════════════════════════════════════════════════════════════════════════

#pagebreak(weak: false)

#heading(level: 1)[1. Executive Summary]

#heading(level: 3)[Das Problem]
In Deutschland gehen jährlich rund #num(calc.round(births-per-year * non-takeup-rate)) Millionen Euro Familienleistungen (Elterngeld, Kindergeld, Förderprogramme) ungenutzbar aus, weil Eltern die komplexen Antragsverfahren nicht bewältigen können. Sprachbarrieren, Bürokratie und fehlende Orientierung führen zu einer Nichtinanspruchnahme von über 70%.

#heading(level: 3)[Die Lösung]
Bambini ist eine benutzerfreundliche digitale Plattform, die deutsche Eltern durch den gesamten Prozess der Antragstellung führt – von der Beratung über die digitale Antragsfüllung bis zur Koordination mit Behörden. Der Service kostet 49,99 € pro Familie.

#heading(level: 3)[Die Zahlen]
#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 1cm,
  kpi-card("Marktpotenzial", "#num(serviceable-market) Familien/Jahr", unit: ""),
  kpi-card("Kapitalziel", euro(total-capital-max), unit: ""),
  kpi-card("Break-Even", "M #calc.round(cum-break-even / 12 / 12 + 1)", unit: ""),
)

#v(0.5cm)

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 1cm,
  kpi-card("Prognostiziert", "In Jahr 1: #num(customers-year1) Kunden", unit: ""),
  kpi-card("Jahresumsatz", euro(revenue-year1), unit: ""),
  kpi-card("Gewinn Jahr 1", euro(guv-result-y1), unit: ""),
)

#v(0.8cm)

#heading(level: 3)[Das Investitionsmodell]

#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  gutter: 0.8cm,
  stat-card("Stammkapital", euro(stammkapital), color: color-primary),
  stat-card("Gründungskosten", euro(founding-costs-max), color: color-primary),
  stat-card("Operativer Puffer", euro(ops-reserve), color: color-success),
  stat-card("Marketing/Buffer", euro(marketing-reserve + buffer), color: color-accent),
)

#v(0.8cm)

#heading(level: 3)[Warum Bambini gewinnt]

#block(
  columns: 2,
  [
    - Großer TAM: 308.250 Familien jährlich
    - Klares Geschäftsmodell: B2C (49,99 €), später B2B
    - Starke Unit Economics: LTV:CAC Verhältnis >2:1
    - Skalierbar: Software-basiert, keine Grenzkosten pro Kunde
    - Partnerschaften: ARAG signed, weitere Enterprise-Deals in Planung
  ]
)


// ═══════════════════════════════════════════════════════════════════════════
// KAPITEL 2: AUSGANGSSITUATION & PROBLEMSTELLUNG
// ═══════════════════════════════════════════════════════════════════════════

#pagebreak(weak: false)

#heading(level: 1)[2. Ausgangssituation & Problemstellung]

#heading(level: 3)[Der deutsche Familienleistungsmarkt]

Deutschland gibt jährlich ca. 80 Mrd. Euro für Familienleistungen aus – Elterngeld, Kindergeld, Förderungen, Steuervergünstigungen. Insgesamt entstehen jährlich etwa #num(serviceable-market) neue Fälle (Geburten + neue Berechtigungen).

Die Quote der *Nichtinanspruchnahme* liegt bei über 70%. Das bedeutet: Mehr als eine halbe Million Familien nutzen verfügbare Leistungen nicht, obwohl sie anspruchsberechtigt wären.

#v(0.3cm)

#grid(
  columns: (1fr, 1fr),
  gutter: 1.5cm,

  block({
    set text(size: 10pt, fill: color-dark)
    highlight-box(
      "Haupthindernisse für Antragsteller",
      [
        - Komplexe Formulare & rechtliche Anforderungen
        - Sprachbarrieren (ca. 20% der Zielgruppe)
        - Fehlende digitale Infrastruktur bei Behörden
        - Unsicherheit über Berechtigung & Fristen
        - Zeitaufwand: durchschnittlich 6–8 Stunden pro Familie
      ],
      color: color-danger
    )
  }),

  block({
    set text(size: 10pt, fill: color-dark)
    highlight-box(
      "Marktgaps",
      [
        - Keine einsteigerfreundliche, integrierte Lösung
        - Existierende Tools sind entweder zu technisch oder zu simpel
        - Behörden dürfen keine digitale Beratung leisten (Haftung)
        - Juristische Beratung bleibt kostenpflichtig
      ],
      color: color-warning
    )
  }),
)

#v(0.5cm)

#heading(level: 3)[Zielgruppensegmente]

#grid(
  columns: (1fr, 1fr),
  gutter: 1.2cm,

  block({
    set text(size: 9pt)
    highlight-box(
      "Segment A: Akademiker & Berufstätige",
      [
        ~25% der Eltern (ca. 171.250/Jahr) \
        *Bereitschaft zu zahlen:* Hoch – Zeit ist kostbar \
        *Barriere:* Digital-Affin, aber Zeit-limitiert \
        *Größeres Potential:* ~5.000 Kunden/Jahr im realistischen Szenario
      ],
      color: color-success
    )
  }),

  block({
    set text(size: 9pt)
    highlight-box(
      "Segment B: Menschen mit Sprachbarrieren",
      [
        ~20% der Eltern (ca. 137.000/Jahr) \
        *Bereitschaft zu zahlen:* Niedrig, aber notwendig \
        *Barriere:* Zugang zu digitalen Tools, Vertrauen \
        *Großes Potential:* Später B2B-Partnerschaften mit Integrationszentren
      ],
      color: color-success
    )
  }),
)

#v(0.5cm)

#heading(level: 3)[Marktgröße & Wachstum]

- *TAM (Total Addressable Market):* 308.250 Familien/Jahr × 49,99 € = 15,4 Mio. € jährlich
- *SAM (Serviceable Addressable Market):* Ca. 3–5 Mio. € (bei 5–10% Penetration)
- *SOM (Serviceable Obtainable Market):* #num(customers-year1) Kunden × 49,99 € = #euro(revenue-year1) im ersten Jahr


// ═══════════════════════════════════════════════════════════════════════════
// KAPITEL 3: ZIELSETZUNG
// ═══════════════════════════════════════════════════════════════════════════

#pagebreak(weak: false)

#heading(level: 1)[3. Zielsetzung]

#heading(level: 3)[Strategische Ziele für die kommenden 3 Jahre]

#table(
  columns: (1.5cm, 1.8cm, 1.8cm, 1.8cm, 1.8cm),
  align: center,
  inset: 8pt,
  stroke: 0.5pt,
  fill: (x, y) => if y == 0 { color-primary } else if y mod 2 == 0 { color-light } else { white },

  text(fill: white, weight: "bold", "KPI"),
  text(fill: white, weight: "bold", "Jahr 1"),
  text(fill: white, weight: "bold", "Jahr 2"),
  text(fill: white, weight: "bold", "Jahr 3"),
  text(fill: white, weight: "bold", "Status"),

  [Kunden], [#num(customers-year1)], [#num(customers-year2)], [#num(customers-year3)], [Realistisch],
  [Umsatz], [#euro-compact(revenue-year1)], [#euro-compact(revenue-year2)], [#euro-compact(revenue-year3)], [Prognostiziert],
  [Gewinn (Gesamt)], [#euro-compact(guv-result-y1)], [#euro-compact(guv-result-y2)], [#euro-compact(guv-result-y3)], [Kumulativ],
  [Marktanteil], [#pct(market-share-year1)], [#pct(market-share-year2)], [#pct(market-share-year3)], [SAM],
  [CAC (gewichtet)], [#euro-compact(weighted-cac-year1)], [#euro-compact(blended-cac * cac-decline-y2)], [#euro-compact(blended-cac * cac-decline-y3)], [Sinkend],
)

#v(0.8cm)

#heading(level: 3)[Meilensteile]

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 1cm,

  block({
    highlight-box(
      "M1: MVP + Soft-Launch",
      [*Q2 2026*: Kern-Features online, erste 50–100 Nutzer, ARAG-Partnerschaft aktiv],
      color: color-primary
    )
  }),

  block({
    highlight-box(
      "M2: Marktvalidierung",
      [*Q4 2026*: 300+ Kunden, organisches Wachstum sichtbar, CAC unter 18 €],
      color: color-primary
    )
  }),

  block({
    highlight-box(
      "M3: Skalierung & B2B",
      [*H1 2027*: 1.600+ Kunden, erste 3–5 B2B-Partner, Profitabilität nahe],
      color: color-primary
    )
  }),
)


// ═══════════════════════════════════════════════════════════════════════════
// KAPITEL 4: LÖSUNG & GESCHÄFTSMODELL
// ═══════════════════════════════════════════════════════════════════════════

#pagebreak(weak: false)

#heading(level: 1)[4. Lösung & Geschäftsmodell]

#heading(level: 3)[Die Bambini Plattform]

Bambini ist ein digitales Antragsassistenten-System mit folgenden Komponenten:

#grid(
  columns: (1fr, 1fr),
  gutter: 1cm,

  block({
    set text(size: 9pt, fill: color-dark)
    [
      *Beratungs-Chatbot*

      - Einsteigerberatung (welche Leistungen?)
      - FAQ + Behördenkontakt
      - 24/7 verfügbar
    ]
  }),

  block({
    set text(size: 9pt, fill: color-dark)
    [
      *Intelligente Antragsfüllung*

      - Vorausgefüllte Formulare
      - Logische Verzweigungen
      - Lokalisiert für alle Bundesländer
    ]
  }),

  block({
    set text(size: 9pt, fill: color-dark)
    [
      *Digitale Signatur (QES)*

      - Rechtskonformer Dokumentversand
      - Automatische Zustellung an Behörden
      - Nachverfolgung & Reminders
    ]
  }),

  block({
    set text(size: 9pt, fill: color-dark)
    [
      *Dokumentenverwaltung*

      - Sicheres Archiv (Supabase Frankfurt)
      - DSGVO-konform
      - Zugriff jederzeit
    ]
  }),
)

#v(0.8cm)

#heading(level: 3)[Geschäftsmodell]

#heading(level: 4)[B2C: Einzelnutzer]
- *Preis:* 49,99 € pro erfolgreichem Antrag
- *Value:* Familie spart 6–8 Stunden Zeit, vermeidet Fehlerrisiken
- *LTV (Lifetime Value):* ~80–100 € (durchschn. 2–3 Anträge pro Familie über 3 Jahre)
- *Zahlungsmodell:* Pay-per-use, nach erfolgreicher Antragstellung

#v(0.3cm)

#heading(level: 4)[B2B: Organisationen (Zukunft)]
- *Besipiel:* HR-Abteilung eines Unternehmens mit 200 Mitarbeitern
- *Modell:* Jahresgebühr (4 € pro Arbeitnehmer) + Gebühr pro Fall (25 €)
- *Jährliche B2B-Revenue/Kunde:* 200 × 4 € + 12 Fälle × 25 € = 1.100 €
- *Ziel Pilotphase:* 8 Piloten bis Q4 2026 → 8.800 € zusätzlich

#v(0.8cm)

#heading(level: 3)[Kundenakquisition: Vom Ergebnis her gedacht]

Um #num(customers-year1) Kunden in Jahr 1 zu erreichen, berechnet Bambini *rückwärts* von der Zielquote:

#grid(
  columns: (1fr, 1fr),
  gutter: 1.5cm,

  block({
    set text(size: 9pt, fill: color-dark)
    [
      *Kanal-Mix (Gewichtung):*

      - ARAG-Partnerschaft: 25% (0 € CAC via Partnerschaft)
      - TikTok + Meta Ads: 50% (20–28 € CAC)
      - SEO + Referrals: 25% (0–12 € CAC)

      *Blended CAC:* #euro-compact(blended-cac)
    ]
  }),

  block({
    set text(size: 9pt, fill: color-dark)
    [
      *Prognose pro Quartal:*

      - Q1: #num(customers-q1) Kunden @ 18 € CAC
      - Q2: #num(calc.round(customers-q2)) Kunden @ 15 € CAC
      - Q3: #num(calc.round(customers-q3)) Kunden @ 13 € CAC
      - Q4: #num(calc.round(customers-q4)) Kunden @ 11 € CAC

      *Trend:* Fallende CAC durch Skalierung
    ]
  }),
)

#v(0.8cm)

#heading(level: 3)[Wettbewerbsposition]

#table(
  columns: (2cm, 2cm, 2cm, 2cm, 2cm),
  align: (left, center, center, center, center),
  inset: 6pt,
  stroke: 0.5pt,
  fill: (x, y) => if y == 0 { color-primary } else if y mod 2 == 0 { color-light } else { white },

  text(fill: white, weight: "bold", size: 9pt, "Kriterium"),
  text(fill: white, weight: "bold", size: 9pt, "Bambini"),
  text(fill: white, weight: "bold", size: 9pt, "Rival A"),
  text(fill: white, weight: "bold", size: 9pt, "Rival B"),
  text(fill: white, weight: "bold", size: 9pt, "Rival C"),

  [Preis], [49,99 €], [79 €], [89 €], [Kostenlos*],
  [End-to-End-Lösung], [✓], [◐], [◐], [—],
  [QES-Signatur], [✓], [—], [✓], [—],
  [ARAG-Integration], [✓], [—], [—], [—],
  [UX/Einsteigerfreundlich], [★★★★★], [★★★], [★★★★], [★★],
)

*Rival C: Kostenlos, aber Vollmacht-abhängig (Haftungsrisiko für Nutzer)

#v(0.5cm)

#set text(size: 9pt, fill: color-neutral)
[Bambini differenziert sich durch Preis, Vollfunktionalität und vertrauenswürdige Partnerschaften (ARAG, Behörden).]


// ═══════════════════════════════════════════════════════════════════════════
// KAPITEL 5: WIRTSCHAFTLICHKEIT
// ═══════════════════════════════════════════════════════════════════════════

#pagebreak(weak: false)

#heading(level: 1)[5. Wirtschaftlichkeit]

#heading(level: 3)[Guv (Gewinn- und Verlustrechnung) – Zentrale Perspektive]

#table(
  columns: (2.5cm, 1.8cm, 1.8cm, 1.8cm),
  align: (left, right, right, right),
  inset: 7pt,
  stroke: 0.5pt,
  fill: (x, y) => if y == 0 { color-primary } else if y mod 2 == 0 { color-light } else { white },

  text(fill: white, weight: "bold", size: 9pt, "Position"),
  text(fill: white, weight: "bold", size: 9pt, "Jahr 1"),
  text(fill: white, weight: "bold", size: 9pt, "Jahr 2"),
  text(fill: white, weight: "bold", size: 9pt, "Jahr 3"),

  [*Umsatz (B2C)*], [#euro-compact(revenue-year1)], [#euro-compact(revenue-year2)], [#euro-compact(revenue-year3)],
  [Gründungskosten], [−#euro-compact(founding-costs-max)], [0 €], [0 €],
  [Betriebskosten (fix)], [−#euro-compact(annual-fixed-costs)], [−#euro-compact(guv-fixed-y2)], [−#euro-compact(guv-fixed-y3)],
  [Marketingkosten], [−#euro-compact(marketing-year1)], [−#euro-compact(marketing-year2-calc)], [−#euro-compact(marketing-year3-calc)],
  [Puffer (Kontingenz)], [−#euro-compact(contingency-y1)], [−#euro-compact(contingency-y2)], [−#euro-compact(contingency-y3)],

  text(weight: "bold", fill: color-primary, "ERGEBNIS"),
  text(weight: "bold", fill: if guv-result-y1 > 0 { color-success } else { color-danger }, euro-compact(guv-result-y1)),
  text(weight: "bold", fill: if guv-result-y2 > 0 { color-success } else { color-danger }, euro-compact(guv-result-y2)),
  text(weight: "bold", fill: if guv-result-y3 > 0 { color-success } else { color-danger }, euro-compact(guv-result-y3)),

  text(weight: "bold", fill: color-primary, "Kumulativ"),
  text(weight: "bold", fill: if guv-cumulative-y1 > 0 { color-success } else { color-danger }, euro-compact(guv-cumulative-y1)),
  text(weight: "bold", fill: if guv-cumulative-y2 > 0 { color-success } else { color-danger }, euro-compact(guv-cumulative-y2)),
  text(weight: "bold", fill: if guv-cumulative-y3 > 0 { color-success } else { color-danger }, euro-compact(guv-cumulative-y3)),
)

#v(0.8cm)

#heading(level: 3)[Break-Even Analyse]

*Monatliche Break-Even (operative Laufzeit):* #num(break-even-monthly) Kunden/Monat erforderlich, um Fixkosten zu decken.

*Kumulatives Break-Even (mit Gründungskosten):* Erreicht nach ca. #calc.round(cum-break-even / 12) Monaten.

#v(0.5cm)

*Interpretation:* Bei konservativem Plan erreicht Bambini break-even spätestens im Q3 2026 und wird danach profitabel.

#v(0.8cm)

#heading(level: 3)[3-Jahres-Prognose: Kumulativer Gewinn & Verlust]

#block(
  width: 100%,
  height: 240pt,
  canvas({
    import draw: *

    // Daten normalisieren für Chart (kumulativ)
    let data = cum-profit-3y
    let max-val = calc.max(..data.slice(5))
    let min-val = calc.min(..data.slice(0, 5))

    // Chart-Rahmen
    let chart-width = 280
    let chart-height = 200

    line((20, 20), (20, 220), stroke: 1pt + color-dark)
    line((20, 220), (300, 220), stroke: 1pt + color-dark)

    // Quadranten-Kennzeichnung
    line((20, 120), (300, 120), stroke: 0.5pt + color-light)

    // Datenpunkte zeichnen
    for (i, val) in data.enumerate() {
      let x = 20 + (i / 12) * 280
      let y-scale = if max-val > 0 { 200 / max-val } else { 1 }
      let y = 220 - (val * y-scale)

      if i == 0 {
        // Start
      } else {
        let prev-val = data.at(i - 1)
        let prev-y = 220 - (prev-val * y-scale)
        let prev-x = 20 + ((i - 1) / 12) * 280

        line((prev-x, prev-y), (x, y), stroke: 2pt + color-primary)
      }

      circle((x, y), radius: 2pt, fill: if val < 0 { color-danger } else { color-success })
    }

    // Achsenbeschriftungen
    text((10, 225), align: right, [0 €], size: 8pt, fill: color-neutral)
    text((10, 120), align: right, [–#euro-compact(calc.abs(min-val)), ...], size: 8pt, fill: color-neutral)
    text((10, 20), align: right, [#euro-compact(max-val)], size: 8pt, fill: color-neutral)

    text((20, 235), align: center, [Q0], size: 8pt, fill: color-neutral)
    text((160, 235), align: center, [12M], size: 8pt, fill: color-neutral)
    text((300, 235), align: center, [36M], size: 8pt, fill: color-neutral)
  })
)

#v(0.3cm)

#set text(size: 9pt, fill: color-neutral)
[Die Kurve zeigt: Break-Even in Q3 2026, danach schnelle Renditekurve. Jahr 3 zeigt über #euro-compact(guv-cumulative-y3) kumulativen Gewinn.]

#set text(size: 11pt, fill: color-dark)

#v(0.8cm)

#heading(level: 3)[Liquidität & Cashflow (Jahr 1)]

#table(
  columns: (2cm, 1.5cm, 1.5cm, 1.5cm, 1.5cm),
  align: (left, right, right, right, right),
