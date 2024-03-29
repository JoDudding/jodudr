% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/eom_date.R
\name{eom_date}
\alias{eom_date}
\title{Determines the last day of month n months ago}
\usage{
eom_date(d = lubridate::today(), n = 0)
}
\arguments{
\item{d}{A date variable. Default is today}

\item{n}{Number of months ago. Default is 0 (gives the last day of this month if d is today)}
}
\value{
A date
}
\description{
Determines the last day of month n months ago
}
\examples{
eom_date()
eom_date('1991-09-19')
eom_date(lubridate::ymd('2022-04-19'), 13) # "2021-03-31"
}
