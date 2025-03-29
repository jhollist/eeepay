#' Read in pay stub
#'
#' Simply using pdftools to read in the pdf of the pay stub and clean it up a bit
#' for passing through other functions
#'
#' @export
#' @param path path to the pdf file
#' @returns A minimally cleaned vector of a pay stub
#' @examples
#' path <- "~/projects/high_three/data/pay_stubs/els-01_14_2023 - Environmental Protection Agency250322.1108.pdf"
#' read_pay_stub(path)
#'
eee_read_pay_stub <- function(path){
  pdftxt <- pdftools::pdf_text(path)
  pdftxt <- stringr::str_split(pdftxt, "[ ]{2,}")
  pdftxt <- unlist(pdftxt)
  pdftxt <- stringr::str_split(pdftxt, "\n")
  pdftxt <- unlist(pdftxt)
  pdftxt[pdftxt != ""]
}
