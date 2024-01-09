# create_package(here::here('projects', 'jodudr'))
library(devtools)
library(usethis)
use_git_config(user.name = "Jo Dudding", user.email = "j.m.dudding@gmail.com")
use_git()

gitcreds::gitcreds_set()

credentials::set_github_pat()

pal <- viridisLite::magma(8)[2:8]

scales::show_col(pal)


here::here()




