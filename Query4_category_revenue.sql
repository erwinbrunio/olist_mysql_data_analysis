SELECT
p.product_category_name,
ROUND(SUM(oi.price),2) as revenue
FROM order_items AS oi
JOIN products AS p ON oi.product_ID = p.product_id
    GROUP BY product_category_name
    ORDER BY revenue DESC;
