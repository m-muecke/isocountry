# Country names with ISO country codes

ISO 3166-1 country codes with full country names, UN regional
classifications, OECD membership status, EU membership status, Economic
and Monetary Union (EMU) membership status, and European Economic Area
(EEA) membership status.

## Usage

``` r
isocountry
```

## Format

A data frame with 249 rows and 17 variables:

- name:

  country name

- alpha_2:

  ISO alpha-2 code

- alpha_3:

  ISO alpha-3 code

- country_code:

  numeric code

- iso_3166_2:

  ISO 3166-2 subdivision code

- is_independent:

  is the country independent

- region_code:

  UN region code

- region_name:

  UN region name

- subregion_code:

  UN subregion code

- subregion_name:

  UN subregion name

- intermediate_region_code:

  UN intermediate region code

- intermediate_region_name:

  UN intermediate region name

- m49_code:

  UN M49 code

- oecd_member:

  is the country an OECD member

- eu_member:

  is the country an EU member

- emu_member:

  is the country an EMU member

- eea_member:

  is the country an EEA member

## Source

- <https://en.wikipedia.org/wiki/ISO_3166-1>

- <https://unstats.un.org/unsd/methodology/m49/overview>

- <https://en.wikipedia.org/wiki/OECD>

- <https://en.wikipedia.org/wiki/Member_state_of_the_European_Union>

- <https://en.wikipedia.org/wiki/Economic_and_Monetary_Union_of_the_European_Union>

- <https://en.wikipedia.org/wiki/European_Economic_Area>

## Examples

``` r
isocountry
#> # A tibble: 249 × 17
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
#> # ℹ 239 more rows
#> # ℹ 10 more variables: region_name <chr>, subregion_code <int>,
#> #   subregion_name <chr>, intermediate_region_code <int>,
#> #   intermediate_region_name <chr>, m49_code <int>, oecd_member <lgl>,
#> #   eu_member <lgl>, emu_member <lgl>, eea_member <lgl>
```
