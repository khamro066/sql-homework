--lesson-12
--1. Combine Two Tables

select p.firstname,p.lastname,a.city,a.state
from person p left join address a on p.personid=a.personid

--2. Employees Earning More Than Their Managers

select*
from employee a inner join employee b on a.id=b.managerid
where a.salary > b.salary

--3. Duplicate Emails


SELECT email, COUNT(*) AS cntemail
FROM person_
GROUP BY email
HAVING COUNT(*) > 1

--4. Delete Duplicate Emails



WITH CTE AS (
  SELECT 
    *,
    ROW_NUMBER() OVER (PARTITION BY email ORDER BY id) AS rn
  FROM 
    person_
)
DELETE FROM CTE WHERE rn > 1;

select*
from person_

--5. Find those parents who has only girls.

select g.parentname
from girls g left join boys b on g.parentname=b.parentname
where b.parentname is null

--6. Total over 50 and least

Select o.custid,
sum( case when freight>50 then qty*unitprice else 0 end ) TotalSales,
count(case when freight>50 then qty*unitprice else 0 end),
min(o.freight) MInWeight
from TSQL2012.Sales.orders o
join TSQL2012.Sales.OrderDetails ord on o.orderid = ord.orderid
group by o.custid

--7. Carts

select isnull(a.item,'') cart1item,
       isnull(b.item,'') cart2item
from cart1 a full join cart2 b on a.item=b.item

--8. Customers Who Never Order

SELECT c.name AS Customers
FROM Customers c
LEFT JOIN Orders o
ON c.id = o.customerId
WHERE o.id IS NULL

--9. Students and Examinations

SELECT 
  s.student_id,
  s.student_name,
  sub.subject_name,
  COUNT(e.student_id) AS attended_exams
FROM 
  Students s
  CROSS JOIN Subjects sub
  LEFT JOIN Examinations e 
    ON s.student_id = e.student_id 
   AND sub.subject_name = e.subject_name
GROUP BY 
  s.student_id, s.student_name, sub.subject_name
ORDER BY 
  s.student_id, sub.subject_name
