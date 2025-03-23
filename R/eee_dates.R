#' Extract dates
#'
#' Pull out relevant dates from and Employee Express PDF pay stub
#'
#' @param pay_stub  A pay stub read in with \code{read_pay_stub}.
#' @returns A tibble of dates from a pay stub.
#' @export
#' @examples
#' path <- "~/projects/high_three/data/pay_stubs/els-01_14_2023 - Environmental Protection Agency250322.1108.pdf"
#' my_pay_stub <- eee_read_pay_stub(path)
#' eee_dates(my_pay_stub)
eee_dates <- function(pay_stub){
  pp_end_idx <- which(grepl("Net Pay", pay_stub))[1] + 1
  p_date_idx <- which(grepl("\n\nName", pay_stub))[1]
  sc_date_idx <- which(grepl("\nService Comp Date", pay_stub))[1] + 1
  pp_begin_idx <- which(grepl("Pay Begin Date", pay_stub))[1] + 1
  pp_end <- lubridate::mdy(pay_stub[pp_end_idx])
  p_date <- lubridate::mdy(pay_stub[p_date_idx])
  sc_date <- lubridate::mdy(pay_stub[sc_date_idx])
  pp_begin <- lubridate::mdy(pay_stub[pp_begin_idx])
  tibble::tibble(pay_period_begin = pp_begin, pay_period_end = pp_end,
         pay_date = p_date, service_comp_date = sc_date)
}
