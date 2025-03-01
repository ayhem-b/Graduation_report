
/* --------------------------------- DO NOT EDIT -------------------------------- */
#import "../Class.typ": *
#show: report.with(isAbstract: false)
#set page(header: none)
#figure(chap("General Introduction"), supplement: [Chapter], numbering: none) // GI
#set page(header: smallcaps(chap_name) + h(1fr) + emph("General Introduction") + line(length: 100%))
#set heading(level: 2, outlined: false)
/* ------------------------------------------------------------------------------ */
// Provide an introduction to your capstone project, including its objectives and significance.

== Context & Motivations

In industrial environments, unplanned equipment failures and inefficient maintenance processes can lead to significant downtime, production losses, and increased operational costs. Traditional maintenance management often relies on manual fault reporting and reactive interventions, which result in delayed responses and ineffective resource allocation. To address these challenges, digital maintenance solutions have been increasingly adopted, combining SCADA systems with CMMS (GMAO) applications to provide real-time fault monitoring, automated reporting, and optimized maintenance workflows.

A SCADA (Supervisory Control and Data Acquisition) system enables real-time monitoring and control of industrial machines and processes. However, most SCADA systems lack a structured maintenance management component, making it difficult to track reported issues and ensure timely interventions. To overcome this limitation, this project focuses on developing an HMI-based fault reporting system integrated with a CMMS web application.

The goal is to create a seamless connection between fault detection (SCADA) and maintenance management (CMMS). This integration will allow operators to report faults directly from an HMI (Human-Machine Interface), automatically notify maintenance teams, and track issue resolution within the CMMS system. The motivation behind this project is to streamline maintenance operations, reduce equipment downtime, and improve the efficiency of industrial maintenance teams.

== Project Objectives

This project aims to design and implement an integrated SCADA and CMMS-based maintenance management system, focusing on the following objectives:

+ Developing an HMI-based fault reporting system that allows operators to report machine faults with a simple interface.
+ Integrating the system with an S7-1200 PLC to collect fault data and trigger automated maintenance alerts.
+ Establishing a communication link between the SCADA system and the CMMS web application to log and manage reported faults.
+ Implementing a notification system that sends automated alerts (SMS or email) to maintenance personnel.
+ Providing real-time dashboards and historical records in the CMMS application for improved decision-making and maintenance planning.

== Detailed Description

=== SCADA-Based HMI Fault Reporting System

The first component of this project is the SCADA-based fault reporting system, developed using WinCC Runtime Professional for the HMI, an S7-1200 PLC for signal processing, and a communication processor (CP) module for SMS notifications. The fault reporting process follows these steps:

+ Fault Detection & Reporting via HMI:
  - The operator selects the affected machine on the HMI interface.
  - A fault report form appears, allowing the operator to describe the issue.
  - The reported fault is logged into the system and sent to the PLC.

+ Automated Fault Notification:
  - The PLC processes the input and sends a command to the CP module.
  - The CP module sends an SMS notification to the maintenance team.

+ Data Logging & Visualization:
  - All reported faults are stored in a centralized database.
  - The SCADA system provides real-time monitoring and displays fault trends.

=== CMMS (GMAO) Web Application & Integration

The second component of the project is the CMMS (GMAO) web application, which provides advanced maintenance management features. This system is developed using Django for the backend, React for the frontend, and PostgreSQL for the database. The integration between SCADA and CMMS ensures that all fault reports are automatically managed and tracked. The CMMS system works as follows:
+ Automatic Fault Logging:
  - When an operator reports a fault on the HMI, it is automatically recorded in the CMMS database.
  - The maintenance team can view real-time fault alerts on the CMMS dashboard.

+ Work Order Generation & Assignment:
  - The CMMS system generates a work order for each reported fault.
  - The maintenance manager assigns the work order to a technician.

+ Maintenance Follow-Up & Resolution:
  - The technician updates the status of the fault (e.g., "In Progress", "Resolved").
  - Once the fault is resolved, the SCADA system updates the machine status.

+ Historical Data & Preventive Maintenance:
  - All maintenance actions are stored in the CMMS for future analysis.
    - The system generates reports for preventive maintenance planning.

=== Significance of the Project

The integration of SCADA-based fault reporting with a CMMS web application offers several key advantages:

+ Real-Time Fault Reporting: Operators can report faults instantly from the HMI, reducing response time.
+ Automated Notifications: Maintenance teams receive immediate alerts via SMS or email.
+ Centralized Maintenance Management: All faults and work orders are logged in a single platform.
+ Improved Decision-Making: Data visualization and historical records help optimize maintenance strategies.
+ Reduced Downtime & Costs: Faster fault resolution improves equipment availability and reduces repair costs.

_By combining SCADA monitoring with CMMS-based maintenance 
racking, this project creates a complete maintenance solution that enhances industrial efficiency and reliability._

// @chp:chap1: #lorem(16)
// @chp:chap2: #lorem(16)
// @chp:chap3: #lorem(16)

