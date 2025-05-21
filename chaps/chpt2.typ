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
The main objective of this project’s design is to develop a structured and efficient system that ensures seamless integration and operation of its various components. An overview of the system architecture, key elements, workflow, and technology is given in this chapter. In line with the project's goals, the design strategy seeks to achieve dependability, scalability, and usability.
== Sorting Machine Prototype


The system is built around a functional prototype of a sorting machine that classifies parts based on physical characteristics such as color and height.
#figure(
  image("images/station.jpg", width: 90%),
  caption: "The Sorting Machine Prototype",
)
_Detailed data can be found in Appendix A_

 


=== Station I
This module is responsible for the loading and identification of parts.
Parts are extracted individually from the magazine and conveyed to the final storage area for sorting based on their color and material.

The unsorted parts are initially placed in a transparent plastic tube.
A photoelectric presence sensor (based on an emitter-receiver pair) determines whether the magazine is loaded or empty.
Each part is individually extracted from the magazine using a double-acting cylinder controlled by a 5/2 bistable valve.

Two pneumatic position sensors indicate whether the cylinder is extended or retracted.
The material characteristics of the part (color and material) are determined respectively by an optical sensor and an inductive sensor.
An activated micro-switch determines whether the part has been removed from the magazine.
#figure(
  image("images/station I.png", width: 90%),
  caption: "Part Storage",
  
)
=== Station II
This rotary transfer mechanism allows the individual transfer of each part from Module 1 to Module 3.

Equipped with a pivoting arm that can rotate up to 180°, this mechanism transports parts using a suction cup. A vacuum generator allows the suction or release of parts with a flat surface. The position of the arm is determined by 2 sensors: far right (part delivered) or center.

A 5/3 valve positions the arm in 3 positions: right (to release the part), left (to pick up the part), and the resting position (centered vertically). The vacuum generator is controlled by a monostable 5/2 valve for gripping or releasing the part.
#figure(
  image("images/station II.png", width: 90%),
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
  image("images/station III.png", width: 90%),
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
  image("images/station IV.png", width: 90%),
  caption: "Part Sorting",
  
) 
=== Station V
This module includes:

Three illuminated push buttons for starting the cycle, stopping the system, or resetting based on the selected program or mode.

- A mode selector

- Two indicators showing the system’s status

The control panel is connected to the PLC and the power supply via a 25-pin parallel connection.
#figure(
  image("images/station v.png", width: 90%),
  caption: "Control Panel:",
  
) 

Having described the five physical modules of the sorting station, we now turn to the control logic that governs their operation.

=== HMI
To facilitate both local and remote interaction with the machine, a dual-interface system was implemented:

- Local HMI Interface: Developed using WinCC Advanced, this interface is deployed on-site to allow operators to monitor machine states, initiate commands, and respond to alarms in real time.

- Remote Dashboard: A custom dashboard was designed and integrated into the system architecture to allow remote monitoring and control. This web-based interface enables access to machine data and control functionalities from a home office or central monitoring location.

#figure(
  image("images/images.png", width: 50%),
  caption: "HMI Root Screen",
)<hmi>
  
== Communucation
as we see in @com we used an ethernet cables and a switch to connect all the Modules of our project
#figure(
  image("images/chaart.png", width: 60%),
  caption: "The interaction between the different modules",
)<com>


== PLC Programming - TIA Portal
The Siemens S7-1214 AC/DC/RLY PLC was programmed using TIA Portal to monitor and control a prototype sorting machine.

_Refer to Appendix D for additional information._

#figure(
  image("images/plc 1214.png" ,width:99%)
  ,caption: "S7-1214C with I/O Module"
)
=== PLC I/O Table 
 @tab:i-tags presents the list of inputs and outputs (I/O) used in the PLC program for the sorting station. Each signal is identified by a unique reference, a symbolic tag, a brief description of its function, and the corresponding address in the PLC memory (digital or analog).


#figure(
  table(
    columns: 4,
    align: left,
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
  caption: "PLC Input and output Tags",
)<tab:i-tags>


 

