# Использование cURL из 1С:Предприятие 8

## Использование:

- Добавить обработку в конфигурацию
- Установить [cURL](https://curl.se/windows)
- Прописать `curl.exe` в переменные среды Windows. Можно и без этого, но нужно будет вызывать метод `УказатьИсполняемыйФайл` для явного указания `curl.exe`
- Для использования режима эмуляции браузера необходимо наличие сертификата CA `curl-ca-bundle.crt` в папке расположения curl.exe

## Пример использования:

### GET Запрос
```bsl
Json = Обработки.cURL.Создать()
        .GET("https://example.com/v1/api")
        .ОтветКакJson());
```

### POST Запрос
```bsl
ДвоичныеДанные = Обработки.cURL.Создать()
        .УстановитьЗаголовки(Заголовки)
        .POST("https://example.com/v1/api", "param1=01.01.2000&param2=true")
        .ОтветКакДвоичныеДанные());
```

### Эмуляция браузера (Chrome)
```bsl
HTMLТекст = Обработки.cURL.Создать()
        .ЭмуляцияБраузера()
        .GET("https://example.com/page1.html")
        .ОтветКакТекст());
```
