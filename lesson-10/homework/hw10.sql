--lesson-10
--Easy-Level Tasks (10)

--1.Using the Employees and Departments tables, write a query to return the names and salaries of employees whose salary is greater than 50000, along with their department names.
--🔁 Expected Columns: EmployeeName, Salary, DepartmentName

select e.Name,e.Salary,d.DepartmentName
from Employees e left join Departments d on e.DepartmentID=d.DepartmentID
where e.Salary > 50000

--2.Using the Customers and Orders tables, write a query to display customer names and order dates for orders placed in the year 2023.
--🔁 Expected Columns: FirstName, LastName, OrderDate

select c.FirstName+''+c.LastName as fullname,o.OrderDate
from Customers c inner join orders o on c.CustomerID=o.CustomerID
where year(o.OrderDate)='2023'

--3.Using the Employees and Departments tables, write a query to show all employees along with their department names. Include employees who do not belong to any department.
--🔁 Expected Columns: EmployeeName, DepartmentName

select e.Name,d.DepartmentName
from Employees e left join Departments d on e.DepartmentID=d.DepartmentID

--4.Using the Products and Suppliers tables, write a query to list all suppliers and the products they supply. Show suppliers even if they don’t supply any product.
--🔁 Expected Columns: SupplierName, ProductName

select s.SupplierName,p.ProductName
from Suppliers s left join Products p on s.SupplierID=p.SupplierID

--5.Using the Orders and Payments tables, write a query to return all orders and their corresponding payments. Include orders without payments and payments not linked to any order.
--🔁 Expected Columns: OrderID, OrderDate, PaymentDate, Amount

select o.OrderID,o.OrderDate,p.PaymentDate,p.Amount
from Orders o left join Payments p on o.OrderID=p.OrderID

--6.Using the Employees table, write a query to show each employees name along with the name of their manager.
--🔁 Expected Columns: EmployeeName, ManagerName

select a.Name as employeename,b.Name as managername
from Employees a left join employees b on a.EmployeeID=b.ManagerID

--7.Using the Students, Courses, and Enrollments tables, write a query to list the names of students who are enrolled in the course named 'Math 101'.
--🔁 Expected Columns: StudentName, CourseName

select s.Name as studentname,c.CourseName
from students s left join Enrollments e on s.StudentID=e.StudentID left join Courses c on e.CourseID=c.CourseID
where c.CourseName = 'math 101'

--8.Using the Customers and Orders tables, write a query to find customers who have placed an order with more than 3 items. Return their name and the quantity they ordered.
--🔁 Expected Columns: FirstName, LastName, Quantity

select c.FirstName+''+c.LastName as fullname,o.Quantity
from Customers c left join orders o on c.CustomerID=o.CustomerID
where o.Quantity >= 3

--9.Using the Employees and Departments tables, write a query to list employees working in the 'Human Resources' department.
--🔁 Expected Columns: EmployeeName, DepartmentName

select e.Name as employeename,d.DepartmentName
from Employees e left join Departments d on e.DepartmentID=d.DepartmentID
where d.DepartmentName = 'Human Resources'

 --Medium-Level Tasks (9)

-- 10.Using the Employees and Departments tables, write a query to return department names that have more than 5 employees.
--🔁 Expected Columns: DepartmentName, EmployeeCount

select d.DepartmentName,count(e.departmentid) as employeecount
from Departments d left join Employees e on d.DepartmentID=e.DepartmentID
group by d.DepartmentName
having count(e.departmentid) > 5

--11.Using the Products and Sales tables, write a query to find products that have never been sold.
--🔁 Expected Columns: ProductID, ProductName

select p.ProductID,p.ProductName
from Products p left join sales s on p.ProductID=s.ProductID	
where s.ProductID is null 

--12.Using the Customers and Orders tables, write a query to return customer names who have placed at least one order.
--🔁 Expected Columns: FirstName, LastName, TotalOrders

select c.FirstName,c.LastName,count(o.quantity) as totalorders
from Customers c left join orders o on c.CustomerID=o.CustomerID
group by c.FirstName,c.LastName
having count(o.quantity)= 1

--13.Using the Employees and Departments tables, write a query to show only those records where both employee and department exist (no NULLs).
--🔁 Expected Columns: EmployeeName, DepartmentName

select e.Name,d.DepartmentName
from Employees e inner join Departments d on e.DepartmentID=d.DepartmentID

14.Using the Employees table, write a query to find pairs of employees who report to the same manager.
🔁 Expected Columns: Employee1, Employee2, ManagerID

