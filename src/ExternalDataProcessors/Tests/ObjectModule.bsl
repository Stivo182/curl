#Если Сервер Или ТолстыйКлиентОбычноеПриложение Или ВнешнееСоединение Тогда

#Область ОписаниеПеременных

Перем КонтекстЯдра; // ВнешняяОбработка
Перем Ожидаем; // ВнешняяОбработка
Перем Curl; // ВнешняяОбработка
Перем ПараметрыПрокси; // Соответствие

#КонецОбласти

#Область ПрограммныйИнтерфейс

// Инициализация.
// 
// Параметры:
//  КонтекстЯдраПараметр - ВнешняяОбработка - Контекст ядра параметр
Процедура Инициализация(КонтекстЯдраПараметр) Экспорт
	
	КонтекстЯдра = КонтекстЯдраПараметр;
	Ожидаем = КонтекстЯдра.Плагин("УтвержденияBDD");
	
	НайтиИПодключитьCURL();
	ПрочитатьПараметрыПрокси();
		
КонецПроцедуры

// Заполняет набор тестов.
// 
// Параметры:
//  НаборТестов - ВнешняяОбработка - Набор тестов
//  КонтекстЯдраПараметр - ВнешняяОбработка - Контекст ядра параметр
Процедура ЗаполнитьНаборТестов(НаборТестов, КонтекстЯдраПараметр) Экспорт
	
	КонтекстЯдра = КонтекстЯдраПараметр;
	
	#Область Get
		НаборТестов.Добавить("ТестДолжен_УспешноВыполнитьМетодGetПоHTTP");  
		НаборТестов.Добавить("ТестДолжен_ПолучитьДвоичныеДанныеМетодомGetПоHTTP");  
		НаборТестов.Добавить("ТестДолжен_ПолучитьФайлМетодомGetFileПоHTTP");
	#КонецОбласти

	#Область Post
		НаборТестов.Добавить("ТестДолжен_УспешноВыполнитьМетодPost");  
		НаборТестов.Добавить("ТестДолжен_ПроверитьПередачуПараметризированнойСтрокиНаСерверМетодомPost");
		НаборТестов.Добавить("ТестДолжен_ПроверитьПередачуСтруктурыНаСерверМетодомPost");  
		НаборТестов.Добавить("ТестДолжен_ПроверитьПередачуСоответствияНаСерверМетодомPost");  
		НаборТестов.Добавить("ТестДолжен_ПроверитьПередачуДвоичныхДанныхНаСерверМетодомPost");  
		НаборТестов.Добавить("ТестДолжен_ПроверитьПередачуФайлаНаСерверМетодомPost");  
		НаборТестов.Добавить("ТестДолжен_ПроверитьПередачуДвоичныхДанныхВоВременномХранилищеНаСерверМетодомPost"); 
	#КонецОбласти
	
	#Область Put
		НаборТестов.Добавить("ТестДолжен_УспешноВыполнитьМетодPut"); 
		НаборТестов.Добавить("ТестДолжен_ПроверитьПередачуФайлаНаСерверМетодомPut"); 
		НаборТестов.Добавить("ТестДолжен_ПроверитьПередачуДвоичныхДанныхНаСерверМетодомPut"); 
	#КонецОбласти
	
	#Область UploadFile
		НаборТестов.Добавить("ТестДолжен_ПроверитьПередачуФайлаНаСерверМетодомUploadFileПоHTTP");
	#КонецОбласти
	
	#Область АутентификацияПоHTTP
		НаборТестов.Добавить("ТестДолжен_ПроверитьПрохождениеПроверкиПодлинностиМетодомBasicПоHTTP"); 
		НаборТестов.Добавить("ТестДолжен_ПроверитьПрохождениеПроверкиПодлинностиМетодомDigest"); 
		НаборТестов.Добавить("ТестДолжен_ПроверитьВСтрокеКомандыИспользованиеАутентификацииAWS3");
	#КонецОбласти
	
	#Область ПеренаправлениеЗапросовHTTP
		НаборТестов.Добавить("ТестДолжен_ПроверитьВыполнениеПеренаправленияЗапроса"); 
		НаборТестов.Добавить("ТестДолжен_ПроверитьЧтоЗапросНеБудетПеренаправлен"); 
		НаборТестов.Добавить("ТестДолжен_ПроверитьВыполнениеПеренаправленияЗапросаНаДругойХостБезВыполненияАвторизации"); 
		НаборТестов.Добавить("ТестДолжен_ПроверитьВыполнениеПеренаправленияЗапросаНаДругойХостСВыполнениемАвторизации"); 
	#КонецОбласти

	#Область ЗаголовкиHTTP
		НаборТестов.Добавить("ТестДолжен_ПроверитьПередачуHTTPЗаголовкаНаСерверМетодомGet");  
		НаборТестов.Добавить("ТестДолжен_ПроверитьПолучениеНесколькихЗаголовковОтветаSetCookie");	
		НаборТестов.Добавить("ТестДолжен_ПроверитьВозможностьПолученияЗаголовкаЗапросаПоИмениВнеЗависимостиОтРегистра");	
		НаборТестов.Добавить("ТестДолжен_ПроверитьВозможностьПолученияЗаголовкаОтветаПоИмениВнеЗависимостиОтРегистра");	
	#КонецОбласти
	
	#Область Куки
		НаборТестов.Добавить("ТестДолжен_ПроверитьОбновлениеКукиПослеВыполненияЗапроса");	
		НаборТестов.Добавить("ТестДолжен_ПроверитьЧтоКукиНеОбновленыПослеВыполненияЗапроса");	
	#КонецОбласти
	
	#Область FTP
		НаборТестов.Добавить("ТестДолжен_ПолучитьФайлПоFTP");	
		НаборТестов.Добавить("ТестДолжен_ВыполнитьАвторизациюПоFTP");
		НаборТестов.Добавить("ТестДолжен_ПровалитьАвторизациюПоFTP");
		НаборТестов.Добавить("ТестДолжен_ПроверитьНевозможностьПолученияНесуществующегоФайлаПоFTP");	
	#КонецОбласти

	#Область Сертификаты
		НаборТестов.Добавить(
			"ТестДолжен_ПроверитьВСтрокеКомандыИспользованиеСертификатКлиента");
		НаборТестов.Добавить(
			"ТестДолжен_ПроверитьВСтрокеКомандыИспользованиеСертификатКлиентаСТипом");
		НаборТестов.Добавить(
			"ТестДолжен_ПроверитьВСтрокеКомандыИспользованиеЗакрытогоКлючаСертификата");
		НаборТестов.Добавить(
			"ТестДолжен_ПроверитьВСтрокеКомандыИспользованиеЗакрытогоКлючаСертификатаСКодовымКодом");
		НаборТестов.Добавить(
			"ТестДолжен_ПроверитьВСтрокеКомандыИспользованиеЗакрытогоКлючаСертификатаСТипом");
		НаборТестов.Добавить(
			"ТестДолжен_ПроверитьВСтрокеКомандыИспользованиеСертификатовУдостоверяющихЦентровИзОС");
		НаборТестов.Добавить(
			"ТестДолжен_ПроверитьВСтрокеКомандыИспользованиеСертификатовУдостоверяющихЦентровИзФайла");
		НаборТестов.Добавить(
			"ТестДолжен_ПроверитьВСтрокеКомандыОтсутствиеИспользованияСертификатовУдостоверяющихЦентровИзОС");
		НаборТестов.Добавить(
			"ТестДолжен_ПроверитьВСтрокеКомандыОтсутствиеСертификатовУдостоверяющихЦентровИзФайла");
	#КонецОбласти
	
	#Область Прокси
		НаборТестов.Добавить("ТестДолжен_ВыполнитьЗапросЧерезПроксиСАутентификациейHTTP");
		НаборТестов.Добавить("ТестДолжен_ВыполнитьЗапросЧерезПроксиСАутентификациейSOCKS5");	
		
		#Область Сертификаты
			НаборТестов.Добавить(
				"ТестДолжен_ПроверитьВСтрокеКомандыИспользованиеСертификатКлиентаПрокси");
			НаборТестов.Добавить(
				"ТестДолжен_ПроверитьВСтрокеКомандыИспользованиеСертификатКлиентаСТипомПрокси");
			НаборТестов.Добавить(
				"ТестДолжен_ПроверитьВСтрокеКомандыИспользованиеЗакрытогоКлючаСертификатаПрокси");
			НаборТестов.Добавить(
				"ТестДолжен_ПроверитьВСтрокеКомандыИспользованиеЗакрытогоКлючаСертификатаСКодовымКодомПрокси");
			НаборТестов.Добавить(
				"ТестДолжен_ПроверитьВСтрокеКомандыИспользованиеЗакрытогоКлючаСертификатаСТипомПрокси");
			НаборТестов.Добавить(
				"ТестДолжен_ПроверитьВСтрокеКомандыИспользованиеСертификатовУдостоверяющихЦентровИзОСПрокси");
			НаборТестов.Добавить(
				"ТестДолжен_ПроверитьВСтрокеКомандыИспользованиеСертификатовУдостоверяющихЦентровИзФайлаПрокси");
			НаборТестов.Добавить(
				"ТестДолжен_ПроверитьВСтрокеКомандыОтсутствиеИспользованияСертификатовУдостоверяющихЦентровИзОСПрокси");
			НаборТестов.Добавить(
				"ТестДолжен_ПроверитьВСтрокеКомандыОтсутствиеСертификатовУдостоверяющихЦентровИзФайлаПрокси");
		#КонецОбласти
	#КонецОбласти
		
	#Область ПользовательскиеОпции
		НаборТестов.Добавить("ТестДолжен_ПроверитьНаличиеВКомандеДобавленнойПользовательскойОпции");
		НаборТестов.Добавить("ТестДолжен_ПроверитьОтсутствиеВКомандеУдаленнойПользовательскойОпции");
		НаборТестов.Добавить("ТестДолжен_ПроверитьОтсутствиеВКомандеОчищенныхПользовательскихОпций");
	#КонецОбласти
		
	#Область НаборыШифров
		НаборТестов.Добавить("ТестДолжен_ПроверитьВСтрокеКомандыНаборыШифровРазделенныеЗапятой"); 		
		НаборТестов.Добавить("ТестДолжен_ПроверитьВСтрокеКомандыНаборыШифровРазделенныеСимволомПереноса"); 		
		НаборТестов.Добавить("ТестДолжен_ПроверитьВСтрокеКомандыНаборыШифровПереданныеМассивом"); 		
		НаборТестов.Добавить("ТестДолжен_ПроверитьОчисткуНаборовШифров"); 		
	#КонецОбласти
	
	#Область Прочее
		НаборТестов.Добавить("ТестДолжен_ВыброситьИсключениеПриНеверномПутиКИсполняемомуФайлу"); 
		НаборТестов.Добавить("ТестДолжен_ПроверитьОбработкуОшибокУтилиты"); 
		НаборТестов.Добавить("ТестДолжен_ВыброситьИсключениеПриПолученииОшибкиОтУтилиты"); 
	#КонецОбласти
				
