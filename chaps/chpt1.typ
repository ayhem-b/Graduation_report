/* --------------------------------- DO NOT EDIT -------------------------------- */
#import "../Class.typ": *
#show: report.with(isAbstract: false)
#set page(header: none)
#figure(chap(chap1, numbering: "1."), kind: "chapter", supplement: "Chapter") <chp:chap1> // Chapter 1
#set page(header: smallcaps(chap_name) + h(1fr) + emph(chap1) + line(length: 100%))
#set heading(outlined: true, numbering: "1.")
/* ------------------------------------------------------------------------------ */

#heading(level: 2, numbering: none)[Introduction]
in this chapter, we will present the company first, then we will present the project context,problem and the requirements of the project.
== Lear company
Lear Corporation is a global leader in automotive seating and electrical systems, serving major automakers worldwide. With a history dating back over a century, the company has established itself as a crucial player in the automotive industry, continuously innovating to meet the evolving demands of modern vehicles.

#figure(
  image("images/Lear.png", width: 50%),
  caption: "LEAR Corporation logo",
)

== History of Lear Corporation
Lear Corporation was founded in 1917 as the American Metal Products Company in Detroit, Michigan. Initially, the company specialized in manufacturing tubular, welded, and stamped assemblies for the automotive and aircraft industries. Over the decades, Lear underwent several transformations, expanding its capabilities and diversifying its product portfolio.

Key milestones in Lear's history include:
#figure(
  table(
    columns: (auto, auto),
    [1960s-1970s], [Expansion into automotive seating and interior systems.],
    [1988], [ Renamed Lear Corporation after a series of acquisitions and restructuring.],
    [1994], [Became a publicly traded company, listed on the New York Stock Exchange.],
    [2000s],
    [Strategic acquisitions, including United Technologies' Automotive unit, strengthened its position in electrical systems.],

    [2010s-Present],
    [Focused on innovation, sustainability, and intelligent seating technologies, with significant investments in research and development.],
  ),
  caption: "Lear's history timeline",
)
== Products and Services
Lear Corporation operates under two major business segments: Seating and E-Systems.
=== Seating
#figure(
  image("images/seat.png", width: 15%),
  caption: "Seat made by lear",
)
Lear is one of the world's leading manufacturers of complete automotive seat systems and related components. The seating division focuses on:

- Seat Structures & Mechanisms: Development of durable and lightweight seat frames.

- Foam & Comfort Solutions: Advanced foam technologies for enhanced comfort.

- Trim & Surface Materials: High-quality leather, fabric, and synthetic materials.

- Seating Electronics: Integration of climate control, massage functions, and safety features.
=== E-System
#figure(
  image("images/e-system.jpeg", width: 50%),
  caption: "E-system fo lear corporation",
)

Lear's E-Systems division specializes in electrical and electronic components for vehicles, including:

- Wiring Harnesses: Advanced connectivity solutions for automotive electrical systems.

- Power Distribution Units: Smart distribution of electrical power within vehicles.

- Connectivity Solutions: Infotainment, communication modules, and cybersecurity systems.

- Battery Management Systems: Technology supporting electric and hybrid vehicle batteries.

== Global Presence
Lear Corporation operates in 39 countries with more than 257 locations worldwide. Major production and engineering facilities are located in North America, Europe, and Asia, ensuring close collaboration with leading automakers.
#figure(
  image("images/map.png", width: 40%),
  caption: "LEAR implantation in the world",
)

- United States: Headquarters in Southfield, Michigan, and several manufacturing plants.

- Mexico: A major production center for automotive seating and wiring systems.

- Germany & UK: European R&D and innovation centers.

- China & India: Growing markets for electric and connected vehicle technologies.
== Lear Corporation in Tunisia
Tunisia has become an essential manufacturing hub for Lear Corporation, providing cost-effective production capabilities and a skilled workforce. Lear's operations in Tunisia are part of its broader strategy to strengthen its footprint in North Africa and Europe.

=== Tunisian Facilities

Lear Corporation has several facilities in Tunisia, including:

- Bir El Bey Facility: Specializes in electronic component production for automotive applications.

- Menzel Bourguiba Plant: Involved in assembly, wiring systems, and quality control.

- Bizerte Industrial Complex: Opened in 2023, this facility is expected to employ over 7,000 workers by 2027, focusing on advanced automotive technologies.

=== Economic Impact
Lear’s investment in Tunisia has provided employment opportunities, skill development, and technology transfer. The company’s presence has also contributed to the local economy by supporting suppliers, logistics companies, and infrastructure development.
== Problem Statement
Since the Menzel Bourguiba plant is a new facility, it lacks an efficient maintenance management.
- Lack of Centralized Monitoring: Machines operate independently without a unified interface for tracking performance and errors.
- Delayed Fault Detection and Reporting: Maintenance personnel are often unaware of failures until they escalate into major issues.
- Manual Communication of Alerts: Machine errors are reported through inefficient methods, causing delays in intervention.
- Limited Data Analysis: There is no real-time access to historical maintenance data, making it difficult to optimize preventive and predictive maintenance strategies.
- Production Downtime: Unplanned machine failures result in costly production stoppages and inefficiencies.
== Proposed Solution
To address these challenges, the project proposes a CMMS-SCADA integration that provides:

- A centralized digital platform for managing maintenance requests, work orders, and intervention history.
- SCADA system allowing operators and maintenance teams to visualize all the machines statuses on a single screen.
- Automated error alerts (SMS) sent to designated maintenance personnel when faults are detected.
- Historical data analysis and reporting, enabling predictive maintenance strategies and improved decision-making.
- Seamless integration with PLC systems (S7-1200) to ensure automated fault detection and quick response mechanisms.
- User-friendly HMI interfaces for operators to report faults and monitor machine statuses.

By implementing this system at Lear Corporation, the factory can significantly enhance its maintenance efficiency, reduce unplanned downtime, and improve overall operational performance.

#heading(level: 2, numbering: none)[Conclusion]
This chapter establishes the foundation of the project by outlining Lear Corporation's background, identifying key maintenance challenges, and presenting the proposed
CMMS-SCADA solution. The subsequent chapters will delve deeper into the design, implementation, and evaluation of the integrated system, highlighting its benefits and potential impact on Lear's operations.
