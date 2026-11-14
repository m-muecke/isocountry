library(dplyr, warn.conflicts = FALSE)
library(rvest)

isocountry <- read_html("https://en.wikipedia.org/wiki/ISO_3166-1") |>
  html_elements(".wikitable") |>
  _[[3L]] |>
  html_table(convert = FALSE) |>
  setNames(c("name", "alpha_2", "alpha_3", "country_code", "iso_3166_2", "is_independent")) |>
  mutate(
    name = gsub("\\[[a-z]\\]$", "", name),
    is_independent = is_independent == "Yes"
  )

region <- read_html("https://unstats.un.org/unsd/methodology/m49/overview") |>
  html_element("table") |>
  html_table(header = TRUE, na.strings = "") |>
  rename_with(\(x) tolower(gsub(" |-", "_", x))) |>
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

oecd_member <- read_html("https://en.wikipedia.org/wiki/OECD") |>
  html_elements(".wikitable") |>
  _[[4L]] |>
  html_table(convert = FALSE) |>
  rename_with(tolower) |>
  mutate(
    country = replace_values(
      country,
      "Czech Republic" ~ "Czechia",
      "Netherlands" ~ "Netherlands, Kingdom of the",
      "South Korea" ~ "Korea, Republic of",
      "United States" ~ "United States of America",
      "Turkey" ~ "Türkiye",
      "United Kingdom" ~ "United Kingdom of Great Britain and Northern Ireland"
    ),
    oecd_member = TRUE
  ) |>
  select(country, oecd_member)

eu_member <- read_html("https://en.wikipedia.org/wiki/Member_state_of_the_European_Union") |>
  html_elements(".wikitable") |>
  _[[1L]] |>
  html_table(convert = FALSE) |>
  rename_with(tolower) |>
  mutate(eu_member = TRUE, emu_member = grepl("euro", currency, ignore.case = TRUE)) |>
  select(iso, eu_member, emu_member)

isocountry <- isocountry |>
  left_join(region, by = join_by(alpha_2), relationship = "one-to-one") |>
  left_join(
    oecd_member,
    by = join_by(name == country),
    unmatched = "error",
    relationship = "one-to-one"
  ) |>
  left_join(
    eu_member,
    by = join_by(alpha_2 == iso),
    unmatched = "error",
    relationship = "one-to-one"
  ) |>
  mutate(
    across(c(oecd_member, eu_member, emu_member), \(x) replace_values(x, NA ~ FALSE)),
    eea_member = eu_member | alpha_2 %in% c("IS", "LI", "NO")
  )

isocountry <- as.data.frame(isocountry)

write.csv(isocountry, "data-raw/isocountry.csv", row.names = FALSE, na = "")
usethis::use_data(isocountry, overwrite = TRUE)
