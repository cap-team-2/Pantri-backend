\c capstone_dev;

INSERT INTO users (first_name, last_name, email, phone, address_1, address_2, city, zipcode, type) VALUES
('first',
 'last',
 'email@email.com',
 '1112223333',
 'address1',
 'address2',
 'city',
 '10206',
 'buyer'),
 ('robbert',
 'canned',
 'robcan@email.com',
 '1438536754',
 'st corner',
 'apt 5b',
 'turkey',
 '90909',
 'seller');

INSERT INTO products (name, seller, image, cost, weight, unit_measurement, category, description, stock) VALUES
('product',
'2',
'image',
'9.99',
'10',
'lbs',
'veggies',
'place holder data to see if joins / api calls work',
'50'),
('bear',
'2',
'image',
'4.99',
'100',
'oz',
'raw meat',
'raw bear meat',
'15');

INSERT INTO orders (user_id, order_placed_at) VALUES
('1',
'10pm'),
('1',
'11pm'),
('2',
'5pm');

INSERT INTO orders_products (order_id, product_id, quantity) VALUES
('1',
'1',
'5'),
('2',
'2',
'4'),
('3',
'1',
'7');

