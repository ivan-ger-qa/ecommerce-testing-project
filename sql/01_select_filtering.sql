-- 1. Получение всех пользователей
SELECT *
FROM users;


-- 2. Пользователи с именем, содержащим букву "а"
SELECT id, name, email
FROM users
WHERE name ILIKE '%а%';

-- 3. Пользователи, зарегистрированные после 15 августа 2026 года
SELECT id, name, email, created_at
FROM users
WHERE created_at >= '2026-08-15';

-- 4. Пользователи, зарегистрированные после 15 августа
--    и имеющие букву "а" в имени

SELECT id, name, email, created_at
FROM users
WHERE created_at >= '2026-08-15'
  AND name ILIKE '%а%';

  -- 5. Выбор пользователей по списку ID

SELECT id, name, email
FROM users
WHERE id IN (1, 5, 10);