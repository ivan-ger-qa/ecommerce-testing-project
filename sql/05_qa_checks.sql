-- 1. Проверка дубликатов email
-- Expected: 0 rows

SELECT
    email,
    COUNT(*) AS duplicate_count
FROM users
GROUP BY email
HAVING COUNT(*) > 1;


-- 2. Проверка пользователей без email
-- Expected: 0 rows

SELECT *
FROM users
WHERE email IS NULL;


-- 3. Проверка заказов без существующего пользователя
-- Expected: 0 rows

SELECT
    o.id AS order_id,
    o.user_id
FROM orders o
LEFT JOIN users u ON u.id = o.user_id
WHERE u.id IS NULL;


-- 4. Проверка заказов без позиций
-- Expected: 0 rows

SELECT
    o.id AS order_id
FROM orders o
LEFT JOIN order_items oi ON oi.order_id = o.id
WHERE oi.order_id IS NULL;


-- 5. Проверка товаров, которые ни разу не продавались
-- Expected: может быть > 0 rows

SELECT
    p.id,
    p.name,
    p.price
FROM products p
LEFT JOIN order_items oi ON oi.product_id = p.id
WHERE oi.product_id IS NULL;


-- 6. Проверка платежей с некорректной суммой
-- Expected: 0 rows

SELECT
    p.order_id,
    p.amount AS payment_amount,
    SUM(oi.quantity * oi.price) AS order_amount
FROM payments p
JOIN order_items oi ON oi.order_id = p.order_id
GROUP BY p.order_id, p.amount
HAVING p.amount <> SUM(oi.quantity * oi.price);


-- 7. Проверка платежей с нулевой или отрицательной суммой
-- Expected: 0 rows

SELECT
    id,
    order_id,
    amount
FROM payments
WHERE amount <= 0;