КонецПроцедуры

// Обработчик события перед запуском теста.
Процедура ПередЗапускомТеста() Экспорт
		
	Curl = ВнешниеОбработки.Создать("cURL");
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныйПрограммныйИнтерфейс

#Область Get

Процедура ТестДолжен_УспешноВыполнитьМетодGetПоHTTP() Экспорт
	
	Curl.Get("https://httpbin.org/get");
	
	Ожидаем.Что(Curl.КодСостояния()).Равно(КодСостоянияHTTP200());
	
КонецПроцедуры

Процедура ТестДолжен_ПолучитьДвоичныеДанныеМетодомGetПоHTTP() Экспорт
	
	Размер = 16;
	URL = СтрШаблон("https://httpbin.org/bytes/%1", Формат(Размер, "ЧГ="));
	
	ДвоичныеДанные = Curl.GetBinaryData(URL);
	
	Ожидаем.Что(Curl.КодСостояния()).Равно(КодСостоянияHTTP200());
	Ожидаем.Что(ДвоичныеДанные.Размер()).Равно(Размер);
	
КонецПроцедуры

Процедура ТестДолжен_ПолучитьФайлМетодомGetFileПоHTTP() Экспорт
	
	Размер = 16;
	URL = СтрШаблон("https://httpbin.org/bytes/%1", Формат(Размер, "ЧГ="));
	
	ПутьКФайлу = Curl.GetFile(URL);
	Файл = Новый Файл(ПутьКФайлу);
	
	Ожидаем.Что(Curl.КодСостояния()).Равно(КодСостоянияHTTP200());
	Ожидаем.Что(Файл.Размер()).Равно(Размер);
	
КонецПроцедуры

#КонецОбласти

#Область Post

Процедура ТестДолжен_УспешноВыполнитьМетодPost() Экспорт
	
	Curl.Post("https://httpbin.org/post");
	
	Ожидаем.Что(Curl.КодСостояния()).Равно(КодСостоянияHTTP200());
	
КонецПроцедуры

Процедура ТестДолжен_ПроверитьПередачуПараметризированнойСтрокиНаСерверМетодомPost() Экспорт
	
	Ключ = "Key";
	Значение = "Value";
	
	Данные = СтрШаблон("%1=%2", Ключ, Значение);	
	Ответ = Curl.Post("https://httpbin.org/post", Данные).ОтветКакJson();

	Ожидаем.Что(Ответ["form"][Ключ]).Равно(Значение);
	
КонецПроцедуры

