
#fact table
CREATE TABLE fact_order_items (
    order_item_key INT AUTO_INCREMENT PRIMARY KEY,
    date_key INT,
    customer_key INT,
    product_key INT,
    payment_key INT,
    order_id INT,
    quantity INT,
    price DECIMAL(10,2),
    total_amount DECIMAL(10,2),
    FOREIGN KEY (date_key) REFERENCES dim_date(date_key),
    FOREIGN KEY (customer_key) REFERENCES dim_customer(customer_key),
    FOREIGN KEY (product_key) REFERENCES dim_product(product_key),
    FOREIGN KEY (payment_key) REFERENCES dim_payment(payment_key)
);

INSERT INTO fact_order_items (
    date_key, customer_key, product_key, payment_key,
    order_id, quantity, price, total_amount
)
SELECT
    d.date_key,
    c.customer_key,
    p.product_key,
    pay.payment_key,
    o.order_id,
    o.quantity,
    o.price,
    o.price * o.quantity
FROM orders_obt o
JOIN dim_customer c
    ON o.customer_id = c.customer_id
JOIN dim_product p
    ON o.product_id = p.product_id
JOIN dim_date d
    ON o.order_date = d.full_date
JOIN dim_payment pay
    ON o.payment_method = pay.payment_method;

