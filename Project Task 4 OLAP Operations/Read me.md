
# Project 4: OLAP Operations — Sales Data Analysis

---
# Prepared by: Tarang Kashyap (katarang)

---

# Objective

The goal of this project is to demonstrate the use of OLAP operations (Drill Down, Rollup, Cube, Slice, and Dice) to analyze and extract meaningful insights from a sales dataset.
The operations were performed using PostgreSQL.


---

✅ Tasks Completed


---

1️ Database & Table Creation

Database: EventsManagement
(If using PostgreSQL, create the database first using CREATE DATABASE and connect to it)

Table: sales_sample with columns:

Product_Id (INTEGER)

Region (VARCHAR(50)) — e.g., East, West

Sales_Date (DATE)

Sales_Amount (NUMERIC)

Product_Name (Added to make product-level analysis meaningful)



CREATE TABLE sales_sample (
    Product_Id SERIAL PRIMARY KEY,
    Region VARCHAR(50),
    Sales_Date DATE,
    Sales_Amount NUMERIC,
    Product_Name VARCHAR(50)
);


---

2️ Data Insertion

10 sample records were inserted into the sales_sample table, covering different products, regions, and dates.

Example:

INSERT INTO sales_sample (Region, Sales_Date, Sales_Amount, Product_Name)
VALUES
('East', '2024-03-15', 2500, 'Laptop'),
('West', '2024-03-20', 1800, 'Mobile Phone'),
-- add more rows as needed
;


---

3️ OLAP Operations

✅ a) Drill Down

> Analyze sales at a more detailed level, from Region → Product.



SELECT
  Region,
  Product_Name,
  SUM(Sales_Amount) AS Total_Sales
FROM
  sales_sample
GROUP BY
  Region, Product_Name
ORDER BY
  Region, Product_Name;


---

✅ b) Rollup

> Summarize sales data at multiple levels, from Product → Region → Grand Total.



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


---

✅ c) Cube

> Generate all possible combinations of Region, Product, and Date for multi-dimensional analysis.



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


---

✅ d) Slice

> Extract a subset of sales for a specific region or date range.



Slice by Region:

SELECT * FROM sales_sample
WHERE Region = 'East';

Slice by Date Range:

SELECT * FROM sales_sample
WHERE Sales_Date BETWEEN '2024-03-01' AND '2024-04-30';


---

✅ e) Dice

> Extract a sub-cube using multiple dimensions.



SELECT
  Region,
  Product_Name,
  Sales_Date,
  Sales_Amount
FROM
  sales_sample
WHERE
  Region = 'East'
  AND Product_Name = 'Laptop'
  AND Sales_Date BETWEEN '2024-03-01' AND '2024-05-31'
ORDER BY
  Sales_Date;


---

# Key Concepts Applied

Drill Down: From region to product-level analysis.

Rollup: Aggregates subtotals and grand totals.

Cube: Multi-dimensional summaries for deep insights.

Slice: Isolates single-dimension segments.

Dice: Extracts focused multi-dimension combinations.



---

# How to Run

1. Connect to your PostgreSQL database.


2. Create the sales_sample table and insert the data.


3. Execute each OLAP query to observe the output.


4. Review the output for correct groupings, totals, and breakdowns.




---

✅ Expected Outcome

You should see:

Accurate subtotals for Rollup.

All possible dimension combinations for Cube.

Focused subsets for Slice and Dice.

Clear, actionable sales insights across Region, Product, and Date dimensions.



---

---
** Project is complete!**