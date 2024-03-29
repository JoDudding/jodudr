% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/summaryx.R
\name{summaryx}
\alias{summaryx}
\title{Create distribution stats for a variable}
\usage{
summaryx(data, var)
}
\arguments{
\item{data}{A dataframe/tibble}

\item{var}{A numeric variable}
}
\value{
A tibble containing summary stats
}
\description{
Create distribution stats for a variable
}
\examples{
dplyr::as_tibble(mtcars) |> summaryx(mpg)
}
