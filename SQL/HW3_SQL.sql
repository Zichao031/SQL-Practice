-- All scenarios are based on Database NORTHWIND.

-- 1.      List all cities that have both Employees and Customers.
SELECT DISTINCT City
FROM Employees 
WHERE City IN (
    SELECT DISTINCT City 
    FROM Customers
)
-- 2.      List all cities that have Customers but no Employee.

    -- a.      Use sub-query
    SELECT DISTINCT City
    FROM Customers 
    WHERE City NOT IN (
        SELECT DISTINCT City 
        FROM Employees
    )

    -- b.      Do not use sub-query
    SELECT DISTINCT c.City
    FROM Customers c 
    LEFT JOIN Employees e ON c.City = e.City
    WHERE e.City IS NULL

-- 3.      List all products and their total order quantities throughout all orders.
SELECT p.ProductID, ProductName, COUNT(Quantity) AS TotalOrderQuantities
FROM Products p 
LEFT JOIN [Order Details] od ON od.ProductID = p.ProductID 
GROUP BY p.ProductID, ProductName

-- 4.      List all Customer Cities and total products ordered by that city.
SELECT City, SUM(Quantity) AS TotalProducts
FROM Customers c
LEFT JOIN Orders o ON o.CustomerID = c.CustomerID 
JOIN [Order Details] od ON od.OrderID = o.OrderID
GROUP BY City
-- 5.      List all Customer Cities that have at least two customers.

    -- a.      Use union
    SELECT City
    FROM Customers 
    GROUP BY City HAVING COUNT(CustomerID) >= 2
    UNION
    SELECT City
    FROM Customers 
    GROUP BY City HAVING COUNT(CustomerID) >= 2
    -- b.      Use sub-query and no union
    SELECT DISTINCT City
    FROM Customers 
    GROUP BY City HAVING COUNT(CustomerID) >= 2
-- 6.      List all Customer Cities that have ordered at least two different kinds of products.
SELECT DISTINCT City
FROM Customers
WHERE City IN (
    SELECT DISTINCT ShipCity
    FROM Orders o 
    JOIN [Order Details] od ON o.OrderID = od.OrderID
    GROUP BY ShipCity HAVING COUNT(od.ProductID) >= 2 
)
-- 7.      List all Customers who have ordered products, but have the ‘ship city’ on the order  different from their own customer cities.
SELECT DISTINCT c.CustomerID, ContactName
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID 
WHERE ShipCity <> City

-- 8.      List 5 most popular products, their average price, and the customer city that ordered most quantity of it.
SELECT TOP 5 p.ProductID, ProductName, SUM(od.UnitPrice * Quantity) / sum(Quantity) AS AvgPrice, ShipCity
FROM Products p
LEFT JOIN [Order Details] od ON od.ProductID = p.ProductID
JOIN Orders o ON o.OrderID = od.OrderID
GROUP BY p.ProductID, ProductName, ShipCity
ORDER BY SUM(Quantity) DESC

-- 9.      List all cities that have never ordered something but we have employees there.

    -- a.      Use sub-query
    SElECT City
    FROM Employees
    WHERE City NOT IN (
        SELECT DISTINCT ShipCity
        FROM Orders 
    )
    -- b.      Do not use sub-query
    SElECT City
    FROM Employees e
    LEFT JOIN Orders o ON e.City = o.ShipCity
    WHERE o.ShipCity IS NULL


-- 10.  List one city, if exists, that is the city from where the employee sold most orders (not the product quantity) is, 
-- and also the city of most total quantity of products ordered from. (tip: join  sub-query)
SELECT t1.City
FROM (select TOP 1 City
    FROM Employees e
    LEFT JOIN Orders o ON o.EmployeeID = e.EmployeeID 
    JOIN [Order Details] od on o.OrderID = od.OrderID
    GROUP BY City 
    ORDER BY SUM(Quantity)) t1 
JOIN (select TOP 1 ShipCity as City
    FROM Orders o 
    JOIN [Order Details] od on o.OrderID = od.OrderID
    GROUP BY ShipCity 
    ORDER BY SUM(Quantity)) t2 ON t1.City = t2.City

-- 11. How do you remove the duplicates record of a table?
CREATE TABLE duplicateTest (
    Id INT
);

INSERT INTO duplicateTest VALUES (1), (1), (2), (2), (3), (4), (5)

SELECT * FROM dbo.duplicateTest 

DECLARE @id int = 1

IF EXISTS (SELECT count(*) FROM dbo.duplicateTest WHERE ID = @id HAVING count(*) > 1 )
BEGIN
   SET ROWCOUNT 1 
   DELETE FROM dbo.duplicateTest WHERE ID = @id 
   SET ROWCOUNT 0 
END

SELECT * FROM dbo.duplicateTest

DROP TABLE duplicateTest;