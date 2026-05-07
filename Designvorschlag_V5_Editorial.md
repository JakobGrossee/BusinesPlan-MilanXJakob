# Designvorschlag V5 – Editorial / MDPI-Stil

**Stand:** 2026-05-07
**Bezug:** `bambini-business-planV4.typ`
**Ziel:** Rein graphische Überarbeitung – **Inhalt, Variablen und Strukturlogik bleiben unverändert**.
Der Plan soll von „buntes Pitch-Deck mit Farbverläufen" zu „Investoren-/Bank-tauglicher Editorial-Look" verschoben werden.

> Referenz für Look & Feel: [`@preview/splendid-mdpi:0.1.0`](https://typst.app/universe/package/splendid-mdpi/) – Editorial / akademisch / nüchtern, klare Typo-Hierarchie, minimaler Farbeinsatz, Fokus auf Inhalt statt Dekoration.

---

## 1. Diagnose: Was im aktuellen V4 unprofessionell wirkt

| # | Element in V4 | Problem | Fundstelle |
|---|---------------|---------|-----------|
| 1 | `gradient.linear(primary, accent)` als Trennlinien, Cover-Balken, Heading-Marker | Verläufe wirken wie SaaS-Marketing, nicht wie Geschäftsdokument | Zeilen 295, 300, 309, 320, 326, 466, 488 |
| 2 | Fünf Akzentfarben gleichzeitig (Lila + Orange + Grün + Rot + Blau + Info-Blau) | Visuelles Rauschen, keine klare Hierarchie | `primary`, `accent`, `success`, `danger`, `info` (Z. 256–264) |
| 3 | `box(fill: color.lighten(93%))`-Tönungen überall | Wirkt wie ein Kinder-Ratgeber, jede Box kämpft um Aufmerksamkeit | u. a. `highlight-box`, Marktdaten-Boxen, Szenarien |
| 4 | Pill-Badges mit `radius: 12pt` + farbiger Vollfüllung + `tracking: 0.3pt` | Klassischer „Startup-Tag"-Look, nicht für Banken/Investoren | `#let badge`, Z. 393 |
| 5 | Step-Number-Kreise mit Verlaufsfüllung + Roundavatar | Wirkt verspielt | `#let step-number`, Z. 401 |
| 6 | Stat-Card mit gradient-Top-Bar + 22pt farbiger Riesenzahl | „KPI-Dashboard"-Optik | `#let stat-card`, Z. 367 |
| 7 | Tabellenheader mit voller Primary-Füllung + weißer Schrift | Wirkt wie Software-UI, nicht wie Geschäftstabelle | mehrere Tabellen, z. B. Z. 760, 911 |
| 8 | Cover: zwei Verlaufsbalken (oben/unten) + Verlaufslinie + Verlaufs-Badges | Zu viel Dekoration, lenkt vom Logo/Titel ab | Z. 466, 488 |
| 9 | Footer: Seitenzahl in farbiger Pille mit `radius: 10pt` | Wirkt verspielt | Z. 320–325 |
| 10 | 36pt-Riesenzahlen in den Marktboxen | Marketing-Aesthetik, nicht Business-Plan | Z. 670, 681 |

---

## 2. Designprinzipien V5

1. **Eine** dezente Akzentfarbe – idealerweise gedämpftes Tiefblau oder Bordeaux, kein Lila/Orange-Mix.
2. **Keine Farbverläufe.** Ausnahmslos. Nur Volltöne und Linien.
3. **Linien statt Flächen.** Trennung erfolgt über `0.5pt`-Regeln, nicht über farbige Hintergründe.
4. **Typo macht die Hierarchie**, nicht die Farbe. Stat-Karten haben dunkles Schwarz-Grau für Zahlen, nicht primary.
5. **Kontextfarben sehr sparsam:** Rot/Grün ausschließlich für Vorzeichen in Ergebniszeilen (±). Nicht für Box-Headlines.
6. **Tabellen klassisch:** Header ohne Vollfüllung, dafür `1pt` oben + unten + Bold. Zebra optional in 2 % Grau.
7. **Whitespace > Boxen.** Wo möglich: Box weglassen, einfach Absatz mit Marginalie.
8. **Serif für Body-Text** (à la MDPI / Working Paper) – signalisiert Reife. Sans nur für Tabellen, Captions, Header.

---

## 3. Neue Farb- und Typo-Palette

```typst
// ═══════════════════════════════════════════════════════════════════════════
// EDITORIAL PALETTE V5  (ersetzt komplett Block ab V4-Z. 252)
// ═══════════════════════════════════════════════════════════════════════════

// Ein Akzent. Nicht fünf.
#let accent       = rgb("#1F3A5F")   // tiefes Navy – seriös, Bank/Kanzlei-Ästhetik
#let accent-soft  = rgb("#E8EDF3")   // Akzent als 6-%-Tönung für sehr seltene Box-Hintergründe

// Neutrale Skala (Stone/Slate)
#let ink          = rgb("#1A1A1A")   // Body-Text
#let ink-soft     = rgb("#3D3D3D")   // Subheads
#let muted        = rgb("#6B6B6B")   // Captions, Labels
#let muted-soft   = rgb("#9A9A9A")   // sehr zurückhaltend
#let rule         = rgb("#D4D4D4")   // Linien
#let rule-soft    = rgb("#EAEAEA")   // Zebra / sehr feine Trennung
#let paper        = rgb("#FFFFFF")
#let paper-tint   = rgb("#FAFAFA")   // Marginalspalte / Code-Box / Tabellenzebra

// Semantik – ausschließlich für Vorzeichen, nicht für Headlines
#let pos          = rgb("#2F6F4E")   // gedämpftes Tannengrün
#let neg          = rgb("#8B2E2E")   // gedämpftes Bordeaux
```

**Typografie:**

```typst
#set text(
  font: ("Source Serif 4", "Source Serif Pro", "EB Garamond", "Charter", "Georgia"),
  size: 10pt,
  fill: ink,
  lang: "de",
  hyphenate: true,
)

// Sans nur für Tabellen, Captions, Headings (optional)
#let sans = ("Inter", "Source Sans 3", "Helvetica Neue", "Arial")

#set par(
  justify: true,
  leading: 0.62em,
  first-line-indent: 0pt,   // kein Erstzeileneinzug, dafür Absatzabstand
  spacing: 0.85em,
)
```

> Wenn deine Maschine kein „Source Serif" hat, fallen die Fallbacks auf Charter/Georgia – beides liefert den seriösen Look. Sans-Stack: Inter ist auf Linux meist installiert; sonst Helvetica/Arial.

---

## 4. Komponenten – Vorher / Nachher

### 4.1 Headings (V4 Z. 286–301)

**Vorher** (Verlaufsbalken + Primary-Dark + Tracking):
```typst
#show heading.where(level: 1): it => {
  v(1em)
  block(width: 100%)[
    #box(width: 5pt, height: 28pt,
      fill: gradient.linear(primary, accent, dir: ttb), radius: 2pt)
    #h(12pt)
    #text(size: 20pt, weight: "bold", fill: primary-dark, tracking: -0.3pt)[#it.body]
  ]
  v(3pt)
  line(length: 100%, stroke: 0.75pt + surface)
  v(0.6em)
}
```

**Nachher** (Editorial: nur Nummerierung in Akzent, Titel in Ink, dünne Linie):
```typst
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
  text(font: sans, size: 9.5pt, weight: "semibold", fill: ink-soft,
       style: "italic")[#it.body]
  v(0.15em)
}
```

---

### 4.2 `highlight-box` (V4 Z. 333–352)

**Vorher** (lighten-93 % Fläche + Verlaufs-Linke-Kante):
```typst
#let highlight-box(title: none, content, color: primary) = {
  block(width: 100%, fill: color.lighten(93%),
    stroke: (left: (paint: gradient.linear(color, color.lighten(40%), dir: ttb),
                    thickness: 4pt)),
    inset: 18pt, radius: (right: 6pt))[ ... ]
}
```

**Nachher** (klassische „Pull-Quote"-Optik):
```typst
// Standard-Hervorhebung: dünner Rahmen, kein Fill, Titel als Small-Caps-Label
#let callout(title: none, body) = {
  block(
    width: 100%,
    inset: (x: 14pt, y: 12pt),
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

// Variante mit sehr dezenter Tönung (sparsam einsetzen!)
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
```

> Faustregel: 90 % aller `highlight-box`-Aufrufe → `callout`. Nur 1–2 wirklich tragende Botschaften pro Kapitel → `callout-soft`. Die jetzigen sechs farbigen Boxen pro Seite werden auf maximal eine reduziert.

---

### 4.3 `stat-card` (V4 Z. 367–384)

**Vorher** (Verlaufs-Topbar + 22pt Primary-Zahl):
```typst
#let stat-card(number, label, color: primary) = {
  box(width: 100%, fill: white, stroke: 1pt + rgb("#E2E8F0"),
      radius: 8pt, clip: true)[
    #block(width: 100%, height: 3pt,
           fill: gradient.linear(color, color.lighten(30%)))
    #align(center)[
      #v(12pt)
      #text(size: 22pt, weight: "bold", fill: color)[#number]
      ...
    ]
  ]
}
```

**Nachher** (Editorial KPI: Label oben klein, Zahl groß in Ink, dünne Bottom-Rule):
```typst
#let kpi(value, label) = {
  block(
    width: 100%,
    inset: (top: 10pt, bottom: 10pt, x: 0pt),
    stroke: (top: 0.6pt + ink, bottom: 0.4pt + rule),
  )[
    #text(font: sans, size: 7.5pt, weight: "regular",
          fill: muted, tracking: 1.3pt)[#upper(label)]
    #v(3pt)
    #text(font: sans, size: 18pt, weight: "semibold", fill: ink)[#value]
  ]
}
```

Anwendung im Executive Summary bleibt strukturell identisch – nur das Ergebnis sieht aus wie aus einem Geschäftsbericht statt aus einem Dashboard.

---

### 4.4 `badge` (V4 Z. 393–399)

**Vorher** (gefüllte Pill, 12pt Radius, weiße Schrift):
```typst
#let badge(content, color: primary) = {
  box(fill: color, inset: (x: 10pt, y: 5pt), radius: 12pt)[
    #text(fill: white, weight: "bold", size: 8.5pt, tracking: 0.3pt)[#content]]
}
```

**Nachher** – zwei Optionen:

```typst
// Option A: Dezenter Tag (Outline-Stil, kein Fill, kein extremer Radius)
#let tag(content, color: accent) = {
  box(stroke: 0.6pt + color, inset: (x: 6pt, y: 2pt), radius: 2pt)[
    #text(font: sans, fill: color, weight: "regular",
          size: 7.5pt, tracking: 1pt)[#upper(content)]]
}

// Option B: Marginalie statt Badge – noch zurückhaltender
#let label(content) = {
  text(font: sans, size: 7.5pt, fill: muted,
       weight: "regular", tracking: 1.4pt)[#upper(content)]
}
```

Damit verschwinden die jetzt prominenten „MAI 2026" / „ITERATION 4" / „VORGRÜNDUNGSGESELLSCHAFT" Pills auf dem Cover und werden zu einer schlichten Zeile.

---

### 4.5 `step-number` (V4 Z. 401–410)

**Vorher** (Kreis mit Verlauf):
```typst
#let step-number(n, color: primary) = {
  box(width: 32pt, height: 32pt,
      fill: gradient.linear(color, color.lighten(25%)), radius: 50%)[ ... ]
}
```

**Nachher** (typografisch: Schritt-Zahl als überdimensionierte Outline-Ziffer):
```typst
#let step(n) = {
  text(font: sans, size: 22pt, weight: "thin", fill: accent,
       tracking: 0pt)[#str(n)]
}
// Begleitet von einer 1pt-Linie unter dem Schritt-Block, kein Kreis.
```

Oder, falls ein gemeinsames visuelles Element gewünscht ist:
```typst
#let step(n) = {
  box(width: 24pt, height: 24pt,
      stroke: 0.8pt + ink, radius: 50%, inset: 0pt)[
    #align(center + horizon)[
      #text(font: sans, size: 11pt, weight: "regular", fill: ink)[#str(n)]
    ]
  ]
}
// Dünner schwarzer Outline-Kreis, kein Fill, kein Verlauf.
```

---

### 4.6 Tabellen

**Vorher** (V4 Z. 753–769):
```typst
#table(
  columns: (1.6fr, 1.4fr, 1.4fr, 1.4fr),
  fill: (x, y) => if y == 0 { primary.lighten(88%) }
                  else if calc.odd(y) { light-bg } else { white },
  stroke: 0.5pt + surface,
  inset: 10pt,
  table.cell(fill: primary)[#text(fill: white, weight: "bold")[Kriterium]],
  ...
)
```

**Nachher** – akademischer Booktabs-Stil:
```typst
#set table(
  stroke: none,
  inset: (x: 8pt, y: 6pt),
)

#show table.cell.where(y: 0): it => {
  text(font: sans, size: 9pt, weight: "semibold", fill: ink)[#it]
}

#table(
  columns: (1.6fr, 1.4fr, 1.4fr, 1.4fr),
  align: (left, left, left, left),

  table.hline(stroke: 1pt + ink),               // Top rule
  [Kriterium], [Bambini], [Private Anbieter], [Staatliche Angebote],
  table.hline(stroke: 0.5pt + ink),             // Mid rule
  [Elterngeld-Self-Service], [kostenlos], [40–50 €], [kostenlos, komplex],
  [Antragserstellung], [✓], [✓], [teilweise digital],
  [Einreichung durch Anbieter], [ab Juli 2026], [meist nicht], [—],
  [KI-Unterstützung], [BambiniAI], [—], [—],
  [Antragsverknüpfung], [Kindergeld, Elternzeit], [einzeln], [einzeln],
  table.hline(stroke: 1pt + ink),               // Bottom rule
)
```

Drei waagerechte Linien (Top, Mid, Bottom), keine Vollflächen, keine Zellfarben, keine farbigen Header-Zeilen. Das ist der Standard für seriöse Tabellen in Geschäftsberichten und Working Papers.

Für **Zebrastreifen** (z. B. lange GuV-Tabelle) – in 2 % Grau, nicht in Primary-93 %:
```typst
#table(
  ...
  fill: (x, y) => if calc.even(y) and y > 0 { paper-tint } else { paper },
  ...
)
```

---

### 4.7 Cover-Seite

**Vorher** (V4 Z. 460–498): zwei Verlaufsbalken oben/unten, Verlaufs-Trennlinie, Pill-Badges.

**Nachher** – MDPI/Working-Paper-Cover:

```typst
#page(header: none, footer: none, margin: (x: 3cm, y: 3.5cm))[

  // Kopfzeile: dezente Marginalie
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

  #v(1pt)
  #line(length: 100%, stroke: 0.6pt + ink)

  #v(4cm)

  // Logo zentral, kleiner als bisher
  #align(center)[
    #image("bambini-logo.png", width: 130pt)
  ]

  #v(2.5cm)

  // Titel und Subtitel rein typografisch
  #align(left)[
    #text(font: sans, size: 9pt, fill: muted, tracking: 2pt)[
      #upper("Geschäftsplan 2026 – 2028")
    ]
    #v(8pt)
    #text(size: 32pt, weight: "regular", fill: ink, tracking: -0.5pt)[
      Bambini Business Plan
    ]
    #v(4pt)
    #text(size: 14pt, fill: ink-soft, style: "italic")[
      Kostenloser Elterngeld-Self-Service mit KI-Unterstützung
    ]
    #v(8pt)
    #text(size: 11pt, fill: muted)[
      GmbH-Gründung und Wachstumsfinanzierung
    ]
  ]

  #v(1fr)

  // Autoren-/Team-Block im MDPI-Stil
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 24pt,
    row-gutter: 6pt,

    text(font: sans, size: 8.5pt, weight: "semibold", fill: ink)[Autoren],
    text(font: sans, size: 8.5pt, weight: "semibold", fill: ink)[Kontakt],

    text(size: 9pt)[
      Milan Kohlhaase, Jakob Große-Eggebrecht, \
      Mika Tomii, Michaela Idawain, Merit Lachmann \
      #text(fill: muted, size: 8pt)[Bucerius Law School, Hamburg]
    ],
    text(size: 9pt)[
      info\@bambini-claims.de \
      bambini-claims.de \
      #text(fill: muted, size: 8pt)[Stand: Mai 2026]
    ],
  )

  #v(10pt)
  #line(length: 100%, stroke: 0.4pt + rule)
  #v(6pt)

  // Optional: Mini-Abstract im MDPI-Stil
  #text(font: sans, size: 8pt, weight: "semibold",
        fill: muted, tracking: 1.2pt)[#upper("Zusammenfassung")]
  #v(4pt)
  #text(size: 9pt, fill: ink-soft)[
    Bambini entwickelt einen kostenlosen, KI-gestützten Self-Service für die
    Elterngeld-Beantragung. Marktstart April 2026, kostenpflichtige
    Zusatzleistung ab Juli 2026 (9,99 €/Fall). Empfohlener
    Finanzierungsrahmen: 22.000 € für GmbH-Gründung und Validierungsphase.
  ]
]
```

Das ist visuell *die* zentrale Änderung: Kein farbiges Marketing-Cover mehr, sondern eine zurückgenommene Titelseite, die durch Typografie wirkt – exakt wie das splendid-mdpi-Beispiel.

---

### 4.8 Header & Footer (V4 Z. 277–328)

**Vorher**: Verlaufslinie als Kopflinie, Seitenzahl in farbiger Pille mit Logo + URL.

**Nachher**:
```typst
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
```

Seitenzahl mittig oben (klassisch), keine Pille, kein Logo unten, keine Verlaufslinie.

---

### 4.9 Diagramme (kumulativer 3-Jahres-Verlauf, V4 Z. 1158–1167)

Beibehalten, aber Farbgebung anpassen:

```typst
lq.plot(quarters, revenue-values,
  stroke: 1.2pt + ink,                       // Umsatz: schwarz
  mark: none, label: [Umsatz])
lq.plot(quarters, costs-values,
  stroke: (paint: ink, thickness: 1.2pt, dash: "dashed"),  // Kosten: gestrichelt
  mark: none, label: [Kosten])
lq.plot(quarters, profit-values,
  stroke: 1.5pt + accent,                    // Ergebnis: einziger Akzent (Navy)
  mark: none, label: [Ergebnis])
```

Drei Linien, eine Akzentfarbe, keine Marker. Wirkt sofort wie aus einem _Annual Report_.

---

### 4.10 Roadmap-Phasen (V4 Z. 1543–1593)

**Vorher**: vier Phasen, vier verschiedene Farben (primary, info, success, accent), jede mit eigener Lighten-95 %-Box.

**Nachher** – Timeline als typografische Liste:
```typst
#let phase(periode, titel, content, kpi) = {
  grid(
    columns: (auto, 1fr),
    column-gutter: 18pt,
    row-gutter: 0pt,

    // Linke Spalte: Periode in Marginalie
    block(width: 70pt)[
      #text(font: sans, size: 8pt, weight: "semibold",
            fill: accent, tracking: 1.2pt)[#upper(periode)]
    ],

    // Rechte Spalte: Titel + Inhalt
    block[
      #text(font: sans, size: 10.5pt, weight: "semibold", fill: ink)[#titel]
      #v(4pt)
      #text(size: 9.5pt)[#content]
      #v(3pt)
      #text(size: 8pt, fill: muted, style: "italic")[#kpi]
    ],
  )
  v(10pt)
  line(length: 100%, stroke: 0.3pt + rule-soft)
  v(10pt)
}

#phase(
  "H1 2026",
  "GmbH-Gründung & Marktstart (Free)",
  "Elterngeld-MVP live, erste aktive Nutzer.",
  "Ziel: ~350 aktive Nutzer · Umsatz: 0 €",
)
```

Vier Phasen, eine Farbe (Akzent für Periodenlabel), Trennlinien statt farbiger Boxen.

---

## 5. Quick Wins – Reihenfolge der Umsetzung

Wenn du **nicht** den ganzen V5 auf einmal erstellen willst, sondern V4 schrittweise editorial zähmen möchtest, ist das die Reihenfolge mit dem höchsten Wirkungsgrad pro Aufwand:

| Schritt | Aufwand | Visueller Effekt |
|---------|---------|------------------|
| **1.** Farbpalette austauschen (Block in §3) | 10 Min | ★★★★★ |
| **2.** Alle `gradient.linear(...)` Aufrufe durch Volltöne ersetzen | 15 Min | ★★★★★ |
| **3.** `highlight-box` durch `callout` ersetzen (siehe 4.2) | 10 Min | ★★★★ |
| **4.** Tabellenheader entfärben (siehe 4.6) | 20 Min | ★★★★ |
| **5.** Cover-Seite austauschen (siehe 4.7) | 15 Min | ★★★★★ |
| **6.** Heading-Show-Rule (siehe 4.1) | 10 Min | ★★★ |
| **7.** Header / Footer entfärben (siehe 4.8) | 5 Min | ★★ |
| **8.** Stat-Cards typo-orientiert (siehe 4.3) | 15 Min | ★★★ |
| **9.** Roadmap als Timeline-Liste (siehe 4.10) | 20 Min | ★★★ |
| **10.** Schriftarten umstellen auf Serif/Sans (siehe §3) | 5 Min | ★★★★ |

Schon nach Schritten 1 + 2 + 5 wirkt das Dokument auf den ersten Blick „erwachsener".

---

## 6. Was bleibt unverändert

- Alle Variablen, Berechnungen, Formatierungsfunktionen (`euro`, `euro-compact`, `pct`, `num`).
- Die komplette Inhaltsstruktur (8 Kapitel, dieselben Tabellen, dieselbe Argumentation).
- Die Charts (lilaq) – nur Farbgebung wird angepasst.
- Die Bilder (Logo, Teambild).
- Sprache (deutsch) und Tonalität.

---

## 7. Risiken & Empfehlung

- **Risiko**: Ein zu nüchterner Look kann auch unterkühlt wirken. Bambini ist ein Familienprodukt; eine *klitzekleine* Wärme darf bleiben.
- **Empfehlung**: Den Akzent statt Navy auf ein **gedämpftes Bordeaux/Aubergine** setzen (`#5B3A4E` oder `#6B3A52`) – das hält eine subtile Verbindung zum bisherigen Lila, ohne Pitch-Deck zu sein. Alternative: `#1F3A5F` Navy für maximalen „Bank-tauglich"-Eindruck.
- Beide Varianten lassen sich durch einzeiliges Ändern von `accent` testen.

---

## 8. Nächster Schritt

Wenn du grünes Licht gibst, erstelle ich `bambini-business-planV5.typ` als vollständigen Editorial-Draft (Cover + alle 8 Kapitel mit den oben skizzierten Komponenten). Alternativ kann ich auch nur die Komponenten-Bibliothek (`v5-components.typ`) bauen, die du dann selbst per `#import` in V4 austauschst.

**Empfehlung**: Erst die ersten zwei Seiten (Cover + Executive Summary) als Probe rendern, vergleichen, dann auf die restlichen Kapitel ausrollen.
