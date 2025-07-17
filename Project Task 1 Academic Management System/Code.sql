-- ================================================================
-- 🎓 Academic Management System - Full Project (Tasks 1 to 4)
-- ================================================================

-- ================================================================
-- DROP TABLES IF THEY EXIST (for repeatable testing)
-- ================================================================
DROP TABLE IF EXISTS EnrollmentInfo;
DROP TABLE IF EXISTS StudentInfo;
DROP TABLE IF EXISTS CoursesInfo;

-- ================================================================
-- ✅ TASK 1: Database Creation
-- ================================================================

-- 1a) Create StudentInfo table
CREATE TABLE StudentInfo (
    STU_ID INT PRIMARY KEY,               
    STU_NAME VARCHAR(100) NOT NULL,       
    DOB DATE NOT NULL,                     
    PHONE_NO VARCHAR(15),                  
    EMAIL_ID VARCHAR(100),                 
    ADDRESS VARCHAR(255)                   
);

-- 1b) Create CoursesInfo table
CREATE TABLE CoursesInfo (
    COURSE_ID INT PRIMARY KEY,             
    COURSE_NAME VARCHAR(100) NOT NULL,     
    COURSE_INSTRUCTOR_NAME VARCHAR(100)    
);

-- 1c) Create EnrollmentInfo table
CREATE TABLE EnrollmentInfo (
    ENROLLMENT_ID INT PRIMARY KEY,         
    STU_ID INT,                            
    COURSE_ID INT,                         
    ENROLL_STATUS VARCHAR(20) CHECK (ENROLL_STATUS IN ('Enrolled', 'Not Enrolled')),
    FOREIGN KEY (STU_ID) REFERENCES StudentInfo(STU_ID),
    FOREIGN KEY (COURSE_ID) REFERENCES CoursesInfo(COURSE_ID)
);

-- ================================================================
-- ✅ TASK 2: Insert at least 5 sample records in each table
-- ================================================================

-- Insert Students
INSERT INTO StudentInfo (STU_ID, STU_NAME, DOB, PHONE_NO, EMAIL_ID, ADDRESS) VALUES
(1, 'Alice Johnson', '2000-05-12', '9876543210', 'alice.johnson@example.com', '123 Main St, City A'),
(2, 'Bob Smith', '1999-11-23', '9876509876', 'bob.smith@example.com', '456 Elm St, City B'),
(3, 'Charlie Davis', '2001-07-15', '9123456789', 'charlie.davis@example.com', '789 Oak St, City C'),
(4, 'Diana Prince', '1998-03-02', '9234567890', 'diana.prince@example.com', '321 Pine St, City D'),
(5, 'Ethan Hunt', '2002-12-09', '9345678901', 'ethan.hunt@example.com', '654 Cedar St, City E');

-- Insert Courses
INSERT INTO CoursesInfo (COURSE_ID, COURSE_NAME, COURSE_INSTRUCTOR_NAME) VALUES
(101, 'Database Systems', 'Dr. Alan Turing'),
(102, 'Data Structures', 'Prof. Grace Hopper'),
(103, 'Operating Systems', 'Dr. Linus Torvalds'),
(104, 'Computer Networks', 'Prof. Radia Perlman'),
(105, 'Algorithms', 'Dr. Donald Knuth');

-- Insert Enrollments
INSERT INTO EnrollmentInfo (ENROLLMENT_ID, STU_ID, COURSE_ID, ENROLL_STATUS) VALUES
(1001, 1, 101, 'Enrolled'),
(1002, 2, 102, 'Enrolled'),
(1003, 3, 101, 'Enrolled'),
(1004, 3, 103, 'Enrolled'),
(1005, 4, 102, 'Enrolled'),
(1006, 4, 104, 'Not Enrolled'),
(1007, 5, 101, 'Enrolled'),
(1008, 5, 102, 'Enrolled'),
(1009, 5, 105, 'Enrolled');

-- ================================================================
-- ✅ TASK 3: Retrieval Queries
-- ================================================================

-- 3a) Retrieve student details with contact info & enrollment status
SELECT
    S.STU_ID,
    S.STU_NAME,
    S.PHONE_NO,
    S.EMAIL_ID,
    CASE 
        WHEN SUM(CASE WHEN E.ENROLL_STATUS = 'Enrolled' THEN 1 ELSE 0 END) > 0 THEN 'Enrolled'
        ELSE 'Not Enrolled'
    END AS OVERALL_ENROLL_STATUS
