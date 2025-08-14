--Lesson-18: View, temp table, variable, functions

--1. Create a temporary table named MonthlySales to store the total quantity sold and total revenue for each product in the current month.
--Return: ProductID, TotalQuantity, TotalRevenue

--2. Create a view named vw_ProductSalesSummary that returns product info along with total sales quantity across all time.
--Return: ProductID, ProductName, Category, TotalQuantitySold

create view vw_ProductSalesSummary as

select p.productid,p.productname,p.category,sum(p.price*s.quantity) as totalsales
from products p join sales s on p.productid=s.productid
group by p.productid,p.productname,p.category

select*from vw_ProductSalesSummary

--3. Create a function named fn_GetTotalRevenueForProduct(@ProductID INT)
--Return: total revenue for the given product ID


CREATE FUNCTION dbo.fn_TotalRevenueByProduct
(
    @ProductID INT
)
RETURNS DECIMAL(18,2)
AS
BEGIN
    DECLARE @TotalRevenue DECIMAL(18,2);

    SELECT @TotalRevenue = SUM(s.Quantity * p.Price)
    FROM Sales s
    JOIN Products p ON s.ProductID = p.ProductID
    WHERE p.ProductID = @ProductID;

    RETURN ISNULL(@TotalRevenue, 0);
END;


--4. Create an function fn_GetSalesByCategory(@Category VARCHAR(50))
--Return: ProductName, TotalQuantity, TotalRevenue for all products in that category.

create function fn_GetSalesByCategory
(
@category varchar(50)
)
returns table
as 
return
(
select p.productname,
       sum(s.quantity) as totalquantity,
       sum(s.quantity*p.price) as totalrevenue
from products p join sales s on p.productid=s.productid
where p.category = @category
group by p.productname
)

select*
from fn_GetSalesByCategory ('electronics')


5. You have to create a function that get one argument as input from user and the function should return 
'Yes' if the input number is a prime number and 'No' otherwise.

create function fn_isprime (@number int)
returns varchar (10)
as 
begin
if @number <= 1 return 'no'
if @number in (2,3) return 'yes'

 DECLARE @i INT = 2
    WHILE @i <= SQRT(@Number)
    BEGIN
        IF @Number % @i = 0 RETURN 'No'
        SET @i += 1
    END
    RETURN 'Yes'
END

select dbo.fn_isprime (5)

6. Create a table-valued function named fn_GetNumbersBetween that accepts two integers as input:


create function fn_GetNumbersBetween 
(
@start int,
@end int
)
returns table
as 
return
(
;with numb as 
( select @start as num
union all
select num + 1 
from numb 
where num < @end
)
select num as number 
from numb
)


7. Write a SQL query to return the Nth highest distinct salary from the Employee table. If there are fewer than N distinct salaries, return NULL.


declare @N int = 5

;with salaryranks as
(
dense_rank() over ( order by salary desc) as rnk
from employee
)
select max(salary) as Nth_Highest_Salary
from salaryranks 
where rnk = @N

--8. Write a SQL query to find the person who has the most friends.

CREATE TABLE RequestAccepted (
    requester_id INT,
    accepter_id INT,
    accept_date DATE
);

INSERT INTO RequestAccepted (requester_id, accepter_id, accept_date) VALUES
(1, 2, '2016-06-03'),
(1, 3, '2016-06-08'),
(2, 3, '2016-06-08'),
(3, 4, '2016-06-09');


with cte as (

select requester_id, accepter_id,  accept_date from RequestAccepted
union all
Select accepter_id, requester_id, accept_date from RequestAccepted
),  cte2 as (
		select *, COUNT(accepter_id) over(partition by requester_id) as cnt
	from cte
) Select * from cte2
where cnt = (select max(cnt) from cte2)

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT FOREIGN KEY REFERENCES Customers(customer_id),
    order_date DATE,
    amount DECIMAL(10,2)
);

-- Customers
INSERT INTO Customers (customer_id, name, city)
VALUES
(1, 'Alice Smith', 'New York'),
(2, 'Bob Jones', 'Chicago'),
(3, 'Carol White', 'Los Angeles');

-- Orders
INSERT INTO Orders (order_id, customer_id, order_date, amount)
VALUES
(101, 1, '2024-12-10', 120.00),
(102, 1, '2024-12-20', 200.00),
(103, 1, '2024-12-30', 220.00),
(104, 2, '2025-01-12', 120.00),
(105, 2, '2025-01-20', 180.00);

--9. Create a View for Customer Order Summary

create view vw_CustomerOrderSummary as
select c.customer_id,c.name, sum(o.order_id) as totalorders,
       sum(o.amount) as totalamount,
	   max(o.order_date) as maxx
from Customers c join orders o on c.customer_id=o.customer_id
group by c.customer_id,c.name

select* from vw_CustomerOrderSummary

--10. Write an SQL statement to fill in the missing gaps. You have to write only select statement, no need to modify the table.

DROP TABLE IF EXISTS Gaps;

CREATE TABLE Gaps
(
RowNumber   INTEGER PRIMARY KEY,
TestCase    VARCHAR(100) NULL
);

INSERT INTO Gaps (RowNumber, TestCase) VALUES
(1,'Alpha'),(2,NULL),(3,NULL),(4,NULL),
(5,'Bravo'),(6,NULL),(7,NULL),(8,NULL),(9,NULL),(10,'Charlie'), (11, NULL), (12, NULL)



DROP TABLE IF EXISTS Gaps;

CREATE TABLE Gaps
(
RowNumber   INTEGER PRIMARY KEY,
TestCase    VARCHAR(100) NULL
);

INSERT INTO Gaps (RowNumber, TestCase) VALUES
(1,'Alpha'),(2,NULL),(3,NULL),(4,NULL),
(5,'Bravo'),(6,NULL),(7,NULL),(8,NULL),(9,NULL),(10,'Charlie'), (11, NULL), (12, NULL)

Select * from Gaps

select *, MAX(newTest)over(partition by gr)
from (
select *, RowNumber-ROW_NUMBER()OVER(partition by testcase order by testcase) as gr
    ,isnull(LAG(TestCase)OVER(order by rownumber),TestCase) as newTest
from Gaps
)a
order by 1
