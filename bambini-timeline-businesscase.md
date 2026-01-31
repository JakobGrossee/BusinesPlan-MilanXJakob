# Bambini — Timeline & Business Case

**Stand:** 30.01.2026  
**Für:** ARAG / Potenzielle Investoren

---

## 1. Timeline bis Going Live

### Phase 1: ARAG MVP (KW 6–9 | Feb 2026)

| KW | Meilenstein | Deliverable |
|----|-------------|-------------|
| 6 | FAQ-System Live | `/faq/elterngeld` Route für ARAG-Kunden |
| 7 | AI-Chat Widget | Vorgefertigte Q&A + Freitext-Chat |
| 8 | Partner-Einstiegspunkt | `/partner/arag` mit Attribution |
| 9 | **ARAG Integration Ready** | Testkundin kann Flow durchlaufen |

**Hinweis Testkundin:** V1-Flow ist funktional. Empfehlung: manuelle Prüfung der ersten Anträge vor Einreichung, bis rechtliche Verifikation abgeschlossen.

### Phase 2: Rechtliche Verifikation (KW 10–13 | März 2026)

| KW | Meilenstein | Deliverable |
|----|-------------|-------------|
| 10–11 | BEEG-Abgleich | Prüfung validation.ts, calculator.ts gegen §§ 1–14 BEEG |
| 12 | Bugfixes | Korrekturen in Domain-Logik |
| 13 | **Verifizierte V1** | Rechtlich geprüfter Elterngeld-Flow |

### Phase 3: Elterngeld V2 Refactor (KW 14–21 | Apr–Mai 2026)

| KW | Meilenstein |
|----|-------------|
| 14–15 | Architektur-Setup |
| 16–17 | Kern-Berechnungslogik |
| 18–19 | UI-Integration |
| 20–21 | Testing & Rollout |
| **KW 22** | **V2 Live** |

### Zusammenfassung

| Meilenstein | Zieldatum |
|-------------|-----------|
| ARAG-Testkundin kann starten | Ende Februar 2026 |
| Rechtlich verifizierte V1 | Ende März 2026 |
| Elterngeld V2 Live | Ende Mai 2026 |
| Vollständiger ARAG Go-Live | Juni 2026 |

---

## 2. Business Case

### 2.1 Erlösmodell

| Produkt | Preis | Inhalt |
|---------|-------|--------|
| Bambini Familienpaket | **49,99 €** | Elterngeld + Kindergeld + Elternzeit |

### 2.2 Marktgröße

| Segment | Volumen |
|---------|---------|
| Gesamtmarkt (Geburten/Jahr DE) | 685.000 |
| Serviceable Market | ~308.000 Familien/Jahr |
| Zielgruppe 1: Akademiker & Berufstätige | ~171.000 |
| Zielgruppe 2: Menschen mit Sprachbarrieren | ~137.000 |

### 2.3 Umsatzprognose

| Jahr | Marktanteil | Kunden | Jahresumsatz |
|------|-------------|--------|--------------|
| 1 | 1,4% | 9.240 | 461.908 € |
| 2 | 2,2% | 15.400 | 769.846 € |
| 3 | 3,6% | 24.640 | 1.231.754 € |

### 2.4 Kostenstruktur

#### Laufende Kosten (monatlich)

| Position | Betrag |
|----------|--------|
| Hosting (Vercel/Netlify) | 4 € |
| Supabase | 0 € (Free Tier) |
| Entwicklung (Tools, APIs) | 90 € |
| QES (Qualifizierte Elektronische Signatur) | 15 € |
| **Gesamt monatlich** | **~109 €** |

#### Jährliche Kosten

| Position | Betrag |
|----------|--------|
| E-Mail-Hosting | 20 € |
| QES-Zertifikat (80 € / 3 Jahre) | ~27 € |
| **Gesamt jährlich** | **~1.355 €** |

#### Einmalige Kosten (GmbH-Gründung)

| Position | Betrag |
|----------|--------|
| Notar | ~750 € |
| Handelsregister | ~150 € |
| Markenanmeldung (DPMA) | ~300 € |
| Stammkapital (gebunden) | 12.500 € |
| **Gesamt einmalig** | **~13.700 €** |

### 2.5 Break-Even-Analyse

| Kennzahl | Wert |
|----------|------|
| Monatliche Fixkosten | 109 € |
| Preis pro Kunde | 49,99 € |
| **Break-Even (Kunden/Monat)** | **3** |

Bei aktueller Kostenstruktur ist Bambini ab dem **3. zahlenden Kunden pro Monat** operativ profitabel.

### 2.6 Finanzierungsbedarf

| Verwendung | Betrag |
|------------|--------|
| GmbH-Gründung (inkl. Stammkapital) | 13.700 € |
| Runway 6 Monate (Betriebskosten) | 654 € |
| Marketing-Budget (initial) | 5.000 € |
| Puffer / Unvorhergesehenes | 2.646 € |
| **Gesamt Finanzierungsbedarf** | **~22.000 €** |

