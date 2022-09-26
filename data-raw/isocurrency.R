library(dplyr)
library(rvest)

isocurrency <- read_html("https://www.iban.com/currency-codes") %>%
  html_element("table") %>%
  html_table(convert = FALSE) %>%
  rename_with(tolower) %>%
  mutate(
    code = ifelse(code == "", NA, code),
    number = ifelse(number == "", NA, number)
  )

readr::write_csv(isocurrency, "data-raw/isocurrency.csv")
usethis::use_data(isocurrency, overwrite = TRUE)
