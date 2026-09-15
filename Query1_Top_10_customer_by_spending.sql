use olist;

SELECT
C.customer_id,
SUM(op.payment_value) AS total_spent
FROM customers AS c
JOIN orders AS o ON c.customer_id = o.customer_id
JOIN order_payments AS op ON o.order_id = op.order_id
GROUP BY c.customer_id
ORDER BY total_spent DESC
LIMIT 10;

