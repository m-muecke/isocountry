# trim and collapse all whitespace, including non-breaking spaces, and turn blank strings into NA
squish <- function(x) {
  x <- trimws(x, whitespace = "[\\h\\v]")
  x <- gsub("[\\h\\v]+", " ", x, perl = TRUE)
  replace(x, !nzchar(x), NA)
}
