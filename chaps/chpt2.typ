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
  image("images/station.jpg", width: 70%),
  caption: "The Sorting Machine Prototype",
)
_Detailed data can be found in Appendix A_

 


=== Station I
This module is responsible for the loading and identification of parts.
The parts to be sorted are extracted from this magazine and conveyed to the final storage area, where they will be sorted according to their color and material.

The unsorted parts are initially placed in a transparent plastic tube.
A photoelectric presence sensor (based on an emitter-receiver pair) determines whether the magazine is loaded or empty.
Each part is individually extracted from the magazine using a double-acting cylinder controlled by a 5/2 bistable valve.

Two pneumatic position sensors indicate whether the cylinder is extended or retracted.
The material characteristics of the part (color and material) are determined respectively by an optical sensor and an inductive sensor.
An activated micro-switch determines whether the part has been removed from the magazine.
#figure(
  image("images/station I.png", width: 70%),
  caption: "Part Storage",
  
)
=== Station II
This rotary transfer mechanism allows the individual transfer of each part from Module 1 to Module 3.

Equipped with a pivoting arm that can rotate up to 180°, this mechanism transports parts using a suction cup. A vacuum generator allows the suction or release of parts with a flat surface. The position of the arm is determined by 2 sensors: far right (part delivered) or center.

A 5/3 valve positions the arm in 3 positions: right (to release the part), left (to pick up the part), and the resting position (centered vertically). The vacuum generator is controlled by a monostable 5/2 valve for gripping or releasing the part.
#figure(
  image("images/station II.png", width: 70%),
  caption: "Transfer Mechanism",
  
)
=== Station III
This module checks the conformity of the part's thickness. The analog thickness measurement is performed using a potentiometer that outputs a 0–10VDC signal.

The part transported by the suction cup is placed into a specific compartment. A vertical 3-position conveyor, controlled by a bistable 5/3 valve, moves the part vertically to the potentiometer.

Depending on the measured thickness, the part is classified as either good or defective.

- If good, the conveyor descends to the middle position and a single-acting cylinder pushes the part into a designated chute.

- If defective, the conveyor descends to the bottom position and the same cylinder pushes the part into a defective parts chute.

The vertical conveyor's position is monitored by 3 sensors: top position, middle position, and bottom position. The cylinder’s state (extended) is detected by a pneumatic position sensor, and it is controlled by a monostable 5/2 valve.
#figure(
  image("images/station III.png", width: 70%),
  caption: "Thickness Measurement",
  
)
=== Station IV
Based on the characteristics detected in the previous modules, parts are sorted into 3 chutes:

- One for metal parts

- One for white parts

- One for black parts

The chute capacity is detected by a light curtain (photoelectric sensor – not connected in our case).
The part coming from Module 3 is moved by a horizontal conveyor driven by a bidirectional motor to align it with one of the three chutes. A single-acting cylinder, controlled by a 5/2 valve, pushes the part into the chute.

The cylinder’s status is detected by a pneumatic position sensor. The conveyor's position in front of each chute is determined by a photoelectric fork sensor.

#figure(
  image("images/station IV.png", width: 70%),
  caption: "Part Sorting",
  
) 
=== Station V
This module includes:

Three illuminated push buttons for starting the cycle, stopping the system, or resetting based on the selected program or mode.

- A mode selector

- Two indicators showing the system’s status

The control panel is connected to the PLC and the power supply via a 25-pin parallel connection.
#figure(
  image("images/station v.png", width: 80%),
  caption: "Control Panel:",
  
) 
=== PLC I/O Table 
 @fig:Tab-tags presents the list of inputs and outputs (I/O) used in the PLC program for the sorting station. Each signal is identified by a unique reference, a symbolic tag, a brief description of its function, and the corresponding address in the PLC memory (digital or analog).

#figure(
  image("images/Tags.png",width: 50%),
  caption: "Tags Table in Tia Portal"
)<fig:Tab-tags>

_The complete Table of PLC I/O addresses used in this project is detailed in Appendix B_

