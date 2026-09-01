# SQL

Практика SQL для задач ручного тестирования и проверки данных.

Запросы выполнены на учебных данных и демонстрируют использование SQL для проверки данных, связей между таблицами и бизнес-логики.

---

## Что демонстрируется

* `SELECT` и `WHERE`
* фильтрация и сортировка данных
* `GROUP BY`, `HAVING` и агрегатные функции
* `INNER JOIN` и `LEFT JOIN`
* подзапросы
* работа с `NULL`
* поиск дубликатов
* проверка связей между таблицами
* проверка целостности данных
* проверки бизнес-логики
* базовые возможности PostgreSQL

---

## Структура

| Файл                      | Содержание                           |
| ------------------------- | ------------------------------------ |
| `01_select_filtering.sql` | SELECT, WHERE, фильтрация            |
| `02_sorting_grouping.sql` | ORDER BY, GROUP BY, HAVING, агрегаты |
| `03_joins.sql`            | INNER JOIN, LEFT JOIN                |
| `04_subqueries.sql`       | Подзапросы                           |
| `05_data_validation.sql`  | NULL, дубликаты, проверка данных     |
| `06_qa_checks.sql`        | SQL-проверки с точки зрения QA       |
| `07_postgresql.sql`       | Практика с PostgreSQL                |

---

## Примеры QA-проверок

### Проверка NULL

Проверка пользователей без email.

**Ожидаемый результат:** `0` записей.

```sql
SELECT id, username
FROM users
WHERE email IS NULL;
```

### Проверка дубликатов

Проверка уникальности email пользователей.

**Ожидаемый результат:** `0` записей.

```sql
SELECT
    email,
    COUNT(*) AS duplicate_count
FROM users
GROUP BY email
HAVING COUNT(*) > 1;
```

### Проверка связей

Поиск заказов, для которых не существует пользователя.

**Ожидаемый результат:** `0` записей.

```sql
SELECT
    o.id,
    o.user_id
FROM orders o
LEFT JOIN users u
    ON u.id = o.user_id
WHERE u.id IS NULL;
```

### Проверка бизнес-логики

Проверка соответствия суммы оплаченного заказа сумме платежа.

**Ожидаемый результат:** `0` записей.

```sql
SELECT
    o.id,
    o.total_amount,
    p.amount
FROM orders o
JOIN payments p
    ON p.order_id = o.id
WHERE o.status = 'paid'
  AND o.total_amount <> p.amount;
```

---

