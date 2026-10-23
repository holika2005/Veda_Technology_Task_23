# Expected Results — Task 23

Run the queries against your imported Northwind database to obtain actual values. The notes below describe the expected output shape and logic, not fabricated database results.

| # | Function / concept | Expected result |
|---|---|---|
| 1 | `COUNT(*)` | Total number of customer records |
| 2 | `COUNT(customer_id)` | Orders where `customer_id` is not NULL |
| 3 | `SUM(quantity)` | Total ordered quantity across order-detail records |
| 4 | `AVG(unit_price)` | Average product unit price, ignoring NULL values |
| 5 | `MIN`, `MAX` | Lowest and highest product unit prices |
| 6 | `GROUP BY` + `COUNT` | One row per country with customer count |
| 7 | `GROUP BY` + `SUM` | One row per product with total quantity ordered |
| 8 | `GROUP BY` + `AVG` | One row per category with average product price |
| 9 | `HAVING` | Countries whose customer count is at least 5 |
| 10 | NULL handling | Total detail rows, non-NULL discount count, and discount average/min/max |

## Interview question: Why use GROUP BY?
`GROUP BY` combines rows that share a value (such as country or category), allowing aggregate functions to calculate a separate summary for each group.

## Interview question: How does AVG handle NULLs?
`AVG(column)` ignores NULL values. It divides the sum of non-NULL values by the count of non-NULL values. `COUNT(*)` counts all rows, while `COUNT(column)` counts only rows where that column is not NULL.

## Compatibility note
Some Northwind variants omit or rename columns. If query 10 fails because `order_details.discount` is missing, inspect the table and adapt the NULL-handling query to a nullable column available in your dataset.
