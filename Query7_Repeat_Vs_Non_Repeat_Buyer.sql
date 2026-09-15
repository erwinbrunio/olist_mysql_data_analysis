WITH buyer_habit AS (
    SELECT c.customer_unique_id AS Customer,
    COUNT(o.order_id) AS buy_count
    FROM customers AS c
JOIN orders AS o ON c.customer_id = o.customer_id
GROUP BY c.customer_unique_id
) SELECT
      CASE WHEN buy_count = 1 THEN 'Non-Repeat Buyer'
        ELSE 'Repeat Buyer'
        END AS Buyer_Type,
    COUNT(*) AS Customer_Count
FROM buyer_habit
GROUP BY Buyer_Type;


