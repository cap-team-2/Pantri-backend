\c capstone_dev;


INSERT INTO users (id, first_name, last_name, email, phone, address_1, address_2, city, zipcode, type) VALUES
('7d395d9c-76e1-4c5a-b7f5-0b708785836b',
 'first',
 'last',
 'email@email.com',
 '1112223333',
 'address1',
 'address2',
 'city',
 '10206',
 'buyer'),
 ('9e6ef4fb-5574-4968-912a-ea28257d708e',
 'robbert',
 'canned',
 'robcan@email.com',
 '1438536754',
 'st corner',
 'apt 5b',
 'turkey',
 '90909',
 'seller');

INSERT INTO products (id, seller_id, product_name, product_image, product_cost, product_weight, unit_measurement, category, product_description, stock) VALUES
('908adff5-351d-471e-8296-6c6e1c82b9be',
'9e6ef4fb-5574-4968-912a-ea28257d708e',
'product',
'image',
'9.99',
'10',
'lbs',
'veggies',
'place holder data to see if joins / api calls work',
'50'),
('479a1150-a3f3-43f6-89e7-142e8b6943e6',
'9e6ef4fb-5574-4968-912a-ea28257d708e',
'bear',
'image',
'4.99',
'100',
'oz',
'raw meat',
'raw bear meat',
'15');

INSERT INTO orders (id, user_id, order_placed_at) VALUES
('21d70293-4ee5-4ce8-8fde-599047743451',
'7d395d9c-76e1-4c5a-b7f5-0b708785836b',
'10pm'),
('d848d6c5-6883-4ec0-8e04-d1f6bcec7884',
'7d395d9c-76e1-4c5a-b7f5-0b708785836b',
'11pm'),
('f684e1d6-225f-49c3-8ba9-306cd038f0bd',
'9e6ef4fb-5574-4968-912a-ea28257d708e',
'5pm');

INSERT INTO orders_products (id, order_id, product_id, quantity) VALUES
('96476349-ef6b-421d-a198-c5ab51f6c6dc',
'21d70293-4ee5-4ce8-8fde-599047743451',
'908adff5-351d-471e-8296-6c6e1c82b9be',
'5'),
('176b98a4-79a0-473e-a810-48797d07ccf9',
'd848d6c5-6883-4ec0-8e04-d1f6bcec7884',
'479a1150-a3f3-43f6-89e7-142e8b6943e6',
'4'),
('923d6578-f5c2-4e83-a139-1468239659d1',
'f684e1d6-225f-49c3-8ba9-306cd038f0bd',
'908adff5-351d-471e-8296-6c6e1c82b9be',
'7');

