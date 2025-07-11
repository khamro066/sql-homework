--lesson-9
 --Easy-Level Tasks (10)

 --1.Using Products, Suppliers table List all combinations of product names and supplier name

 select p.ProductName,s.suppliername
 from products p inner join suppliers s on p.supplierid=s.supplierid

--2.Using Departments, Employees table Get all combinations of departments and employees.\

 select*
 from departments d inner join employees e on d.departmentid=e.departmentid

 --3.Using Products, Suppliers table List only the combinations where the supplier actually supplies the product. Return supplier name and product name

 select p.ProductName,s.suppliername
 from products p inner join suppliers s on p.supplierid=s.supplierid

--4.Using Orders, Customers table List customer names and their orders ID.

select c.firstname+''+lastname as fullname,OrderID
from orders o inner join customers c on o.CustomerID=c.CustomerID

--5.Using Courses, Students table Get all combinations of students and courses.

select*
from courses c inner join students s on c.courseid=s.studentid

--6.Using Products, Orders table Get product names and orders where product IDs match.

select*
from products p inner join orders o on p.ProductID=o.ProductID

--7.Using Departments, Employees table List employees whose DepartmentID matches the department.


select*
from departments d inner join employees e on d.departmentid=e.departmentid

--8.Using Students, Enrollments table List student names and their enrolled course IDs.

select s.name,e.courseid
from students s inner join enrollments e on s.studentid=e.studentid

--9.Using Payments, Orders table List all orders that have matching payments.

select*
from payments p inner join orders o on p.orderid=o.orderid

--10.Using Orders, Products table Show orders where product price is more than 100.

select*
from orders o inner join products p on o.ProductID=p.ProductID
where p.Price > 100

--11.Using Employees, Departments table List employee names and department names where department IDs are not equal
--It means: Show all mismatched employee-department combinations.


select e.name,d.departmentname
from employees e inner join departments d on e.departmentid<>d.departmentid

	--12.Using Orders, Products table Show orders where ordered quantity is greater than stock quantity.


	select*
	from orders o inner join products p on o.ProductID=p.ProductID
	where o.Quantity > p.stockquantity

--13.Using Customers, Sales table List customer names and product IDs where sale amount is 500 or more.


select c.firstname+''+lastname as fullname,s.productid
from customers c inner join sales s on c.customerid=s.customerid
where s.saleamount >= 500

--14.Using Courses, Enrollments, Students table List student names and course names they re enrolled in.

select s.name,c.coursename
from courses c inner join enrollments e on c.courseid=e.courseid inner join students s on e.studentid=s.studentid

--15.Using Products, Suppliers table List product and supplier names where supplier name contains “Tech”.


select p.productname,s.suppliername
from products p inner join suppliers s on p.supplierid=s.supplierid
where suppliername like 'tech%'

--16.Using Orders, Payments table Show orders where payment amount is less than total amount.


select*
from orders o inner join payments p  on o.orderid=p.orderid 
where p.amount > o.TotalAmount

17.Using Employees and Departments tables, get the Department Name for each employee.

select s.name,d.departmentname
from employees s inner join departments d on s.departmentid=d.departmentid

--18.Using Products, Categories table Show products where category is either 'Electronics' or 'Furniture'.

select*
from products p inner join categories c on p.ProductID=c.CategoryID
where CategoryName in ('Electronics' ,'Furniture')

--19.Using Sales, Customers table Show all sales from customers who are from 'USA'.

select*
from sales s inner join customers c on s.customerid=c.customerid
where c.country = 'usa'

--20.Using Orders, Customers table List orders made by customers from 'Germany' and order total > 100.

select*
from orders o inner join customers c on o.CustomerID=c.customerid
where c.country = 'germany' and o.TotalAmount > 100

--21.Using Employees table List all pairs of employees from different departments.

select a.name as employeeA,b.name as employeeB,a.departmentid as deptA,b.departmentid as deptB
from employees a join employees b on a.employeeId<b.employeeId
where a.departmentid<>b.departmentid

--22.Using Payments, Orders, Products table List payment details where the paid amount is not equal to (Quantity × Product Price).

select (o.Quantity*p.Price) as totalprice
from payments y inner join orders o on y.orderid=o.orderid inner join products p on o.ProductID=p.ProductID
where y.amount <> (o.Quantity*p.Price)

--23.Using Students, Enrollments, Courses table Find students who are not enrolled in any course.


select*
from students s left join enrollments e on s.StudentID=e.studentid 
where e.studentid is null

--24.Using Employees table List employees who are managers of someone, but their salary is less than or equal to the person they manage.

select*
from employees a join employees b on a.employeeId=b.managerid
where a.salary <=b.salary

--25.Using Orders, Payments, Customers table List customers who have made an order, but no payment has been recorded for it.


select*
from customers c inner join orders o on c.customerid=o.CustomerID left join payments p on o.OrderID=p.orderid
where p.orderid is null
