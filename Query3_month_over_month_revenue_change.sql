WITH monthly AS (
    SELECT
    DATE_FORMAT(o.order_purchase_timestamp, "%Y-%m") AS month,
    (ROUND(SUM(op.payment_value),2)) AS revenue
FROM orders AS o
JOIN order_payments AS op ON o.order_id = op.order_id
    GROUP BY month
),
monthly_rev AS (
    SELECT
        month,
        revenue,
         LAG(revenue) OVER (ORDER BY month) AS previous_month_revenue
    FROM monthly
    ORDER BY month
)
SELECT
     month,
     revenue,
    previous_month_revenue,
    ROUND((revenue - previous_month_revenue),2) AS revenue_change,
    ROUND( ((revenue - previous_month_revenue)/ previous_month_revenue* 100),2) AS percent_MOM
from monthly_rev
order by month;