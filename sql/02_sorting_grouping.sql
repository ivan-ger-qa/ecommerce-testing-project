-- 1. Сортировка товаров по цене от дешёвых к дорогим

SELECT id, name, price
FROM products
ORDER BY price ASC;


-- 2. Количество заказов у каждого пользователя

SELECT user_id, COUNT(*) AS orders_count
FROM orders
GROUP BY user_id
ORDER BY orders_count DESC;


-- 3. Общая сумма всех заказов

SELECT SUM(amount) AS total_payments
FROM payments;


-- 4. Сумма платежей по каждому заказу

SELECT order_id, SUM(amount) AS total_paid
FROM payments
GROUP BY order_id
ORDER BY total_paid DESC;