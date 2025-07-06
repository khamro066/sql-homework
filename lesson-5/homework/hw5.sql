--lesson-5

--Easy-Level Tasks

--1.Write a query that uses an alias to rename the ProductName column as Name in the Products table.

select Productname as name
from products

--2.Write a query that uses an alias to rename the Customers table as Client for easier reference.

select Customers as Client 
from salesman

--3.Use UNION to combine results from two queries that select ProductName from Products and ProductName from Products_Discounted.

select productname 
from products
union
select productname
from products_discounted

--4.Write a query to find the intersection of Products and Products_Discounted tables using INTERSECT.

select*
from products
intersect
select*
from Products_Discounted

--5.Write a query to select distinct customer names and their corresponding Country using SELECT DISTINCT.

select distinct Firstname+''+lastname as fullname ,country
from customers

--6.Write a query that uses CASE to create a conditional column that displays 'High' if Price > 1000, and 'Low' if Price <= 1000 from Products table.

select price,
case 
when price >1000 then 'high'
when price<= 1000 then 'low'
end as pricelevel
from products

--7.Use IIF to create a column that shows 'Yes' if Stock > 100, and 'No' otherwise (Products_Discounted table, StockQuantity column).

select 
stockquantity,
iif(StockQuantity >100 ,'yes','no') as instock
from Products_Discounted

--Medium-Level Tasks

--8.Use UNION to combine results from two queries that select ProductName from Products and ProductName from Products_Discounted tables.

select ProductName
from Products
union
select ProductName
from Products_Discounted

--9.Write a query that returns the difference between the Products and Products_Discounted tables using EXCEPT.

select *
from products
except
select*
from Products_Discounted

--10.Create a conditional column using IIF that shows 'Expensive' if the Price is greater than 1000, and 'Affordable' if less, from Products table.

select 
price,
iif(price > 1000 ,'expensive','affordable') as exaf
from products

--11.Write a query to find employees in the Employees table who have either Age < 25 or Salary > 60000.

select *
from employees
where age < 25 or salary >60000

--12.Update the salary of an employee based on their department, increase by 10% if they work in 'HR' or EmployeeID = 5


update employees
set salary = salary *1.1
where departmentname = 'HR' or EmployeeID= 5

--Hard-Level Tasks

--13.Write a query that uses CASE to assign 'Top Tier' if SaleAmount > 500, 'Mid Tier' if SaleAmount BETWEEN 200 AND 500, and 'Low Tier' 
--otherwise. (From Sales table)

select saleamount,
case 
when saleamount >500 then 'top tier'
when saleamount between 200 and 500 then 'mid tier'
else 'low tier'
end as salecategory
from sales

--14.Use EXCEPT to find customers ID who have placed orders but do not have a corresponding record in the Sales table.


select customerID
from orders
except
select customerID
from sales


--15.Write a query that uses a CASE statement to determine the discount percentage based on the quantity purchased. Use orders table. Result set 
--should show customerid, quantity and discount percentage. The discount should be applied as follows: 1 item: 3% Between 1 and 3 items : 5% Otherwise: 7%

select customerid,quantity,
case 
when quantity= 1 then 0.03
when quantity between 1 and 3 then 0.05
else 0.07
end as quantitytotal
from orders
