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
#let blended-cac = (
  (cac-arag * share-arag)
    + (cac-tiktok * share-tiktok)
    + (cac-meta * share-meta)
    + (cac-seo * share-seo)
    + (cac-referral * share-referral)
)

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
  revenue-year1, // Ende Jahr 1
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
  founding-costs-max + annual-fixed-costs + marketing-year1, // Ende Jahr 1
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

// ─── Puffer (Contingency) ──────────────────────────────────────────────────
#let contingency-y1 = contingency-monthly-y1 * 12
#let contingency-y2 = contingency-monthly-y2 * 12
#let contingency-y3 = contingency-monthly-y3 * 12

// ─── Kumul. Break-Even (inkl. Gründungskosten + Fixkosten + Marketing) ─────
#let cum-break-even = calc.ceil(
  (founding-costs-max + (monthly-fixed-costs + contingency-monthly-y1) * 3) / (product-price - cac-q1),
)

// ─── Gesamtkosten Jahr 1 (inkl. Gründungskosten + Puffer) ───────────────────
#let total-costs-year1 = founding-costs-max + annual-fixed-costs + marketing-year1 + contingency-y1
#let profit-year1-full = revenue-year1 - total-costs-year1

// ─── 3-Jahres-GuV Berechnungen ─────────────────────────────────────────────
#let guv-result-y1 = profit-year1-full

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
        [BAMBINI BUSINESS PLAN], [MÄRZ 2026],
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


// ─── Risk Card Component ────────────────────────────────────────────────────
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


// ============================================================================
// COVER PAGE
// ============================================================================

#page(header: none, footer: none, margin: 0pt)[
  #block(width: 100%, height: 6pt, fill: gradient.linear(primary, accent))

  #v(1fr)

  #align(center)[
    #block(width: 80pt, height: 3pt, fill: gradient.linear(primary, accent), radius: 2pt)
    #v(1.2cm)

    #image("bambini-logo.png", width: 250pt)

    #v(0.5cm)

    #text(size: 13pt, fill: muted, tracking: 1pt, weight: "medium")[
      DIGITALE ANTRAGSPLATTFORM FÜR FAMILIENLEISTUNGEN
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
      Geschäftsplan für die GmbH-Gründung und Wachstumsfinanzierung
    ]

    #v(3cm)

    #grid(
      columns: (auto, auto),
      column-gutter: 15pt,
      badge("März 2026", color: primary), badge("GmbH i.Gr.", color: info),
    )
  ]

  #v(1fr)

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
// 1. EXECUTIVE SUMMARY
// ============================================================================

= Executive Summary

#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  column-gutter: 10pt,
  stat-card(euro(product-price), "Preis pro Familie", color: primary),
  stat-card([#num(customers-year1)], "Kunden Jahr 1", color: info),
  stat-card(euro-compact(revenue-year1), "Umsatz Jahr 1", color: success),
  stat-card(euro-compact(total-capital-max), "Kapitalbedarf", color: accent),
)

#v(1em)

*Bambini* ist eine digitale Plattform, über die Eltern in Deutschland alle wesentlichen Familienleistungen – Elterngeld, Kindergeld, Elternzeit, Mutterschaftsgeld und Kinderzuschlag – in einer einzigen Anwendung beantragen können. Statt sich durch über 500 Seiten Formulare und mehr als 130 zuständige Stellen zu navigieren, führt Bambini in wenigen Minuten zum fertigen, digital versandten Antrag.

#v(0.5em)

#box(fill: light-bg, inset: 16pt, radius: 8pt, width: 100%)[
  #metric-row([Zielmarkt (Serviceable Market)], [*~#num(serviceable-market) Familien/Jahr*])
  #metric-row([Produktpreis (Einmalzahlung)], [*#euro(product-price)*])
  #metric-row([Operative Fixkosten], [*#euro(monthly-fixed-costs)/Monat*])
  #metric-row([Kumulativer Break-Even], [*~#cum-break-even Kunden*])
  #metric-row([Gesamtkapitalbedarf], [*#euro(total-capital-min) – #euro(total-capital-max)*])
]

#v(0.5em)

Das Geschäftsmodell basiert auf einer Einmalzahlung (#euro(product-price)) pro Familie. Die operativen Fixkosten liegen bei #euro(monthly-fixed-costs)/Monat (inkl. Buchhaltung/Steuerberater), sodass bereits ab ca. #cum-break-even zahlenden Kunden alle Anfangskosten gedeckt sind. Zur GmbH-Gründung werden #euro(total-capital-min) – #euro(total-capital-max) benötigt (Stammkapital + Gründungskosten). Im realistischen Szenario erreicht Bambini im ersten Jahr #num(customers-year1) Kunden bei einem Umsatz von #euro-compact(revenue-year1).


// ============================================================================
// 2. AUSGANGSSITUATION & PROBLEMSTELLUNG
// ============================================================================

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

Deutschland verfügt über eines der umfangreichsten Systeme für Familienleistungen weltweit. Die tatsächliche Inanspruchnahme liegt jedoch deutlich unter dem Anspruchsniveau. Das System ist für Antragsteller schwer navigierbar: Über _130 zuständige Stellen_ bundesweit, _mehr als 500 Seiten an Anträgen und Leitfäden_ und ein möglicher finanzieller Verlust von ca. *8.000 € pro Familie* durch Fehlberechnungen, verpasste Fristen oder unbekannte Zusatzleistungen.

#v(0.3em)

#box(
  fill: light-bg,
  inset: 14pt,
  radius: 8pt,
  width: 100%,
  stroke: (left: 3pt + primary-light),
)[
  _"Das [...] Antragsformular ist extrem kompliziert, wenig bürgerfreundlich und nicht barrierefrei."_
  #h(1fr)
  #text(fill: muted, size: 9pt)[— Hannover.de, Offizielle Stadtwebsite]
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
      #text(size: 9pt, fill: muted)[Familien/Jahr (#pct(serviceable-market-ratio * 100))]
    ]
  ],
)

