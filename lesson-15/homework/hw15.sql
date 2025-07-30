
--1. Find Employees with Minimum Salary
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2)
);

INSERT INTO employees (id, name, salary) VALUES
(1, 'Alice', 50000),
(2, 'Bob', 60000),
(3, 'Charlie', 50000);

select*
from employees
where salary = (select max(salary) as maxsal from employees)

--2. Find Products Above Average Price

CREATE TABLE products (
    id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2)
);

INSERT INTO products (id, product_name, price) VALUES
(1, 'Laptop', 1200),
(2, 'Tablet', 400),
(3, 'Smartphone', 800),
(4, 'Monitor', 300);

select*
from products
where price >(select avg(price) as avgprice from products)

--Level 2: Nested Subqueries with Conditions

CREATE TABLE departments (
    id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

CREATE TABLE employees1 (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(id)
);

INSERT INTO departments (id, department_name) VALUES
(1, 'Sales'),
(2, 'HR');

INSERT INTO employees1 (id, name, department_id) VALUES
(1, 'David', 1),
(2, 'Eve', 2),
(3, 'Frank', 1);

select*
from employees1 e
where department_id in (select id from departments d where e.department_id=d.id and d.department_name= 'sales')

4. Find Customers with No Orders
Task: Retrieve customers who have not placed any orders. Tables: customers (columns: customer_id, name), orders (columns: order_id, customer_id)

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers (customer_id, name) VALUES
(1, 'Grace'),
(2, 'Heidi'),
(3, 'Ivan');

INSERT INTO orders (order_id, customer_id) VALUES
(1, 1),
(2, 1);

select*
from customers c
where customer_id not in (select customer_id from orders o where c.customer_id=o.order_id)

Level 3: Aggregation and Grouping in Subqueries
5. Find Products with Max Price in Each Category
Task: Retrieve products with the highest price in each category. Tables: products (columns: id, product_name, price, category_id)

SELECT *
FROM products p
WHERE price = (
    SELECT MAX(price)
    FROM products
    WHERE category_id = p.category_id
);

6. Find Employees in Department with Highest Average Salary
Task: Retrieve employees working in the department with the highest average salary. Tables: employees 
(columns: id, name, salary, department_id), departments (columns: id, department_name)

SELECT *
FROM employees
WHERE department_id = (
    SELECT TOP 1 department_id
    FROM employees
    GROUP BY department_id
    ORDER BY AVG(salary) DESC
)

Level 4: Correlated Subqueries
7. Find Employees Earning Above Department Average
Task: Retrieve employees earning more than the average salary in their department. Tables: employees (columns: id, name, salary, department_id)

select*
from employees a
where salary > (select avg(salary) as avgsal from employees b where a.department_id=b.department_id)

8. Find Students with Highest Grade per Course
Task: Retrieve students who received the highest grade in each course. Tables: students (columns: student_id, name), grades (columns: student_id, course_id, grade



SELECT *
FROM students s
WHERE s.student_id IN (
    SELECT g.student_id
    FROM grades g
    WHERE g.grade = (
        SELECT MAX(g2.grade)
        FROM grades g2
        WHERE g2.course_id = g.course_id
    )
)

Level 5: Subqueries with Ranking and Complex Conditions
9. Find Third-Highest Price per Category Task: Retrieve products with the third-highest price in each category. Tables: products (columns: id, product_name, price, category_id)



SELECT *
FROM products p
WHERE price = (
    SELECT MIN(price)
    FROM (
        SELECT DISTINCT TOP 3 price
        FROM products p2
        WHERE p2.category_id = p.category_id
        ORDER BY price DESC
    ) AS top3
);


10. Find Employees whose Salary Between Company Average and Department Max Salary
Task: Retrieve employees with salaries above the company average but below the maximum in their department. Tables: employees (columns: id, name, salary, department_id)

SELECT e.*
FROM employees e
WHERE e.salary > (
    SELECT AVG(salary)
    FROM employees
)
AND e.salary < (
    SELECT MAX(salary)
    FROM employees d
    WHERE d.department_id = e.department_id
)


