--delete
DELETE FROM foods WHERE id = 1;
DELETE FROM users WHERE id = 1;

--truncate
TRUNCATE TABLE foods;
TRUNCATE TABLE users;

--alter add
ALTER TABLE foods ADD COLUMN calories INT;
ALTER TABLE users ADD COLUMN city VARCHAR(255);
ALTER TABLE

--alter rename and modify
ALTER TABLE foods RENAME COLUMN calories TO calorie;
ALTER TABLE foods MODIFY COLUMN calorie DECIMAL(10,2);

ALTER TABLE users RENAME COLUMN city TO address;
ALTER TABLE users MODIFY COLUMN address VARCHAR(512);

--alter drop
ALTER TABLE foods DROP COLUMN calorie;
ALTER TABLE users DROP COLUMN address;

--join 
SELECT f.name AS food_name, f.price AS food_price, u.name AS user_name, u.email AS user_email, od.quantity, od.total_price AS order_total_price
FROM order_details od
JOIN foods f ON od.food_id = f.id
JOIN orders o ON od.order_id = o.id
JOIN users u ON o.user_id = u.id
WHERE u.id = 1;

--instert ito table
INSERT INTO orders(user_id, total_price, status) VALUES(1, 32.96, 'pending');
SET @order_id = LAST_INSERT_ID();
INSERT INTO order_details(order_id, food_id, quantity, total_price) VALUES
(@order_id, 1, 1, 5.99),
(@order_id, 2, 1, 7.99),
(@order_id, 3, 2, 7.98);

--update
UPDATE orders SET status = 'delivered' WHERE id = @order_id;

--delete from
DELETE FROM order_details WHERE order_id = @order_id;
DELETE FROM orders WHERE id = @order_id;

--these were few DDL and DML commands

