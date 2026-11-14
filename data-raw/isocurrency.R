library(dplyr, warn.conflicts = FALSE)
library(xml2)

base_url <- "https://www.six-group.com/dam/download/financial-information/data-center/iso-currrency/lists"

read_six <- function(file, entry) {
  entries <- read_xml(file.path(base_url, file)) |> xml_find_all(entry)
  fields <- c("CtryNm", "CcyNm", "Ccy", "CcyNbr", "CcyMnrUnts", "WthdrwlDt")
  fields |>
    lapply(\(x) xml_text(xml_find_first(entries, x))) |>
    setNames(fields) |>
    as_tibble() |>
    mutate(across(everything(), \(x) {
      x <- trimws(x, whitespace = "[\\h\\v]")
      na_if(gsub("[\\h\\v]+", " ", x, perl = TRUE), "")
    }))
}

# SIX uses the ISO 3166 names in upper case, e.g. "KOREA (THE REPUBLIC OF)", while isocountry uses
# e.g. "Korea, Republic of"
normalize_name <- function(x) {
  x |>
    tolower() |>
    gsub("’", "'", x = _) |>
    sub(" \\(the\\)$", "", x = _) |>
    sub(" \\((the )?([^()]+)\\)$", ", \\2", x = _)
}

# names that don't match after normalization, including former names in the historic list
country_overrides <- c(
  "bolivia" = "BO",
  "burma" = "MM",
  "falkland islands (the) [malvinas]" = "FK",
  "holy see, vatican city state" = "VA",
  "lao" = "LA",
  "nauru" = "NR",
  "netherlands" = "NL",
  "saint martin" = "MF",
  "saint-barthélemy" = "BL",
  "swaziland" = "SZ",
  "türki̇ye" = "TR",
  "turkey" = "TR",
  "united states" = "US",
  "venezuela" = "VE",
  "vietnam" = "VN",
  "zaire" = "CD"
)

# entries in list one that aren't countries
non_countries <- c(
  "arab monetary fund",
  "european union",
  "international monetary fund (imf)",
  "member countries of the african development bank group",
  "sistema unitario de compensacion regional de pagos \"sucre\""
)

isocountry <- read.csv(
  "data-raw/isocountry.csv",
  colClasses = "character",
  na.strings = ""
)
country_lookup <- setNames(isocountry$alpha_2, normalize_name(isocountry$name))

match_country <- function(name) {
  key <- normalize_name(name)
  code <- unname(country_lookup[key])
  coalesce(code, unname(country_overrides[key]))
}

add_country <- function(data) {
  data |>
    mutate(
      country_code = match_country(CtryNm),
      idx = match(country_code, isocountry$alpha_2),
      country_name = coalesce(isocountry$name[idx], CtryNm),
      country_number = isocountry$country_code[idx]
    )
}

current <- read_six("list-one.xml", "//CcyNtry") |>
  filter(!is.na(Ccy), !startsWith(CtryNm, "ZZ")) |>
  add_country()

unmatched <- current |>
  filter(is.na(country_code), !tolower(CtryNm) %in% non_countries) |>
  pull(CtryNm)

if (length(unmatched) > 0L) {
  stop("Unmatched country names in list one: ", toString(unmatched), call. = FALSE)
}

isocurrency <- current |>
  filter(!is.na(country_code)) |>
  transmute(
    currency_name = CcyNm,
    currency_code = Ccy,
    currency_number = CcyNbr,
    currency_minor_unit = suppressWarnings(as.integer(CcyMnrUnts)),
    country_name,
    country_code,
    country_number
  ) |>
  distinct()

isocurrency_historic <- read_six("list-three.xml", "//HstrcCcyNtry") |>
  add_country() |>
  transmute(
    currency_name = CcyNm,
    currency_code = Ccy,
    currency_number = CcyNbr,
    withdrawal_date = WthdrwlDt,
    country_name,
    country_code,
    country_number
  ) |>
  distinct()

write.csv(isocurrency, "data-raw/isocurrency.csv", row.names = FALSE, na = "")
write.csv(
  isocurrency_historic,
  "data-raw/isocurrency_historic.csv",
  row.names = FALSE,
  na = ""
)
usethis::use_data(isocurrency, isocurrency_historic, overwrite = TRUE)
