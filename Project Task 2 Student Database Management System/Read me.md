# Project 2: Student Database Management System (MySQL)

---
# Prepared by: Tarang Kashyap (katarang)

---

✅ Project Objective

This project designs and implements a Student Database Management System using MySQL. The system stores, updates, retrieves, and analyzes student information efficiently through SQL queries.


---

✅ Database Design Overview

Database: student_database
Main Table: student_table (renamed later to student_info)

Column	Data Type	Details / Constraints

Student_id	SERIAL	Auto-incremented unique ID, PRIMARY KEY
Stu_name	TEXT	Full student name, NOT NULL
Department	TEXT	Department name
email_id	VARCHAR(100)	Unique email address
Phone_no	NUMERIC(10)	10-digit phone number
Address	TEXT	Student address
Date_of_birth	DATE	Date of birth
Gender	TEXT	Must be 'Male', 'Female', or 'Other'
Major	TEXT	Major subject
GPA	NUMERIC(3,2)	Must be between 0.00 and 4.00
Grade	TEXT	Allowed: A, B, C, D, E, F

---

✅ Tasks Completed


| Task | Description |
|------|-------------|
| 1 | Setup database `student_database` and create `student_table` with proper columns, data types, constraints. |
| 2 | Insert 10 realistic student records into the table. |
| 3 | Retrieve all student info sorted by grade descending. |
| 4 | Retrieve all male students from the `student_table`. |
| 5 | Retrieve students with GPA less than 5.0. |
| 6 | Update a student’s email and grade by `Student_id`. |
| 7 | Retrieve names and ages of students with Grade 'B'. |
| 8 | Group by `Department` and `Gender` to calculate average GPA for each group. |
| 9 | Rename the table `student_table` to `student_info`. |
| 10 | Retrieve the name of the student with the highest GPA. |


---

✅ SQL Keywords Used

CREATE DATABASE, USE

CREATE TABLE

INSERT INTO

SELECT, WHERE, ORDER BY, GROUP BY

UPDATE

ALTER TABLE RENAME

TIMESTAMPDIFF and CURDATE()

LIMIT



---

✅ How to Run

1. Copy the full `.sql` file into your MySQL client (e.g., MySQL Workbench).
2. Execute the script **from top to bottom**:
   - The `CREATE DATABASE` and `USE` switch to the correct DB.
   - The `CREATE TABLE` sets up the structure.
   - The `INSERT` section loads sample data.
   - The rest are standalone queries — run them one by one.
3. Verify results:
   - Use `SELECT * FROM student_info;` to see updated data.
   - Use `DESCRIBE student_info;` to inspect the table.


---


✅ Notes

- **Auto-Increment**: `Student_id` is auto-generated.
- **Tested**: The queries work as intended with the sample data.

---
✅ Example Outputs

-10 students stored.

-Queries filter male students, GPA filters, age calculation, grouping, and max GPA work correctly.

-Table is renamed and verified.



---

✅ Data Integrity

Gender restricted to Male, Female, Other.

Grade restricted to A–F.

GPA must be 0.00–4.00.

email_id must be unique.



---

✅ Learning Outcomes

Creating DB and tables with constraints.

Inserting realistic sample data.

Writing SELECT, UPDATE, GROUP BY queries.

Using aggregate functions.

Renaming tables.

Project Status

---

✅ All tasks have been tested and verified to run error-free in MySQL.

---

** Project is complete!**