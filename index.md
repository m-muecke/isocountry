# isocountry

isocountry provides ISO country, currency, and market identifier codes
as plain data frames, with no dependencies.

## Datasets

- `isocountry`: [ISO 3166-1](https://en.wikipedia.org/wiki/ISO_3166-1)
  country codes with [UN
  M49](https://unstats.un.org/unsd/methodology/m49/overview) regions and
  membership in the OECD, the European Union (EU), the euro area (EMU),
  and the European Economic Area (EEA).
- `isocurrency`: [ISO
  4217](https://www.six-group.com/en/products-services/financial-information/data-standards.html)
  currency codes with minor units and the countries using each currency.
- `isocurrency_historic`: withdrawn ISO 4217 currency codes, e.g. the
  national currencies replaced by the euro.
- `isomic`: [ISO
  10383](https://www.iso20022.org/market-identifier-codes) market
  identifier codes (MICs) for exchanges and other trading venues.

Across the datasets, `country_code` is the ISO 3166-1 alpha-2 code
(`alpha_2` in `isocountry`) and `country_number` is the numeric code, so
the datasets join easily. Use
[`tibble::as_tibble()`](https://tibble.tidyverse.org/reference/as_tibble.html)
or `data.table::as.data.table()` if you prefer tibbles or data.tables.

## Installation

You can install the released version of isocountry from
[CRAN](https://CRAN.R-project.org) with:

``` r

install.packages("isocountry")
```

And the development version from
[GitHub](https://github.com/m-muecke/isocountry) with:

``` r

# install.packages("pak")
pak::pak("m-muecke/isocountry")
```

## Usage

``` r

library(isocountry)
```

Look up a country:

``` r

subset(
  isocountry,
  alpha_2 == "DE",
  c(name, alpha_3, country_number, region_name, eu_member, emu_member)
)
#>       name alpha_3 country_number region_name eu_member emu_member
#> 84 Germany     DEU            276      Europe      TRUE       TRUE
```

List the euro area members:

``` r

isocountry$name[isocountry$emu_member]
#>  [1] "Austria"                     "Belgium"                    
#>  [3] "Bulgaria"                    "Croatia"                    
#>  [5] "Cyprus"                      "Estonia"                    
#>  [7] "Finland"                     "France"                     
#>  [9] "Germany"                     "Greece"                     
#> [11] "Ireland"                     "Italy"                      
#> [13] "Latvia"                      "Lithuania"                  
#> [15] "Luxembourg"                  "Malta"                      
#> [17] "Netherlands, Kingdom of the" "Portugal"                   
#> [19] "Slovakia"                    "Slovenia"                   
#> [21] "Spain"
```

Find the countries using a currency:

``` r

subset(isocurrency, currency_code == "CHF", c(country_name, country_code))
#>      country_name country_code
#> 135 Liechtenstein           LI
#> 223   Switzerland           CH
```

Look up exchanges by their MIC:

``` r

subset(isomic, mic %in% c("XNYS", "XLON", "XETR"), c(mic, market_name, country_code))
#>       mic                   market_name country_code
#> 2433 XETR                         XETRA           DE
#> 2577 XLON         LONDON STOCK EXCHANGE           GB
#> 2673 XNYS NEW YORK STOCK EXCHANGE, INC.           US
```

Add the currencies to the countries:

``` r

countries <- merge(
  isocountry[c("alpha_2", "name", "region_name")],
  isocurrency[c("country_code", "currency_code", "currency_name")],
  by.x = "alpha_2",
  by.y = "country_code"
)
head(countries)
#>   alpha_2                 name region_name currency_code         currency_name
#> 1      AD              Andorra      Europe           EUR                  Euro
#> 2      AE United Arab Emirates        Asia           AED            UAE Dirham
#> 3      AF          Afghanistan        Asia           AFN               Afghani
#> 4      AG  Antigua and Barbuda    Americas           XCD East Caribbean Dollar
#> 5      AI             Anguilla    Americas           XCD East Caribbean Dollar
#> 6      AL              Albania      Europe           ALL                   Lek
```

## Data sources

| Dataset | Source |
|----|----|
| `isocountry` | ISO 3166-1 codes and OECD and EU membership from Wikipedia, regions from the [UN Statistics Division](https://unstats.un.org/unsd/methodology/m49/overview) |
| `isocurrency`, `isocurrency_historic` | ISO 4217 lists one and three, published by [SIX](https://www.six-group.com/en/products-services/financial-information/data-standards.html) as the ISO 4217 maintenance agency |
| `isomic` | ISO 10383 list, published by the [ISO 10383 registration authority](https://www.iso20022.org/market-identifier-codes) |

The data in the development version is refreshed monthly. The package
code is MIT licensed, and the bundled data remains subject to the terms
of its sources.

isocountry is inspired by the
[ISO-3166-Countries-with-Regional-Codes](https://github.com/lukes/ISO-3166-Countries-with-Regional-Codes)
project.
