--lesson-16
--easy tasks
--1.Create a numbers table using a recursive query from 1 to 1000.

declare @cnt int = 100
;with cte as
(
   select 1 as number
   union all
   Select number +1 from cte where cte.number < @cnt
) select* from cte


--2.Write a query to find the total sales per employee using a derived table.(Sales, Employees)


SELECT e.employeeid
FROM Employees e
JOIN (
    SELECT employeeid, SUM(sales) AS total_sales
    FROM Sales s
    GROUP BY employeeid
) s ON e.employeeid = s.employeeid;

3.Create a CTE to find the average salary of employees.(Employees)

WITH SalaryCTE AS (
    SELECT AVG(Salary) AS AvgSalary
    FROM Employees
)
SELECT *
FROM SalaryCTE;

4.Write a query using a derived table to find the highest sales for each product.(Sales, Products)

SELECT p.product_id, p.product_name, s.max_sale
FROM Products p
JOIN (
    SELECT product_id, MAX(amount) AS max_sale
    FROM Sales
    GROUP BY product_id
) s ON p.product_id = s.product_id;

5.Beginning at 1, write a statement to double the number for each record, the max value you get should be less than 1000000.

WITH DoubleCTE AS (
    SELECT 1 AS num
    UNION ALL
    SELECT num * 2
    FROM DoubleCTE
    WHERE num * 2 < 1000000
)
SELECT *
FROM DoubleCTE;

6.Use a CTE to get the names of employees who have made more than 5 sales.(Sales, Employees)

WITH SalesCountCTE AS (
    SELECT employee_id, COUNT(*) AS total_sales
    FROM Sales
    GROUP BY employee_id
)
SELECT e.name, sc.total_sales
FROM Employees e
JOIN SalesCountCTE sc ON e.employee_id = sc.employee_id
WHERE sc.total_sales > 5;

7.Write a query using a CTE to find all products with sales greater than $500.(Sales, Products)

WITH ProductSalesCTE AS (
    SELECT 
        product_id,
        SUM(quantity * price) AS total_sales
    FROM Sales
    GROUP BY product_id
)
SELECT 
    p.product_name,
    ps.total_sales
FROM ProductSalesCTE ps
JOIN Products p ON ps.product_id = p.product_id
WHERE ps.total_sales > 500;

8.Create a CTE to find employees with salaries above the average salary.(Employees)

WITH AvgSalaryCTE AS (
    SELECT AVG(salary) AS avg_salary
    FROM Employees
)
SELECT e.employee_id, e.name, e.salary
FROM Employees e
CROSS JOIN AvgSalaryCTE a
WHERE e.salary > a.avg_salary;

Medium tasks

1.Write a query using a derived table to find the top 5 employees by the number of orders made.(Employees, Sales)

SELECT TOP 5
    e.name,
    s.order_count
FROM (
    SELECT 
        employee_id,
        COUNT(*) AS order_count
    FROM Sales
    GROUP BY employee_id
) s
JOIN Employees e ON e.employee_id = s.employee_id
ORDER BY s.order_count DESC;

2.Write a query using a derived table to find the sales per product category.(Sales, Products)

SELECT 
    p.category_id,
    SUM(s.amount) AS total_sales
FROM (
    SELECT product_id, amount
    FROM Sales
) s
JOIN Products p ON s.product_id = p.product_id
GROUP BY p.category_id;

3.Write a script to return the factorial of each value next to it.(Numbers1)

-- Boshlanish
WITH FactorialCTE (n, fact) AS (
    SELECT n, 1
    FROM Numbers1
    WHERE n = 0

    UNION ALL

    SELECT n, n * fact
    FROM Numbers1 JOIN FactorialCTE ON Numbers1.n = FactorialCTE.n + 1
)
SELECT n, MAX(fact) AS factorial
FROM FactorialCTE
GROUP BY n
ORDER BY n;

4.This script uses recursion to split a string into rows of substrings for each character in the string.(Example)

5.Use a CTE to calculate the sales difference between the current month and the previous month.(Sales)

WITH MonthlySales AS (
    SELECT
        FORMAT(SaleDate, 'yyyy-MM') AS YearMonth,
        SUM(Amount) AS TotalSales
    FROM Sales
    GROUP BY FORMAT(SaleDate, 'yyyy-MM')
),
SalesWithDiff AS (
    SELECT
        YearMonth,
        TotalSales,
        LAG(TotalSales) OVER (ORDER BY YearMonth) AS PrevMonthSales
    FROM MonthlySales
)
SELECT
    YearMonth,
    TotalSales,
    PrevMonthSales,
    TotalSales - ISNULL(PrevMonthSales, 0) AS SalesDifference
FROM SalesWithDiff;

6.Create a derived table to find employees with sales over $45000 in each quarter.(Sales, Employees)

