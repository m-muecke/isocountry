#' @importFrom tibble tibble
NULL

#' Country names with ISO country codes
#'
#' ISO 3166-1 country codes with full country names, UN regional classifications,
#' OECD membership status, EU membership status, Economic and Monetary Union
#' (EMU) membership status, and European Economic Area (EEA) membership status.
#'
#' @source
#' * <https://en.wikipedia.org/wiki/ISO_3166-1>
#' * <https://unstats.un.org/unsd/methodology/m49/overview>
#' * <https://en.wikipedia.org/wiki/OECD>
#' * <https://en.wikipedia.org/wiki/Member_state_of_the_European_Union>
#'
#' `emu_member` is derived from the currency of each EU member state, and `eea_member` from EU
#' membership plus Iceland, Liechtenstein, and Norway. See
#' <https://en.wikipedia.org/wiki/Economic_and_Monetary_Union_of_the_European_Union> and
#' <https://en.wikipedia.org/wiki/European_Economic_Area> for the definitions.
#' @format A tibble with 249 rows and 17 variables:
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
#' ISO 4217 currency codes (list one) with the number of minor units and the countries using each
#' currency. Country names and codes are taken from [isocountry].
#'
#' @source <https://www.six-group.com/en/products-services/financial-information/data-standards.html>
#' @format A tibble with 262 rows and 7 variables:
#' \describe{
#'   \item{currency_name}{ISO currency name}
#'   \item{currency_code}{ISO currency code}
#'   \item{currency_number}{ISO currency number}
#'   \item{currency_minor_unit}{number of digits after the decimal separator}
#'   \item{country_name}{ISO country name}
#'   \item{country_code}{ISO alpha-2 country code}
#'   \item{country_number}{ISO country number}
#' }
#' @seealso [isocurrency_historic] for withdrawn currencies.
#' @examples
#' isocurrency
"isocurrency"

#' Historic ISO currency codes
#'
#' ISO 4217 currency codes that have been withdrawn (list three), e.g. the national currencies
#' replaced by the euro. Country names and codes are taken from [isocountry] where the country
#' still exists, otherwise the name is kept as published and the codes are `NA`.
#'
#' @source <https://www.six-group.com/en/products-services/financial-information/data-standards.html>
#' @format A tibble with 169 rows and 7 variables:
#' \describe{
#'   \item{currency_name}{ISO currency name}
#'   \item{currency_code}{ISO currency code}
#'   \item{currency_number}{ISO currency number}
#'   \item{withdrawal_date}{withdrawal date as published, usually `"YYYY-MM"` but sometimes a range
#'     such as `"1989 to 1990"`}
#'   \item{country_name}{country name}
#'   \item{country_code}{ISO alpha-2 country code}
#'   \item{country_number}{ISO country number}
#' }
#' @seealso [isocurrency] for current currencies.
#' @examples
#' isocurrency_historic
"isocurrency_historic"

#' ISO market identifier codes
#'
#' ISO 10383 market identifier codes (MICs) for exchanges, trading platforms, and other trading
#' venues, as published by the ISO 20022 registration authority. Includes active, updated, and
#' expired codes.
#'
#' @source <https://www.iso20022.org/market-identifier-codes>
#' @format A tibble with 2893 rows and 17 variables:
#' \describe{
#'   \item{mic}{market identifier code}
#'   \item{operating_mic}{MIC of the operating entity the market belongs to}
#'   \item{type}{`"OPRT"` for an operating MIC, `"SGMT"` for a market segment MIC}
#'   \item{market_name}{market name or institution description}
#'   \item{legal_entity_name}{legal name of the entity operating the market}
#'   \item{lei}{legal entity identifier (ISO 17442)}
#'   \item{market_category_code}{market category code, e.g. `"RMKT"` for regulated market}
#'   \item{acronym}{market acronym}
#'   \item{country_code}{ISO alpha-2 country code, `"ZZ"` for codes not tied to a country}
#'   \item{city}{city}
#'   \item{website}{website}
#'   \item{status}{`"ACTIVE"`, `"UPDATED"`, or `"EXPIRED"`}
#'   \item{creation_date}{date the MIC was created}
#'   \item{last_update_date}{date of the last update}
#'   \item{last_validation_date}{date of the last validation}
#'   \item{expiry_date}{date the MIC expired}
#'   \item{comments}{comments}
#' }
#' @examples
#' isomic
"isomic"
