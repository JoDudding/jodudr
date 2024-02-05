
#' Get last day of the week where week ends on Friday
#'
#' @param d A date
#'
#' @return A date
#' @export
#'
#' @examples
#' d <- lubridate::ymd('2024-02-06') # a tuesday
#' friday_wk(d)
friday_wk <- function(d = lubridate::today()) {
  withr::local_options(lubridate.week.start = 6)
  lubridate::ceiling_date(
    d,
    'week',
    6
  ) -
    lubridate::days(1)
}
