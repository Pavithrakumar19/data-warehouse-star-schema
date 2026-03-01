create database star_sales_obt;

use star_sales_obt;

CREATE TABLE orders_obt (
    order_id INT,
    order_date DATE,
    customer_id VARCHAR(10),
    customer_name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(100),
    state VARCHAR(100),
    product_id VARCHAR(10),
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    quantity INT,
    payment_method VARCHAR(50),
    order_status VARCHAR(50)
);
#inspecting the table
show tables;
select * from orders_obt limit 15;

#creating dim_products
CREATE TABLE dim_product (
    product_key INT AUTO_INCREMENT PRIMARY KEY,
    product_id VARCHAR(10),
    product_name VARCHAR(100),
    category VARCHAR(50)
);

INSERT INTO dim_product (product_id, product_name, category)
SELECT DISTINCT product_id, product_name, category
FROM orders_obt;

#inspecting dim_products
select count(*) from dim_product;
select * from dim_product;

#creating dim_date
CREATE TABLE dim_date (
    date_key INT AUTO_INCREMENT PRIMARY KEY,
    full_date DATE,
    day INT,
    month INT,
    quarter INT,
    year INT
);

INSERT INTO dim_date (full_date, day, month, quarter, year)
SELECT DISTINCT
    order_date,
    DAY(order_date),
    MONTH(order_date),
    QUARTER(order_date),
    YEAR(order_date)
FROM orders_obt;

#creating dim_payment
CREATE TABLE dim_payment (
    payment_key INT AUTO_INCREMENT PRIMARY KEY,
    payment_method VARCHAR(50)
);

INSERT INTO dim_payment (payment_method)
SELECT DISTINCT payment_method
FROM orders_obt;

select * from dim_payment;

CREATE TABLE dim_customer (
    customer_key INT AUTO_INCREMENT PRIMARY KEY,
    customer_id VARCHAR(10),
    customer_name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(100),
    state VARCHAR(100)
);

INSERT INTO dim_customer (customer_id, customer_name, email, city, state)
SELECT 
    customer_id,
    MAX(customer_name),
    MAX(email),
    MAX(city),
    MAX(state)
FROM orders_obt
GROUP BY customer_id;

SELECT COUNT(*) FROM dim_customer;
SELECT COUNT(DISTINCT customer_id) FROM orders_obt;

	