
-- ================================================
Project 4: OLAP Operations — Sales Data Analysis
-- ================================================

-- ================================================
--  Task 1: Database Creation
-- ================================================

-- 1️ Create the database
CREATE DATABASE sales_data_analysis;

-- Connect to the newly created database
\c sales_data_analysis;

-- 2️ Create the sales_sample table
DROP TABLE IF EXISTS sales_sample;

CREATE TABLE sales_sample (
    Product_Id SERIAL PRIMARY KEY,    -- Auto-increment Product_Id
    Region VARCHAR(50),               -- Region (East, West, etc.)
    Sales_Date DATE,                  -- Date of sale
    Sales_Amount NUMERIC(10, 2)       -- Sales amount (int or numeric)
);

-- Explanation:
-- `Product_Id` is the primary key and will auto-increment.
-- `Region` stores geographical regions like East, West, etc.
-- `Sales_Date` stores the date of the sale.
-- `Sales_Amount` holds the sale value with two decimal places.


-- ================================================
--  Task 2: Data Creation
-- ================================================

INSERT INTO sales_sample (Region, Sales_Date, Sales_Amount)
VALUES
    ('East', '2024-01-15', 2500.00),
    ('West', '2024-01-20', 3000.00),
    ('North', '2024-02-01', 1500.00),
    ('South', '2024-02-05', 1800.00),
    ('East', '2024-03-01', 2100.50),
    ('West', '2024-03-10', 3500.75),
    ('North', '2024-04-15', 2750.00),
    ('South', '2024-04-20', 2200.25),
    ('East', '2024-05-05', 5000.00),
    ('West', '2024-05-10', 4500.80);

-- Explanation:
-- Sample data is inserted into the sales_sample table.
-- `Region`: Represents different geographical areas (East, West, North, South).
-- `Sales_Date`: Specifies the date on which the sale occurred.
-- `Sales_Amount`: Represents the amount of money the sale was worth.

-- ================================================
--  Task 3: Perform OLAP operations
-- ================================================

-- 3a Add a column for Product_Name
ALTER TABLE sales_sample
ADD COLUMN Product_Name VARCHAR(50);

-- Example: Assign product names for each row

UPDATE sales_sample SET Product_Name = 'Laptop' WHERE Product_Id = 1;
UPDATE sales_sample SET Product_Name = 'Mobile Phone' WHERE Product_Id = 2;
UPDATE sales_sample SET Product_Name = 'Tablet' WHERE Product_Id = 3;
UPDATE sales_sample SET Product_Name = 'Smartwatch' WHERE Product_Id = 4;
UPDATE sales_sample SET Product_Name = 'Laptop' WHERE Product_Id = 5;
UPDATE sales_sample SET Product_Name = 'Mobile Phone' WHERE Product_Id = 6;
UPDATE sales_sample SET Product_Name = 'Tablet' WHERE Product_Id = 7;
UPDATE sales_sample SET Product_Name = 'Smartwatch' WHERE Product_Id = 8;
UPDATE sales_sample SET Product_Name = 'Laptop' WHERE Product_Id = 9;
UPDATE sales_sample SET Product_Name = 'Mobile Phone' WHERE Product_Id = 10;

-- OLAP Drill Down: Region → Product
SELECT
    Region,
    Product_Name,
    SUM(Sales_Amount) AS Total_Sales
FROM
    sales_sample
GROUP BY
    Region,
    Product_Name
ORDER BY
    Region,
    Product_Name;

-- ================================================
-- 3b OLAP Rollup: From Product level up to Region level
-- ================================================

SELECT
    Region,
    Product_Name,
    SUM(Sales_Amount) AS Total_Sales
FROM
    sales_sample
GROUP BY
    ROLLUP (Region, Product_Name)
ORDER BY
    Region NULLS LAST,
    Product_Name;

-- ================================================
--3c OLAP Cube: Analyze sales by Product, Region, Date
-- ================================================

SELECT
    Region,
    Product_Name,
    Sales_Date,
    SUM(Sales_Amount) AS Total_Sales
FROM
    sales_sample
GROUP BY
    CUBE (Region, Product_Name, Sales_Date)
ORDER BY
    Region NULLS LAST,
    Product_Name NULLS LAST,
    Sales_Date NULLS LAST;
-- ================================================
--3d OLAP Slice: Extract sales for a specific Region
-- ================================================

SELECT
    Region,
    Product_Name,
    Sales_Date,
    Sales_Amount
FROM
    sales_sample
WHERE
    Region = 'East'
ORDER BY
    Sales_Date;

-- ================================================
-- OLAP Slice: Extract sales for a specific Date Range
-- ================================================

SELECT
    Region,
    Product_Name,
    Sales_Date,
    Sales_Amount
FROM
    sales_sample
WHERE
    Sales_Date BETWEEN '2024-03-01' AND '2024-04-30'
ORDER BY
    Sales_Date;

-- ================================================
--3e OLAP Dice: Extract sales for specific Region, Product, and Date Range
-- ================================================

SELECT
    Region,
    Product_Name,
    Sales_Date,
    Sales_Amount
FROM
    sales_sample
WHERE
    Region = 'East'                    -- Region filter
    AND Product_Name = 'Laptop'        -- Product filter
    AND Sales_Date BETWEEN '2024-03-01' AND '2024-05-31' -- Date filter
ORDER BY
    Sales_Date;
