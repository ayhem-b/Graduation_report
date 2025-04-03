// DOCUMENT CLASS
#import "@preview/colorful-boxes:1.2.0": outlinebox
#import "common/metadata.typ": *

// --- Titles of Chapters ---
#let chap(myRef, notAck: true, numbering: none) = {
  v(8cm)
  place(
    center,
    rect(
      width: 15cm,
      height: 3cm,
      radius: (rest: 2pt),
    )[
      #v(1cm)
      #text(2em, smallcaps(heading(outlined: notAck, numbering: numbering, myRef)))
    ],
  )
}

#let report(
  title: "",
  titre: "",
  diploma: "",
  program: "",
  supervisor: "",
  author: "",
  date: datetime.today().display(),
  bibFile: none,
  isAbstract: false,
  body,
) = {
  // --- Set the document's geometric properties. ---
  set page(
    margin: (left: 20mm, right: 20mm, top: 20mm, bottom: 20mm),
    number-align: center,
  )

  // --- Save heading and body font families in variables ---
  let body-font = "Garamond"
  let sans-font = "Garamond"

  // --- Body font family ---
  set text(
    font: body-font,
    size: 12pt,
    lang: "en",
  )

  show math.equation: set text(weight: 400)

  // --- Headings ---
  show heading: set block(below: 0.85em, above: 1.75em)
  show heading: set text(font: body-font)

  /*
  set page(header: locate(loc => {
    let elems = query(
      selector(heading).before(loc),
      loc,
    )

    if elems == () {
      align(right, capstone)
    } else {
      let body = elems.last().body
      capstone + h(1fr) + emph(body)
    }
  }))
  */

  // --- Paragraphs ---
  set par(spacing: 1.5em)
  set par(justify: true)


  // --- adding first line indent ---
  set par(
    first-line-indent: (
      amount: 1.5em,
      all: true,
    ),
  )


  // --- Figures ---
  show figure: set text(size: 0.85em)

  show figure.where(kind: table): set figure.caption(position: top)

  body
}
}