===  Study of Operating Modes ( GEMMA )
In order to design a structured and safe automation sequence, we studied the system's functional behavior using the GEMMA methodology. This standard tool helps define the system’s reaction to various operational modes, including starting, stopping, initialization, emergency stop, and cycle execution.

The GEMMA diagram provides a clear framework for:

- Defining different operating modes (Manual, Automatic, Initialization)

- Managing transitions between these modes

- Coordinating the launch and interruption of automatic cycles

This study also supports the development of SFC diagrams by clearly separating control logic from mode management.
For this project, we used the following GEMMA blocks, relevant to the sorting station:
#figure(
table(
  columns: (auto, auto),
  
    [*Block*], [*Description*],
    [F1],[ Normal production],
    [F4],[ Manual Mode],
    [F5],[Testing Mode],
    [A1],[ Stop in initial state],
    [A5],[ Preparation for restart after failure],
    [A6],[ Returning the workpiece (PO) to initial state],
    [D1],[ Emergency stop],
  
),caption: "GEMMA Modes",
)
_A complete illustration of these blocks and transitions is available in Appendix B,_

=== Sequentiel Functions Charts
To define the sequencing and coordination of the sorting station's operations, a GRAFCET diagram (Sequential Function Chart – SFC) was developed. This graphical tool allowed for a clear and systematic representation of the system’s behavior in terms of steps (states) and transitions (conditions for change).

The logic derived from this GRAFCET in @fig:grafcet was implemented using structured programming blocks in TIA Portal (e.g., OBs, FBs, FCs), ensuring a faithful and maintainable translation of the control sequence.


#figure(
  image("images/control grafcet.png", width: 50%),
  caption: "Supervisory Sequentiel Chart",
)<fig:grafcet>
_For a complete overview, refer to Appendix C_
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


== Communication Architecture
The integration between the custom SCADA system and the Siemens S7-1200 PLC was achieved using Snap7, an open-source library that facilitates communication with Siemens PLCs using the S7 protocol.
The software system is split into four main layers as shown in @layers:
#figure(
  image("images/interaction.png", width: 50%),
  caption: "The interaction between the different modules",
)<layers>



=== Overview of Snap7
Snap7 is a multi-platform, open-source communication library developed in C++ that enables client/server interaction with Siemens PLCs. It supports various programming languages including Python, C\# , and Java, allowing for flexible integration into different software environments @snap7.

Snap7 provides full access to the PLC memory areas such as:

- Data Blocks (DBs)

- Inputs (I) and Outputs (Q)

- Markers (M)

- Timers and Counters

This makes it particularly well-suited for real-time data acquisition, remote monitoring, and control within custom-built SCADA or HMI systems.

In this project, the Snap7 Python client (snap7.client) was used to establish a direct connection with the S7-1200 PLC. Through the client as shown in @snap , the application can:

- Continuously read values from sensors and system states stored in the PLC

- Write control commands or fault acknowledgments to specific memory addresses

- Monitor machine status in real-time and trigger alerts or interventions

The use of Snap7 allowed the web-based SCADA-HMI interface to communicate reliably with the PLC over the plant’s local network (TCP/IP), following the standard S7 communication protocol.
#figure(
  image("images/snap7_diagram_II.png",width: 100%),
  caption: "snap7 client , server and partner diagram",
)<snap>
=== Advantages of Using Snap7
- Open-source and free to use

- Cross-platform compatibility (Windows, Linux, etc.)

- No need for Siemens proprietary software like OPC servers

- Lightweight and efficient for real-time applications

This choice aligned well with Industry 4.0 principles, enabling flexible and scalable communication with industrial equipment without vendor lock-in.

#figure(
  image("images/snap7 dagram.png", width: 60%),
  caption: " Snap7 IOT Solution",
)



== Web Application 
Our web application layer is the primary interface through which the system is used by users. It is an operating control platform that combines human operators, the database, and industrial automation system (PLC). For our project, creating a responsive, secure, and extensible web application that caters to real-time machine monitoring, maintenance tracking, and data visualization was required.
=== Functional requirements
Essentially, our system must support fault reporting in real-time, user management, machine status monitoring, and communication with PLCs through Snap7. The maintenance technicians should be enabled to securely log in, enter fault reports from the dashboard, and query machine statuses. The administrator should be able to access a management interface to view all interventions, generate reports, and manage users. The system should also be capable of sending or triggering a notification to inform the maintenance staff in the event that a fault is detected. These requirements would make our application improve the efficiency of the maintenance operation and fill in the gap between the SCADA environment and web-based monitoring systems.

