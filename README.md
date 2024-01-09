
<!-- README.md is generated from README.Rmd. Please edit that file -->

# jodudr

<!-- badges: start -->
<!-- badges: end -->

The goal of `jodudr` is to collect functions I’ve found useful for data
analysis.

## Installation

You can install the development version of jodudr from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("JoDudding/jodudr")
```

# Date functions

## `eom_date`

This determines the last day of month n months ago:

``` r
library(jodudr)
eom_date(lubridate::ymd('2022-04-19'), 13)
#> [1] "2021-03-31"
```

Used without parameters it will give the last day of the current month
(run on 2024-01-09):

``` r
eom_date()
#> [1] "2024-01-31"
```

## `friday_wk`

> TODO
