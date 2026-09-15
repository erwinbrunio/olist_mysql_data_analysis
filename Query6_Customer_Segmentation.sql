WITH total_spend AS (
    SELECT c.customer_unique_id,
    ROUND(SUM(oi.price), 2) as Total_Spend
    FROM customers AS c
    JOIN orders AS o ON c.customer_id = o.customer_id
    JOIN order_items AS oi ON o.order_ID = oi.order_ID
    GROUP BY c.customer_unique_id
) SELECT
       customer_unique_id,
      CASE WHEN Total_Spend <200 THEN 'Low'
        WHEN Total_Spend <500 THEN 'Medium'
        ELSE 'High'
        END AS bucket,
      Total_Spend
FROM total_spend;
