% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/eee_read_pay_stub.R
\name{eee_read_pay_stub}
\alias{eee_read_pay_stub}
\title{Read in pay stub}
\usage{
eee_read_pay_stub(path)
}
\arguments{
\item{path}{path to the pdf file}
}
\value{
A minimally cleaned vector of a pay stub
}
\description{
Simply using pdftools to read in the pdf of the pay stub and clean it up a bit
for passing through other functions
}
\examples{
path <- "~/projects/high_three/data/pay_stubs/els-01_14_2023 - Environmental Protection Agency250322.1108.pdf"
read_pay_stub(path)

}
