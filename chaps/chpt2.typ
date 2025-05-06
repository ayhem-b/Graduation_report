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

#align(
  center,
  block[
    #set align(left)
    #highlight("mention the schema in the annex of the report.")
  ],
)

=== PLC I/O Setup

#align(
  center,
  block[
    #set align(left)
    #highlight("table of input and output of the PLC")
  ],
)
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


    ```python
    import snap7
    import requests

    plc = snap7.client.Client()
    plc.connect('192.168.0.1', 0, 1)

    while True:
        part_count = plc.db_read(1, 0, 2)
        status_code = plc.db_read(1, 2, 2)
        data = {
            "machine_id": "sorter01",
            "part_count": int.from_bytes(part_count, 'big'),
            "status_code": int.from_bytes(status_code, 'big')
        }
        requests.post("http://your-web-app/api/machine-data/", json=data)
    ```
=== Web Application Layer (Django)
The Django app provides:
#set list(indent: 1.5cm, spacing: 0.5cm)
- API endpoints for receiving data (/api/machine-data/)

- Database models for storing machine status, faults, and - maintenance logs

- User dashboard to visualize real-time data using Chart.js or other libraries

- GMAO module for managing work orders, interventions, and maintenance history

=== PostgreSQL Database
The PostgreSQL database is structured to store various data types, including user information, work orders, fault logs, and intervention records. The database schema is designed to ensure data integrity and efficient querying.
== Data Flow Diagram
#figure(
  image("images/workfolw.png", width: 50%),
  caption: "The interaction between the different modules",
)
== REST API Structure


#figure(
  table(
    columns: (auto, auto, auto),
    [*Endpoint*], [*Method*], [*Description*], [$"/api/machine-data/"$], [$"POST"$], [$"Receives machine data from PLC"$],
  ),
  caption: "API structure",
  ) <tab:api-structure>


== Main Components
- Frontend: A user-friendly interface developed using HTML, CSS, JavaScript, and Bootstrap, allowing operators to interact with the system.

- Backend: Implemented using Django to handle business logic, data processing, and authentication.

- Database: PostgreSQL is used to store user information, work orders, fault logs, and intervention records.

- SCADA Integration: The S7-1200 PLC handles the comunucation task, while WinCC Runtime Professional is used for SCADA visualization of the factory machines.

- PLC Integration: The S7-1200 PLC monitors machine states and detects faults in real time. These faults trigger data transmission via VBScript.

- Data Transmission Mechanism: VBScript is embedded within WinCC Runtime Professional to extract machine data and insert it directly into the PostgreSQL database. The script is triggered by events such as machine failures or specific operator actions.

- Fault Notification System: Once fault data is recorded in the database, the Django backend processes it and updates the web interface. This allows maintenance teams to respond promptly and resolve issues efficiently.

#figure(
  image("images/ERD.png", width: 70%),
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

== Technologies Used

- Frontend: HTML, CSS, JavaScript for an interactive user experience.

- Backend: Django (Python) for handling data logic and system processes.

- Database: PostgreSQL for structured and efficient data storage.

- Industrial Communication: VBScript within WinCC Runtime Professional to enable machine-to-database communication.

- SCADA: WinCC Runtime Professional for real-time machine monitoring and operator interaction.


#heading(level: 2, numbering: none)[Conclusion]
This chapter provided a comprehensive analysis of the system’s design, covering its architecture, components, data flow, and constraints. Figures such as the system architecture diagram, database schema, and fault detection workflow illustrate the working mechanisms in detail. The next chapter will delve into the implementation phase, explaining the technical aspects of development and integration.
