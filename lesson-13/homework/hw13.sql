--Lesson 13 ----Practice: String Functions, Mathematical Functions
--Easy Tasks
--1.You need to write a query that outputs "100-Steven King", meaning emp_id + first_name + last_name in that format using employees table.

select
cast(employee_id as varchar) +'-'+''+first_name+''+last_name as employeeinfo
from employees

--2.Update the portion of the phone_number in the employees table, within the phone number the substring '124' will be replaced by '999'

select
replace(phone_number,'124','999')
from employees

--3.That displays the first name and the length of the first name for all employees whose name starts with the letters 'A', 'J' or 'M'. Give each
--column an appropriate label. Sort the results by the employees first names.(Employees)

SELECT 
  first_name AS [First Name],
  LEN(first_name) AS [Name Length]
FROM 
  Employees
WHERE 
  LEFT(first_name, 1) IN ('A', 'J', 'M')
ORDER BY 
  first_name

--4.Write an SQL query to find the total salary for each manager ID.(Employees table)

select sum(salary) as totalsalary,manager_id
from employees
group by manager_id

5.Write a query to retrieve the year and the highest value from the columns Max1, Max2, and Max3 for each row in the TestMax table

SELECT 
  Year,
  GREATEST(Max1, Max2, Max3) AS HighestValue
FROM 
  TestMax

6.Find me odd numbered movies and description is not boring.(cinema)

SELECT *
FROM cinema
WHERE id % 2 = 1
  AND description NOT LIKE '%boring%'

7.You have to sort data based on the Id but Id with 0 should always be the last row. Now the question is can you do that with a single order by column.(SingleOrder)

SELECT *
FROM SingleOrder
ORDER BY (id = 0), id

8.Write an SQL query to select the first non-null value from a set of columns. If the first column is null, move to the next, and so on. If all columns are null, return null.(person)


SELECT
    id,
    COALESCE(first_name, middle_name, last_name) AS first_non_null_name
FROM person

--medium tasks 

--1.Split column FullName into 3 part ( Firstname, Middlename, and Lastname).(Students Table)

SELECT 
  FullName,


  LEFT(FullName, CHARINDEX(' ', FullName) - 1) AS Firstname,


  SUBSTRING(
    FullName,
    CHARINDEX(' ', FullName) + 1,
    CHARINDEX(' ', FullName, CHARINDEX(' ', FullName) + 1) - CHARINDEX(' ', FullName) - 1
  ) AS Middlename,


  RIGHT(
    FullName,
    LEN(FullName) - CHARINDEX(' ', FullName, CHARINDEX(' ', FullName) + 1)
  ) AS Lastname

FROM Students

2.For every customer that had a delivery to California, provide a result set of the customer orders that were delivered to Texas. (Orders Table)

SELECT *
FROM Orders
WHERE State = 'Texas'
  AND CustomerID IN (
      SELECT DISTINCT CustomerID
      FROM Orders
      WHERE State = 'California'
  )
  3.Write an SQL statement that can group concatenate the following values.(DMLTable)

  SELECT GroupColumn,
       STRING_AGG(ValueColumn, ', ') AS CombinedValues
FROM DMLTable
GROUP BY GroupColumn

4.Find all employees whose names (concatenated first and last) contain the letter "a" at least 3 times.

SELECT *
FROM Employees
WHERE LEN(CONCAT(first_name, last_name)) - LEN(REPLACE(CONCAT(first_name, last_name), 'a', '')) >= 3;

5.The total number of employees in each department and the percentage of those employees who have been with the company for more than 3 years(Employees)

SELECT
    E.DepartmentID,
    COUNT(E.EmployeeID) AS TotalEmployeesInDepartment,
    SUM(CASE WHEN E.HireDate <= DATEADD(year, -3, GETDATE()) THEN 1 ELSE 0 END) AS EmployeesMoreThan3Years,
    CAST(SUM(CASE WHEN E.HireDate <= DATEADD(year, -3, GETDATE()) THEN 1 ELSE 0 END) AS DECIMAL(10,2)) * 100.0 / COUNT(E.EmployeeID) AS PercentageMoreThan3Years
FROM
    Employees AS E
GROUP BY
    E.DepartmentID
ORDER BY
    E.DepartmentID;

6.Write an SQL statement that determines the most and least experienced Spaceman ID by their job description.(Personal)

--Difficult Tasks

1.Write an SQL query that separates the uppercase letters, lowercase letters, numbers, and other characters from the given string 'tf56sd#%OqH' into separate columns.
SELECT
  REGEXP_REPLACE('tf56sd#%OqH', '[^A-Z]', '') AS UppercaseLetters,
  REGEXP_REPLACE('tf56sd#%OqH', '[^a-z]', '') AS LowercaseLetters,
  REGEXP_REPLACE('tf56sd#%OqH', '[^0-9]', '') AS Numbers,
  REGEXP_REPLACE('tf56sd#%OqH', '[A-Za-z0-9]', '') AS SpecialCharacters;

  2.Write an SQL query that replaces each row with the sum of its value and the previous rows value. (Students table)

SELECT
  student_id,
  score,
  SUM(score) OVER (ORDER BY student_id) AS cumulative_score
FROM Students

3.You are given the following table, which contains a VARCHAR column that contains mathematical equations. Sum the equations and provide the answers in the output.(Equations)

4.Given the following dataset, find the students that share the same birthday.(Student Table)
SELECT s.*
FROM Student s
JOIN (
    SELECT Birthday
    FROM Student
    GROUP BY Birthday
    HAVING COUNT(*) > 1
) dup ON s.Birthday = dup.Birthday

5.


