# ISO currency codes

ISO 4217 currency codes with full country names.

## Usage

``` r
isocurrency
```

## Format

A data frame with 261 rows and 6 variables:

- currency_name:

  ISO currency name

- currency_code:

  ISO currency code

- currency_number:

  ISO currency number

- country_name:

  ISO country name

- country_code:

  ISO alpha-2 country code

- country_number:

  ISO country number

## Source

<https://www.iban.com/currency-codes>

## Examples

``` r
isocurrency
#> # A tibble: 261 × 6
#>    currency_name         currency_code currency_number country_name country_code
#>    <chr>                 <chr>         <chr>           <chr>        <chr>       
#>  1 Afghani               AFN           971             Afghanistan  AF          
#>  2 Euro                  EUR           978             Åland Islan… AX          
#>  3 Lek                   ALL           008             Albania      AL          
#>  4 Algerian Dinar        DZD           012             Algeria      DZ          
#>  5 US Dollar             USD           840             American Sa… AS          
#>  6 Euro                  EUR           978             Andorra      AD          
#>  7 Kwanza                AOA           973             Angola       AO          
#>  8 East Caribbean Dollar XCD           951             Anguilla     AI          
#>  9 East Caribbean Dollar XCD           951             Antigua and… AG          
#> 10 Argentine Peso        ARS           032             Argentina    AR          
#> # ℹ 251 more rows
#> # ℹ 1 more variable: country_number <chr>
```
