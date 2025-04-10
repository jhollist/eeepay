% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/eee_dates.R
\name{eee_dates}
\alias{eee_dates}
\title{Extract dates}
\usage{
eee_dates(pay_stub)
}
\arguments{
\item{pay_stub}{A pay stub read in with \code{read_pay_stub}.}
}
\value{
A tibble of dates from a pay stub.
}
\description{
Pull out relevant dates from and Employee Express PDF pay stub
}
\examples{
path <- "~/projects/high_three/data/pay_stubs/els-01_14_2023 - Environmental Protection Agency250322.1108.pdf"
my_pay_stub <- eee_read_pay_stub(path)
eee_dates(my_pay_stub)
}
