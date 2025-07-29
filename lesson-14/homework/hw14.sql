--Lesson-14: Date and time Functions,Practice
--easy tasks
--1.Write a SQL query to split the Name column by a comma into two separate columns: Name and Surname.(TestMultipleColumns)


SELECT
    LEFT(Name, CHARINDEX(',', Name) - 1) AS Name,
    RIGHT(Name, LEN(Name) - CHARINDEX(',', Name)) AS Surname
FROM TestMultipleColumns;

--2.Write a SQL query to find strings from a table where the string itself contains the % character.(TestPercent)

select*
from testpercent
where strs like '%[%]%'

--3.In this puzzle you will have to split a string based on dot(.).(Splitter)

--select*
--from splitter
--where 

--4.Write a SQL query to replace all integers (digits) in the string with 'X'.(1234ABC123456XYZ1234567890ADS)

select
REPLACE('1234ABC123456XYZ1234567890ADS','1234ABC123456XYZ1234567890ADS','X') as reult

--5.Write a SQL query to return all rows where the value in the Vals column contains more than two dots (.).(testDots)

select*
from testdots
where len(vals)-len(replace(vals,'.',''))>2

--6.Write a SQL query to count the spaces present in the string.(CountSpaces)

select 
len(texts)-len(replace(texts,' ','')) as resultcount
from countspaces

--7.write a SQL query that finds out employees who earn more than their managers.(Employee)

select*
from employee a left join employee b on a.id=b.managerid
where a.salary > b.salary

8.Find the employees who have been with the company for more than 10 years, but less than 15 years. Display their Employee ID, First
Name, Last Name, Hire Date, and the Years of Service (calculated as the number of years between the current date and the hire date).(Employees)

select employee_id,first_name,last_name,hire_date,datediff(year,hire_date,getdate()) as years_of_service
from employees
where datediff(year,hire_date,getdate()) between 11 and 14 

--Medium Tasks

----1.Write a SQL query to separate the integer values and the character values into two different columns.(rtcfvty34redt)

--2.write a SQL query to find all dates Ids with higher temperature compared to its previous (yesterdays) dates.(weather)

select*
from weather a join weather b on a.recorddate=dateadd(day,1,b.recorddate)
where a.temperature>b.temperature

--3.Write an SQL query that reports the first login date for each player.(Activity)

select player_id,min(event_date) as firstlogin
from activity
group by player_id

4.Your task is to return the third item from that list.(fruits)


DECLARE @text VARCHAR(100) = 'apple.banana.orange.grape'

SELECT 
    PARSENAME(REPLACE(@text, '.', '.'), 2) AS ThirdItem

5.Write a SQL query to create a table where each character from the string will be converted into a row.(sdgfhsdgfhs@121313131)
6.You are given two tables: p1 and p2. Join these tables on the id column. The catch is: when the value of p1.code is 0, replace it with the value of p2.code.(p1,p2)

select*,
case 
when p1.code = 0 then p2.code
else p1.code
end as finalcode
from p1 left join p2 on p1.id=p2.id

7.Write an SQL query to determine the Employment Stage for each employee based on their HIRE_DATE. The stages are defined as follows

select  employee_id,
    first_name,
    last_name,
    hire_date,
    DATEDIFF(YEAR, hire_date, GETDATE()) AS YearsWorked,
case 
when DATEDIFF(YEAR, hire_date, GETDATE()) < 1 then 'New Hire'
when DATEDIFF(YEAR, hire_date, GETDATE()) between 1 and 5 then 'Junior'
when DATEDIFF(YEAR, hire_date, GETDATE()) between 5 and 10 then 'Mid-Level'
when DATEDIFF(YEAR, hire_date, GETDATE()) between 10 and 20 then 'senior'
else 'Veteran'
end as  EmploymentStage
from employees

8.Write a SQL query to extract the integer value that appears at the start of the string in a column named Vals.(GetIntegers)

SELECT 
    Vals,
    TRY_CAST(
        LEFT(Vals, PATINDEX('%[^0-9]%', Vals + 'x') - 1) 
        AS INT
    ) AS StartingInteger
FROM GetIntegers
WHERE Vals LIKE '[0-9]%'

--Difficult Tasks

1.In this puzzle you have to swap the first two letters of the comma separated string.(MultipleVals)
2.Write a SQL query that reports the device that is first logged in for each player.(Activity)

SELECT player_id,device_id
FROM (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY player_id ORDER BY event_date) AS rn
    FROM Activity
) AS sub
WHERE rn = 1;

3.You are given a sales table. Calculate the week-on-week percentage of sales per area for each financial week. For each week, the total sales
will be considered 100%, and the percentage sales for each day of the week should be calculated based on the area sales for that week.(WeekPercentagePuzzle)

select*
from weekpercentagepuzzle
