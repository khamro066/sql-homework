--lesson 7
--Easy-Level Tasks (10)

--1.Write a query to find the minimum (MIN) price of a product in the Products table.

select min(price)
from products

--2.Write a query to find the maximum (MAX) Salary from the Employees table.

select max(salary)
from employees

--3.Write a query to count the number of rows in the Customers table.

select count(*)
from customers

--4.Write a query to count the number of unique product categories from the Products table.

select  count(distinct category) as cntcategory
from products 

--5.Write a query to find the total sales amount for the product with id 7 in the Sales table.

select sum(saleamount) as sumsale
from sales
where productID = 7

--6.Write a query to calculate the average age of employees in the Employees table.

select avg(age) avgage
from employees

--7.Write a query to count the number of employees in each department.

select count(employeeID) as cntemp,DepartmentName
from employees
group by DepartmentName

--8.Write a query to show the minimum and maximum Price of products grouped by Category. Use products table.

select max(price) as maxpr,min(price)as minpr,category
from products
group by category

--9.Write a query to calculate the total sales per Customer in the Sales table.

select sum(saleamount) as sumsale,customerid
from sales
group by customerid

--10.Write a query to filter departments having more than 5 employees from the Employees table.(DeptID is enough, if you dont have DeptName).

select count(employeeid),departmentname
from employees
group by DepartmentName
having count(employeeid) > 5

--Medium-Level Tasks (9)

--11.Write a query to calculate the total sales and average sales for each product category from the Sales table.

select sum(saleamount) as sumamt,avg(saleamount) as avgamt,productcategory
from sales
group by productcategory

--12.Write a query to count the number of employees from the Department HR.

select count(employeeid) as cntemp,departmentname
from employees
group by departmentname
having departmentname= 'HR'

--13.Write a query that finds the highest and lowest Salary by department in the Employees table.(DeptID is enough, if you dont have DeptName).

select max(salary) as maxsal,min(salary) as minsal,DepartmentName
from employees
group by DepartmentName

--14.Write a query to calculate the average salary per Department.(DeptID is enough, if you dont have DeptName).

select avg(salary) as avgsal,departmentname
from employees
group by DepartmentName

--15.Write a query to show the AVG salary and COUNT(*) of employees working in each department.(DeptID is enough, if you dont have DeptName).

select count(*)cntemp,avg(salary) as avgsal,departmentname
from employees
group by DepartmentName

--16.Write a query to filter product categories with an average price greater than 400.

select avg(price) as avgpr,Category
from products
group by Category
having avg(price) > 400

--17.Write a query that calculates the total sales for each year in the Sales table.

select 
year(saledate) as saleyear,
sum (saleamount) as sumsale
from sales
group by year(saledate)

--18.Write a query to show the list of customers who placed at least 3 orders.

SELECT 
  CustomerID,
  COUNT(OrderID) AS OrderCount
FROM Orders
GROUP BY CustomerID
HAVING COUNT(OrderID) >= 3 

--19.Write a query to filter out Departments with average salary expenses greater than 60000.(DeptID is enough, if you dont have DeptName).

select avg(salary) avgsal ,departmentname
from employees
group by departmentname
having avg(salary) > 60000

--Hard-Level Tasks (6)

--20.Write a query that shows the average price for each product category, and then filter categories with an average price greater than 150.

select avg(price) as avgpr,Category
from products
group by category
having avg(price) > 150

--21.Write a query to calculate the total sales for each Customer, then filter the results to include only Customers with total sales over 1500.

select sum(saleamount) as saleamt,customerid
from sales
group by customerid
having 
sum(saleamount) > 1500

--22.Write a query to find the total and average salary of employees in each department, and filter the output to include only departments with 
--an average salary greater than 65000.

select sum(salary) as sumsal,avg(salary) as avgsal,DepartmentName
from employees
group by DepartmentName
having avg(salary) > 65000

--23.Write a query to find total amount for the orders which weights more than $50 for each customer along with their least purchases
--(least amount might be lower than 50, use tsql2012.sales.orders table,freight col, ask ur assistant to give the TSQL2012 database).

SELECT 
  CustomerID,
  SUM(CASE WHEN Freight > 50 THEN Freight ELSE 0 END) AS TotalFreightOver50,
  MIN(Freight) AS LeastFreight
FROM TSQL2012.Sales.Orders
GROUP BY CustomerID;


--24.Write a query that calculates the total sales and counts unique products sold in each month of each year, 
--and then filter the months with at least 2 products sold.(Orders)

select sum(totalamount) as sumamt,count(distinct productid) as cntproduct,
year(orderdate) as totalyear,
MONTH(orderdate) as totalmonth
from orders
group by year(orderdate),
MONTH(orderdate) 
having count(distinct productid) >=2

--25.Write a query to find the MIN and MAX order quantity per Year. From orders table

select
YEAR(orderdate) as totalyear,
min(quantity) as minquant,
max(quantity) as maxquant
from orders
group by YEAR(orderdate)
