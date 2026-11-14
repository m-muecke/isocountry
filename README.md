
<!-- README.md is generated from README.Rmd. Please edit that file -->

# isocountry

<!-- badges: start -->

[![R-CMD-check](https://github.com/m-muecke/isocountry/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/m-muecke/isocountry/actions/workflows/R-CMD-check.yaml)
[![CRAN
status](https://www.r-pkg.org/badges/version/isocountry)](https://CRAN.R-project.org/package=isocountry)
[![R-universe
version](https://m-muecke.r-universe.dev/isocountry/badges/version)](https://m-muecke.r-universe.dev/isocountry)
<!-- badges: end -->

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
library(dplyr)
library(isocountry)

isocountry |>
  left_join(isocurrency, by = join_by(alpha_2 == country_code)) |>
  head()
#>             name alpha_2 alpha_3 country_code    iso_3166_2 is_independent
#> 1    Afghanistan      AF     AFG          004 ISO 3166-2:AF           TRUE
#> 2  Åland Islands      AX     ALA          248 ISO 3166-2:AX          FALSE
#> 3        Albania      AL     ALB          008 ISO 3166-2:AL           TRUE
#> 4        Algeria      DZ     DZA          012 ISO 3166-2:DZ           TRUE
#> 5 American Samoa      AS     ASM          016 ISO 3166-2:AS          FALSE
#> 6        Andorra      AD     AND          020 ISO 3166-2:AD           TRUE
#>   region_code region_name subregion_code  subregion_name
#> 1         142        Asia             34   Southern Asia
#> 2         150      Europe            154 Northern Europe
#> 3         150      Europe             39 Southern Europe
#> 4           2      Africa             15 Northern Africa
#> 5           9     Oceania             61       Polynesia
#> 6         150      Europe             39 Southern Europe
#>   intermediate_region_code intermediate_region_name m49_code oecd_member
#> 1                       NA                     <NA>        4       FALSE
#> 2                       NA                     <NA>      248       FALSE
#> 3                       NA                     <NA>        8       FALSE
#> 4                       NA                     <NA>       12       FALSE
#> 5                       NA                     <NA>       16       FALSE
#> 6                       NA                     <NA>       20       FALSE
#>   eu_member emu_member eea_member  currency_name currency_code currency_number
#> 1     FALSE      FALSE      FALSE        Afghani           AFN             971
#> 2     FALSE      FALSE      FALSE           Euro           EUR             978
#> 3     FALSE      FALSE      FALSE            Lek           ALL             008
#> 4     FALSE      FALSE      FALSE Algerian Dinar           DZD             012
#> 5     FALSE      FALSE      FALSE      US Dollar           USD             840
#> 6     FALSE      FALSE      FALSE           Euro           EUR             978
#>   currency_minor_unit   country_name country_number
#> 1                   2    Afghanistan            004
#> 2                   2  Åland Islands            248
#> 3                   2        Albania            008
#> 4                   2        Algeria            012
#> 5                   2 American Samoa            016
#> 6                   2        Andorra            020
```
