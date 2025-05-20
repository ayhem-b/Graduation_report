/* --------------------------------- DO NOT EDIT -------------------------------- */
#import "../Class.typ": *
#show: report.with(isAbstract: false)
#set page(header: none)
#figure(chap(chap3, numbering: "1."), kind: "chapter", supplement: "Chapter") <chp:chap3> // Chapter 3
#set page(header:[
  #set text(10pt)
  #smallcaps(title) 
  #h(1fr) 
  #emph(chap3) 
  #line(length: 100%)])
#set heading(outlined: true, numbering: "1.") 
/* ------------------------------------------------------------------------------ */ 

#heading(level: 2, numbering: none)[Introduction]
In this chapter, we explain the actual development and integration of the proposed IIoT-based monitoring and maintenance system. We divided the development into two main layers: edge data acquisition, and the Django-based web application. Each component played a key role in enabling real-time monitoring, fault reporting, and maintenance management.



==  Environment Setup
===  virtual environment
In order to maintain a clean and organized development setup, we used a virtual environment to create an isolated Python environment for our project. This allowed us to manage our dependencies separately from other projects or the system-wide Python installation. It was especially useful since we were working on multiple tools that might require different package versions.
/*
#align(
  center,
 block(

  width: 70%,
 
  fill: luma(96.55%),
  inset: 8pt,
  radius: 8pt,
  */
    ```bash
# we changed the dirictory to our project folder
cd /capstone_project

# We created a virtual environment named 'venv'
python -m venv venv

# This how we activate the virtual environment each time

venv\Scripts\activate
# Install Django

# We installed Django , Snap7 & Requirments packages
pip install django
pip install python-snap7
pip install requirements.txt -r

# When we're done, we deactivate the virtual environment with 
deactivate
    ```

=== Requirments
- `psycopg2-binary`
    - Why we need it: It allows Django to communicate with a PostgreSQL database.


    - Used for: ORM queries, migrations, database access.


- `sqlparse`
    - Why you need it:

        - Used internally by Django to format and parse SQL statements.

        - Helps in operations like pretty-printing raw SQL in logs or admin.

    - Used for: Debugging SQL queries, Django's sqlmigrate command, and other internal formatting tasks.




== User interface 

Through our implementation process, we designed user-friendly interfaces for the technicians and the administrators to use while interacting with the CMMS system. The logic of every form and dashboard is governed by Django views and templates, dynamically rendered based on the user's role.

 _For more comprehensive coverage, consult Appendix H _
=== Authentication
In this section, we designed a user-friendly authentication view  as shown in @login to serve as the entry point to our web application. We implemented a simple and responsive interface that allows users to log in securely using their credentials. Through this view, we control access to the system and direct users to their respective dashboards based on their roles, whether they are technicians or administrators.
#figure(
    image("images/webapp/login.png"),caption: "the Login page"
)<login>
 === Technicien Interface
 We created a dedicated screen where technicians can submit intervention reports directly from their dashboard. This form is pre-filled with the technician's name (based on the logged-in user), and allows them to input key information such as fault category, start/end time, and select used spare parts from a dropdown list. Django Forms were used to generate and validate the form, with Bootstrap ensuring a clean and mobile-friendly layout.


 @Technicien-interface shows the intervention form interface used by technicians.
 #figure(
  image("images/webapp/add_interv.png"),caption: "The Technicien interface"
 )<Technicien-interface>
 === Admin Interface
For administrators, we implemented a comprehensive dashboard that visualizes maintenance activity in real time. Using Django templates and JavaScript chart libraries like Chart.js, we displayed various statistics, such as:

- Number of work orders by status (open, in progress, completed)

- Downtime by location or fault category

- Spare part usage trends
Cards and alert boxes were styled using Bootstrap’s “danger” theme to highlight urgent issues, with each card dynamically updated from the database.
@dash illustrates the administrator dashboard with visual indicators and real-time statistics.
These dashboards help maintenance managers make data-driven decisions and quickly assess factory health.
#figure(
    image("images/webapp/dash.png"),caption: "Admin's Dashboard"
)<dash>

*Navigation*

The navigation bar allows users to move between modules such as "Work Orders", "Interventions", and "Spare Parts", with the interface adapting to their permissions.
@nav displays the navigation layout for an admin user.
#figure(
    image("images/webapp/nav.png",width: 28%),caption: "Admin's Navbar"
)<nav>
== Backend