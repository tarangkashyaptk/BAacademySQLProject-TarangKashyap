# Academic Management System — SQL Project
---
# Prepared by: Tarang Kashyap (katarang)

---
## 📌 Project Overview

This project is an **Academic Management System** built in SQL.  
It demonstrates:
- **Database creation**
- **Data insertion**
- **Retrieval operations**
- **Reporting & analytics**

It covers all CRUD basics and core relational database principles.

---

## ✅ Tables Used

**1️ StudentInfo**  
Stores student details: ID, name, DOB, contact info.

**2️ CoursesInfo**  
Stores course details: ID, name, instructor.

**3️ EnrollmentInfo**  
Manages student-course relationships and enrollment status.

---

## ✅ Tasks Included

| Task | Description |
|------|--------------|
| **Task 1** | Create all tables with proper primary and foreign keys |
| **Task 2** | Insert realistic sample data (5+ records per table) |
| **Task 3** | Retrieve student and course info with `JOIN` queries |
| **Task 4** | Reporting & analytics: counts, lists, top enrollments |

---

## ✅ How It Works

### 📌 Task 1: Database Creation
- `StudentInfo`: Basic student details.
- `CoursesInfo`: Course metadata.
- `EnrollmentInfo`: Many-to-many mapping with foreign keys to ensure referential integrity.

### 📌 Task 2: Sample Data
- 5 students with unique IDs, names, contacts.
- 5 courses with instructors.
- Multiple enrollments, covering students enrolled in multiple courses & different statuses.

### 📌 Task 3: Retrieval Queries
- Get students with enrollment status.
- Get courses for specific students.
- Get details of single courses.
- Get details of multiple courses.

### 📌 Task 4: Reporting & Analytics
- Number of students per course.
- Students enrolled in a given course.
- Count of students per instructor.
- Students in multiple courses.
- Courses with the highest enrollments.

---

## ✅ How To Run

1️ Open any SQL client (MySQL Workbench, PostgreSQL, SQL Server, SQLite, etc.)

2️ Run the script step by step, or all at once:
   - Creates tables
   - Inserts sample data
   - Runs test queries

3️ Verify:
   - Use `SELECT *` if needed to confirm raw data.
   - Cross-check query outputs with expected results.

---

## ✅ Expected Output Examples

- **Students with multiple enrollments:** Ethan Hunt is enrolled in 3 courses.
- **Course with most students:** *Database Systems* has 3 enrolled students.
- **Instructor with most students:** *Dr. Alan Turing* teaches the most students.
- **Students in *Database Systems*:** Alice, Charlie, Ethan.

---

## ✅ Edge Cases Covered

- `CHECK` constraint on `ENROLL_STATUS` ensures only valid statuses.
- `FOREIGN KEY` constraints ensure valid references.
- Tested with students having multiple and single enrollments.

---

## ✅ Dependencies

- Any SQL DBMS.
- SQL client to execute.

---

## ✅ Problem Statement & Solution

**Goal:**  
Model a realistic academic database with students, courses, and enrollments.

**Solution:**  
- Normalized tables
- Primary and foreign keys
- Aggregations and joins for reports
- Clean constraints for data integrity

---

## ✅ Deliverable Status

**✔️ Tables Created**  
**✔️ Data Inserted (5+ per table)**  
**✔️ Retrieval Queries Written & Verified**  
**✔️ Reporting Queries Tested**  
**✔️ README**

---

** Project is complete!**
