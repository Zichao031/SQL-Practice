-- 1. How many products can you find in the Production.Product table? 504
SELECT COUNT(ProductID) AS ProductNum
FROM Production.Product 

-- 2. Write a query that retrieves the number of products in the Production.Product table that are included in a subcategory. 
-- The rows that have NULL in column ProductSubcategoryID are considered to not be a part of any subcategory.
SELECT COUNT(ProductID) AS ProductNumInSubcategory
FROM Production.Product 
WHERE ProductSubcategoryID IS NOT NULL

-- 3. How many Products reside in each SubCategory? Write a query to display the results with the following titles.
-- ProductSubcategoryID CountedProducts
SELECT ProductSubcategoryID, COUNT(ProductID) AS CountedProducts
FROM Production.Product
WHERE ProductSubcategoryID IS NOT NULL
GROUP BY ProductSubcategoryID


-- 4. How many products that do not have a product subcategory.
SELECT COUNT(ProductID) AS ProductNumberNoSubcategory
FROM Production.Product
WHERE ProductSubcategoryID IS NULL

-- 5. Write a query to list the sum of products quantity in the Production.ProductInventory table.
SELECT SUM(Quantity) AS ProductsQuantity
FROM Production.ProductInventory

-- 6.Write a query to list the sum of products in the Production.ProductInventory table
--  and LocationID set to 40 and limit the result to include just summarized quantities less than 100.
--  ProductID    TheSum
SELECT ProductID, SUM(Quantity) AS TheSum
FROM Production.ProductInventory
WHERE LocationID = 40 AND Quantity < 100
GROUP BY ProductID

-- 7.Write a query to list the sum of products with the shelf information in the Production.ProductInventory table 
-- and LocationID set to 40 and limit the result to include just summarized quantities less than 100
    -- Shelf      ProductID    TheSum
SELECT Shelf, ProductID, SUM(Quantity) AS TheSum
FROM Production.ProductInventory
WHERE LocationID = 40 AND Quantity < 100
GROUP BY Shelf, ProductID

-- 8. Write the query to list the average quantity for products 
-- where column LocationID has the value of 10 from the table Production.ProductInventory table.
SELECT AVG(Quantity) AS AvgQuantity
FROM Production.ProductInventory
WHERE LocationID = 10

-- 9. Write query  to see the average quantity of products by shelf from the table Production.ProductInventory
-- ProductID   Shelf      TheAvg
SELECT ProductID, shelf, AVG(quantity) AS TheAvg
FROM Production.ProductInventory
GROUP BY ProductID, shelf

-- 10.  Write query  to see the average quantity  of  products by shelf 
-- excluding rows that has the value of N/A in the column Shelf from the table Production.ProductInventory
--  ProductID   Shelf      TheAvg
SELECT ProductID, Shelf, AVG(quantity) AS TheAvg
FROM Production.ProductInventory
WHERE Shelf IS NOT NULL
GROUP BY ProductID, Shelf 

-- 11.  List the members (rows) and average list price in the Production.Product table. 
-- This should be grouped independently over the Color and the Class column. 
-- Exclude the rows where Color or Class are null.
    -- Color  Class  TheCount  AvgPrice  
SELECT Color, Class, COUNT(*) AS TheCount, AVG(ListPrice) AS AvgPrice
FROM Production.Product
WHERE Color IS NOT NULL AND Class IS NOT NULL
GROUP BY Color, Class

-- Joins:
-- 12. Write a query that lists the country and province names from person.CountryRegion and person.StateProvince tables. 
-- Join them and produce a result set similar to the following.
    -- Country  Province
SELECT c.Name AS Country, s.name AS Province
FROM person.CountryRegion c JOIN person.StateProvince s ON c.CountryRegionCode = s.CountryRegionCode

-- 13.  Write a query that lists the country and province names from person. CountryRegion and person. StateProvince tables 
-- and list the countries filter them by Germany and Canada. 
-- Join them and produce a result set similar to the following.
    -- Country  Province
