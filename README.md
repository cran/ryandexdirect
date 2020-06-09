
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ryandexdirect - пакет для работы с API Яндекс.Директ версии 4, Live 4 и 5. <a href='https:/selesnow.github.io/ryandexdirect'><img src='https://raw.githubusercontent.com/selesnow/ryandexdirect/master/inst/ryandexdirect.png' align="right" height="139" /></a>

## Краткое описание.

Пакет ryandexdirect предназначен для загрузки данных из Яндекс Директ в R, с помощью функций данного пакета вы можете работать с перечисленными ниже сервисами и службами API Яндекса с помощью готовых функций, не углубляясь при этом в документацию по работе с этими API сервисами.

+ [Сервис Reports](https://tech.yandex.ru/direct/doc/reports/reports-docpage/) - Предназначен для получения статистики по аккаунту рекламодателя.
+ [API Директа версии 4 и Live 4](https://tech.yandex.ru/direct/doc/dg-v4/concepts/About-docpage/) - Через API внешние приложения добавляют и редактируют кампании, объявления, фразы, задают ставки, получают статистику показов.
+ [API Директа версии 5](https://tech.yandex.ru/direct/doc/dg/concepts/about-docpage/) - Через API внешние приложения добавляют и редактируют кампании, объявления, фразы, задают ставки, получают статистику показов.

Пакет позволяет вам выполнять следующие действия:

1. Авторизовываться в API.
2. Получать список различных объектов рекламного кабинета, рекламных кампаний, групп объявлений, объявлений, для агентских аккаунтов можно запрашивать список клиентов, и параметры каждого клиента.
3. Управлять показами на уровне рекламных кампаний, групп объявлений и объявлений.
4. Загружать статистику.
5. Упаравлять ставками ключевых слов и автотаргетингов.
6. Загружать данные о расходах, показах и кликах из Яндекс.Директ в Google Analytics.
7. Запрашивать данные из сервиса WordStat
8. Получить прогноз показов, кликов и трат по заданным ключевым фразам и регионам.

## Видео уроки
У `ryandexdirect` есть официальный обучающий плейлист на YouTube, все видео доступны по [ссылке](https://www.youtube.com/playlist?list=PLD2LDq8edf4oUo0L9Kw77ZXf0KcV1hu67).

## Установка пакета ryandexdirect.

Установка пакета осуществляется из репозитория CRAN 

`install.packages("ryandexdirect")`

или GitHub, для этого сначала требуется установить и подключить пакет devtools.

`install.packages("devtools")`

`library(devtools)`

После чего можно устанавливать пакет ryandexdirect.

`install_github('selesnow/ryandexdirect')`

### Пример кода
```r
# Установка пакетов
install.packages("ryandexdirect")

# Подключение пакета
library(ryandexdirect)

# Авторизация 
yadirAuth(Login     = "my_yandex_login",  # логин пользователя Яндекс.Директ
          TokenPath = "C:/direct/tokens") # путь к папаке в которой будет храниться файл с учётными данными
	  
# ###################################################
# Загрузка различных объектов из рекламного аккаунта
# ###################################################

# Список рекламных кампаний
camp <- yadirGetCampaign(Logins    = "my_yandex_login",
                         TokenPath = "C:/direct/tokens",
                         States    = "ON",
                         Types     = "TEXT_CAMPAIGN")

# Список ключевых слов
kw <- yadirGetKeyWords(Login       = "my_yandex_login",
                       TokenPath   = "C:/direct/tokens",
                       CampaignIds = camp$Id[1:5],
                       States      = "ON")

# Список групп объявлений
adgroups <- yadirGetAdGroups(Login       = "my_yandex_login",
                             TokenPath   = "C:/direct/tokens",
                             CampaignIds = camp$Id[c(1,2)],
                             Types       = "TEXT_AD_GROUP",
                             Statuses    = c("ACCEPTED", "MODERATION"))

# Список объявлений
ads <- yadirGetAds(Login       = "my_yandex_login",
                   TokenPath   = "C:/direct/tokens",
                   CampaignIds = camp$Id[c(1,2)])

# Список быстрых ссылок 
links <- yadirGetSiteLinks(Login       = "my_yandex_login",
                           TokenPath   = "C:/direct/tokens")

# ###################################################
# Загрузка справочной информации
# ###################################################

# Справочник валют
currency <- yadirGetDictionary(DictionaryName = "Currencies",
                               Language       = "en",
                               Login          = "my_yandex_login",
                               TokenPath      = "C:/direct/tokens")

# Георгафический справочник
regions <- yadirGetDictionary(DictionaryName = "GeoRegions",
                              Language       = "ru",
                              Login          = "my_yandex_login",
                              TokenPath      = "C:/direct/tokens")

# ###################################################
# Загрузка статистики
# ###################################################

# простейший отчёт за прошлый месяц
simple_report <- yadirGetReport(DateRangeType = "LAST_MONTH",  # относительный период
                                FieldNames    = c("Date", "Clicks", "Impressions"),
                                Login         = "my_yandex_login",
                                TokenPath     = "C:/direct/tokens")

# отчёт по конверсиям с моделью аттрибуции за статичный период
attribution_report <- yadirGetReport(DateFrom          = "2018-11-15", # статичный период, дата начала
                                     DateTo            = "2018-11-20", # статичный период, дата завершения
                                     FieldNames        = c("Date", 
                                                           "Conversions"),
                                     Goals             = c(27475434, 38234732),
                                     AttributionModels = c("LC", "FC"),
                                     Login             = "my_yandex_login",
                                     TokenPath         = "C:/direct/tokens")

# отчёт с применением фильтрации
filtring_report <- yadirGetReport(DateRangeType = "LAST_30_DAYS",
                                  FieldNames    = c("Date", "Clicks", "Impressions"),
                                  FilterList    = c("Conversions GREATER_THAN 1", 
                                                    "Impressions LESS_THAN 3500"),
                                  Login         = "my_yandex_login",
                                  TokenPath     = "C:/direct/tokens")

# ###################################################
# Управление ставками
# ###################################################

# запрашиваем ставки
bids  <- yadirGetKeyWordsBids(kw$Id)

# запрашиваем ставки и данные торго на поиске
bids_search <- yadirGetKeyWordsBids(kw$Id,
                                    AuctionBids = "search")
                                    
# запрашиваем ставки и данные торго в сетях
network_bids <- yadirGetKeyWordsBids(kw$Id,
                                     AuctionBids = "network")

# запрашиваем список рекламных кампаний
camp <- yadirGetCampaign()

# меняем ставки
setbid     <- yadirSetKeyWordsBids(CampaignIds = camp$Id[1],
                                   SearchBid   = 9)

# меняем ставки
autosetbids <- yadirSetAutoKeyWordsBids(KeywordIds = kw$Id,
                                        TargetTrafficVolume = 50)
```

### Виньетки
Пакет имеет подробные виньетки отдельно по каждой из своих возможностей, в которой наиболее подробно описаны детали работы с его функционалом. На данный момент в пакете `ryandexdirect` доступны 3 виньетки.

1. Загрзка статистики из API Яндекс Директ: `vignette("yandex-direct-get-statistic", package = "ryandexdirect")`
2. Авторизация и работа с учётными данными: `vignette("yandex-direct-auth", package = "ryandexdirect")`
3. Управление ставками ключевых слов в Яндекс Директ: `vignette("yandex-direct-keyword-bids", package = "ryandexdirect")`
4. Загрузка данных из сервиса WordStat и построение прогноха по показам, кликам и тратам: `vignette("yandex-direct-get-wordstat-forecast", package = "ryandexdirect")`
5. Загрузка данных о расходах, показах и кликах из Яндекс Директ в Google Analytics: `vignette("yandex-direct-cost-data", package = "ryandexdirect")`

### Статьи о пакете ryandexdirect
+ [Сравнение моделей атрибуции Директа и Метрики с помощью R](https://osipenkov.ru/attribution-direct-metrica-r/)
+ [Выгрузка данных по площадкам РСЯ в R](https://osipenkov.ru/direct-rsya-r/)
+ [ryandexdirect и выгрузка данных из Яндекс.Директ в RStudio](https://osipenkov.ru/ryandexdirect-direkt-r-step1/)
+ [Как ускорить работу с API на языке R с помощью параллельных вычислений, на примере API Яндекс.Директ (Часть 1)](https://habr.com/ru/post/437078/)
+ [Как ускорить работу с API на языке R с помощью параллельных вычислений, на примере API Яндекс.Директ (Часть 2)](https://selesnow.github.io/library/)
+ [Насколько безопасно использовать R пакеты для работы с API рекламных систем](https://habr.com/post/430888/)
+ [ryandexdirect 3.0.0 — обновлённый R клиент для работы с API Яндекс Директ ](https://alexeyseleznev.wordpress.com/2018/05/16/ryandexdirect-3-0-0-%D0%BE%D0%B1%D0%BD%D0%BE%D0%B2%D0%BB%D1%91%D0%BD%D0%BD%D1%8B%D0%B9-r-%D0%BA%D0%BB%D0%B8%D0%B5%D0%BD%D1%82-%D0%B4%D0%BB%D1%8F-%D1%80%D0%B0%D0%B1%D0%BE%D1%82%D1%8B-%D1%81-api/)
+ [Что такое язык R и как работать с API рекламных систем Google AdWords и Яндекс.Директ с его помощью](https://www.owox.ru/blog/articles/r-language-and-api-of-ad-systems/)
+ [Как загрузить статистику из рекламных систем в Google BigQuery](https://ppc.world/articles/kak-zagruzit-statistiku-iz-reklamnyh-sistem-v-google-bigquery/)
+ [Облако минус слов для Яндекс Директ](https://esliklientov.net/articles/%D0%BA%D0%BE%D0%BD%D1%82%D0%B5%D0%BA%D1%81%D1%82%D0%BD%D0%B0%D1%8F-%D1%80%D0%B5%D0%BA%D0%BB%D0%B0%D0%BC%D0%B0/%D1%8F%D0%BD%D0%B4%D0%B5%D0%BA%D1%81-%D0%B4%D0%B8%D1%80%D0%B5%D0%BA%D1%82/%D0%BE%D0%B1%D0%BB%D0%B0%D0%BA%D0%BE-%D0%BC%D0%B8%D0%BD%D1%83%D1%81-%D1%81%D0%BB%D0%BE%D0%B2-%D0%B4%D0%BB%D1%8F-%D1%8F%D0%BD%D0%B4%D0%B5%D0%BA%D1%81-%D0%B4%D0%B8%D1%80%D0%B5%D0%BA%D1%82.html)
+ [Подключение Power BI к Yandex.Metrika](http://pm-partner.ru/articles/2017/podkluchenie-power-bi-yandex-metrika/)
+ [Как связать Яндекс.Директ с Microsoft Power BI](https://netpeak.net/ru/blog/kak-svyazat-yandeks-direkt-s-microsoft-power-bi/)

### Вебинары
+ [Как маркетологу избавиться от рутины с помощью языка R и наконец то заняться маркетингом](https://www.youtube.com/watch?v=Kh-wyU-VXRU)

### Ссылки
1. [Полная, официальная документация по работе с пакетом ryandexdirect](https://selesnow.github.io/ryandexdirect/).
2. Баг репорты, предложения по доработке и улучшению функционала ryandexdirect оставлять [тут](https://github.com/selesnow/ryandexdirect/issues). 
3. [Список релизов](https://github.com/selesnow/ryandexdirect/releases).
4. [Телеграмм канал R4marketing](https://t.me/R4marketing).
5. [Группа в Вконтакте](https://vk.com/data_club).

### Автор пакета
Алексей Селезнёв, Head of analytics dept. at [Netpeak](https://netpeak.net)
<Br>email: selesnow@gmail.com
<Br>skype: selesnow
<Br>facebook: [facebook.com/selesnow](https://facebook.com/selesnow)
<Br>blog: [alexeyseleznev.wordpress.com](https://alexeyseleznev.wordpress.com/)

### Бейджи
[![Rdoc](http://www.rdocumentation.org/badges/version/ryandexdirect)](http://www.rdocumentation.org/packages/ryandexdirect)
[![rpackages.io rank](http://www.rpackages.io/badge/ryandexdirect.svg)](http://www.rpackages.io/package/ryandexdirect)
[![](https://cranlogs.r-pkg.org/badges/ryandexdirect)](https://cran.r-project.org/package=ryandexdirect)