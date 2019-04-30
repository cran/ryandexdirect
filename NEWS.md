# ryandexdirect 3.1.4
* В результат возвращаемый функцией `yadirGetCampaign` добалены следующие поля:
    * SearchBidStrategyType - Тип стратегии показа на поиске
    * NetworkBidStrategyType - Тип стратегии показа в сетях

# ryandexdirect 3.1.1
* Исправлена ошибка в функции `yadirAuth`, возникающая после обновления просроченного токена.

# ryandexdirect 3.1.0
## Удалены функции
* Из пакета удалены следующие функции: `yadirGetSummaryStat`, `yadirGetCampaignListOld`, `yadirGetLogsData`, `yadirGetMetrikaGAData`
* Функция `yadirGetToken` теперь так же может сохранять полученный токен в локальный файл, если пользователь даст на это разрешение, но обновляться такой токен по истечению срока не будет, т.к. к нему не привязан refresh token.
* Для сокращении имени, и приведения названия функций к одному вижу у функции `yadirGetCampaignList` появилась дублируюая функция `yadirGetCampaign`, для совмещения новой версии пакета с кодом написанным под более ранними версиями обе функции в нём остаются.
* В функции `yadirGetCampaign` и `yadirGetCampaignList` по умолчанию в фильтр по типу кампаний включена загрузка кампаний с типом 'CPM_BANNER_CAMPAIGN'.
