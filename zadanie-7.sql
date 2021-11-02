/*
*  1. Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.
*/
SELECT * FROM users
WHERE EXISTS (SELECT * FROM orders WHERE orders.user_id = users.id);


/*
*  2. Выведите список товаров products и разделов catalogs, который соответствует товару.
*/
SELECT p.name, c.name 
FROM products p 
JOIN catalogs c
ON c.id = p.catalog_id;


/*
* 3.(по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). 
*   Поля from, to и label содержат английские названия городов, поле name — русское. 
*   Выведите список рейсов flights с русскими названиями городов.
*/
CREATE TABLE flights (
	id SERIAL PRIMARY KEY,
	`from` varchar(10),
	`to` varchar(10)
);
INSERT INTO flights
VALUES (1,'citi1','citi2'), (2,'citi2', 'citi3'), (3,'citi3','citi1');

CREATE TABLE cities (
	label varchar(10),
	name varchar(10)
);
INSERT INTO cities
VALUES ('citi1', 'город1'), ('citi2', 'город2'), ('citi3', 'город3');

-- Сам запрос
SELECT id, 
(SELECT name FROM cities WHERE label=flights.from),
(SELECT name FROM cities WHERE label=flights.to)
FROM flights;