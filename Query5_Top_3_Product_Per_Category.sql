WITH ranked_product AS (
    SELECT p.product_id,
    p.product_category_name,
    ROUND(SUM(oi.price), 2) as Revenue,
    ROW_NUMBER() OVER (
            PARTITION BY p.product_category_name
            ORDER BY SUM(oi.price) DESC
            ) AS rn
    FROM order_items AS oi
    JOIN products AS p ON oi.product_ID = p.product_id
    GROUP BY p.product_category_name, p.product_id
) SELECT
    product_category_name AS Category,
    product_id AS `Product ID`,
    Revenue,
    rn AS `Rank`
FROM ranked_product
WHERE rn <= 3
ORDER BY product_category_name, Revenue DESC;
