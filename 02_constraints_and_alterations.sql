USE company_store;
GO

-- 1. Unique Constraints
ALTER TABLE employees ADD CONSTRAINT UQ_employees_email UNIQUE (email);
ALTER TABLE customers ADD CONSTRAINT UQ_customers_email UNIQUE (email);
GO

-- 2. Check Constraints
ALTER TABLE employees ADD CONSTRAINT CK_employees_salary CHECK (salary > 0);
ALTER TABLE products ADD CONSTRAINT CK_products_price CHECK (price > 0);
ALTER TABLE products ADD CONSTRAINT CK_products_stock CHECK (stock_quantity >= 0);
GO

-- 3. Default Constraints
ALTER TABLE orders ADD CONSTRAINT DF_orders_status DEFAULT 'pending' FOR status;
GO

-- 4. Foreign Keys
ALTER TABLE employees 
ADD CONSTRAINT FK_employees_departments 
FOREIGN KEY (department_id) REFERENCES departments(department_id);

ALTER TABLE projects 
ADD CONSTRAINT FK_projects_departments 
FOREIGN KEY (department_id) REFERENCES departments(department_id);

ALTER TABLE orders 
ADD CONSTRAINT FK_orders_customers 
FOREIGN KEY (customer_id) REFERENCES customers(customer_id);

ALTER TABLE order_items 
ADD CONSTRAINT FK_order_items_orders 
FOREIGN KEY (order_id) REFERENCES orders(order_id);

ALTER TABLE order_items 
ADD CONSTRAINT FK_order_items_products 
FOREIGN KEY (product_id) REFERENCES products(product_id);
GO

-- 5. Alterations & New Columns
ALTER TABLE employees ADD phone_number VARCHAR(20) NULL;
ALTER TABLE projects ADD budget DECIMAL(12,2) NULL;
ALTER TABLE order_items ADD discount DECIMAL(5,2) NOT NULL CONSTRAINT DF_order_items_discount DEFAULT 0;
GO

-- 6. Rename Column
EXEC sp_rename 'dbo.customers.full_name', 'customer_name', 'COLUMN';
GO