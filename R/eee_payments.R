#' Extract pay
#'
#' Pull out relevant payments from and Employee Express PDF pay stub
#'
#' @param pay_stub  A pay stub read in with \code{read_pay_stub}.
#' @returns A tibble of payments from a pay stub.
#' @export
#' @examples
#' path <- "~/projects/high_three/data/pay_stubs/els-01_14_2023 - Environmental Protection Agency250322.1108.pdf"
#' my_pay_stub <- eee_read_pay_stub(path)
#' eee_payments(my_pay_stub)
eee_payments <- function(pay_stub){
  pp_begin_idx <- which(grepl("Pay Begin Date", pay_stub))[1] + 1
  gp_cur_idx <- which(grepl("\nGross Pay", pay_stub))[1] + 1
  gp_ytd_idx <- which(grepl("\nGross Pay", pay_stub))[1] + 2
  np_idx <- which(grepl("\nNet Pay", pay_stub))[1] + 1
  pp_begin <- lubridate::mdy(pay_stub[pp_begin_idx])
  gp_cur <- stringr::str_split(pay_stub[gp_cur_idx], " ")[[1]][1]
  gp_cur <- as.numeric(stringr::str_remove(gp_cur, ","))
  gp_ytd <- stringr::str_split(pay_stub[gp_ytd_idx], " ")[[1]][1]
  gp_ytd <- as.numeric(stringr::str_remove(gp_ytd, ","))
  np <- stringr::str_split(pay_stub[np_idx], " ")[[1]][1]
  np <- as.numeric(stringr::str_remove(np, ","))
  browser()
  tibble::tibble(pay_period_begin = pp_begin, gross_pay_current = gp_cur,
                 gross_pay_ytd = gp_ytd, net_pay = np)
}

