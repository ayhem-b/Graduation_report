/* --------------------------------- DO NOT EDIT -------------------------------- */
#import "../Class.typ": *
#show: report.with(isAbstract: false)
#set page(header: none)
#figure(chap(chap2, numbering: "1."), kind: "chapter", supplement: "Chapter") <chp:chap2> // Chapter 2
#set page(
  header: [
    #set text(10pt)
    #smallcaps(title)
    #h(1fr)
    #emph(chap2)
    #line(length: 100%)],
)
#set heading(outlined: true, numbering: "1.")
/* ------------------------------------------------------------------------------ */

#heading(level: 2, numbering: none)[Introduction]
The main goal of this project's design is to create an organized and effective system that guarantees the smooth operation and integration of different parts. An overview of the system architecture, key elements, workflow, and technology is given in this chapter. In line with the project's goals, the design strategy seeks to achieve dependability, scalability, and usability.
== Technologies Used

- Frontend: HTML, CSS, JavaScript for an interactive user experience.

- Backend: Django (Python) for handling data logic and system processes.

- Database: PostgreSQL for structured and efficient data storage.

- Industrial Communication:Node-RED and Snap7 to read PLC values and send updates to the web app. 

- HMI: WinCC Runtime Advanced for real-time machine monitoring and operator interaction.
  #align(
  center,
  block[
    #set align(left)
    #highlight("Technologies used in the Project")
  ],
)
== Hardware Architecture
=== Sorting Machine Prototype
The system is built around a functional prototype of a sorting machine that classifies parts based on physical characteristics such as color and height. The machine includes:

#set list(indent: 1.5cm, spacing: 0.5cm)

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

#figure(
  image("images/tri station_full.png", width: 50%),
  caption: "The Sorting Machine Prototype",
)
#align(
  center,
  block[
    #set align(left)
    #highlight("mention the schema in the annex of the report.")
  ],
)

=== PLC I/O Setup

#figure(
  table(columns: 4, align: center,
  [Référence], [Désignation], [Description], [Adresse], 
  [1B00], [L10], [Capteur vérin 1M1
  en rétraction], [I0.0], 
  [1B01], [L11], [Capteur vérin 1M1
  en extension], [I0.1], 
  [1B02], [mc], [Capteur
  photoélectrique magasin chargé], [I0.2], 
  [1B03], [ms], [Capteur
  micro-switch pièce sortie du magasin], [I0.3], 
  [1B04], [pn], [Capteur
  photoélectrique pièce noire], [I0.4], 
  [1B05], [pm], [Capteur inductif
  pièce métallique], [I0.5], 
  [2B00], [Brm], [Bras 2M1 position
  médiane], [I0.6], 
  [2B01], [Brd], [Bras 2M1 à droite], [I0.7], 
  [3B00], [Cvb], [Convoyeur 3M1
  Position basse], [I1.0], 
  [3B01], [Cvh], [Convoyeur 3M1
  Position haute], [I1.1], 
  [3B02], [Cvm], [Convoyeur 3M1
  Position milieu], [I1.2], 
  [3B03], [L21], [Capteur vérin 3M2
  en extension], [I1.3], 
  [9F1], [fcg], [Capteur fin de
  course gauche], [I1.4], 
  [9F2], [fcd], [Capteur fin de
  course droite], [I8.2], 
  [9B01], [cfr], [Capteur fourchette], [I1.5], 
  [9B02], [L31], [Capteur vérin 9M2
  en extension], [I8.0], 
  [9B03], [-], [Barrière
  photoélectrique], [-], 
  [], [STOP], [Bouton STOP], [I8.3], 
  [], [START], [Bouton START], [I8.4], 
  [], [FC], [Bouton FC], [I8.5], 
  [], [Mode I], [Commutateur Mode I], [I8.6], 
  [], [Mode II], [Commutateur Mode
  II], [I8.7], 
  [1Q00], [V1+], [Sortie Vérin 1M1], [Q0.0], 
  [1Q01], [V1-], [Rentrée Vérin 1M1], [Q0.1], 
  [2Q00], [BG], [Bras 2M1 va à
  gauche], [Q0.2], 
  [2Q01], [BD], [Bras 2M1 va à
  droite], [Q0.3], 
  [2Q02], [GV], [Actionner
  générateur de vide 2M2], [Q0.4], 
  [], [MC], [Montée convoyeur
  3M1], [Q0.5], 
  [], [DC], [Descente convoyeur
  3M1], [Q0.6], 
  [], [V2+], [Sortie vérin 3M2], [Q0.7], 
  [9M1], [M1G], [Moteur 9M1 sens 1], [Q1.0], 
  [], [M1D], [Moteur 9M1 sens 2], [Q1.1], 
  [], [V3+], [Sortie Vérin
  9M2], [Q8.0], 
  [], [H_STOP], [Allumer Voyant du
  bouton STOP], [Q8.1], 
  [], [H_START], [Allumer Voyant du
  bouton START], [Q8.2], 
  [], [H_FC], [Allumer Voyant du
  bouton FC], [Q8.3], 
  [], [LA1], [Allumer Lampe 1], [Q8.4], 
  [], [LA2], [Allumer Lampe 2], [Q8.5], 
  [3A1], [EP], [Capteur Analogique
  mesure épaisseur pièce], [IW64], 
),caption: "I/O tags",

) <tab:tags>
@tab:tags shows the input and output tags of the plc
=== HMI
Hmi panel
=== Pc
pc A,B and C
=== Communucation
#figure(
  image("images/chaart.png", width: 50%),
  caption: "The interaction between the different modules",
)
== Software Architecture
The software system is split into three main layers:
#figure(
  image("images/interaction.png", width: 50%),
  caption: "The interaction between the different modules",
)

=== Plc Layer
#set list(indent: 1.5cm, spacing: 0.5cm)
- Controls sorting logic (e.g., sensor detection → sorting action)

- Stores runtime variables (e.g., part count, status codes) in a Data Block (DB)

- Assigns fault codes based on operating conditions (e.g., sensor errors, jammed parts)
=== Edge Communication Layer
This component bridges the PLC and web application using:

#set list(indent: 1.5cm, spacing: 0.5cm)
- Python + Snap7 library

  - Periodically reads data from DB1 in the PLC

  - Formats the data as JSON

  - Sends it to the web app via a REST API

- Node-RED (alternative visual programming tool)

  - Uses the s7 node to read PLC values

  - Sends updates to the web app

   


=== Web Application Layer (Django)
The Django app provides:
#set list(indent: 1.5cm, spacing: 0.5cm)

- Frontend: A user-friendly interface developed using HTML, CSS, JavaScript, and Bootstrap, allowing operators to interact with the system.

- Backend: Implemented using Django to handle business logic, data processing, and authentication.

- Database: PostgreSQL is used to store user information, work orders, fault logs, and intervention records.

- PLC Integration: The S7-1200 PLC monitors machine states and detects faults in real time. These faults trigger data transmission via a Python script.
  
- Fault Notification System: Once fault data is recorded in the database, the Django backend processes it and updates the web interface. This allows maintenance teams to respond promptly and resolve issues efficiently.

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
