-- Row count validation
SELECT COUNT(*) FROM orders_obt;
SELECT COUNT(*) FROM fact_order_items;

-- Aggregate validation
SELECT SUM(price * quantity) FROM orders_obt;
SELECT SUM(total_amount) FROM fact_order_items;

-- Dimension uniqueness check
SELECT customer_id, COUNT(*)
FROM dim_customer
GROUP BY customer_id
HAVING COUNT(*) > 1;