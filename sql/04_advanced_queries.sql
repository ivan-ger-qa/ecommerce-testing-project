-- 1. Классификация платежей по сумме

SELECT
    id,
    order_id,
    amount,
    CASE
        WHEN amount = 0 THEN 'zero'
        WHEN amount < 1000 THEN 'low'
        WHEN amount BETWEEN 1000 AND 3000 THEN 'medium'
        ELSE 'high'
    END AS payment_category
FROM payments
ORDER BY amount;


-- 2. Пользователи, имеющие хотя бы один заказ

SELECT DISTINCT
    u.id,
    u.name,
    u.email
FROM users u
JOIN orders o ON o.user_id = u.id
ORDER BY u.id;


-- 3. Округление суммы платежа до целого числа

SELECT
    id,
    order_id,
    amount,
    ROUND(amount, 0) AS rounded_amount
FROM payments
ORDER BY amount;