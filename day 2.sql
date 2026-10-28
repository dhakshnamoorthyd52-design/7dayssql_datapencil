use 7dayssql_chellenge

-- 1 Count the total number of orders
SELECT COUNT(order_id) AS total_orders 
FROM orders;

-- 2 Count how many orders exist for each status

SELECT 
    status, 
    COUNT(order_id) AS order_count
FROM orders
GROUP BY status
ORDER BY order_count DESC;

-- 3 Retrieve the 10 latest orders by order date

SELECT * 
FROM orders
ORDER BY order_date DESC
LIMIT 10;

-- 4 Find the 10 orders with the highest total amount

SELECT ROUND(AVG(orders_total.order_amount), 2) AS average_order_value
FROM (
    SELECT order_id, SUM(quantity * unit_price) AS order_amount
    FROM order_items
    GROUP BY order_id
) AS orders_total;

-- 5 Count orders placed per day in chronological order

SELECT 
    DATE(order_date) AS order_day, 
    COUNT(order_id) AS orders_placed
FROM orders
GROUP BY DATE(order_date)
ORDER BY order_day ASC;

-- 6 Group orders by month using date functions and identify peak and low-volume months

SELECT 
    MONTH(order_date) AS order_month, 
    COUNT(*) AS total_orders
FROM orders
GROUP BY MONTH(order_date)
ORDER BY total_orders DESC;

-- 7 Calculate the average order amount across all orders and round the result for clean reporting

SELECT ROUND(AVG(orders_total.order_amount), 2) AS average_order_value
FROM (
    SELECT order_id, SUM(quantity * unit_price) AS order_amount
    FROM order_items
    GROUP BY order_id
) AS orders_total;

-- 8 Rank customers based on the number of orders placed to find the most active/loyal buyers

	SELECT 
		c.customer_id,
		c.full_name,
		COUNT(o.order_id) AS total_orders
	FROM customers c
	JOIN orders o ON c.customer_id = o.customer_id
	GROUP BY c.customer_id, c.full_name
	ORDER BY total_orders DESC
	LIMIT 10;


insects

1.Total Orders: The business recorded 3,000 total orders.
2.Order Delivery: 1,796 orders (59.9%) were successfully delivered.
3.Returns and Cancellations: 280 orders were returned, and 236 were cancelled.
4.Monthly Performance: August had the highest number of orders, with 300 orders.
5.Average Order Value: The average order value was 20,886.06.
6.Customer Analysis: Tanya Kulkarni and Siddharth Khanna placed the highest number of orders, with 10 each.
7.Business Improvement: Reducing returns and cancellations and improving customer satisfaction could help increase business performance.






