USE company_store;
GO

-- 1. Basic Filtering & Computed Columns (Sections 8 & 9)
-- Combined employee full name and yearly salary calculation
SELECT 
    employee_id,
    first_name + ' ' + last_name AS full_name,
    salary,
    salary * 12 AS annual_salary
FROM employees
WHERE salary > 5000;

-- Filter products by price range and stock availability
SELECT 
    product_name,
    category,
    price,
    stock_quantity
FROM products
WHERE price BETWEEN 20 AND 500 AND stock_quantity > 0;
GO

-- 2. Sorting & Pagination (Section 10)
-- Top 5 most expensive products
SELECT TOP 5 
    product_name, 
    category, 
    price
FROM products
ORDER BY price DESC;

-- Paging customers (Offset / Fetch)
SELECT 
    customer_id, 
    customer_name, 
    city, 
    join_date
FROM customers
ORDER BY join_date
OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY;
GO

-- 3. Window Functions & Department Ranking (Section 10B)
-- Ranking employees by salary within each department
SELECT 
    employee_id,
    first_name + ' ' + last_name AS employee_name,
    department_id,
    salary,
    ROW_NUMBER() OVER(PARTITION BY department_id ORDER BY salary DESC) AS row_num,
    RANK() OVER(PARTITION BY department_id ORDER BY salary DESC) AS salary_rank,
    DENSE_RANK() OVER(PARTITION BY department_id ORDER BY salary DESC) AS salary_dense_rank
FROM employees;

-- Finding the single highest-paid employee in each department
WITH RankedSalaries AS (
    SELECT 
        employee_id,
        first_name + ' ' + last_name AS employee_name,
        department_id,
        salary,
        DENSE_RANK() OVER(PARTITION BY department_id ORDER BY salary DESC) AS rnk
    FROM employees
)
SELECT 
    employee_id,
    employee_name,
    department_id,
    salary
FROM RankedSalaries
WHERE rnk = 1;
GO

-- 4. Aggregations & Grouping (Section 11)
-- Total employees and average salary per department (Average > 5000)
SELECT 
    d.department_name,
    COUNT(e.employee_id) AS total_employees,
    AVG(e.salary) AS avg_salary,
    MAX(e.salary) AS max_salary,
    MIN(e.salary) AS min_salary
FROM departments d
INNER JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_name
HAVING AVG(e.salary) > 5000;

-- Total revenue generated per product category
SELECT 
    p.category,
    COUNT(DISTINCT oi.order_id) AS orders_count,
    SUM(oi.quantity * oi.unit_price * (1 - oi.discount)) AS total_revenue
FROM products p
INNER JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.category;
GO

-- 5. Complex Joins & Business Reports (Section 12)
-- Customers with their full order details and total spent
SELECT 
    c.customer_name,
    c.city,
    o.order_id,
    o.order_date,
    o.status,
    p.product_name,
    oi.quantity,
    oi.unit_price,
    (oi.quantity * oi.unit_price * (1 - oi.discount)) AS item_total
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN order_items oi ON o.order_id = oi.order_id
INNER JOIN products p ON oi.product_id = p.product_id;

-- Products that have NEVER been ordered (Unsold Inventory)
SELECT 
    p.product_id,
    p.product_name,
    p.category,
    p.price,
    p.stock_quantity
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
WHERE oi.order_item_id IS NULL;

-- Customers who have never placed an order
SELECT 
    c.customer_id,
    c.customer_name,
    c.email,
    c.city
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;
GO

-- 6. Advanced Subqueries (Section 13)
-- Employees earning more than company overall average salary
SELECT 
    employee_id,
    first_name + ' ' + last_name AS employee_name,
    salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

-- Products priced above their own category average (Correlated Subquery)
SELECT 
    p1.product_id,
    p1.product_name,
    p1.category,
    p1.price
FROM products p1
WHERE p1.price > (
    SELECT AVG(p2.price) 
    FROM products p2 
    WHERE p2.category = p1.category
);
GO