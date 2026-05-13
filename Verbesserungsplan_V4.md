# Verbesserungsplan V4 – Bambini Business Plan

**Stand:** 06.05.2026
**Vorgängerversionen:** V2 (visuell aufwendig, inhaltlich zu optimistisch) · V3 (inhaltlich konservativ, visuell sehr reduziert)
**Ziel V4:** V2-Optik **+** V3-Inhalt **+** Meeting-Kritik vollständig adressiert.

---

## 1. Leitgedanke

V4 soll der erste Plan sein, den wir extern (ARAG, Sebastian, Nicole, Investoren)
weitergeben können, ohne dass wir auf Rückfragen sofort relativieren müssen.

Drei Grundprinzipien:

1. **Vom Ergebnis her gedacht** (vgl. Meeting): Erst Aussage, dann Belegkette.
2. **Risiko vor Profit**: Investoren wollen abgesicherte Risiken sehen, nicht
   einen frühen Break-Even, der auf brüchigen Annahmen steht.
3. **Wesentlichkeit + Verhältnismäßigkeit**: Kein Springen zwischen
   Tiefenflug und Oberflächlichkeit. 15 Seiten Zielumfang (V2 hat ~25).

---

## 2. Was sich inhaltlich ändert (gegenüber V2)

### 2.1 Preis- und Geschäftsmodell

| Thema | V2 (alt) | V4 (neu) |
|---|---|---|
| Preis Basis | 49,99 € Einmalzahlung | **0 € (Freemium)** |
| Premium | nicht differenziert | **9,99 € Zusatzleistung ab Juli 2026** (Antrag absenden / abwickeln) |
| Antragsumfang Start | Elterngeld + Kindergeld + Elternzeit + Mutterschaftsgeld + Kinderzuschlag | **nur Elterngeld** |
| Versand | „volldigital, QES" | Free: **Nutzer reicht selbst ein**; Premium: standardisierte Einreichung |
| BambiniAI | als generisches Feature | **eigene Differenzierung**, Wettbewerber bieten dies nicht |
| B2B | tragende zweite Säule | **Perspektive ab 2027/28**, nicht in Jahr-1-Planung |

**Wettbewerbslogik:** Mit der kostenlosen Basisversion **ziehen wir mit
Wettbewerbern gleich**, die genau diesen Self-Service für 40–50 € verkaufen.
Differenzierung erfolgt zusätzlich über BambiniAI – ein Feature, das
kein Wettbewerber in dieser Form anbietet.

### 2.2 Wirtschaftlichkeit

| Thema | V2 | V4 |
|---|---|---|
| Jahr 1 | „profitabel ab Jahr 1, alle Szenarien profitabel" | **Validierungsjahr, geplant negativ** |
| Break-Even | monatlich + kumulativ ab ~28 Kunden | **3-Jahres-GuV im Vordergrund**, Break-Even erst bei Skalierung |
| Umsatz Jahr 1 | ~30k € | **~1k €** (nur Premium-Pilot ab Juli) |
| Kosten | nur Fixkosten + Marketing | **+ KI-Kosten, + variable Premium-Kosten, + Recht/Compliance, + Puffer** |
| Liquidität | knapper Hinweis | **eigene Liquiditätstabelle** mit Cash-End-Bestand pro Quartal/Jahr |
| Kapitalbedarf | 13.595 – 13.595 € | **Mindestbedarf ~13,6k € + empfohlener Rahmen 22k €** |

### 2.3 Tech-Stack

| Thema | V2 | V4 |
|---|---|---|
| KI-Anbieter | Google Cloud / Anthropic implizit | **OpenRouter mit Zero Data Retention** |
| Hosting Kerndaten | Supabase Frankfurt + Living-Bots Bremen | unverändert |
| ZDR-Framing | – | **risikomindernde Maßnahme**, *nicht* alleinige DSGVO-Lösung (Sebastian) |
| FAQ-first | – | Standardfragen ohne Modellaufruf, um KI-Kosten zu deckeln |

### 2.4 Risiken & Compliance (Meeting-Hauptkritik)

V2 hat die Risiken zu spät und zu defensiv. V4 zieht Risiken nach vorne und
macht sie sichtbar. Konkret:

- **R1 Haftung / RDG** (technisches Hilfsmittel, keine Rechtsberatung – mit
  klarer Positionierung **vor** der Premium-Einführung).
