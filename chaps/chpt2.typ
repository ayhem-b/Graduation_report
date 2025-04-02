/* --------------------------------- DO NOT EDIT -------------------------------- */
#import "../Class.typ": *
#show: report.with(isAbstract: false)
#set page(header: none)
#figure(chap(chap2, numbering: "1."), kind: "chapter", supplement: "Chapter") <chp:chap2> // Chapter 2
#set page(header: smallcaps(chap_name) + h(1fr) + emph(chap2) + line(length: 100%))
#set heading(outlined: true, numbering: "1.") 
/* ------------------------------------------------------------------------------ */ 

#heading(level: 2, numbering: none)[Introduction]
This chapter presents the design and architecture of the *CMMS-SCADA integration* project. It provides an overview of the system components, their interactions, and the underlying technologies used in the implementation.

== introduction
this is a paragraph
=== Subsection 1.1
#lorem(64)
=== Subsection 1.2
#lorem(64)

== Section 2
#lorem(16)
=== Subsection 2.1
#lorem(64)
=== Subsection 2.2
#lorem(64)

#heading(level: 2, numbering: none)[Conclusion]
#lorem(32)
