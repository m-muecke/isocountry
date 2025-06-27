
<!-- README.md is generated from README.Rmd. Please edit that file -->

# isocountry

<!-- badges: start -->

[![R-CMD-check](https://github.com/m-muecke/isocountry/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/m-muecke/isocountry/actions/workflows/R-CMD-check.yaml)
[![CRAN
status](https://www.r-pkg.org/badges/version/isocountry)](https://CRAN.R-project.org/package=isocountry)
<!-- badges: end -->

This package contains the following datasets:

- `isocountry`: dataset resulting from merging the
  [ISO-3166](https://en.wikipedia.org/wiki/ISO_3166-1) and the [UN
  Region Codes](https://unstats.un.org/unsd/methodology/m49/overview).
- `isocurrency`: [ISO 4217](https://www.iban.com/currency-codes)
  currency codes combined with [ISO
  3166](https://www.iban.com/country-codes) country codes for easy
  joining.

Package is insipred by the
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
  left_join(isocurrency, by = join_by(alpha_2 == country_code))
#> # A tibble: 265 × 19
#>    name       alpha_2 alpha_3 country_code iso_3166_2 is_independent region_code
#>    <chr>      <chr>   <chr>   <chr>        <chr>      <lgl>                <int>
#>  1 Afghanist… AF      AFG     004          ISO 3166-… TRUE                   142
#>  2 Åland Isl… AX      ALA     248          ISO 3166-… FALSE                  150
#>  3 Albania    AL      ALB     008          ISO 3166-… TRUE                   150
#>  4 Algeria    DZ      DZA     012          ISO 3166-… TRUE                     2
#>  5 American … AS      ASM     016          ISO 3166-… FALSE                    9
#>  6 Andorra    AD      AND     020          ISO 3166-… TRUE                   150
#>  7 Angola     AO      AGO     024          ISO 3166-… TRUE                     2
#>  8 Anguilla   AI      AIA     660          ISO 3166-… FALSE                   19
#>  9 Antarctica AQ      ATA     010          ISO 3166-… FALSE                   NA
#> 10 Antigua a… AG      ATG     028          ISO 3166-… TRUE                    19
#> # ℹ 255 more rows
#> # ℹ 12 more variables: region_name <chr>, subregion_code <int>,
#> #   subregion_name <chr>, intermediate_region_code <int>,
#> #   intermediate_region_name <chr>, m49_code <int>, oecd_member <lgl>,
#> #   currency_name <chr>, currency_code <chr>, currency_number <chr>,
#> #   country_name <chr>, country_number <chr>
```