- **R2 Datenschutz** (Datenflüsse dokumentiert, ZDR, EU-Kerninfra).
- **R3 KI-Kosten** (FAQ-first, Limits, Budgetgrenzen, Monitoring).
- **R4 Monetarisierung** (Conversion könnte ausbleiben → Pivot-Optionen).
- **R5 Ressourcen / Examen** (Bucerius-Schwerpunkt + Examen reduzieren Zeit
  → Phasenmodell, externe Unterstützung möglich).
- **R6 Regulatorik** (BEEG/OZG-Änderungen → modulare Logik).
- **R7 Akquisition** (Paid-Media-Risiko → Diversifikation).

Jedes Risiko bekommt eine **Mitigation in derselben Zeile / Karte**
(Ursache–Wirkung sichtbar).

### 2.5 Sprachstil

Raus mit: „revolutioniert", „erste Plattform", „Marktführer", „alle
Familienleistungen in einer App".
Rein mit: „zunächst", „geplant", „im ersten Schritt", „nach Validierung",
„sofern stabil".

Konkrete Begriffe streichen / ersetzen:
- „5+ Leistungsarten in einer App" → „Start mit Elterngeld, weitere
  Antragsarten als Roadmap".
- „Volldigital inkl. QES-Versand an Behörden" → „vorbereiteter Antrag;
  Einreichung in Free-Variante durch Nutzer selbst".
- „Profitabel ab Jahr 1" → „Jahr 1 als Validierungsjahr; Profitabilität
  geplant ab Skalierung der Zusatzleistungen / weiterer Antragsarten".

---

## 3. Was visuell aus V2 übernommen wird

V2 hat eine sehr starke visuelle Sprache. Diese behalten wir:

- **Farbsystem**: primary `#6B46C1`, accent `#ED8936`, success/danger/info,
  light-bg, surface, gradient-Akzente.
- **Cover-Page** mit oberer und unterer Gradient-Leiste, Logo, Claim,
  Badges (Mai 2026, GmbH i.Gr.).
- **Heading-Style** mit vertikalem Gradient-Balken + großer lila Schrift.
- **Komponenten**: `stat-card`, `kpi-card`, `highlight-box`, `badge`,
  `step-number`, `metric-row`, `risk-card`.
- **Lilaq-Chart** für 3-Jahres-Kumulativ-Darstellung (Umsatz / Kosten / Gewinn).
- **Roadmap-Layout** mit Phasen-Badges und farbigen Boxen pro Phase.
- **SWOT-Matrix** als 2×2-Grid (S/W/O/T mit eigenen Farben).
- **Tabellen** mit primary-Headerzeile und alternierenden Reihen.

