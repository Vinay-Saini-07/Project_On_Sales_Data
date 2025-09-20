CREATE TABLE Sales(    
                   Hour_of_day smallint,
                   Cash_type varchar(10),
                   Money numeric(5,2),
                   Coffee_name varchar(25),
                   Time_of_Day varchar(10),
                   Weekday varchar(7),
                   Month_name varchar(8),
                   Weekdaysort smallint,
                   Monthsort smallint,
                   Date date,
                   Time time
);


SELECT * FROM sales;

COPY Sales(hour_of_day,cash_type,money,coffee_name,Time_of_Day,Weekday,Month_name,Weekdaysort,Monthsort,Date,Time)
FROM 'D:\Coffe_sales.csv'
CSV HEADER;


--1.Calculate the total revenue generated from all coffee sales.
SELECT SUM(money) AS Total_Revenu
FROM Sales;


--2.Find the top 5 coffee products based on total sales amount.
SELECT  coffee_name,SUM(money) AS Total_Sales_amount
FROM sales
GROUP BY coffee_name
ORDER BY Total_Sales_amount DESC
LIMIT 5;


--3.Count the number of orders for each coffee category.
SELECT coffee_name,COUNT(coffee_name) 
FROM Sales
GROUP BY coffee_name;

--4.Show monthly total sales trend to see peak months.
SELECT month_name,monthsort,SUM(money) AS Monthly_Sales
FROM Sales
GROUP BY month_name,monthsort
ORDER BY monthsort;

--5.Identify which coffee has the highest total revenue.
SELECT coffee_name,SUM(money) AS Per_Coffee_Revenu
FROM Sales
GROUP BY coffee_name
ORDER BY Per_Coffee_Revenu DESC
LIMIT 1;

--6.Calculate the average sales amount per order.
SELECT ROUND(AVG(money)) AS Average_Per_order
FROM sales;

--7.Count how many orders are placed per day of week.
SELECT weekday,COUNT(coffee_name) AS Order_Placed_by_Per_Week
FROM sales
GROUP BY weekday
ORDER BY Order_Placed_by_Per_Week  ;

--8.List all orders where total order amount > ₹1000.
SELECT coffee_name,money FROM sales
WHERE money>30;


--9.Find the average, minimum, and maximum price of each product.
SELECT coffee_name,
ROUND(AVG(money)) AS Average_Price,
ROUND(MAX(money)) AS Maximum_price,
ROUND(MIN(money)) AS Minimum_Price
FROM sales
GROUP BY coffee_name;

--10.Calculate the total money earned from all coffee sales.
SELECT coffee_name,
SUM(money) AS Total_Money
FROM sales
GROUP BY coffee_name
ORDER BY Total_Money DESC;


--11.Show the total sales (SUM(money)) for each Date.
SELECT date,
SUM(money) AS Total_Sales
FROM sales
GROUP BY date
ORDER BY date;

--12.Find total revenue and total quantity (count of rows) for each coffee_name.
SELECT Coffee_name,
SUM(money) AS Revenu,
COUNT(Coffee_name) AS Quantity
FROM Sales
GROUP BY Coffee_name;

--13.Identify the top 5 coffee products by total sales amount.
SELECT Coffee_name,
SUM(money) AS Sales_Amount
FROM Sales
GROUP BY Coffee_name
ORDER BY Sales_Amount DESC
LIMIT 5;


--14.Calculate total sales for each Time_of_Day (Morning, Afternoon, Evening).
SELECT time_of_day,
SUM(money) AS Total_Sales
FROM Sales
GROUP BY time_of_day;

--15.Show total sales grouped by Weekday, sorted using Weekdaysort.
SELECT weekday,weekdaysort,
SUM(money) AS Total_Sales
FROM Sales
GROUP BY weekday,weekdaysort
ORDER BY Weekdaysort;

--16.Find which hour_of_day has the highest total sales.
SELECT hour_of_day,
SUM(money) AS Total_Sales
FROM Sales
GROUP BY hour_of_day
Order By Total_Sales DESC
LIMIT 1;


