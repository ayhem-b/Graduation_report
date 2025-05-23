/* --------------------------------- DO NOT EDIT -------------------------------- */
#import "../Class.typ": *

#show: report.with(isAbstract: false)
#set page(header: none)
#set page(numbering: none)
#figure(chap("APPENDIX"), supplement: [Appendix], numbering:none) // GI
#set page(
  header: [
    #set text(10pt)
    #smallcaps(title)
    #h(1fr)
    #emph("Appendix")
    #line(length: 100%)],
)
#set page(numbering: "I")
#counter(page).update(1)

#set heading(supplement: [Appendix])
/* ------------------------------------------------------------------------------ */
#appendix("A","Technical Specifications",[
   #align(center)[
    #image("images/station1 app.jpg", width: 95%)
  ]
     #align(center)[
    #image("images/station 2 app.jpg", width: 120%)
  ]
     #align(center)[
    #image("images/station 3 app.jpg", width: 120%)
  ]
     #align(center)[
    #image("images/station 4 app.jpg", width: 120%)
  ]
])

#appendix("B","GEMMA",[
  #align(center)[
    #image("images/Gemma.png", width: 83%)
  ]
])
 #appendix("C","SFC",[

  #align(center)[
    #image("images/grafcet.drawio.png",width: 95%)
  ]
 ])
#appendix("D","PLC Data Sheet",[
#align(center)[
  #image("images/0900766b81639d65-1.jpg",width:95% )
  #pagebreak()
  #image("images/0900766b81639d65-2.jpg")
  #pagebreak()
  #image("images/0900766b81639d65-3.jpg")
  #pagebreak()
  #image("images/0900766b81639d65-4.jpg")
  #pagebreak()
  #image("images/0900766b81639d65-5.jpg")
  #pagebreak()
  #image("images/0900766b81639d65-6.jpg")
]
])
#appendix("E","ERD Table ",
[
  #align(center)[
  *  Maintenance Intervention Table *
#table(
columns: 2,
  align: center,
  
[*Field*],
[*Description*],
[id],
[Primary key],
[received\_date],
[Timestamp of intervention start],
[end\_time],
[Timestamp of intervention end],
[fault\_category],
[High-level fault classification (mechanical, electrical…)],
[fault\_sub\_category],
[Specific fault sub-type],
[operator\_id],
[Foreign key to auth\_user (who reported the issue)],
[technician\_id],
[Foreign key to auth\_user (technician who intervened)],
[status],
[Status of the intervention],
[work\_order\_id],
[Foreign key to related maintenance\_workorder],
[used\_spare\_part\_id],
[Foreign key to maintenance\_sparepart (optional)],
  )
*Maintenance Work Order Table*
  #table(
  columns: 2,
  align: center,
  
[*Field*],
[*Description*],
[id],
[Primary key (auto-incremented)],
[time\_of\_default],
[Timestamp of when the fault occurred],
[description],
[Text description of the fault],
[created\_at],
[Timestamp when the work order was created],
[updated\_at],
[Timestamp of last modification],
[assigned\_user\_id],
[Foreign key to auth\_user (technician)],
[machine\_id],
[Foreign key to maintenance\_machine],
[status],
[Current state (e.g., open, in progress, closed)],
[],
[],
)
*Machines Table*
#table(
  columns: 2,
  align: center,
 
[*Field*],
[*Description*],
[id],
[Primary key],
[machine\_id],
[Internal machine code],
[machine\_name],
[Human-readable name (e.g., “Line 1 CNC”)],
[description],
[Optional notes about the machine],
[status],
[Operational state (running, faulty…)],
)
  #pagebreak()
  *Spare Parts Inventory Table*
  #table(
  columns: 2,
  align: center,
  
[*Field*],
[*Description*],

[id],
[Primary key],

[part\_id],
[Internal spare part code],

[part\_name],
[Human-readable part name],

[quantity],
[Current stock quantity in inventory],

)
#pagebreak()
#image("images/ERD - Copie.png",width: 110%)

]])

#appendix("F","User Inteaction",[
  #image("images/User-interaction.png",width: 108%)
])

#appendix("G","Cp-1242-7 V2 Cofiguration",[
  #image("images/Principe.png",width: 108%)
])