Was raus fliegt (visuell):
- **Monatliche Break-Even-Linie** auf Monat-Ebene (zu klein und gibt im
  Freemium-Modell wenig Aussage – Meeting: „Monatlichen Break-Even raus").
- **Detailseiten** wie eigene Seite nur für „Mittelverwendung".

---

## 4. Neue Kapitelstruktur (Ziel: 15 Seiten)

| # | Kapitel | Seiten | Hauptzweck |
|---|---|---|---|
| – | Cover | 1 | Identität, Stand, Status |
| – | Inhalt | 1 | Navigation |
| 1 | **Executive Summary** | 1–2 | Was, warum, wie viel, welche Risiken |
| 2 | **Ausgangssituation & Problem** | 1–2 | Markt, Zielgruppen, Lücke |
| 3 | **Lösung & Produkt** | 2 | MVP-Scope, BambiniAI, Wettbewerb |
| 4 | **Geschäftsmodell & Kundengewinnung** | 2 | Freemium, Conversion, Kanäle |
| 5 | **Technologie, Datenschutz, Recht** | 1 | OpenRouter ZDR, RDG-Abgrenzung |
| 6 | **Wirtschaftlichkeit** | 2–3 | GuV 3J, Fixkosten, Liquidität, Szenarien |
| 7 | **Risiken & SWOT** | 2 | SWOT, Mitigation, Fallback |
| 8 | **Team & Roadmap** | 1–2 | Team, 3-Jahres-Phasen |
| 9 | **Ausblick** | 1 | Skalierungsachsen, Vision, B2B-Perspektive |

→ ca. **14–16 Seiten**.

Die Reihenfolge folgt der Meeting-Empfehlung:
*Problem → Ziel → Lösung → Wirtschaftlichkeit → Risiken → Ressourcen/Zeit → Vision*.

---

## 5. Konkrete inhaltliche To-dos je Kapitel

### Executive Summary
- Vier KPI-Kacheln neu: **0 € Basis · 9,99 € Premium · 1.800 aktive Nutzer J1 · 22k € Funding**.
- Drei Sätze: Was ist Bambini? Warum kostenlos? Was ist die Monetarisierung?
- Tabelle „Annahmen auf einen Blick" (Markt, Nutzer, Premium-Fälle, Umsatz, Ergebnis, Kapitalbedarf).
- Klar benennen: Jahr 1 ist **kein Gewinnjahr**.

### Ausgangssituation & Problem
- 80 Mrd. € Familienleistungen / 70 % Nichtinanspruchnahme.
- TAM 685 k Geburten / SAM ~308 k.
- Zielgruppen: berufstätige Eltern + Familien mit Sprach-/Verständnishürden.
- Quelle BMFSFJ + Hannover.de wieder rein (Glaubwürdigkeit).

### Lösung & Produkt
- **3-Schritt-Prozess**: Daten erfassen → Plausibilität & Anspruch → vorbereiteter Antrag.
- **BambiniAI**-Box mit Hinweis: Zero Data Retention via OpenRouter, Limits,
  „keine Rechtsberatung".
- **Wettbewerbstabelle** (Bambini Free / private Anbieter / staatliche
  Angebote) – ehrlich, nicht überlegen-tönend.
- **Was wir bewusst NICHT versprechen**: vollständige Behördenintegration,
  individuelle Rechtsberatung, parallele Abdeckung aller Leistungen,
  unbegrenzte KI-Nutzung.

### Geschäftsmodell & Kundengewinnung
- Freemium-Erklärung in zwei Boxen: Free 0 € / Premium 9,99 € ab Juli 2026.
- **Conversion-Tabelle** Q1–Q4 (0 / 0 / 5 / 8 %).
- **Kanal-Mix-Tabelle** ohne harte CAC-Versprechen: ARAG, SEO, TikTok/Meta
  als Test, Referrals.
- Hinweis: Akquisitionskosten von ~1,20 € / aktivem Nutzer nur tragfähig,
  wenn ARAG + organisch wesentlich liefern.

### Technologie, Datenschutz, Recht
- Architektur-Tabelle: Anwendung, Datenhaltung, KI, Kostenkontrolle, Anbietersteuerung.
- Datenschutz: Datenminimierung, Zweckbindung, Löschkonzept,
  EU-Kerninfra, ZDR.
- RDG-Abgrenzung: technisches Hilfsmittel, Nutzer trägt Verantwortung,
  Premium-Prozess bleibt standardisiert.

### Wirtschaftlichkeit
- **3-Jahres-GuV** (Position × Jahr 1/2/3) – die zentrale Tabelle.
  Positionen: Umsatz, Gründungskosten, Fixkosten, Marketing, KI, Variable
  Premium-Kosten, Recht/Compliance, Puffer, Jahresergebnis, Kumuliert.
- **Fixkostenübersicht** (kompakt): Hosting 4 €, Dev-Tools 90 €,
  QES 15 €, Steuerberater 150 € → 259 €/Monat.
- **Liquiditätsplanung**: Quartalsweise Anfangsbestand → Einnahmen
  → Ausgaben → Endbestand; Mindestkassenbestand markiert.
- **Lilaq-Chart** quartalsweise über 3 Jahre, Umsatz / Kosten / Gewinn.
- **Drei Szenarien** (konservativ / Basis / optimistisch): Konservativ
  *darf* negativ bleiben.
- Einordnung: 9,99 € allein trägt kein starkes Modell; Skalierung kommt
  über zusätzliche Antragsarten / höherwertige Pakete / Partner.

### Risiken & SWOT
- **SWOT-Matrix 2×2** (S/W/O/T) – kompakt, mit Stichpunkten.
- **Mitigations-Karten** für R1–R7, jeweils mit Risk-Card-Komponente
  (linker Farbbalken nach Risikofarbe).
- **Fallback-Strategie**: Wenn Conversion < 5 % → ARAG-fokussiert,
  Marketing reduzieren, Scope auf Elterngeld halten, ggf. White-Label.
- **Ressourcenrisiko (Examen)** explizit: Schwerpunkt + Examen +
  reduziertes Ausbauszenario benannt.

### Team & Roadmap
- Teamkarte (4 Rollen: Recht, Tech, Produkt, Partner).
- Teambild.
- Roadmap H1 26 → H2 26 → 2027 → 2028+ in vier Phasenboxen.
- **Keine Wochenangaben** mehr (Meeting: zu kleinteilig).

### Ausblick
- Tabelle „horizontal × vertikal" (zusätzliche Antragsarten /
  zusätzliche Service-Tiefe).
