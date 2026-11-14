.PHONY: update isocountry isocurrency
.DEFAULT_GOAL := update

update: isocountry isocurrency

isocountry:
	@Rscript data-raw/isocountry.R

isocurrency:
	@Rscript data-raw/isocurrency.R
