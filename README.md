
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ryandexdirect - пакет для работы с API Яндекс.Директ версии 4, Live 4 и 5.

## Краткое описание.

Пакет ryandexdirect предназначен для загрузки данных из Яндекс Директ в
R, с помощью функций данного пакета вы можете работать с перечисленными
ниже сервисами и службами API Яндекса с помощью готовых функций, не
углубляясь при этом в документацию по работе с этими API сервисами.

  - [Сервис
    Reports](https://tech.yandex.ru/direct/doc/reports/reports-docpage/)
    - Предназначен для получения статистики по аккаунту рекламодателя.
  - [API Директа версии 4 и
    Live 4](https://tech.yandex.ru/direct/doc/dg-v4/concepts/About-docpage/)
    - Через API внешние приложения добавляют и редактируют кампании,
    объявления, фразы, задают ставки, получают статистику показов.
  - [API Директа
    версии 5](https://tech.yandex.ru/direct/doc/dg/concepts/about-docpage/)
    - Через API внешние приложения добавляют и редактируют кампании,
    объявления, фразы, задают ставки, получают статистику показов.

Пакет позволяет вам выполнять следующие действия:

1.  Авторизовываться в API.
2.  Получать список различных объектов рекламного кабинета, рекламных
    кампаний, групп объявлений, объявлений, для агентских аккаунтов
    можно запрашивать список клиентов, и параметры каждого клиента.
3.  Управлять показами на уровне рекламных кампаний, групп объявлений и
    объявлений.
4.  Загружать статистику.

## Установка пакета ryandexdirect.

Установка пакета осуществляется из репозитория CRAN

`install.packages("ryandexdirect")`

или GitHub, для этого сначала требуется установить и подключить пакет
devtools.

`install.packages("devtools")`

`library(devtools)`

После чего можно устанавливать пакет ryandexdirect.

### Установка на Windows осуществляется с помощью следующей команды

`install_github('selesnow/ryandexdirect')`

### Ссылки

1.  [Полная, официальная документация по работе с пакетом
    ryandexdirect](https://selesnow.github.io/ryandexdirect/).
2.  Баг репорты, предложения по доработке и улучшению функционала
    ryandexdirect оставлять
    [тут](https://github.com/selesnow/ryandexdirect/issues).
3.  [Список
    релизов](https://github.com/selesnow/ryandexdirect/releases).
4.  [Телеграмм канал R4marketing](https://t.me/R4marketing).
5.  [Группа в Вконтакте](https://vk.com/data_club).

### Автор пакета

Алексей Селезнёв, Head of analytics dept. at
[Netpeak](https://netpeak.net) <Br>email: <selesnow@gmail.com>
<Br>skype: selesnow <Br>facebook:
[facebook.com/selesnow](https://facebook.com/selesnow) <Br>blog:
[alexeyseleznev.wordpress.com](https://alexeyseleznev.wordpress.com/)

### CRAN

[![Rdoc](http://www.rdocumentation.org/badges/version/ryandexdirect)](http://www.rdocumentation.org/packages/ryandexdirect)