FROM
    StudentInfo S
LEFT JOIN
    EnrollmentInfo E ON S.STU_ID = E.STU_ID
GROUP BY
    S.STU_ID,
    S.STU_NAME,
    S.PHONE_NO,
    S.EMAIL_ID;

-- 3b) List of courses for a specific student (e.g., STU_ID = 5)
SELECT 
    S.STU_NAME,
    C.COURSE_NAME,
    E.ENROLL_STATUS
FROM 
    StudentInfo S
JOIN 
    EnrollmentInfo E ON S.STU_ID = E.STU_ID
JOIN 
    CoursesInfo C ON E.COURSE_ID = C.COURSE_ID
WHERE 
    S.STU_ID = 5;

-- 3c) Retrieve all course information including instructor
SELECT 
    COURSE_ID,
    COURSE_NAME,
    COURSE_INSTRUCTOR_NAME
FROM 
    CoursesInfo;

-- 3d) Retrieve info for a specific course (e.g., COURSE_ID = 103)
SELECT 
    COURSE_ID,
    COURSE_NAME,
    COURSE_INSTRUCTOR_NAME
FROM 
    CoursesInfo
WHERE 
    COURSE_ID = 103;

-- 3e) Retrieve info for multiple courses (e.g., COURSE_ID IN 101, 104, 105)
SELECT 
    COURSE_ID,
    COURSE_NAME,
    COURSE_INSTRUCTOR_NAME
FROM 
    CoursesInfo
WHERE 
    COURSE_ID IN (101, 104, 105);

-- ================================================================
-- ✅ TASK 4: Reporting & Analytics
-- ================================================================

-- 4a) Number of students enrolled in each course
SELECT 
    C.COURSE_NAME,
    COUNT(E.STU_ID) AS NUMBER_OF_ENROLLED_STUDENTS
FROM 
    CoursesInfo C
LEFT JOIN 
    EnrollmentInfo E ON C.COURSE_ID = E.COURSE_ID AND E.ENROLL_STATUS = 'Enrolled'
GROUP BY 
    C.COURSE_NAME
ORDER BY 
    NUMBER_OF_ENROLLED_STUDENTS DESC;

-- 4b) List of students enrolled in a specific course (e.g., COURSE_ID = 101)
SELECT 
    S.STU_NAME,
    S.PHONE_NO,
    S.EMAIL_ID
FROM 
    StudentInfo S
JOIN 
    EnrollmentInfo E ON S.STU_ID = E.STU_ID
WHERE 
    E.COURSE_ID = 101 AND E.ENROLL_STATUS = 'Enrolled';

-- 4c) Count of enrolled students per instructor
SELECT 
    C.COURSE_INSTRUCTOR_NAME,
    COUNT(E.STU_ID) AS NUMBER_OF_ENROLLED_STUDENTS
FROM 
    CoursesInfo C
LEFT JOIN 
    EnrollmentInfo E ON C.COURSE_ID = E.COURSE_ID AND E.ENROLL_STATUS = 'Enrolled'
GROUP BY 
    C.COURSE_INSTRUCTOR_NAME
ORDER BY 
    NUMBER_OF_ENROLLED_STUDENTS DESC;

-- 4d) Students enrolled in multiple courses
SELECT 
    S.STU_NAME,
    COUNT(E.COURSE_ID) AS ENROLLED_COURSES
FROM 
    StudentInfo S
JOIN 
    EnrollmentInfo E ON S.STU_ID = E.STU_ID AND E.ENROLL_STATUS = 'Enrolled'
GROUP BY 
    S.STU_NAME
HAVING 
    COUNT(E.COURSE_ID) > 1;

-- 4e) Courses with highest enrollments (descending)
SELECT 
    C.COURSE_NAME,
    COUNT(E.STU_ID) AS NUMBER_OF_ENROLLED_STUDENTS
FROM 
    CoursesInfo C
LEFT JOIN 
    EnrollmentInfo E ON C.COURSE_ID = E.COURSE_ID AND E.ENROLL_STATUS = 'Enrolled'
GROUP BY 
    C.COURSE_NAME
ORDER BY 
    NUMBER_OF_ENROLLED_STUDENTS DESC;