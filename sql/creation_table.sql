DROP TABLE IF EXISTS order_line;
DROP TABLE IF EXISTS `order`;
DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS product;
DROP TABLE IF EXISTS coupon;

CREATE TABLE IF NOT EXISTS user (
    id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    firstname varchar(255) NOT NULL,
    lastname varchar(255) NOT NULL,
    age int(1) NOT NULL,
    civil varchar(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS product (
    id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    price decimal(5,2) NOT NULL,
    title varchar(255) NOT NULL
);


CREATE TABLE IF NOT EXISTS `order` (
    id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    user_id int NOT NULL,
    date datetime NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS order_line (
    order_id int NOT NULL,
    product_id int NOT NULL,
    price decimal(5,2) NOT NULL,
    quantity int NOT NULL,
    FOREIGN KEY (order_id) REFERENCES `order`(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS coupon (
    user_id int NOT NULL,
    price decimal(5,2) NOT NULL,
    quantity int NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE
);
