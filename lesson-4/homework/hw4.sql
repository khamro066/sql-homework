--lesson-4

--Easy-Level Tasks (10)

--1.Write a query to select the top 5 employees from the Employees table.

select top 5*
from employees

--2.Use SELECT DISTINCT to select unique Category values from the Products table.

select distinct*
from products

--3.Write a query that filters the Products table to show products with Price > 100.

select*
from products
where price > 100

--4.Write a query to select all Customers whose FirstName start with 'A' using the LIKE operator.

select*
from customers
where FirstName like 'A%'

--5.Order the results of a Products table by Price in ascending order.

select* 
from products
order by price asc

--6.Write a query that uses the WHERE clause to filter for employees with Salary >= 60000 and Department = 'HR'.

select*
from employees
where Salary >= 60000 and DepartmentName = 'HR'

--7.Use ISNULL to replace NULL values in the Email column with the text "noemail@example.com".From Employees table

select isnull(email,'noemail@example.com') email
from employees

--8.Write a query that shows all products with Price BETWEEN 50 AND 100.

select*
from products
where price between 50 and 100

--9.Use SELECT DISTINCT on two columns (Category and ProductName) in the Products table.

select distinct category,productname
from products

--10.After SELECT DISTINCT on two columns (Category and ProductName) Order the results by ProductName in descending order.

select distinct category,productname
from products
order by ProductName desc

--Medium-Level Tasks (10)

--11.Write a query to select the top 10 products from the Products table, ordered by Price DESC.

select top 10 productname
from products 
order by price desc

--12.Use COALESCE to return the first non-NULL value from FirstName or LastName in the Employees table.

select coalesce(FirstName,LastName) as name 
from employees

--13.Write a query that selects distinct Category and Price from the Products table.

select distinct category,price 
from products

--14.Write a query that filters the Employees table to show employees whose Age is either between 30 and 40 or Department = 'Marketing'.

select*
from employees
where (age between 30 and 40) or departmentname = 'Marketing'


--15.Use OFFSET-FETCH to select rows 11 to 20 from the Employees table, ordered by Salary DESC.

select*
from employees
order by salary desc
offset 10 rows
fetch next 10 rows only

--16.Write a query to display all products with Price <= 1000 and Stock > 50, sorted by Stock in ascending order.

select*
from products
where price <=1000 and stockquantity > 50
order by stockquantity asc

--17.Write a query that filters the Products table for ProductName values containing the letter 'e' using LIKE.

select*
from products
where productname like '%e%'

--18.Use IN operator to filter for employees who work in either 'HR', 'IT', or 'Finance'.

select*
from employees
where departmentname in ('HR', 'IT', 'Finance')

--19.Use ORDER BY to display a list of customers ordered by City in ascending and PostalCode in descending order.Use customers table 

select*
from customers
order by city asc,postalcode desc

--Hard-Level Tasks

--20.Write a query that selects the top 5 products with the highest sales, using TOP(5) and ordered by SalesAmount DESC.

select top 5 *
from products
order by salesamount desc

--21.Combine FirstName and LastName into one column named FullName in the Employees table. (only in select statement)


select Firstname+''+Lastname as fullname
from employees

--22.Write a query to select the distinct Category, ProductName, and Price for products that are priced above $50, using DISTINCT on three columns.

select distinct category,productname,price
from products
where price >50 

--23.Write a query that selects products whose Price is less than 10% of the average price in the Products table. (Do some research on how to find 
--average price of all products)


SELECT *
FROM Products
WHERE Price < (SELECT AVG(Price) * 0.1 FROM Products)

--24.Use WHERE clause to filter for employees whose Age is less than 30 and who work in either the 'HR' or 'IT' department.

select *
from employees
where age < 30 and departmentname in ('HR','IT')

--25.Use LIKE with wildcard to select all customers whose Email contains the domain '@gmail.com'.

select*
from customers
where email like '%@gmail.com'

--26.Write a query that uses the ALL operator to find employees whose salary is greater than all employees in the 'Sales' department.

select*
from employees
where salary > all (select salary from employees where departmentname = 'sales')

27.Write a query that filters the Orders table for orders placed in the last 180 days using BETWEEN and LATEST_DATE in the table. 
(Search how to get the current date and latest date)

SELECT *
FROM Orders
WHERE LATEST_DATE BETWEEN DATEADD(DAY, -180, GETDATE()) AND GETDATE()
