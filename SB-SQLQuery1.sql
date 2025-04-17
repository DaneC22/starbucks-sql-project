-- Starbucks Store Distribution Analysis
-- Author: Dane Condes
-- Dataset: Starbucks Store Locations
-- Tool: SQL Server Management Studio

-- View Data
Select *
From PortfolioProject..Starbucks_Final

--  1. Total Stores per Country

SELECT Country, COUNT(*) AS Store_Count
FROM PortfolioProject..Starbucks_Final
GROUP BY Country
ORDER BY Store_Count DESC;

-- 2. Average Stores per City in Top 5 Countries
SELECT Country, City, COUNT(*) AS Store_Count
FROM PortfolioProject..Starbucks_Final
GROUP BY Country, City
HAVING Country IN  ('US','CA', 'CH', 'UK', 'MX')
ORDER BY Store_Count DESC;

-- 3. Company-Owned vs. Licensed Stores per Country

SELECT Country, [Ownership Type], COUNT(*) AS Count
FROM PortfolioProject..Starbucks_Final
GROUP BY Country, [Ownership Type]
ORDER BY Country;

-- 4. Store Distribution by Timezone
SELECT Timezone, COUNT(*) AS Store_Count
FROM PortfolioProject..Starbucks_Final
GROUP BY Timezone
ORDER BY Store_Count DESC;

-- 5. Top 10 Cities by Store Count (with cleanup for Shanghai)

UPDATE PortfolioProject..Starbucks_Final
SET City = 'Shanghai'
WHERE City = N'ä¸Šæµ·å¸‚' OR City = N'上海市';

SELECT City, Country, COUNT(*) AS Store_Count
FROM PortfolioProject..Starbucks_Final
GROUP BY City, Country
ORDER BY Store_Count DESC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;