Процедура ТестДолжен_ПроверитьПередачуСтруктурыНаСерверМетодомPost() Экспорт
	
	Тело = Новый Структура();
	Тело.Вставить("Brand", "Audi");
	Тело.Вставить("Speed", 250);
	Тело.Вставить("IsNew", Истина);
	Тело.Вставить("Cyrillic", "Ауди");
	Тело.Вставить("SpecChars", "p=1&p=2");

	Ответ = Curl.Post("https://httpbin.org/post", Тело).ОтветКакJson();
	
	ПолученныеПараметры = Ответ["form"];
	
	Ожидаем.Что(ПолученныеПараметры["Brand"]).Равно("Audi");
	Ожидаем.Что(ПолученныеПараметры["Speed"]).Равно("250");
	Ожидаем.Что(ПолученныеПараметры["IsNew"]).Равно("true");
	Ожидаем.Что(ПолученныеПараметры["Cyrillic"]).Равно("Ауди");
	Ожидаем.Что(ПолученныеПараметры["SpecChars"]).Равно("p=1&p=2");
	
КонецПроцедуры

Процедура ТестДолжен_ПроверитьПередачуСоответствияНаСерверМетодомPost() Экспорт
	
	Тело = Новый Соответствие();
	Тело.Вставить("Brand", "BMW");
	Тело.Вставить("Speed", 280);
	Тело.Вставить("IsNew", Ложь);
	Тело.Вставить("Cyrillic", "БМВ");
	Тело.Вставить("SpecChars", "p=3&p=4");

	Ответ = Curl.Post("https://httpbin.org/post", Тело).ОтветКакJson();
	
	ПолученныеПараметры = Ответ["form"];
	
	Ожидаем.Что(ПолученныеПараметры["Brand"]).Равно("BMW");
	Ожидаем.Что(ПолученныеПараметры["Speed"]).Равно("280");
	Ожидаем.Что(ПолученныеПараметры["IsNew"]).Равно("false");
	Ожидаем.Что(ПолученныеПараметры["Cyrillic"]).Равно("БМВ");
	Ожидаем.Что(ПолученныеПараметры["SpecChars"]).Равно("p=3&p=4");
	
КонецПроцедуры

Процедура ТестДолжен_ПроверитьПередачуДвоичныхДанныхНаСерверМетодомPost() Экспорт
	
	РазмерБуфера = 16;
	РазмерБуфераСтрокой = Формат(РазмерБуфера, "ЧГ=");
	
	Буфер = Новый БуферДвоичныхДанных(РазмерБуфера);
  	ДвоичныеДанные = ПолучитьДвоичныеДанныеИзБуфераДвоичныхДанных(Буфер); 
	
	Ответ = Curl.Post("https://httpbin.org/post", ДвоичныеДанные).ОтветКакJson();
				
	Ожидаем.Что(Ответ["headers"]["Content-Length"]).Равно(РазмерБуфераСтрокой);
	
КонецПроцедуры

Процедура ТестДолжен_ПроверитьПередачуФайлаНаСерверМетодомPost() Экспорт
	
	РазмерБуфера = 16;
	РазмерБуфераСтрокой = Формат(РазмерБуфера, "ЧГ=");
	
	Буфер = Новый БуферДвоичныхДанных(РазмерБуфера);
  	ДвоичныеДанные = ПолучитьДвоичныеДанныеИзБуфераДвоичныхДанных(Буфер);
	
	ПутьКФайлу = ПолучитьИмяВременногоФайла();
	ДвоичныеДанные.Записать(ПутьКФайлу);
	
  	Файл = Новый Файл(ПутьКФайлу);
	
	Попытка
		Ответ = Curl.Post("https://httpbin.org/post", Файл).ОтветКакJson();
	Исключение
		УдалитьФайлы(ПутьКФайлу);	
		ВызватьИсключение ОбработкаОшибок.ПодробноеПредставлениеОшибки(ИнформацияОбОшибке());
	КонецПопытки;
	
	УдалитьФайлы(ПутьКФайлу);
				
	Ожидаем.Что(Ответ["headers"]["Content-Length"]).Равно(РазмерБуфераСтрокой);
	
КонецПроцедуры

Процедура ТестДолжен_ПроверитьПередачуДвоичныхДанныхВоВременномХранилищеНаСерверМетодомPost() Экспорт
	
	РазмерБуфера = 16;
	РазмерБуфераСтрокой = Формат(РазмерБуфера, "ЧГ=");
	
	Буфер = Новый БуферДвоичныхДанных(РазмерБуфера);
  	ДвоичныеДанные = ПолучитьДвоичныеДанныеИзБуфераДвоичныхДанных(Буфер);
  	
  	Адрес = ПоместитьВоВременноеХранилище(ДвоичныеДанные);
	
	Ответ = Curl.Post("https://httpbin.org/post", Адрес).ОтветКакJson();
				
	Ожидаем.Что(Ответ["headers"]["Content-Length"]).Равно(РазмерБуфераСтрокой);
	
КонецПроцедуры

#КонецОбласти

#Область Put

Процедура ТестДолжен_УспешноВыполнитьМетодPut() Экспорт
	
	Curl.Put("https://httpbin.org/put");
	
	Ожидаем.Что(Curl.КодСостояния()).Равно(КодСостоянияHTTP200());
	
КонецПроцедуры

Процедура ТестДолжен_ПроверитьПередачуФайлаНаСерверМетодомPut() Экспорт
	
	РазмерБуфера = 16;
	РазмерБуфераСтрокой = Формат(РазмерБуфера, "ЧГ=");
	
	Буфер = Новый БуферДвоичныхДанных(РазмерБуфера);
  	ДвоичныеДанные = ПолучитьДвоичныеДанныеИзБуфераДвоичныхДанных(Буфер);
	
	ПутьКФайлу = ПолучитьИмяВременногоФайла();
	ДвоичныеДанные.Записать(ПутьКФайлу);
	
  	Файл = Новый Файл(ПутьКФайлу);
	
	Попытка
		Ответ = Curl.Put("https://httpbin.org/put", Файл).ОтветКакJson();
	Исключение
		УдалитьФайлы(ПутьКФайлу);	
		ВызватьИсключение ОбработкаОшибок.ПодробноеПредставлениеОшибки(ИнформацияОбОшибке());
	КонецПопытки;
	
	УдалитьФайлы(ПутьКФайлу);
				
	Ожидаем.Что(Ответ["headers"]["Content-Length"]).Равно(РазмерБуфераСтрокой);
	
КонецПроцедуры

Процедура ТестДолжен_ПроверитьПередачуДвоичныхДанныхНаСерверМетодомPut() Экспорт
	
	РазмерБуфера = 16;
	РазмерБуфераСтрокой = Формат(РазмерБуфера, "ЧГ=");
	
	Буфер = Новый БуферДвоичныхДанных(РазмерБуфера);
  	ДвоичныеДанные = ПолучитьДвоичныеДанныеИзБуфераДвоичныхДанных(Буфер);
	
	Ответ = Curl.Put("https://httpbin.org/put", ДвоичныеДанные).ОтветКакJson();
				
	Ожидаем.Что(Ответ["headers"]["Content-Length"]).Равно(РазмерБуфераСтрокой);
	
КонецПроцедуры

#КонецОбласти

#Область UploadFile

