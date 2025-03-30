# eeepay

Package for reading in pay stubs from Employee Express 
(https://www.employeeexpress.gov/) and pulling out key information.

As of March/April 2025 date and pay extraction working on a subset of example 
leave and earning statements.  

# Installation

```{r}
devtools::install_github("jhollist/eeepay")
```

# Example

```{r}
library(eeepay)
pay_path <- system.file("data/les_sample.pdf", package = "eeepay")
pay_stub <- eee_read_pay_stub(pay_path)
pay_dates <- eee_dates(pay_stub)
pay_payments <- eee_payments(pay_stub)
pay_df <- dplyr::left_join(pay_dates, pay_payments)
pay_df
```



