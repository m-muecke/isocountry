.PHONY: update isocountry isocurrency isomic
.DEFAULT_GOAL := update

update: isocountry isocurrency isomic

isocountry:
	@Rscript data-raw/isocountry.R

isocurrency:
	@Rscript data-raw/isocurrency.R

isomic:
	@Rscript data-raw/isomic.R
