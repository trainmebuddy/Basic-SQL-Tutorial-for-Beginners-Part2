USE MyStoreDB
--1. INSERT DATA IN TO A TABLE USING INSERT STATEMENT

--1. INSERT INTO
  --1.1. Insert the values in the specified columns
  --1.2.Insert the values in the all columns
Syntax: 
INSERT INTO tableName [(column1, column2,..., columnN)] 
VALUES (value1, value2,...,valueN);

INSERT INTO dbo.Customer(CustomerID,FirstName,LastName,Phone)
VALUES (1,'Jonas','Walker','767-555-0113')

--CHEK DATA AFTER INSERT
SELECT * FROM dbo.Customer

--1.2.Insert the values in the all columns
Syntax: 
INSERT INTO tableName
VALUES (value1, value2,...,valueN);

INSERT INTO dbo.Customer 
VALUES (2,'Harish','Rao','451-555-0162','harish@gmail.com','910 Vine Street','Campbell','CA','95008')

--CHEK DATA AFTER INSERT
SELECT * FROM dbo.Customer order by CustomerID

/*1.2. INSERT INTO SELECT
  1.2.1. insert the values in the specified columns.

Syntax:
INSERT INTO destinationTableName [(column1, column2, ... columnN)] 
SELECT column1, column2, ...columnN 
FROM sourceTableName WHERE [condition];*/

INSERT INTO Customer (CustomerID,FirstName,LastName,Phone,Email,City,State)
SELECT CustomerID,FirstName,LastName,Phone,Email,City,State
from CustomerData
where CustomerID in (3,4)

--CHEK DATA AFTER INSERT
SELECT * FROM Customer

--1.2.1. insert the values in ALL columns.
Syntax:
INSERT INTO destinationTableName
SELECT column1, column2, ...columnN 
FROM sourceTableName WHERE [condition];

INSERT INTO Customer
SELECT		[CustomerID]
           ,[FirstName]
		   ,[LastName]
           ,[Phone]
           ,[Email]
           ,[Street]
           ,[City]
           ,[State]
           ,[ZipCode]
FROM [dbo].[CustomerData]
WHERE [CustomerID] NOT IN (1,2,3,4)

--CHEK DATA AFTER INSERT
SELECT * FROM [dbo].[Customer]

/*1.3 SELECT INTO
1.3.1. Copy all columns data from one table to a new table:*/

Syntax:
SELECT *
INTO newtablename
FROM oldtablename
WHERE condition

SELECT *
INTO Customer_bkp_1
from Customer
where CustomerID BETWEEN 1 AND 5

--1.3.2. Copy specified column data from one table to a new table:
Syntax:
SELECT column1, column2, column3, ...
INTO newtablename
FROM oldtablename
WHERE condition

SELECT CustomerID,FirstName,LastName,Phone,Email,City,State
INTO Customer_bkp_2
from Customer
where CustomerID BETWEEN 1 AND 5

--2. UPDATING DATA USING UPDATE STATEMENT
Syntax:
UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition

--2.1. Updating single record
--UPDATE EMAIL ID FOR CUSTOMER Jonas HAING Customer ID 1
SELECT * FROM [dbo].[Customer] WHERE [CustomerID] = 1--CHECK DATA BEFORE UPDATE

--Update one column value for a record
UPDATE [dbo].[Customer]
SET Email = 'jonas@yahoo.com'
WHERE [CustomerID] = 1

SELECT * FROM [dbo].[Customer] WHERE [CustomerID] = 1--CHECK DATA AFTER UPDATE

--Update multiple column value for a record
UPDATE [dbo].[Customer]
SET Email = 'jonas1@gmail.com'
,Phone='767-665-0332'
WHERE [CustomerID] = 1

SELECT * FROM [dbo].[Customer] WHERE [CustomerID] = 1--CHECK DATA AFTER UPDATE

--UPDATE WARNING!
--BE CAREFUL WHILE YOU UPDATE RECORDS. 
--IF YOU OMIT THE WHERE CLAUSE, ALL RECORDS WILL BE UPDATED!

--2.2. Updating all records in a table
SELECT * FROM [dbo].[Employee]--CHECK DATA

--Change all employee salary type from monthly to weekly (without where clause)
UPDATE [dbo].[Employee]
SET SalaryType='W'

SELECT * FROM [dbo].[Employee]--CHECK DATA

--ANOTHER SYNTAX OF UPDATE
Syntax:
UPDATE A SET column1 = value1, column2 = value2, ...
FROM table_name A
WHERE condition

UPDATE A SET SalaryType='W'
FROM [dbo].[Employee] A

SELECT * FROM [dbo].[Employee]--CHECK DATA

--Change employee salary type from weekly to monthly for employee from store 1 (with where clause)
UPDATE A SET SalaryType='M'
FROM [dbo].[Employee] A
WHERE StoreID = 1

SELECT * FROM [dbo].[Employee]--CHECK DATA

--UPDATE WARNING!
--BE CAREFUL WHILE YOU UPDATE RECORDS. IF YOU OMIT THE WHERE CLAUSE, ALL RECORDS WILL BE UPDATED!

--3. Deleting data using DELETE STATEMENT

Syntax:
DELETE FROM table_name 
WHERE condition;


SELECT * FROM [dbo].[Customer]--CHECK DATA

--3.1. Delete records with filter criteria
--Delete customer whose name is willams
DELETE 
FROM [dbo].[Customer] 
WHERE CustomerName='Willams'

SELECT * FROM [dbo].[Customer]--CHECK DATA

--WARNING!!
--BE CAREFUL WHILE deleting records in a table! PLEASE MAKE SURE YOU PUT WHERE CLAUSE IN THE DELETE STATEMENT. 
--THE WHERE CLAUSE SPECIFIES WHICH RECORD(S) SHOULD BE DELETED. 
--IF YOU MISS THE WHERE CLAUSE, ALL RECORDS IN THE TABLE WILL BE DELETED!

--3.2. Delete all records
DELETE FROM [dbo].[Customer]

SELECT * FROM [dbo].[Customer]--CHECK DATA

--4. TRUNCATE STATEMENT
--Syntax:
--TRUNCATE TABLE table_name

TRUNCATE TABLE [dbo].[Customer]
