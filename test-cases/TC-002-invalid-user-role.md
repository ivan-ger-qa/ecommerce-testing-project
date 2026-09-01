## Обнаруженный дефект

**Название:** API позволяет создать пользователя с несуществующей ролью

**Связанный тест-кейс:** TC-002

**Шаги воспроизведения:**

1. Авторизоваться с использованием Basic Auth.
2. Отправить `POST` запрос на:

```http
POST https://api.brainy.run/go/create_user
```

3. Передать несуществующее значение в поле `role`:

```json
{
  "avatar_url": "https://brainy.run/wp-content/uploads/2024/05/candidate2.png",
  "email": "invalid-role-test@brainy.run",
  "name": "Брейни",
  "password": "superpassword",
  "role": "abrakadabra",
  "username": "invalid-role-test"
}
```

### Ожидаемый результат

Сервер отклоняет запрос с кодом `400 Bad Request` и возвращает сообщение об ошибке валидации.

### Фактический результат

Сервер возвращает:

```http
201 Created
```

Пользователь успешно создаётся с несуществующей ролью `abrakadabra`.

### Вывод

В API отсутствует или некорректно работает валидация значения поля `role`.

**Severity:** Medium
**Priority:** High
**Status:** Open
