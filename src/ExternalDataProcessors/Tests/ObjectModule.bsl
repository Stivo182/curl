#Если Сервер Или ТолстыйКлиентОбычноеПриложение Или ВнешнееСоединение Тогда

#Область ОписаниеПеременных

Перем КонтекстЯдра;
Перем Ожидаем;
Перем ПарсерКоманднойСтроки;
Перем CURL;

#КонецОбласти

#Область ПрограммныйИнтерфейс

Процедура Инициализация(КонтекстЯдраПараметр) Экспорт
	
	КонтекстЯдра = КонтекстЯдраПараметр;
	Ожидаем = КонтекстЯдра.Плагин("УтвержденияBDD");
	ПарсерКоманднойСтроки = КонтекстЯдра.Плагин("ПарсерКоманднойСтроки");
	
	НайтиИПодключитьCURL();
		
КонецПроцедуры

Процедура ЗаполнитьНаборТестов(НаборТестов, КонтекстЯдраПараметр) Экспорт
	
	КонтекстЯдра = КонтекстЯдраПараметр;
	
	НаборТестов.Добавить("ТестДолжен_ОтправитьЗапрос_GET");  
	НаборТестов.Добавить("ТестДолжен_ОтправитьЗапрос_GET_СЗаголовками");  
	НаборТестов.Добавить("ТестДолжен_ОтправитьЗапрос_POST_БезТела");  
	НаборТестов.Добавить("ТестДолжен_ОтправитьЗапрос_POST_ТелоТекст");  
	НаборТестов.Добавить("ТестДолжен_ОтправитьЗапрос_POST_ТелоСтруктура");  
	НаборТестов.Добавить("ТестДолжен_ОтправитьЗапрос_POST_ТелоСоответствие");  
	НаборТестов.Добавить("ТестДолжен_ОтправитьЗапрос_POST_ТелоДвоичныеДанные");  
	НаборТестов.Добавить("ТестДолжен_ОтправитьЗапрос_POST_ТелоФайл");  
	НаборТестов.Добавить("ТестДолжен_ОтправитьЗапрос_POST_ТелоДвоичныеДанныеВоВременномХранилище"); 
	НаборТестов.Добавить("ТестДолжен_ОтправитьЗапрос_GET_САутентификациейBasic"); 
	НаборТестов.Добавить("ТестДолжен_ОтправитьЗапрос_GET_CАутентификациейDigest"); 
	НаборТестов.Добавить("ТестДолжен_ОтправитьЗапрос_GET_ПеренаправитьЗапрос"); 
	НаборТестов.Добавить("ТестДолжен_ОтправитьЗапрос_GET_НеПеренаправлятьЗапрос"); 
	НаборТестов.Добавить("ТестДолжен_ОтправитьЗапрос_GET_ПеренаправитьЗапросБезАутентификации"); 
	НаборТестов.Добавить("ТестДолжен_ОтправитьЗапрос_GET_ПеренаправитьЗапросСАутентификацией"); 
	
КонецПроцедуры

Процедура ПередЗапускомТеста() Экспорт
		
	CURL = ВнешниеОбработки.Создать("cURL");
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныйПрограммныйИнтерфейс

Процедура ТестДолжен_ОтправитьЗапрос_GET() Экспорт
	
	CURL.Get("https://httpbin.org/get");
	
	Ожидаем.Что(CURL.КодСостояния()).Равно(200);
	
КонецПроцедуры

Процедура ТестДолжен_ОтправитьЗапрос_GET_СЗаголовками() Экспорт
	
	Агент = "1C:Enterprise";
	Ответ = CURL.УстановитьЗаголовок("User-Agent", Агент)
				.Get("https://httpbin.org/get")
				.ОтветКакJson();
	
	Ожидаем.Что(Ответ["headers"]["User-Agent"]).Равно(Агент);
	
КонецПроцедуры

Процедура ТестДолжен_ОтправитьЗапрос_POST_БезТела() Экспорт
	
	CURL.Post("https://httpbin.org/post");
	
	Ожидаем.Что(CURL.КодСостояния()).Равно(200);
	
КонецПроцедуры

Процедура ТестДолжен_ОтправитьЗапрос_POST_ТелоТекст() Экспорт
	
	Ответ = CURL.Post("https://httpbin.org/post", "name=blink&id=182").ОтветКакJson();
	
	Ожидаем.Что(Ответ["form"]["name"]).Равно("blink");
	Ожидаем.Что(Ответ["form"]["id"]).Равно("182");
	
