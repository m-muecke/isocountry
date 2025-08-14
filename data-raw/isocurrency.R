library(dplyr)
library(rvest)

str_squish <- function(x) {
  x |>
    tolower() |>
    trimws() |>
    gsub("\\s+", " ", x = _)
}

currency_codes <- read_html("https://www.iban.com/currency-codes") |>
  html_element("table") |>
  html_table(convert = FALSE) |>
  rename_with(tolower) |>
  mutate(
    code = na_if(code, ""),
    number = na_if(number, ""),
    country = country |> gsub("\u2019", "'", x = _) |> str_squish()
  ) |>
  tidyr::drop_na(code)

country_codes <- read_html("https://www.iban.com/country-codes") |>
  html_element("table") |>
  html_table(convert = FALSE) |>
  rename_with(\(x) tolower(gsub(" |-", "_", x))) |>
  mutate(
    country = gsub("\u2019", "'", country, fixed = TRUE),
    country_name = country,
    country = str_squish(country)
  )

isocurrency <- currency_codes |>
  # TODO: remove country name fix once the source is updated
  mutate(country = replace(country, grepl("czech republic", country, fixed = TRUE), "czechia")) |>
  inner_join(country_codes, by = join_by(country)) |>
  select(
    currency_name = currency,
    currency_code = code,
    currency_number = number,
    country_name,
    country_code = alpha_2_code,
    country_number = numeric
  )

write.csv(isocurrency, "data-raw/isocurrency.csv", row.names = FALSE)
usethis::use_data(isocurrency, overwrite = TRUE)
