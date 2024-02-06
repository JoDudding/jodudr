#sysfonts::font_add_google("Montserrat", "montserrat")
#showtext::showtext_auto()

#' ggplot2 theme with my preferred settings
#'
#' @param primary_colour Colour for titles
#' @param base_colour Base text colour
#' @param base_bg Background colour
#' @param base_family Base font family
#' @param base_size Base font size
#' @param line_colour Base line colour
#' @param ... Pass other arguments to theme
#'
#' @return A ggplot2 theme
#' @export
#'
#' @examples
#' library(ggplot2)
#' ggplot(mapping = aes(x = letters[1:10], y = 1:10, fill = rep(c('o', 'e'), times = 5))) +
#'   geom_col() +
#'   labs(x = 'letter', y = 'number', fill = 'odd/even', title = 'dummy chart') +
#'   theme_jo()
theme_jo <- function(
    primary_colour = jo_pal$primary,
    base_colour = jo_pal$body,
    base_bg = "transparent",
    #base_family = "montserrat",
    base_size = 12,
    line_colour = jo_pal$grid,
    ...
) {

  ggplot2::theme_bw(...) %+replace%
    ggplot2::theme(
      # default font
      text = ggplot2::element_text(
#        family = base_family,
        size = base_size
      ),
      # align title and caption to the plot not the panel
      plot.title.position = 'plot',
      plot.caption.position = 'plot',
      # change the title and caption to markdown and move them further from the plot
      plot.title = ggplot2::element_text( #element_markdown(
        size = rel(2),
        hjust = 0,
        margin = margin(c(0, 0, 10, 0)),
        colour = primary_colour
      ),
      plot.subtitle = ggplot2::element_text( #element_markdown(
        size = rel(1.5),
        hjust = 0,
        margin = margin(c(0, 0, 15, 0))
      ),
      plot.caption = ggplot2::element_text( #element_markdown(
        hjust = 0,
        margin = margin(c(10, 0, 0, 0))
      ),
      # allow the axis values to the markdown as well
      #axis.text = ggplot2::element_markdown(),
      # remove the panel border
      panel.border = ggplot2::element_blank(),
      # set the background colour
      panel.background = ggplot2::element_rect(fill = base_bg, colour = NA),
      plot.background = ggplot2::element_rect(fill = base_bg, colour = NA),
      legend.background = ggplot2::element_rect(fill = base_bg, colour = NA),
      # put in the axis lines with a slightly thicker line than the gridlines
      axis.line = ggplot2::element_line(colour = line_colour, linewidth = 0.2),
      # make the tickmarks the same colour
      axis.ticks = ggplot2::element_line(colour = line_colour),
      # facet strip text left aligned with extra space above
      strip.text = ggplot2::element_text( #markdown(
        hjust = 0, margin = margin(c(10, 0, 0, 0)), colour = primary_colour
      ),
      # clear colour and fill for strip
      strip.background = ggplot2::element_rect(colour = NA, fill = NA),
      # dotted gridlines
      panel.grid = ggplot2::element_line(linetype = 'dotted'),
      # ability to use a different colour for the gridlines
      panel.grid.major.x = ggplot2::element_line(colour = line_colour, linetype = 1,
        linewidth = 0.15),
      panel.grid.major.y = ggplot2::element_line(colour = line_colour, linetype = 1,
        linewidth = 0.15),
      panel.grid.minor.x = ggplot2::element_blank(),
      panel.grid.minor.y = ggplot2::element_blank()
    )
}
