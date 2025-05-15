/* --------------------------------- DO NOT EDIT -------------------------------- */
#import "../Class.typ": *
#show: report.with(isAbstract: false)
#set page(header: none)
#figure(chap(chap3, numbering: "1."), kind: "chapter", supplement: "Chapter") <chp:chap3> // Chapter 3
#set page(header:[
  #set text(10pt)
  #smallcaps(title) 
  #h(1fr) 
  #emph(chap3) 
  #line(length: 100%)])
#set heading(outlined: true, numbering: "1.") 
/* ------------------------------------------------------------------------------ */ 

#heading(level: 2, numbering: none)[Introduction]
This chapter explains the actual development and integration of the proposed IIoT-based monitoring and maintenance system. The development was divided into three main layers: PLC programming, edge data acquisition, and the Django-based web application. All components have a core role in enabling real-time monitoring, fault reporting, and maintenance management.




==  Web Application 

== Edge Communication 
=== Python Script 
A Python script running on an edge device  was developed to:

- Connect to the S7-1200 via Ethernet using the Snap7 library.

- Read critical data points from the PLC.

- Convert binary/byte data into human-readable values (integers, strings).

- Send the data to the Django web server using HTTP POST requests.


=== Script Snippet:
#align(
  center,
 block(

  width: 70%,
 
  fill: luma(96.55%),
  inset: 8pt,
  radius: 8pt,
    ```python 
    import snap7
    import requests

    plc = snap7.client.Client()
    plc.connect('192.168.0.1', 0, 1)  # Adjust IP, rack, and slot

    while True:
        part_count = plc.db_read(1, 0, 2)
        status = plc.db_read(1, 2, 2)

        data = {
            "machine_id": "sorter01",
            "part_count": int.from_bytes(part_count, 'big'),
            "status_code": int.from_bytes(status, 'big')
        }

        requests.post("http://your_web_app/api/machine-data/", json=data)
    ```
  )
)
    

=== Node-RED
#lorem(64)



=== REST API Structure


#figure(
  table(
    columns: (auto, auto, auto),
    [*Endpoint*], [*Method*], [*Description*], [$"/api/machine-data/"$], [$"POST"$], [$"Receives machine data from PLC"$],
  ),
  caption: "API structure",
  ) <tab:api-structure>


=== Subsection 2.2
#lorem(64)

/* --- FIGURE --- */
#figure(
  image("images/typst.svg", width: 10%),
  caption: "Typst logo",
) <fig:typst-logo>

@fig:typst-logo shows the `Typst` logo.
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
