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

== Factory Layout and Machine Distribution

As part of our initial site analysis, we obtained the official layout of the Menzel Bourguiba factory. This layout provided us with detailed information on the positions and roles of each machine across the facility. It allowed us to understand the workflow and interactions between different zones of production.

#figure(
  image("images/Factory.jpg", width: 80%),
  caption: "Layout of Machines in Lear's Menzel Bourguiba Factory",
)

By analyzing this layout, we were able to link physical machine locations with maintenance data. This was a crucial step in designing an interface that accurately reflects the status of each production zone in real time. It also helped us determine where fault alerts should be mapped and which zones required more frequent intervention based on their criticality.

We identified the following key zones in the factory:

=== Cutting Zone

In the cutting zone, raw materials are processed and shaped using high-speed cutting machines. This area represents the beginning of the production process and has a strong impact on the downstream workflow.

We observed that the most common issues in this zone included:
- Blade wear and misalignment
- Material feeding jams
- Dust accumulation affecting sensors

=== Sewing Zone

This area hosts a large number of industrial sewing machines used to assemble parts. Due to the precision and speed required, even minor faults here can disrupt production.

We noted frequent issues such as:
- Needle breakage
- Thread feed errors
- Synchronization failures between machine components

=== Assembly Zone

In the assembly zone, components from previous stages are combined into complete seat structures. The process involves mechanical presses, fastening systems, and in some cases, robotic arms.

Typical challenges we identified included:
- Hydraulic pressure drops
- Misaligned sensors
- Actuator failures

=== Quality Control Area

Once assembled, the products pass through quality control, where visual and electronic inspections ensure compliance with specifications. This is a key area for avoiding defective products.

We found issues such as:
- Camera calibration problems
- Sensor signal delays
- Network disconnections during data logging

=== Packaging and Logistics Zone

This final zone handles labeling, packaging, and preparing items for delivery. Although not part of the direct manufacturing process, problems here can delay product shipments.

Common problems included:
- Barcode scanner faults
- Label printing errors
- Conveyor system interruptions

By mapping out each of these zones and understanding their common faults, we were able to design a monitoring system that supports location-based fault detection and prioritization. This foundation was essential for building a responsive and context-aware CMMS solution.

With a clear overview of the production environment and machine distribution, we were prepared to address the underlying challenges faced by maintenance teams in the Menzel Bourguiba factory.



== Problem Statement

After thoroughly analyzing the factory layout and observing the workflow in each production zone, we identified a major operational challenge: the absence of a modern, digital maintenance management system. Despite the facility’s growth and modernization, maintenance operations at the Menzel Bourguiba plant still relied heavily on paper-based processes.

During our site visits and discussions with technicians and operators, we confirmed that fault reports were primarily delivered verbally or through handwritten work orders. This lack of digitization limited traceability and created delays in both communication and response time.

We also observed that fault history was not archived systematically, making it difficult to analyze recurring issues, track intervention times, or plan preventive actions effectively. Operators, when identifying an issue on a machine, had to inform the maintenance team manually—often without precise documentation or timing.

These limitations not only slowed down intervention procedures but also affected equipment performance and increased the risk of long-term wear due to delayed maintenance. Ultimately, this translated into reduced overall productivity and a lack of real-time visibility into machine health.

#figure(
  image("images/bon de travail.JPG", width: 80%),
  caption: "Work Order used by the maintenance team",
)
#figure(
  image("images/intervenant.JPG", width: 80%),
  caption: "Intervention Form completed manually",
)

== Specifications

To address the limitations identified during our field study, we proposed the development of a web-based IIoT (Industrial Internet of Things) monitoring system integrated with a custom-built CMMS (Computerized Maintenance Management System). Our solution is designed to modernize maintenance practices by digitizing fault reporting, improving communication flow, and enabling real-time monitoring of machine status.

By implementing this solution, we aim to:

- Improve fault visibility and reduce response times,
- Decrease machine downtime by streamlining maintenance workflows,
- Enable data-driven decision-making through fault logging and visualization,
- Offer a cost-effective and scalable alternative to commercial SCADA systems.

Our approach aligns with Lear Corporation’s long-term vision for Industry 4.0 transformation. Through this initiative, we intend to empower maintenance teams with a smart, connected tool that enhances operational efficiency and promotes proactive maintenance strategies.

== Project Scope and Development Environment
Due to limited access to the actual production machines at the Menzel Bourguiba factory, we decided to build and test our solution using a prototype sorting station set up in classroom I0.8 at ISET.

This prototype mimics the core operations of a real industrial setup, which allowed us to:

- Simulate machine faults and intervention scenarios,

- Integrate a PLC with Python for edge communication,

- Develop and deploy the Django-based GMAO web application in a realistic environment.

By working with this prototype, we ensured that our system could be tested effectively despite limited factory access, while keeping it adaptable for future deployment in Lear’s production environment.


#heading(level: 2, numbering: none)[Conclusion]


In this chapter, we introduced the company, explored its historical and operational context, and identified key challenges affecting maintenance efficiency at the Menzel Bourguiba facility. Through direct observations and interviews with staff, we determined that maintenance reporting was entirely paper-based, leading to delays and inefficiencies.
-
To respond to this issue, we proposed a hybrid IIoT-CMMS solution that combines real-time monitoring, web-based fault reporting, and streamlined maintenance workflows. Our solution bridges the gap between factory-level operations and digital oversight.

The next chapters will detail the implementation of this system, from design and software architecture to deployment, testing, and evaluation of results in terms of performance and reliability.
