-- Brazilian E-Commerce Sales Analysis 
-- Analysis Queries - Customer Behavior & Seller Performance

USE brazilian_ecommerce;


-- Section 1
-- Section Description: Sales & Revenue

-- Q 1: Monthy order and revenue trend
SELECT 
    DATE_FORMAT(o.order_purchase_timestampm '%Y-%m') AS order_month,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(oi.price), 2) AS monthly_revenue
FROM order o 
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.oreder_status = 'delivered'
GROUP BY order_month 
ORDER BY order_month;

-- Q 2: Top 10 product categories by total revenue
SELECT
    p.product_category_name,
    COUNT(DISTINCT oi.order_id) AS total_orders
    SUM(oi.price) AS total_revenue
    ROUND(AVG(oi.price), 2) AS avg_item_price
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
WHERE p.product_category_name IS NO NULL
GROUP BY p.product_category_name
ORDER BY total_revenue Description
limit 10;