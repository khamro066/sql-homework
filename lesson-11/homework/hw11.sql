

--1.Return: OrderID, CustomerName, OrderDate
--Task: Show all orders placed after 2022 along with the names of the customers who placed them.
--Tables Used: Orders, Customers

select o.OrderID,c.FirstName+''+c.LastName as Customername,o.OrderDate
from Orders o left join Customers c on o.CustomerID=o.CustomerID
where o.OrderDate > '2022-12-31'

--2.Return: EmployeeName, DepartmentName
--Task: Display the names of employees who work in either the Sales or Marketing department.
--Tables Used: Employees, Departments

select e.Name,d.DepartmentName
from Employees e inner join Departments d on e.DepartmentID=d.DepartmentID and d.DepartmentName in ('sales' , 'Marketing')

--3.Return: DepartmentName, MaxSalary
--Task: Show the highest salary for each department.
--Tables Used: Departments, Employees

select d.departmentname, max(e.salary) as Maxsalary
from Employees e inner join Departments d on e.DepartmentID=d.DepartmentID
group by d.DepartmentName

--4.Return: CustomerName, OrderID, OrderDate
--Task: List all customers from the USA who placed orders in the year 2023.
--Tables Used: Customers, Orders

select c.FirstName+''+c.LastName as Customername,o.OrderID,o.OrderDate
from Customers c left join Orders o on c.CustomerID=o.CustomerID 
where c.Country ='USA' and year(o.OrderDate) = '2023' 

--5.Return: CustomerName, TotalOrders
--Task: Show how many orders each customer has placed.
--Tables Used: Orders , Customers

select C.FirstName+''+c.LastName,count(o.OrderID) as Totalorders
from orders o inner join Customers c on o.CustomerID=c.CustomerID
group by C.FirstName+''+c.LastName

--6.Return: ProductName, SupplierName
--Task: Display the names of products that are supplied by either Gadget Supplies or Clothing Mart.
--Tables Used: Products, Suppliers

select p.ProductName,s.SupplierName
from Products p left join Suppliers s on p.SupplierID=s.SupplierID
where s.SupplierName in ('Gadget Supplies' , 'Clothing Mart')

--7.Return: CustomerName, MostRecentOrderDate
--Task: For each customer, show their most recent order. Include customers who havent placed any orders.
--Tables Used: Customers, Orders

Select  c.FirstName+''+c.LastName as CustomerName,max(o.OrderDate) as MostRecentOrderDate
from Customers c left join orders o on c.CustomerID=o.CustomerID
group by c.FirstName+''+c.LastName

--8.Return: CustomerName, OrderTotal
--Task: Show the customers who have placed an order where the total amount is greater than 500.
--Tables Used: Orders, Customers

select c.FirstName+''+c.LastName as CustomerName,TotalAmount as ordertotal
from orders o left join Customers c on o.CustomerID=c.CustomerID
where o.TotalAmount > 500

--9.Return: ProductName, SaleDate, SaleAmount
--Task: List product sales where the sale was made in 2022 or the sale amount exceeded 400.
--Tables Used: Products, Sales

select p.ProductName,s.SaleDate,s.SaleAmount
from products p left join sales s on p.ProductID=s.ProductID
where year(s.SaleDate) = '2022' or s.SaleAmount > 400

--10.Return: ProductName, TotalSalesAmount
--Task: Display each product along with the total amount it has been sold for.
--Tables Used: Sales, Products

select p.ProductName,sum(s.saleamount) as TotalsalesAmount
from products p left join sales s on p.ProductID=s.ProductID
group by p.ProductName

--11.Return: EmployeeName, DepartmentName, Salary
--Task: Show the employees who work in the HR department and earn a salary greater than 60000.
--Tables Used: Employees, Departments

select e.Name as employeename,d.DepartmentName,e.Salary
from Employees e left join Departments d on e.DepartmentID=d.DepartmentID
where d.DepartmentName ='Human Resources' and e.Salary > 60000

--12.Return: ProductName, SaleDate, StockQuantity
--Task: List the products that were sold in 2023 and had more than 100 units in stock at the time.
--Tables Used: Products, Sales

select p.ProductName,s.SaleDate,p.StockQuantity
from products p inner  join sales s on p.ProductID=s.ProductID
where year(s.SaleDate) = '2023' and p.StockQuantity > 100

--13.Return: EmployeeName, DepartmentName, HireDate
--Task: Show employees who either work in the Sales department or were hired after 2020.
--Tables Used: Employees, Departments

select e.Name,d.DepartmentName,e.HireDate
from Employees e inner join Departments d on e.DepartmentID=d.DepartmentID
where d.DepartmentName = 'Sales' or e.HireDate > '2020-12-31'

--14.Return: CustomerName, OrderID, Address, OrderDate
--Task: List all orders made by customers in the USA whose address starts with 4 digits.
--Tables Used: Customers, Orders

select c.FirstName+''+c.LastName as CustomerName,o.OrderID,c.Address,o.OrderDate
from orders o left join customers c on o.CustomerID=c.CustomerID
where c.Country = 'USA' and c.Address like '[0-9][0-9][0-9][0-9]%'

--15.Return: ProductName, Category, SaleAmount
--Task: Display product sales for items in the Electronics category or where the sale amount exceeded 350.
--Tables Used: Products, Sales

select p.ProductName,p.Category,s.SaleAmount
from Products p inner join sales s on p.ProductID=s.ProductID
where s.SaleAmount > 350 or p.Category = 1

--16.Return: CategoryName, ProductCount
--Task: Show the number of products available in each category.
--Tables Used: Products, Categories

select p.ProductName,count(p.ProductID) as Productcount
from Products p  join Categories c on p.Category=c.CategoryID
group by p.ProductName

--17.Return: CustomerName, City, OrderID, Amount
--Task: List orders where the customer is from Los Angeles and the order amount is greater than 300.
--Tables Used: Customers, Orders

select c.FirstName+''+c.LastName as customername,c.City,o.OrderID,o.TotalAmount as amount
from orders o join customers c on o.CustomerID=c.CustomerID
where c.City='los angeles' and o.TotalAmount > 300

--18.Return: EmployeeName, DepartmentName
--Task: Display employees who are in the HR or Finance department, or whose name contains at least 4 vowels.
--Tables Used: Employees, Departments

select*
from Employees e join Departments d on e.DepartmentID=d.DepartmentID
where d.DepartmentName in ('Human Resource' , 'Finance')

SELECT 
  e.Name AS EmployeeName,
  d.DepartmentName
FROM 
  Employees e 
JOIN 
  Departments d ON e.DepartmentID = d.DepartmentID
WHERE 
  d.DepartmentName IN ('Human Resources', 'Finance') 
  OR (
    LEN(e.Name)
    - LEN(REPLACE(LOWER(e.Name), 'a', ''))
    + LEN(e.Name) - LEN(REPLACE(LOWER(e.Name), 'e', ''))
    + LEN(e.Name) - LEN(REPLACE(LOWER(e.Name), 'i', ''))
    + LEN(e.Name) - LEN(REPLACE(LOWER(e.Name), 'o', ''))
    + LEN(e.Name) - LEN(REPLACE(LOWER(e.Name), 'u', ''))
  ) >= 4;

--  19.Return: EmployeeName, DepartmentName, Salary
--Task: Show employees who are in the Sales or Marketing department and have a salary above 60000.
--Tables Used: Employees, Departments

select e.Name as employeename,d.DepartmentName,e.Salary
from Employees e join Departments d on e.DepartmentID=d.DepartmentID
where d.DepartmentName in ('sales' , 'marketing') and e.Salary > 60000