КонецПроцедуры

Процедура ТестДолжен_ОтправитьЗапрос_POST_ТелоСтруктура() Экспорт
	
	Тело = Новый Структура();
	Тело.Вставить("Name", "blink");
	Тело.Вставить("Id", 182);
	Тело.Вставить("Bool", Истина);
	Тело.Вставить("Cyrillic", "Йогурт");
	Тело.Вставить("SpecChars", "p=1&p=2");

	Ответ = CURL.Post("https://httpbin.org/post", Тело).ОтветКакJson();
	
	Ожидаем.Что(Ответ["form"]["Name"]).Равно("blink");
	Ожидаем.Что(Ответ["form"]["Id"]).Равно("182");
	Ожидаем.Что(Ответ["form"]["Bool"]).Равно("true");
	Ожидаем.Что(Ответ["form"]["Cyrillic"]).Равно("Йогурт");
	Ожидаем.Что(Ответ["form"]["SpecChars"]).Равно("p=1&p=2");
	
КонецПроцедуры

Процедура ТестДолжен_ОтправитьЗапрос_POST_ТелоСоответствие() Экспорт
	
	Тело = Новый Соответствие();
	Тело.Вставить("Name", "blink");
	Тело.Вставить("Id", 182);
	Тело.Вставить("Bool", Истина);
	Тело.Вставить("Cyrillic", "Йогурт");
	Тело.Вставить("SpecChars", "p=1&p=2");

	Ответ = CURL.Post("https://httpbin.org/post", Тело).ОтветКакJson();
	
	Ожидаем.Что(Ответ["form"]["Name"]).Равно("blink");
	Ожидаем.Что(Ответ["form"]["Id"]).Равно("182");
	Ожидаем.Что(Ответ["form"]["Bool"]).Равно("true");
	Ожидаем.Что(Ответ["form"]["Cyrillic"]).Равно("Йогурт");
	Ожидаем.Что(Ответ["form"]["SpecChars"]).Равно("p=1&p=2");
	
КонецПроцедуры

Процедура ТестДолжен_ОтправитьЗапрос_POST_ТелоДвоичныеДанные() Экспорт
	
	Буфер = Новый БуферДвоичныхДанных(16);
  	Поток = Новый ПотокВПамяти(Буфер); 
	
	Тело = Поток.ЗакрытьИПолучитьДвоичныеДанные();   
	
	Ответ = CURL.Post("https://httpbin.org/post", Тело).ОтветКакJson();
				
	Ожидаем.Что(Ответ["headers"]["Content-Length"]).Равно("16");
	
КонецПроцедуры

Процедура ТестДолжен_ОтправитьЗапрос_POST_ТелоФайл() Экспорт
	
	Буфер = Новый БуферДвоичныхДанных(16);
  	ДвоичныеДанные = ПолучитьДвоичныеДанныеИзБуфераДвоичныхДанных(Буфер);
	
	ПутьКФайлу = ПолучитьИмяВременногоФайла();
	ДвоичныеДанные.Записать(ПутьКФайлу);
	
  	Файл = Новый Файл(ПутьКФайлу);
	
	Попытка
		Ответ = CURL.Post("https://httpbin.org/post", Файл).ОтветКакJson();
	Исключение
		УдалитьФайлы(ПутьКФайлу);	
		ВызватьИсключение ОбработкаОшибок.ПодробноеПредставлениеОшибки(ИнформацияОбОшибке());
	КонецПопытки;
	
	УдалитьФайлы(ПутьКФайлу);
				
	Ожидаем.Что(Ответ["headers"]["Content-Length"]).Равно("16");
	
КонецПроцедуры

Процедура ТестДолжен_ОтправитьЗапрос_POST_ТелоДвоичныеДанныеВоВременномХранилище() Экспорт
	
	Буфер = Новый БуферДвоичныхДанных(16);
  	ДвоичныеДанные = ПолучитьДвоичныеДанныеИзБуфераДвоичныхДанных(Буфер);
  	
  	Адрес = ПоместитьВоВременноеХранилище(ДвоичныеДанные);
	
	Ответ = CURL.Post("https://httpbin.org/post", Адрес).ОтветКакJson();
				
	Ожидаем.Что(Ответ["headers"]["Content-Length"]).Равно("16");
	
