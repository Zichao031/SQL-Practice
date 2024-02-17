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
