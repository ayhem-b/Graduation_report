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
    ```bash
# we changed the dirictory to our project folder
cd capstone_project\

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
#pagebreak()
 === Technicien Interface
 We created a dedicated screen where technicians can submit intervention reports directly from their dashboard. This form is pre-filled with the technician's name (based on the logged-in user), and allows them to input key information such as fault category, start/end time, and select used spare parts from a dropdown list. Django Forms were used to generate and validate the form, with Bootstrap ensuring a clean and mobile-friendly layout. The folder structure of the 


 @Technicien-interface shows the intervention form interface used by technicians.
 #figure(
  image("images/webapp/add_interv.png"),caption: "The Technicien interface"
 )<Technicien-interface>
 === Admin Interface
For administrators, we implemented a comprehensive dashboard that visualizes maintenance activity in real time. Using Django templates and JavaScript chart librarie  `Chart.js`, we displayed various statistics, such as:

- Number of work orders by status (open, in progress, completed)

- Downtime by location or fault category

- Spare part usage trends
in the code below is  a simplified snippet that  show faults by machine:
#pagebreak()

```js
new Chart(document.getElementById("timelineChart"), {
            type: 'line',
            data: {
                labels: data.timeline.labels,
                datasets: [{
                    label: "Interventions Over Time",
                    backgroundColor: "dc3545",
                    borderColor: "dc3545",
                    data: data.timeline.values,
                    fill: true
                }]
            }
        }); 
        ```


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
== Backend Development
The backend is the inner engine that handles the management of logic, processing of user requests, data transactions, and communication with the PLC. The goal was to develop a robust and modular backend capable of seamlessly integrating the database, user interface, and industrial automation system.

We crafted the backend using Django's MVT framework, in which we could effectively separate concerns while maintaining flexibility and scalability. This structure made it straightforward to deal with users, save intervention logs, manage session authentication, and incorporate external services like Snap7.
we organized our  project by separating concerns into distinct files and apps. This approach allowed us to scale features easily and maintain a clean codebase throughout the development process.
=== Apps
When building a Django project, the `startapp` command is used to create a new component (app) with its own structure (models, views, templates, etc.). Each app is designed to handle a specific piece of the overall system. In our case, we executed:
```bash
python manage.py startapp maintenance_app
```
This created a new directory with the necessary files:
#pagebreak()

- `maintenance_app`
    - `admin.py`
    - `apps.py`
    - `models.py`
    - `views.py`
    - `forms.py`
    - `urls.py`
    - `templates/`
    - `static/`
=== Templates 
To achieve an easy-to-use interface, we relied on Django's template engine to render dynamic HTML based on data from the backend. Django templates allowed us to maintain a clean separation of the presentation and logic layers. We developed all the templates using Bootstrap elements.

We organized the templates into logically arranged sections to suit the user roles and application function. For instance, technicians follow a fault reporting form, and administrators are presented with a dashboard view containing intervention history and machine status.

The @template shows the templates folder

#figure(
    image("image-1.png"),caption: "Templates folder")<template>

*Template Inheritance*

We used a base template `admin_layout.html` to keep our structure consistent across pages:
we code the main layout that is present in every page and then each page extens it like this:
```py
{% extends "admin_layout.html" %}
{% block title %}Technician Dashboard{% endblock %}
{% block content %}
   #Current page content 
{% endblock %} ```



=== views.py

Our `views.py` files handled the logic that connects the frontend with the database:

- For *technicians*, we developed views that render the intervention for and process submissions.
- For *admins*, we created views to list interventions, filter them by date or machine.

```python 
@login_required
def admin(request):
    return render(request, "users/admin.html")

def user_login(request):  # I Renamed the function to avoid conflict with built-in login function
    if request.method == "POST":
        form = AuthenticationForm(data=request.POST)
        if form.is_valid():
            user = form.get_user()
            auth_login(request, user)  # I Used auth_login instead of login 
            if user.is_superuser:
                return redirect("users:admin")
            else:
                return redirect("users:users")         
    else:
        form = AuthenticationForm()
    return render(request, "users/login.html", {"form": form})