=== Electrical and Pneumatic schema
_you can see the full schematic in Appendix C _

=== HMI
To facilitate both local and remote interaction with the machine, a dual-interface system was implemented:

- Local HMI Interface: Developed using WinCC Advanced, this interface is deployed on-site to allow operators to monitor machine states, initiate commands, and respond to alarms in real time.

- Remote Dashboard: A custom dashboard was designed and integrated into the system architecture to allow remote monitoring and control. This web-based interface enables access to machine data and control functionalities from a home office or central monitoring location.
  


== PLC Programming - TIA Portal
The Siemens S7-1214 AC/DC/RLY PLC was programmed using TIA Portal to monitor and control a prototype sorting machine.

Key elements:

- Input signals from sensors detect part presence and type.

- Output signals drive actuators based on classification logic.

- Memory addresses (in Data Blocks) store:

  - Total part count

  - Number of parts by type

  - Current machine status (e.g., idle, sorting, error)

  - Error flags for specific faults (e.g., jammed part, sensor failure)

These values are continuously updated and made available for external read access by the edge device.
#figure(
  image("images/plc 1214.png" ,width:100%)
  ,caption: "S7-1214C with I/O Module"
)

===  Study of Operating Modes – GEMMA Diagram
In order to design a structured and safe automation sequence, we studied the system's functional behavior using the GEMMA methodology (Guide d’Étude des Modes de Marche et d’Arrêt). This standard tool helps define the system’s reaction to various operational modes, including starting, stopping, initialization, emergency stop, and cycle execution.

The GEMMA diagram provides a clear framework for:

- Defining different operating modes (Manual, Automatic, Initialization)

- Managing transitions between these modes

- Coordinating the launch and interruption of automatic cycles

This study also supports the development of SFC diagrams by clearly separating control logic from mode management.
For this project, we used the following GEMMA blocks, relevant to the sorting station:
- F1: Normal production 
- F4: Manual Mode 
- F5: Testing Mode 
- A1: Stop in initial state
- A5: Preparation for restart after failure
- A6: Returning the workpiece (PO) to initial state
- D1: Emergency stop
_A complete illustration of these blocks and transitions is available in Appendix D,_

=== Sequentiel Functions Charts
To define the sequencing and coordination of the sorting station's operations, a GRAFCET (Graphe Fonctionnel de Commande Étape/Transition) diagram was developed. This graphical tool allowed for a clear and systematic representation of the system’s behavior in terms of steps (states) and transitions (conditions for change).

The logic derived from this GRAFCET in @fig:grafcet was implemented using structured programming blocks in TIA Portal (e.g., OBs, FBs, FCs), ensuring a faithful and maintainable translation of the control sequence.


#figure(
  image("images/control grafcet.png", width: 50%),
  caption: "Supervisory Sequentiel Chart",
)<fig:grafcet>
_For a complete overview, refer to Appendix E_
=== Functions Blocks
To ensure modularity, clarity, and ease of maintenance, the control logic for the sorting station was implemented using structured programming based on Siemens’ block architecture within the TIA Portal environment.

The program is organized into several types of blocks:

- Organizational Blocks (OB): Manage the program's cyclic execution and event-driven tasks.

- Function Blocks (FB): Used for specific modules (e.g., piece loading, thickness measurement, sorting), allowing encapsulation of logic and reuse.

- Functions (FC): Handle repetitive or utility operations such as calculations, timers, or signal processing.

- Data Blocks (DB): Store persistent and structured data related to machine state, sensor readings, and process variables.

The logic was divided into tasks corresponding to each module of the sorting station, ensuring better readability and facilitating debugging. The use of blocks allows the program to be scalable and adaptable in future extensions or maintenance.

Below the @fig:blocks  is illustrating a part of the program structure as implemented in the TIA Portal.
#figure(
  image("images/blocks.png", width: 40%),
  caption: "Tia Portal Blocks ",
)<fig:blocks>

== Communucation
#figure(
  image("images/chaart.png", width: 70%),
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

