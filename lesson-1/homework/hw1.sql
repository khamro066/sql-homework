--Easy

1.Define the following terms: data, database, relational database, and table.
2..List five key features of SQL Server.
3.What are the different authentication modes available when connecting to SQL Server? (Give at least 2)

--1. Terminlar ta’rifi:
--Data (Ma'lumot) – Faktlar yoki raqamli ifodalar, masalan: ism, yosh, narx.

--Database (Ma'lumotlar bazasi) – Tizimli tarzda saqlangan ma'lumotlar to‘plami.

--Relational Database (Aloqaviy ma'lumotlar bazasi) – Jadval ko‘rinishida ma'lumotlar saqlanadigan baza; jadvallar o‘zaro bog‘langan bo‘ladi.

--Table (Jadval) – Ma'lumotlar qatorlar (rows) va ustunlar (columns) ko‘rinishida saqlanadigan strukturaviy birlik.

--2. SQL Server’ning 5 ta asosiy xususiyati:
--High performance – Katta hajmdagi ma’lumotlarni tezda qayta ishlaydi.

--Security – Ma'lumotlarni himoya qilish uchun kuchli autentifikatsiya va ruxsatlar tizimi.

--Scalability – Kichikdan yirikgacha bo‘lgan loyihalar uchun moslashadi.

--Backup and restore – Ma'lumotlarni zahiralash va tiklash imkoniyati.

--Replication & Mirroring – Ma’lumotlarni nusxalash va uzluksiz ishlashni ta’minlash.

--3. SQL Server’da autentifikatsiya turlari:
--Windows Authentication – Windows foydalanuvchisi orqali tizimga kirish.

--SQL Server Authentication – Login va parol orqali SQL Server’ga alohida kirish.

--Medium

Create a new database in SSMS named SchoolDB.
Write and execute a query to create a table called Students with columns: StudentID (INT, PRIMARY KEY), Name (VARCHAR(50)), Age (INT).
Describe the differences between SQL Server, SSMS, and SQL.

--Create database SchoolDB
--Create table Students (studentID int primary key,name varchar (50),age int)

--SQL Server	Dastur (DBMS)	Ma'lumotlarni saqlaydi va boshqaradi
--SSMS	Grafik interfeys	SQL Server bilan ishlash uchun vizual muhit
--SQL	Dasturlash tili	Ma'lumotlarga so‘rov yuborish uchun ishlatiladi

--Hard

Research and explain the different SQL commands: DQL, DML, DDL, DCL, TCL with examples.
Write a query to insert three records into the Students table.
Restore AdventureWorksDW2022.bak file to your server. (write its steps to submit) 
You can find the database from this link :https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorksDW2022.bak


--1. DQL (Data Query Language)
--Ma'lumotni so'rash uchun ishlatiladi.

--Buyruq: SELECT

-- 2. DML (Data Manipulation Language)
--Ma'lumotni qo‘shish, o‘zgartirish, o‘chirish uchun ishlatiladi.

--Buyruqlar: INSERT, UPDATE, DELETE


--3. DDL (Data Definition Language)
--Jadval va strukturalarni yaratish yoki o‘zgartirish uchun ishlatiladi.

--Buyruqlar: CREATE, ALTER, DROP

--4. DCL (Data Control Language)
--Huquq va ruxsatlarni boshqarish uchun ishlatiladi.

--Buyruqlar: GRANT, REVOKE

-- 5. TCL (Transaction Control Language)
--Tranzaksiyalarni boshqaradi (ya'ni birdan ortiq buyruqlarni bir guruhda bajarish).

--Buyruqlar: COMMIT, ROLLBACK, SAVEPOINT

insert into students values (( 3), ('Rajabboy'),(28))

select * from students
