#' @importFrom tibble tibble
NULL

#' Country names with ISO country codes
#'
#' ISO 3166-1 country codes with full country names.
#'
#' @format A data frame with 249 rows and 6 variables:
#' \describe{
#'   \item{name}{country name}
#'   \item{alpha_2}{alpha-2 code}
#'   \item{alpha_3}{alpha-3 code}
#'   \item{country_code}{numeric code}
#'   \item{iso_3166_2}{ISO 3166-2 subdivision code}
#'   \item{is_independent}{is the country independent}
#' }
#' @source \url{https://en.wikipedia.org/wiki/ISO_3166-1}
"isocountry"
