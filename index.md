# isocountry

This package contains the following datasets:

- `isocountry`: dataset resulting from merging the
  [ISO-3166](https://en.wikipedia.org/wiki/ISO_3166-1) and the [UN
  Region Codes](https://unstats.un.org/unsd/methodology/m49/overview).
- `isocurrency`: [ISO
  4217](https://www.six-group.com/en/products-services/financial-information/data-standards.html)
  currency codes with minor units, combined with ISO 3166 country codes
  for easy joining.
- `isocurrency_historic`: withdrawn ISO 4217 currency codes, e.g. the
  national currencies replaced by the euro.
- `isomic`: [ISO
  10383](https://www.iso20022.org/market-identifier-codes) market
  identifier codes (MICs) for exchanges and other trading venues.

Package is inspired by the
[ISO-3166-Countries-with-Regional-Codes](https://github.com/lukes/ISO-3166-Countries-with-Regional-Codes)
project.

## Installation

You can install the released version of **isocountry** from
[CRAN](https://CRAN.R-project.org) with:

``` r

install.packages("isocountry")
```

And the development version from [GitHub](https://github.com/) with:

``` r

# install.packages("pak")
pak::pak("m-muecke/isocountry")
```

## Usage

``` r

library(isocountry)

countries <- merge(
  isocountry,
  isocurrency,
  by.x = "alpha_2",
  by.y = "country_code",
  all.x = TRUE
)
head(countries)
#>   alpha_2                 name alpha_3 country_code    iso_3166_2
#> 1      AD              Andorra     AND          020 ISO 3166-2:AD
#> 2      AE United Arab Emirates     ARE          784 ISO 3166-2:AE
#> 3      AF          Afghanistan     AFG          004 ISO 3166-2:AF
#> 4      AG  Antigua and Barbuda     ATG          028 ISO 3166-2:AG
#> 5      AI             Anguilla     AIA          660 ISO 3166-2:AI
#> 6      AL              Albania     ALB          008 ISO 3166-2:AL
#>   is_independent region_code region_name subregion_code
#> 1           TRUE         150      Europe             39
#> 2           TRUE         142        Asia            145
#> 3           TRUE         142        Asia             34
#> 4           TRUE          19    Americas            419
#> 5          FALSE          19    Americas            419
#> 6           TRUE         150      Europe             39
#>                    subregion_name intermediate_region_code
#> 1                 Southern Europe                       NA
#> 2                    Western Asia                       NA
#> 3                   Southern Asia                       NA
#> 4 Latin America and the Caribbean                       29
#> 5 Latin America and the Caribbean                       29
#> 6                 Southern Europe                       NA
#>   intermediate_region_name m49_code oecd_member eu_member emu_member eea_member
#> 1                     <NA>       20       FALSE     FALSE      FALSE      FALSE
#> 2                     <NA>      784       FALSE     FALSE      FALSE      FALSE
#> 3                     <NA>        4       FALSE     FALSE      FALSE      FALSE
#> 4                Caribbean       28       FALSE     FALSE      FALSE      FALSE
#> 5                Caribbean      660       FALSE     FALSE      FALSE      FALSE
#> 6                     <NA>        8       FALSE     FALSE      FALSE      FALSE
#>           currency_name currency_code currency_number currency_minor_unit
#> 1                  Euro           EUR             978                   2
#> 2            UAE Dirham           AED             784                   2
#> 3               Afghani           AFN             971                   2
#> 4 East Caribbean Dollar           XCD             951                   2
#> 5 East Caribbean Dollar           XCD             951                   2
#> 6                   Lek           ALL             008                   2
#>           country_name country_number
#> 1              Andorra            020
#> 2 United Arab Emirates            784
#> 3          Afghanistan            004
#> 4  Antigua and Barbuda            028
#> 5             Anguilla            660
#> 6              Albania            008
```
