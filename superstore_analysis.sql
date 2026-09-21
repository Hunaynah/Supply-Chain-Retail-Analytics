CREATE DATABASE retail_db;
USE retail_db;
CREATE TABLE superstore (
    row_id INT,
    order_id VARCHAR(50),
    order_date VARCHAR(20),
    ship_date VARCHAR(20),
    ship_mode VARCHAR(30),
    customer_id VARCHAR(20),
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    country VARCHAR(50),
    city VARCHAR(100),
    state VARCHAR(100),
    postal_code VARCHAR(20),
    region VARCHAR(50),
    product_id VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name TEXT,
    sales DECIMAL(10,2),
    quantity INT,
    discount DECIMAL(5,2),
    profit DECIMAL(10,2)
);
SELECT * FROM SUPERSTORE LIMIT 10;

# TOTAL SALES AND PROFIT
SELECT SUM(SALES) AS TOTAL_SALES,
	   SUM(PROFIT) AS TOTAL_PROFIT
FROM SUPERSTORE;

# SALES BY CATEGORY
SELECT CATEGORY, SUM(SALES) AS TOTAL_SALES
FROM SUPERSTORE
GROUP BY CATEGORY;

# TOP CUSTOMERS
SELECT CUSTOMER_NAME, SUM(SALES) AS TOTAL_SALES
FROM SUPERSTORE
GROUP BY CUSTOMER_NAME
ORDER BY TOTAL_SALES DESC
LIMIT 10;

# SALES BY REGION
SELECT region, SUM(sales) AS total_sales
FROM superstore
GROUP BY region;

# LOSS MAKING PRODUCTS
SELECT product_name, SUM(profit) AS total_profit
FROM superstore
GROUP BY product_name
HAVING SUM(profit) < 0;

# MONTHLY SALES TREND
SELECT order_date, SUM(sales)
FROM superstore
GROUP BY order_date;

