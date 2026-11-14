# ISO currency codes

ISO 4217 currency codes (list one) with the number of minor units and
the countries using each currency. Country names and codes are taken
from
[isocountry](https://m-muecke.github.io/isocountry/reference/isocountry.md).

## Usage

``` r
isocurrency
```

## Format

A data frame with 262 rows and 7 variables:

- currency_name:

  ISO currency name

- currency_code:

  ISO currency code

- currency_number:

  ISO currency number

- currency_minor_unit:

  number of digits after the decimal separator

- country_name:

  ISO country name

- country_code:

  ISO alpha-2 country code

- country_number:

  ISO country number

## Source

Published free of charge by SIX, the ISO 4217 maintenance agency, at
<https://www.six-group.com/en/products-services/financial-information/data-standards.html>.
ISO permits free use of the ISO 4217 currency codes.

## See also

[isocurrency_historic](https://m-muecke.github.io/isocountry/reference/isocurrency_historic.md)
for withdrawn currencies.

## Examples

``` r
head(isocurrency)
#>    currency_name currency_code currency_number currency_minor_unit
#> 1        Afghani           AFN             971                   2
#> 2           Euro           EUR             978                   2
#> 3            Lek           ALL             008                   2
#> 4 Algerian Dinar           DZD             012                   2
#> 5      US Dollar           USD             840                   2
#> 6           Euro           EUR             978                   2
#>     country_name country_code country_number
#> 1    Afghanistan           AF            004
#> 2  Åland Islands           AX            248
#> 3        Albania           AL            008
#> 4        Algeria           DZ            012
#> 5 American Samoa           AS            016
#> 6        Andorra           AD            020
```