КонецПроцедуры

Процедура ТестДолжен_ОтправитьЗапрос_GET_САутентификациейBasic() Экспорт

	Ответ = CURL.АутентификацияНаСервере("user", "secret")
				.Get("https://httpbin.org/basic-auth/user/secret")
				.ОтветКакJson();
	
	Ожидаем.Что(CURL.КодСостояния()).Равно(200);
	Ожидаем.Что(Ответ["authenticated"]).Равно(Истина);
	Ожидаем.Что(Ответ["user"]).Равно("user");
	
КонецПроцедуры

Процедура ТестДолжен_ОтправитьЗапрос_GET_CАутентификациейDigest() Экспорт

	Ответ = CURL.АутентификацияНаСервереDigest("user", "secret")
				.Get("https://httpbin.org/digest-auth/auth/user/secret")
				.ОтветКакJson();
	
	Ожидаем.Что(CURL.КодСостояния()).Равно(200);
	Ожидаем.Что(Ответ["authenticated"]).Равно(Истина);
	Ожидаем.Что(Ответ["user"]).Равно("user");
	
КонецПроцедуры

Процедура ТестДолжен_ОтправитьЗапрос_GET_ПеренаправитьЗапрос() Экспорт
	
	Location = КодироватьСтроку("https://httpbin.org/status/200", СпособКодированияСтроки.КодировкаURL);
	URL = СтрШаблон("https://httpbin.org/redirect-to?url=%1&status_code=301", Location);
	
	CURL.ПеренаправлятьЗапрос().Get(URL);
	
	Ожидаем.Что(CURL.КодСостояния()).Равно(200);
	
КонецПроцедуры

Процедура ТестДолжен_ОтправитьЗапрос_GET_НеПеренаправлятьЗапрос() Экспорт
	
	Location = КодироватьСтроку("https://httpbin.org/status/200", СпособКодированияСтроки.КодировкаURL);
	URL = СтрШаблон("https://httpbin.org/redirect-to?url=%1&status_code=301", Location);
	
	CURL.Get(URL);
	
	Ожидаем.Что(CURL.КодСостояния()).Равно(301);
	
КонецПроцедуры

Процедура ТестДолжен_ОтправитьЗапрос_GET_ПеренаправитьЗапросБезАутентификации() Экспорт
	
	Location = КодироватьСтроку("https://postman-echo.com/headers", СпособКодированияСтроки.КодировкаURL);
	URL = СтрШаблон("https://httpbin.org/redirect-to?url=%1&status_code=301", Location);
	
	Ответ = CURL
		.ПеренаправлятьЗапрос()
		.АутентификацияНаСервере("user", "secret")
		.Get(URL)
		.ОтветКакJson();
		
	Ожидаем.Что(CURL.КодСостояния()).Равно(200);
	Ожидаем.Что(Ответ["headers"].Получить("authorization")).ЭтоНеопределено();
	
КонецПроцедуры

Процедура ТестДолжен_ОтправитьЗапрос_GET_ПеренаправитьЗапросСАутентификацией() Экспорт

	Location = КодироватьСтроку("https://postman-echo.com/headers", СпособКодированияСтроки.КодировкаURL);
	URL = СтрШаблон("https://httpbin.org/redirect-to?url=%1&status_code=301", Location);

	Ответ = CURL
		.ПеренаправлятьЗапрос(, Истина)
		.АутентификацияНаСервере("user", "secret")
		.Get(URL)
		.ОтветКакJson();
	
	Ожидаем.Что(CURL.КодСостояния()).Равно(200);
	Ожидаем.Что(Ответ["headers"].Получить("authorization")).Не_().ЭтоНеопределено();
		
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Процедура НайтиИПодключитьCURL()
	
	Файл = Новый Файл(ИспользуемоеИмяФайла);
	ПутьККаталогу = Файл.Путь;
	
	Файлы = НайтиФайлы(ПутьККаталогу, "cURL.epf");
	Если Файлы.Количество() = 0 Тогда
		ВызватьИсключение "Не найден файл cURL.epf в каталоге с тестами";
	КонецЕсли;
	
	ВнешниеОбработки.Создать(Файлы[0].ПолноеИмя, Ложь);
	
КонецПроцедуры

#КонецОбласти

#КонецЕсли