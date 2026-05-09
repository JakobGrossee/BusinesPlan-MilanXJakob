// ═══════════════════════════════════════════════════════════════════════════
// BAMBINI BUSINESS PLAN - V5 (DRAFT)
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
  author: "Bambini-Claims",
)


// ═══════════════════════════════════════════════════════════════════════════
// ZENTRALE VARIABLEN (1:1 aus V4)
// ═══════════════════════════════════════════════════════════════════════════

// ─── Preis- & Geschäftsmodell ────────────────────────────────────────────────
#let free-price = 0
#let premium-price = 9.99             // Self-Service: Y1 Pilot, ab Y2 Pflicht-Tarif
#let premium-price-target = 39.99      // Vollservice-Paket: pauschal pro Familie ab Y2
#let premium-start = "Juli 2026"
#let competitor-price-low = 40
#let competitor-price-high = 50

// ─── Akquisitions-Trichter: Budget → Visitors → Active Users ─────────────────
// Aktive Nutzerzahlen werden NICHT mehr top-down gesetzt, sondern aus dem
// Marketing-Budget über einen zweistufigen Trichter abgeleitet:
//
//   Marketing-Budget  ──(÷ CPV)──▶  Site Visitors  ──(× V2U-Conv.)──▶  Active Users
//
// Steuergrößen sind damit (a) Budget pro Quartal/Jahr, (b) Cost per Visitor
// und (c) Visitor→User-Conversion. Active Users, CAC und Umsatz fallen
// rechnerisch aus diesen drei Hebeln. Wer den Plan stresstesten will,
// dreht hier - nicht an den Endzahlen.

// (a) Marketing-Budget pro Quartal (Y1) bzw. Jahr (Y2/Y3) -------------------
// Y1 startet bewusst klein: April ist bereits angelaufen, belastbare
// Skalierungsdaten haben wir frühestens Q3/Q4. Der Ramp-up spiegelt das.
#let marketing-q1 = 120         // Apr-Jun 26: erste Tests, kein Skalieren
#let marketing-q2 = 500         // Jul-Sep 26: erste Skalierung, ARAG-Onboarding
#let marketing-q3 = 1100        // Okt-Dez 26: erste Saison, mehr Reichweite
#let marketing-q4 = 1800        // Jan-Mär 27: voll skaliert auf Datenbasis
#let marketing-y1 = marketing-q1 + marketing-q2 + marketing-q3 + marketing-q4
#let marketing-y2 = 12000
#let marketing-y3 = 26400

// (b) Cost per Visitor (Blended) --------------------------------------------
// Mischwert über alle Kanäle (Creators 35 %, Paid 30 %, Partner 20 %,
// SEO/Owned 10 %, Empfehlungen 5 %). Paid-Floor DACH B2C 2024-2026:
// 0,30-0,80 €/Click; Creator-CPV liegt deutlich darunter (warme Reichweite,
// vorbestehende Audience), Partner-Mailings und Empfehlungen ~0 €.
//   Y1: 0,10 € - hoher Creator-/Paid-Anteil je Visit, SEO baut sich erst auf
//   Y2: 0,075 € - ARAG-Mailings tragen stärker, Paid kalibriert
//   Y3: 0,06 €  - Partner-Anteil und Brand tragen, CPV sinkt weiter
#let cost-per-visitor-y1 = 0.10
#let cost-per-visitor-y2 = 0.075
#let cost-per-visitor-y3 = 0.06

// (c) Visitor → Active User Conversion --------------------------------------
// Anteil der Site-Visits, der innerhalb von 7 Tagen zu Sign-up + erster
// Antrags-Action wird. DACH FamilyTech-Benchmark 2024-2026: 3-6 % bei
// warmer Zielgruppe; wir planen 5 % als konservative Mitte über alle Jahre
// (Produkt-/UX-Reife wirkt erst ab Y2 leicht nach oben).
#let visitor-to-user-conversion = 0.05

// Site Visitors (abgeleitet) ------------------------------------------------
#let visitors-q1 = marketing-q1 / cost-per-visitor-y1
#let visitors-q2 = marketing-q2 / cost-per-visitor-y1
#let visitors-q3 = marketing-q3 / cost-per-visitor-y1
#let visitors-q4 = marketing-q4 / cost-per-visitor-y1
#let visitors-y1 = visitors-q1 + visitors-q2 + visitors-q3 + visitors-q4
#let visitors-y2 = marketing-y2 / cost-per-visitor-y2
#let visitors-y3 = marketing-y3 / cost-per-visitor-y3

// Active Users (abgeleitet aus Trichter) ------------------------------------
#let active-users-q1 = calc.round(visitors-q1 * visitor-to-user-conversion)
#let active-users-q2 = calc.round(visitors-q2 * visitor-to-user-conversion)
#let active-users-q3 = calc.round(visitors-q3 * visitor-to-user-conversion)
#let active-users-q4 = calc.round(visitors-q4 * visitor-to-user-conversion)
#let active-users-year1 = active-users-q1 + active-users-q2 + active-users-q3 + active-users-q4
#let active-users-year2 = calc.round(visitors-y2 * visitor-to-user-conversion)
#let active-users-year3 = calc.round(visitors-y3 * visitor-to-user-conversion)

// ─── Free→Premium-Conversions (Y1) und Tarif-Mix (Y2/Y3) ─────────────────────
// Y1 (Apr 2026 - Mar 2027): Free + optionaler Premium-Pilot zu 9,99 €.
// "Aktive Nutzer" = Free-Nutzer; davon konvertiert ein Teil zum Pilot.
#let conversion-q1 = 0.00
#let conversion-q2 = 0.05
#let conversion-q3 = 0.08
#let conversion-q4 = 0.08

// Ab Y2 (April 2027): KEIN Free mehr. Aktive Nutzer wählen entweder den
// günstigen Self-Service oder das Vollservice-Paket. Conversions je Tarif
// sind getrennt modelliert, weil die Zahlbereitschaft preis-elastisch ist.
#let conversion-self-service-y2 = 0.05    // 5 % wählen Self-Service (9,99 €)
#let conversion-self-service-y3 = 0.05    // 10 % wählen Self-Service
#let conversion-full-service-y2 = 0.03   // 2,5 % wählen Vollservice (39,99 €)
#let conversion-full-service-y3 = 0.035   // 2,5 % wählen Vollservice

#let premium-users-q1 = calc.round(active-users-q1 * conversion-q1)
#let premium-users-q2 = calc.round(active-users-q2 * conversion-q2)
#let premium-users-q3 = calc.round(active-users-q3 * conversion-q3)
#let premium-users-q4 = calc.round(active-users-q4 * conversion-q4)
#let premium-users-year1 = premium-users-q1 + premium-users-q2 + premium-users-q3 + premium-users-q4

// Zahlende Nutzer pro Tarif (Y2/Y3)
#let ss-users-y2 = calc.round(active-users-year2 * conversion-self-service-y2)
#let ss-users-y3 = calc.round(active-users-year3 * conversion-self-service-y3)
#let fs-users-y2 = calc.round(active-users-year2 * conversion-full-service-y2)
#let fs-users-y3 = calc.round(active-users-year3 * conversion-full-service-y3)
#let premium-users-year2 = ss-users-y2 + fs-users-y2
#let premium-users-year3 = ss-users-y3 + fs-users-y3

// Vereinfachte Fälle-Logik: ein zahlender Kunde = ein Fall.
// (Mehrfachbuchungen pro Familie werden nicht modelliert; Vollservice ist
// per Konstruktion Pauschalpreis pro Familie.)
#let paid-cases-y1 = premium-users-year1
#let paid-cases-y2 = ss-users-y2 + fs-users-y2
#let paid-cases-y3 = ss-users-y3 + fs-users-y3

// Umsatzberechnung
#let revenue-y1 = paid-cases-y1 * premium-price
#let ss-revenue-y2 = ss-users-y2 * premium-price
#let ss-revenue-y3 = ss-users-y3 * premium-price
#let fs-revenue-y2 = fs-users-y2 * premium-price-target
#let fs-revenue-y3 = fs-users-y3 * premium-price-target
#let revenue-y2 = ss-revenue-y2 + fs-revenue-y2
#let revenue-y3 = ss-revenue-y3 + fs-revenue-y3

// ─── Quartalsumsätze (Jahr 1) ────────────────────────────────────────────────
#let revenue-q1 = premium-users-q1 * premium-price
#let revenue-q2 = premium-users-q2 * premium-price
#let revenue-q3 = premium-users-q3 * premium-price
#let revenue-q4 = premium-users-q4 * premium-price

// ─── Fixkosten ───────────────────────────────────────────────────────────────
#let cost-hosting = 4
#let cost-supabase = 0
#let cost-dev-tools = 60               // bewusst schlanker Tool-Stack (Free-Tiers, OSS)
#let cost-qes-monthly = 15
#let cost-steuerberater = 100           // Online-Buchhaltung + jährliche StB-Schau
#let cost-email-annual = 20
#let cost-qes-annual = 27

#let monthly-fixed-costs = cost-hosting + cost-supabase + cost-dev-tools + cost-qes-monthly + cost-steuerberater
#let annual-fixed-costs-y1 = (monthly-fixed-costs * 12) + cost-email-annual + cost-qes-annual
#let annual-fixed-costs-y2 = 3000
#let annual-fixed-costs-y3 = 4000

