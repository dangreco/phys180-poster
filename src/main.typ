// Color scheme
#let col00 = rgb("#0d1b2a")
#let col01 = rgb("#1b263b")
#let col02 = rgb("#415a77")
#let col03 = rgb("#778da9")
#let col04 = rgb("#e0e1dd")

#set page(
  "a0",
  margin: 0pt,
  fill: col04,
)
#set text(font: "Inter")

// Header
#block(
  width: 100%,
  fill: col01,
  inset: (left: 2cm, right: 2cm, top: 4cm, bottom: 4cm),
  grid(
    columns: 100%,
    gutter: 2cm,
    align: center,
    text(fill: col04, size: 96pt, weight: 900)[#upper[Exoplanets]],
    text(
      fill: col04,
      size: 64pt,
      weight: 400,
    )[
      Discovering Worlds Beyond Our Solar System
    ],
    text(fill: col03, size: 48pt, weight: 400)[Daniel Greco]
  ),
)
