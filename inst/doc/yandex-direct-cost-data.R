## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  eval=FALSE,
  collapse = TRUE,
  comment = "#>"
)

## -----------------------------------------------------------------------------
#  library(rfacebookstat)
#  library(googleAnalyticsR)
#  
#  # fb options
#  options(ryandexdirect.username = 'your_yandex_username')
#  
#  # auth
#  fbAuth()
#  ga_auth(email = "google_analytics@gmail.com")
#  
#  # read data from facebook
#  cost_data <- yadirGetCostData(DateFrom        = '2020-03-01',
#                                DateTo          = '2020-03-10',
#                                Source          = 'yandex',
#                                Medium          = 'cpc',
#                                IncludeVAT      = "YES",
#                                IncludeDiscount = "NO")
#  
#  # upload into GA source
#  ga_custom_upload_file(accountId          = 2222222,
#                        webPropertyId      = "UA-2222222-1",
#                        customDataSourceId = 'M_XXXXX_Qudk-8g',
#                        cost_data)

