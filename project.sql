/* 1. Basic Select and Filtering
Retrieve all orders where the discount is greater than 0.3 and profit is positive. */
SELECT *
FROM superstore
WHERE Discount > 0.3 AND Profit > 0;

/* 2. Aggregation with GROUP BY
Find the total quantity sold and average discount per sub-category. */
SELECT SubCategory, SUM(Quantity) AS Total_Quantity,AVG(discount)
FROM superstore
GROUP BY SubCategory;

/* 3. Using IN with Multiple Filters
Retrieve all records where the category is either 'Furniture' or 'Office Supplies' and the sales exceed $500. */
SELECT *
FROM superstore
WHERE Category IN ('Furniture','Office Supplies') AND Sales > 500;

/* 4. Subquery
Retrieve the states with total sales above the average sales. */
SELECT State, SUM(Sales) AS TotalSales 
FROM superstore 
GROUP BY State 
HAVING TotalSales > (SELECT AVG(Sales) FROM superstore);

/* 5. HAVING Clause
Retrieve sub-categories where the total sales exceed $10,000, and total quantity ordered is greater than 100. */
SELECT SubCategory, SUM(Sales) AS TotalSales, SUM(Quantity) AS TotalQuantity 
FROM superstore 
GROUP BY SubCategory 
HAVING TotalSales > 10000 AND TotalQuantity > 100;

/* 6. Using LIKE
Retrieve all records where the city name starts with the letter 'S.' */
SELECT * 
FROM superstore 
WHERE City LIKE 'S%';

/* 7. UNION
Combine two queries: one that retrieves orders from the "West" region, and another that retrieves orders from the "East" region. */
SELECT * 
FROM superstore 
WHERE Region = 'West'
UNION 
SELECT * 
FROM superstore 
WHERE Region = 'East';

/* 8. Views
Create a view that shows the total sales and profit for each state.*/
CREATE VIEW StateSalesAndProfit AS
SELECT State, SUM(Sales) AS TotalSales, SUM(Profit) AS TotalProfit 
FROM superstore 
GROUP BY State;