#v(0.5em)

*Primäre Zielgruppen:* Akademikerfamilien mit hohem Zeitdruck (~#num(segment-a-size)/Jahr, #calc.round(segment-a-ratio * 100)%) und Familien mit Sprachbarrieren (~#num(segment-b-size)/Jahr, #calc.round(segment-b-ratio * 100)%), die überproportional von der Antrags-Komplexität betroffen sind.


// ============================================================================
// 3. ZIELSETZUNG
// ============================================================================

= Zielsetzung

Bambini verfolgt das Ziel, den Zugang zu Familienleistungen in Deutschland zu vereinfachen und die Nichtinanspruchnahme messbar zu reduzieren. Die operative Zielsetzung für die ersten drei Geschäftsjahre:

#v(0.5em)

#grid(
  columns: (1fr, 1fr, 1fr),
  column-gutter: 10pt,

  box(
    fill: primary.lighten(95%),
    inset: 14pt,
    radius: 10pt,
    width: 100%,
    stroke: (top: 3pt + primary, rest: 1pt + surface),
  )[
    #align(center)[
      #text(weight: "bold", fill: primary, size: 10pt)[Jahr 1]
      #v(8pt)
      #text(size: 22pt, weight: "bold", fill: primary)[#num(customers-year1)]
      #v(2pt)
      #text(size: 8pt, fill: muted)[Kunden]
      #v(8pt)
      #text(size: 14pt, weight: "bold", fill: dark)[#euro-compact(revenue-year1)]
      #v(2pt)
      #text(size: 8pt, fill: muted)[Umsatz]
      #v(8pt)
      #text(size: 11pt, fill: muted)[#pct(market-share-year1) SAM]
    ]
  ],

  box(
    fill: info.lighten(95%),
    inset: 14pt,
    radius: 10pt,
    width: 100%,
    stroke: (top: 3pt + info, rest: 1pt + surface),
  )[
    #align(center)[
      #text(weight: "bold", fill: info, size: 10pt)[Jahr 2]
      #v(8pt)
      #text(size: 22pt, weight: "bold", fill: info)[#num(customers-year2)]
      #v(2pt)
      #text(size: 8pt, fill: muted)[Kunden]
      #v(8pt)
      #text(size: 14pt, weight: "bold", fill: dark)[#euro-compact(revenue-year2)]
      #v(2pt)
      #text(size: 8pt, fill: muted)[Umsatz]
      #v(8pt)
      #text(size: 11pt, fill: muted)[#pct(market-share-year2) SAM]
    ]
  ],

  box(
    fill: success.lighten(95%),
    inset: 14pt,
    radius: 10pt,
    width: 100%,
    stroke: (top: 3pt + success, rest: 1pt + surface),
  )[
    #align(center)[
      #text(weight: "bold", fill: success, size: 10pt)[Jahr 3]
      #v(8pt)
      #text(size: 22pt, weight: "bold", fill: success)[#num(customers-year3)]
      #v(2pt)
      #text(size: 8pt, fill: muted)[Kunden]
      #v(8pt)
      #text(size: 14pt, weight: "bold", fill: dark)[#euro-compact(revenue-year3)]
      #v(2pt)
      #text(size: 8pt, fill: muted)[Umsatz]
      #v(8pt)
      #text(size: 11pt, fill: muted)[#pct(market-share-year3) SAM]
    ]
  ],
)

#v(0.5em)

*Strategische Ziele:* Profitabilität ab Jahr 1 durch niedrige Fixkosten. Aufbau einer skalierbaren Plattform für weitere Leistungsarten. Validierung des Geschäftsmodells über die ARAG-Partnerschaft. Langfristig: Etablierung als zentrale Anlaufstelle für Familienleistungen in Deutschland.

// ============================================================================
// 4. LÖSUNG & GESCHÄFTSMODELL
// ============================================================================

= Lösung & Geschäftsmodell

== Die Bambini-Plattform

Bambini digitalisiert den gesamten Antragsprozess für Familienleistungen. Die Plattform führt Nutzer in wenigen Minuten durch einen strukturierten Prozess:

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
      *Daten erfassen* – 10 strukturierte Fragen zu Familie, Einkommen, Elternzeit-Planung. KI-gestützte Dokumentenerkennung für Gehaltsnachweise und Geburtsurkunden.
    ],

    step-number(2),
    [
      *Ansprüche ermitteln* – Automatische Prüfung aller Leistungen (Elterngeld, Kindergeld, Elternzeit, Kinderzuschlag). Berechnung der optimalen Kombination.
    ],

    step-number(3),
    [
      *Antrag generieren & versenden* – Vollständiger, fehlerfreier Antrag wird automatisch erstellt und digital an die zuständige Behörde übermittelt.
    ],
  )
]

#v(0.5em)

#pagebreak()

#highlight-box(color: info, title: [BambiniAI – KI-Assistent])[
  Ergänzend zum Antragsprozess steht Nutzern ein KI-gestützter Assistent zur Verfügung, der rund um die Uhr Fragen zu Familienleistungen beantwortet – mehrsprachig und auf Basis einer RAG-Wissensdatenbank mit aktuellen BEEG-Inhalten. BambiniAI gibt allgemeine Orientierung zu Ansprüchen, Fristen und Berechnungen, ersetzt jedoch keine individuelle Rechtsberatung.
]

== Preismodell

