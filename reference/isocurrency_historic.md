# Historic ISO currency codes

ISO 4217 currency codes that have been withdrawn (list three), e.g. the
national currencies replaced by the euro. Country names and codes are
taken from
[isocountry](https://m-muecke.github.io/isocountry/reference/isocountry.md)
where the country still exists, otherwise the name is kept as published
and the codes are `NA`.

## Usage

``` r
isocurrency_historic
```

## Format

A data frame with 166 rows and 7 variables:

- currency_name:

  ISO currency name

- currency_code:

  ISO 4217 alphabetic code, e.g. `"AFN"`

- currency_number:

  ISO 4217 numeric code, e.g. `"971"`

- withdrawal_date:

  withdrawal date as published, usually `"YYYY-MM"` but sometimes a
  range such as `"1989 to 1990"`

- country_name:

  country name

- country_code:

  ISO 3166-1 alpha-2 code, e.g. `"AF"`

- country_number:

  ISO 3166-1 numeric code, e.g. `"004"`

## Source

Published free of charge by SIX, the ISO 4217 maintenance agency, at
<https://www.six-group.com/en/products-services/financial-information/data-standards.html>.
ISO permits free use of the ISO 4217 currency codes.

## See also

[isocurrency](https://m-muecke.github.io/isocountry/reference/isocurrency.md)
for current currencies.

## Examples

``` r
head(isocurrency_historic)
#>     currency_name currency_code currency_number withdrawal_date  country_name
#> 1         Afghani           AFA             004         2003-01   Afghanistan
#> 2          Markka           FIM             246         2002-03 Åland Islands
#> 3         Old Lek           ALK             008         1989-12       Albania
#> 4 Andorran Peseta           ADP             020         2003-07       Andorra
#> 5  Spanish Peseta           ESP             724         2002-03       Andorra
#> 6    French Franc           FRF             250         2002-03       Andorra
#>   country_code country_number
#> 1           AF            004
#> 2           AX            248
#> 3           AL            008
#> 4           AD            020
#> 5           AD            020
#> 6           AD            020
```