// ─── Marketing / Akquisition: CAC als Diagnose, nicht als Eingabe ────────────
// CAC pro aktivem Nutzer ist jetzt eine ABGELEITETE Größe aus dem Trichter:
//
//   CAC = Marketing-Budget ÷ Active Users  =  CPV ÷ V2U-Conversion
//
// Wir setzen CAC nicht mehr direkt fest, sondern beobachten, was er
// rechnerisch wird. Damit lassen sich Hebel (mehr Budget? besserer CPV?
// bessere V2U-Rate?) sauber durchspielen, ohne Zirkelschlüsse.
//
// Benchmark-Kontext (DACH B2C-Legal/FamilyTech, 2024-2026): Pure-Paid-Floor
// 3-5 €/Active (Meta/TikTok/Search), Partner-Mix (Versicherer-Mailings,
// Co-Branding) kann blended <1 €/Active erreichen (Vorbild Keleya/
// Kinderheldin: 65 Kassen, 65 % Coverage). Unsere Trichter-Annahmen
// (CPV 0,06-0,10 €, V2U 5 %) ergeben CAC zwischen 1,20-2,00 €/Active -
// also auf der konservativen Mitte der realistischen Range.
#let acquisition-cost-per-active-user-y1 = marketing-y1 / active-users-year1
#let acquisition-cost-per-active-user-y2 = marketing-y2 / active-users-year2
#let acquisition-cost-per-active-user-y3 = marketing-y3 / active-users-year3

// ─── Unit Economics: CAC und LTV pro Tarif ───────────────────────────────
// LTV pro Tarif ist der jeweilige Preis (1 Antrag SS / 1 Familie FS).
#let ltv-ss = premium-price          // 9,99 € pro Self-Service-Antrag
#let ltv-fs = premium-price-target   // 39,99 € pro Vollservice-Familie

// CAC pro Tarif: Marketing-Aufwand pro aktivem Nutzer geteilt durch die
// jeweilige Tarif-Conversion. Y1: nur Pilot (entspricht SS-Tarif), kein FS.
#let cac-ss-y1 = marketing-y1 / paid-cases-y1   // gewichteter Y1-Mittelwert
#let cac-ss-y2 = acquisition-cost-per-active-user-y2 / conversion-self-service-y2
#let cac-ss-y3 = acquisition-cost-per-active-user-y3 / conversion-self-service-y3
#let cac-fs-y2 = acquisition-cost-per-active-user-y2 / conversion-full-service-y2
#let cac-fs-y3 = acquisition-cost-per-active-user-y3 / conversion-full-service-y3

// LTV/CAC-Verhältnis pro Tarif
#let ltv-cac-ss-y1 = ltv-ss / cac-ss-y1
#let ltv-cac-ss-y2 = ltv-ss / cac-ss-y2
#let ltv-cac-ss-y3 = ltv-ss / cac-ss-y3
#let ltv-cac-fs-y2 = ltv-fs / cac-fs-y2
#let ltv-cac-fs-y3 = ltv-fs / cac-fs-y3

// Mix-Brutto-Marge pro aktivem Nutzer (zeigt, dass beide Tarife gemeinsam
// die Marketing-Investition refinanzieren, auch wenn SS allein < 1 ist).
#let gross-margin-per-active-y2 = (conversion-self-service-y2 * premium-price) + (conversion-full-service-y2 * premium-price-target) - acquisition-cost-per-active-user-y2
#let gross-margin-per-active-y3 = (conversion-self-service-y3 * premium-price) + (conversion-full-service-y3 * premium-price-target) - acquisition-cost-per-active-user-y3

// Aufschlüsselung des Y1-Marketingbudgets nach Kanälen:
//   Schwerpunkt liegt auf warmer/bezahlter Reichweite (Creators, TikTok/
//   Meta) - hier braucht es echte Mediabudgets, um Botschaften zu testen
//   und Eltern-Audiences anzusprechen. Versicherungs-Partner (ARAG &
//   Folgepartner) bekommen einen substantiellen Anteil für Co-Branding-
//   Material und Mailings. SEO/Content wird bewusst niedrig gehalten,
//   weil die Inhalte primär *selbst* erstellt werden - das Budget hier
//   deckt vor allem Tools (Keyword-Recherche, Analytics) ab. Empfehlungen
//   sind organisch; das Budget reicht für Tool-Setup (Referral-Funktion,
//   Tracking).
#let marketing-share-creators = 0.35   // Creator-/Influencer-Kooperationen (Hauptkanal)
#let marketing-share-paid     = 0.30   // TikTok/Meta-Paid-Tests (zweitgrößter Hebel)
#let marketing-share-partner  = 0.20   // Partner-Materialien (ARAG, Co-Branding, Mailings)
#let marketing-share-content  = 0.10   // SEO-Tools, Analytics (Inhalte selbst erstellt)
#let marketing-share-referral = 0.05   // Empfehlungs-Funktion (Tool-Setup, Tracking)

#let marketing-creators-y1 = marketing-y1 * marketing-share-creators
#let marketing-paid-y1     = marketing-y1 * marketing-share-paid
#let marketing-partner-y1  = marketing-y1 * marketing-share-partner
#let marketing-content-y1  = marketing-y1 * marketing-share-content
#let marketing-referral-y1 = marketing-y1 * marketing-share-referral

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
// Self-Service: Plattformkosten pro Antrag.
// Vollservice: pro Familie höher, weil Bambini die Einreichung und mehrere
// Anträge übernimmt (Bearbeitung + Versand + Behördenkommunikation).
#let variable-cost-per-ss-case = 1.50
#let variable-cost-per-fs-case = 3.00   // vollautomatisierte Einreichung, geringe Marginalkosten
#let variable-costs-y1 = paid-cases-y1 * variable-cost-per-ss-case
#let variable-costs-y2 = ss-users-y2 * variable-cost-per-ss-case + fs-users-y2 * variable-cost-per-fs-case
#let variable-costs-y3 = ss-users-y3 * variable-cost-per-ss-case + fs-users-y3 * variable-cost-per-fs-case

// ─── Externe Beratung / Puffer ───────────────────────────────────────────────
// (Externe Beratung als eigene Position entfällt: ad-hoc-Aufwendungen sind
//  im Puffer enthalten; laufende Steuerberatung steckt in den Fixkosten.)
#let contingency-y1 = 800
#let contingency-y2 = 1200
#let contingency-y3 = 1500

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
#let total-costs-y1 = founding-costs-max + annual-fixed-costs-y1 + marketing-y1 + ai-cost-y1 + variable-costs-y1 + contingency-y1
#let total-costs-y2 = annual-fixed-costs-y2 + marketing-y2 + ai-cost-y2 + variable-costs-y2 + contingency-y2
#let total-costs-y3 = annual-fixed-costs-y3 + marketing-y3 + ai-cost-y3 + variable-costs-y3 + contingency-y3

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

#let result-conservative = revenue-conservative - founding-costs-max - annual-fixed-costs-y1 - (marketing-y1 * scenario-conservative-factor) - (ai-cost-y1 * scenario-conservative-factor) - (variable-costs-y1 * scenario-conservative-factor) - contingency-y1
#let result-optimistic = revenue-optimistic - founding-costs-max - annual-fixed-costs-y1 - (marketing-y1 * scenario-optimistic-factor) - (ai-cost-y1 * scenario-optimistic-factor) - (variable-costs-y1 * scenario-optimistic-factor) - contingency-y1


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
// EDITORIAL PALETTE - ein Akzent, viel Neutral
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

// Semantik - ausschließlich für Vorzeichen in Ergebniszeilen
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
          Bambini · Hamburg
        ],
        text(font: sans, size: 7.5pt, fill: muted)[
          bambini-claims.de
        ],
      )
    ]
  },
)


// ═══════════════════════════════════════════════════════════════════════════
// HEADINGS - typografisch, keine Verlaufsbalken
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

// Variante mit dezenter Akzent-Tönung - sparsam einsetzen
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
// breakable: false stellt sicher, dass eine Karte nicht zwischen Seiten
// zerrissen wird (vermeidet "Waisen" wie zuletzt bei R7 beobachtet).
#let risk-card(id, title, level, body) = {
  block(
    width: 100%,
    breakable: false,
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
  // Kleiner Abstand nach der Karte, damit aufeinanderfolgende Karten optisch
  // getrennt bleiben (vorher über Block-Spacing geregelt).
  v(8pt)
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
// TABELLEN-STIL - Booktabs (3 Linien, kein Zellfill)
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
// COVER - MDPI-/Working-Paper-Stil
// ═══════════════════════════════════════════════════════════════════════════

#page(header: none, footer: none, margin: (x: 3cm, y: 3cm))[

  // Kopfzeile: dezente Marginalie + dünne Linie
  #grid(
    columns: (1fr, auto),
    align: (left, right),
    text(font: sans, size: 8pt, fill: muted, tracking: 1.5pt)[
      #upper("Bambini-Claims")
    ],
    text(font: sans, size: 8pt, fill: muted, tracking: 1.5pt)[
      #upper("Mai 2026")
    ],
  )
  #v(2pt)
  #line(length: 100%, stroke: 0.6pt + ink)

  #v(3.5cm)

  #align(center)[
    #image("bambini-logo.png", width: 250pt)
  ]

  #v(2.2cm)


  #v(8pt)
  #text(font: serif, size: 32pt, weight: "regular", fill: ink, tracking: -0.5pt)[
     Business Plan
  ]
  #v(6pt)
  #text(font: serif, size: 14pt, fill: ink-soft, style: "italic")[
    Wir erledigen Bürokratie für Familien.
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
    Bambini stellt einen KI-gestützten Service zur Beantragung von Elterngeld bereit und übernimmt kostenpflichtig die vollständige Abwicklung des Antragsprozesses. Zukünftig skalliert die Plattform horizontal (weitere Antragsarten: Kindergeld; Mutterschaftsgeld usw.) und vertikal (Einbindung mit Partnern und Behörden).
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
  kpi([#euro-compact(recommended-funding)], "Finanzbedarf"),
)

#v(1em)

#text(size: 11pt, fill: ink-soft)[
  *Bambini* bietet eine digitale Unterstützung für Eltern bei der
  Beantragung familienspezifischen Sozialleistungen. Der Marktstart erfolgt mit einem kostenlosen
  Self-Service (zunächst für Elterngeld): Nutzer werden strukturiert durch die erforderlichen Angaben
  geführt und erhalten einen vorbereiteten Antrag. Die Einreichung erfolgt
  in der kostenlosen Variante zunächst durch den Nutzer selbst.
]

