--lesson-8
--Easy-Level Tasks

--1.Using Products table, find the total number of products available in each category.

select count(*) as totalnum,category
from Products
group by Category

--2.Using Products table, get the average price of products in the 'Electronics' category.

select avg(price) as avgpr,category
from Products
where Category = 'electronics'
group by Category

--3.Using Customers table, list all customers from cities that start with 'L'.

select*
from Customers
where City like 'L%'

--4.Using Products table, get all product names that end with 'er'.

select*
from products
where productname like '%/er' escape '/'

--5.Using Customers table, list all customers from countries ending in 'A'

select*
from customers
where country like '%/A' escape '/'

--6.Using Products table, show the highest price among all products.

select  top 1 max(price) as maxpr,ProductName
from Products
group by ProductName

----7.Using Products table, label stock as 'Low Stock' if quantity < 30, else 'Sufficient'.

select
case
when stockquantity <30 then 'low stock' 
else 'sufficent'
end as stock
from products

--8.Using Customers table, find the total number of customers in each country.

select count(*) as totalnumb,country
from Customers
group by Country

--9.Using Orders table, find the minimum and maximum quantity ordered.

select min(quantity) as minquant,max(quantity) as maxquant
from orders

--Medium-Level Tasks

--10.Using Orders and Invoices tables, list customer IDs who placed orders in 2023 January to find those who did not have invoices.

select *
from orders o,Invoices i
where o.CustomerID=i.CustomerID and  YEAR(o.OrderDate) = 2023 
  AND MONTH(o.OrderDate) = 1
  AND i.CustomerID IS NULL

--11.Using Products and Products_Discounted table, Combine all product names from Products and Products_Discounted including duplicates.

select  p.ProductName,pd.ProductName
from products P,Products_Discounted PD 
where p.ProductID=pd.ProductID

SELECT ProductName
FROM Products

UNION ALL

SELECT ProductName
FROM Products_Discounted

--12.Using Products and Products_Discounted table, Combine all product names from Products and Products_Discounted without duplicates.

SELECT ProductName
FROM Products

UNION 

SELECT  ProductName
FROM Products_Discounted

--13.Using Orders table, find the average order amount by year.

select avg(totalAmount) as avgamt,OrderDate
from orders
group by OrderDate

--14.Using Products table, group products based on price: 'Low' (<100), 'Mid' (100-500), 'High' (>500). Return productname and pricegroup.

select productname,
case
when price <100 then 'low'
when price between 100 and 150 then 'mid'
when price > 500 then 'high'
end as pricegroup
from Products

15.Using City_Population table, use Pivot to show values of Year column in seperate columns ([2012], [2013]) and copy 
results to a new Population_Each_Year table.

select [district_name] ,[2012],[2013]
from city_population

PIVOT
(
  SUM(Population)
  FOR Year IN ([2012], [2013])
) AS PivotTable;

create table Population_Each_Year ( district_name nvarchar(50),[2012] int,[2013] int)

INSERT INTO Population_Each_Year ([district_name], [2012], [2013])
SELECT [district_name], [2012], [2013]
FROM 
(
  SELECT 
    district_name,
    Year,
    Population
  FROM city_population
) AS SourceTable
PIVOT
(
  SUM(Population)
  FOR Year IN ([2012], [2013])
) AS PivotTable;

select*
from Population_Each_Year


--16.Using Sales table, find total sales per product Id.

select sum(saleamount) as sumsale,ProductID
from sales
group by ProductID

--17.Using Products table, use wildcard to find products that contain 'oo' in the name. Return productname.

select ProductName
from products
where ProductName like '%oo%'

18.Using City_Population table, use Pivot to show values of City column in seperate columns (Bektemir, Chilonzor, Yakkasaroy) and copy
results to a new Population_Each_City table.

select* from
(select [year], [Bektemir], [Chilonzor], [Yakkasaroy]
from city_population
pivot
(
sum(population) for district_name in ([Bektemir], [Chilonzor], [Yakkasaroy])
) as pivotcity ) as new_population_city 


--Hard-Level Tasks

--19.Using Invoices table, show top 3 customers with the highest total invoice amount. Return CustomerID and Totalspent.

select top 3 CustomerID,sum(totalamount) as totalspent
from Invoices
group by CustomerID

--20.Transform Population_Each_Year table to its original format (City_Population).

SELECT 
  district_name,
  Year,
  Population
FROM Population_Each_Year
UNPIVOT
(
  Population FOR Year IN ([2012], [2013])
) AS Unpivoted;

--21.Using Products and Sales tables, list product names and the number of times each has been sold. (Research for Joins)

SELECT 
  p.ProductName,
  COUNT(s.SaleID) AS TimesSold
FROM Products p
JOIN Sales s ON p.ProductID = s.ProductID
GROUP BY p.ProductName;

22.

SELECT 
  Year,
  district_name,
  Population
FROM Population_Each_City
UNPIVOT
(
  Population FOR district_name IN ([Bektemir], [Chilonzor], [Yakkasaroy])
) AS UnpivotedResult;
