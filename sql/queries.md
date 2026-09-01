# SQL Queries

Примеры SQL-запросов, выполненных в учебных проектах и SQL-тренажёрах.

---

## 1. Выборка пользователей

### Задача

Получить список пользователей с определённой ролью.

```sql
SELECT id, username, email
FROM users
WHERE role = 'employee';
```
Что проверяется
SELECT
выбор конкретных полей
фильтрация через WHERE

2. Поиск пользователей по условию
Задача

Найти пользователей, зарегистрированных после определённой даты.

```sql
SELECT id, username, email
FROM users
WHERE created_at > '2026-01-01';
```
Что проверяется
фильтрация по дате
оператор >


3. Сортировка результатов
Задача

Получить пользователей и отсортировать их по имени.
```sql
SELECT id, username, email
FROM users
ORDER BY username ASC;
```
Что проверяется
ORDER BY
сортировка по возрастанию

4. Подсчёт количества записей
Задача

Проверить количество пользователей каждой роли.
```sql
SELECT role, COUNT(*) AS user_count
FROM users
GROUP BY role;
```
Что проверяется
COUNT
GROUP BY
агрегатные функции

5. JOIN
Задача

Получить пользователей и связанные с ними корпорации.
```sql
SELECT
    u.id,
    u.username,
    c.name AS corporation_name
FROM users u
JOIN corporations c
    ON c.owner_id = u.id;
```

Что проверяется
JOIN
связь таблиц по внешнему ключу
выборка данных из нескольких таблиц









