SELECT.FROM Customer;

SELECT product_Name, category FROM Product
WHERE price BETWEEN 5000 AND 10000

SELECT* FROM Product
ORDER BY price DESC;

SELECT COUNT(*) AS total_orders,
AVG(amount) AS average_amount
MAX(amount) AS highest_total_amount
MIN(amount) AS lowest_total_amount
FROM orders;

SELECT product_id COUNT(order_id) AS order_count
FROM orders_details
GROUP BY product_id;

SELECT customer_id
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) > 2;

SELECT 
    EXTRACT(MONTH FROM order_date) AS month,
    COUNT(order_id) AS order_count
FROM orders
WHERE EXTRACT(YEAR FROM order_date) = 2020
GROUP BY EXTRACT(MONTH FROM order_date);

SELECT o.order_id, p.product_name, c.customer_name, o.order_date
FROM orders o
INNER JOIN order_details od ON o.order_id = od.order_id
INNER JOIN products p ON od.product_id = p.product_id
INNER JOIN customers c ON o.customer_id = c.customer_id;

SELECT * 
FROM orders 
WHERE order_date >= CURRENT_DATE - INTERVAL '3 months'
AND order_date < CURRENT_DATE - INTERVAL '2 months';

SELECT customer_id
FROM customers
WHERE customer_id NOT IN (SELECT DISTINCT customer_id FROM orders);
