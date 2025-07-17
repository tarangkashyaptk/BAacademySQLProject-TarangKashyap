# BAacademySQLProject-TarangKashyap





BA ACADEMY 2025
SQL Capstone Project (A) BA - B1
PROJECTS REPORT






TARANG KASHYAP
katarang@amazon.com
 



Table of Contents

1.	Introduction
2.	Objective
3.	Learning
4.	Technologies/Tools Used
5.	Project 1: Academic Management System
6.	Project 2: Student Database Management System
7.	Project 3: Event Management System
8.	Project 4: OLAP Operations








Introduction: 
This report presents the combined work for four structured SQL projects covering practical database design, normalization, data manipulation, reporting, and OLAP operations. Each project demonstrates hands-on application of database concepts and SQL programming to solve real-world data management scenarios.

Objective:
The objective is to design, implement, and demonstrate various database management systems and analytical solutions using SQL, applying concepts such as table design, relationships, constraints, data insertion, CRUD operations, and OLAP techniques.

Learning:
•	Understanding of relational database design principles
•	Use of Primary Key and Foreign Key constraints
•	Data insertion, updates, deletions, and integrity constraints
•	Use of aggregate functions, grouping, sorting, and joins
•	Application of OLAP operations (Drill Down, Rollup, Cube, Slice, Dice)
•	Practical SQL coding in MySQL and PostgreSQL

Technologies/Tools Used:
•	MySQL
•	PostgreSQL
•	SQL syntax and query editors (pgAdmin, MySQL Workbench)
•	ER Diagrams (Draw.io or Lucidchart)





	 Project 1: Academic Management System

Project Scope:
Design a system to manage student information and course enrollment with three tables: StudentInfo, CoursesInfo, and EnrollmentInfo.

Database Design:
•	StudentInfo: STU_ID, STU_NAME, DOB, PHONE_NO, EMAIL_ID, ADDRESS
•	CoursesInfo: COURSE_ID, COURSE_NAME, COURSE_INSTRUCTOR
•	EnrollmentInfo: ENROLLMENT_ID, STU_ID (FK), COURSE_ID (FK), ENROLL_STATUS

Table Structure:
Normalized to handle student data, courses, and enrollment status with referential integrity.

Entity Relationship Diagram:
 


Data Insertion:
Sample records were inserted in each table to simulate real enrollments.

Queries Executed:
•	Retrieve student details and enrollment status
•	Retrieve list of courses for a student
•	Retrieve course details
•	Join queries for reports (number of students per course, per instructor, multiple enrollments)
SQL Concepts Demonstrated:
•	CREATE, INSERT, SELECT, JOIN, GROUP BY
•	FOREIGN KEY constraints
•	Subqueries and conditional statements

Expected Output:
Accurate student-course enrollment reports.

How to Execute:
Run CREATE TABLE scripts, insert data, execute queries.

Conclusion:
The Academic Management System successfully demonstrates relational design and reporting.



	 Project 2: Student Database Management System

Project Scope:
Create a complete student database for storing detailed student records with validation.

Database Design:
student_info table with: Student_id, Stu_name, Department, email_id, Phone_no, Address, Date_of_birth, Gender, Major, GPA, Grade.

Table Structure:
Single-table design with unique constraints and checks on Gender, GPA, and Grade.

Entity Relationship Diagram:
 
Data Insertion:
10 diverse student records.


Queries Executed:
•	Retrieve all students ordered by grade
•	Retrieve male students
•	Retrieve students with GPA < 5
•	Update student email and grade
•	Group by Department & Gender
•	Rename table
•	Retrieve student with highest GPA

SQL Concepts Demonstrated:
•	Constraints: PRIMARY KEY, UNIQUE, CHECK
•	SELECT, UPDATE, GROUP BY, ORDER BY, ALTER TABLE

Expected Output:
Clean student information with integrity.

How to Execute:
Create the database, use USE student_database, run table creation, insert data, and execute queries.

Conclusion:
This project builds solid practice in table creation and data integrity enforcement.





	 Project 3: Event Management System

Project Scope:
Develop a system to manage events, attendees, and registrations.

Database Design:
•	Events: Event_Id, Event_Name, Event_Date, Event_Location, Event_Description
•	Attendees: Attendee_Id, Attendee_Name, Attendee_Phone, Attendee_Email, Attendee_City
•	Registrations: Registration_id, Event_Id (FK), Attendee_Id (FK), Registration_Date, Registration_Amount

Table Structure:
Proper normalized structure with foreign keys linking attendees to events.

Entity Relationship Diagram:





	




Data Insertion:
Sample events, attendees, and registrations.

Queries Executed:
•	Insert, update, delete events
•	Add new attendees
•	Register attendees
•	Reporting: attendee lists, total attendees per event, total revenue per event

SQL Concepts Demonstrated:
Joins, GROUP BY, SUM, COUNT, DELETE, UPDATE

Expected Output:
Event reports showing registrations and revenue.

How to Execute:
Create the EventsManagement database, tables, insert data, and run queries.

Conclusion:
The Event Management System illustrates relationship handling and reporting for event organizers.




	 Project 4: OLAP Operations

Project Scope:
Perform OLAP analysis to understand sales data using Drill Down, Rollup, Cube, Slice, and Dice operations.

Database Design:
sales_sample table: Product_Id, Region, Sales_Date, Sales_Amount, Product_Name.

Table Structure:
Simple sales dataset with multiple dimensions: Region, Product, Date.

Entity Relationship Diagram:
sales_sample
Product_Id (PK)  
Region   
Sales_Date  
Sales_Amount  
Product_Name

Data Insertion:
10 sales records with varied regions, products, and dates.

Queries Executed:
•	Drill Down: Region → Product level
•	Rollup: Product → Region → Grand Total
•	Cube: All possible combinations of Region, Product, Date
•	Slice: Filter by Region or Date Range
•	Dice: Filter by Region + Product + Date Range


SQL Concepts Demonstrated:
•	GROUP BY with ROLLUP and CUBE
•	Aggregate functions (SUM)
•	WHERE filtering for Slice and Dice

Expected Output:
Detailed sales insights across dimensions.

How to Execute:
Create the table, insert data, run each OLAP query to check summaries and breakdowns.

Conclusion:
This project demonstrates OLAP capabilities for advanced sales data analysis.


			x-----------------------------------------------x
