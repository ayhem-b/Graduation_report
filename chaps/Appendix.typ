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
    #image("images/station1 app.jpg", width: 97%)
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





#appendix("B", "List of Tags", [

#figure(
  table(
    columns: 4,
    align: center,
    [Reference], [Tag], [Description], [Address],
    [1B00], [L10], [Sensor: Cylinder 1M1 retracted], [I0.0],
    [1B01], [L11], [Sensor: Cylinder 1M1 extended], [I0.1],
    [1B02], [mc], [Photoelectric sensor – Magazine full], [I0.2],
    [1B03], [ms], [Micro-switch – Part out of magazine], [I0.3],
    [1B04], [pn], [Color sensor – Black piece], [I0.4],
    [1B05], [pm], [Inductive sensor – Metallic piece], [I0.5],
    [2B00], [Brm], [Arm 2M1 in middle position], [I0.6],
    [2B01], [Brd], [Arm 2M1 to the right], [I0.7],
    [3B00], [Cvb], [Vertical conveyor at bottom position], [I1.0],
    [3B01], [Cvh], [Vertical conveyor at top position], [I1.1],
    [3B02], [Cvm], [Vertical conveyor at middle position], [I1.2],
    [3B03], [L21], [Sensor: Cylinder 3M2 extended], [I1.3],
    [9F1], [fcg], [Limit switch – Rail left], [I1.4],
    [9F2], [fcd], [Limit switch – Rail right], [I8.2],
    [9B01], [cfr], [Fork sensor – Rail position], [I1.5],
    [9B02], [L31], [Sensor: Cylinder 9M2 extended], [I8.0],
    [9B03], [-], [Photoelectric barrier (not connected)], [-],
    [], [STOP], [STOP push button], [I8.3],
    [], [START], [START push button], [I8.4],
    [], [FC], [Cycle start push button], [I8.5],
    [], [Mode I], [Mode selector – Manual], [I8.6],
    [], [Mode II], [Mode selector – Automatic], [I8.7],
    [3A1], [EP], [Analog sensor – Thickness measurement], [IW64],
  ),
  caption: "PLC Digital and Analog Input Tags",
)<tab:i-tags>

#figure(
  table(
    columns: 4,
    align: center,
    [Reference], [Tag], [Description], [Address],
    [1Q00], [V1+], [Cylinder 1M1 – Extend], [Q0.0],
    [1Q01], [V1-], [Cylinder 1M1 – Retract], [Q0.1],
    [2Q00], [BG], [Arm 2M1 – Move Left], [Q0.2],
    [2Q01], [BD], [Arm 2M1 – Move Right], [Q0.3],
    [2Q02], [GV], [Activate vacuum generator 2M2], [Q0.4],
    [], [MC], [Vertical conveyor – Up], [Q0.5],
    [], [DC], [Vertical conveyor – Down], [Q0.6],
    [], [V2+], [Cylinder 3M2 – Extend], [Q0.7],
    [9M1], [M1G], [Motor 9M1 – Direction 1], [Q1.0],
    [], [M1D], [Motor 9M1 – Direction 2], [Q1.1],
    [], [V3+], [Cylinder 9M2 – Extend], [Q8.0],
    [], [H_STOP], [Indicator light – STOP button], [Q8.1],
    [], [H_START], [Indicator light – START button], [Q8.2],
    [], [H_FC], [Indicator light – Cycle start button], [Q8.3],
    [], [LA1], [Status light 1], [Q8.4],
    [], [LA2], [Status light 2], [Q8.5],
  ),
  caption: "PLC Digital Output Tags",
)<tab:o-tags>
])<app1>






#appendix("C","Electrical schematic",[
  #align(center)[
    #image("images/diagram.png", width: 90%)
  ]
])



#appendix("D","GEMMA",[
  #align(center)[
    #image("images/Gemma.png", width: 85%)
  ]
])
 #appendix("E","SFC",[

  #align(center)[
    #image("images/grafcet.drawio.png")
  ]
 ])
#appendix("F","PLC Data Sheet",[
#align(center)[
  #image("images/0900766b81639d65-1.jpg",width:97% )
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
#appendix("G","ERD Table ",
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

#appendix("H","User Inteaction",[
  #image("images/User-interaction.png",width: 108%)
])