```

/*- For *PLC communication*, we set up background views and helper functions that read from the S7-1200 using Snap7 and update machine statuses in real time.

All views used Django’s decorators (`@login_required`) to enforce session control and role restrictions.*/
=== forms.py
To validate forms and make user input easier, we utilized Django's pre-built forms module. This allowed us to rapidly develop safe and organized HTML forms and take advantage of Django's built-in validation support. One of the most important forms we developed was the reporting of machine faults form that enabled the technicians to report faults straightaway via the web interface.
Below is an excerpt from `forms.py`, which defines the InterventionForm. This form maps directly to the Intervention model, ensuring data consistency and simplifying form rendering in templates:
```python
 class InterventionForm(forms.ModelForm):
    class Meta:
        model = Intervention
        fields = [
            "work_order",
            "Machine",
            "received_date",
            "end_date",
            "fault_category",
            "fault_what",
            "fault_why",
            "fault_where",
            "used_spare_parts",
            "comments",
                  ]
        widgets = {
            "work_order": forms.Select(attrs=
            {"class": "form-control", "readonly": True}),
            "received_date": forms.DateTimeInput(attrs=
            {"type": "datetime-local", "class": "form-control"}),
            "end_date": forms.DateTimeInput(attrs=
            {"type": "datetime-local", "class": "form-control"}),
            "fault_category": forms.Select(attrs=
            {"class": "form-control"}),
            "fault_what": forms.Select(attrs=
            {"class": "form-control"}),
            "fault_why": forms.Select(attrs
            ={"class": "form-control"}),
            "fault_where": forms.Select(attrs=
            {"class": "form-control"}),
            "spare_parts": forms.Select(attrs={"class": "form-control"}),
            "Machine": forms.Select(attrs=
            {"class": "form-control"}),
            "comments": forms.Textarea(attrs=
            {"class": "form-control"}),
                    }
        ```

=== urls.py

We organized the routes in `urls.py` to keep navigation and access clear:
```py
from django.urls import path
from .views import intervention_history,intervention_data,machines_charts,work_order,breakdowns,user_work_order,add_intervention,update_inputs,get_inputs,dashboard,write_memory_bit
app_name = 'maintenance'
urlpatterns = [
    path('intervention-history/', intervention_history, name='intervention_history'),
    path('intervention-data/', intervention_data, name='intervention_data'),
    path('machines_charts/', machines_charts, name='machines_charts'),
    path('work_order/', work_order, name='work_order'),
    path('breakdowns/', breakdowns, name='breakdowns'),
    path('user_work-orders',user_work_order, name='user_work_order'),
    path('add_intervention/', add_intervention, name='add_intervention'),
    path('update-inputs/', update_inputs),
    path('update-inputs/', update_inputs),
    path('get-inputs/', get_inputs),
    path('dashboard/', dashboard,name='dashboard'),
   path('write-memory-bit/', write_memory_bit),]
```
=== Models.py
After designing the database schema, we implemented the models in Django using the `models.py` file. Below is the implementation of the Machine model, which plays a central role in tracking equipment status and managing fault reporting workflows.
```python 
class Machine(models.Model):
    STATUS_CHOICES = [
        ('Working', 'Working'),
        ('in_progress', 'In Progress'),
        ('fixed', 'Fixed Now'),
        ('not_fixed', 'Not Fixed'),
    ]
    name = models.CharField(max_length=255)
    # Unique identifier for the machine
    machine_id = models.IntegerField(unique=True) 
    description = models.TextField(blank=True)
    status = models.CharField(max_length=20, choices=STATUS_CHOICES, default='default')

    def __str__(self):
        return f"{self.name} ({self.machine_id}) - {self.description}"


```
=== Communication with the Database (Django ORM)
Django uses an Object-Relational Mapper (ORM) to interact with the database. This means we write Python code, and Django handles the SQL behind the scenes as shown in @orm.

*How it works:*

Models (defined in models.py) are Python classes that represent tables in the database.So when we call `Machine.objects.all()` in a view, Django generates a SQL query like:
```sql
SELECT * FROM machine;
```
And when we save a form or create a new object Django converts that into an ```SQL INSERT INTO SQL``` statement.
This abstraction layer provides:

- Data validation via model field types.

- Referential integrity through ForeignKey and choices.

- Automatic migrations that evolve the database schema with model changes.

#figure(
    image("images/ORM.png"),caption:"Django ORM"
)<orm>

== Snap7 implementation
To establish real-time communication between the web-based monitoring system and the Siemens S7-1200 programmable logic controller (PLC), we implemented the Snap7 client within the Django application.

The implementation followed a modular and fault-tolerant approach, allowing us to query the PLC’s internal memory for machine statuses, operating states, and potential fault codes. These data points were then interpreted and recorded in the system’s database, triggering corresponding updates on the user interface and generating appropriate maintenance records when needed.
=== Plc configuration
On the Siemens side, we defined a dedicated DB to store machine status flags and error codes. These variables were updated automatically by the PLC’s internal logic and served as the primary source of truth for the system's operational state.
we also need to configure the DB


