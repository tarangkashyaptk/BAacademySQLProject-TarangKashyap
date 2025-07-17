-- ================================================================
-- Project 2: Student Database Management System (MySQL)
-- ================================================================

-- ====================
--  Task 1: Database Setup
-- ====================

--️ Create the database
-- This step creates the database.
CREATE DATABASE student_database;

-- Use the newly created database
USE student_database;  -- Switch to the student_database


-- Create the student_table
CREATE TABLE student_table (
    Student_id SERIAL PRIMARY KEY,  -- Unique student ID, auto-increment
    Stu_name TEXT NOT NULL,         -- Student's full name
    Department TEXT,                -- Department name
    email_id VARCHAR(100) UNIQUE,   -- Email ID, should be unique
    Phone_no NUMERIC(10,0),         -- Phone number (10 digits)
    Address TEXT,                   -- Address
    Date_of_birth DATE,             -- DOB
    Gender TEXT CHECK (Gender IN ('Male', 'Female', 'Other')),  -- Gender check
    Major TEXT,                     -- Major subject
    GPA NUMERIC(3,2) CHECK (GPA >= 0 AND GPA <= 10.0), -- GPA between 0.00 and 10.00
    Grade TEXT CHECK (Grade IN ('A','B','C','D','E','F'))  -- Allowed grades
);

-- ====================
--  Task 2: Insert 10 Sample Records
-- ====================

INSERT INTO student_table 
    (Stu_name, Department, email_id, Phone_no, Address, Date_of_birth, Gender, Major, GPA, Grade)
VALUES
    ('Alice Johnson', 'Computer Science', 'alice.johnson@example.com', 9876543210, '123 Main St', '2002-03-15', 'Female', 'AI', 9.85, 'A'),
    ('Bob Smith', 'Mechanical Engineering', 'bob.smith@example.com', 9876509876, '456 Oak St', '2001-06-20', 'Male', 'Robotics', 7.20, 'B'),
    ('Charlie Davis', 'Electrical Engineering', 'charlie.davis@example.com', 9123456789, '789 Pine St', '2002-11-10', 'Male', 'Circuits', 6.90, 'C'),
    ('Diana Prince', 'Business Administration', 'diana.prince@example.com', 9234567890, '321 Maple Ave', '2003-01-25', 'Female', 'Marketing', 8.75, 'A'),
    ('Ethan Hunt', 'Physics', 'ethan.hunt@example.com', 9345678901, '654 Elm St', '2000-09-05', 'Male', 'Quantum Mechanics', 7.40, 'B'),
    ('Fiona Gallagher', 'Psychology', 'fiona.gallagher@example.com', 9456789012, '987 Cedar Rd', '2002-02-18', 'Female', 'Behavioral', 7.10, 'B'),
    ('George Martin', 'Mathematics', 'george.martin@example.com', 9567890123, '147 Spruce St', '2001-12-12', 'Male', 'Statistics', 9.90, 'A'),
    ('Hannah Lee', 'Biology', 'hannah.lee@example.com', 9678901234, '258 Walnut Ave', '2003-05-30', 'Female', 'Genetics', 3.80, 'F'),
    ('Isaac Newton', 'Chemistry', 'isaac.newton@example.com', 9789012345, '369 Birch Blvd', '2000-07-14', 'Male', 'Organic Chem', 4.00, 'D'),
    ('Jenny Wilson', 'History', 'jenny.wilson@example.com', 9890123456, '741 Chestnut St', '2001-04-02', 'Female', 'Modern History', 2.50, 'F');

-- ====================
--  Task 3: Retrieve all students' info sorted by Grade DESCENDING
-- ====================
-- Retrieve all student details and sort by gra
de in descending order (A > B > C > ...)

SELECT *
FROM
    student_table
ORDER BY
    Grade;  -- Higher grades (A) first, then B, C, etc.
    
    
    -- ================================================
--  Task 4: Retrieve information for all male students
-- ================================================
SELECT *
FROM
    student_table
WHERE
    Gender = 'Male';
-- ================================================
--  Task 5: Retrieve students with GPA less than 5.0
-- ================================================
SELECT *
FROM
    student_table
WHERE
    GPA < 5.0;  -- GPA must be less than 5.0

-- ================================================
--  Task 6: Update a student’s email and grade using Student_id
-- ================================================

-- Example: Update Student_id = 3
UPDATE student_table
SET
    email_id = 'new.email@example.com',    -- New email address
    Grade = 'B'                            -- New grade
WHERE
    Student_id = 3;                        -- Specify the student ID

-- Verify the update
SELECT * FROM student_table WHERE Student_id = 3;

-- ================================================
--  Task 7: Retrieve names and ages of students with Grade 'B'
-- ================================================

SELECT
    Stu_name,
    TIMESTAMPDIFF(YEAR, Date_of_birth, CURDATE()) AS Age  -- Calculate age in years
FROM
    student_table
WHERE
    Grade = 'B';

-- ======================================================
--  Task 8: Group by Department & Gender, calculate avg GPA
-- ======================================================

SELECT
    Department,
    Gender,
    AVG(GPA) AS Average_GPA
FROM
    student_table
GROUP BY
    Department,
    Gender;   -- Group by both department and gender


-- ================================================
--  Task 9: Rename student_table to student_info using ALTER TABLE
-- ================================================

ALTER TABLE student_table RENAME TO student_info;

-- ================================================
--  Task 10: Get name of student with highest GPA
-- ================================================

SELECT
    Stu_name,
    GPA
FROM
    student_info  -- Use the renamed table
ORDER BY
    GPA DESC  -- Sort by GPA in descending order
LIMIT 1;     -- Get only the student with the highest GPA

--  All tasks complete!

