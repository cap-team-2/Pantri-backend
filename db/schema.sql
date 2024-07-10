DROP DATABASE IF EXISTS pantri_dev;
CREATE DATABASE pantri_dev;

\c pantri_dev;

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";


CREATE TABLE users (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT NOT NULL,
    phone TEXT,
    address_1 TEXT,
    address_2 TEXT,
    city TEXT,
    zipcode INTEGER,
    image TEXT NOT NULL,
    type TEXT
);

CREATE TABLE products (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    seller_id UUID NOT NULL REFERENCES users (id),
    name TEXT NOT NULL,
    image TEXT NOT NULL,
    cost DECIMAL(10,2) NOT NULL CHECK (cost >= 0),
    weight DECIMAL(6,2) CHECK (weight >= 0),
    unit_measurement TEXT,
    category TEXT NOT NULL,
    description TEXT NOT NULL,
    stock INTEGER NOT NULL CHECK (stock >= 0)
);

CREATE TABLE orders (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY, 
    user_id UUID NOT NULL REFERENCES users (id),
    total DECIMAL(10,2) NOT NULL CHECK (total >= 0),
    order_placed_at TEXT NOT NULL
); 

CREATE TABLE orders_products (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY, 
    order_id UUID NOT NULL REFERENCES orders(id),
    product_id UUID NOT NULL REFERENCES products(id),
    quantity INTEGER NOT NULL CHECK (quantity >= 0)
);

CREATE TABLE shopping_session (
    id SERIAL PRIMARY KEY,
    user_id UUID NOT NULL REFERENCES users(id),
    total DECIMAL(10,2) NOT NULL CHECK (total >= 0),
    created_at TEXT NOT NULL
);

