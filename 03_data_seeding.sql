USE company_store;
GO

-- 1. Departments
INSERT INTO departments (department_name) VALUES
('HR'),
('IT'),
('Sales'),
('Marketing'),
('Finance'),
('Legal');
GO

-- 2. Employees
INSERT INTO employees (first_name, last_name, email, hire_date, salary, department_id, phone_number) VALUES
('Ahmed', 'Hassan', 'ahmed.hassan@email.com', '2021-03-15', 8500.00, 2, '01012345678'),
('Mona', 'Ali', 'mona.ali@email.com', '2021-06-20', 6200.00, 2, '01023456789'),
('Omar', 'Ibrahim', 'omar.ibrahim@email.com', '2022-01-10', 4800.00, 1, '01134567890'),
('Sara', 'Mahmoud', 'sara.mahmoud@email.com', '2022-05-18', 7100.00, 3, '01245678901'),
('Khaled', 'Tarek', 'khaled.tarek@email.com', '2022-09-01', 5300.00, 3, '01056789012'),
('Nour', 'Youssef', 'nour.youssef@email.com', '2023-02-14', 9200.00, 2, '01167890123'),
('Youssef', 'Samir', 'youssef.samir@email.com', '2023-07-22', 4500.00, 4, NULL),
('Salma', 'Adel', 'salma.adel@email.com', '2023-11-05', 6800.00, 4, '01278901234'),
('Tamer', 'Gamal', 'tamer.gamal@email.com', '2024-01-15', 5500.00, 5, '01089012345'),
('Hoda', 'Farouk', 'hoda.farouk@email.com', '2024-04-10', 4000.00, 1, NULL);
GO

-- 3. Projects
INSERT INTO projects (project_name, start_date, end_date, department_id, budget) VALUES
('Cloud Migration', '2023-01-15', '2023-12-31', 2, 75000.00),
('HR System Upgrade', '2023-03-01', '2023-09-30', 1, 30000.00),
('Q4 Sales Campaign', '2023-10-01', '2023-12-31', 3, 45000.00),
('Brand Relaunch', '2024-01-10', NULL, 4, 60000.00),
('Cybersecurity Audit', '2024-02-01', '2024-08-31', 2, 50000.00);
GO

-- 4. Customers
INSERT INTO customers (customer_name, email, city, join_date) VALUES
('Khaled Abdallah', 'khaled@email.com', 'Cairo', '2023-05-12'),
('Fatma Hassan', 'fatma@email.com', 'Alexandria', '2023-06-20'),
('Ali Fathy', 'ali@email.com', 'Giza', '2023-07-01'),
('Mariam Sayed', 'mariam@email.com', 'Cairo', '2024-01-15'),
('Hassan Mostafa', 'hassan@email.com', 'Alexandria', '2024-03-10'),
('Dina Wazeer', 'dina@email.com', 'Mansoura', '2024-08-05'),
('Tarek Shawky', 'tarek.sh@email.com', 'Cairo', '2025-02-11'),
('Salma Adel', 'salma.c@email.com', 'Giza', '2025-05-22'),
('Amr Ezzat', 'amr@email.com', 'Tanta', '2025-08-14');
GO

-- 5. Products
INSERT INTO products (product_name, category, price, stock_quantity) VALUES
('Laptop Pro 15', 'Electronics', 1200.00, 25),
('Wireless Mouse', 'Electronics', 35.00, 100),
('Mechanical Keyboard', 'Electronics', 85.00, 45),
('Ergonomic Chair', 'Furniture', 250.00, 15),
('Office Desk', 'Furniture', 320.00, 10),
('USB-C Hub', 'Electronics', 45.00, 60),
('Notebook Pack', 'Office Supplies', 15.00, 120),
('Fountain Pen', 'Office Supplies', 25.00, 80),
('Gaming Monitor 27', 'Electronics', 400.00, 20),
('Desk Lamp LED', 'Furniture', 40.00, 0),
('External SSD 1TB', 'Electronics', 110.00, 30);
GO

-- 6. Orders
INSERT INTO orders (customer_id, order_date, status) VALUES
(1, '2024-01-20', 'delivered'),
(2, '2024-02-15', 'delivered'),
(3, '2024-03-10', 'shipped'),
(1, '2024-04-05', 'pending'),
(4, '2024-05-12', 'delivered'),
(5, '2024-06-01', 'cancelled'),
(6, '2024-07-18', 'delivered'),
(7, '2024-08-22', 'shipped');
GO

-- 7. Order Items
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES
(1, 1, 1, 1200.00, 0.00),
(1, 2, 2, 35.00, 0.00),
(2, 4, 1, 250.00, 0.05),
(2, 6, 1, 45.00, 0.00),
(3, 3, 1, 85.00, 0.00),
(3, 2, 1, 35.00, 0.00),
(4, 9, 1, 400.00, 0.00),
(5, 7, 4, 15.00, 0.10),
(5, 8, 2, 25.00, 0.00),
(6, 5, 1, 320.00, 0.00),
(7, 1, 1, 1200.00, 0.05),
(7, 3, 2, 85.00, 0.00),
(8, 2, 3, 35.00, 0.00),
(8, 6, 2, 45.00, 0.00);
GO