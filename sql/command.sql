-- Récupérer le numéro de commande et la date de toutes
-- les commandestriées par date croissante:
SELECT id, date
FROM `order`
ORDER BY date;

-- Récupérer le numéro de commande, le prénom
-- et le nom de l’utilisateur qui a  commandé, la date de la commande:
SELECT `order`.id, firstname, lastname, date
FROM user
JOIN `order` ON `order`.user_id = user.id;


-- Récupérer le numéro de commande, le prénom et le nom de l’utilisateur qui a  commandé,
-- la date de la commande et le montant total de la commande par date croissante.
SELECT `order`.id, firstname, lastname, date,
SUM(order_line.price*order_line.quantity) AS Montant_total
FROM user
JOIN `order` ON `order`.user_id = user.id
JOIN order_line ON `order`.id = order_line.order_id
GROUP BY order_id
ORDER BY date;


-- Récupérer le prénom et le  nom des 3 personnes ayant commandé pour le plus
-- (= qui nous a rapporté le plus de sous), montant total commandé.
SELECT firstname, lastname, SUM(order_line.price*order_line.quantity) AS Montant_total
FROM user
JOIN `order` ON `order`.user_id = user.id
JOIN order_line ON `order`.id = order_line.order_id
GROUP BY order_id
ORDER BY Montant_total desc limit 3;


-- Avoir par produit (titre du produit), combien de fois un produit a été commandé
-- (par commande différente et par qtt totale)
SELECT title, SUM(order_line.quantity) AS Quantité_total, COUNT(order_id) AS Commande_total
FROM product
JOIN order_line ON product.id = order_line.product_id
GROUP BY product_id;


-- Avoir l'ID, nom et prénom des clients qui n'ont rien commandé
SELECT user.id, firstname, lastname
FROM user
LEFT JOIN `order` ON `order`.user_id = user.id
WHERE `order`.user_id IS NULL;


-- Savoir quel est le produit le plus commandé par les femmes
SELECT title, SUM(order_line.quantity) AS Quantité
FROM product
JOIN order_line ON product.id = order_line.product_id
JOIN `order` ON `order`.id = order_line.order_id
JOIN user ON user.id = `order`.user_id
WHERE user.civil = 'Femme'
GROUP BY product_id
ORDER BY Quantité desc limit 1;


-- Savoir quel produit est le plus commandé l'hiver
SELECT title, SUM(order_line.quantity) AS Quantité
FROM product
JOIN order_line ON product.id = order_line.product_id
JOIN `order` ON `order`.id = order_line.order_id
WHERE `order`.date BETWEEN '2019-12-20' AND '2020-02-20'
GROUP BY product_id
ORDER BY Quantité desc limit 1;


-- Donner un bon de réduction de 5 euros pour tout client qui a commandé plus de 20 euros
INSERT INTO coupon (user_id, price, quantity)
VALUES (
    (SELECT user.id
    FROM user
    JOIN `order` ON `order`.user_id = user.id
    JOIN order_line ON `order`.id = order_line.order_id
    GROUP BY order_id
    HAVING SUM(order_line.price*order_line.quantity) > 20 limit 1
), 5, 1);
