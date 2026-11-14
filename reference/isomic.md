# ISO market identifier codes

ISO 10383 market identifier codes (MICs) for exchanges, trading
platforms, and other trading venues, as published by the ISO 20022
registration authority. Includes active, updated, and expired codes.

## Usage

``` r
isomic
```

## Format

A data frame with 2893 rows and 17 variables:

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
head(isomic)
#>    mic operating_mic type                      market_name
#> 1 21XX          21XX OPRT                              21X
#> 2 24DX          24EQ SGMT     24X NATIONAL EXCHANGE - DARK
#> 3 24EQ          24EQ OPRT        24X NATIONAL EXCHANGE LLC
#> 4 24EX          24EX OPRT                      24 EXCHANGE
#> 5 3579          3579 OPRT SSY FUTURES LTD - FREIGHT SCREEN
#> 6 360D          360X SGMT                   360X DLT - MTF
#>           legal_entity_name                  lei market_category_code acronym
#> 1                    21X AG 529900WC0LESEODR7A83                 OTHR     21X
#> 2 24X NATIONAL EXCHANGE LLC 9845009C7E1A2E69J029                 RMKT    24EX
#> 3 24X NATIONAL EXCHANGE LLC 9845009C7E1A2E69J029                 RMKT    <NA>
#> 4       24X BERMUDA LIMITED 213800YXBUZH7G3NDC51                 NSPD    24EX
#> 5                      <NA> 213800RGYOAL3KL2XL02                 NSPD    <NA>
#> 6                   360X AG 529900M42L36KXZ1JD69                 MLTF    <NA>
#>   country_code      city                 website status creation_date
#> 1           DE FRANKFURT              WWW.21X.EU ACTIVE    2024-05-27
#> 2           US  STAMFORD      WWW.24EXCHANGE.NET ACTIVE    2025-10-27
#> 3           US  STAMFORD HTTPS://24EXCHANGE.COM/ ACTIVE    2025-04-28
#> 4           BM   BERMUDA      WWW.24EXCHANGE.NET ACTIVE    2019-09-23
#> 5           GB    LONDON       WWW.SSYONLINE.COM ACTIVE    2017-07-24
#> 6           DE FRANKFURT            WWW.360X.COM ACTIVE    2025-04-28
#>   last_update_date last_validation_date expiry_date
#> 1       2024-05-27           2024-05-27        <NA>
#> 2       2025-10-27           2025-10-27        <NA>
#> 3       2025-04-28           2025-04-28        <NA>
#> 4       2025-10-27                 <NA>        <NA>
#> 5       2017-07-24                 <NA>        <NA>
#> 6       2025-04-28           2025-04-28        <NA>
#>                                               comments
#> 1                                                 <NA>
#> 2                                                 <NA>
#> 3                                                 <NA>
#> 4                       FOREIGN EXCHANGE AND EQUITIES.
#> 5 TRADING SCREEN FOR FORWARD FREIGHT AGREEMENTS (FFA).
#> 6                                                 <NA>
```
