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

- SCADA Integration: The S7-1200 PLC handles the comunucation task, while WinCC Runtime Professional is used for SCADA visualization.

- PLC Integration: The S7-1200 PLC monitors machine states and detects faults in real time. These faults trigger data transmission via VBScript.

- Data Transmission Mechanism: VBScript is embedded within WinCC Runtime Professional to extract machine data and insert it directly into the PostgreSQL database. The script is triggered by events such as machine failures or specific operator actions.

- Fault Notification System: Once fault data is recorded in the database, the Django backend processes it and updates the web interface. This allows maintenance teams to respond promptly and resolve issues efficiently.
  
#figure(
  image("images/ERD.png", width: 50%),
  caption: "The ERD of the database",
) 
=== Workflow
The workflow of the system is designed to ensure seamless communication between the hardware and software components. The process can be summarized as follows:
1. Data Acquisition: The PLC continuously monitors the machines and detects any faults or anomalies.
2. Data Transmission: When a fault is detected, the VBScript embedded in WinCC Runtime Professional extracts relevant data and sends it to the PostgreSQL database.
3. Data Processing: The Django backend processes the incoming data, updating the database and notifying the frontend.
4. User Interaction: Operators can access the web interface to view real-time data, generate reports, and manage work orders.
5. Fault Notification: The system sends SMS notifications to maintenance staff, alerting them of any critical faults that require immediate attention.
6. Maintenance Management: The GMAO application allows maintenance teams to track work orders, log interventions, and analyze machine performance over time.
7. Reporting: The system generates reports based on the collected data, providing insights into machine performance, fault history, and maintenance activities.
#figure(
  image("images/workfolw.png", width: 50%),
  caption: "The workflow of the system",
)

==  Technologies Used

- Frontend: HTML, CSS, JavaScript for an interactive user experience.

- Backend: Django (Python) for handling data logic and system processes.

- Database: PostgreSQL for structured and efficient data storage.

- Industrial Communication: VBScript within WinCC Runtime Professional to enable machine-to-database communication.

- SCADA: WinCC Runtime Professional for real-time machine monitoring and operator interaction.


#heading(level: 2, numbering: none)[Conclusion]
This chapter provided a comprehensive analysis of the system’s design, covering its architecture, components, data flow, and constraints. Figures such as the system architecture diagram, database schema, and fault detection workflow illustrate the working mechanisms in detail. The next chapter will delve into the implementation phase, explaining the technical aspects of development and integration.
