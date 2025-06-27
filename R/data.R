#' @importFrom tibble tibble
NULL

#' Country names with ISO country codes
#'
#' ISO 3166-1 country codes with full country names, UN regional classifications,
#' OECD membership status, EU membership status, Economic and Monetary Union (EMU) membership status,
#' and European Economic Area (EEA) membership status.
#'
#' @source
#' * <https://en.wikipedia.org/wiki/ISO_3166-1>
#' * <https://unstats.un.org/unsd/methodology/m49/overview>
#' * <https://en.wikipedia.org/wiki/OECD>
#' * <https://en.wikipedia.org/wiki/Member_state_of_the_European_Union>
#' * <https://en.wikipedia.org/wiki/Economic_and_Monetary_Union_of_the_European_Union>
#' * <https://en.wikipedia.org/wiki/European_Economic_Area>
#' @format A data frame with 249 rows and 17 variables:
#' \describe{
#'   \item{name}{country name}
#'   \item{alpha_2}{ISO alpha-2 code}
#'   \item{alpha_3}{ISO alpha-3 code}
#'   \item{country_code}{numeric code}
#'   \item{iso_3166_2}{ISO 3166-2 subdivision code}
#'   \item{is_independent}{is the country independent}
#'   \item{region_code}{UN region code}
#'   \item{region_name}{UN region name}
#'   \item{subregion_code}{UN subregion code}
#'   \item{subregion_name}{UN subregion name}
#'   \item{intermediate_region_code}{UN intermediate region code}
#'   \item{intermediate_region_name}{UN intermediate region name}
#'   \item{m49_code}{UN M49 code}
#'   \item{oecd_member}{is the country an OECD member}
#'   \item{eu_member}{is the country an EU member}
#'   \item{emu_member}{is the country an EMU member}
#'   \item{eea_member}{is the country an EEA member}
#' }
#' @examples
#' isocountry
"isocountry"

#' ISO currency codes
#'
#' ISO 4217 currency codes with full country names.
#'
#' @source <https://www.iban.com/currency-codes>
#' @format A data frame with 261 rows and 6 variables:
#' \describe{
#'   \item{currency_name}{ISO currency name}
#'   \item{currency_code}{ISO currency code}
#'   \item{currency_number}{ISO currency number}
#'   \item{country_name}{ISO country name}
#'   \item{country_code}{ISO alpha-2 country code}
#'   \item{country_number}{ISO country number}
#' }
#' @examples
#' isocurrency
"isocurrency"
