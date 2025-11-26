// Color scheme
#let col_r1 = rgb("#780000")
#let col_r2 = rgb("#c1121f")
#let col_b1 = rgb("#003049")
#let col_b2 = rgb("#669bbc")
#let col_bg = rgb("#fff")
#let col_mg = rgb("#fef8ec")
#let col_fg = rgb("#211702")

#set page(
  "a0",
  margin: (left: 1cm, right: 1cm, top: 0cm, bottom: 1cm),
  fill: col_bg,
  columns: 2,
)

#set text(font: "Inter", fill: col_fg, size: 32pt)

#show heading.where(level: 1): set text(size: 56pt, fill: col_b1)
#show heading.where(level: 1): it => {
  it
  v(-0.8em)
  line(length: 100%, stroke: 6pt + col_b1)
  v(0.4em)
}
#show figure: it => {
  it
  v(0.8em)
}

#show heading.where(level: 2): set text(size: 36pt, fill: col_fg)
#show heading.where(level: 2): it => {
  it
  v(-0.8em)
  line(length: 100%, stroke: 3pt + col_fg)
  v(0.2em)
}
#show figure: it => {
  it
  v(0.2cm)
}

#show figure.caption: it => context [
  #v(1cm)
  *#it.supplement~#it.counter.display()#it.separator*#it.body
]

// Header

#place(
  top + center,
  scope: "parent",
  float: true,
  block(
    width: 100% + 2cm,
    inset: (left: 0cm, right: 0cm, top: 2cm, bottom: 2cm),
    fill: col_r1,
    grid(
      columns: 100%,
      gutter: 2cm,
      align: center,
      text(
        fill: col_bg,
        size: 86pt,
        weight: 900,
      )[#upper[From Particle Accelerators to Patient Care]],
      text(
        fill: col_bg,
        size: 64pt,
        weight: 500,
      )[_Applications of Particle Physics in Medicine_],
      text(fill: col_bg, size: 40pt, weight: 500)[Daniel Greco]
    ),
  ),
)

#block(
  width: 100%,
  stroke: 6pt + col_r1,
  inset: 1.4cm,
  radius: 1cm,
  fill: col_mg,
  align(left)[
    #text(size: 40pt)[*Q: What is Particle Physics?*]

    *A:* Particle physics studies the *fundamental constituents of matter* and the *forces* governing their interactions.
    While often associated with abstract research at facilities like CERN, the field has produced tools with *direct medical applications*.
  ],
)

= Diagnostic Imaging

#figure(
  image("fig/pet.png", width: 75%),
  caption: [
    PET scanner detecting gamma rays from a tumour using a surrounding ring of sensors.
  ],
)

*Positron emission tomography (PET)* uses antimatter annihilation to create functional images of the body @kapoor2025pet.

A patient is injected with a radiotracer -- commonly fluorine-18 bound to a glucose analog -- which accumulates in metabolically active tissues such as tumors or specific brain regions.
As the isotope decays, it emits a positron that quickly meets an electron; the pair annihilates and produces two gamma rays traveling in opposite directions.
A ring of detectors surrounding the patient registers these coincident photons and reconstructs a 3D map of tracer distribution @Shaikh22.

== Applications

- *Oncology*: detecting and staging cancers @Shaikh22
- *Neurology*: mapping brain metabolism in disorders like Alzheimer's @kapoor2025pet
- *Cardiology*: evaluating myocardial viability @kapoor2025pet


= Medical Isotope Production

#figure(
  grid(
    columns: (1fr, 1fr),
    rows: 11cm,
    gutter: 3pt,
    image("fig/cyclotron.png", height: 100%),
    image("fig/reactor.png", height: 100%),
  ),
  caption: [
    A cyclotron (left) and a nuclear reactor (right)
  ],
)

Particle physics enables medical isotope production using *cyclotrons* and *reactors* @isotopes_production_methods:

- *Cyclotrons*: accelerate protons to make short-lived PET isotopes like fluorine-18 for imaging metabolic activity @britannica2024cyclotron @radiologycafe_radioisotope_production
- *Reactors*: use neutrons to produce technetium-99m, widely used in diagnostic scans @radiologycafe_radioisotope_production

== Applications

- *Imaging*: revealing tumors, heart function, and brain activity
- *Therapy*: targeting tumors with minimal healthy tissue damage


= Radiation Therapy

#figure(
  image("fig/bragg-peak.jpg", width: 90%),
  caption: [
    Proton therapy delivers a sharp Bragg peak at the tumor's depth, while X-rays deposit dose continuously through healthy tissue.
  ],
)

Conventional radiation therapy uses X-rays that deposit energy all along their path, exposing healthy tissue before and after the tumor.
*Proton and heavy-ion therapy* avoid this problem @byun2021particle.

Charged particles release most of their energy at a precise depth -- the *Bragg peak*, a sharp spike in energy deposition that occurs just before the particles stop @samsung2025principle.
By tuning beam energy, clinicians can place this peak directly inside the tumor, delivering a high dose while greatly reducing damage to surrounding tissue @byun2021particle.

== Applications

- *Pediatric cancers*: minimizing long-term side effects @byun2021particle
- *Brain and spinal tumors*: protecting critical nervous tissue @byun2021particle
- *Eye tumors*: preserving surrounding vision structures @byun2021particle
- *Head and neck cancers*: reducing damage to nearby organs @byun2021particle


#block(
  width: 100%,
  stroke: 6pt + col_r1,
  inset: 1.4cm,
  radius: 1cm,
  fill: col_mg,
  align(left)[
    #text(size: 40pt)[*Future Directions*]

    #figure(
      image("fig/linac.jpg", width: 70%),
      caption: [
        One of four modules of the mini-Linac, a miniature linear accelerator designed for use in hospitals.
      ],
    )

    Emerging techniques continue to expand particle physics applications in medicine:

    - *Accelerator miniaturization*: making proton therapy accessible to more hospitals worldwide @cern2015miniatureAccelerator
    - *FLASH radiotherapy*: delivering radiation in milliseconds rather than minutes, reducing damage to healthy tissue
    - *Boron neutron capture therapy*: targets cancer cells with neutrons after they selectively absorb boron compounds @Karihtala2024
  ],
)


#[
  #set text(size: 26pt)
  *References*
  #v(-0.8cm)
  #line(length: 100%, stroke: 2pt + col_fg)
  #v(-0.4cm)
  #set text(size: 14pt)
  #columns(2, bibliography(
    "refs.bib",
    title: none,
    full: true,
    style: "institute-of-physics-numeric",
  ))
]
