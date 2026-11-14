library(data.table, warn.conflicts = FALSE)
library(rvest)

isocountry <- read_html("https://en.wikipedia.org/wiki/ISO_3166-1") |>
  html_elements(".wikitable") |>
  _[[3L]] |>
  html_table(convert = FALSE) |>
  setDT() |>
  setnames(c("name", "alpha_2", "alpha_3", "country_code", "iso_3166_2", "is_independent"))

stopifnot(
  "`alpha_2` must be unique" = !anyDuplicated(isocountry$alpha_2),
  "`is_independent` must only contain \"Yes\" or \"No\"" = all(
    isocountry$is_independent %in% c("Yes", "No")
  )
)

isocountry[, let(
  name = gsub("\\[[a-z]\\]$", "", name),
  is_independent = is_independent == "Yes"
)]

region <- read_html("https://unstats.un.org/unsd/methodology/m49/overview") |>
  html_element("table") |>
  html_table(header = TRUE, na.strings = "") |>
  setDT() |>
  setnames(\(x) tolower(gsub(" |-", "_", x))) |>
  _[, .(
    alpha_2 = iso_alpha2_code,
    region_code,
    region_name,
    subregion_code = sub_region_code,
    subregion_name = sub_region_name,
    intermediate_region_code,
    intermediate_region_name,
    m49_code
  )]

isocountry <- mergelist(list(isocountry, region), on = "alpha_2", how = "left", mult = "error") |>
  setcolorder("name")

# OECD members whose Wikipedia name differs from the ISO 3166 name
oecd_names <- c(
  "Czech Republic" = "Czechia",
  "Netherlands" = "Netherlands, Kingdom of the",
  "South Korea" = "Korea, Republic of",
  "United States" = "United States of America",
  "Turkey" = "Türkiye",
  "United Kingdom" = "United Kingdom of Great Britain and Northern Ireland"
)

oecd_countries <- read_html("https://en.wikipedia.org/wiki/OECD") |>
  html_elements(".wikitable") |>
  _[[4L]] |>
  html_table(convert = FALSE) |>
  _$Country
# map the Wikipedia names to ISO 3166 names, keep the names that already match
oecd_countries <- fcoalesce(unname(oecd_names[oecd_countries]), oecd_countries)

eu <- read_html("https://en.wikipedia.org/wiki/Member_state_of_the_European_Union") |>
  html_elements(".wikitable") |>
  _[[1L]] |>
  html_table(convert = FALSE) |>
  setDT() |>
  setnames(tolower) |>
  _[, .(iso, emu = currency %ilike% "euro")]

unmatched <- c(
  setdiff(oecd_countries, isocountry$name),
  setdiff(eu$iso, isocountry$alpha_2)
)
if (length(unmatched) > 0L) {
  stop("Unmatched OECD or EU members: ", toString(unmatched), call. = FALSE)
}

isocountry[, let(
  oecd_member = name %in% oecd_countries,
  eu_member = alpha_2 %in% eu$iso,
  emu_member = alpha_2 %in% eu[(emu), iso],
  eea_member = alpha_2 %in% c(eu$iso, "IS", "LI", "NO")
)]

setDF(isocountry)

fwrite(isocountry, "data-raw/isocountry.csv", quote = TRUE, na = "")
usethis::use_data(isocountry, overwrite = TRUE)
