1. Define and explain the purpose of BULK INSERT in SQL Server.
BULK INSERT is used to quickly import large data from a file (like .txt or .csv) into a SQL table.

2. List four file formats that can be imported into SQL Server.

.txt

.csv

.xml

.json

3. Create a Products table:


CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10,2)
);
4. Insert 3 records:


INSERT INTO Products VALUES (1, 'Laptop', 1200.00);
INSERT INTO Products VALUES (2, 'Mouse', 25.50);
INSERT INTO Products VALUES (3, 'Keyboard', 50.00);
5. Explain the difference between NULL and NOT NULL.
 NULL means "no value".
 NOT NULL means the column must have a value — it cannot be empty.

6. Add UNIQUE to ProductName:


ALTER TABLE Products
ADD CONSTRAINT UQ_ProductName UNIQUE (ProductName);
7. Write a comment in SQL query:


-- This query selects all products
SELECT * FROM Products;
8. Add CategoryID column:

ALTER TABLE Products
ADD CategoryID INT;
9. Create Categories table:


CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50) UNIQUE
);
10. Purpose of IDENTITY column:
 Used to auto-generate unique numbers (like 1, 2, 3...) for each row, usually for primary keys.

 Medium-Level Tasks
1. BULK INSERT to Products:


BULK INSERT Products
FROM 'C:\Data\products.txt'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);
2. Create FOREIGN KEY in Products:


ALTER TABLE Products
ADD CONSTRAINT FK_Products_Categories
FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID);
3. Difference between PRIMARY KEY and UNIQUE KEY:

PRIMARY KEY: Cannot be NULL, only 1 per table.

UNIQUE KEY: Can be NULL, multiple allowed.

4. Add CHECK constraint (Price > 0):


ALTER TABLE Products
ADD CONSTRAINT CK_Price CHECK (Price > 0);
5. Add Stock column (INT NOT NULL):

sql
Копировать
Редактировать
ALTER TABLE Products
ADD Stock INT NOT NULL DEFAULT 0;
6. Use ISNULL to replace NULL with 0:


SELECT ProductID, ProductName, ISNULL(Price, 0) AS Price
FROM Products;
7. FOREIGN KEY usage in short:
 Links one table to another. Keeps data accurate by ensuring referenced values exist.

 Hard-Level Tasks
1. Customers table with CHECK constraint:


CREATE TABLE Customers (
    CustomerID INT,
    Name VARCHAR(50),
    Age INT CHECK (Age >= 18)
);
2. Table with IDENTITY starting at 100, step 10:


CREATE TABLE MyTable (
    ID INT IDENTITY(100,10) PRIMARY KEY,
    Name VARCHAR(50)
);
3. Composite PRIMARY KEY in OrderDetails:


CREATE TABLE OrderDetails (
    OrderID INT,
    ProductID INT,
    Quantity INT,
    PRIMARY KEY (OrderID, ProductID)
);


Purpose of COALESCE and ISNULL in SQL Server
Both COALESCE and ISNULL are used to handle NULL values — meaning missing or unknown data in a column.






. Create Employees table with PRIMARY KEY and UNIQUE on Email

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    FullName VARCHAR(100),
    Email VARCHAR(100) UNIQUE
);
EmpID is the main identifier — PRIMARY KEY.

Email must be unique — UNIQUE constraint.

 Create FOREIGN KEY with ON DELETE CASCADE and ON UPDATE CASCADE

ALTER TABLE Employees
ADD DepartmentID INT,
CONSTRAINT FK_Employees_Departments FOREIGN KEY (DepartmentID)
REFERENCES Departments(DepartmentID)
ON DELETE CASCADE
ON UPDATE CASCADE;
