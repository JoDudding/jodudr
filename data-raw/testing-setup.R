# create_package(here::here('projects', 'jodudr'))

library(devtools)
library(testthat)

#use_git_config(user.name = "Jo Dudding", user.email = "j.m.dudding@gmail.com")
#usethis::git_default_branch_configure()
#use_git()
#use_github()
#credentials::set_github_pat()
#use_mit_license()
#use_testthat()
#use_readme_rmd()
#use_package("lubridate")
#use_package("withr")
#use_package("dplyr")
#use_package("grDevices")
#usethis::use_pkgdown()

# new function script
#use_r('friday_wk')
#use_r('jo_options')
#use_r('jo_colours')
#use_r('summaryx')

#use_test("eom_date")
use_test("friday_wk")

usethis::git_sitrep()

load_all()
document()
test()
build_readme()
check()

pkgdown::build_site()

install()




#-------------------------------------------------------------------------------
# logo
#-------------------------------------------------------------------------------

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


library(jodudr)
eom_date()

#pal <- viridisLite::magma(8)[2:8]

#scales::show_col(pal)


#here::here()



library(tidyverse)

color_lookup <- colors(distinct = TRUE) |>
  enframe() |>
  rename(color_name = value) |>
  select(color_name) |>
  mutate(rgb = map(color_name, col2rgb),
         red = map_int(rgb, 1),
         green = map_int(rgb, 2),
         blue = map_int(rgb, 3),
         rgb_hex = pmap_chr(list(red, green, blue), .f = ~rgb(..1, ..2, ..3, maxColorValue = 255)))

color_lookup |>
  filter(
    str_detect(color_name, 'purple|violet|mauve|lilac|electric|grape|royal|eggplant|orchid|amethyst')
  ) |>
  slice(1:20) |>
  pull(rgb_hex) |>
  scales::show_col()

scales::show_col(c('goldenrod2', 'darkmagenta', 'chartreuse2', 'lavenderblush',
                   'lemonchiffon1', 'lightgoldenrod1', 'thistle1', 'chocolate4', 'deeppink3'))

library(tidyverse)

colour_hex <- colors() |>
  tibble::enframe() |>
  rename(colour_name = value) |>
  mutate(
    rgb = map(colour_name, col2rgb),
    red = map_int(rgb, 1),
    green = map_int(rgb, 2),
    blue = map_int(rgb, 3),
    rgb_hex = pmap_chr(list(red, green, blue), .f = ~rgb(..1, ..2, ..3, maxColorValue = 255))
  )

colour_hex |>
  filter(
    colour_name %in% c('goldenrod2', 'darkmagenta', 'chartreuse2', 'lavenderblush',
      'lemonchiffon1', 'lightgoldenrod1', 'thistle1', 'chocolate4', 'deeppink3')
  )

