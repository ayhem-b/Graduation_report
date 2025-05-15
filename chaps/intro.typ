
/* --------------------------------- DO NOT EDIT -------------------------------- */
#import "../Class.typ": *
#show: report.with(isAbstract: false)
#set page(header: none)
#figure(chap("General Introduction"), supplement: [Chapter], numbering: none) // GI
#set page(header:[
  #set text(10pt)
  #smallcaps(title) 
  #h(1fr) 
  #emph("General Introduction") 
  #line(length: 100%)])
#set heading(level: 2, outlined: false)
/* ------------------------------------------------------------------------------ */
// Provide an introduction to your capstone project, including its objectives and significance.

== Background

While Industry 4.0 is developing at a fast pace, industrial systems are increasingly connected by the Industrial Internet of Things (IIoT). The technologies are designed to digitalize production environments in order to enable real-time monitoring, predictive maintenance, and data-driven decision-making.

In most small to medium-sized manufacturing plants, machine monitoring is mostly reactive in nature, thus resulting in delays in fault detection and manual recording of maintenance procedures. Although conventional SCADA systems provide extensive monitoring functionality, they usually have a high cost, are beset by complexity in deployment, and may not be adequately customized to meet the unique requirements of each and every plant.

This project is motivated by the necessity to create an economical and versatile IIoT system capable of real-time monitoring and integration with a maintenance platform (CMMS/GMAO) for better responsiveness and efficiency.

== Motivation
At Lear Corporation's Menzel Bourguiba factory, one use case stood out as being especially important and highly relevant: it was a sorting machine that had a number of faults and malfunctions. In addition, and arguably even more importantly, the production data of this machine were not being tracked in real time. This lack of immediate and granular trend data on the performance of the machine gave rise to a host of issues and challenges. Among these issues were the following:

  - The fault-finding process and instituting required interventions have been greatly postponed.

  - The manual process of logging faults and scheduling maintenance activities

  - There has been a total lack of any analysis of historical data when it comes to predictive or preventive maintenance.

To properly address and overcome these current limitations, it became clear that a new, web-enabled platform was imperative one that would have the ability to interface natively with the Siemens S7-1200 PLC, which operates the sorting machine. Further, this platform would need to have the ability to report and visualize key operational data and any faults that occur, all in a highly accessible format on an all-encompassing web dashboard.


/ @chp:chap1: This chapter introduces the company, outlines the project context and identifies the problem
/ @chp:chap2: An overview of the system architecture,Machine program, key elements, workflow, and technology is given in this chapter
/ @chp:chap3: This chapter discusses how to develop and assemble the IIoT-based monitoring and maintenance system. 