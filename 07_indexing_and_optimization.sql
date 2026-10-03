USE company_store;
GO

-- 1. Index on Customer Email (Section 14 - Q129)
CREATE NONCLUSTERED INDEX IX_customers_email
ON customers(email);
GO

-- 2. Foreign Key & Query Performance Indexes
CREATE NONCLUSTERED INDEX IX_orders_customer_id
ON orders(customer_id);
GO

CREATE NONCLUSTERED INDEX IX_orders_order_date
ON orders(order_date);
GO

CREATE NONCLUSTERED INDEX IX_order_items_order_id
ON order_items(order_id);
GO

CREATE NONCLUSTERED INDEX IX_order_items_product_id
ON order_items(product_id);
GO

CREATE NONCLUSTERED INDEX IX_employees_department_id
ON employees(department_id);
GO