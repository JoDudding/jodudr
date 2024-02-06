#-------------------------------------------------------------------------------
# create a hex sticker
#-------------------------------------------------------------------------------

library(jodudr)
library(hexSticker)
library(colorspace)
library(tidyverse)
library(patchwork)
library(showtext)

font_add_google("Montserrat", "montserrat")
showtext_auto()

pal <- rev(jo_pal_grad(6))

col <- '#FFFFE0'

col_15 <- pal[6]
col_30 <- pal[5]
col_45 <- pal[4]
col_60 <- pal[3]
col_75 <- pal[2]
col_90 <- pal[1]

#-------------------------------------------------------------------------------
# dataframe of hexagon points
#-------------------------------------------------------------------------------

hex_r <- 1
hex_R <- hex_r * sqrt(3) / 2

y <- c(
  1.5 * hex_r,
  2.0 * hex_r,
  1.5 * hex_r,
  0.5 * hex_r,
  0.0 * hex_r,
  0.5 * hex_r
)

x <- c(
  2 * hex_R,
  hex_R,
  0,
  0,
  hex_R,
  2 * hex_R
)

hexagon <- as.data.frame(cbind(x, y)) %>%
  mutate(
    val = 1,
    id = 1
  )

#-------------------------------------------------------------------------------
# max x and y
#-------------------------------------------------------------------------------

m_x <- max(hexagon$x)/2
m_y <- max(hexagon$y)/2

#-------------------------------------------------------------------------------
# plot hexagons
#-------------------------------------------------------------------------------

hex_plot <- ggplot(hexagon) +
  geom_polygon(aes(x,y),
               colour = NA, fill = col_15, size = .1
  ) +
  geom_polygon(aes(x * .85 + .15*m_x, y *.85 + .15*m_y),
               colour = col, fill = col_30, size = .1
  ) +
  geom_polygon(aes(x * .70 + .30*m_x, y *.70 + .30*m_y),
               colour = col, fill = col_45, size = .1
  ) +
  geom_polygon(aes(x * .55 + .45*m_x, y *.55 + .45*m_y),
               colour = col, fill = col_60, size = .1
  ) +
  geom_polygon(aes(x * .40 + .60*m_x, y *.40 + .60*m_y),
               colour = col, fill = col_75, size = .1
  ) +
  geom_polygon(aes(x * .25 + .75*m_x, y *.25 + .75*m_y),
               colour = col, fill = col_90, size = .1
  ) +
  geom_polygon(aes(x * .10 + .90*m_x, y *.10 + .90*m_y),
               colour = col, fill = col, size = .1
  )  +
  #annotate('text', x = m_x, y = m_y, label = 'jodudr', colour = pal[6], size = 15) +
  coord_fixed() +
  theme_void() +
  theme_transparent()

hex_plot

#-------------------------------------------------------------------------------
# create hex sticker logo
#-------------------------------------------------------------------------------

sticker(hex_plot, package = 'jodudr',
        p_size=27, p_x = 1, p_y = 1, p_color = pal[6], p_family = 'montserrat',
        s_x=1, s_y=1, s_width=2.25, s_height=2.25,
        h_size = 0, h_fill = col, h_color = col,
        filename="inst/figures/jodudr.png")

sticker(hex_plot, package = '',
        p_size=27, p_x = 1, p_y = 1, p_color = pal[6], p_family = 'montserrat',
        s_x=1, s_y=1, s_width=2.25, s_height=2.25,
        h_size = 0, h_fill = col, h_color = col,
        filename="inst/figures/jodudr-plain.png")

#-------------------------------------------------------------------------------
# use logo
#-------------------------------------------------------------------------------

usethis::use_logo(img = 'inst/figures/jodudr.png')

#-------------------------------------------------------------------------------

