# ISO market identifier codes

ISO 10383 market identifier codes (MICs) for exchanges, trading
platforms, and other trading venues, as published by the ISO 20022
registration authority. Includes active, updated, and expired codes.

## Usage

``` r
isomic
```

## Format

A tibble with 2893 rows and 17 variables:

- mic:

  market identifier code

- operating_mic:

  MIC of the operating entity the market belongs to

- type:

  `"OPRT"` for an operating MIC, `"SGMT"` for a market segment MIC

- market_name:

  market name or institution description

- legal_entity_name:

  legal name of the entity operating the market

- lei:

  legal entity identifier (ISO 17442)

- market_category_code:

  market category code, e.g. `"RMKT"` for regulated market

- acronym:

  market acronym

- country_code:

  ISO alpha-2 country code, `"ZZ"` for codes not tied to a country

- city:

  city

- website:

  website

- status:

  `"ACTIVE"`, `"UPDATED"`, or `"EXPIRED"`

- creation_date:

  date the MIC was created

- last_update_date:

  date of the last update

- last_validation_date:

  date of the last validation

- expiry_date:

  date the MIC expired

- comments:

  comments

## Source

<https://www.iso20022.org/market-identifier-codes>

## Examples

``` r
isomic
#> # A tibble: 2,893 × 17
#>    mic   operating_mic type  market_name                 legal_entity_name lei  
#>    <chr> <chr>         <chr> <chr>                       <chr>             <chr>
#>  1 21XX  21XX          OPRT  21X                         21X AG            5299…
#>  2 24DX  24EQ          SGMT  24X NATIONAL EXCHANGE - DA… 24X NATIONAL EXC… 9845…
#>  3 24EQ  24EQ          OPRT  24X NATIONAL EXCHANGE LLC   24X NATIONAL EXC… 9845…
#>  4 24EX  24EX          OPRT  24 EXCHANGE                 24X BERMUDA LIMI… 2138…
#>  5 3579  3579          OPRT  SSY FUTURES LTD - FREIGHT … NA                2138…
#>  6 360D  360X          SGMT  360X DLT - MTF              360X AG           5299…
#>  7 360M  360X          SGMT  360X MTF                    360X AG           5299…
#>  8 360T  360T          OPRT  360T                        360 TREASURY SYS… 5299…
#>  9 360X  360X          OPRT  360X                        360X AG           5299…
#> 10 3DXE  360T          SGMT  3DX                         360 TREASURY SYS… 5299…
#> # ℹ 2,883 more rows
#> # ℹ 11 more variables: market_category_code <chr>, acronym <chr>,
#> #   country_code <chr>, city <chr>, website <chr>, status <chr>,
#> #   creation_date <date>, last_update_date <date>, last_validation_date <date>,
#> #   expiry_date <date>, comments <chr>
```
