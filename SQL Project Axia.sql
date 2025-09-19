CREATE DATABASE retail_sales_data;

SELECT * FROM retail_sales_analysis;

# change of spelling for column
ALTER TABLE retail_sales_analysis CHANGE quantiy quantity INT;
ALTER TABLE retail_sales_analysis CHANGE ï»¿transactions_id transactions_id INT;

# check for NULL values
SELECT * FROM retail_sales_analysis WHERE transactions_id IS NULL;

#Look at sample data
SELECT * FROM retail_sales_analysis LIMIT 10;

#Check distinct categories:
SELECT DISTINCT category FROM retail_sales_analysis;

#Summary by category
SELECT category, COUNT(*) AS total_transactions, SUM(total_sale) AS Revenue
FROM retail_sales_analysis
GROUP BY category;


#Summary statistics:
SELECT COUNT(*) AS total_transactions,
AVG(total_sale) AS Avg_sales,
SUM(total_sale) AS Total_Revenue,
SUM(quantity) AS Total_quantity
FROM retail_sales_analysis;

#Sales made on '2022-11-05'
SELECT * FROM retail_sales_analysis WHERE sale_date = '2022-11-05';

#Clothing transactions, qty > 4, Nov 2022:
SELECT * FROM retail_sales_analysis 
WHERE category = 'Clothing'
AND quantity > 4
AND sale_date BETWEEN '2022-11-01' AND '2022-11-30';

#Clothing transactions, qty > 2, Nov 2022:
SELECT * FROM retail_sales_analysis 
WHERE category = 'Clothing'
AND quantity > 2
AND sale_date BETWEEN '2022-11-01' AND '2022-11-30';

#Total sales per category
SELECT category, SUM(total_sale) AS Total_Sales
FROM retail_sales_analysis
GROUP BY category;

#Avg age of customers who purchased 'Beauty'
SELECT category, AVG(age) AS Average_age
FROM retail_sales_analysis
WHERE category = 'Beauty';

#Transactions where total_sale > 1000:
SELECT * FROM retail_sales_analysis WHERE total_sale > 1000;

#Number of transactions by gender in each category
SELECT COUNT(transactions_id) AS Total_transactions, gender, category
FROM retail_sales_analysis
GROUP BY gender, category;

#Average sale per month & best-selling month
SELECT AVG(total_sale) AS Average_sales, SUM(total_sale) AS Total_sales,
MONTH(sale_date) AS month, YEAR(sale_date) AS year
FROM retail_sales_analysis
GROUP BY month, year
ORDER BY Total_sales DESC;

#change of sale_date datatype
UPDATE retail_sales_analysis
SET sale_date = STR_TO_DATE(sale_date, '%m/%d/%Y');

#change of sale_time datatype
UPDATE retail_sales_analysis
SET sale_time = STR_TO_DATE(sale_time, '%H:%i:%s');

SELECT * FROM retail_sales_analysis;

#Top 5 customers by total sales
SELECT customer_id, SUM(total_sale) AS Total_sale
FROM retail_sales_analysis
GROUP BY customer_id
ORDER BY Total_sale
LIMIT 5;

#Number of unique customers per category
SELECT category, COUNT(DISTINCT customer_id) AS Customer_id
FROM retail_sales_analysis
GROUP BY category;

#Shift-based orders
SELECT 
CASE
WHEN HOUR(sale_time) < 12 THEN 'Morning'
WHEN HOUR(sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
ELSE 'Evening'
END AS Shift,
COUNT(transactions_id) AS num_orders
FROM retail_sales_analysis
GROUP BY Shift;

#Total transactions 
SELECT COUNT(transactions_id) AS Total_Num
FROM retail_sales_analysis;
