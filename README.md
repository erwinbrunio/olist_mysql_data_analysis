# Olist SQL Analysis

## Overview
This project presents an end-to-end SQL analysis of the Brazilian E-Commerce public dataset by **Olist**. The objective is to uncover key insights regarding customer purchasing behaviors, monthly revenue velocity, product category performance, and customer retention dynamics to drive data-informed business strategies.

---

## Business Questions
The analysis addresses eight critical business questions across revenue growth, catalog optimization, and customer loyalty:

1. **Top Spenders:** Who are the top 10 individual customers by total spending?
2. **Revenue Trend:** What is the overall monthly revenue growth and sales trajectory over time?
3. **Month-over-Month (MoM) Growth:** How does revenue fluctuate month-over-month in absolute value and percentage rate?
4. **Category Performance:** Which product categories generate the highest total sales volume?
5. **Top Products by Category:** What are the top 3 best-performing products (by revenue) within each category?
6. **Customer Value Segmentation:** How are customers distributed across spend tiers (Low < R$200, Medium R$200–500, High ≥ R$500)?
7. **Customer Retention:** What is the ratio between one-time shoppers and repeat buyers?
8. **Top Category Share:** What percentage of total e-commerce revenue is commanded by the single top-performing product category?

---

## Key Findings
* **Retention Deficit:** The customer base is heavily skewed toward one-time purchasers, highlighting a low repeat purchase rate typical of uncurated marketplaces and revealing an untapped retention opportunity.
* **Pareto / Category Concentration:** Revenue is concentrated in leading product categories (e.g., Bed & Bath, Health & Beauty, Sports & Leisure, Computers/Accessories), where the top category alone captures a substantial share of total gross merchandise value.
* **Top Spender Concentration:** A small cohort of high-value purchasers accounts for disproportionately large basket sizes, warranting targeted VIP engagement.
* **Seasonality & MoM Fluctuations:** Monthly revenue trends reveal clear peak cycles (e.g., promotional campaigns and Black Friday spikes) alongside cyclical post-holiday lulls.
* **Tiered Value Distribution:** The vast majority of buyers fall into the 'Low' spend tier (< R$200), indicating strong price sensitivity and high potential for upselling and bundle strategies.

---

## Recommendations
* **Implement Loyalty & Re-engagement Campaigns:** Develop automated post-purchase workflows (retargeting, personalized discount triggers, loyalty reward points) to convert one-time buyers into repeat customers.
* **Focus on High-Margin & Anchor Categories:** Double down on merchant acquisition and inventory depth for top-performing categories and top-3 ranked SKUs while cross-selling complementary low-velocity items.
* **Tiered VIP Programs for High-Value Spenders:** Create a dedicated VIP tier with perks (expedited shipping, dedicated support, early access to sales) for high-bracket customers (R$500+).
* **Average Order Value (AOV) Boosters:** Address the large proportion of low-tier buyers by introducing product bundles, minimum spend free-shipping thresholds, and tiered checkout promotions.

---

## Tools & Skills
* **Language & Database:** MySQL / PostgreSQL
* **SQL Techniques:**
  * **Window Functions:** `ROW_NUMBER() OVER (PARTITION BY ... ORDER BY ...)`, `LAG() OVER (...)`, `SUM() OVER ()`
  * **Common Table Expressions (CTEs):** Modular `WITH` clauses for multi-stage aggregation
  * **Conditional Logic:** `CASE WHEN ... THEN ... ELSE END` for segmentation & profiling
  * **Aggregations & Grouping:** `SUM()`, `ROUND()`, `COUNT()`, `GROUP BY`, `ORDER BY`
  * **Relational Joins:** Multi-table `INNER JOIN` operations linking orders, order items, customers, payments, and products
  * **Date Formatting:** `DATE_FORMAT()` / temporal string parsing

---

## Files


The repository includes 8 relational CSV files from the Brazilian E-Commerce Public Dataset by Olist:

| File Name | Description | Key Identifier |
| :--- | :--- | :--- |
| `olist_customers_dataset.csv` | Customer location and unique identifier mappings | `customer_id` |
| `olist_geolocation_dataset.csv` | Brazilian zip code prefixes with latitude, longitude, city, and state | `geolocation_zip_code_prefix` |
| `olist_order_items_dataset.csv` | Item details per order, including seller, price, and shipping freight | `order_id`, `order_item_id` |
| `olist_order_payments_dataset.csv` | Payment methods, installment counts, and transaction values | `order_id` |
| `olist_order_reviews_dataset.csv` | Customer review scores, comments, and survey timestamps | `review_id`, `order_id` |
| `olist_orders_dataset.csv` | Core order records, purchase status, and delivery milestones | `order_id` |
| `olist_products_dataset.csv` | Product categories, dimensions, weights, and photo counts | `product_id` |
| `olist_sellers_dataset.csv` | Seller locations and unique identifier details | `seller_id` |

The following are the Sql queries to answer the business questions provided above.
| File Name | Description | Key Focus |
|---|---|---|
| `Query1_Top_10_customer_by_spending.sql` | Identifies top 10 spenders by customer order ID. | Customer Value |
| `Query2_monthly_rev_trend.sql` | Aggregates gross revenue by year-month. | Historical Sales Trend |
| `Query3_month_over_month_revenue_change.sql` | Uses `LAG()` to calculate MoM revenue difference and % growth. | Revenue Velocity |
| `Query4_category_revenue.sql` | Totals revenue grouped and sorted by product category. | Category Contribution |
| `Query5_Top_3_Product_Per_Category.sql` | Uses `ROW_NUMBER() PARTITION BY` to rank top 3 SKUs per category. | Product Performance |
| `Query6_Customer_Segmentation.sql` | Classifies unique buyers into Low, Medium, and High spend tiers. | Customer Segmentation |
| `Query7_Repeat_Vs_Non_Repeat_Buyer.sql` | Segments customer base into one-time vs. repeat buyers. | Customer Retention |
| `Query8_Percent_Total_Revenue_Top_Category.sql` | Computes the overall revenue contribution percentage of the #1 category. | Market Concentration |
