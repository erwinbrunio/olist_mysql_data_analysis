WITH category_revenue AS (
    SELECT
    p.product_category_name,
    ROUND(SUM(oi.price),2)  AS revenue
    FROM customers AS c
JOIN orders AS o ON c.customer_id = o.customer_id
JOIN order_items AS oi ON o.order_id = oi.order_id
   JOIN products AS p ON oi.product_id = p.product_id
GROUP BY p.product_category_name
) SELECT
    product_category_name AS Category,
    revenue,
    SUM(revenue) OVER () AS Total_Revenue,
    ROUND(revenue / SUM(revenue) OVER () *100,2) AS Percent_Total_Revenue
FROM category_revenue
ORDER BY revenue DESC
LIMIT 1;
