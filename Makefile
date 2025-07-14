.PHONY: update

update:
	@Rscript data-raw/isocountry.R
	@Rscript data-raw/isocurrency.R
