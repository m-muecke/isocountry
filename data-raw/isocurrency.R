library(data.table, warn.conflicts = FALSE)
library(xml2)

source("data-raw/utils.R")

base_url <- "https://www.six-group.com/dam/download/financial-information/data-center/iso-currrency/lists"

read_six <- function(file, entry) {
  entries <- read_xml(file.path(base_url, file)) |> xml_find_all(entry)
  fields <- c("CtryNm", "CcyNm", "Ccy", "CcyNbr", "CcyMnrUnts", "WthdrwlDt")
  setDT(lapply(setNames(nm = fields), \(field) squish(xml_text(xml_find_first(entries, field)))))
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

# entries that aren't countries
non_countries <- c(
  "Arab Monetary Fund",
  "European Monetary Co-operation Fund (EMCF)",
  "European Union",
  "International Monetary Fund (IMF)",
  "Member Countries of the African Development Bank Group",
  "Sistema Unitario de Compensacion Regional de Pagos \"Sucre\""
)

# countries in the historic list that no longer exist
former_countries <- c(
  "Czechoslovakia",
  "German Democratic Republic",
  "Netherlands Antilles",
  "Serbia and Montenegro",
  "Southern Rhodesia",
  "Union of Soviet Socialist Republics",
  "Yemen, Democratic",
  "Yugoslavia"
)
no_country <- c(non_countries, former_countries)

isocountry <- fread(
  "data-raw/isocountry.csv",
  select = c("alpha_2", "name", "country_number"),
  col.names = c("country_code", "country_name", "country_number"),
  colClasses = "character",
  na.strings = "",
  encoding = "UTF-8"
)

country_lookup <- data.table(
  from = c(
    normalize_name(isocountry$country_name),
    names(country_overrides),
    normalize_name(no_country)
  ),
  to = c(isocountry$country_code, unname(country_overrides), rep(NA, length(no_country))),
  # SIX publishes the names in upper case, so keep our spelling for the ones without a country
  label = c(rep(NA, nrow(isocountry) + length(country_overrides)), no_country)
)

stopifnot("Country lookup names must be unique" = !anyDuplicated(country_lookup$from))

add_country <- function(data) {
  data[, name_key := normalize_name(CtryNm)]
  unmatched <- data[!country_lookup, on = .(name_key = from), unique(CtryNm)]
  if (length(unmatched) > 0L) {
    stop("Unmatched country names: ", toString(unmatched), call. = FALSE)
  }

  data[country_lookup, on = .(name_key = from), let(country_code = i.to, label = i.label)]
  data <- mergelist(list(data, isocountry), on = "country_code", how = "left", mult = "error")
  data[, country_name := fcoalesce(country_name, label)]
  data
}

isocurrency <- read_six("list-one.xml", "//CcyNtry") |>
  _[!is.na(Ccy) & !startsWith(CtryNm, "ZZ")] |>
  add_country() |>
  _[
    !is.na(country_code),
    .(
      currency_name = CcyNm,
      currency_code = Ccy,
      currency_number = CcyNbr,
      currency_minor_unit = as.integer(replace(CcyMnrUnts, CcyMnrUnts == "N.A.", NA)),
      country_name,
      country_code,
      country_number
    )
  ] |>
  unique()

isocurrency_historic <- read_six("list-three.xml", "//HstrcCcyNtry") |>
  _[!startsWith(CtryNm, "ZZ")] |>
  add_country() |>
  _[, .(
    currency_name = CcyNm,
    currency_code = Ccy,
    currency_number = CcyNbr,
    withdrawal_date = WthdrwlDt,
    country_name,
    country_code,
    country_number
  )] |>
  unique()

setDF(isocurrency)
setDF(isocurrency_historic)

fwrite(isocurrency, "data-raw/isocurrency.csv", quote = TRUE, na = "")
fwrite(isocurrency_historic, "data-raw/isocurrency_historic.csv", quote = TRUE, na = "")
usethis::use_data(isocurrency, isocurrency_historic, overwrite = TRUE)
