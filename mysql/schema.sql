CREATE DATABASE IF NOT EXISTS brazilian_ecommerce;
Use brazilian_ecommerce;

-- 1. customers
CREATE TABLE IF NOT EXISTS customers (
    customers_id VARCHAR(50) PRIMARY KEY,
    customer_city VARCHAR(100),
    customer_state CHAR(2)
)

-- 2. sellers
CREATE TABLE IF NOT EXISTS sellers (
    seller_id VARCHAR(50) PRIMARY KEY,
    seller_city VARCHAR(100),
    seller_state CHAR(2)
)

-- 3. products
CREATE TABLE IF NOT EXISTS products (
    
    product_id VARCHAR(50) PRIMARY KEY,
    product_category_name VARCHAR(50),
    product_name_length INT,
    product_description_length INT,
    product_photos_qty INT,
    product_weight_g DECIMAL(10,2),
    product_length_cm DECIMAL(10,2),
    product_height_cm DECIMAL(10,2)

)

-- 4. orders
CREATE TABLE IF NOT EXISTS order_items (
    order_id VARCHAR(50) PRIMARY KEY,
    customer_id VARCHAR(50),
    order_status VARCHAR(30),
    order_purchase_timestamp DATETIME,
    order_delivered_customer_data DATETIME
    -- Referencing Foreign Keys from customer customer_id
    CONSTRAINT fk_orders_customer
        FOREIGN KEY (customer_id) REFERENCES customers(customer_id) 
)

-- 5. order_items
CREATE TABLE IF NOT EXISTS order_items (
    order_id VARCHAR(50),
    order item_id INT,
    product_id VARCHAR(50),
    seller_id VARCHAR(50), 
    shipping_limit_date DATETIME,
    price DECIMAL (10, 2),
    freight_value DECIMAL (10, 2)
    -- Adding Primary Keys
    PRIMARY KEY (order_id, order_item_id)
    -- Adding Foreign Keys
    CONSTRAINT fk_items_order
        FOREIGN KEY (order_id) REFERENCES orders(order_id),
    CONSTRAINT fk_items_product
        FOREIGN KEY (product_id) REFERENCES products(product_id),
    CONSTRAINT fk_items_sellers
        FOREIGN KEY (sellers_id) REFERENCES sellers(sellers_id),
)

-- 6. reviews
CREATE TABLE IF NOT EXISTS reviews (
    review_id VARCHAR(50) PRIMARY KEY,
    order_id VARCHAR(50),
    review_score TINYINT,
    review_comment_message TEXT,
    review_creation_date DATETIME,
    review_answer_timestamp DATETIME
)