#v(0.6em)

Der kostenlose Einstieg ist eine bewusste strategische Entscheidung.
Bestehende Anbieter verlangen für vergleichbare Self-Service-Angebote
typischerweise *#competitor-price-low - #competitor-price-high €*.
Bambini bietet diesen Grundnutzen kostenlos an, um die Einstiegshürde zu
senken, eine Nutzerbasis aufzubauen und das Produkt anhand realer
Anwendungsfälle zu validieren. Differenzierung entsteht zusätzlich über
*BambiniAI* - einen KI-gestützten Assistenten, der in dieser Form bislang
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
    Ab #premium-start wird eine vollautomatische Antragseinreichung bzw.
    Abwicklung zunächst zum *Validierungspreis* von #euro(premium-price)
    pro Fall angeboten; perspektivisch wandelt sich das Modell in ein
    Vollservice-Paket bis #euro(premium-price-target). Weitere Antragsarten
    (Kindergeld, Elternzeit) folgen zeitnah nach Validierung des
    Elterngeld-Prozesses.
  ],
)

#v(1em)

=== Eckdaten und wirtschaftliche Prognose (vgl. #link(<Wirtschaftlichkeit>)[Kapitel 5])

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
    #v(8pt) // hier vielleicht ein Hinweis oder Link zu der Seite, auf der die Prognose noch ausdifferenzierter ist

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
    "Das Antragsformular ist extrem kompliziert, wenig bürgerfreundlich und
    nicht barrierefrei."
  ]
  #h(1fr)
  #text(font: sans, fill: muted, size: 8.5pt)[- Hannover.de, Offizielle Website der Stadt]
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
Anbietergruppen prägen das Bild: *staatliche Angebote* (kostenlos, jedoch
komplex und nach Bundesländern fragmentiert), *private
Self-Service-Anbieter* (typischerweise #competitor-price-low - #competitor-price-high €,
meist auf eine einzelne Leistung beschränkt) sowie eine bislang unbesetzte
Lücke für ein vollständiges full-service Angebot.

#v(0.4em)

Bambini setzt genau dort an: eine *vollständige Abwicklung des Antragsvorgangs*, der Nutzer muss keine formulare Drucken oder selbständige postalisch Absenden; perspektivisch die Verknüpfung
weiterer Familienleistungen (Kindergeld, Elternzeit) in einer durchgängigen
Nutzerführung. (vgl. #link(<Wettbewerbspositionierung>)[Kapitel 3])
.


// ═══════════════════════════════════════════════════════════════════════════
// 3. LÖSUNG & PRODUKT
// ═══════════════════════════════════════════════════════════════════════════
#pagebreak()

= Lösung und Produkt

Bambini bündelt den gesamten Weg vom ersten Berechtigungs-Check bis zum
abgesendeten Antrag in einer durchgängigen Plattform. Wer Bambini öffnet,
sieht zunächst, welche Familienleistungen für die eigene Lebenslage relevant
sind. Bereits nach den ersten Angaben prüft Bambini automatisch, ob ein
Anspruch besteht; im weiteren Verlauf begleitet *BambiniAI* mit Erklärungen,
beantwortet Rückfragen und kann auf Wunsch einzelne Abschnitte oder den
vollständigen Antrag selbst ausfüllen. Ist der Antrag fertig, genügt ein
Klick auf *Senden* - ab diesem Punkt übernimmt Bambini die weitere Abwicklung
(in der kostenlosen Variante reicht der Nutzer den vorbereiteten Antrag
selbst ein). *Vom Aufruf der Website bis zum abgesendeten Antrag vergehen so
wenige Minuten*, statt wie bislang Formulare auszudrucken, zur Post zu
bringen und sich durch Behördentexte zu arbeiten.

#v(0.4em)

Sind die Stammdaten einer Familie einmal erfasst, bleiben sie auf der
Plattform gespeichert und vorausgefüllt: *Folge- oder Parallelanträge*
(etwa Kindergeld nach dem Elterngeld) müssen nicht erneut erfasst, sondern
nur noch geprüft und abgesendet werden.

#v(0.4em)

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
    *Daten erfassen* - Strukturierte Eingabe der für den Elterngeld-Antrag
    erforderlichen Informationen zu Familie, Einkommen und Elternzeit-Planung.
    Bambini stellt dabei sicher, dass nur *rechtlich zulässige
    Gestaltungsvarianten* auswählbar sind. KI-gestützte Hilfe über BambiniAI
    ist optional verfügbar - bis hin zur vollständigen Ausfüllung des
    Antrags durch die KI.

    #v(2pt)
    #text(size: 8pt, fill: muted, style: "italic")[
      Geplant ab 2027: einheitliche Datenspeicherung mit automatischer
      Vorausfüllung von Folge- und Parallelanträgen (Kindergeld, Elternzeit u. a.).
    ]
  ],

  step(2),
  [
    *Plausibilität und Anspruch prüfen* - Hinweise auf unvollständige oder
    widersprüchliche Angaben, Berechnung des voraussichtlichen Anspruchs und
    Hinweise auf relevante Fristen.
  ],

  step(3),
  [
    *Vorbereiteten Antrag erhalten* - Bambini erzeugt das fertige
    Antragsdokument. In der *kostenlosen Variante* reicht der Nutzer den
    Antrag selbst ein. Die *vollautomatisierte Einreichung* bzw. Abwicklung
    durch Bambini folgt ab Juli 2026 als kostenpflichtige Zusatzleistung.
  ],
)

#v(0.6em)

#callout(title: [BambiniAI - KI-Agent als Differenzierung])[
  Ergänzend zum Antragsprozess steht Nutzern ein *KI-Agent* zur Verfügung,
  der Fragen zum Elterngeld beantwortet, Fachbegriffe erklärt, auf benötigte
  Unterlagen hinweist und auf Wunsch *den gesamten Antrag selbst ausfüllen*
  kann. Damit reduziert Bambini den Aufwand der Nutzer noch einmal spürbar
  gegenüber bestehenden Self-Service-Angeboten.

  #v(6pt)

  *Die KI-Nutzung ist kein wesentlicher Kostentreiber:* Pro Freitextanfrage
  fallen lediglich rund *#euro(ai-cost-per-request)* an. Selbst bei intensiver
  Nutzung bleiben die KI-Kosten in einer Größenordnung, die das
  Geschäftsmodell auch im kostenfreien Einstieg tragfähig lässt.
]

#pagebreak()

== Wettbewerbspositionierung <Wettbewerbspositionierung>

