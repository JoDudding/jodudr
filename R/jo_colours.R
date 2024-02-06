#' Jo palette
#'
#' This is my colour palette
#'
#' @name jo_pal
#' @export
jo_pal <- list(
  primary = "#5F187F",
  secondary = "#FF823E",
  body = "#340048",
  rev = "#FFFFE0",
  bg = "transparent",
  grid = "#B486D4"
)

#' Create a gradient from primary (purple) to secondary (orange) colour
#'
#' @param n Number of colours to generate
#' @return A function that will return a gradient
#' @export
#'
#' @examples
#' jo_pal_grad(6)
jo_pal_grad <- function(n) {
  grDevices::colorRampPalette(c(jo_pal$primary, jo_pal$secondary))(n)
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
