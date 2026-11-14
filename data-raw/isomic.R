library(data.table, warn.conflicts = FALSE)

url <- "https://www.iso20022.org/sites/default/files/ISO10383_MIC/ISO10383_MIC.csv"

isomic <- fread(
  url,
  col.names = c(
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
  ),
  colClasses = "character",
  na.strings = '"N/A"',
  encoding = "UTF-8"
)

clean_text <- function(x) {
  # fread() keeps the doubled quotes used to escape quotes inside quoted fields
  x <- gsub('""', '"', x, fixed = TRUE)
  x <- trimws(x, whitespace = "[\\h\\v]")
  x <- gsub("[\\h\\v]+", " ", x, perl = TRUE)
  replace(x, !nzchar(x), NA)
}

isomic[, names(.SD) := lapply(.SD, clean_text)]
isomic[, names(.SD) := lapply(.SD, as.Date, format = "%Y%m%d"), .SDcols = patterns("_date$")]
setorder(isomic, mic)

stopifnot(
  "`mic` must be unique" = !anyDuplicated(isomic$mic),
  "Every `operating_mic` must be a known `mic`" = all(isomic$operating_mic %in% isomic$mic),
  "`type` must be \"OPRT\" or \"SGMT\"" = all(isomic$type %in% c("OPRT", "SGMT")),
  "`status` must be \"ACTIVE\", \"EXPIRED\", or \"UPDATED\"" = all(
    isomic$status %in% c("ACTIVE", "EXPIRED", "UPDATED")
  )
)

setDF(isomic)

fwrite(isomic, "data-raw/isomic.csv", quote = TRUE, na = "")
usethis::use_data(isomic, overwrite = TRUE)