#grid(
  columns: (1fr, 1fr),
  column-gutter: 15pt,
  box(fill: light-bg, inset: 16pt, radius: 8pt, width: 100%)[
    #text(weight: "bold", fill: dark)[B2C-Modell]
    #v(6pt)
    #text(size: 28pt, weight: "bold", fill: primary)[#euro(product-price)]
    #v(2pt)
    Einmalzahlung pro Familie. Beinhaltet alle Antragsarten, BambiniAI-Zugang und digitalen Versand. Kein Abonnement.
  ],
  box(fill: light-bg, inset: 16pt, radius: 8pt, width: 100%)[
    #text(weight: "bold", fill: dark)[B2B-Modell (ab 2027)]
    #v(6pt)
    #text(size: 28pt, weight: "bold", fill: info)[#b2b-pepy–5 € PEPY]
    #v(2pt)
    Jahrespauschale pro Mitarbeiter + #euro(b2b-case-fee)–35 € pro Antragsfall. Corporate Employee Benefit für HR-Abteilungen.
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


== Kundengewinnung

*Zielsetzung:* #num(customers-year1) Kunden im ersten Jahr bei einem Blended CAC von ~#euro(calc.round(blended-cac)). Die Strategie setzt auf einen diversifizierten Kanal-Mix mit der ARAG-Partnerschaft als kosteneffizientestem Kanal.

#v(0.3em)

#table(
  columns: (2fr, auto, auto, auto),
  fill: (x, y) => if y == 0 { primary } else if y == 6 { success.lighten(85%) } else if calc.odd(y) { light-bg } else {
    white
  },
  stroke: 0.5pt + surface,
  inset: 9pt,

  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Kanal]],
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[CAC]],
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Anteil]],
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Gewichtet]],

  [ARAG-Partnerschaft], [#euro(cac-arag)], [#pct(share-arag * 100)], [#euro(cac-arag * share-arag)],
  [TikTok Ads], [#euro(cac-tiktok)], [#pct(share-tiktok * 100)], [#euro(cac-tiktok * share-tiktok)],
  [Meta/Instagram Ads], [#euro(cac-meta)], [#pct(share-meta * 100)], [#euro(cac-meta * share-meta)],
  [SEO/Organic], [#euro(cac-seo)], [#pct(share-seo * 100)], [#euro(cac-seo * share-seo)],
  [Referral-Programm], [#euro(cac-referral)], [#pct(share-referral * 100)], [#euro(cac-referral * share-referral)],
  [*Blended CAC*], [*~#euro(calc.round(blended-cac))*], [*100%*], [],
)

#v(0.3em)

*TikTok als Primärkanal:* Niedrigster CPM (3–12 €), hohe organische Reichweite in Nischen, 42% der Nutzer in der Kernzielgruppe 25–44 Jahre.

*ARAG-Partnerschaft:* Kunden werden über die ARAG-Kundenreise an Bambini vermittelt. CAC effektiv 0 €. Die Partnerschaft ist unterzeichnet, die technische Integration wird in Q1 2026 umgesetzt.


// ============================================================================
// 5. WIRTSCHAFTLICHKEIT
// ============================================================================

= Wirtschaftlichkeit

== Gewinn- und Verlustrechnung (3-Jahres-Projektion)

Die folgende GuV zeigt die Projektion über drei Geschäftsjahre. Aufwendungen sind bewusst großzügig dargestellt (inkl. Puffer für unvorhergesehene Kosten).

#v(0.3em)

#table(
  columns: (2.5fr, auto, auto, auto),
  fill: (x, y) => if y == 0 { primary } else if y == 6 { success.lighten(85%) } else if y == 7 {
    info.lighten(90%)
  } else if calc.odd(y) { light-bg } else { white },
  stroke: 0.5pt + surface,
  inset: 10pt,
  align: (left, right, right, right),

  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Position]],
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Jahr 1]],
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Jahr 2]],
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Jahr 3]],

  [*Umsatzerlöse* (#num(customers-year1) / #num(customers-year2) / #num(customers-year3) Kunden)],
  [#euro-compact(revenue-year1)],
  [#euro-compact(revenue-year2)],
  [#euro-compact(revenue-year3)],

  [Gründungskosten (einmalig)],
  [−#euro-compact(founding-costs-max)],
  [—],
  [—],

  [Betriebskosten (fix)],
  [−#euro-compact(annual-fixed-costs)],
  [−#euro-compact(guv-fixed-y2)],
  [−#euro-compact(guv-fixed-y3)],

  [Marketingkosten (variabel)],
  [−#euro-compact(marketing-year1)],
  [−#euro-compact(marketing-year2-calc)],
  [−#euro-compact(marketing-year3-calc)],

  [Sonstige / Puffer],
  [−#euro(contingency-y1)],
  [−#euro-compact(contingency-y2)],
  [−#euro-compact(contingency-y3)],

  [*Jahresergebnis*],
  [*#if guv-result-y1 >= 0 [+]#euro-compact(guv-result-y1)*],
  [*+#euro-compact(guv-result-y2)*],
  [*+#euro-compact(guv-result-y3)*],

  [*Kumulatives Ergebnis*],
  [*#if guv-cumulative-y1 >= 0 [+]#euro-compact(guv-cumulative-y1)*],
  [*+#euro-compact(guv-cumulative-y2)*],
  [*+#euro-compact(guv-cumulative-y3)*],
)

#v(0.3em)
#text(size: 8pt, fill: muted)[
  Annahmen: Keine Personalkosten (unbezahlte Gründerarbeit in der Startphase). Fixkosten inkl. Buchhaltung/Steuerberater (#euro(cost-steuerberater)/Mon.). Sinkender CAC durch Brand Awareness und Referrals (J2: #pct(cac-decline-y2 * 100), J3: #pct(cac-decline-y3 * 100) des Ausgangs-CAC). Leicht steigende Fixkosten durch Plattformwachstum. Keine Versicherungs- oder Datenschutzbeauftragtenkosten erforderlich.
]

== Fixkostenübersicht

Die folgenden operativen Fixkosten fallen unabhängig von der Kundenzahl an. Es sind ausdrücklich *keine* Personalkosten enthalten (unbezahlte Gründerarbeit in der Startphase). Eine Berufshaftpflichtversicherung ist für das Geschäftsmodell nicht erforderlich (kein Beratungsmandat). Ein externer Datenschutzbeauftragter ist bei unter 20 Mitarbeitern gesetzlich nicht vorgeschrieben.

#v(0.3em)

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
    [E-Mail-Hosting], [—], [#euro(cost-email-annual)],
    [QES-Zertifikat], [—], [~#euro(cost-qes-annual)],
    table.hline(stroke: 1pt + surface),
    [*Gesamt*], [*#euro(monthly-fixed-costs)*], [*#euro(annual-fixed-costs)*],
  )
]

== Break-Even-Analyse (3 Jahre)

#import "@preview/lilaq:0.4.0" as lq

Der kumulative Break-Even – ab dem alle Anfangsinvestitionen (Gründungskosten #euro(founding-costs-max)), laufende Kosten und Puffer amortisiert sind – wird nach ca. *#cum-break-even zahlenden Kunden* erreicht. Danach wächst der kumulative Gewinn kontinuierlich.

#v(0.3em)

#box(
  fill: white,
  inset: 18pt,
  radius: 10pt,
  width: 100%,
  stroke: 1pt + surface,
)[
  #text(weight: "bold", size: 11pt)[Kumulatives Ergebnis über 3 Jahre (quartalsweise)]

  #v(12pt)

  #let quarters = (0, 3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33, 36)
  #let revenue-values = cum-rev-3y.map(v => v / 1000)
  #let costs-values = cum-costs-3y.map(v => v / 1000)
  #let profit-values = cum-profit-3y.map(v => v / 1000)

  #show lq.selector(lq.grid): hide
  #lq.diagram(
    width: 14cm,
    height: 7cm,
    xlabel: [Monat],
    ylabel: [Kumulativ (Tsd. €)],
    xlim: (0, 36),
    ylim: (-5, 280),
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
      label: [Gewinn],
    ),
  )

  #v(6pt)

  #grid(
    columns: (1fr, 1fr, 1fr),
    column-gutter: 12pt,
    align: center,
    [
      #text(size: 8pt, fill: primary)[Kum. Gewinn Ende Jahr 1]
      #v(2pt)
      #text(size: 11pt, fill: primary, weight: "bold")[+#euro-compact(guv-cumulative-y1)]
    ],
    [
      #text(size: 8pt, fill: primary)[Kum. Gewinn Ende Jahr 2]
      #v(2pt)
      #text(size: 11pt, fill: primary, weight: "bold")[+#euro-compact(guv-cumulative-y2)]
    ],
    [
      #text(size: 8pt, fill: primary)[Kum. Gewinn Ende Jahr 3]
      #v(2pt)
      #text(size: 11pt, fill: primary, weight: "bold")[+#euro-compact(guv-cumulative-y3)]
    ],
  )
]

== Szenario-Vergleich

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
      #badge("KONSERVATIV", color: danger)
      #v(3pt)
      #text(size: 9pt, fill: muted)[Kunden:] *#num(customers-conservative)* \
      #text(size: 9pt, fill: muted)[Umsatz:] *#euro-compact(revenue-conservative)* \
      #text(size: 9pt, fill: muted)[Ergebnis:] *+#euro-compact(profit-conservative)*
    ]
  ],

  box(
    fill: success.lighten(95%),
    inset: 16pt,
    radius: 10pt,
    width: 100%,
    stroke: 2pt + success,
  )[
    #align(center)[
      #badge("REALISTISCH", color: success)
      #v(3pt)
      #text(size: 9pt, fill: muted)[Kunden:] *#num(customers-year1)* \
      #text(size: 9pt, fill: muted)[Umsatz:] *#euro-compact(revenue-year1)* \
      #text(size: 9pt, fill: muted)[Ergebnis:] *+#euro-compact(profit-year1-full)*
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
      #badge("OPTIMISTISCH", color: info)
      #v(3pt)
      #text(size: 9pt, fill: muted)[Kunden:] *#num(customers-optimistic)* \
      #text(size: 9pt, fill: muted)[Umsatz:] *#euro-compact(revenue-optimistic)* \
      #text(size: 9pt, fill: muted)[Ergebnis:] *+#euro-compact(profit-optimistic)*
    ]
  ],
)

#v(0.5em)
#text(
  size: 9pt,
  fill: muted,
)[Alle drei Szenarien sind profitabel ab Jahr 1. Auch im konservativen Fall (nur 74% des Ziels) deckt der Umsatz alle Kosten, da die Fixkosten mit #euro(monthly-fixed-costs)/Monat niedrig sind.]

== Liquiditätsplanung (Jahr 1)

Der Cashflow zeigt quartalsweise, wie sich die Liquidität aus dem eingezahlten Stammkapital (#euro(stammkapital)) und den laufenden Einnahmen entwickelt.

#v(0.3em)

#table(
  columns: (2fr, auto, auto, auto, auto),
  fill: (x, y) => if y == 0 { info } else if y == 5 { info.lighten(90%) } else if calc.odd(y) { light-bg } else {
    white
  },
  stroke: 0.5pt + surface,
  inset: 9pt,
  align: (left, right, right, right, right),

  table.cell(fill: info)[#text(fill: white, weight: "bold")[Position]],
  table.cell(fill: info)[#text(fill: white, weight: "bold")[Q1]],
  table.cell(fill: info)[#text(fill: white, weight: "bold")[Q2]],
  table.cell(fill: info)[#text(fill: white, weight: "bold")[Q3]],
  table.cell(fill: info)[#text(fill: white, weight: "bold")[Q4]],

  [Anfangsbestand],
  [#euro-compact(cf-start)],
  [#euro-compact(cf-end-q1)],
  [#euro-compact(cf-end-q2)],
  [#euro-compact(cf-end-q3)],
  [\+ Einnahmen],
  [#euro-compact(cf-inflow-q1)],
  [#euro-compact(cf-inflow-q2)],
  [#euro-compact(cf-inflow-q3)],
  [#euro-compact(cf-inflow-q4)],
  [− Ausgaben],
  [#euro-compact(cf-outflow-q1)],
  [#euro-compact(cf-outflow-q2)],
  [#euro-compact(cf-outflow-q3)],
  [#euro-compact(cf-outflow-q4)],
  [], [], [], [], [],
  [*Endbestand*],
  [*#euro-compact(cf-end-q1)*],
  [*#euro-compact(cf-end-q2)*],
  [*#euro-compact(cf-end-q3)*],
  [*#euro-compact(cf-end-q4)*],
)

#v(0.3em)

#highlight-box(color: info, title: [Liquiditätsbewertung])[
  Der niedrigste Kassenbestand liegt bei #euro-compact(cf-minimum) (Ende Q1, nach Abzug der Gründungskosten und erster Betriebskosten). Das Stammkapital von #euro(stammkapital) zusammen mit den ab Q1 fließenden Einnahmen reicht aus, um den Geschäftsbetrieb durchgehend zu finanzieren. Ab Q2 wächst der Kassenbestand kontinuierlich.
]

== Kapitalbedarf & Mittelverwendung

#grid(
  columns: (1fr, 1fr),
  column-gutter: 15pt,

  box(
    fill: success.lighten(93%),
    stroke: 2pt + success,
    radius: 10pt,
    inset: 16pt,
    width: 100%,
  )[
    #align(center)[
      #text(size: 10pt, weight: "bold", fill: success)[Gesamtkapitalbedarf]
      #v(4pt)
      #text(size: 20pt, weight: "bold", fill: success)[#euro(total-capital-min) – #euro(total-capital-max)]
      #v(4pt)
      #text(
        size: 8pt,
        fill: muted,
      )[Stammkapital #euro(stammkapital) + Gründungskosten #euro(founding-costs-min)–#euro(founding-costs-max)]
    ]
  ],

  box(
    fill: light-bg,
    inset: 16pt,
    radius: 10pt,
    width: 100%,
    stroke: 1pt + surface,
  )[
    #text(weight: "bold", fill: dark, size: 10pt)[Verwendung Stammkapital]
    #v(8pt)
    #metric-row([Betriebskosten (#runway-months Mon.)], euro(ops-reserve))
    #metric-row([Marketing (#runway-months Mon.)], euro(marketing-reserve))
    #metric-row([Puffer], euro(buffer))
  ],
)

#v(0.3em)
#text(size: 8pt, fill: muted)[
  Das Stammkapital (#euro(stammkapital)) ist nicht gebunden und steht dem Geschäftsbetrieb zur Verfügung. Die Gründungskosten (#euro(founding-costs-min)–#euro(founding-costs-max)) umfassen Notar, Handelsregister, Gewerbeanmeldung und Transparenzregister.
]


// ============================================================================
// 6. RISIKEN & SWOT-ANALYSE
// ============================================================================

= Risiken & SWOT-Analyse

== SWOT-Analyse

#let swot-cell(bg-color, border-color, label, items) = {
  box(
    fill: bg-color,
    inset: 14pt,
    width: 100%,
  )[
    #text(weight: "bold", fill: border-color, size: 10pt)[#label]
    #v(6pt)
    #text(size: 8.5pt)[#items]
  ]
}

#grid(
  columns: (1fr, 1fr),
  column-gutter: 0pt,
  row-gutter: 0pt,

  // ── Stärken (intern, positiv) ──
  box(stroke: (right: 1pt + surface, bottom: 1pt + surface))[
    #swot-cell(success.lighten(93%), success, [S – Stärken (intern)], [
      - Niedrige Fixkosten (#euro(monthly-fixed-costs)/Mon.) – geringes Verlustrisiko
      - Volldigitaler Prozess inkl. QES-Versand an Behörden
      - 5\+ Leistungsarten in einer Plattform (Wettbewerb: je 1)
      - Mehrsprachigkeit – erschließt unterversorgte Zielgruppen
      - Strategische ARAG-Partnerschaft (CAC effektiv 0 €)
    ])
  ],

  // ── Schwächen (intern, negativ) ──
  box(stroke: (bottom: 1pt + surface))[
    #swot-cell(danger.lighten(93%), danger, [W – Schwächen (intern)], [
      - Kein Track Record – Neugründung ohne Markthistorie
      - Studentisches Gründerteam – begrenzte operative Erfahrung
      - Begrenztes Marketingbudget in der Startphase
      - Abhängigkeit von unbezahlter Gründerarbeit
      - Behörden-Integration noch nicht zertifiziert
    ])
  ],

  // ── Chancen (extern, positiv) ──
  box(stroke: (right: 1pt + surface))[
    #swot-cell(info.lighten(93%), info, [O – Chancen (extern)], [
      - #calc.round(non-takeup-rate * 100)% Nichtinanspruchnahme = ungenutzter Markt
      - Verwaltungsdigitalisierung durch Gesetzgeber (OZG 2.0)
      - Kein dominanter Wettbewerber im Vollservice-Segment
      - B2B-Expansion als Corporate Employee Benefit
      - Wachsende Akzeptanz KI-gestützter Verwaltungslösungen
    ])
  ],

  // ── Risiken (extern, negativ) ──
  swot-cell(accent.lighten(90%), accent.darken(10%), [T – Risiken (extern)], [
    - *R1* – Haftung bei fehlerhafter Berechnung
    - *R2* – DSGVO-Verstoß oder Datenschutzvorfall
    - *R3* – Regulatorische Änderungen (BEEG-Reform)
    - *R4* – Wettbewerber erreichen Feature-Parität
    - *R5* – CAC höher als prognostiziert / Partnerkanäle stagnieren
  ]),
)

#v(0.3em)
#text(
  size: 8pt,
  fill: muted,
)[Die nachfolgenden Mitigation-Strategien adressieren systematisch die fünf identifizierten Risiken (R1–R5).]

== Mitigation: Haftung & Datenschutz #text(size: 9pt, fill: muted)[(→ R1, R2)]

#grid(
  columns: (1fr, 1fr),
  column-gutter: 12pt,
  row-gutter: 12pt,

  // ── R1: Haftungskonzept ──
  box(
    fill: white,
    inset: 14pt,
    radius: 10pt,
    width: 100%,
    stroke: (left: 4pt + primary, rest: 1pt + surface),
  )[
    #text(weight: "bold", fill: primary-dark, size: 10pt)[R1 · Haftung bei fehlerhafter Berechnung]
    #v(2pt)
    #badge("Niedrig", color: success)
    #v(8pt)
    #text(size: 9pt)[
      #grid(
        columns: (auto, 1fr),
        column-gutter: 8pt,
        row-gutter: 6pt,
        text(fill: success, weight: "bold")[✓],
        [Bambini ist *technisches Hilfsmittel* – ausdrücklich *keine Rechtsberatung* (§ 2 Abs. 1 RDG)],

        text(fill: success, weight: "bold")[✓], [Berechnungen rein rechnerisch, ohne individuelle rechtliche Würdigung],
        text(fill: success, weight: "bold")[✓],
        [Haftung in AGB auf Vorsatz und grobe Fahrlässigkeit beschränkt (§ 309 Nr. 7 BGB-konform)],

        text(fill: success, weight: "bold")[✓], [Nutzer bestätigen Angaben vor Versand – Eigenverantwortung],
        text(fill: success, weight: "bold")[✓],
        [KI-Assistent gibt allgemeine Orientierung – keine verbindlichen Auskünfte],
      )
    ]
  ],

  // ── R2: Datenschutz ──
  box(
    fill: white,
    inset: 14pt,
    radius: 10pt,
    width: 100%,
    stroke: (left: 4pt + info, rest: 1pt + surface),
  )[
    #text(weight: "bold", fill: info, size: 10pt)[R2 · Datenschutzvorfall / DSGVO]
    #v(2pt)
    #badge("Niedrig", color: success)
    #v(8pt)
    #text(size: 9pt)[
      #grid(
        columns: (auto, 1fr),
        column-gutter: 8pt,
        row-gutter: 6pt,
        text(fill: success, weight: "bold")[✓], [Kerndaten im EWR: Supabase Frankfurt + Living-Bots.net Bremen],
        text(fill: success, weight: "bold")[✓], [KI-Dienste über EU-Standardvertragsklauseln abgesichert],
        text(fill: success, weight: "bold")[✓], [Kein DSB erforderlich (< 20 Mitarbeiter, § 38 BDSG)],
        text(fill: success, weight: "bold")[✓], [Datensparsamkeit: Zweckbindung, Löschung nach Abschluss],
        text(fill: success, weight: "bold")[✓], [Vollständige Datenschutzerklärung erstellt und veröffentlicht],
      )
    ]
  ],
)

== Mitigation: Markt & Regulierung #text(size: 9pt, fill: muted)[(→ R3, R4, R5)]

#grid(
  columns: (1fr, 1fr, 1fr),
  column-gutter: 10pt,
  row-gutter: 10pt,

  // ── R3: Regulatorische Änderungen ──
  box(
    fill: white,
    inset: 14pt,
    radius: 10pt,
    width: 100%,
    stroke: (top: 3pt + accent, rest: 1pt + surface),
  )[
    #text(weight: "bold", fill: accent.darken(10%), size: 9pt)[R3 · Regulatorische Änderungen]
    #v(2pt)
    #badge("Niedrig", color: success)
    #v(6pt)
    #text(size: 8.5pt)[
      Modulare Architektur ermöglicht schnelle Anpassung an Gesetzesänderungen (BEEG-Reform, OZG 2.0). Die fortschreitende Verwaltungsdigitalisierung ist zugleich eine *Chance*: Digitale Behördenschnittstellen begünstigen das Geschäftsmodell langfristig.
    ]
  ],

  // ── R4: Wettbewerb ──
  box(
    fill: white,
    inset: 14pt,
    radius: 10pt,
    width: 100%,
    stroke: (top: 3pt + accent, rest: 1pt + surface),
  )[
    #text(weight: "bold", fill: accent.darken(10%), size: 9pt)[R4 · Wettbewerb reagiert]
    #v(2pt)
    #badge("Mittel", color: accent)
    #v(6pt)
    #text(size: 8.5pt)[
      Differenzierung durch Vollständigkeit (5\+ Leistungsarten vs. je 1), volldigitalen QES-Versand, Mehrsprachigkeit und exklusive Partnerschaften. Wettbewerber müssten ihre *gesamte Architektur* erweitern, um Feature-Parität zu erreichen.
    ]
  ],

  // ── R5: CAC / Partnerkanäle ──
  box(
    fill: white,
    inset: 14pt,
    radius: 10pt,
    width: 100%,
    stroke: (top: 3pt + accent, rest: 1pt + surface),
  )[
    #text(weight: "bold", fill: accent.darken(10%), size: 9pt)[R5 · CAC / Partnerkanäle]
    #v(2pt)
    #badge("Mittel", color: accent)
    #v(6pt)
    #text(size: 8.5pt)[
      Diversifizierter Kanal-Mix mit fünf unabhängigen Akquisitionskanälen. Bei steigenden Paid-Kosten Verlagerung auf organische Kanäle (SEO, Referrals) und ARAG (CAC 0 €). Auch im konservativen Szenario (74%) bleibt das Modell *profitabel*.
    ]
  ],
)

#v(0.5em)

== Fallback-Strategie

#highlight-box(color: accent, title: [Szenario: Nur 50% des Zielwerts])[
  Selbst bei nur #calc.round(customers-year1 * 0.5) Kunden in Jahr 1 (50% des Ziels) bleibt das Geschäftsmodell tragfähig:

  #v(6pt)
  - *Umsatz:* ~#euro-compact(calc.round(customers-year1 * 0.5) * product-price) bei niedrigen Gesamtkosten → *weiterhin profitabel*
  - *Fixkosten:* Mit #euro(monthly-fixed-costs)/Monat ist die Burn-Rate so niedrig, dass das Stammkapital über 12 Monate Betrieb finanzieren kann – auch ohne jeden Umsatz
  - *Maßnahmen:* Marketing auf ARAG und organische Kanäle konzentrieren (CAC 0 €), Paid Ads reduzieren, Scope auf Kern-Elterngeld fokussieren
  - *Pivot-Option:* Bei anhaltendem Unterperformen Fokussierung auf reinen ARAG-Kanal als White-Label-Lösung
]


// ============================================================================
// 7. TEAM & ZEITPLAN
// ============================================================================

= Team & Zeitplan

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
    Entstanden im Rahmen des Hamburg Legal Hackathon 2025 (Motto: „Access to Justice"). Das Team vereint technische Entwicklung, rechtliches Verständnis und Produktdenken.

    #v(10pt)

    #grid(
      columns: (1fr, 1fr, 1fr, 1fr),
      column-gutter: 10pt,

      box(fill: primary.lighten(94%), inset: 10pt, radius: 6pt, width: 100%)[
        #text(fill: primary, weight: "bold", size: 9pt)[Full-Stack-Dev]
        #v(2pt)
        #text(size: 8pt, fill: muted)[React, TypeScript, PostgreSQL]
      ],

      box(fill: accent.lighten(90%), inset: 10pt, radius: 6pt, width: 100%)[
        #text(fill: accent.darken(10%), weight: "bold", size: 9pt)[Produkt & UX]
        #v(2pt)
        #text(size: 8pt, fill: muted)[User Research, Prototyping]
      ],

      box(fill: success.lighten(92%), inset: 10pt, radius: 6pt, width: 100%)[
        #text(fill: success, weight: "bold", size: 9pt)[Recht]
        #v(2pt)
        #text(size: 8pt, fill: muted)[Familien-, Sozialrecht]
      ],

      box(fill: info.lighten(92%), inset: 10pt, radius: 6pt, width: 100%)[
        #text(fill: info, weight: "bold", size: 9pt)[Business Dev]
        #v(2pt)
        #text(size: 8pt, fill: muted)[Partnerschaften, Vertrieb]
      ],
    )
  ]
]

#v(0.5em)

#align(center)[
  #image("Teambild.jpg", width: 60%)
]

== Roadmap (3-Jahres-Überblick)

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
    *GmbH-Gründung & Marktstart*
    #v(4pt)
    #text(size: 9pt)[
      Abdeckung: Elterngeld, Kindergeld, Elternzeit · GmbH-Gründung · ARAG-Integration · Erste Kunden · Behörden-Feedback
    ]
    #v(4pt)
    #text(
      size: 8pt,
      fill: muted,
    )[Ziel: ~#num(customers-q1 + customers-q2) Kunden · Umsatz: #euro-compact(revenue-q1 + revenue-q2)]
  ],

  box(fill: info, inset: (x: 10pt, y: 6pt), radius: 20pt)[
    #text(fill: white, weight: "bold", size: 9pt)[H2 2026]
  ],
  box(fill: info.lighten(95%), inset: 12pt, radius: 8pt, width: 100%, stroke: (left: 3pt + info))[
    *Skalierung & neue Leistungsarten*
    #v(4pt)
    #text(size: 9pt)[
      Zusätzlich: Kinderzuschlag, Mutterschaftsgeld · Referral-Programm · TikTok-Kampagnen · Erste B2B-Gespräche
    ]
    #v(4pt)
    #text(
      size: 8pt,
      fill: muted,
    )[Ziel: ~#num(customers-q3 + customers-q4) weitere Kunden · Jahresumsatz: #euro-compact(revenue-year1)]
  ],

  box(fill: success, inset: (x: 10pt, y: 6pt), radius: 20pt)[
    #text(fill: white, weight: "bold", size: 9pt)[2027]
  ],
  box(fill: success.lighten(95%), inset: 12pt, radius: 8pt, width: 100%, stroke: (left: 3pt + success))[
    *Wachstum & B2B-Piloten*
    #v(4pt)
    #text(size: 9pt)[
      Zusätzlich: BAföG, Kita-Anspruch · B2B-Piloten (5–10 Unternehmen) · Weitere Partnerschaften (Krankenkassen, Hebammen)
    ]
    #v(4pt)
    #text(size: 8pt, fill: muted)[Ziel: #num(customers-year2) Kunden · #euro-compact(revenue-year2) Umsatz]
  ],

  box(fill: accent, inset: (x: 10pt, y: 6pt), radius: 20pt)[
    #text(fill: white, weight: "bold", size: 9pt)[2028]
  ],
  box(fill: accent.lighten(93%), inset: 12pt, radius: 8pt, width: 100%, stroke: (left: 3pt + accent))[
    *Vollständige Plattform & Ausblick*
    #v(4pt)
    #text(size: 9pt)[
      Zusätzlich: Pflege, Unterhaltsvorschuss · Etablierter B2B-Kanal · Widerspruch & Klage (automatisiert) · API-Behördenanbindung
    ]
    #v(4pt)
    #text(size: 8pt, fill: muted)[Ziel: #num(customers-year3) Kunden · #euro-compact(revenue-year3) Umsatz]
  ],
)


// ============================================================================
// 8. VISION & AUSBLICK
// ============================================================================

= Vision & Ausblick

Bambini zielt darauf ab, die zentrale digitale Anlaufstelle für Familienleistungen in Deutschland zu werden. Die Plattform skaliert entlang zweier Achsen: Neue Leistungsarten (horizontal) und tiefere Serviceleistungen (vertikal).

#v(0.5em)

#grid(
  columns: (auto, 1fr, 1fr),
  column-gutter: 8pt,
  row-gutter: 6pt,
  align: (center + horizon, left, left),

  box(fill: primary, inset: 6pt, radius: 4pt)[#text(fill: white, weight: "bold", size: 8pt)[Aktuell]],
  [Elterngeld, Kindergeld, Elternzeit],
  [Antragserstellung + digitaler Versand],

  box(fill: info, inset: 6pt, radius: 4pt)[#text(fill: white, weight: "bold", size: 8pt)[H2 2026]],
  [\+ Kinderzuschlag, Mutterschaftsgeld],
  [\+ Mehrsprachigkeit],

  box(fill: success, inset: 6pt, radius: 4pt)[#text(fill: white, weight: "bold", size: 8pt)[2027]],
  [\+ BAföG, Kita-Anspruch],
  [\+ Widerspruch & Klage (automatisiert)],

  box(fill: accent, inset: 6pt, radius: 4pt)[#text(fill: white, weight: "bold", size: 8pt)[2028\+]],
  [\+ Pflege, Unterhaltsvorschuss],
  [\+ KI-Optimierung, API-Behördenanbindung],
)

#v(0.5em)

== B2B-Potenzial (ab 2027)

Neben dem B2C-Kerngeschäft bietet das B2B-Segment (Corporate Employee Benefits) eine zusätzliche Wachstumsdimension. Beispielrechnung: Ein Unternehmen mit #b2b-example-employees Mitarbeitern generiert ca. #euro(b2b-example-total)/Jahr. Bei #b2b-pilot-companies Pilotunternehmen ergibt sich ein zusätzliches Umsatzpotenzial von #euro-compact(b2b-pilot-revenue). Der Aufbau erfolgt erst nach erfolgreicher B2C-Validierung.

#v(0.3em)

#box(
  fill: success.lighten(93%),
  inset: 20pt,
  radius: 10pt,
  width: 100%,
  stroke: 2pt + success,
)[
  #align(center)[
    #text(size: 13pt, weight: "bold", fill: success.darken(20%))[
      Investitionsbedarf & Ausblick
    ]

    #v(12pt)

    #grid(
      columns: (1fr, 1fr, 1fr),
      column-gutter: 10pt,
      box(fill: white, inset: 12pt, radius: 8pt, width: 100%, stroke: 1pt + success.lighten(50%))[
        #align(center)[
          #text(size: 16pt, weight: "bold", fill: success)[#euro(total-capital-min) –\ #euro(total-capital-max)]
          #v(4pt)
          #text(size: 8pt, fill: muted)[Gesamtkapitalbedarf]
          #v(2pt)
          #text(size: 7pt, fill: muted)[(Stammkapital + Gründung)]
        ]
      ],
      box(fill: white, inset: 12pt, radius: 8pt, width: 100%, stroke: 1pt + success.lighten(50%))[
        #align(center)[
          #text(size: 20pt, weight: "bold", fill: success)[#euro-compact(revenue-year3)]
          #v(4pt)
          #text(size: 8pt, fill: muted)[Umsatz in Jahr 3]
          #v(2pt)
          #text(size: 7pt, fill: muted)[(#num(customers-year3) Kunden)]
        ]
      ],
      box(fill: white, inset: 12pt, radius: 8pt, width: 100%, stroke: 1pt + success.lighten(50%))[
        #align(center)[
          #text(size: 20pt, weight: "bold", fill: success)[+#euro-compact(guv-cumulative-y3)]
          #v(4pt)
          #text(size: 8pt, fill: muted)[Kumulativer Gewinn]
          #v(2pt)
          #text(size: 7pt, fill: muted)[(nach 3 Jahren)]
        ]
      ],
    )

    #v(10pt)
    #text(size: 9pt, fill: muted)[
      Profitabel ab Jahr 1 · Niedrige Fixkosten (#euro(monthly-fixed-costs)/Monat) · Break-Even ab ~#cum-break-even Kunden
    ]
  ]
]

#v(1.5em)

#align(center)[
  #line(length: 60pt, stroke: 1pt + surface)
  #v(1em)
  #text(size: 10pt, fill: muted)[
    *Kontakt:* info\@bambini-claims.de · *Web:* bambini-claims.de
  ]
]