Процедура ТестДолжен_ПроверитьПередачуФайлаНаСерверМетодомUploadFileПоHTTP() Экспорт

	РазмерБуфера = 16;
	РазмерБуфераСтрокой = Формат(РазмерБуфера, "ЧГ=");
	
	Буфер = Новый БуферДвоичныхДанных(РазмерБуфера);
  	ДвоичныеДанные = ПолучитьДвоичныеДанныеИзБуфераДвоичныхДанных(Буфер);
	
	ПутьКФайлу = ПолучитьИмяВременногоФайла();
	ДвоичныеДанные.Записать(ПутьКФайлу);
	
	Попытка
		Ответ = Curl.UploadFile("https://httpbin.org/put", ПутьКФайлу).ОтветКакJson();
	Исключение
		УдалитьФайлы(ПутьКФайлу);	
		ВызватьИсключение ОбработкаОшибок.ПодробноеПредставлениеОшибки(ИнформацияОбОшибке());
	КонецПопытки;
	
	УдалитьФайлы(ПутьКФайлу);
				
	Ожидаем.Что(Ответ["headers"]["Content-Length"]).Равно(РазмерБуфераСтрокой);
	
КонецПроцедуры

#КонецОбласти

#Область АутентификацияПоHTTP

Процедура ТестДолжен_ПроверитьПрохождениеПроверкиПодлинностиМетодомBasicПоHTTP() Экспорт

	ИмяПользователя = "user";
	Пароль = "secret";
	
	URL = СтрШаблон("https://httpbin.org/basic-auth/%1/%2", ИмяПользователя, Пароль);
	Ответ = Curl.Аутентификация(ИмяПользователя, Пароль)
				.Get(URL)
				.ОтветКакJson();
	
	Ожидаем.Что(Curl.КодСостояния()).Равно(КодСостоянияHTTP200());
	Ожидаем.Что(Ответ["authenticated"]).Равно(Истина);
	
КонецПроцедуры

Процедура ТестДолжен_ПроверитьПрохождениеПроверкиПодлинностиМетодомDigest() Экспорт
	
	ИмяПользователя = "user";
	Пароль = "secret";
	
	URL = СтрШаблон("https://httpbin.org/digest-auth/auth/%1/%2", ИмяПользователя, Пароль);
	Ответ = Curl.АутентификацияDigest("user", "secret")
				.Get(URL)
				.ОтветКакJson();
	
	Ожидаем.Что(Curl.КодСостояния()).Равно(КодСостоянияHTTP200());
	Ожидаем.Что(Ответ["authenticated"]).Равно(Истина);
	
КонецПроцедуры

Процедура ТестДолжен_ПроверитьВСтрокеКомандыИспользованиеАутентификацииAWS3() Экспорт
	
	КлючДоступа = "access_key";
	СекретныйКлюч = "secret_key";
	Регион = "eu-west-1";
	Сервис = "s3";
	
	Эталон1 = СтрШаблон("--aws-sigv4 ""aws:amz:%1:%2""", Регион, Сервис);
	Эталон2 = СтрШаблон("--user ""%1:%2""", КлючДоступа, СекретныйКлюч);

	Curl.АутентификацияAWS4(КлючДоступа, СекретныйКлюч, Регион, Сервис);
	СтрокаКоманды = Curl.СобратьКоманду("https://amazonaws.com");	
	
	Ожидаем.Что(СтрокаКоманды).Содержит(Эталон1);
	Ожидаем.Что(СтрокаКоманды).Содержит(Эталон2);
	
КонецПроцедуры

#КонецОбласти

#Область ПеренаправлениеЗапросовHTTP

Процедура ТестДолжен_ПроверитьВыполнениеПеренаправленияЗапроса() Экспорт
	
	Location = КодироватьСтроку("https://httpbin.org/status/200", СпособКодированияСтроки.КодировкаURL);
	URL = СтрШаблон("https://httpbin.org/redirect-to?url=%1&status_code=301", Location);
	
	Curl.РазрешатьПеренаправления()
		.Get(URL);
	
	Ожидаем.Что(Curl.КодСостояния()).Равно(КодСостоянияHTTP200());
	
КонецПроцедуры

Процедура ТестДолжен_ПроверитьЧтоЗапросНеБудетПеренаправлен() Экспорт
	
	Location = КодироватьСтроку("https://httpbin.org/status/200", СпособКодированияСтроки.КодировкаURL);
	URL = СтрШаблон("https://httpbin.org/redirect-to?url=%1&status_code=301", Location);
	
	Curl.Get(URL);
	
	Ожидаем.Что(Curl.КодСостояния()).Равно(КодСостоянияHTTP301());
	
КонецПроцедуры

Процедура ТестДолжен_ПроверитьВыполнениеПеренаправленияЗапросаНаДругойХостБезВыполненияАвторизации() Экспорт
	
	Location = КодироватьСтроку("https://postman-echo.com/headers", СпособКодированияСтроки.КодировкаURL);
	URL = СтрШаблон("https://httpbin.org/redirect-to?url=%1&status_code=301", Location);
	
	Ответ = Curl
		.РазрешатьПеренаправления()
		.Аутентификация("user", "secret")
		.Get(URL)
		.ОтветКакJson();
		
	Ожидаем.Что(Curl.КодСостояния()).Равно(КодСостоянияHTTP200());
	Ожидаем.Что(Ответ["headers"].Получить("authorization")).ЭтоНеопределено();
	
КонецПроцедуры

Процедура ТестДолжен_ПроверитьВыполнениеПеренаправленияЗапросаНаДругойХостСВыполнениемАвторизации() Экспорт

	Location = КодироватьСтроку("https://postman-echo.com/headers", СпособКодированияСтроки.КодировкаURL);
	URL = СтрШаблон("https://httpbin.org/redirect-to?url=%1&status_code=301", Location);

	Ответ = Curl
		.РазрешатьПеренаправления(Истина, Истина)
		.Аутентификация("user", "secret")
		.Get(URL)
		.ОтветКакJson();
	
	Ожидаем.Что(Curl.КодСостояния()).Равно(КодСостоянияHTTP200());
	Ожидаем.Что(Ответ["headers"].Получить("authorization")).Не_().ЭтоНеопределено();
		
КонецПроцедуры

#КонецОбласти

#Область ЗаголовкиHTTP

Процедура ТестДолжен_ПроверитьПередачуHTTPЗаголовкаНаСерверМетодомGet() Экспорт
	
	Агент = "1C:Enterprise";
	Ответ = Curl.УстановитьЗаголовок("User-Agent", Агент)
				.Get("https://httpbin.org/get")
				.ОтветКакJson();
	
	Ожидаем.Что(Ответ["headers"]["User-Agent"]).Равно(Агент);
	
КонецПроцедуры

