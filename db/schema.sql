DROP DATABASE IF EXISTS capstone_dev;
CREATE DATABASE capstone_dev;

/c capstone_dev;

CREATE TABLE user (
    user_id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    user_email TEXT NOT NULL,
    user_phone INTEGER,
    user_address_1 TEXT,
    user_address_2 TEXT,
    user_city TEXT,
    user_zipcode INTEGER,
    user_type TEXT,
);

-- CREATE TABLE product (
--     product_id SERIAL PRIMARY KEY,
--     product_seller TEXT NOT NULL REFERENCES user (id),
--     product_name TEXT NOT NULL,
--     product_image TEXT NOT NULL,
--     product_cost DECIMAL(10,2) NOT NULL CHECK (product_cost >= 0),
--     product_weight DECIMAL(6,2) CHECK (product_weight >= 0),
--     product_unit_measurement TEXT,
--     product_category TEXT NOT NULL,
--     product_description TEXT,
--     product_stock INTEGER NOT NULL CHECK (product_stock >= 0),
-- );