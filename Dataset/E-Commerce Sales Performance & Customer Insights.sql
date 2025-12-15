CREATE DATABASE ecommerce_sales_and_performance;
USE ecommerce_sales_and_performance;

SELECT*FROM customers;

SELECT SUM(quantity * unitprice) AS total_revenue
FROM sales;

SELECT category,
       SUM(quantity * unitprice) AS revenue
FROM sales
GROUP BY category;

SELECT SUM(s.quantity * s.unitprice) AS completed_revenue
FROM sales s
JOIN orders o ON s.orderid = o.orderid
WHERE o.orderstatus = 'Completed';

SELECT c.customername,
       SUM(s.quantity * s.unitprice) AS revenue
FROM customers c
JOIN orders o ON c.customerid = o.customerid
JOIN sales s ON o.orderid = s.orderid
GROUP BY c.customername
ORDER BY revenue DESC
LIMIT 5;

SELECT c.city,
       SUM(s.quantity * s.unitprice) AS revenue
FROM customers c
JOIN orders o ON c.customerid = o.customerid
JOIN sales s ON o.orderid = s.orderid
GROUP BY c.city;

