/* --------------------------------- DO NOT EDIT -------------------------------- */
#import "../Class.typ": *
#show: report.with(isAbstract: false)
#set page(header: none)
#figure(chap("General Conclusion"), supplement: [Chapter], numbering: none) // GC

#set page(header:[
  #set text(10pt)
  #smallcaps(title) 
  #h(1fr) 
  #emph("General Conclusion") 
  #line(length: 100%)])
#set heading(level: 2, outlined: false) 
/* ------------------------------------------------------------------------------ */ 

// Summarize the key findings and conclusions of your capstone project.

== Discussion
The completion of this project represents a significant step toward the digital transformation of industrial maintenance at Lear Corporation Menzel Bourguiba. By developing and deploying an integrated system combining a GMAO (Computerized Maintenance Management System) with a custom web-based SCADA dashboard, we successfully bridged the gap between real-time machine monitoring and maintenance operations.

A fully integrated dashboard within the web application, communicating directly with the factory’s S7-1200 PLCs using the Snap7 protocol. This decision aligns the project with Industry 4.0, embracing connectivity, interoperability, and real-time data handling.

The final system enables:

- Real-time monitoring of machine states directly from the web dashboard.

- Fault signaling through an intuitive HMI interface.


- Centralized management of work orders, interventions, and machine histories.

- Statistical analysis and visualization of key maintenance indicators.

By leveraging modern technologies such as Django, React, PostgreSQL, and Snap7, we built a modular and scalable platform capable of evolving with future needs. The system not only improves fault response time and traceability but also establishes a smart maintenance framework that supports predictive analytics and data-driven decision-making.

This project reflects the potential of modern web technologies when applied to industrial environments and showcases a practical implementation of Industry 4.0 concepts in a real-world setting. It serves as a foundation for further innovation in digital maintenance and intelligent factory systems.



== Future Work
In order to further strengthen the capabilities and impact of the developed system, several potential avenues for future enhancement can be considered.

1. Integration of Predictive Maintenance:
The implementation of predictive maintenance strategies represents a natural evolution of the current system. By leveraging historical fault data and integrating machine learning algorithms, it would be possible to predict potential equipment failures before they occur. This proactive approach could significantly reduce unplanned downtime, optimize maintenance scheduling, and extend the operational lifespan of critical assets.

2. Enhanced System Flexibility for Multi-Machine Environments:
Adapting the platform to support a wider range of machine types and configurations is another important area for development. By making the system architecture modular and easily configurable, it could be deployed across various production lines with minimal customization. This would increase the system’s applicability and scalability within diverse industrial environments.

3. Implementation of Editable and Interactive Data Visualization Tools:
Future iterations of the system could benefit from incorporating interactive and customizable data visualization features. Enabling users to modify chart parameters, apply filters based on key performance indicators (KPIs), and define custom time ranges would enhance decision-making by offering more targeted and insightful analysis of maintenance data.

These enhancements would not only improve the system's functionality and user experience but would also ensure continued alignment with the core principles of Industry 4.0, fostering the development of a truly intelligent, adaptive, and connected maintenance management ecosystem.


