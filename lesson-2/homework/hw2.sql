--Basic-Level Tasks (10)

--1.Create a table Employees with columns: EmpID INT, Name (VARCHAR(50)), and Salary (DECIMAL(10,2)).

create table Employees ( EmpId int,name varchar (50),salary DECIMAL (10,2))

--2.Insert three records into the Employees table using different INSERT INTO approaches (single-row insert and multiple-row insert).

insert into employees values (1,'Azamat',15.5)
insert into employees values (2,'Matyoqub',16.6)

insert into employees values 
(3,'Josh',17.70),
(4,'Ars',18.80),
(5,'Yoldosh',19.90)

--3.Update the Salary of an employee to 7000 where EmpID = 1.

update Employees
set  salary = 7000
where EmpId = 1

--4.Delete a record from the Employees table where EmpID = 2.

delete from employees
where EmpId=2

--5.Give a brief definition for difference between DELETE, TRUNCATE, and DROP.

Delete- Jadvaldagi tanlangan (yoki barcha) qatorlarni o‘chiradi.
Truncate-Jadvaldagi barcha qatorlarni tezda o‘chiradi.
Drop- Jadvalning o‘zini va barcha ma’lumotlarini butunlay o‘chiradi.

--6.Modify the Name column in the Employees table to VARCHAR(100).

alter table employees
alter column name varchar (100)

--7.Add a new column Department (VARCHAR(50)) to the Employees table.

alter table employees
add department varchar(50)

--8.Change the data type of the Salary column to FLOAT.

alter table employees
alter column salary float

--9.Create another table Departments with columns DepartmentID (INT, PRIMARY KEY) and DepartmentName (VARCHAR(50)).
select* from departments
create table Departments
(
DepartmentID int primary key,
DepartmentName varchar(50))

--10.Remove all records from the Employees table without deleting its structure.

truncate table employees

--Intermediate-Level Tasks (6)

--11.Insert five records into the Departments table using INSERT INTO SELECT method(you can write anything you want as data).

INSERT INTO Departments (DepartmentID, DepartmentName)
SELECT *
FROM (VALUES
    (1, 'Human Resources'),
    (2, 'IT'),
    (3, 'Finance'),
    (4, 'Marketing'),
    (5, 'Operations')
) as deptdata (DepartmentID, DepartmentName) 

--12.Update the Department of all employees where Salary > 5000 to 'Management'.

update employees
set department = 'Management'
where salary >5000

--13.Write a query that removes all employees but keeps the table structure intact.

truncate table employees

--14.Drop the Department column from the Employees table.

alter table employees
drop column department 

--15.Rename the Employees table to StaffMembers using SQL commands.

exec sp_rename 'employees' , 'Staffmembers'

--16.Write a query to completely remove the Departments table from the database.

drop table Departments

----Advanced-Level Tasks (9)

--17.Create a table named Products with at least 5 columns, including: ProductID (Primary Key), ProductName (VARCHAR), Category (VARCHAR), Price (DECIMAL)

create table Products (
ProductId int primary key,
ProductName varchar(50),
Category varchar(50),
Price decimal (10,2))

select * from Products

--18.Add a CHECK constraint to ensure Price is always greater than 0.

alter table Products
add constraint CK_tblProducts_price check (price > 0)

--19.Modify the table to add a StockQuantity column with a DEFAULT value of 50.

ALTER TABLE Products
ADD StockQuantity INT DEFAULT 50

--20.Rename Category to ProductCategory

exec sp_rename 'Category' , 'ProductCategory'

--21.Insert 5 records into the Products table using standard INSERT INTO queries.

INSERT INTO Products (ProductId, ProductName, Category, Price)
VALUES (1, 'Laptop', 'Electronics', 1200.00);

INSERT INTO Products (ProductId, ProductName, Category, Price)
VALUES (2, 'Headphones', 'Electronics', 150.50);

INSERT INTO Products (ProductId, ProductName, Category, Price)
VALUES (3, 'Desk Chair', 'Furniture', 299.99);

INSERT INTO Products (ProductId, ProductName, Category, Price)
VALUES (4, 'Water Bottle', 'Accessories', 20.00);

INSERT INTO Products (ProductId, ProductName, Category, Price)
VALUES (5, 'Notebook', 'Stationery', 5.75);

--22.Use SELECT INTO to create a backup table called Products_Backup containing all Products data.

Select* into Products_Backup
from Products

--23.Rename the Products table to Inventory.

exec sp_rename 'Products' , 'Inventory'

24.Alter the Inventory table to change the data type of Price from DECIMAL(10,2) to FLOAT.

alter table inventory
alter column price float

25.Add an IDENTITY column named ProductCode that starts from 1000 and increments by 5 to Inventory table.

its impossible to add an identity with alter table,we shold recreate table named inventory then we can add an identity