**Hinweis:** Dieser Betrag deckt Gründung + 6 Monate Betrieb + initiales Marketing. Bei Erfolg ist das Modell ab Monat 1 cash-flow-positiv (>2 Kunden/Monat).

---

## 3. Offene Punkte

- [x] Customer Acquisition Cost (CAC) → siehe Abschnitt 2.7
- [ ] ARAG-Umsatzbeteiligung → falls vereinbart
- [ ] Skalierungskosten bei >1.000 Kunden/Monat (Supabase Pro, höhere API-Kosten)

---

## 2.7 Customer Acquisition Cost (CAC)

### Ziel-CAC

| Kennzahl | Wert |
|----------|------|
| Produktpreis | 49,99 € |
| Ziel-CAC (max.) | < 30 € |
| Optimaler CAC | 15–20 € |
| CAC:LTV-Verhältnis (Ziel) | 1:2 bis 1:3 |

### CAC nach Kanal

| Kanal | CAC | Zeitrahmen | Empfehlung |
|-------|-----|------------|------------|
| **ARAG-Partnerschaft** | 0 € | Sofort (Feb 2026) | ✓ Strategisch am wertvollsten |
| **TikTok Ads** | 15–25 € | Sofort | ✓ Niedrigster Paid CAC |
| **Meta/Instagram Ads** | 20–35 € | Sofort | ✓ Ergänzungskanal |
| **SEO/Content** | ~0 € (nach Amortisation) | 6–12 Monate | ✓ Langfristig aufbauen |
| **Referral-Programm** | 10–20 € | Nach 50–100 Kunden | ✓ Nach erster Kundenbasis |
| **Google Ads** | 100–150 € | Später | ✗ Zu teuer für MVP |

### TikTok vs. Meta Vergleich

| Faktor | TikTok | Meta |
|--------|--------|------|
| CPM | 3–12 € | 8–14 € |
| Erwarteter CAC | 15–25 € | 25–35 € |
| Organic Reach | Hoch (auch ohne Follower) | Gering |
| Creator-Kosten (Micro) | 100–500 € | 200–1.000 € |
| Zielgruppe 25–44 J. | 42% der Nutzer | Übersättigt |

**Empfehlung:** TikTok als Primärkanal, Meta als Backup.

---

## 2.8 Go-to-Market Budget

### Phase 1: Monate 1–3

| Position | Betrag |
|----------|--------|
| TikTok Ads | 700–1.000 € |
| Meta Ads (Backup) | 500–800 € |
| Content Creation | 200–400 € |
| SEO Setup | 500–1.000 € |
| **Gesamt Phase 1** | **~2.000–3.200 €** |

---

## 2.9 Realistische 12-Monats-Projektion

### Kanal-Mix Annahmen

| Kanal | Anteil Kunden | CAC |
|-------|---------------|-----|
| ARAG-Partnerschaft | 25% | 0 € |
| TikTok Ads | 30% | 20 € |
| Meta Ads | 20% | 28 € |
| SEO/Organic | 10% | 0 € |
| Referrals | 15% | 12 € |
| **Blended CAC** | 100% | **~13 €** |

### Projektion (realistisch)

| Zeitraum | Kunden | Blended CAC | Marketing-Kosten | Umsatz | Ergebnis |
|----------|--------|-------------|------------------|--------|----------|
| Monate 1–3 | 120 | 18 € | 2.160 € | 6.000 € | +3.840 € |
| Monate 4–6 | 300 | 15 € | 4.500 € | 15.000 € | +10.500 € |
| Monate 7–9 | 500 | 13 € | 6.500 € | 25.000 € | +18.500 € |
| Monate 10–12 | 800 | 11 € | 8.800 € | 40.000 € | +31.200 € |
| **Jahr 1 Gesamt** | **1.720** | **13 €** | **22.000 €** | **86.000 €** | **+64.000 €** |

### Vergleich: Konservativ vs. Realistisch

| Szenario | Kunden Y1 | Ø CAC | Umsatz | Gewinn |
|----------|-----------|-------|--------|--------|
| Konservativ (nur Paid) | 1.280 | 20 € | 64.000 € | +30.800 € |
| **Realistisch (mit ARAG + Referrals)** | **1.720** | **13 €** | **86.000 €** | **+64.000 €** |
| Optimistisch (starke Virality) | 2.500 | 10 € | 125.000 € | +100.000 € |

### Warum die realistische Projektion erreichbar ist

1. **ARAG liefert kostenlose Kunden** — Partnerschaft bereits signed
2. **TikTok Educational Content** hat 9,5% Engagement (vs. 2,5% Durchschnitt)
3. **Eltern-Netzwerke** sind natürliche Multiplikatoren (Krabbelgruppen, Hebammen)
4. **SEO-Keywords** wie "Elterngeld beantragen" haben klaren Suchintent
5. **Betriebskosten extrem niedrig** (109 €/Monat) → schneller Break-Even

---

## 4. Nächste Schritte

1. **Diese Woche:** Timeline + Business Case an Nicole senden
2. **KW 6:** FAQ-Routing implementieren
3. **Parallel:** Testkundin-Flow vorbereiten (V1 mit manueller Verifikation)
