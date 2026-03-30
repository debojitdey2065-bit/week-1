-- Project: Retail Sales & Inventory Dashboard
-- Week 2: SQL Queries & Metrics Extraction
-- Database: MySQL / PostgreSQL

-- --------------------------------------------------
-- 1. Create Database
-- --------------------------------------------------
CREATE DATABASE retail_dashboard;
USE retail_dashboard;

-- --------------------------------------------------
-- 2. Create Table
-- --------------------------------------------------
CREATE TABLE sales_data (
    fiscal_year INT,
    unique_identifier VARCHAR(50),
    deal_number VARCHAR(50),
    country VARCHAR(100),
    product_description VARCHAR(255),
    primary_exporter VARCHAR(255),
    exporter_city VARCHAR(100),
    exporter_state VARCHAR(100),
    approved_amount DECIMAL(15,2),
    disbursed_amount DECIMAL(15,2),
    loan_interest_rate DECIMAL(5,2)
);

-- --------------------------------------------------
-- 3. Import Data
-- --------------------------------------------------
-- After exporting your Excel file as CSV:
-- FINAL_CLEANED.csv

-- MySQL
LOAD DATA INFILE 'FINAL_CLEANED.csv'
INTO TABLE sales_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- PostgreSQL alternative
-- COPY sales_data FROM 'path/FINAL_CLEANED.csv' DELIMITER ',' CSV HEADER;

-- --------------------------------------------------
-- 4. Total Revenue
-- --------------------------------------------------
-- Calculates total revenue generated
SELECT 
    SUM(disbursed_amount) AS total_revenue
FROM sales_data;

-- --------------------------------------------------
-- 5. Average Deal Value
-- --------------------------------------------------
SELECT 
    AVG(disbursed_amount) AS average_sales_value
FROM sales_data;

-- --------------------------------------------------
-- 6. Best-Selling Products by Volume
-- --------------------------------------------------
SELECT 
    product_description,
    COUNT(*) AS total_sales,
    SUM(disbursed_amount) AS revenue_generated
FROM sales_data
GROUP BY product_description
ORDER BY revenue_generated DESC
LIMIT 10;

-- --------------------------------------------------
-- 7. Geographic Sales Distribution
-- --------------------------------------------------
SELECT 
    country,
    SUM(disbursed_amount) AS total_revenue
FROM sales_data
GROUP BY country
ORDER BY total_revenue DESC;

-- --------------------------------------------------
-- 8. Sales by Exporter State
-- --------------------------------------------------
SELECT 
    exporter_state,
    SUM(disbursed_amount) AS state_revenue
FROM sales_data
GROUP BY exporter_state
ORDER BY state_revenue DESC;

-- --------------------------------------------------
-- 9. Top Exporters
-- --------------------------------------------------
SELECT 
    primary_exporter,
    SUM(disbursed_amount) AS total_sales
FROM sales_data
GROUP BY primary_exporter
ORDER BY total_sales DESC
LIMIT 10;
