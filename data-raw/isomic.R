library(dplyr, warn.conflicts = FALSE)

url <- "https://www.iso20022.org/sites/default/files/ISO10383_MIC/ISO10383_MIC.csv"

isomic <- read.csv(
  url,
  colClasses = "character",
  na.strings = "",
  encoding = "UTF-8",
  check.names = FALSE
) |>
  setNames(c(
    "mic",
    "operating_mic",
    "type",
    "market_name",
    "legal_entity_name",
    "lei",
    "market_category_code",
    "acronym",
    "country_code",
    "city",
    "website",
    "status",
    "creation_date",
    "last_update_date",
    "last_validation_date",
    "expiry_date",
    "comments"
  )) |>
  mutate(
    across(where(is.character), \(x) na_if(gsub("\\s+", " ", trimws(x)), "")),
    across(c(city, website), \(x) na_if(x, "N/A")),
    across(ends_with("_date"), \(x) as.Date(x, format = "%Y%m%d"))
  ) |>
  arrange(mic) |>
  tibble::as_tibble()

stopifnot(
  !anyDuplicated(isomic$mic),
  all(isomic$operating_mic %in% isomic$mic),
  all(isomic$type %in% c("OPRT", "SGMT")),
  all(isomic$status %in% c("ACTIVE", "EXPIRED", "UPDATED"))
)

write.csv(isomic, "data-raw/isomic.csv", row.names = FALSE, na = "")
usethis::use_data(isomic, overwrite = TRUE)
