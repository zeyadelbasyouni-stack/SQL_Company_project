USE company_store;
GO

-- 1. Employee Department View (Section 14 - Q126)
CREATE OR ALTER VIEW vw_EmployeeDepartmentDetails AS
SELECT 
    e.employee_id,
    e.first_name + ' ' + e.last_name AS employee_name,
    e.salary,
    d.department_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id;
GO

-- 2. Comprehensive Sales & Orders Details (For Power BI Fact Modeling)
CREATE OR ALTER VIEW vw_OrderDetailsAnalysis AS
SELECT 
    o.order_id,
    o.order_date,
    o.status AS order_status,
    c.customer_id,
    c.customer_name,
    c.city,
    p.product_id,
    p.product_name,
    p.category,
    oi.quantity,
    oi.unit_price,
    oi.discount,
    CAST((oi.quantity * oi.unit_price * (1 - oi.discount)) AS DECIMAL(10,2)) AS net_revenue
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
INNER JOIN order_items oi ON o.order_id = oi.order_id
INNER JOIN products p ON oi.product_id = p.product_id;
GO

-- 3. Customer Lifetime Value & Sales Report (Section 14 - Q131)
CREATE OR ALTER VIEW vw_CustomerSalesReport AS
SELECT 
    c.customer_id,
    c.customer_name,
    c.city,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ISNULL(SUM(oi.quantity * oi.unit_price * (1 - oi.discount)), 0) AS total_spent,
    MAX(o.order_date) AS last_order_date
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
LEFT JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.customer_name, c.city;
GO

-- 4. Department Performance & Project Value (Section 14 - Q132)
CREATE OR ALTER VIEW vw_DepartmentHRAnalytics AS
SELECT 
    d.department_id,
    d.department_name,
    COUNT(DISTINCT e.employee_id) AS employee_count,
    ISNULL(SUM(e.salary), 0) AS total_salaries,
    COUNT(DISTINCT p.project_id) AS active_projects_count,
    ISNULL(SUM(p.budget), 0) AS total_projects_budget
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id
LEFT JOIN projects p ON d.department_id = p.department_id
GROUP BY d.department_id, d.department_name;
GO