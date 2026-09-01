-- 1. Пользователи и их заказы

SELECT
    u.id AS user_id,
    u.name,
    u.email,
    o.id AS order_id,
    o.status
FROM users u
JOIN orders o ON o.user_id = u.id
ORDER BY u.id;


-- 2. Получение товаров, входящих в каждый заказ

SELECT
    o.id AS order_id,
    p.name AS product_name,
    oi.quantity,
    oi.price
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN products p ON p.id = oi.product_id
ORDER BY o.id;


-- 3. Проверка пользователей без заказов

SELECT
    u.id AS user_id,
    u.name,
    o.id AS order_id
FROM users u
LEFT JOIN orders o ON o.user_id = u.id
ORDER BY u.id;