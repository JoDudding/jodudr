#-------------------------------------------------------------------------------
# snippets of code used when creating package that are not part of the package
#-------------------------------------------------------------------------------


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
#use_test("friday_wk")

#-------------------------------------------------------------------------------
# get github connection
#-------------------------------------------------------------------------------

readr::read_csv(
  list.files('C:/Users/jmdud/Documents (local)', pattern = 'git', full.names = TRUE)
) |>
  dplyr::pull(RStudio) |>
  credentials::set_github_pat()

usethis::git_sitrep()

load_all()
document()
test()
build_readme()
check()
install()
pkgdown::build_site()


#-------------------------------------------------------------------------------



