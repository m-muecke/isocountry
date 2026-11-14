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

`emu_member` is derived from the currency of each EU member state, and
`eea_member` from EU membership plus Iceland, Liechtenstein, and Norway.
See
<https://en.wikipedia.org/wiki/Economic_and_Monetary_Union_of_the_European_Union>
and <https://en.wikipedia.org/wiki/European_Economic_Area> for the
definitions.

## Examples

``` r
head(isocountry)
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
#>   eu_member emu_member eea_member
#> 1     FALSE      FALSE      FALSE
#> 2     FALSE      FALSE      FALSE
#> 3     FALSE      FALSE      FALSE
#> 4     FALSE      FALSE      FALSE
#> 5     FALSE      FALSE      FALSE
#> 6     FALSE      FALSE      FALSE
```
