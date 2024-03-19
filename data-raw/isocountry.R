library(dplyr)
library(rvest)

isocountry <- read_html("https://en.wikipedia.org/wiki/ISO_3166-1") |>
  html_elements(".wikitable") |>
  _[[2]] |>
  html_table(convert = FALSE) |>
  setNames(c(
    "name", "alpha_2", "alpha_3", "country_code", "iso_3166_2", "is_independent"
  )) |>
  mutate(
    name = gsub("\\[[a-z]\\]$", "", name),
    is_independent = ifelse(is_independent == "Yes", TRUE, FALSE)
  )

region <- read_html("https://unstats.un.org/unsd/methodology/m49/overview") |>
  html_element("table") |>
  html_table(header = TRUE, na.strings = "") |>
  rename_with(~ tolower(gsub(" |-", "_", .x))) |>
  select(
    alpha_2 = iso_alpha2_code,
    region_code,
    region_name,
    subregion_code = sub_region_code,
    subregion_name = sub_region_name,
    intermediate_region_code,
    intermediate_region_name,
    m49_code
  )

isocountry <- isocountry |>
  left_join(region, by = join_by(alpha_2))

readr::write_csv(isocountry, "data-raw/isocountry.csv")
usethis::use_data(isocountry, overwrite = TRUE)