#table(
  columns: (1.6fr, 1.2fr, 1.2fr, 1.4fr),
  align: (left, left, left, left),

  table.hline(stroke: 0.8pt + ink),
  th[Kriterium], th[Bambini], th[Private Anbieter], th[Staatliche Angebote],
  table.hline(stroke: 0.4pt + ink),

  [Elterngeld-Self-Service],
  [#text(weight: "semibold")[kostenlos]],
  [#competitor-price-low - #competitor-price-high €],
  [kostenlos, aber komplex],

  [Antragserstellung],
  [#text(fill: pos, weight: "semibold")[✓]],
  [#text(fill: pos, weight: "semibold")[✓]],
  [teilweise digital, je nach Bundesland],

  [Einreichung durch Anbieter],
  [vollständige Abwicklung],
  [nicht verfügbar],
  [nur über Bund-ID],

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

#v(0.4em)

#text(size: 8.5pt, fill: muted, style: "italic")[
  Hinweis: Die in der Tabelle aufgeführten Leistungsmerkmale sind technisch
  weitgehend fertiggestellt; auch für die unmittelbare Antragsvermittlung
  liegen ausgearbeitete Konzepte zur rechtssicheren Durchführung bereits
  vor. Was noch aussteht, ist deren Erprobung an realen Fallzahlen - genau
  diese Funktion erfüllt die jetzige Kostenlose-Phase, deren Nutzer zugleich
  Test-Kunden für die rechtliche Validierung sind. Der vollständige
  Live-Gang einzelner Bestandteile - insbesondere die kostenpflichtige
  standardisierte Einreichung - erfolgt erst nach Abschluss dieser
  Validierungsphase.
]

#v(0.6em)

#callout(title: [Strategischer Vorteil - Antragsverknüpfung])[
  Bambini ist nicht nur eine Vorbereitung für einen einzelnen Antrag, sondern
  *die zentrale Datenbasis der Familie*. Einmal erfasste Angaben (Identität,
  Einkommen, Familiensituation) werden über alle weiteren Antragsarten hinweg
  übernommen. Daraus entstehen besonders attraktive Kombinationsmöglichkeiten:

  #v(4pt)
  - *Elterngeld + Kindergeld:* gemeinsamer Stichtag, gemeinsame
    Einkommensgrundlage - eine Eingabe, zwei Anträge.
  - *Elternzeit + Elterngeld:* aufeinander abgestimmte Zeiträume, automatische
    Plausibilitätsprüfung.
  - *Folgeleistungen:* Kinderzuschlag, Mutterschaftsgeld u. a. profitieren
    von bereits validierten Stammdaten.

  #v(4pt)
  Wettbewerber adressieren nur einzelne Antragsarten ohne
  Datenkontinuität. Mit der kostenlosen Variante erreicht Bambini bereits
  denselben Funktionsumfang wie kostenpflichtige Self-Service-Angebote
  (#competitor-price-low - #competitor-price-high €); Differenzierung
  entsteht zusätzlich über BambiniAI und die Antragsverknüpfung.
]


// ═══════════════════════════════════════════════════════════════════════════
// 4. GESCHÄFTSMODELL & KUNDENGEWINNUNG
// ═══════════════════════════════════════════════════════════════════════════
#pagebreak()

= Geschäftsmodell und Kundengewinnung

== Freemium-Modell mit flexibler Preisarchitektur

Bambini geht in zwei Phasen an den Markt. *In Jahr 1 (April 2026 bis März
2027)* gilt ein klassisches Freemium-Modell: Die Basisversion des
Elterngeld-Self-Service ist kostenlos, ab Juli 2026 wird die Antragseinreichung
als optionale Premium-Leistung zu #euro(premium-price) erprobt. Das Ziel ist
eine schnelle und belastbare Nutzerbasis sowie die rechtliche und
operative Erprobung der unmittelbaren Antragsvermittlung an den Behörden.

#v(0.4em)

*Ab April 2027* entfällt die kostenlose Variante. Bambini bietet ab dann
zwei klar abgegrenzte, kostenpflichtige Tarife an:

#v(2pt)
- *Self-Service zu #euro(premium-price)* je Antrag - strukturierter
  Antragsprozess mit Anspruchsprüfung und BambiniAI-Begleitung; Einreichung
  durch den Nutzer selbst. Auch dieser Tarif liegt deutlich unter den
  #competitor-price-low - #competitor-price-high €, die vergleichbare
  Wettbewerber heute verlangen.
- *Vollservice-Paket zu #euro(premium-price-target)* je Familie - Bambini
  übernimmt sämtliche Anträge der Familie (Elterngeld, Kindergeld,
  Elternzeit u. a.) inklusive vollautomatisierter Einreichung und
  unbegrenzter KI-Begleitung.

#v(4pt)

Die endgültige Ausgestaltung beider Pakete (Leistungsumfang, exakter
Stichtag) wird datenbasiert auf Grundlage des Premium-Pilots entschieden.

#v(0.4em)

#grid(
  columns: (1fr, 1fr, 1fr),
  column-gutter: 14pt,
  [
    #label-text("Free (Y1, läuft 2027 aus)")
    #v(6pt)
    #text(font: sans, size: 24pt, weight: "semibold", fill: ink)[0 €]
    #v(2pt)
    #text(size: 8.5pt, fill: muted, style: "italic")[
      Apr 2026 - Mär 2027
    ]
    #v(4pt)
    #text(size: 9.5pt, fill: ink-soft)[
      Elterngeld-Self-Service, vorbereiteter Antrag, begrenzter
      BambiniAI-Zugang. Einreichung durch den Nutzer. Ziel: Nutzerbasis
      aufbauen, Antragsvermittlung mit den Behörden erproben.
    ]
  ],
  [
    #label-text("Self-Service")
    #v(6pt)
    #text(font: sans, size: 24pt, weight: "semibold", fill: accent)[
      #euro(premium-price)
    ]
    #v(2pt)
    #text(size: 8.5pt, fill: muted, style: "italic")[
      Pilot ab Juli 2026 · Mindest-Tarif ab 2027
    ]
    #v(4pt)
    #text(size: 9.5pt, fill: ink-soft)[
      Strukturierter Antragsprozess mit Plausibilitäts- und
      Anspruchsprüfung sowie BambiniAI; Bis 2027 reicht Bambini den Antrag in diesem Tarif auch für den Nutzer ein. Ab diesem Zeitpunkt erfolgt dies nur noch im Rahmen des Vollservice-Pakets.
    ]
  ],
  [
    #label-text("Vollservice-Paket (ab 2027)")
    #v(6pt)
    #text(font: sans, size: 24pt, weight: "semibold", fill: accent)[
      #euro(premium-price-target)
    ]
    #v(2pt)
    #text(size: 8.5pt, fill: muted, style: "italic")[
      Pauschalpreis pro Familie
    ]
    #v(4pt)
    #text(size: 9.5pt, fill: ink-soft)[
      Bambini übernimmt sämtliche Anträge der Familie (Elterngeld,
      Kindergeld, Elternzeit u. a.) inklusive vollautomatischer
      Einreichung und unbegrenzter BambiniAI-Begleitung. *Keine*
      individuelle Rechtsberatung.
    ]
  ],
)
#v(0.8em)
#pagebreak()
== Kundengewinnung


=== So erreichen wir unsere Nutzer

#v(4pt)

Die folgende Übersicht stellt jeden Kanal direkt seinem Anteil am
Y1-Marketingbudget von #euro(marketing-y1) gegenüber - inklusive der
konkreten Rolle, die der Kanal im Mix einnimmt. Den größten Teil des
Budgets bekommen *Creator-Kooperationen und Paid-Tests auf TikTok/Meta*
(zusammen #pct((marketing-share-creators + marketing-share-paid) * 100)),
weil hier höhere Investitionen nötig sind, Product-Placements zu finanzieren. SEO/Ratgeber-Inhalte sind bewusst
niedrig budgetiert: das Team erstellt sie selbst, das Budget deckt nur
Tools und Analytics.

#v(8pt)

// ─── Helper: horizontaler Balken proportional zum Budget-Anteil ──────────
// Skala bezogen auf den größten Anteil (35 % Creator-Kooperationen),
// damit der Top-Kanal die volle Balkenbreite ausnutzt und die Abstände
// zwischen den Kanälen gut sichtbar bleiben.
#let channel-bar(share, max-share: 0.35) = {
  let scale = 1000
  let filled = calc.round(share / max-share * scale)
  if filled <= 0 {
    block(width: 100%, height: 14pt)
  } else if filled >= scale {
    block(width: 100%, height: 14pt, fill: accent)
  } else {
    grid(
      columns: (filled * 1fr, (scale - filled) * 1fr),
      rows: 14pt,
      block(width: 100%, height: 100%, fill: accent),
      [],
    )
  }
}

#let channel-row(name, role, share, amount) = {
  let cell-name = [
    #text(font: sans, size: 9.5pt, weight: "semibold", fill: ink)[#name]
    #v(2pt)
    #text(size: 8.5pt, fill: muted)[#role]
  ]
  let cell-bar = channel-bar(share)
  let cell-pct = text(font: sans, size: 10pt, weight: "semibold", fill: ink)[
    #pct(share * 100)
  ]
  let cell-amount = text(font: sans, size: 9pt, fill: ink-soft)[
    #euro(amount)
  ]
  (cell-name, cell-bar, cell-pct, cell-amount)
}

#block(breakable: false)[
  #table(
    columns: (1.7fr, 2fr, auto, auto),
    align: (left + horizon, left + horizon, right + horizon, right + horizon),
    column-gutter: 10pt,
    inset: (x: 4pt, y: 9pt),

    table.hline(stroke: 0.8pt + ink),
    th[Kanal], th[Anteil am Y1-Budget], th[Anteil], th[Y1-Budget],
    table.hline(stroke: 0.4pt + ink),

    ..channel-row(
      [Creator-Kooperationen],
      [Eltern-Creators auf TikTok/Instagram - warme Reichweite mit
       vorbestehender Audience; Hauptkanal für Vertrauensaufbau],
      marketing-share-creators,
      marketing-creators-y1,
    ),
    ..channel-row(
      [TikTok / Meta (Paid-Tests)],
      [Bezahlte Kampagnen für A/B-Tests von Botschaften & Zielgruppen;
       CPL-Stop-Loss als Risikokontrolle],
      marketing-share-paid,
      marketing-paid-y1,
    ),
    ..channel-row(
      [Partner],
      [Portal-Hinweise, Co-Branding-Material;
       perspektivisch Krankenkassen, Hebammenverbände],
      marketing-share-partner,
      marketing-partner-y1,
    ),
    ..channel-row(
      [SEO & Ratgeber-Inhalte],
      [Long-Tail-Recherche, FAQ-Hub, Lebenslagen-Guides - vom Team selbst
       erstellt; Budget deckt nur Tools (Keyword-Recherche, Analytics)],
      marketing-share-content,
      marketing-content-y1,
    ),
    ..channel-row(
      [Empfehlungen],
      [Eingebaute Referral-Funktion nach Antragsabschluss; organisch -
       Budget reicht nur für Tool-Setup und Tracking],
      marketing-share-referral,
      marketing-referral-y1,
    ),

    table.hline(stroke: 0.4pt + ink),

    [#text(weight: "semibold", font: sans, size: 9.5pt)[Gesamt]],
    [],
    [#text(weight: "semibold", font: sans, size: 10pt)[100 %]],
    [#text(weight: "semibold", font: sans, size: 9.5pt)[#euro(marketing-y1)]],

    table.hline(stroke: 0.8pt + ink),
  )

  #v(0.3em)
  #text(size: 8.5pt, fill: muted, style: "italic")[
    Balkenlänge proportional zum Budget-Anteil (Skala-Referenz: 35 % =
    voller Balken). Bezahlte Kanäle (Creators, TikTok/Meta) tragen Y1
    den Hauptanteil; SEO-Inhalte werden vom Team selbst produziert.
  ]
]


#pagebreak()

=== Vom Budget zum zahlenden Kunden

Nutzerzahlen ergeben sich aus mehreren Faktoren: Marketing-Budget, Cost per Visitor
(CPV) und Sign-up-Conversion.

#v(2pt)
#align(center)[
  #text(font: sans, size: 10.5pt, fill: ink-soft, style: "italic")[
    Active Users = (Marketing-Budget ÷ CPV) × V→U-Conversion
  ]
]
#v(0.6em)

Der untenstehende Trichter visualisiert das am Beispiel des ersten Jahres; die Y1/Y2/Y3-
Vergleichsgrößen sind anschließend tabellarisch ausgewiesen.

#v(10pt)

// ─── Helper: zentrierter Funnel-Balken mit Wert in der Mitte ─────────────
// width-frac steuert die Breite zwischen 0 und 1. Bei width-frac = 1.0
// füllt der Balken die volle Zeilenbreite, sonst wird er zentriert mit
// gleich breiten "Säulen" links und rechts.
#let funnel-stage(label, value, width-frac, color: accent) = {
  let scale = 100
  let w = calc.max(calc.min(calc.round(width-frac * scale), scale), 12)
  let side = calc.round((scale - w) / 2)
  let actual-w = scale - 2 * side

  let bar = if side <= 0 {
    block(width: 100%, height: 30pt, fill: color)[
      #align(center + horizon)[
        #text(font: sans, size: 13pt, weight: "semibold", fill: paper)[#value]
      ]
    ]
  } else {
    grid(
      columns: (side * 1fr, actual-w * 1fr, side * 1fr),
      rows: 30pt,
      [],
      block(width: 100%, height: 100%, fill: color)[
        #align(center + horizon)[
          #text(font: sans, size: 13pt, weight: "semibold", fill: paper)[#value]
        ]
      ],
      [],
    )
  }

  block(width: 100%, breakable: false)[
    #align(center)[
      #text(font: sans, size: 8pt, fill: muted, tracking: 1.2pt)[
        #upper(label)
      ]
    ]
    #v(3pt)
    #bar
  ]
}

