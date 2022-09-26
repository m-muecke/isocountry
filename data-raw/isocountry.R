library(dplyr)
library(rvest)

isocountry <- read_html("https://en.wikipedia.org/wiki/ISO_3166-1") %>%
  html_elements(".wikitable") %>%
  .[[2]] %>%
  html_table(convert = FALSE) %>%
  setNames(c(
    "name", "alpha_2", "alpha_3", "country_code", "iso_3166_2", "is_independent"
  )) %>%
  mutate(
    name = gsub("\\[[a-z]\\]$", "", name),
    is_independent = ifelse(is_independent == "Yes", TRUE, FALSE)
  )

readr::write_csv(isocountry, "data-raw/isocountry.csv")
usethis::use_data(isocountry, overwrite = TRUE)
