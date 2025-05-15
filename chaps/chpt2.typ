/* --------------------------------- DO NOT EDIT -------------------------------- */
#import "../Class.typ": *
#show: report.with(isAbstract: false)
#set page(header: none)
#figure(chap(chap2, numbering: "1."), kind: "chapter", supplement: "Chapter") <chp:chap2> // Chapter 2
#set page(header:[
  #set text(10pt)
  #smallcaps(title) 
  #h(1fr) 
  #emph(chap2) 
  #line(length: 100%)])
#set heading(outlined: true, numbering: "1.")
/* ------------------------------------------------------------------------------ */

#heading(level: 2, numbering: none)[Introduction]
The main goal of this project's design is to create an organized and effective system that guarantees the smooth operation and integration of different parts. An overview of the system architecture, key elements, workflow, and technology is given in this chapter. In line with the project's goals, the design strategy seeks to achieve dependability, scalability, and usability.
== Sorting Machine Prototype


The system is built around a functional prototype of a sorting machine that classifies parts based on physical characteristics such as color and height.
#figure(
  image("images/tri station_full.png", width: 40%),
  caption: "The Sorting Machine Prototype",
)




=== Hardware Architecture
The machine includes:



- Sensors:

  - Color sensor

  - Height detection sensor

  - Position or presence sensors

- Actuators:

  - Pneumatic or motorized sorters

  - Conveyor motor

  - Indicator lights (LEDs)

- Controller:

  - Siemens S7-1200 PLC
=== PLC I/O Table 
 @fig:Tab-tags presents the list of inputs and outputs (I/O) used in the PLC program for the sorting station. Each signal is identified by a unique reference, a symbolic tag, a brief description of its function, and the corresponding address in the PLC memory (digital or analog) .

#figure(
  image("images/Tags.png",width: 50%),
  caption: "Tags Table in Tia Portal"
)<fig:Tab-tags>

_The complete Table of PLC I/O addresses used in this project is detailed in  _

=== Electrical and Pneumatic schema
you can see the full schematic in 
#figure(
  image("images/diagram.png", width: 40%),
  caption: "electrical diagram sheet",
)
=== HMI
Hmi panel

== PLC Programming - TIA Portal
The Siemens S7-1200 PLC was programmed using TIA Portal to monitor and control a prototype sorting machine.

Key elements:

- Input signals from sensors detect part presence and type.

- Output signals drive actuators based on classification logic.

- Memory addresses (in Data Blocks) store:

  - Total part count

  - Number of parts by type

  - Current machine status (e.g., idle, sorting, error)

  - Error flags for specific faults (e.g., jammed part, sensor failure)

These values are continuously updated and made available for external read access by the edge device.
===  Study of Operating Modes – GEMMA Diagram
In order to design a structured and safe automation sequence, we studied the system's functional behavior using the GEMMA methodology (Guide d’Étude des Modes de Marche et d’Arrêt). This standard tool helps define the system’s reaction to various operational modes, including starting, stopping, initialization, emergency stop, and cycle execution.

The GEMMA diagram provides a clear framework for:

- Defining different operating modes (Manual, Automatic, Initialization)

- Managing transitions between these modes

- Coordinating the launch and interruption of automatic cycles

This study also supports the development of GRAFCET diagrams by clearly separating control logic from mode management.
For this project, we used the following GEMMA blocks, relevant to the sorting station:
- F4:
_A complete illustration of these blocks and transitions is available in Appendix D,_

=== Sequentiel Functions Charts
=== Functions Blocks


== Communucation
#figure(
  image("images/chaart.png", width: 50%),
  caption: "The interaction between the different modules",
)
The software system is split into three main layers:
#figure(
  image("images/interaction.png", width: 50%),
  caption: "The interaction between the different modules",
)
== Software Architecture
The software system is split into three main layers:
#figure(
  image("images/interaction.png", width: 50%),
  caption: "The interaction between the different modules",
)

=== Edge Communication Layer
This component bridges the PLC and web application using:

- Python + Snap7 library

  - Periodically reads data from the PLC

  - Formats the data as JSON

  - Sends it to the web app

#figure(
  image("images/snap7 dagram.png", width: 60%),
  caption: " Snap7 IOT Solution",
)



== Web Application Layer
=== Technologies Used

The Django app provides:


- Frontend: A user-friendly interface developed using HTML, CSS, JavaScript, and Bootstrap, allowing operators to interact with the system.

- Backend: Implemented using Django to handle business logic, data processing, and authentication.

- Database: PostgreSQL is used to store user information, work orders, fault logs, and intervention records.

- PLC Integration: The S7-1200 PLC monitors machine states and detects faults in real time. These faults trigger data transmission via a Python script.
- HMI: WinCC Runtime Advanced for real-time machine monitoring and operator interaction.

- Fault Notification System: Once fault data is recorded in the database, the Django backend processes it and updates the web interface. This allows maintenance teams to respond promptly and resolve issues efficiently.
#figure(
  image("images/technologies.png", width: 90%),
  caption: " Technologies used in the Project",
)

#heading(level: 4, numbering: none)[PostgreSQL Database]

The PostgreSQL database is structured to store various data types, including user information, work orders, fault logs, and intervention records. The database schema is designed to ensure data integrity and efficient querying.
#figure(
  image("images/ERD.png", width: 100%),
  caption: "The ERD of the database",
)
== Data Flow Diagram
The system is designed to enable seamless and responsive machine-to-machine, HMI interface, and maintenance platform communication. The workflow is structured as follows:

- Machine Monitoring: The S7-1200 PLC continuously monitors machine conditions, detecting faults or abnormal conditions when the machine is running.

- Local Fault Handling: When a fault occurs, a python Script in the Pc captures the machine-specific information regarding the event.

- Database Update: Such information is directly uploaded to the PostgreSQL database to be stored and accessed by the maintenance management system (GMAO).

- Backend Processing: The received fault data are processed by the Django backend, tagged with their respective machine and time, and updated in respective work order or intervention record.

- User Access via HMI & Web Interface: Fault reporting can be done by operators via the HMI or interact with the web interface for real-time machine status viewing, intervention requests, and monitoring work order status.

- Maintenance Workflow Management: With the GMAO interface, maintenance teams have all of these related tasks to take care of—posting interventions, monitoring response time, noting completed tasks, and analyzing repeat faults.

- Reporting and Traceability: Reports on maintenance and performance are made available from a centralized perspective, giving visibility into downtime, intervention history, and machine reliability information.

#figure(
  image("images/workfolw.png", width: 44%),
  caption: "The interaction between the different modules",
)


#heading(level: 2, numbering: none)[Conclusion]
This chapter provided a comprehensive analysis of the system’s design, covering its architecture, components, data flow, and constraints. Figures such as the system architecture diagram, database schema, and fault detection workflow illustrate the working mechanisms in detail. The next chapter will delve into the implementation phase, explaining the technical aspects of development and integration.

