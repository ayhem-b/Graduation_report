/* --------------------------------- DO NOT EDIT -------------------------------- */
#import "../Class.typ": *
#show: report.with(isAbstract: false)
#set page(header: none)
#figure(chap(chap3, numbering: "1."), kind: "chapter", supplement: "Chapter") <chp:chap3> // Chapter 3
#set page(header: smallcaps(title) + h(1fr) + emph(chap3) + line(length: 100%))
#set heading(outlined: true, numbering: "1.") 
/* ------------------------------------------------------------------------------ */ 

#heading(level: 2, numbering: none)[Introduction]
#lorem(32)

== Section 1
#lorem(16)
=== Subsection 1.1
#lorem(64)
=== Subsection 1.2
#lorem(64)

== Section 2
#lorem(16) and iwant to be more than that
=== Subsection 2.1
#lorem(64)
=== Subsection 2.2
#lorem(64)

/* --- FIGURE --- */
#figure(
  image("images/typst.svg", width: 10%),
  caption: "Typst logo",
) <fig:typst-logo>

@fig:typst-logo shows the `Typst` logo.

/* --- TABLE --- */
#figure(
  table(
    columns: (auto, auto, auto),
    [a], [b], [c], [$a$], [$b$], [$c$],
  ),
  caption: "Some table",
) <tab:some-table>

@tab:some-table displays some table.

#heading(level: 2, numbering: none)[Conclusion]
#lorem(32)
