use 7dayssql_chellenge

-- Q1. Total Sales Value
-- Calculate the total value of all order items.
select sum(oi.quantity*oi.unit_price) as total_sales
from orders o
join order_items oi
on o.order_id =oi.order_id
where status <> 'cancelled' ; 

-- Q2. Revenue by Product Category
-- Identify which product categories generate the most sales.
select p.category, sum(oi.quantity*oi.unit_price) as revenue
from orders o
join order_items oi
on o.order_id = oi.order_id
join products p
on oi.product_id=p.product_id
where o.status <> 'cancelled'
group by p.category;

-- 3) Find the ten products generating the highest revenue

SELECT
    p.product_id,
    p.product_name,
    SUM(p.price * oi.quantity) AS revenue
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY revenue DESC
LIMIT 10;



-- Q4. Monthly Revenue Trend

SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS order_month,
    COUNT(*) AS total_orders
FROM orders
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY order_month;

-- Q5. Orders by Sales Channel

SELECT
    channel,
    COUNT(*) AS total_orders
FROM orders
GROUP BY channel
ORDER BY total_orders DESC;

-- Q6. Total Quantity Sold by Product Category

SELECT
    p.category,
    SUM(oi.quantity) AS total_quantity_sold
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.category
ORDER BY total_quantity_sold DESC;

-- Q7. Payment Method Analysis

SELECT
    payment_method,
    COUNT(*) AS total_payments
FROM payments
GROUP BY payment_method;


-- Q8. Payment Status Analysis

SELECT
    payment_status,
    COUNT(*) AS total_payments
FROM payments
GROUP BY payment_status;

-- Q9. Average Payment Amount

SELECT
    AVG(amount) AS average_amount
FROM payments;

-- Q10. Payment Amount by Payment Method

SELECT
    payment_method,
    SUM(amount) AS total_amount
FROM payments
GROUP BY payment_method
ORDER BY total_amount DESC;



