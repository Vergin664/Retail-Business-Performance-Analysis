CREATE DATABASE online_retail;
USE online_retail;

SELECT * FROM cleaned_online_relatil;

-- Calculate total sales by product and category
SELECT StockCode,
       Description,
       SUM(Quantity) AS TotalQuantitySold,
       SUM(TotalPrice) AS TotalSales,
       AVG(UnitPrice) AS AverageUnitPrice
FROM cleaned_online_relatil
GROUP BY StockCode, Description
ORDER BY TotalSales DESC;


-- Identify slow-moving products (those with low sales or quantity sold)
SELECT StockCode,
       Description,
       SUM(Quantity) AS TotalQuantitySold,
       SUM(TotalPrice) AS TotalSales
FROM cleaned_online_relatil
GROUP BY StockCode, Description
HAVING SUM(Quantity) < 50  
ORDER BY TotalQuantitySold ASC;


-- Calculate sales and turnover by product
SELECT StockCode, 
       Description, 
       SUM(Quantity) AS TotalQuantitySold, 
       SUM(TotalPrice) AS TotalSales,
       AVG(UnitPrice) AS AverageUnitPrice
FROM cleaned_online_relatil
GROUP BY StockCode, Description
ORDER BY TotalQuantitySold DESC;

-- Sales by month and year (seasonality analysis)
SELECT Year,
       Month,
       SUM(TotalPrice) AS TotalSales,
       SUM(Quantity) AS TotalQuantitySold
FROM cleaned_online_relatil
GROUP BY Year, Month
ORDER BY Year, Month;


-- Sales by weekday
SELECT Weekday,
       SUM(TotalPrice) AS TotalSales,
       SUM(Quantity) AS TotalQuantitySold
FROM cleaned_online_relatil
GROUP BY Weekday
ORDER BY TotalSales DESC;


-- Sales by country
SELECT Country,
       SUM(TotalPrice) AS TotalSales,
       SUM(Quantity) AS TotalQuantitySold
FROM cleaned_online_relatil
GROUP BY Country
ORDER BY TotalSales DESC;


-- High sales products (Top 10)
SELECT StockCode,
       Description,
       SUM(TotalPrice) AS TotalSales,
       SUM(Quantity) AS TotalQuantitySold
FROM cleaned_online_relatil
GROUP BY StockCode, Description
ORDER BY TotalSales DESC
LIMIT 10;


-- Trend analysis of sales over time (by month or year)
SELECT Year, 
       Month, 
       SUM(TotalPrice) AS TotalSales
FROM cleaned_online_relatil
GROUP BY Year, Month
ORDER BY Year, Month;


-- Profitable products based on total sales and quantity
SELECT StockCode,
       Description,
       SUM(TotalPrice) AS TotalSales,
       SUM(Quantity) AS TotalQuantitySold
FROM cleaned_online_relatil
GROUP BY StockCode, Description
HAVING SUM(TotalPrice) > 1000  
ORDER BY TotalSales DESC;





