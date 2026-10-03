USE company_store;
GO

-- 1. Cleaning & Formatting Phone Numbers
UPDATE employees
SET phone_number = '01000000000'
WHERE phone_number IS NULL;
GO

-- 2. Applying Salary Raise for IT Department (department_id = 2)
UPDATE employees
SET salary = salary * 1.10
WHERE department_id = 2;
GO

-- 3. Updating Old Orders Status to Completed
UPDATE orders
SET status = 'completed'
WHERE order_date < '2024-03-01' AND status = 'delivered';
GO

-- 4. Updating Inventory Stock
UPDATE products
SET stock_quantity = stock_quantity + 50
WHERE product_id = 2;
GO

-- 5. Applying Volume Discounts (5% for quantity > 2)
UPDATE order_items
SET discount = 0.05
WHERE quantity > 2 AND discount = 0;
GO

-- 6. Setting Project End Dates
UPDATE projects
SET end_date = '2024-12-31'
WHERE project_name = 'Brand Relaunch' AND end_date IS NULL;
GO

-- 7. Safe Deletion for Cancelled Order (Order ID = 6)
-- First: Delete related items from order_items
DELETE FROM order_items
WHERE order_id = 6;

-- Second: Delete the order itself
DELETE FROM orders
WHERE order_id = 6;
GO