#let funnel-arrow(content) = block(width: 100%)[
  #v(3pt)
  #align(center)[
    #text(font: sans, size: 8.5pt, fill: ink-soft, style: "italic")[
      ↓ #h(3pt) #content
    ]
  ]
  #v(3pt)
]

#block(breakable: false)[
  #funnel-stage(
    [Marketing-Budget Y1 (Eingabe)],
    euro(marketing-y1),
    1.0,
    color: accent,
  )

  #funnel-arrow([
    ÷ Cost per Visitor #h(3pt) (#euro(cost-per-visitor-y1) je Site-Visit)
  ])

  #funnel-stage(
    [Site Visitors],
    num(visitors-y1),
    0.95,
    color: ink-soft,
  )

  #funnel-arrow([
    × #pct(visitor-to-user-conversion * 100) Visitor → Active User Conversion
  ])

  #funnel-stage(
    [Aktive Nutzer (Sign-up + erste Antrags-Action)],
    num(active-users-year1),
    0.50,
    color: ink-soft,
  )

  #funnel-arrow([
    × ~#calc.round(premium-users-year1 / active-users-year1 * 100, digits: 1) % Premium-Conversion (Y1-Mittel; Pilot ab Juli 26)
  ])

  #funnel-stage(
    [Zahlende Pilot-Fälle (#euro(premium-price))],
    num(premium-users-year1),
    0.22,
    color: accent,
  )
]

#v(10pt)

