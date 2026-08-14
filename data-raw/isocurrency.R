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
  tidyr::drop_na(code) |>
  mutate(
    country = replace_when(
      country,
      grepl("czech republic", country, fixed = TRUE) ~ "czechia",
      country == "turkey" ~ "türkiye"
    )
  ) |>
  distinct()

country_codes <- read_html("https://www.iban.com/country-codes") |>
  html_element("table") |>
  html_table(convert = FALSE) |>
  rename_with(\(x) tolower(gsub(" |-", "_", x))) |>
  mutate(
    country = gsub("\u2019", "'", country, fixed = TRUE),
    country_name = country,
    country = str_squish(country)
  )

# entries in the currency source that aren't countries and hence can't be joined
non_countries <- c(
  "international monetary fund (imf)",
  "member countries of the african development bank group",
  "sistema unitario de compensacion regional de pagos \"sucre\""
)

unmatched <- setdiff(currency_codes$country, c(country_codes$country, non_countries))
if (length(unmatched) > 0L) {
  stop(
    "Unmatched country names in the currency source: ",
    toString(unmatched),
    call. = FALSE
  )
}

isocurrency <- currency_codes |>
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