Процедура ТестДолжен_ПроверитьПолучениеНесколькихЗаголовковОтветаSetCookie() Экспорт
	
	КлючИЗначение1 = КодироватьСтроку("name=Jack", СпособКодированияСтроки.КодировкаURL);
	КлючИЗначение2 = КодироватьСтроку("age=25", СпособКодированияСтроки.КодировкаURL);
	КоличествоЗаголовков = 2;
	
	URL = СтрШаблон("https://httpbin.org/response-headers?set-cookie=%1&set-cookie=%2", КлючИЗначение1, КлючИЗначение2);

	ЗаголовкиОтвета = Curl.Get(URL).ЗаголовкиОтвета();
	
	ЗначениеЗаголовка = ЗаголовкиОтвета.Получить("set-cookie");
	
	Ожидаем.Что(Curl.КодСостояния()).Равно(КодСостоянияHTTP200());
	Ожидаем.Что(ЗначениеЗаголовка, "Ожидаем тип Массив").ИмеетТип(Тип("Массив"));
	Ожидаем.Что(ЗначениеЗаголовка.Количество(), "Ожидаем 2 элемента").Равно(КоличествоЗаголовков);
	
КонецПроцедуры

Процедура ТестДолжен_ПроверитьВозможностьПолученияЗаголовкаЗапросаПоИмениВнеЗависимостиОтРегистра() Экспорт
	
	Эталон = "name=value";
	Curl.УстановитьЗаголовок("COOKIE", Эталон);
	
	Значение = Curl.Заголовок("Cookie");
	
	Ожидаем.Что(Значение).Равно(Эталон);
	
КонецПроцедуры

Процедура ТестДолжен_ПроверитьВозможностьПолученияЗаголовкаОтветаПоИмениВнеЗависимостиОтРегистра() Экспорт
	
	Эталон = "text/html; charset=utf-8";
	
	Параметр = КодироватьСтроку(Эталон, СпособКодированияСтроки.КодировкаURL);
	URL = СтрШаблон("https://httpbin.org/response-headers?Content-Type=%1", Параметр);

	Значение = Curl
		.Get(URL)
		.ЗаголовокОтвета("Content-TYPE");
	
	Ожидаем.Что(Curl.КодСостояния()).Равно(КодСостоянияHTTP200());
	Ожидаем.Что(Значение).Равно(Эталон);
	
КонецПроцедуры

#КонецОбласти

#Область Куки

Процедура ТестДолжен_ПроверитьОбновлениеКукиПослеВыполненияЗапроса() Экспорт
	
	Параметр = КодироватьСтроку("Age=18", СпособКодированияСтроки.КодировкаURL);
	URL = СтрШаблон("https://httpbin.org/response-headers?set-cookie=%1", Параметр);

	Куки = Curl
		.УстановитьКуки("Name=Jhon")
		.Get(URL)
		.Куки();
	
	Ожидаем.Что(Curl.КодСостояния()).Равно(КодСостоянияHTTP200());
	Ожидаем.Что(Куки.Получить("Name")).Равно("Jhon");
	Ожидаем.Что(Куки.Получить("Age")).Равно("18");
	
КонецПроцедуры

Процедура ТестДолжен_ПроверитьЧтоКукиНеОбновленыПослеВыполненияЗапроса() Экспорт
	
	Параметр = КодироватьСтроку("Age=18", СпособКодированияСтроки.КодировкаURL);
	URL = СтрШаблон("https://httpbin.org/response-headers?set-cookie=%1", Параметр);

	Куки = Curl
		.УстановитьКуки("Name=Jhon")
		.ОбновлятьКуки(Ложь)
		.Get(URL)
		.Куки();
	
	Ожидаем.Что(Curl.КодСостояния()).Равно(КодСостоянияHTTP200());
	Ожидаем.Что(Куки.Получить("Name")).Равно("Jhon");
	Ожидаем.Что(Куки.Получить("Age")).ЭтоНеопределено();
	
КонецПроцедуры

#КонецОбласти

#Область FTP

Процедура ТестДолжен_ПолучитьФайлПоFTP() Экспорт
	
	Текст = Curl.GetString("ftp://demo:password@test.rebex.net/readme.txt");
	
	Ожидаем.Что(Curl.КодСостояния()).Равно(КодСостоянияFTP226());
	Ожидаем.Что(Текст).Заполнено();
	
КонецПроцедуры

Процедура ТестДолжен_ВыполнитьАвторизациюПоFTP() Экспорт
	
	Curl.Аутентификация("demo", "password")
		.Get("ftp://test.rebex.net");
	
	Ожидаем.Что(Curl.КодСостояния()).Равно(КодСостоянияFTP226());
	
КонецПроцедуры

Процедура ТестДолжен_ПровалитьАвторизациюПоFTP() Экспорт
	
	Curl.Аутентификация("demo", "incorrect_password")
		.Get("ftp://test.rebex.net");
	
	Ожидаем.Что(Curl.КодСостояния()).Равно(КодСостоянияFTP530());
	
КонецПроцедуры

Процедура ТестДолжен_ПроверитьНевозможностьПолученияНесуществующегоФайлаПоFTP() Экспорт
	
	Curl.Get("ftp://demo:password@test.rebex.net/non-existent_file.txt");
	
	Ожидаем.Что(Curl.КодСостояния()).Равно(КодСостоянияFTP550());
	
КонецПроцедуры

#КонецОбласти

#Область Сертификаты

Процедура ТестДолжен_ПроверитьВСтрокеКомандыИспользованиеСертификатКлиента() Экспорт
	
	ИмяФайлаСертификата = "certfile";   
	Пароль = "password";  
	
	Эталон = СтрШаблон("--cert ""%1:%2""", ИмяФайлаСертификата, Пароль);

	Curl.УстановитьСертификатКлиента(ИмяФайлаСертификата, Пароль);
	
	СтрокаКоманды = Curl.СобратьКоманду("https://example.com");	
	
	Ожидаем.Что(СтрокаКоманды).Содержит(Эталон);
	
КонецПроцедуры

Процедура ТестДолжен_ПроверитьВСтрокеКомандыИспользованиеСертификатКлиентаСТипом() Экспорт
	
	ИмяФайлаСертификата = "certfile";
	Пароль = "password";
	ТипСертификата = "PEM";
	
	Эталон1 = СтрШаблон("--cert ""%1:%2""", ИмяФайлаСертификата, Пароль);
	Эталон2 = СтрШаблон("--cert-type ""%1""", ТипСертификата);

	Curl.УстановитьСертификатКлиента(ИмяФайлаСертификата, Пароль, ТипСертификата);
	
	СтрокаКоманды = Curl.СобратьКоманду("https://example.com");	
	
	Ожидаем.Что(СтрокаКоманды).Содержит(Эталон1);
	Ожидаем.Что(СтрокаКоманды).Содержит(Эталон2);
	
КонецПроцедуры

Процедура ТестДолжен_ПроверитьВСтрокеКомандыИспользованиеЗакрытогоКлючаСертификата() Экспорт
	
	ИмяФайлаЗакрытогоКлюча = "keyfile";  
	
	Эталон = СтрШаблон("--key ""%1""", ИмяФайлаЗакрытогоКлюча);

	Curl.УстановитьЗакрытыйКлючСертификата(ИмяФайлаЗакрытогоКлюча);
	
	СтрокаКоманды = Curl.СобратьКоманду("https://example.com");	
	
	Ожидаем.Что(СтрокаКоманды).Содержит(Эталон);
	
