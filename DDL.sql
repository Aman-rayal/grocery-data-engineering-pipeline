-- Database Creation
CREATE DATABASE sales_data;

USE sales_data;

-- Department Master Table
CREATE TABLE department_data (
department_ID INT PRIMARY KEY,
department_name VARCHAR(100)
);

-- Category Master Table
CREATE TABLE category_data (
category_ID INT PRIMARY KEY,
category_name VARCHAR(100)
);

-- Brand Master Table
CREATE TABLE brand_data (
brand_ID INT PRIMARY KEY,
brand VARCHAR(100)
);

-- Vendor Master Table
CREATE TABLE vendor_data (
vendor_ID INT PRIMARY KEY,
vendor_name VARCHAR(100),
vendor_phone VARCHAR(100)
);

-- Product Master Table

CREATE TABLE product_data (
product_ID INT AUTO_INCREMENT PRIMARY KEY,
product_upc BIGINT UNIQUE,
product_name VARCHAR(100),
size VARCHAR(10),
unit VARCHAR(3),
regular_price DECIMAL(10,2),
unit_cost DECIMAL(10,2),
pack_size INT,
category_ID INT,
brand_ID INT,
department_ID INT,
vendor_ID INT,


FOREIGN KEY (category_ID)
    REFERENCES category_data(category_ID),

FOREIGN KEY (brand_ID)
    REFERENCES brand_data(brand_ID),

FOREIGN KEY (department_ID)
    REFERENCES department_data(department_ID),

FOREIGN KEY (vendor_ID)
    REFERENCES vendor_data(vendor_ID)

);

-- Promotion Table
CREATE TABLE promotion_data (
promo_sr INT AUTO_INCREMENT PRIMARY KEY,
promo_ID VARCHAR(100),
promo_type VARCHAR(100),
discount_percent INT,
start_date DATE,
end_date DATE,
product_upc BIGINT,


CONSTRAINT unique_promo_product 
    UNIQUE (promo_ID, product_upc),

FOREIGN KEY (product_upc)
    REFERENCES product_data(product_upc)

);

-- Store Master Table
CREATE TABLE store_data (
store_ID INT PRIMARY KEY,
store_name VARCHAR(100),
store_address VARCHAR(100),
store_city VARCHAR(100),
store_state VARCHAR(100),
store_zip BIGINT
);

-- Sales Transaction Table
CREATE TABLE sales_data (
sr_no INT AUTO_INCREMENT PRIMARY KEY,


receipt_id VARCHAR(100),
line_number INT,

sale_date DATE,
sale_time TIME,
quantity INT,
unit_price_effective DECIMAL(10,2),
line_subtotal DECIMAL(10,2),
tax_amount DECIMAL(10,2),

weekend_flag BOOLEAN,
cashier_name VARCHAR(100),
tender_type VARCHAR(100),
customer_segment VARCHAR(100),

promo_ID VARCHAR(100),
product_upc BIGINT,
store_ID INT,

CONSTRAINT unique_receipt_line
    UNIQUE(receipt_id, line_number),

FOREIGN KEY (promo_ID, product_upc)
    REFERENCES promotion_data(promo_ID, product_upc),

FOREIGN KEY (product_upc)
    REFERENCES product_data(product_upc),

FOREIGN KEY (store_ID)
    REFERENCES store_data(store_ID)


);

-- Inventory Snapshot Table

CREATE TABLE inventory_data (
inventory_id INT AUTO_INCREMENT PRIMARY KEY,


snapshot_date DATE,
on_hand_qty INT,
unit_cost DECIMAL(10,2),
inventory_cost_value DECIMAL(10,2),

store_ID INT,
product_upc BIGINT,

FOREIGN KEY (store_ID)
    REFERENCES store_data(store_ID),

FOREIGN KEY (product_upc)
    REFERENCES product_data(product_upc)

);
