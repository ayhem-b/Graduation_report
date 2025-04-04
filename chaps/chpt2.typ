/* --------------------------------- DO NOT EDIT -------------------------------- */
#import "../Class.typ": *
#show: report.with(isAbstract: false)
#set page(header: none)
#figure(chap(chap2, numbering: "1."), kind: "chapter", supplement: "Chapter") <chp:chap2> // Chapter 2
#set page(header: smallcaps(chap_name) + h(1fr) + emph(chap2) + line(length: 100%))
#set heading(outlined: true, numbering: "1.") 
/* ------------------------------------------------------------------------------ */ 

#heading(level: 2, numbering: none)[Introduction]
The main goal of this project's design is to create an organized and effective system that guarantees the smooth operation and integration of different parts. An overview of the system architecture, key elements, workflow, and technology is given in this chapter. In line with the project's goals, the design strategy seeks to achieve dependability, scalability, and usability.

== System Architecture

The system consists of multiple interconnected modules that work together to achieve the desired functionality. It includes:

- Hardware Layer: Comprising industrial machines, CP-1242-7 V2(Communication module for the plc), and PLC(Programmable Logic Controllers) for automation and real-time data acquisition.

- Software Layer: A web-based GMAO (Gestion de Maintenance Assistée par Ordinateur) application built using Django.

- Database Layer: A PostgreSQL database to store and manage data efficiently.

- Communication Layer: A Cp module to send SMS to maintenance staff and a VB Script to send Data from the SCADA systeme to the Database.

#figure(
  image("images/interaction.png", width: 50%),
  caption: "The interaction between the different modules",
)

== Main Components
- Frontend: A user-friendly interface developed using HTML, CSS, JavaScript, and Bootstrap, allowing operators to interact with the system.

- Backend: Implemented using Django to handle business logic, data processing, and authentication.

- Database: PostgreSQL is used to store user information, work orders, fault logs, and intervention records.

- PLC & SCADA Integration: The S7-1200 PLC handles automation tasks, while WinCC Runtime Professional is used for SCADA visualization.

Alert System: The system sends SMS notifications through the CP module when faults are detected.
=== Subsection 2.1
#lorem(64)
=== Subsection 2.2
#lorem(64)

#heading(level: 2, numbering: none)[Conclusion]
#lorem(32)