КонецПроцедуры

Процедура ТестДолжен_ПроверитьВСтрокеКомандыИспользованиеЗакрытогоКлючаСертификатаСКодовымКодом() Экспорт
	
	ИмяФайлаЗакрытогоКлюча = "keyfile";
	КодовоеСлово = "secret";
	
	Эталон1 = СтрШаблон("--key ""%1""", ИмяФайлаЗакрытогоКлюча);
	Эталон2 = СтрШаблон("--pass ""%1""", КодовоеСлово);

	Curl.УстановитьЗакрытыйКлючСертификата(ИмяФайлаЗакрытогоКлюча, КодовоеСлово);
	
	СтрокаКоманды = Curl.СобратьКоманду("https://example.com");	
	
	Ожидаем.Что(СтрокаКоманды).Содержит(Эталон1);
	Ожидаем.Что(СтрокаКоманды).Содержит(Эталон2);
		
КонецПроцедуры

Процедура ТестДолжен_ПроверитьВСтрокеКомандыИспользованиеЗакрытогоКлючаСертификатаСТипом() Экспорт
	
	ИмяФайлаЗакрытогоКлюча = "keyfile";  
	ТипЗакрытогоКлюча = "PEM";
	
	Эталон1 = СтрШаблон("--key ""%1""", ИмяФайлаЗакрытогоКлюча);
	Эталон2 = СтрШаблон("--key-type ""%1""", ТипЗакрытогоКлюча);

	Curl.УстановитьЗакрытыйКлючСертификата(ИмяФайлаЗакрытогоКлюча,, ТипЗакрытогоКлюча);
	
	СтрокаКоманды = Curl.СобратьКоманду("https://example.com");	
	
	Ожидаем.Что(СтрокаКоманды).Содержит(Эталон1);
	Ожидаем.Что(СтрокаКоманды).Содержит(Эталон2);
	
КонецПроцедуры

Процедура ТестДолжен_ПроверитьВСтрокеКомандыИспользованиеСертификатовУдостоверяющихЦентровИзОС() Экспорт
	
	Опция = "--ca-native";
	
	Curl.ИспользоватьСертификатыУдостоверяющихЦентровИзОС();
	
	СтрокаКоманды = Curl.СобратьКоманду("https://example.com");	
	
	Ожидаем.Что(СтрокаКоманды).Содержит(Опция);
	
КонецПроцедуры

Процедура ТестДолжен_ПроверитьВСтрокеКомандыИспользованиеСертификатовУдостоверяющихЦентровИзФайла() Экспорт
	
	ИмяФайла = "CA-file.txt";

	Эталон = СтрШаблон("--cacert ""%1""", ИмяФайла);
	
	Curl.УстановитьСертификатыУдостоверяющихЦентров(ИмяФайла);
	
	СтрокаКоманды = Curl.СобратьКоманду("https://example.com");	
	
	Ожидаем.Что(СтрокаКоманды).Содержит(Эталон);
	
КонецПроцедуры

Процедура ТестДолжен_ПроверитьВСтрокеКомандыОтсутствиеИспользованияСертификатовУдостоверяющихЦентровИзОС() Экспорт
	
	ИмяФайла = "CA-file.txt";
	ОпцияСертификатыУЦИзОС = "--ca-native";
	
	Curl.ИспользоватьСертификатыУдостоверяющихЦентровИзОС();
	Curl.УстановитьСертификатыУдостоверяющихЦентров(ИмяФайла);
	
	СтрокаКоманды = Curl.СобратьКоманду("https://example.com");	
	
	Ожидаем.Что(СтрокаКоманды).Не_().Содержит(ОпцияСертификатыУЦИзОС);
	
КонецПроцедуры

Процедура ТестДолжен_ПроверитьВСтрокеКомандыОтсутствиеСертификатовУдостоверяющихЦентровИзФайла() Экспорт
	
	ИмяФайла = "CA-file.txt";
	ОпцияСертификатыУЦИзФайла = "--cacert";
	
	Curl.УстановитьСертификатыУдостоверяющихЦентров(ИмяФайла);
	Curl.ИспользоватьСертификатыУдостоверяющихЦентровИзОС();
	
	СтрокаКоманды = Curl.СобратьКоманду("https://example.com");	
	
	Ожидаем.Что(СтрокаКоманды).Не_().Содержит(ОпцияСертификатыУЦИзФайла);
	
КонецПроцедуры

#КонецОбласти

#Область Прокси

Процедура ТестДолжен_ВыполнитьЗапросЧерезПроксиСАутентификациейHTTP() Экспорт
	
	Параметры = ПараметрыПрокси["http"];
	
	Curl.УстановитьПрокси("http", Параметры["host"], Параметры["port"])
		.АутентификацияПрокси(Параметры["user"], Параметры["pass"])
		.Get("https://httpbin.org/get");
		
	Ожидаем.Что(Curl.КодСостояния()).Равно(КодСостоянияHTTP200());
	
КонецПроцедуры

Процедура ТестДолжен_ВыполнитьЗапросЧерезПроксиСАутентификациейSOCKS5() Экспорт
	
	Параметры = ПараметрыПрокси["socks5"];
	
	Curl.УстановитьПрокси("socks5", Параметры["host"], Параметры["port"])
		.АутентификацияПрокси(Параметры["user"], Параметры["pass"])
		.РазрешатьПеренаправления()
		.Get("https://www.ya.ru/");
		
	Ожидаем.Что(Curl.КодСостояния()).Равно(КодСостоянияHTTP200());
	
КонецПроцедуры

#Область Сертификаты

Процедура ТестДолжен_ПроверитьВСтрокеКомандыИспользованиеСертификатКлиентаПрокси() Экспорт
	
	ИмяФайлаСертификата = "certfile";   
	Пароль = "password";  
	
	Эталон = СтрШаблон("--proxy-cert ""%1:%2""", ИмяФайлаСертификата, Пароль);

	Curl.ПроксиУстановитьСертификатКлиента(ИмяФайлаСертификата, Пароль);
	
	СтрокаКоманды = Curl.СобратьКоманду("https://example.com");	
	
	Ожидаем.Что(СтрокаКоманды).Содержит(Эталон);
	
КонецПроцедуры

Процедура ТестДолжен_ПроверитьВСтрокеКомандыИспользованиеСертификатКлиентаСТипомПрокси() Экспорт
	
	ИмяФайлаСертификата = "certfile";
	Пароль = "password";
	ТипСертификата = "PEM";
	
	Эталон1 = СтрШаблон("--proxy-cert ""%1:%2""", ИмяФайлаСертификата, Пароль);
	Эталон2 = СтрШаблон("--proxy-cert-type ""%1""", ТипСертификата);

	Curl.ПроксиУстановитьСертификатКлиента(ИмяФайлаСертификата, Пароль, ТипСертификата);
	
	СтрокаКоманды = Curl.СобратьКоманду("https://example.com");	
	
	Ожидаем.Что(СтрокаКоманды).Содержит(Эталон1);
	Ожидаем.Что(СтрокаКоманды).Содержит(Эталон2);
	
