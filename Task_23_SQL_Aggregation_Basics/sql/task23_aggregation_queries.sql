-- Task 23: SQL Aggregation Basics
-- Tool: MySQL | Dataset: Northwind
-- Run each query separately after importing Northwind into MySQL.
USE northwind;

-- 1. COUNT: number of customers
SELECT COUNT(*) AS total_customers
FROM customers;

-- 2. COUNT: orders with a non-NULL customer_id
SELECT COUNT(customer_id) AS orders_with_customer
FROM orders;

-- 3. SUM: total units ordered across all order details
SELECT SUM(quantity) AS total_units_ordered
FROM order_details;

-- 4. AVG: average product unit price
SELECT AVG(unit_price) AS average_unit_price
FROM products;

-- 5. MIN and MAX: lowest and highest product prices
SELECT MIN(unit_price) AS lowest_unit_price,
       MAX(unit_price) AS highest_unit_price
FROM products;

-- 6. GROUP BY: number of customers by country
SELECT country, COUNT(*) AS customer_count
FROM customers
GROUP BY country
ORDER BY customer_count DESC, country;

-- 7. GROUP BY + SUM: total quantity ordered for each product
SELECT p.product_id, p.product_name,
       SUM(od.quantity) AS total_quantity_ordered
FROM products AS p
JOIN order_details AS od ON od.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_quantity_ordered DESC;

-- 8. GROUP BY + AVG: average product price by category
SELECT c.category_id, c.category_name,
       AVG(p.unit_price) AS average_category_price
FROM categories AS c
JOIN products AS p ON p.category_id = c.category_id
GROUP BY c.category_id, c.category_name
ORDER BY average_category_price DESC;

-- 9. HAVING: countries with at least 5 customers
SELECT country, COUNT(*) AS customer_count
FROM customers
GROUP BY country
HAVING COUNT(*) >= 5
ORDER BY customer_count DESC, country;

-- 10. NULL behavior: total rows and non-NULL discount values
SELECT COUNT(*) AS total_detail_rows,
       COUNT(discount) AS non_null_discount_values,
       AVG(discount) AS average_non_null_discount,
       MIN(discount) AS minimum_discount,
       MAX(discount) AS maximum_discount
FROM order_details;
