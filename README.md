[![Release](https://img.shields.io/github/release/Stivo182/curl.svg)](https://github.com/Stivo182/curl/releases)
[![Статус порога качества](https://sonar.openbsl.ru/api/project_badges/measure?project=curl&metric=alert_status&token=sqb_c82633798d56e9c8cb7596cdc9b58cb18d23e356)](https://sonar.openbsl.ru/dashboard?id=curl)

# cURL для 1С:Предприятие 8

Обработка является оболочкой над утилитой [cURL](https://curl.se/).

## Установка и подключение

* [Установка и подключение утилиты сURL](https://github.com/Stivo182/curl/wiki/Установка-и-подключение-утилиты-сURL)
* [Подключение обработки](https://github.com/Stivo182/curl/wiki/Подключение-обработки)

## Программный интерфейс

По [ссылке](https://github.com/Stivo182/curl/wiki/Программный-интерфейс) предоставлен программный интерфейс обработки. По каждому методу есть описание, а по некоторым даны примеры использования.

## Использование

``` bsl
Curl = Обработки.Curl
        // Создаем новый объект обработки
        .Создать()
        
        // Устанавливаем SOCKS5 прокси
        .УстановитьПрокси("socks5", "< Хост >", "< Порт >")       
        .АутентификацияПрокси("< Имя пользователя >", "< Пароль >")
        
        // Устанавливаем HTTP заголовок
        .УстановитьЗаголовок("User-Agent", "1C:Enterprise")  
        
        // Устанавливаем куки
        .УстановитьКуки("name1=value1; name2=value2")
        
        // Разрешаем перенаправления при возвращении ответа с кодом 3xx
        .РазрешитьПеренаправления()
        
        // Передаем данные Basic-аутентификации
        .Аутентификация("< Имя пользователя >", "< Пароль >")
        
        // Получаем данные
        .Получить("https://httpbin.org/get");
        
// Обрабатываем ответ как JSON
Json = Curl.ОтветКакJson();
        
// Получаем новые куки
НовыеКуки = Curl.КукиИзОтвета();

// Получаем заголовки ответа
ЗаголовкиОтвета = Curl.ЗаголовкиОтвета();
```
## Использование в других проектах

* [CURL builder](https://github.com/Stivo182/curl-builder) - Графический конструктор командной строки
  
## Полезные ссылки

* [Документация утилиты cURL](https://curl.se/docs/manpage.html)

