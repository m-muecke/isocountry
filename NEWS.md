# isocountry (development version)

* All datasets are now plain data frames instead of tibbles, and the package no longer depends on tibble. Use `tibble::as_tibble()` if you prefer tibbles.
* `isocountry`'s `country_code` column (the ISO numeric code) is renamed to `country_number` to match `isocurrency` and `isocurrency_historic`. `country_code` now always means the ISO alpha-2 code.
* `isocurrency` is now built from the official ISO 4217 lists published by SIX instead of iban.com. It gains a `currency_minor_unit` column with the number of decimal places, and `country_name` now matches the names in `isocountry` (e.g. "Bahamas" instead of "Bahamas (the)").
* New `isocurrency_historic` dataset with withdrawn ISO 4217 currency codes, e.g. the national currencies replaced by the euro.
* New `isomic` dataset with ISO 10383 market identifier codes (MICs) for exchanges and other trading venues.

# isocountry 0.8.0

* `isocountry` now uses the ISO 3166-1 name "Naoero" for Nauru (NR).

# isocountry 0.7.0

* Updated the `isocurrency` data to the latest version (2026-08).

# isocountry 0.6.1

* The `isocurrency` data now includes Eswatini (currency code SZL), which was previously dropped due to a country name mismatch (the source still lists it as "Swaziland").

# isocountry 0.6.0

* Updated the `isocurrency` data to the latest version (2026-02).

# isocountry 0.5.0

* Updated the `isocurrency` data to the latest version (2025-07).
* Added OECD, EU, EMU, and EEA membership status to the `isocountry` data (#31).

# isocountry 0.4.0

* Updated the `isocurrency` data to the latest version (2025-06).

# isocountry 0.3.0

* Updated the `isocountry` data to the latest version (2024-11).

# isocountry 0.2.0

* Updated the `isocountry` data to the latest version (2024-04).

# isocountry 0.1.0

* Initial CRAN submission.
