
#' Set the options I use most often
#'
#' @return Options have been set
#' @export
jo_options <- function() {
  options(
    dplyr.width = Inf,
    papersize = "a4",
    tab.width = 2,
    width = 80,
    max.print = 25,
    stringsAsFactors = FALSE,
    lubridate.week.start = 6,
    tibble.print_max = 25,
    tibble.print_min = 25,
    tibble.width = Inf,
    dplyr.summarise.inform = FALSE,
    tidyverse.quiet = TRUE
  )
}

