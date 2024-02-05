#' Create a gradient from primary (purple) to secondary (orange) colour
#'
#' @param n Number of colours to generate
#' @return A function that will return a gradient
#' @export
#'
#' @examples
#' jo_pal_grad(6)
jo_pal_grad <- function(n) {
  jo_primary <- "#5F187F"
  jo_secondary <- "#FF823E"
  jo_body <- "#340048"
  jo_rev <- "#FFFFE0"
  jo_bg <- "transparent"
  jo_grid <- "#B486D4"
  grDevices::colorRampPalette(c(jo_primary, jo_secondary))(n)
}



#
#scale_fill_jo_d <- function(n = 6, ...) {
#  ggplot2::scale_fill_manual(values = jo_pal_grad(n), ...)
#}
#
#scale_colour_jo_d <- function(n = 6, ...) {
#  ggplot2::scale_colour_manual(values = jo_pal_grad(n), ...)
#}
#
#scale_fill_jo_c <- function(...) {
#  ggplot2::scale_fill_gradient(low = jo_primary, high = jo_secondary, ...)
#}
#
#scale_colour_jo_c <- function(...) {
#  ggplot2::scale_colour_gradient(low = jo_primary, high = jo_secondary, ...)
#}