select a.Name as employee1,b.Name as employee2,a.ManagerID
from Employees a inner join Employees b on a.ManagerID=b.ManagerID

--15.Using the Orders and Customers tables, write a query to list all orders placed in 2022 along with the customer name.
--🔁 Expected Columns: OrderID, OrderDate, FirstName, LastName

select o.OrderID,o.OrderDate,c.FirstName,c.LastName
from orders o left join Customers c on o.CustomerID=c.CustomerID
where year(orderdate) = '2022'

--16.Using the Employees and Departments tables, write a query to return employees from the 'Sales' department whose salary is above 60000.
--🔁 Expected Columns: EmployeeName, Salary, DepartmentName

select e.Name as employeename,e.Salary,d.DepartmentName
from Employees e inner join Departments d on e.DepartmentID=d.DepartmentID
where d.DepartmentName= 'sales' AND e.Salary > 60000

--17.Using the Orders and Payments tables, write a query to return only those orders that have a corresponding payment.
--🔁 Expected Columns: OrderID, OrderDate, PaymentDate, Amount

select o.OrderID,o.OrderDate,p.PaymentDate,p.Amount
from orders o inner join Payments p on o.OrderID=p.OrderID

18.Using the Products and Orders tables, write a query to find products that were never ordered.
🔁 Expected Columns: ProductID, ProductName

select p.ProductID,p.ProductName
from Products p left join orders o on p.ProductID=o.ProductID
where o.ProductID is null 

--Hard-Level Tasks (9)

--19.Using the Employees table, write a query to find employees whose salary is greater than the average salary in their own departments.
--🔁 Expected Columns: EmployeeName, Salary

select a.Name as employeename,a.Salary as avgsalary
from employees a left join Employees b on a.DepartmentID=b.departmentid
group by a.name,a.Salary,a.DepartmentID
having a.Salary > avg(b.salary)

--20.Using the Orders and Payments tables, write a query to list all orders placed before 2020 that have no corresponding payment.
--🔁 Expected Columns: OrderID, OrderDate

select o.OrderID,o.OrderDate
from orders o left join Payments p on o.OrderID=p.OrderID
where p.OrderID is null and OrderDate < '2020-01-01'

--21.Using the Products and Categories tables, write a query to return products that do not have a matching category.
--🔁 Expected Columns: ProductID, ProductName

select p.ProductID,p.ProductName
from products p left join Categories c on p.Category=c.CategoryID
where c.CategoryID is  null

--22.Using the Employees table, write a query to find employees who report to the same manager and earn more than 60000.
--🔁 Expected Columns: Employee1, Employee2, ManagerID, Salary

select a.name as employee1,b.Name as employee2,a.ManagerID,a.Salary
from Employees a inner join Employees b on a.ManagerID=b.ManagerID
where a.Salary > 60000

--23.Using the Employees and Departments tables, write a query to return employees who work in departments which name starts with the letter 'M'.
--🔁 Expected Columns: EmployeeName, DepartmentName

select e.Name as employeename,
       d.DepartmentName
from Employees e inner join Departments d on e.DepartmentID=d.DepartmentID
where d.DepartmentName like 'M%'

--24.Using the Products and Sales tables, write a query to list sales where the amount is greater than 500, including product names.
--🔁 Expected Columns: SaleID, ProductName, SaleAmount

select s.SaleID,p.ProductName,s.SaleAmount
from Products p inner join Sales s on p.ProductID=s.ProductID
where s.SaleAmount > 500

--25.Using the Students, Courses, and Enrollments tables, write a query to find students who have not enrolled in the course 'Math 101'.
--🔁 Expected Columns: StudentID, StudentName


select s.StudentID,s.Name as Studentname
from Students s left join Enrollments e on s.StudentID=e.StudentID left join Courses c on e.CourseID=c.CourseID and c.CourseName = 'Math 101'
where c.CourseID is null

--26.Using the Orders and Payments tables, write a query to return orders that are missing payment details.
--🔁 Expected Columns: OrderID, OrderDate, PaymentID

select o.OrderID,o.OrderDate,p.PaymentID
from Orders o left join Payments p on o.OrderID=p.OrderID
where p.PaymentID is null

27.Using the Products and Categories tables, write a query to list products that belong to either the 'Electronics' or 'Furniture' category.
🔁 Expected Columns: ProductID, ProductName, CategoryName


select p.ProductID,p.ProductName,c.CategoryName
from Products p left join Categories c on p.Category=c.CategoryID
where c.CategoryName  in ('Electronics' , 'Furniture')
