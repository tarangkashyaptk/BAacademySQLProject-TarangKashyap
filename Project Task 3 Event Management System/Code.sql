-- ============================================
--  Project 3: Event Management System (PostgreSQL)
-- ============================================

-- Create the database
-- This must be run in a separate session or using psql.

CREATE DATABASE EventsManagement;

-- Connect to the new database before creating tables.
Use EventsManagement;

-- 1: Create the Events table
CREATE TABLE Events (
    Event_Id SERIAL PRIMARY KEY,                  -- Unique Event ID, auto-increment
    Event_Name TEXT NOT NULL,                     -- Event Name
    Event_Date DATE NOT NULL,                     -- Event Date
    Event_Location TEXT,                          -- Location of the event
    Event_Description TEXT                        -- Event Description
);

-- 1: Create the Attendees table
CREATE TABLE Attendees (
    Attendee_Id SERIAL PRIMARY KEY,               -- Unique Attendee ID
    Attendee_Name TEXT NOT NULL,                  -- Name of the attendee
    Attendee_Phone VARCHAR(15),                   -- Phone number
    Attendee_Email VARCHAR(100) UNIQUE,           -- Email must be unique
    Attendee_City TEXT                            -- City of the attendee
);

-- 1: Create the Registrations table
CREATE TABLE Registrations (
    Registration_id SERIAL PRIMARY KEY,           -- Unique Registration ID
    Event_Id INTEGER REFERENCES Events(Event_Id) ON DELETE CASCADE,  -- Foreign Key
    Attendee_Id INTEGER REFERENCES Attendees(Attendee_Id) ON DELETE CASCADE, -- Foreign Key
    Registration_Date DATE NOT NULL,              -- Date of registration
    Registration_Amount NUMERIC(10,2)             -- Amount paid for registration
);

-- ============================================
-- 2 Insert Sample Data to Tables
-- ============================================
-- ============================================
--  Insert Sample Data for Events
-- ============================================

INSERT INTO Events (Event_Name, Event_Date, Event_Location, Event_Description)
VALUES
('Tech Conference 2024', '2024-10-15', 'New York', 'Annual technology conference.'),
('Startup Meetup', '2024-09-05', 'San Francisco', 'Networking event for startups.'),
('Music Festival', '2024-11-20', 'Los Angeles', 'Live music performances by various artists.'),
('Art Exhibition', '2024-08-25', 'Chicago', 'Modern art showcase.'),
('Business Workshop', '2024-12-10', 'Boston', 'Workshop for young entrepreneurs.');

-- ============================================
--  Insert Sample Data for Attendees
-- ============================================

INSERT INTO Attendees (Attendee_Name, Attendee_Phone, Attendee_Email, Attendee_City)
VALUES
('Alice Johnson', '1234567890', 'alice.johnson@example.com', 'New York'),
('Bob Smith', '2345678901', 'bob.smith@example.com', 'San Francisco'),
('Charlie Davis', '3456789012', 'charlie.davis@example.com', 'Los Angeles'),
('Diana Prince', '4567890123', 'diana.prince@example.com', 'Chicago'),
('Ethan Hunt', '5678901234', 'ethan.hunt@example.com', 'Boston');

-- ============================================
--  Insert Sample Data for Registrations
-- ============================================

INSERT INTO Registrations (Event_Id, Attendee_Id, Registration_Date, Registration_Amount)
VALUES
(1, 1, '2024-08-01', 150.00),
(2, 2, '2024-08-02', 100.00),
(3, 3, '2024-08-03', 200.00),
(4, 4, '2024-08-04', 80.00),
(5, 5, '2024-08-05', 120.00),
(1, 2, '2024-08-06', 150.00),  -- Bob also registers for Tech Conference
(2, 3, '2024-08-07', 100.00); -- Charlie also registers for Startup Meetup


-- ============================================
-- 3a Insert a new Event into Events table
-- ============================================

INSERT INTO Events (Event_Name, Event_Date, Event_Location, Event_Description)
VALUES
('Health & Wellness Summit', '2024-10-30', 'Seattle', 'Summit focused on health, fitness, and wellness topics.');

-- ============================================
-- 3b Update an existing Event’s information
-- Example: Update Event_Id = 1
-- ============================================

UPDATE Events
SET
    Event_Name = 'Tech Innovators Conference 2024',
    Event_Location = 'New York City',
    Event_Description = 'Updated annual conference for technology innovators.'
WHERE
    Event_Id = 1;  -- Specify which event to update

-- ============================================
-- 3c Delete an Event by Event_Id
-- Example: Delete Event_Id = 4
-- ============================================

DELETE FROM Events
WHERE
    Event_Id = 4;  -- This will remove the 'Art Exhibition'

-- ============================================
-- 4a Insert a new Attendee into Attendees table
-- ============================================

INSERT INTO Attendees (Attendee_Name, Attendee_Phone, Attendee_Email, Attendee_City)
VALUES
('Fiona Gallagher', '6789012345', 'fiona.gallagher@example.com', 'Seattle');

-- ============================================
-- 4b Register an Attendee for an Event
-- Example: Register Fiona (Attendee_Id = 6) for the new Health & Wellness Summit (Event_Id = 6)
-- ============================================

INSERT INTO Registrations (Event_Id, Attendee_Id, Registration_Date, Registration_Amount)
VALUES
(6, 6, '2024-08-10', 75.00);

-- ============================================
-- 5a Retrieve all event information
-- ============================================

SELECT
    Event_Id,
    Event_Name,
    Event_Date,
    Event_Location,
    Event_Description
FROM
    Events
ORDER BY
    Event_Date;  -- Sort events by date


-- ============================================
-- 5b Retrieve list of attendees for each event
-- Shows Event Name + Attendee Details
-- ============================================

SELECT
    E.Event_Name,
    E.Event_Date,
    A.Attendee_Name,
    A.Attendee_Email,
    A.Attendee_Phone,
    A.Attendee_City,
    R.Registration_Date,
    R.Registration_Amount
FROM
    Events E
JOIN
    Registrations R ON E.Event_Id = R.Event_Id
JOIN
    Attendees A ON R.Attendee_Id = A.Attendee_Id
ORDER BY
    E.Event_Name,
    A.Attendee_Name;

-- ============================================
-- 5c Count how many attendees are registered for each event
-- ============================================

SELECT
    E.Event_Name,
    COUNT(R.Registration_id) AS Total_Attendees
FROM
    Events E
LEFT JOIN
    Registrations R ON E.Event_Id = R.Event_Id
GROUP BY
    E.Event_Name
ORDER BY
    Total_Attendees DESC;  -- Highest attendance first

-- ============================================
-- 5d Sum total Registration Amount per Event
-- ============================================

SELECT
    E.Event_Name,
    SUM(R.Registration_Amount) AS Total_Revenue
FROM
    Events E
LEFT JOIN
    Registrations R ON E.Event_Id = R.Event_Id
GROUP BY
    E.Event_Name
ORDER BY
    Total_Revenue DESC;  -- Highest revenue first