SELECT c.Name AS Country, s.name AS Province
FROM person.CountryRegion c JOIN person.StateProvince s ON c.CountryRegionCode = s.CountryRegionCode
WHERE c.name = 'Germany' OR c.name = 'Canada'


--  Using Northwnd Database: (Use aliases for all the Joins)

-- 14.  List all Products that has been sold at least once in last 26 years.
SELECT Distinct ProductName
FROM [Order Details] od
JOIN Products p on p.ProductID = od.ProductID

-- 15.  List top 5 locations (Zip Code) where the products sold most.

SELECT TOP 5 ShipPostalCode, SUM(Quantity) AS TotalSold
FROM [Order Details] od
JOIN Orders o ON o.OrderID = od.OrderID
GROUP BY ShipPostalCode 
ORDER BY TotalSold DESC



-- 16.  List top 5 locations (Zip Code) where the products sold most in last 26 years.

SELECT TOP 5 ShipPostalCode, SUM(Quantity) AS TotalSold
FROM [Order Details] od
JOIN Orders o ON o.OrderID = od.OrderID
WHERE YEAR(CURRENT_TIMESTAMP)- YEAR(OrderDate) <= 26
GROUP BY ShipPostalCode 
ORDER BY TotalSold DESC

-- 17.   List all city names and number of customers in that city.     
SELECT ShipCity, COUNT(CustomerID) AS NumberOfCustomer
FROM Orders
GROUP BY ShipCity

-- 18.  List city names which have more than 2 customers, and number of customers in that city
SELECT ShipCity, COUNT(CustomerID) AS NumberOfCustomer
FROM Orders
GROUP BY ShipCity HAVING COUNT(CustomerID) > 2

-- 19.  List the names of customers who placed orders after 1/1/98 with order date.
SELECT ContactName
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE OrderDate > '1998-01-01'

-- 20.  List the names of all customers with most recent order dates
SELECT ContactName, MAX(OrderDate)
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY ContactName

-- 21.  Display the names of all customers  along with the  count of products they bought
SELECT ContactName, SUM(Quantity) AS TotalProductBought
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID JOIN [Order Details] od ON od.OrderID = o.OrderID
GROUP BY ContactName

-- 22.  Display the customer ids who bought more than 100 Products with count of products.
SELECT o.CustomerID, SUM(Quantity) AS TotalProductBought
FROM Orders o JOIN [Order Details] od ON od.OrderID = o.OrderID
GROUP BY o.CustomerID HAVING SUM(Quantity) > 100

-- 23.  List all of the possible ways that suppliers can ship their products. Display the results as below
    -- Supplier Company Name                Shipping Company Name
SELECT supply.CompanyName, ship.CompanyName
FROM Shippers ship
CROSS JOIN Suppliers supply

-- 24.  Display the products order each day. Show Order date and Product Name.
SELECT OrderDate, ProductName
FROM Orders o JOIN [Order Details] od ON od.OrderID = o.OrderID JOIN Products p ON p.ProductID = od.ProductID

-- 25.  Displays pairs of employees who have the same job title.
SELECT e1.FirstName + ' ' + e1.LastName AS employees1, e2.FirstName + ' '+ e2.LastName AS employees1
FROM Employees e1 JOIN Employees e2 ON e1.Title = e2.Title
WHERE e1.EmployeeID < e2.EmployeeID

-- 26.  Display all the Managers who have more than 2 employees reporting to them.
SELECT m.EmployeeID, m.FirstName, m.LastName, COUNT(e1.EmployeeID)
FROM Employees e1, Employees m
WHERE e1.ReportsTo = m.EmployeeID
GROUP BY m.EmployeeID, m.FirstName, m.LastName HAVING COUNT(e1.EmployeeID) > 2

-- 27.  Display the customers and suppliers by city. The results should have the following columns
SELECT City, CompanyName, ContactName, Relationship AS Type
FROM [Customer and Suppliers by City]
-- City

-- Name

-- Contact Name,

-- Type (Customer or Supplier)

