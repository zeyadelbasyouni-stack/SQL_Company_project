
USE master;
GO

IF EXISTS (SELECT name FROM sys.databases WHERE name = N'company_store')
BEGIN
    ALTER DATABASE company_store SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE company_store;
END
GO

CREATE DATABASE company_store;
GO

USE company_store;
GO

-- 1. Departments Table
CREATE TABLE departments (
    department_id INT IDENTITY(1,1) PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);
GO

-- 2. Employees Table
CREATE TABLE employees (
    employee_id INT IDENTITY(1,1) PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    hire_date DATE NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    department_id INT NULL
);
GO

-- 3. Projects Table
CREATE TABLE projects (
    project_id INT IDENTITY(1,1) PRIMARY KEY,
    project_name VARCHAR(150) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NULL,
    department_id INT NULL
);
GO

-- 4. Customers Table
CREATE TABLE customers (
    customer_id INT IDENTITY(1,1) PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    join_date DATE NOT NULL
);
GO

-- 5. Products Table
CREATE TABLE products (
    product_id INT IDENTITY(1,1) PRIMARY KEY,
    product_name VARCHAR(150) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT NOT NULL
);
GO

-- 6. Orders Table
CREATE TABLE orders (
    order_id INT IDENTITY(1,1) PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    status VARCHAR(30) NOT NULL
);
GO

-- 7. Order Items Table
CREATE TABLE order_items (
    order_item_id INT IDENTITY(1,1) PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL
);
GO