КонецПроцедуры

Процедура ТестДолжен_ПроверитьВСтрокеКомандыИспользованиеЗакрытогоКлючаСертификатаПрокси() Экспорт
	
	ИмяФайлаЗакрытогоКлюча = "keyfile";  
	
	Эталон = СтрШаблон("--proxy-key ""%1""", ИмяФайлаЗакрытогоКлюча);

	Curl.ПроксиУстановитьЗакрытыйКлючСертификата(ИмяФайлаЗакрытогоКлюча);
	
	СтрокаКоманды = Curl.СобратьКоманду("https://example.com");	
	
	Ожидаем.Что(СтрокаКоманды).Содержит(Эталон);
	
КонецПроцедуры

Процедура ТестДолжен_ПроверитьВСтрокеКомандыИспользованиеЗакрытогоКлючаСертификатаСКодовымКодомПрокси() Экспорт
	
	ИмяФайлаЗакрытогоКлюча = "keyfile";
	КодовоеСлово = "secret";
	
	Эталон1 = СтрШаблон("--proxy-key ""%1""", ИмяФайлаЗакрытогоКлюча);
	Эталон2 = СтрШаблон("--proxy-pass ""%1""", КодовоеСлово);

	Curl.ПроксиУстановитьЗакрытыйКлючСертификата(ИмяФайлаЗакрытогоКлюча, КодовоеСлово);
	
	СтрокаКоманды = Curl.СобратьКоманду("https://example.com");	
	
	Ожидаем.Что(СтрокаКоманды).Содержит(Эталон1);
	Ожидаем.Что(СтрокаКоманды).Содержит(Эталон2);
		
КонецПроцедуры

Процедура ТестДолжен_ПроверитьВСтрокеКомандыИспользованиеЗакрытогоКлючаСертификатаСТипомПрокси() Экспорт
	
	ИмяФайлаЗакрытогоКлюча = "keyfile";  
	ТипЗакрытогоКлюча = "PEM";
	
	Эталон1 = СтрШаблон("--proxy-key ""%1""", ИмяФайлаЗакрытогоКлюча);
	Эталон2 = СтрШаблон("--proxy-key-type ""%1""", ТипЗакрытогоКлюча);

	Curl.ПроксиУстановитьЗакрытыйКлючСертификата(ИмяФайлаЗакрытогоКлюча,, ТипЗакрытогоКлюча);
	
	СтрокаКоманды = Curl.СобратьКоманду("https://example.com");	
	
	Ожидаем.Что(СтрокаКоманды).Содержит(Эталон1);
	Ожидаем.Что(СтрокаКоманды).Содержит(Эталон2);
	
КонецПроцедуры

Процедура ТестДолжен_ПроверитьВСтрокеКомандыИспользованиеСертификатовУдостоверяющихЦентровИзОСПрокси() Экспорт
	
	Опция = "--proxy-ca-native";
	
	Curl.ПроксиИспользоватьСертификатыУдостоверяющихЦентровИзОС();
	
	СтрокаКоманды = Curl.СобратьКоманду("https://example.com");	
	
	Ожидаем.Что(СтрокаКоманды).Содержит(Опция);
	
КонецПроцедуры

Процедура ТестДолжен_ПроверитьВСтрокеКомандыИспользованиеСертификатовУдостоверяющихЦентровИзФайлаПрокси() Экспорт
	
	ИмяФайла = "CA-file.txt";

	Эталон = СтрШаблон("--proxy-cacert ""%1""", ИмяФайла);
	
	Curl.ПроксиУстановитьСертификатыУдостоверяющихЦентров(ИмяФайла);
	
	СтрокаКоманды = Curl.СобратьКоманду("https://example.com");	
	
	Ожидаем.Что(СтрокаКоманды).Содержит(Эталон);
	
КонецПроцедуры

Процедура ТестДолжен_ПроверитьВСтрокеКомандыОтсутствиеИспользованияСертификатовУдостоверяющихЦентровИзОСПрокси() Экспорт
	
	ИмяФайла = "CA-file.txt";
	ОпцияСертификатыУЦИзОС = "--proxy-ca-native";
	
	Curl.ПроксиИспользоватьСертификатыУдостоверяющихЦентровИзОС();
	Curl.ПроксиУстановитьСертификатыУдостоверяющихЦентров(ИмяФайла);
	
	СтрокаКоманды = Curl.СобратьКоманду("https://example.com");	
	
	Ожидаем.Что(СтрокаКоманды).Не_().Содержит(ОпцияСертификатыУЦИзОС);
	
КонецПроцедуры

Процедура ТестДолжен_ПроверитьВСтрокеКомандыОтсутствиеСертификатовУдостоверяющихЦентровИзФайлаПрокси() Экспорт
	
	ИмяФайла = "CA-file.txt";
	ОпцияСертификатыУЦИзФайла = "--proxy-cacert";
	
	Curl.ПроксиУстановитьСертификатыУдостоверяющихЦентров(ИмяФайла);
	Curl.ПроксиИспользоватьСертификатыУдостоверяющихЦентровИзОС();
	
	СтрокаКоманды = Curl.СобратьКоманду("https://example.com");	
	
	Ожидаем.Что(СтрокаКоманды).Не_().Содержит(ОпцияСертификатыУЦИзФайла);
	
КонецПроцедуры

#КонецОбласти

#КонецОбласти

#Область ПользовательскиеОпции

Процедура ТестДолжен_ПроверитьНаличиеВКомандеДобавленнойПользовательскойОпции() Экспорт
	
	Curl.ДобавитьОпцию("--limit-rate", "1000");
	
	Команда = Curl.СобратьКоманду("http://example.com/");
	
	Ожидаем.Что(Команда).Содержит("--limit-rate ""1000""");
	
КонецПроцедуры

Процедура ТестДолжен_ПроверитьОтсутствиеВКомандеУдаленнойПользовательскойОпции() Экспорт
	
	Опция = "--limit-rate";
	
	Curl.ДобавитьОпцию(Опция, "1000");
	Curl.УдалитьОпцию(Опция);
	
	Команда = Curl.СобратьКоманду("http://example.com/");
	
	Ожидаем.Что(Команда).Не_().Содержит(Опция);
	
КонецПроцедуры

Процедура ТестДолжен_ПроверитьОтсутствиеВКомандеОчищенныхПользовательскихОпций() Экспорт
	
	Curl.ДобавитьОпцию("--limit-rate", "1000");
	Curl.ОчиститьОпции();
	
	Команда = Curl.СобратьКоманду("http://example.com/");
	
	Ожидаем.Что(Команда).Не_().Содержит("--limit-rate");
	
КонецПроцедуры

#КонецОбласти

#Область НаборыШифров

