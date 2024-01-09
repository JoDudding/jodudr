#' Determines the last day of month n months ago
#'
#' @param d A date variable. Default is today
#' @param n Number of months ago. Default is 0 (gives the last day of this month if d is today)
#'
#' @return A date
#' @export
#'
#' @examples
#' eom_date()
#' eom_date('1991-09-19')
#' eom_date(lubridate::ymd('2022-04-19'), 13) # "2021-03-31"
eom_date <- function(d = lubridate::today(), n = 0) {
  d <- lubridate::as_date(d)
  lubridate::ceiling_date(d, 'month') -
    months(n) -
    lubridate::days(1)
}
