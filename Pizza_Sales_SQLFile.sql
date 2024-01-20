SELECT * FROM pizza_sales

SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales;

SELECT SUM(total_price)/COUNT(DISTINCT order_id) AS Avg_Order_Value FROM pizza_sales;

SELECT SUM(quantity) AS Total_pizza_sold FROM pizza_sales;

SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales;

SELECT CAST(CAST(SUM(quantity) AS decimal(10,2))/CAST(COUNT(DISTINCT order_id) AS decimal(10,2)) AS decimal(10,2)) AS Avg_Pizza_Per_Order FROM pizza_sales;

SELECT DATEPART(hour, order_time) AS Order_Hour,SUM(quantity) AS Total_Pizza_Sold from pizza_sales 
group by DATEPART(hour, order_time) 
order by DATEPART(hour, order_time);

SELECT DATEPART(ISO_WEEK, order_date) AS Order_week_number,YEAR(order_date) as order_year,COUNT(distinct order_id) AS Total_orders 
from pizza_sales 
group by DATEPART(ISO_WEEK, order_date),YEAR(order_date) 
order by DATEPART(ISO_WEEK, order_date),YEAR(order_date) ;

SELECT pizza_category, sum(total_price) AS Total_Sales,SUM(total_price)*100/(select sum(total_price) from pizza_sales) As Pct_Total_Sales
from pizza_sales 
group by pizza_category;


SELECT pizza_category, sum(total_price) AS Total_Sales,SUM(total_price)*100/(select sum(total_price) from pizza_sales where MONTH(order_date)= 1) As Pct_Total_Sales
from pizza_sales 
where MONTH(order_date) = 1 
group by pizza_category;
 
 SELECT pizza_size, cast(sum(total_price) AS decimal(10,3)) AS Total_Sales,cast(SUM(total_price)*100/(select sum(total_price) from pizza_sales) as decimal(10,2)) As Pct_Total_Sales
from pizza_sales 
group by pizza_size
order by Pct_Total_Sales;

select top 5 pizza_name,sum(total_price) as pizzas_Total_Revenue from pizza_sales
group by pizza_name
order by pizzas_Total_Revenue ;

select top 5 pizza_name,sum(quantity) as Total_Qunatity from pizza_sales
group by pizza_name
order by Total_Qunatity ;

