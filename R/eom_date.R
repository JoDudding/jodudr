#' determines the last day of month n months ago.
#' eom_date(lubridate::ymd('2022-04-19'), 13) # "2021-03-31"

eom_date <- function(d = lubridate::today(), n = 0) {
  lubridate::ceiling_date(d, 'month') -
    months(n) -
    lubridate::days(1)
}