Процедура ТестДолжен_ПроверитьВСтрокеКомандыНаборыШифровРазделенныеЗапятой() Экспорт
	
	НаборШифров = НаборыШифровПоУмолчанию();
	
	НаборыШифровСтрокой = СтрСоединить(НаборШифров, ",");
	
	Эталон = СтрШаблон("--ciphers ""%1""", НаборыШифровСтрокой);

	Curl.ДобавитьНаборыШифров(НаборыШифровСтрокой);
	
	СтрокаКоманды = Curl.СобратьКоманду("https://example.com");	
	
	Ожидаем.Что(СтрокаКоманды).Содержит(Эталон);
	
КонецПроцедуры

Процедура ТестДолжен_ПроверитьВСтрокеКомандыНаборыШифровРазделенныеСимволомПереноса() Экспорт
	
	НаборШифров = НаборыШифровПоУмолчанию();
		
	НаборыШифровСтрокой = СтрСоединить(НаборШифров, ",");
	Эталон = СтрШаблон("--ciphers ""%1""", НаборыШифровСтрокой);

	НаборыШифровСтрокой = СтрСоединить(НаборШифров, Символы.ПС);
	Curl.ДобавитьНаборыШифров(НаборыШифровСтрокой);
	
	СтрокаКоманды = Curl.СобратьКоманду("https://example.com");	
	
	Ожидаем.Что(СтрокаКоманды).Содержит(Эталон);
	
КонецПроцедуры

Процедура ТестДолжен_ПроверитьВСтрокеКомандыНаборыШифровПереданныеМассивом() Экспорт
	
	НаборШифров = НаборыШифровПоУмолчанию();
		
	НаборыШифровСтрокой = СтрСоединить(НаборШифров, ",");
	Эталон = СтрШаблон("--ciphers ""%1""", НаборыШифровСтрокой);

	Curl.ДобавитьНаборыШифров(НаборШифров);
	
	СтрокаКоманды = Curl.СобратьКоманду("https://example.com");	
	
	Ожидаем.Что(СтрокаКоманды).Содержит(Эталон);
	
КонецПроцедуры

Процедура ТестДолжен_ПроверитьОчисткуНаборовШифров() Экспорт
	
	НаборШифров = НаборыШифровПоУмолчанию();

	Curl.ДобавитьНаборыШифров(НаборШифров);
	Curl.ОчиститьНаборыШифров();
	
	СтрокаКоманды = Curl.СобратьКоманду("https://example.com");	
	
	Ожидаем.Что(СтрокаКоманды).Не_().Содержит("--ciphers");
	
КонецПроцедуры

#КонецОбласти

#Область Прочее

Процедура ТестДолжен_ВыброситьИсключениеПриНеверномПутиКИсполняемомуФайлу() Экспорт
	
	БылоИсключение = Ложь;
	Попытка
		Curl.УказатьИсполняемыйФайл("ccurl")
			.Get("https://httpbin.org/get");
	Исключение
		БылоИсключение = Истина;
	КонецПопытки;
	
	Ожидаем.Что(БылоИсключение, "Не выбросилось исключение при неверном пути к исполняемому файлу").Равно(Истина);
	
КонецПроцедуры

Процедура ТестДолжен_ПроверитьОбработкуОшибокУтилиты() Экспорт
	
	КодВозврата = 6; // Could not resolve host. The given remote host could not be resolved.
	
	Curl.Get("http://non-existent.url");
	
	Ожидаем.Что(Curl.КодВозврата()).Равно(КодВозврата);
	Ожидаем.Что(Curl.ТекстОшибки()).Заполнено();
	
КонецПроцедуры

Процедура ТестДолжен_ВыброситьИсключениеПриПолученииОшибкиОтУтилиты() Экспорт

	КодВозврата = 6; // Could not resolve host. The given remote host could not be resolved.
	
	БылоИсключение = Ложь;
	Попытка	
		Curl.ВыбрасыватьИсключение()
			.Get("http://non-existent.url");
	Исключение
		БылоИсключение = Истина;
	КонецПопытки;
	
	Ожидаем.Что(БылоИсключение).Равно(Истина);
	Ожидаем.Что(Curl.КодВозврата()).Равно(КодВозврата);
	Ожидаем.Что(Curl.ТекстОшибки()).Заполнено();
			
КонецПроцедуры

#КонецОбласти

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Процедура НайтиИПодключитьCURL()
	
	ПолноеИмя = НайтиФайлВТекущемКаталоге("cURL.epf");
	Если ПолноеИмя = Неопределено Тогда
		ВызватьИсключение "Не найден файл cURL.epf в каталоге с тестами";
	КонецЕсли;
	
	ВнешниеОбработки.Создать(ПолноеИмя, Ложь);
	
КонецПроцедуры

// Прочитать параметры прокси.
//
// Пример содержимого файла:
//	{
//		"http": {
//			"host": "127.0.0.1",
//			"port": "1080",
//			"user": "user",
//			"pass": "secret"
//		},
//		"socks5": {
//			"host": "127.0.0.1",
//			"port": "1080",
//			"user": "user",
//			"pass": "secret"
//		}
//	}
// 
// 
Процедура ПрочитатьПараметрыПрокси()
	
	ПолноеИмя = НайтиФайлВТекущемКаталоге("proxy.json");
	Если ПолноеИмя = Неопределено Тогда
		ВызватьИсключение "Не найден файл proxy.json в каталоге с тестами";
	КонецЕсли;
	
	ПараметрыПрокси = ПрочитатьФайлJSON(ПолноеИмя);
	
КонецПроцедуры

Функция НайтиФайлВТекущемКаталоге(Имя)
	Файлы = НайтиФайлы(ПутьКТекущемуКаталогу(), Имя);
	Если Файлы.Количество() Тогда
		Возврат Файлы[0].ПолноеИмя;
	КонецЕсли;	
КонецФункции

Функция ПутьКТекущемуКаталогу()
	Файл = Новый Файл(ИспользуемоеИмяФайла);
	Возврат Файл.Путь;
КонецФункции

Функция ПрочитатьФайлJSON(ПутьКФайлу)
	
	ЧтениеJSON = Новый ЧтениеJSON;
	ЧтениеJSON.ОткрытьФайл(ПутьКФайлу);
	
	Результат = ПрочитатьJSON(ЧтениеJSON, Истина);

	ЧтениеJSON.Закрыть();
	
	Возврат Результат;
	
КонецФункции

Функция НаборыШифровПоУмолчанию()
	НаборШифров = Новый Массив;
	НаборШифров.Добавить("TLS_AES_128_GCM_SHA256");
	НаборШифров.Добавить("TLS_AES_256_GCM_SHA384");	
	Возврат НаборШифров;
КонецФункции

#Область КодыСостояний

Функция КодСостоянияHTTP200()
	Возврат 200;
КонецФункции

Функция КодСостоянияHTTP301()
	Возврат 301;
КонецФункции

Функция КодСостоянияFTP226()
	Возврат 226;
КонецФункции

Функция КодСостоянияFTP530()
	Возврат 530;
КонецФункции

Функция КодСостоянияFTP550()
	Возврат 550;
КонецФункции

#КонецОбласти

#КонецОбласти

#КонецЕсли