=== Technology Stack 
To implement an effective and scalable solution that integrates both SCADA functionalities and a modern web-based maintenance management system, we carefully selected the technology stack . Each component was selected based on performance, compatibility, community support, and ease of integration.

*Bootstrap (UI Styling Framework)*

Bootstrap was utilized to accelerate front-end development and ensure a clean, responsive design. With its prebuilt components and mobile-first grid system, it provided a consistent look across all devices while reducing the amount of custom CSS needed. This helped us to deliver a professional user interface suitable for factory environments with various screen sizes.
This technology stack offers a balanced combination of performance, maintainability, and industrial compatibility, making it well-suited for a hybrid SCADA-CMMS platform.

*Django (Back-end Framework)*

We chosed Django as the back-end framework because of its robust structure, inherent security, and speedy development process. As a Python-based web framework, Django makes database management easy, handles user authentication, and HTTP requests easy. Its ORM provides easy interaction with the PostgreSQL database, and its admin interface helps in handling users and intervention records. Django's modularity also facilitates easy scaling and integration with additional features in the future.

*PostgreSQL (Database Management System)*

PostgreSQL was chosen by us as the database system because of its reliability, advanced indexing techniques, and support for complex queries. It is open-source and highly compatible with Django's ORM, which ensures secure, consistent, and fast data transactions. PostgreSQL’s ability to handle large volumes of data makes it ideal for managing machine history, user activity logs, and intervention records in a production environment.

#figure(
  image("images/technologies.png", width: 90%),
  caption: " Technologies used in the Project",
)

*Database Schema Design*

We designed the database around Django’s authentication framework and we extended it to support CMMS features such as work order management, machine tracking, and maintenance logging, as illustrated in @erd

 Here's a breakdown of the schema components:

*Authentication and Permissions (Green Tables):*
These tables are standard in Django for handling users, groups, and permissions:

- *auth_user*: Stores user accounts. Includes fields like username, email, first_name, last_name, and boolean flags such as is_superuser, is_staff, and is_active.

- *auth_group:* Represents user groups (roles).

- * auth_permission:* Stores the list of permissions (read, write, delete, etc.).

- *auth_user_groups:* Many-to-many relationship between users and groups.

- *auth_user_user_permissions:* Many-to-many link between users and permissions.

- *auth_group_permissions:* Links groups to their permissions.

- *django_admin_log:* Logs administrative actions taken by users in the admin panel.

- *django_content_type:* Supports generic relationships and logging in Django.

*Maintenance Management (Red Tables)*

These tables define the core of the CMMS functionality:

- *maintenance_workorder:* represents a maintenance work order created when a failure occurs. It’s linked to a specific machine and assigned to a technician (auth_user).

- *maintenance_intervention:* captures data about the actual maintenance intervention. Linked to the associated work order and technician who handled it. It also references the spare part used.

- *maintenance_machine:* Contains machine records in the system, each of which can be linked to multiple work orders.

- *maintenance_sparepart:* Manages the inventory of spare parts. Each part can be linked to one or more interventions.
_The full diagram is available in Appendix E._

#figure(
  image("images/ERD.png", width: 100%),
  caption: "The ERD of the database",
)<erd>



#heading(level: 2, numbering: none)[Conclusion]

In this chapter we  described the architecture and design of a five-module prototype sorting machine with identification of parts, transfer, measurement, sorting, and control functionality. The system used mechanical, electrical, and software components to sort parts by color, material, and thickness. Siemens S7-1214 PLC with TIA Portal was utilized for control logic, supported by GEMMA and SFC for operation safety and sequencing. Interfacing with external systems and PLC was done through the Snap7 library, which supported real-time data exchange. A web-based SCADA interface was implemented using Django, PostgreSQL, and Bootstrap for remote and local monitoring in accordance with Industry 4.0 standards.
