--lesson-19
--Part 1: Stored Procedure Tasks

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Department NVARCHAR(50),
    Salary DECIMAL(10,2)
);

CREATE TABLE DepartmentBonus (
    Department NVARCHAR(50) PRIMARY KEY,
    BonusPercentage DECIMAL(5,2)
);

INSERT INTO Employees VALUES
(1, 'John', 'Doe', 'Sales', 5000),
(2, 'Jane', 'Smith', 'Sales', 5200),
(3, 'Mike', 'Brown', 'IT', 6000),
(4, 'Anna', 'Taylor', 'HR', 4500);

INSERT INTO DepartmentBonus VALUES
('Sales', 10),
('IT', 15),
('HR', 8);


 --Task 1:

create procedure sp_getEmployeeBonus
as
begin 
set nocount on
create table #employeebonus (
employeeid int,
fullname nvarchar (100),
department nvarchar (50),
salary decimal (10,2),
bonusamount decimal (10,2)
)

insert into #employeebonus (employeeid,fullname,department,salary,bonusamount)
select
employeeid,
firstname+' '+lastname as fullname ,
e.department,
salary,
salary*bonusPercentage/100 as bonusamount
from Employees e join departmentbonus d on e.Department=d.Department
select*
from #employeebonus
end

exec sp_getEmployeeBonus

 --Task 2:
select*
from Employees
select*
from DepartmentBonuse

create proc sp_getemployeepercentage
@deptname varchar (50),
@increasepercent decimal (5,2)
as
begin 
update Employees
set salary *= (1.0+ @increasepercent/100)
where Department = @deptname

Select * from Employees
end

sp_getemployeepercentage 'Sales', 100

--Part 2: MERGE Tasks


CREATE TABLE Products_Current (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(100),
    Price DECIMAL(10,2)
);

CREATE TABLE Products_New (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(100),
    Price DECIMAL(10,2)
);

INSERT INTO Products_Current VALUES
(1, 'Laptop', 1200),
(2, 'Tablet', 600),
(3, 'Smartphone', 800);

INSERT INTO Products_New VALUES
(2, 'Tablet Pro', 700),
(3, 'Smartphone', 850),
(4, 'Smartwatch', 300);

--Task 3:

select*
from Products_Current
select*
from Products_New

merge products_current t
using products_new s
on t.productid=s.productid

when matched then 
update set 
t.productname=s.productname ,
t.price=s.price

when not matched by target then
 insert (productid,productname,price)
 values (s.productid,s.productname,s.price)

when not matched by source then
 delete
 ;
--Task 4:

	SELECT 
    t.id,
    CASE
        WHEN t.p_id IS NULL THEN 'Root'
        WHEN NOT EXISTS (SELECT 1 FROM Tree c WHERE c.p_id = t.id) THEN 'Leaf'
        ELSE 'Inner'
    END AS type
FROM Tree t
ORDER BY t.id;

--Task 5:

--Task 6:

CREATE TABLE employees1 (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10,2)
);

INSERT INTO employees1(id, name, salary) VALUES
(1, 'Alice', 50000),
(2, 'Bob', 60000),
(3, 'Charlie', 50000);

select*
from employees1 
where salary = (select min(salary) from employees1)


--task 7

-- Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(100),
    Category NVARCHAR(50),
    Price DECIMAL(10,2)
);

-- Sales Table
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
    Quantity INT,
    SaleDate DATE
);

INSERT INTO Products (ProductID, ProductName, Category, Price) VALUES
(1, 'Laptop Model A', 'Electronics', 1200),
(2, 'Laptop Model B', 'Electronics', 1500),
(3, 'Tablet Model X', 'Electronics', 600),
(4, 'Tablet Model Y', 'Electronics', 700),
(5, 'Smartphone Alpha', 'Electronics', 800),
(6, 'Smartphone Beta', 'Electronics', 850),
(7, 'Smartwatch Series 1', 'Wearables', 300),
(8, 'Smartwatch Series 2', 'Wearables', 350),
(9, 'Headphones Basic', 'Accessories', 150),
(10, 'Headphones Pro', 'Accessories', 250),
(11, 'Wireless Mouse', 'Accessories', 50),
(12, 'Wireless Keyboard', 'Accessories', 80),
(13, 'Desktop PC Standard', 'Computers', 1000),
(14, 'Desktop PC Gaming', 'Computers', 2000),
(15, 'Monitor 24 inch', 'Displays', 200),
(16, 'Monitor 27 inch', 'Displays', 300),
(17, 'Printer Basic', 'Office', 120),
(18, 'Printer Pro', 'Office', 400),
(19, 'Router Basic', 'Networking', 70),
(20, 'Router Pro', 'Networking', 150);

INSERT INTO Sales (SaleID, ProductID, Quantity, SaleDate) VALUES
(1, 1, 2, '2024-01-15'),
(2, 1, 1, '2024-02-10'),
(3, 1, 3, '2024-03-08'),
(4, 2, 1, '2024-01-22'),
(5, 3, 5, '2024-01-20'),
(6, 5, 2, '2024-02-18'),
(7, 5, 1, '2024-03-25'),
(8, 6, 4, '2024-04-02'),
(9, 7, 2, '2024-01-30'),
(10, 7, 1, '2024-02-25'),
(11, 7, 1, '2024-03-15'),
(12, 9, 8, '2024-01-18'),
(13, 9, 5, '2024-02-20'),
(14, 10, 3, '2024-03-22'),
(15, 11, 2, '2024-02-14'),
(16, 13, 1, '2024-03-10'),
(17, 14, 2, '2024-03-22'),
(18, 15, 5, '2024-02-01'),
(19, 15, 3, '2024-03-11'),
(20, 19, 4, '2024-04-01');




create proc sp_GetProductSalesSummary
@Productid int
as 
begin 

select
      p.productname,
	  sum(p.price) as totalquantity,
	  sum(s.quantity*p.price) as totalsalesamount,
	  min(s.saledate) as firstsaledate,
	  max(s.saledate) as lastsaledate
from products p left join sales s on s.ProductID=p.productid
where p.ProductID=@productid
group by p.productname
end;

sp_GetProductSalesSummary @productid=5


