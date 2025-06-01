-- tables creation
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    grade INT
);

-- insertions
INSERT INTO employees VALUES 
(1, 'Alice', 'HR', 60000.00),
(2, 'Bob', 'Engineering', 75000.00),
(3, 'Charlie', 'Marketing', 50000.00);

INSERT INTO products VALUES 
(101, 'Laptop', 1000.00),
(102, 'Mouse', 25.00),
(103, 'Monitor', 150.00);

INSERT INTO students VALUES 
(201, 'Emma', 88),
(202, 'Liam', 92),
(203, 'Noah', 85);

-- 1. Begin a transaction, insert a new employee into the employees table, and commit the transaction.

BEGIN;
INSERT INTO employees (emp_id, name, department, salary) VALUES (4, 'David', 'Finance', 68000.00);
COMMIT;

-- 2. Begin a transaction, update the salary of employee with emp_id = 2, and then rollback the transaction.

BEGIN;
UPDATE employees SET salary = 80000.00 WHERE emp_id = 2;
ROLLBACK;

-- 3. Perform a delete on products table for product_id = 102, set a savepoint, then update price of product_id = 103, and finally rollback to the savepoint.

BEGIN;
DELETE FROM products WHERE product_id = 102;
SAVEPOINT sp1;
UPDATE products SET price = 180.00 WHERE product_id = 103;
ROLLBACK TO sp1;
COMMIT; 

-- 4. Use SET TRANSACTION ISOLATION LEVEL SERIALIZABLE, start a transaction, and insert a new product into the products table.

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
BEGIN;
INSERT INTO products (product_id, product_name, price) VALUES (104, 'Keyboard', 45.00);
COMMIT;

-- 5. Inside a transaction, insert two records into the students table. Simulate an error after the second insert (like inserting duplicate ID), and rollback the transaction.

BEGIN;
INSERT INTO students (student_id, name, grade) VALUES (204, 'Olivia', 90);
INSERT INTO students (student_id, name, grade) VALUES (203, 'William', 87);
ROLLBACK;