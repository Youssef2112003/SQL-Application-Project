USE Northwind2021;
--1
SELECT * 
FROM
Customer;

--2
SELECT FirstName,LastName,Phone 
FROM
Customer; 

--3
SELECT FirstName+''+LastName AS Full_Name,Phone 
FROM
Customer
WHERE
Country='Mexico';


--4
SELECT productname,unitprice,(unitprice*1.15) AS "Price After Taxes" 
FROM 
Product
WHERE
UnitPrice>50;

--5
SELECT companyname,city,phone,Country 
FROM 
Supplier
WHERE 
Country NOT IN ('USA','UK');

--6
SELECT COMPANYNAME, PRODUCTNAME,UNITPRICE
FROM
Supplier S
JOIN Product P
ON
S.Id=P.SupplierId
WHERE
COUNTRY ='USA'
ORDER BY
CompanyName ASC;

--7
SELECT FIRSTNAME+''+LASTNAME AS "Full Name" ,COUNT(*) AS "No Of ORDERS" ,SUM(TOTALAMOUNT) AS "Total Paid"
FROM
Customer C
JOIN
Orders O
ON
C.Id=O.CustomerId
GROUP BY
FirstName,LastName;


--8
SELECT Companyname , count(*)
FROM Supplier S JOIN Product P
ON S.ID=P.Id
GROUP BY CompanyName
HAVING COUNT(*)>5
ORDER BY COUNT(*) DESC;


--9
SELECT TOP 5 ProductName,UNITPRICE
FROM Product 
ORDER BY UnitPrice DESC;

--10
SELECT TOP 3 PRODUCTID,COUNT(*)
FROM OrderItem
GROUP BY ProductId
ORDER BY COUNT(*) DESC;


--11
SELECT * FROM Product
WHERE UnitPrice >(SELECT AVG(UNITPRICE) FROM Product);


--12
SELECT DISTINCT FIRSTNAME , LASTNAME FROM
Customer C JOIN Orders O ON C.Id=O.CustomerId
JOIN OrderItem OI ON OI.OrderId=O.Id
WHERE OI.ProductId IN (SELECT DISTINCT OI.ProductId FROM
Customer C JOIN Orders O ON C.Id=O.CustomerId
JOIN OrderItem OI ON OI.OrderId=O.Id AND FirstName='Horst');