#block(breakable: false)[
  #table(
    columns: (2.4fr, 1fr, 1fr, 1fr),
    align: (left, right, right, right),

    table.hline(stroke: 0.8pt + ink),
    th[Vergleichsgröße], th[Y1], th[Y2], th[Y3],
    table.hline(stroke: 0.4pt + ink),

    [Marketing-Budget],
    [#euro-compact(marketing-y1)],
    [#euro-compact(marketing-y2)],
    [#euro-compact(marketing-y3)],

    [Cost per Visitor (blended)],
    [#euro(cost-per-visitor-y1)],
    [#euro(cost-per-visitor-y2)],
    [#euro(cost-per-visitor-y3)],

    [Site Visitors],
    [#num(visitors-y1)],
    [#num(visitors-y2)],
    [#num(visitors-y3)],

    [V → U Conversion],
    [#pct(visitor-to-user-conversion * 100)],
    [#pct(visitor-to-user-conversion * 100)],
    [#pct(visitor-to-user-conversion * 100)],

    table.hline(stroke: 0.4pt + ink),

    [#text(weight: "semibold")[Aktive Nutzer (abgeleitet)]],
    [#text(weight: "semibold")[#num(active-users-year1)]],
    [#text(weight: "semibold")[#num(active-users-year2)]],
    [#text(weight: "semibold")[#num(active-users-year3)]],

    [#text(fill: muted)[CAC je aktivem Nutzer]],
    [#text(fill: muted)[#euro(acquisition-cost-per-active-user-y1)]],
    [#text(fill: muted)[#euro(acquisition-cost-per-active-user-y2)]],
    [#text(fill: muted)[#euro(acquisition-cost-per-active-user-y3)]],

    table.hline(stroke: 0.8pt + ink),
  )

  #v(0.3em)
  #text(size: 8.5pt, fill: muted, style: "italic")[
    CPV kalibriert auf Channel-Mix (Paid-Floor 0,30-0,80 €/Click, Owned/
    Organic ~0 €); V→U-Conversion 5 % als konservative Mitte des
    DACH-FamilyTech-Benchmarks (3-6 %). CPV sinkt über die Jahre, weil
    Partner- und SEO-Anteil steigen.
  ]
]

#pagebreak()

=== Preis pro zahlendem Kunden

Die vorstehende Analyse berechnet die Kosten pro aktivem Nutzer wie folgt:
#euro(acquisition-cost-per-active-user-y1) in Y1, #euro(acquisition-cost-per-active-user-y3) in Y3.  

Was kostet ein jedoch ein *zahlender* Kunde - getrennt nach
Self-Service und Vollservice - und wie verhält sich das zum Erlös je
Kunde (LTV)?

#v(2pt)
#align(center)[
  #text(font: sans, size: 10.5pt, fill: ink-soft, style: "italic")[
    CAC = Marketing-Budget ÷ zahlende Kunden   ·   LTV/CAC = Erlös je Kunde ÷ CAC
  ]
]

#v(0.4em)

Das Verhältnis LTV/CAC zeigt unmittelbar, wie viel Umsatz jeder
eingesetzte Marketing-Euro generiert. Die folgende Gegenüberstellung
macht direkt sichtbar, in welchem Tarif/Jahr sich Marketing-Aufwand und
Erlös die Waage halten - und wo der Self-Service erst durch das
Vollservice-Paket im Mix tragfähig wird.

#v(8pt)

// ─── CAC vs. LTV Vergleichsbalken ───────────────────────────────────────
// Kompakte horizontale Balken, gleiche €-Skala (Max = 50 €), darunter
// Tarif-/Jahres-Label und LTV/CAC-Indikator. Ziel: auf einen Blick erkennen,
// ob LTV den CAC deckt (LTV/CAC ≥ 1).
#let cac-ltv-max = 50  // €-Skala, deckt alle Werte ab (max ist FS-Y2 CAC)

#let comp-bar(value, color) = {
  let scale = 1000
  // Bar nimmt max 80 % der Zeile ein, damit das €-Label rechts immer Platz hat.
  let filled = calc.round(value / cac-ltv-max * 0.80 * scale)
  let rest = scale - filled
  grid(
    columns: (filled * 1fr, rest * 1fr),
    rows: 12pt,
    column-gutter: 6pt,
    block(width: 100%, height: 100%, fill: color),
    align(left + horizon)[
      #text(font: sans, size: 8.5pt, fill: ink-soft, weight: "semibold")[
        #euro(value)
      ]
    ],
  )
}

#let ratio-tag(ratio) = {
  // < 0.7  : klar unter Wasser   → rot ✗
  // 0.7 - <1: nahe Break-Even   → muted ≈
  // ≥ 1.0  : LTV deckt CAC      → grün ✓
  let color = if ratio < 0.7 { neg } else if ratio < 1.0 { muted } else { pos }
  let symbol = if ratio < 0.7 { "✗" } else if ratio < 1.0 { "≈" } else { "✓" }
  text(font: sans, size: 9pt, weight: "semibold", fill: color)[
    #calc.round(ratio, digits: 2) × #h(2pt) #symbol
  ]
}

#let unit-econ-row(period, cac, ltv, ratio) = {
  block(width: 100%, breakable: false, inset: (top: 4pt, bottom: 6pt))[
    #grid(
      columns: (60pt, 1fr, 70pt),
      column-gutter: 12pt,
      align: (left + horizon, left + horizon, right + horizon),

      // Period label
      [
        #text(font: sans, size: 9pt, weight: "semibold", fill: ink)[#period]
      ],

      // CAC und LTV gestapelt
      [
        #grid(
          columns: (28pt, 1fr),
          column-gutter: 6pt,
          rows: (auto, auto),
          row-gutter: 4pt,
          align: (right + horizon, left + horizon),

          text(font: sans, size: 7.5pt, fill: muted)[CAC],
          comp-bar(cac, ink-soft),
          text(font: sans, size: 7.5pt, fill: muted)[LTV],
          comp-bar(ltv, accent),
        )
      ],

      // LTV/CAC ratio
      ratio-tag(ratio),
    )
  ]
}

#let unit-econ-section-header(title, scale-label) = {
  block(width: 100%, breakable: false)[
    #grid(
      columns: (1fr, 70pt),
      column-gutter: 12pt,
      align: (left + horizon, right + horizon),
      [
        #text(font: sans, size: 8pt, weight: "semibold", fill: accent, tracking: 1.2pt)[
          #upper(title)
        ]
        #h(8pt)
        #text(font: sans, size: 7.5pt, fill: muted, style: "italic")[
          · #scale-label
        ]
      ],
      [#text(font: sans, size: 7.5pt, fill: muted, tracking: 1pt)[#upper("LTV/CAC")]],
    )
    #v(2pt)
    #line(length: 100%, stroke: 0.4pt + rule)
  ]
}

// Mini-Legende über dem Vergleich
#align(right)[
  #text(font: sans, size: 7.5pt, fill: muted)[
    #box(width: 10pt, height: 8pt, fill: ink-soft) #h(3pt) CAC #h(10pt)
    #box(width: 10pt, height: 8pt, fill: accent)   #h(3pt) LTV #h(10pt)
    Skala 0 - 50 €
  ]
]
#v(4pt)

#block(breakable: false)[
  #unit-econ-section-header(
    [Self-Service],
    [LTV = #euro(premium-price) je Antrag],
  )
  #unit-econ-row([Y2], cac-ss-y2, ltv-ss, ltv-cac-ss-y2)
  #unit-econ-row([Y3], cac-ss-y3, ltv-ss, ltv-cac-ss-y3)

  #v(8pt)

  #unit-econ-section-header(
    [Vollservice],
    [LTV = #euro(premium-price-target) je Familie · mehrere Anträge gebündelt],
  )
  #unit-econ-row([Y2], cac-fs-y2, ltv-fs, ltv-cac-fs-y2)
  #unit-econ-row([Y3], cac-fs-y3, ltv-fs, ltv-cac-fs-y3)
]

#v(10pt)

Die folgende Tabelle hinterlegt Conversion-Annahmen, absolute CAC-Werte
und das LTV/CAC-Verhältnis im Detail - inklusive des Y1-Pilots, in dem
nur der Self-Service-Tarif aktiv ist.

#v(6pt)

#block(breakable: false)[
  #table(
    columns: (2.2fr, 1fr, 1fr, 1fr),
    align: (left, right, right, right),

    table.hline(stroke: 0.8pt + ink),
    th[Kennzahl], th[Y1], th[Y2], th[Y3],
    table.hline(stroke: 0.4pt + ink),

    [Marketing-Budget],
    [#euro-compact(marketing-y1)],
    [#euro-compact(marketing-y2)],
    [#euro-compact(marketing-y3)],

    [Aktive Nutzer (aus Trichter)],
    [#num(active-users-year1)],
    [#num(active-users-year2)],
    [#num(active-users-year3)],

    table.cell(colspan: 4)[
      #text(font: sans, size: 8.5pt, weight: "semibold", fill: accent, tracking: 1pt)[
        #upper("Self-Service - " + str(int(premium-price)) + ",99 € je Antrag")
      ]
    ],

    [ Conversion],
    [ ~#calc.round(premium-users-year1 / active-users-year1 * 100, digits: 1) %],
    [ #pct(conversion-self-service-y2 * 100)],
    [ #pct(conversion-self-service-y3 * 100)],

    [ CAC pro SS-Kunde],
    [ #euro(cac-ss-y1)],
    [ #euro(cac-ss-y2)],
    [ #euro(cac-ss-y3)],

    [ #text(weight: "semibold")[LTV/CAC SS]],
    [ #text(weight: "semibold", fill: if ltv-cac-ss-y1 < 1 { neg } else { pos })[
      #calc.round(ltv-cac-ss-y1, digits: 2) ×
    ]],
    [ #text(weight: "semibold", fill: if ltv-cac-ss-y2 < 1 { neg } else { pos })[
      #calc.round(ltv-cac-ss-y2, digits: 2) ×
    ]],
    [ #text(weight: "semibold", fill: if ltv-cac-ss-y3 < 1 { neg } else { pos })[
      #calc.round(ltv-cac-ss-y3, digits: 2) ×
    ]],

    table.cell(colspan: 4)[
      #text(font: sans, size: 8.5pt, weight: "semibold", fill: accent, tracking: 1pt)[
        #upper("Vollservice - " + str(int(premium-price-target)) + ",99 € je Familie")
      ]
    ],

    [ Conversion],
    [ -],
    [ #pct(conversion-full-service-y2 * 100)],
    [ #pct(conversion-full-service-y3 * 100)],

    [ CAC pro FS-Kunde],
    [ -],
    [ #euro(cac-fs-y2)],
    [ #euro(cac-fs-y3)],

    [ #text(weight: "semibold")[LTV/CAC FS]],
    [ -],
    [ #text(weight: "semibold", fill: if ltv-cac-fs-y2 < 1 { neg } else { pos })[
      #calc.round(ltv-cac-fs-y2, digits: 2) ×
    ]],
    [ #text(weight: "semibold", fill: if ltv-cac-fs-y3 < 1 { neg } else { pos })[
      #calc.round(ltv-cac-fs-y3, digits: 2) ×
    ]],

    table.hline(stroke: 0.4pt + ink),

    [#text(weight: "semibold")[Mix-Brutto-Marge je aktivem Nutzer]
     #text(size: 8pt, fill: muted)[ (Erlös SS+FS - CAC)]],
    [-],
    [#text(weight: "semibold", fill: if gross-margin-per-active-y2 < 0 { neg } else { pos })[
      #euro(gross-margin-per-active-y2)
    ]],
    [#text(weight: "semibold", fill: if gross-margin-per-active-y3 < 0 { neg } else { pos })[
      #euro(gross-margin-per-active-y3)
    ]],

    table.hline(stroke: 0.8pt + ink),
  )
]


#v(1em)

=== Quartalsverlauf in Jahr 1

Jahr 1 wird als Zeitraum von zwölf Monaten ab Markteinführung verstanden
(Q2 2026 - Q1 2027). Die Planung unterscheidet zwischen aktiven Nutzern
und zahlenden Fällen. Die kostenpflichtige Zusatzleistung startet im
*Juli 2026*; die Premium-Conversion baut sich erst danach schrittweise
auf. Mit der Umstellung auf das Vollservice-Paket in 2027 zum Preis von
#euro(premium-price-target) sinkt sie voraussichtlich wieder ab.

#v(0.4em)

#block(breakable: false)[
  #table(
    columns: (1.6fr, 1fr, 1fr, 1fr, 1fr),
    align: (left, right, right, right, right),

    table.hline(stroke: 0.8pt + ink),
    th[Kennzahl], th[Apr-Jun 26], th[Jul-Sep 26], th[Okt-Dez 26], th[Jan-Mär 27],
    table.hline(stroke: 0.4pt + ink),

    [Marketing-Budget], [#euro(marketing-q1)], [#euro(marketing-q2)], [#euro(marketing-q3)], [#euro(marketing-q4)],
    [Site Visitors (÷ CPV #euro(cost-per-visitor-y1))], [#num(visitors-q1)], [#num(visitors-q2)], [#num(visitors-q3)], [#num(visitors-q4)],
    [Aktive Nutzer (× #pct(visitor-to-user-conversion * 100) V→U)], [#num(active-users-q1)], [#num(active-users-q2)], [#num(active-users-q3)], [#num(active-users-q4)],
    [Conversion in Premium], [#pct(conversion-q1 * 100)], [#pct(conversion-q2 * 100)], [#pct(conversion-q3 * 100)], [#pct(conversion-q4 * 100)],
    [Zahlende Fälle], [#num(premium-users-q1)], [#num(premium-users-q2)], [#num(premium-users-q3)], [#num(premium-users-q4)],
    [Umsatz], [#euro(revenue-q1)], [#euro(revenue-q2)], [#euro(revenue-q3)], [#euro(revenue-q4)],

    table.hline(stroke: 0.8pt + ink),
  )

  #v(0.4em)
  #text(size: 8.5pt, fill: muted, style: "italic")[
    "Aktive Nutzer" = Nutzer, die den Antragsprozess ernsthaft beginnen,
    unabhängig davon, ob sie später einen kostenpflichtigen Tarif wählen.
     ]
]


// ═══════════════════════════════════════════════════════════════════════════
// 5. WIRTSCHAFTLICHKEIT
// ═══════════════════════════════════════════════════════════════════════════
#pagebreak()

= Wirtschaftlichkeit <Wirtschaftlichkeit>

== Planungslogik

Die Finanzplanung folgt der zweistufigen Modell-Logik aus Kap. 4: *Jahr 1*
(Apr 2026 - Mär 2027) ist Freemium mit kostenlosem Self-Service und
optionalem Premium-Pilot zu #euro(premium-price) ab Juli 2026 - ein
ausgewiesenes *Validierungs- und Aufbaujahr*. *Ab Jahr 2* (April 2027)
entfällt die kostenlose Variante; aktive Nutzer wählen zwischen
Self-Service zu #euro(premium-price) und Vollservice-Paket zu
#euro(premium-price-target) je Familie. Aufwendungen sind durchgängig
großzügig kalkuliert (inkl. Puffer für unvorhergesehene Kosten).

#v(0.6em)

=== Erwartete Kunden je Paket und Jahr

Die folgende Übersicht bündelt aktive Nutzer, Conversion-Annahmen und
zahlende Kunden je Tarif über den Drei-Jahres-Horizont - als Grundlage
für die nachfolgende GuV.

#v(6pt)

#block(breakable: false)[
  #table(
    columns: (2.2fr, 1fr, 1fr, 1fr),
    align: (left, right, right, right),

    table.hline(stroke: 0.8pt + ink),
    th[Kennzahl],
    th[Y1
       #text(size: 7pt, fill: muted, weight: "regular")[Free + Pilot]],
    th[Y2
       #text(size: 7pt, fill: muted, weight: "regular")[SS + VS]],
    th[Y3
       #text(size: 7pt, fill: muted, weight: "regular")[SS + VS]],
    table.hline(stroke: 0.4pt + ink),

    [Aktive Nutzer],
    [#num(active-users-year1)],
    [#num(active-users-year2)],
    [#num(active-users-year3)],

    [Conversion #euro(premium-price)-Tarif
     #text(size: 8pt, fill: muted)[ (Y1 Pilot / ab Y2 Self-Service)]],
    [#calc.round(premium-users-year1 / active-users-year1 * 100, digits: 1) %],
    [#pct(conversion-self-service-y2 * 100)],
    [#pct(conversion-self-service-y3 * 100)],

    [Kunden #euro(premium-price)-Tarif],
    [#num(premium-users-year1)],
    [#num(ss-users-y2)],
    [#num(ss-users-y3)],

    [Conversion #euro(premium-price-target)-Vollservice],
    [-],
    [#pct(conversion-full-service-y2 * 100)],
    [#pct(conversion-full-service-y3 * 100)],

    [Kunden #euro(premium-price-target)-Vollservice],
    [-],
    [#num(fs-users-y2)],
    [#num(fs-users-y3)],

    table.hline(stroke: 0.4pt + ink),

    [#text(weight: "semibold")[Zahlende Fälle (gesamt)]],
    [#text(weight: "semibold")[#num(paid-cases-y1)]],
    [#text(weight: "semibold")[#num(paid-cases-y2)]],
    [#text(weight: "semibold")[#num(paid-cases-y3)]],

    table.hline(stroke: 0.8pt + ink),
  )

  #v(0.4em)
  #text(size: 8.5pt, fill: muted, style: "italic")[
    "Aktive Nutzer" = Nutzer, die den
    Antragsprozess ernsthaft beginnen, unabhängig davon, ob sie später
    einen kostenpflichtigen Tarif wählen.
  ]
]

== Drei-Jahres-Gewinn- und Verlustrechnung

#table(
  columns: (2.5fr, auto, auto, auto),
  align: (left, right, right, right),

  table.hline(stroke: 0.8pt + ink),
  th[Position], th[Jahr 1], th[Jahr 2], th[Jahr 3],
  table.hline(stroke: 0.4pt + ink),

  [#text(weight: "semibold")[Umsatzerlöse]
   #text(size: 8pt, fill: muted)[ (#num(paid-cases-y1) / #num(paid-cases-y2) / #num(paid-cases-y3) zahl. Fälle gesamt)]],
  [#euro-compact(revenue-y1)],
  [#euro-compact(revenue-y2)],
  [#euro-compact(revenue-y3)],

  [#text(size: 9pt, fill: ink-soft)[ davon Self-Service (#euro(premium-price))]],
  [#text(size: 9pt, fill: ink-soft)[#euro-compact(revenue-y1)]],
  [#text(size: 9pt, fill: ink-soft)[#euro-compact(ss-revenue-y2)]],
  [#text(size: 9pt, fill: ink-soft)[#euro-compact(ss-revenue-y3)]],

  [#text(size: 9pt, fill: ink-soft)[ davon Vollservice-Paket (#euro(premium-price-target))]],
  [#text(size: 9pt, fill: ink-soft)[-]],
  [#text(size: 9pt, fill: ink-soft)[#euro-compact(fs-revenue-y2)]],
  [#text(size: 9pt, fill: ink-soft)[#euro-compact(fs-revenue-y3)]],

  [Gründungskosten (einmalig)],
  [-#euro-compact(founding-costs-max)], [-], [-],

  [Fixkosten (Hosting, Tools, QES, Steuerberater, BambiniAI)],
  [-#euro-compact(annual-fixed-costs-y1 + ai-cost-y1)],
  [-#euro-compact(annual-fixed-costs-y2 + ai-cost-y2)],
  [-#euro-compact(annual-fixed-costs-y3 + ai-cost-y3)],

  [Marketing / Akquisition],
  [-#euro-compact(marketing-y1)],
  [-#euro-compact(marketing-y2)],
  [-#euro-compact(marketing-y3)],

  [Variable Bearbeitungskosten
   #text(size: 8pt, fill: muted)[ (Self-Service #euro(variable-cost-per-ss-case)/Antrag,
   Vollservice #euro(variable-cost-per-fs-case)/Familie)]],
  [-#euro-compact(variable-costs-y1)],
  [-#euro-compact(variable-costs-y2)],
  [-#euro-compact(variable-costs-y3)],

  [Puffer (unvorhergesehene Kosten)],
  [-#euro-compact(contingency-y1)],
  [-#euro-compact(contingency-y2)],
  [-#euro-compact(contingency-y3)],

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

#text(size: 8.5pt, fill: muted, style: "italic")[
  Annahmen: Keine Personalkosten (unbezahlte Gründerarbeit bis zur Profitabilität).
 
]


#pagebreak()
== Drei-Jahres-Verlauf (kumulativ)

#text(font: sans, size: 9.5pt, weight: "semibold", fill: ink)[
  Kumulativer Verlauf Umsatz, Kosten und Ergebnis (Quartale 0 - 12)
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

#v(14pt)

// ─── Path to Profitability: Jahresergebnis pro Jahr ─────────────────────
// Statt der drei kumulativen Werte (die ohnehin schon im Chart oberhalb
// als Linie sichtbar sind) zeigen wir hier die JAHRESERGEBNISSE - so wird
// der Aufwärtstrend von Validierungsjahr-Burn (Y1) über Burn-Reduktion
// (Y2) bis zur erstmaligen Profitabilität (Y3) visuell unmittelbar lesbar.

#v(3pt)

// Helper: Mini-Bar mit horizontaler Mittellinie als 0-Baseline.
// Negative Werte: Balken wächst NACH UNTEN von der Baseline.
// Positive Werte: Balken wächst NACH OBEN von der Baseline.
#let max-result-abs = calc.max(
  calc.abs(result-y1),
  calc.abs(result-y2),
  calc.abs(result-y3),
)
#let result-bar(value) = {
  let max-bar-pt = 26  // maximale Balkenhöhe in pt
  let bar-pt = calc.round(calc.abs(value) / max-result-abs * max-bar-pt)
  let color = if value < 0 { neg } else { pos }
  let total-h = max-bar-pt * 2 + 2  // Baseline + voller Range nach oben & unten

  block(width: 100%, height: total-h * 1pt)[
    // Baseline genau in der Mitte
    #place(top + center, dy: max-bar-pt * 1pt)[
      #line(length: 80%, stroke: 0.4pt + ink-soft)
    ]
    // Balken: für negativ NACH UNTEN von der Baseline, für positiv NACH OBEN
    #if value < 0 {
      place(top + center, dy: max-bar-pt * 1pt)[
        #rect(width: 30pt, height: bar-pt * 1pt, fill: color, stroke: none)
      ]
    } else {
      place(top + center, dy: (max-bar-pt - bar-pt) * 1pt)[
        #rect(width: 30pt, height: bar-pt * 1pt, fill: color, stroke: none)
      ]
    }
  ]
}

#grid(
  columns: (1fr, 1fr, 1fr),
  column-gutter: 14pt,
  align: center,

  // Y1 - Validierungsjahr
  block(width: 100%)[
    #result-bar(result-y1)
    #v(6pt)
    #text(font: sans, size: 7.5pt, fill: muted, tracking: 1.2pt)[
      #upper("Jahr 1 · Validierung")
    ]
    #v(4pt)
    #text(font: sans, size: 14pt, weight: "semibold", fill: neg)[
      #signed-euro-compact(result-y1)
    ]
  ],

  // Y2 - Burn-Reduktion (positive delta vs Y1)
  block(width: 100%)[
    #result-bar(result-y2)
    #v(6pt)
    #text(font: sans, size: 7.5pt, fill: muted, tracking: 1.2pt)[
      #upper("Jahr 2 · Verlust-Reduktion")
    ]
    #v(4pt)
    #text(font: sans, size: 14pt, weight: "semibold", fill: ink-soft)[
      #signed-euro-compact(result-y2)
    ]
    #v(2pt)
    #text(font: sans, size: 7.5pt, weight: "semibold", fill: pos)[
      ↗ #signed-euro-compact(result-y2 - result-y1) vs. Y1
    ]
  ],

  // Y3 - Erstmals profitabel
  block(width: 100%)[
    #result-bar(result-y3)
    #v(6pt)
    #text(font: sans, size: 7.5pt, fill: muted, tracking: 1.2pt)[
      #upper("Jahr 3 · Profitabel")
    ]
    #v(4pt)
    #text(font: sans, size: 14pt, weight: "semibold", fill: pos)[
      #signed-euro-compact(result-y3) #h(2pt) ✓
    ]
    #v(2pt)
    #text(font: sans, size: 7.5pt, weight: "semibold", fill: pos)[
      ↗ #signed-euro-compact(result-y3 - result-y2) vs. Y2
    ]
  ],
)

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

  [\+ Umsatzerlöse],
  [#euro-compact(revenue-y1)], [#euro-compact(revenue-y2)], [#euro-compact(revenue-y3)],

  [- Gesamtkosten],
  [-#euro-compact(total-costs-y1)], [-#euro-compact(total-costs-y2)], [-#euro-compact(total-costs-y3)],

  table.hline(stroke: 0.4pt + ink),

  [#text(weight: "semibold")[Endbestand]],
  [#text(weight: "semibold")[#euro-compact(cash-end-y1)]],
  [#text(weight: "semibold")[#euro-compact(cash-end-y2)]],
  [#text(weight: "semibold")[#euro-compact(cash-end-y3)]],

  table.hline(stroke: 0.8pt + ink),
)



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
      #upper("S - Stärken (intern)")
    ]
    #v(6pt)
    #text(size: 9pt, fill: ink-soft)[
      - Niedrige Fixkosten (#euro(monthly-fixed-costs)/Mon.) - geringes Verlustrisiko
      - Kostenloser Einstieg = Markteintritt ohne Preisbarriere
      - BambiniAI als Differenzierung (kein Wettbewerber bietet Vergleichbares)
      - OpenRouter mit Zero Data Retention - datenschutzfreundliche KI-Nutzung
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
      #upper("W - Schwächen (intern)")
    ]
    #v(6pt)
    #text(size: 9pt, fill: ink-soft)[
      - Kein Track Record - Neugründung ohne Markthistorie
      - Studentisches Gründerteam - begrenzte operative Erfahrung und Kapazität
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
      #upper("O - Chancen (extern)")
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
      #upper("T - Risiken (extern)")
    ]
    #v(6pt)
    #text(size: 9pt, fill: ink-soft)[
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

#v(0.4em)
#text(size: 8.5pt, fill: muted, style: "italic")[
  Die folgenden Mitigation-Karten adressieren systematisch die sieben
  identifizierten Risiken (R1 - R7). Jede Karte zeigt Risikolage und
  konkrete Gegenmaßnahmen.
]


== Mitigation R1 - R3: Haftung, Datenschutz, KI-Kosten

#risk-card(
  "R1", "Haftung / RDG", "Niedrig",
  [
    - *Technisches Hilfsmittel*, keine Rechtsberatung (§ 2 Abs. 1 RDG)
    - Keine rechtliche Würdigung
    - Nutzer bestätigen Angaben vor Versand und bleibt damit in der Verantwortung
    - Perspektivische Kooperation mit Rechtsanwaltskanzleien
    - Premium-Prozess bewusst standardisiert; Ausweitung nur nach rechtlicher Prüfung
  ],
)

#risk-card(
  "R2", "Datenschutz / DSGVO", "Niedrig - Mittel",
  [
    - Kerndaten verbleiben im EWR (Supabase Frankfurt, Living-Bots Bremen)
    - Datenminimierung, klare Zweckbindung, Löschkonzept produktseitig
    - KI-Anfragen über OpenRouter mit *Zero Data Retention*
    - Externer Datenschutzbeauftragter < 20 MA nicht erforderlich (§ 38 BDSG)
  ],
)

#risk-card(
  "R3", "KI-Kosten", "Niedrig",
  [
    - Nur rund *#euro(ai-cost-per-request)* pro Freitextanfrage
    - FAQ-first: Standardfragen ohne Modellaufruf
    - Nutzungslimits, Tages- und Nutzerbudgets
    - Anbieter-/Modell-Whitelist via OpenRouter
    - Anomalie-Monitoring gegen Missbrauch
    - *Kein wesentlicher finanzieller Risikofaktor*
  ],
)

== Mitigation R4 - R7: Monetarisierung, Ressourcen, Markt

#risk-card(
  "R4", "Conversion zu niedrig", "Mittel",
  [
    Premium-Pilot ab Juli 2026 mit echter Nutzungsmessung; Preis- und
    Leistungstests. Mit der Tarif-Umstellung ab 2027 wirken zwei Faktoren
    parallel: Der günstige Self-Service zu #euro(premium-price) senkt die
    Einstiegshürde, das Vollservice-Paket zu #euro(premium-price-target)
    bündelt sämtliche Anträge der Familie in einer Pauschale und steigert
    den Erlös je zahlender Familie deutlich. Pivot-Optionen: weitere
    Servicestufen oder White-Label-Lösung.
  ],
)

#risk-card(
  "R5", "Ressourcen / Examen", "Mittel",
  [
    Schwerpunktstudium und Staatsexamensvorbereitung reduzieren
    Verfügbarkeit. *Entscheidend ist:* das Kernprodukt
    (Elterngeld-Self-Service) ist bereits fertiggestellt - der Fokus
    liegt jetzt auf der schrittweisen *Automatisierung* des Antrags-
    prozesses und auf Partner-Onboarding, was deutlich weniger
    Entwicklungszeit bindet als der Initialaufbau. Dadurch lässt sich
    der operative Aufwand *dynamisch skalieren* und an die jeweilige
    Examens-Auslastung anpassen. Weitere Gegenmaßnahmen: enger
    MVP-Fokus auf Elterngeld, phasenweiser Ausbau, Priorisierung von
    Partnerschaften, Möglichkeit der Auslagerung an Werkstudierende
    oder Freelancer, *reduziertes Ausbauszenario* falls Verfügbarkeit
    unter Plan.
  ],
)

#risk-card(
  "R6", "Regulatorik (BEEG / OZG)", "Niedrig",
  [
    Modulare Architektur ermöglicht schnelle Anpassung an Gesetzesänderungen.
    OZG 2.0 ist zugleich eine *Chance*: Digitale Behördenschnittstellen
    begünstigen das Geschäftsmodell. Regelmäßige rechtliche Prüfung;
    begrenzter Leistungsumfang zum Start reduziert Anpassungslast.
  ],
)

#risk-card(
  "R7", "Akquisition / CAC", "Mittel",
  [
    Das *kostenlose Angebot* selbst wirkt als Akquisitionsinstrument: niedrige
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

Entstanden im Rahmen des Hamburg Legal Hackathon 2025 (Motto: "Access to
Justice"). Das Team verbindet juristisches Verständnis, Produktarbeit und
technische Umsetzung - eine für ein Produkt im Bereich digitaler
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

== Roadmap (Phasen, 3-Jahres-Überblick)

Bambini soll zunächst nicht durch Breite, sondern durch *Verlässlichkeit
im Kernprozess* überzeugen. Der erste Schwerpunkt liegt auf Elterngeld,
weil hier Komplexität, Bedarf und zeitliche Relevanz zusammenkommen. Aus
dieser Basis kann das Produkt in zwei Richtungen wachsen: weitere
Leistungsarten (*horizontal*) und höhere Service-Tiefe (*vertikal*). Die
Phasen sind nicht nach Kalenderhalbjahren, sondern nach den jeweiligen
*Produkt- und Monetarisierungs-Meilensteinen* gegliedert.

#v(0.6em)

#line(length: 100%, stroke: 0.6pt + ink)
#v(8pt)

#phase(
  "Apr - Jun 2026",
  [GmbH-Gründung und Markteinführung],
  [
    Gründung im Mai · Elterngeld-Self-Service-MVP live · Aufbau erster Nutzerbasis über
    SEO/Ratgeber-Inhalte und Social-Media Marketing · *Noch
    keine Monetarisierung.*
  ],
  [Ziel: ~#num(active-users-q1) aktive Nutzer · Umsatz #euro(revenue-q1)],
)
#pagebreak()
#phase(
  "Jul 2026 - Mär 2027",
  [Premium-Pilot - Self-Service zu #euro(premium-price)],
  [
    Premium-Zusatzleistung (vollautomatisierte Antragseinreichung)
    geht live · erste
    Creator-Kooperationen · belastbare Conversion- und LTV/CAC-Daten ·
    Produktstabilisierung.
  ],
  [Ziel: weitere ~#num(active-users-q2 + active-users-q3 + active-users-q4) aktive Nutzer · Y1-Umsatz #euro-compact(revenue-y1)],
)

#phase(
  "Ab April 2027",
  [Tarif-Umstieg und horizontale Erweiterung],
  [
    *Kostenfreier Service entfällt:* aktive Nutzer wählen zwischen *Self-Service zu
    #euro(premium-price)* je Antrag und *Vollservice-Paket zu
    #euro(premium-price-target)* je Familie · Erweiterung um Kindergeld
    und Elternzeit nach Stabilisierung von Elterngeld · weitere
    Partnerkanäle (Krankenkassen, Hebammenverbände) in Sondierung ·
    Marketing-Budget skaliert auf #euro-compact(marketing-y2).
  ],
  [Ziel: ~#num(active-users-year2) aktive Nutzer · Umsatz #euro-compact(revenue-y2)],
)

#phase(
  "2028+",
  [Plattformausbau und B2B-Perspektive],
  [
    Weitere Familienleistungen (Kinderzuschlag, Mutterschaftsgeld) ·
    Corporate-Benefit-Angebote für Arbeitgeber als zusätzliche
    Erlösdimension · API-Behördenanbindung, sofern verfügbar · höhere
    Service-Tiefe nach erneuter rechtlicher Prüfung. *Erstmals
    erwartetes Jahresergebnis im positiven Bereich
    (#signed-euro-compact(result-y3)).*
  ],
  [Ziel: ~#num(active-users-year3) aktive Nutzer · Umsatz #euro-compact(revenue-y3)],
)


// ═══════════════════════════════════════════════════════════════════════════
// 8. SCHLUSS / CALL TO ACTION
// ═══════════════════════════════════════════════════════════════════════════
#pagebreak()

= Ausblick <CTA>

#v(2.4cm)

// ─── Hero: links-bündig, im Editorial-/Cover-Stil ─────────────────────
// Bewusst kompakt - die Substanz steht in den vorangegangenen Kapiteln.
// Asymmetrisch und links-bündig, damit die Schlussseite typografisch
// dem Cover entspricht (Front-Cover ↔ Back-Cover).
#text(
  font: serif,
  size: 34pt,
  weight: "regular",
  fill: ink,
  tracking: -0.5pt,
)[
  Lassen Sie uns sprechen.
]

#v(12pt)

#block(width: 80%)[
  #set par(leading: 0.75em, justify: false)
  #text(font: serif, size: 14pt, style: "italic", fill: ink-soft)[
    Wir schaffen gemeinsam einen
    #text(fill: accent)[einfachen Zugang zu #linebreak() Familienleistungen].
  ]
]

#v(10pt)

#text(font: sans, size: 10pt, fill: muted, tracking: 0.4pt)[
  Bambini · Wachstumsfinanzierung 2026 - 2028
]

#v(2.6cm)

// ─── Asymmetrischer Hauptblock: Label links, Inhalt rechts ─────────────
// Mirror der Cover-Komposition (Gründerteam | Kontakt). Ein einziger
// Blick liefert das gesamte Angebot: Was wir suchen + Wofür.
#line(length: 100%, stroke: 0.4pt + rule)
#v(18pt)

#grid(
  columns: (1fr, 2.6fr),
  column-gutter: 28pt,
  align: (left + top, left + top),

  // Label
  text(
    font: sans,
    size: 8.5pt,
    weight: "semibold",
    fill: muted,
    tracking: 1.4pt,
  )[
    #upper("Was wir suchen")
  ],

  // Inhalt: groß, Akzent, mit kurzer italic Beschreibung
  block[
    #text(
      font: sans,
      size: 42pt,
      weight: "semibold",
      fill: accent,
      tracking: -0.8pt,
    )[
      #euro(recommended-funding)
    ]
    #v(6pt)
    #text(font: serif, size: 10.5pt, fill: ink-soft, style: "italic")[
      GmbH-Gründung · Skalierung von Bambini zur ganzheitlichen Familienplattform über drei Jahre·
      Acess to Justice für Eltern.
    ]
  ],
)

#v(22pt)
#line(length: 100%, stroke: 0.4pt + rule)
#v(18pt)

// ─── Kontakt-Block, gleiche zwei-Spalten-Optik ─────────────────────────
#grid(
  columns: (1fr, 2.6fr),
  column-gutter: 28pt,
  align: (left + top, left + top),

  text(
    font: sans,
    size: 8.5pt,
    weight: "semibold",
    fill: muted,
    tracking: 1.4pt,
  )[
    #upper("Kontakt")
  ],

  block[
    #text(font: sans, size: 12pt, weight: "semibold", fill: ink)[
      info\@bambini-claims.de
    ] \
    #text(font: sans, size: 10.5pt, fill: ink-soft)[
      bambini-claims.de
    ]
    #v(6pt)
    #text(font: sans, size: 8.5pt, fill: muted)[
      Bambini · Hamburg · Stand Mai 2026
    ]
  ],
)

#v(18pt)
#line(length: 100%, stroke: 0.4pt + rule)
