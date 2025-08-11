--lesson-17
1. You must provide a report of all distributors and their sales by region. If a distributor did not have any sales for a region, rovide a zero-dollar value for that day. Assume there is at least one sale for each region



WITH Regions AS (
    SELECT DISTINCT Region
    FROM #RegionSales
),
Distributors AS (
    SELECT DISTINCT Distributor
    FROM #RegionSales
)


SELECT 
    r.Region,
    d.Distributor,
    ISNULL(s.Sales, 0) AS Sales
FROM Regions r
CROSS JOIN Distributors d
LEFT JOIN #RegionSales s
    ON r.Region = s.Region
   AND d.Distributor = s.Distributor
ORDER BY d.Distributor, r.Region;


2. Find managers with at least five direct reports

select managerId, count(*) as cnt
from employee
where managerid is not null
group by managerid
having count(*) >= 5

3. Write a solution to get the names of products that have at least 100 units ordered in February 2020 and their amount.

SELECT 
    p.product_name,
    SUM(o.unit) AS unit
FROM Products p
JOIN Orders o 
    ON p.product_id = o.product_id
WHERE o.order_date >= '2020-02-01'
  AND o.order_date < '2020-03-01'
GROUP BY p.product_name
HAVING SUM(o.unit) >= 100;

4. Write an SQL statement that returns the vendor from which each customer has placed the most orders

;with cte as
(
select*,row_number() over ( partition by customerid order by [count] desc ) as rn
from orders
) select customerid,vendor
from cte 
where rn = 1

5. You will be given a number as a variable called @Check_Prime check if this number is prime then return This number is prime else eturn This number is not prime

6. Write an SQL query to return the number of locations,in which location most signals sent, and total number of signal for each device from the given table.

SELECT 
    d.Device_id,
    COUNT(DISTINCT d.Locations) AS no_of_location,
    (SELECT TOP 1 Locations
     FROM Device
     WHERE Device_id = d.Device_id
     GROUP BY Locations
     ORDER BY COUNT(*) DESC) AS max_signal_location,
    COUNT(*) AS no_of_signals
FROM Device d
GROUP BY d.Device_id;

7. Write a SQL to find all Employees who earn more than the average salary in their corresponding department. Return EmpID, EmpName,Salary in your output

select empid,empname,salary
from employee1 a
where salary > (select avg(salary) as avgsal from employee1 b where a.deptid=b.deptid)

8. You are part of an office lottery pool where you keep a table of the winning lottery numbers along with a table of each ticket’s chosen numbers.
If a ticket has some but not all the winning numbers, you win $10. If a ticket has all the winning numbers, you win $100. Calculate the total winnings for today’s drawing.

WITH TicketMatches AS (
    SELECT 
        t.TicketID,
        COUNT(*) AS MatchedNumbers
    FROM Tickets t
    INNER JOIN Numbers n 
        ON t.Number = n.Number
    GROUP BY t.TicketID
)
SELECT SUM(
    CASE 
        WHEN MatchedNumbers = 3 THEN 100
        WHEN MatchedNumbers > 0 THEN 10
        ELSE 0
    END
) AS TotalWinnings
FROM TicketMatches;

9. The Spending table keeps the logs of the spendings history of users that make purchases from an online shopping website which has a desktop and a mobile devices.

Write an SQL query to find the total number of users and the total amount spent using mobile only, desktop only and both mobile and desktop together for each date.

CREATE TABLE Spending (
  User_id INT,
  Spend_date DATE,
  Platform VARCHAR(10),
  Amount INT
);
INSERT INTO Spending VALUES
(1,'2019-07-01','Mobile',100),
(1,'2019-07-01','Desktop',100),
(2,'2019-07-01','Mobile',100),
(2,'2019-07-02','Mobile',100),
(3,'2019-07-01','Desktop',100),
(3,'2019-07-02','Desktop',100);

10. Write an SQL Statement to de-group the following data.

WITH RECURSIVE cte AS (
  
    SELECT Product, 1 AS Quantity, Quantity AS MaxQ
    FROM Grouped

    UNION ALL

   
    SELECT Product, 1 AS Quantity, MaxQ - 1
    FROM cte
    WHERE MaxQ > 1
)
SELECT Product, Quantity
FROM cte
ORDER BY Product;
