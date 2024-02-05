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

