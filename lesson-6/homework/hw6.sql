--lesson-6

--Puzzle 1: Finding Distinct Values

select  *
from inputtbl

SELECT DISTINCT
  CASE WHEN col1 < col2 THEN col1 ELSE col2 END AS col1,
  CASE WHEN col1 < col2 THEN col2 ELSE col1 END AS col2
FROM InputTbl

--Puzzle 2: Removing Rows with All Zeroes

SELECT *
FROM TestMultipleZero
WHERE 
  COALESCE(A, 0) + COALESCE(B, 0) + COALESCE(C, 0) + COALESCE(D, 0) > 0;

  --Puzzle 3: Find those with odd ids

  SELECT *
FROM section1
WHERE id % 2 = 1 

--Puzzle 4: Person with the smallest id (use the table in puzzle 3)

select top 1 id
from section1
order by id  asc


--Puzzle 5: Person with the highest id (use the table in puzzle 3)

select top 1 id
from section1
order by id  desc

--Puzzle 6: People whose name starts with b (use the table in puzzle 3)

select*
from section1
where name like 'b%'

----Puzle 7: Write a query to return only the rows where the code contains the literal underscore _ (not as a wildcard).

select*
from productcodes
where code like '%\_%' escape '\'
