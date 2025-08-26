-- Show all data

USE pizza_db;


---- Show all data
SELECT * FROM pizza_sales;

-- Total Revenue
SELECT SUM(total_price) AS Total_Revenue
FROM pizza_sales;

-- Average Order Value
SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value
FROM pizza_sales;

-- Total Pizzas Sold
SELECT SUM(quantity) AS Total_pizza_sold
FROM pizza_sales;

-- Total Orders
SELECT COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales;

-- Avg Pizzas per Order
SELECT 
    CAST(SUM(quantity) AS DECIMAL(10,2)) /  
    CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) 
    AS Avg_Pizzas_per_order
FROM pizza_sales;

-- Orders by Weekday
SELECT 
    DAYNAME(order_date) AS order_day, 
    COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY DAYNAME(order_date)
ORDER BY MIN(order_date);

-- Orders by Month
SELECT 
    MONTHNAME(order_date) AS Month_Name, 
    COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY MONTHNAME(order_date)
ORDER BY MIN(order_date);
SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category;
-- Orders by Weekday
-- Orders by Weekday
SELECT 
    DAYNAME(STR_TO_DATE(order_date, '%d-%m-%Y')) AS order_day, 
    COUNT(DISTINCT order_id) AS total_orders
FROM pizza_db.pizza_sales
GROUP BY DAYNAME(STR_TO_DATE(order_date, '%d-%m-%Y'))
ORDER BY MIN(STR_TO_DATE(order_date, '%d-%m-%Y'));

-- Orders by Month
SELECT 
    MONTHNAME(STR_TO_DATE(order_date, '%d-%m-%Y')) AS Month_Name, 
    COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_db.pizza_sales
GROUP BY MONTHNAME(STR_TO_DATE(order_date, '%d-%m-%Y'))
ORDER BY MIN(STR_TO_DATE(order_date, '%d-%m-%Y'));
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size;
SELECT pizza_size, 
       CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
       CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_db.pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size;
SELECT 
    pizza_category, 
    SUM(quantity) AS Total_Quantity_Sold
FROM pizza_sales
WHERE MONTH(STR_TO_DATE(order_date, '%d-%m-%Y')) = 2   -- February
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC;
SELECT 
    pizza_name, 
    SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC
LIMIT 5;
SELECT 
    pizza_name, 
    SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC
LIMIT 5;
SELECT pizza_name, 
       SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC
LIMIT 5;
SELECT pizza_name, 
       SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC
LIMIT 5;
SELECT 
       pizza_name, 
       COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC
LIMIT 5;
SELECT 
       pizza_name, 
       COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC
LIMIT 5;
SELECT 
       pizza_name, 
       COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
WHERE pizza_category = 'Classic'
GROUP BY pizza_name
ORDER BY Total_Orders ASC
LIMIT 5;
SELECT @@hostname;
SELECT @@version;




















