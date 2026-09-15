SELECT
DATE_FORMAT (o.order_purchase_timestamp,"%Y-%m") as month,
ROUND(SUM(op.payment_value),2) as revenue
FROM orders AS o
JOIN order_payments AS op ON o.order_id = op.order_id
    GROUP BY month
    ORDER BY month;