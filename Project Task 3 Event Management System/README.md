---# Project 3: Event Management System
---
---# Prepared by: Tarang Kashyap (katarang)

---

---# Objective

Design and implement an Event Management System using PostgreSQL.
This project demonstrates how to:

Create & manage events

Track attendees

Handle event registrations

Generate useful reports & statistics



---

# Database Details

Database Name: EventsManagement

The project uses a normalized relational schema with three core tables:


---

✅ 1️ Events

Column	Data Type	Description

Event_Id	SERIAL	Primary Key, auto-incremented
Event_Name	TEXT	Name of the event
Event_Date	DATE	Date of the event
Event_Location	TEXT	Location of the event
Event_Description	TEXT	Short description of the event



---

✅ 2️ Attendees

Column	Data Type	Description

Attendee_Id	SERIAL	Primary Key, auto-incremented
Attendee_Name	TEXT	Full name of the attendee
Attendee_Phone	VARCHAR	Phone number
Attendee_Email	VARCHAR	Email (unique)
Attendee_City	TEXT	City of the attendee



---

✅ 3️ Registrations

Column	Data Type	Description

Registration_id	SERIAL	Primary Key, auto-incremented
Event_Id	INTEGER	Foreign Key → Events(Event_Id)
Attendee_Id	INTEGER	Foreign Key → Attendees(Attendee_Id)
Registration_Date	DATE	Date of registration
Registration_Amount	NUMERIC	Amount paid for registration


Foreign Keys:

Registrations links Events and Attendees, enforcing referential integrity.



---

✅ Tasks Completed


---

# Task 1: Database & Tables

Created EventsManagement database.

Created Events, Attendees, and Registrations tables.

Defined Primary Keys & Foreign Keys with ON DELETE CASCADE for clean deletion of related data.



---

# Task 2: Insert Sample Data

Inserted realistic sample records for:

Events (5 events)

Attendees (5 attendees)

Registrations (7 registrations covering multiple event-attendee combinations)



---

# Task 3: Manage Events

✅ Insert: Added a new event record
✅ Update: Updated details for an existing event (name, location, description)
✅ Delete: Deleted an event by Event_Id


---

# Task 4: Manage Attendees & Registrations

✅ Inserted a new attendee
✅ Registered an attendee for an event using the Registrations table


---

# Task 5: Queries & Reports

Created key reporting queries:

Retrieve all event information

Generate attendee list for each event (with JOINs)

Calculate:

Total attendees per event

Total revenue per event




---

# Key SQL Concepts Demonstrated

SERIAL for auto-increment IDs

PRIMARY KEY & FOREIGN KEY constraints with cascading behavior

INSERT, UPDATE, DELETE statements

JOIN operations for combining tables

GROUP BY with COUNT and SUM for statistics

Sorting and filtering with ORDER BY



---

✅ How to Run

1️ Create the database

CREATE DATABASE EventsManagement;

2️ Connect to it

Use EventsManagement

3️ Run table creation scripts

4️ Insert sample data

5️ Perform CRUD operations and execute reporting queries


---
# Expected Output

Tables created with valid relationships

Sample data inserted correctly

Reports return:

Clean event details

Linked attendee lists

Accurate attendance count

Correct total revenue per event




---

# Dependencies

PostgreSQL (Recommended version 12+)

psql or any SQL GUI



---

# Highlights

✅ Solid example of a relational event system
✅ Demonstrates data integrity and relationship management
✅ Practical reporting & analytics with SQL JOINs and AGGREGATE functions


---
** Project is complete!**