- B2B als Perspektive ab 2027.
- Kernaussage-Box am Ende.

---

## 6. Variablensystem (für `bambini-business-planV4.typ`)

Wesentliche neue / geänderte Variablen:

```typst
#let free-price                           = 0
#let premium-price                        = 9.99
#let premium-start                        = "Juli 2026"
#let competitor-price-low                 = 40
#let competitor-price-high                = 50

#let active-users-q1                      = 100
#let active-users-q2                      = 250
#let active-users-q3                      = 550
#let active-users-q4                      = 900   // Σ 1.800

#let conversion-q1                        = 0.00
#let conversion-q2                        = 0.00
#let conversion-q3                        = 0.05
#let conversion-q4                        = 0.08
#let conversion-y2                        = 0.10
#let conversion-y3                        = 0.12

#let active-users-y2                      = 5000
#let active-users-y3                      = 12000
#let paid-cases-per-premium-y1            = 1.0
#let paid-cases-per-premium-y2            = 1.4   // Kindergeld kommt dazu
#let paid-cases-per-premium-y3            = 2.0   // Elternzeit + weitere

#let ai-cost-per-request                  = 0.01
#let avg-ai-requests-free                 = 5
#let avg-ai-requests-premium              = 12

#let acquisition-cost-per-active-user-y1  = 1.20
#let acquisition-cost-per-active-user-y2  = 0.90
#let acquisition-cost-per-active-user-y3  = 0.65

#let variable-cost-per-paid-case          = 1.50

#let legal-compliance-y1                  = 2000
#let legal-compliance-y2                  = 1500
#let legal-compliance-y3                  = 1500

#let contingency-y1                       = 1200
#let contingency-y2                       = 1800
#let contingency-y3                       = 2400

#let annual-fixed-costs-y2                = 4500
#let annual-fixed-costs-y3                = 6500

#let recommended-funding                  = 22000
```

Aus diesen leiten sich automatisch alle GuV-, Liquiditäts- und Szenarien-Werte ab.

---

## 7. Risiken / Stolpersteine im Plan selbst

- **Glaubwürdigkeit ARAG-Nutzerstrom**: Solange technische Integration
  nicht live ist, dürfen wir keine garantierten ARAG-Umsätze rechnen. → Tun
  wir nicht. ARAG = normaler Akquisekanal.
- **9,99 € versus tatsächliche Wertschöpfung**: Preis ist niedrig
  angesetzt, damit niemand denkt, wir würden für 9,99 € individuelle
  Rechtsberatung versprechen. Sobald höherer Preis denkbar ist, bewusst
  als „später" behandeln.
- **Aktive Nutzerzahlen Y2/Y3** (5k / 12k) sind Annahmen, die aktiv
  verteidigt werden müssen → Roadmap & Kanal-Mix-Tabelle stützen das.
- **„BambiniAI ist einzigartig"** – belegen, ohne den
  Wettbewerber-Spruch ins Gegenteil zu drehen. Formulierung: „in dieser
  Form bisher kein Wettbewerberangebot bekannt".

---

## 8. Auslieferungslogik

- **`bambini-business-planV4.typ`** = der vollständige Business Case
  (15 Seiten, V2-Optik, V4-Inhalt). Geht intern an Sebastian / Nicole / ARAG.
- **Pitch-Kurzfassung** (separates späteres Dokument, 4–6 Seiten,
  emotionaler) nicht Teil dieses Schritts.
- **Internes Annahmenkompendium** (V3 kann in dieser Rolle weiterleben –
  hat detaillierte Herleitungen, geht *nicht* nach außen).

---

## 9. Definition of Done für V4

V4 ist „fertig", wenn:

1. Plan kompiliert ohne Fehler (`typst compile bambini-business-planV4.typ`).
2. Seitenzahl ≤ 17.
3. Kein Hinweis mehr auf Google Cloud / Anthropic.
4. Preis 49,99 € kommt nirgendwo mehr vor.
5. Alle Risiken R1–R7 haben sichtbare Mitigation.
6. Liquiditätstabelle vorhanden.
7. 3-Jahres-GuV vorhanden, Jahr 1 negativ ausgewiesen.
8. SWOT-Matrix vorhanden.
9. Roadmap zeigt Phasen, keine Wochen.
10. Kein Satz „profitabel ab Jahr 1".
