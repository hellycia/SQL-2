INSERT INTO user (firstname, lastname, age, civil) VALUES
('Jean', 'Moulin', 45, 'Homme'),
('Marine', 'Gautier', 30, 'Femme'),
('Carine', 'Tellier', 38, 'Femme'),
('Marc', 'Jolier', 29, 'Homme'),
('Didier', 'Riou', 60, 'Homme');

INSERT INTO product (price, title) VALUES
(29.99, 'chapeau'),
(9.99, 'chaussette'),
(159, 'manteau'),
(15.45, 'poster'),
(89.99, 'sweat');

INSERT INTO `order` (id, user_id, date) VALUES
(1, (SELECT id FROM user WHERE firstname='Jean'), '2020-01-01 20:30:00'),
(2, (SELECT id FROM user WHERE firstname='Jean'), '2020-07-01 12:40:00'),
(3, (SELECT id FROM user WHERE firstname='Carine'), '2020-02-10 10:21:23'),
(4, (SELECT id FROM user WHERE firstname='Marine'), NOW() ),
(5, (SELECT id FROM user WHERE firstname='Carine'), '2019-10-03 22:45:12'),
(6, (SELECT id FROM user WHERE firstname='Carine'), '2019-12-03 22:45:12'),
(7, (SELECT id FROM user WHERE firstname='Carine'), '2019-12-25 22:45:12'),
(8, (SELECT id FROM user WHERE firstname='Marc'), '2019-12-27 22:45:12');



INSERT INTO order_line (order_id, product_id, price, quantity) VALUES
(1, ( SELECT id FROM product WHERE title='chapeau'), 29.99, 1 ),
(1, ( SELECT id FROM product WHERE title='poster'), 15.45, 2 ),
(2, (SELECT id FROM product WHERE title='poster'), 15.45, 1 ),
(3, (SELECT id FROM product WHERE title='sweat'), 89.99, 1 ),
(4, (SELECT id FROM product WHERE title='poster'), 15.45, 10 ),
(5, (SELECT id FROM product WHERE title='chaussette'), 9.99, 1 ),
(6, (SELECT id FROM product WHERE title='sweat'), 89.99, 5 ),
(7, (SELECT id FROM product WHERE title='sweat'), 89.99, 8 ),
(8, (SELECT id FROM product WHERE title='chaussette'), 9.99, 1 );
