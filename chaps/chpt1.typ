/* --------------------------------- DO NOT EDIT -------------------------------- */
#import "../Class.typ": *
#show: report.with(isAbstract: false)
#set page(header: none)
 
#figure(chap(chap1, numbering: "1."), kind: "chapter", supplement: "Chapter") <chp:chap1> // Chapter 1
#set page(header:[
  #set text(10pt)
  #smallcaps(title) 
  #h(1fr) 
  #emph(chap1) 
  #line(length: 100%)])
#set heading(outlined: true, numbering: "1.")
/* ------------------------------------------------------------------------------ */

#heading(level: 2, numbering: none)[Introduction]
in this chapter, we will present the company first, then we will present the project context,problem and the requirements of the project.
== Lear company
Lear Corporation is a world leader in the automotive technology industry, specializing in the complex design and lean manufacturing of seating solutions and electrical distribution systems. Lear has a massive employee base of over 170,000 committed workers, who are dispersed in a whopping total of 38 countries worldwide. Lear proudly services almost every major automaker in the world.
#figure(
  image("images/Lear.png", width: 40%),
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
Lear is one of the world's leading manufacturers of complete automotive seat systems and related components. The seating division focuses on:

- Seat Structures & Mechanisms: Development of durable and lightweight seat frames.

- Foam & Comfort Solutions: Advanced foam technologies for enhanced comfort.

- Trim & Surface Materials: High-quality leather, fabric, and synthetic materials.

- Seating Electronics: Integration of climate control, massage functions, and safety features.
#figure(
  image("images/seat.png", width: 25%),
  caption: "Seat made by lear",
)

=== E-System


Lear's E-Systems division specializes in electrical and electronic components for vehicles, including:

- Wiring Harnesses: Advanced connectivity solutions for automotive electrical systems.

- Power Distribution Units: Smart distribution of electrical power within vehicles.

- Connectivity Solutions: Infotainment, communication modules, and cybersecurity systems.

- Battery Management Systems: Technology supporting electric and hybrid vehicle batteries.
#figure(
  image("images/e-system.jpeg", width: 40%),
  caption: "E-system fo lear corporation",
)
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
Over the last few years, Tunisia has increasingly become an important and strategically located production base for Lear, mainly due to the availability of a highly qualified and skilled workforce, competitively low and affordable costs of production, and its geographical location in very close proximity to Europe. Due to these favorable factors, the company has been able to set up and is now running several plants in the country.
#figure(
  image("images/LearCorporation600.jpg"),caption: "Lear plant in tunisia "
)

=== Tunisian Facilities

Lear Corporation has several facilities in Tunisia, including:

- Bir El Bey Facility: Specializes in electronic component production for automotive applications.

- Menzel Bourguiba Plant: Involved in assembly, wiring systems, and quality control.

- Bizerte Industrial Complex: Opened in 2023, this facility is expected to employ over 7,000 workers by 2027, focusing on advanced automotive technologies.


== Problem Statement
The Menzel Bourguiba facility, which shows growth and modernization,experiences standard beginning challenges in its new  manufacturing operations.

Plant visits alongside worker interviews confirmed that the facility's maintenance management systems remained paper-based without any digital  transformation. The maintenance teams received machine fault reports exclusively through paper documentation while the operators provided verbal fault information.

The operational difficulties result in decreased production efficiency and longer response times, which negatively affect equipment durability throughout its lifecycle @tpm .

#figure(
  image("images/bon de travail.JPG", width: 80%),
  caption: "Work order:",
  
)
#figure(
  image("images/intervenant.JPG", width: 80%),
  caption: "Intervention form ",
  
)
== Proposed Solution
The proposed solution to the problems listed above would address them through the use of a Web-Based IIoT Monitoring System with an in-house tailored GMAO (CMMS) module. The proposed system is to be deployed on one prototype sorting machine, with simulation of the real-world factory environment in the Menzel Bourguiba factory.

By showing the integration of Siemens S7-1200 PLC, edge communication using Python, and maintenance portal using Django, the project has immediate applicability to Lear's broader Industry 4.0 vision:



- Improve fault visibility and response time,

- Reduce machine downtime,

- Enable data-driven maintenance planning,

- Provide a low-cost, scalable alternative to SCADA systems.

By implementing this system at Lear Corporation, the factory can significantly enhance its maintenance efficiency, reduce unplanned downtime, and improve overall operational performance @tpm.
#heading(level: 2, numbering: none)[Project Scope and Development Environment]
Due to limited access to the actual production machines at the Menzel Bourguiba factory, we decided to build and test our solution using a prototype sorting station set up in classroom I0.8 at ISET.

This prototype mimics the core operations of a real industrial setup, which allowed us to:

- Simulate machine faults and intervention scenarios,

- Integrate a PLC with Python for edge communication,

- Develop and deploy the Django-based GMAO web application in a realistic environment.

By working with this prototype, we ensured that our system could be tested effectively despite limited factory access, while keeping it adaptable for future deployment in Lear’s production environment.


#heading(level: 2, numbering: none)[Conclusion]
This chapter provides the context to the project by tracing the history of Lear Corporation,
identification of the major maintenance issues, and offering the suggested Webapp solution.

The Later chapters provide further details regarding the design, execution, and evaluation of the combined
system, its merits, and how it can benefit Lear's business.
