test_that("datasets are plain data frames", {
  expect_s3_class(isocountry, "data.frame", exact = TRUE)
  expect_s3_class(isocurrency, "data.frame", exact = TRUE)
  expect_s3_class(isocurrency_historic, "data.frame", exact = TRUE)
  expect_s3_class(isomic, "data.frame", exact = TRUE)
})

test_that("isocountry codes are well-formed and unique", {
  expect_match(isocountry$alpha_2, "^[A-Z]{2}$")
  expect_match(isocountry$alpha_3, "^[A-Z]{3}$")
  expect_match(isocountry$country_code, "^[0-9]{3}$")
  expect_identical(anyDuplicated(isocountry$alpha_2), 0L)
  expect_identical(anyDuplicated(isocountry$alpha_3), 0L)
  expect_identical(anyDuplicated(isocountry$country_code), 0L)
  expect_all_true(!is.na(isocountry$name))
})

test_that("Namibia's alpha-2 code isn't read as a missing value", {
  expect_identical(isocountry$alpha_2[isocountry$alpha_3 == "NAM"], "NA")
  expect_contains(isocurrency$country_code, "NA")
})

test_that("isocountry membership flags are consistent", {
  expect_all_true(!is.na(isocountry$is_independent))
  expect_gte(sum(isocountry$oecd_member), 38L)
  expect_gte(sum(isocountry$eu_member), 27L)
  expect_gte(sum(isocountry$emu_member), 20L)
  expect_all_true(isocountry$eu_member[isocountry$emu_member])
  expect_identical(
    isocountry$eea_member,
    isocountry$eu_member | isocountry$alpha_2 %in% c("IS", "LI", "NO")
  )
})

test_that("isocurrency codes are well-formed and match isocountry", {
  expect_match(isocurrency$currency_code, "^[A-Z]{3}$")
  expect_match(isocurrency$currency_number, "^[0-9]{3}$")
  expect_identical(anyDuplicated(isocurrency[c("currency_code", "country_code")]), 0L)
  expect_in(isocurrency$country_code, isocountry$alpha_2)

  idx <- match(isocurrency$country_code, isocountry$alpha_2)
  expect_identical(isocurrency$country_number, isocountry$country_code[idx])
})

test_that("isocurrency minor units are valid", {
  expect_type(isocurrency$currency_minor_unit, "integer")
  expect_in(isocurrency$currency_minor_unit, 0:4)
  expect_identical(unique(isocurrency$currency_minor_unit[isocurrency$currency_code == "JPY"]), 0L)
})

test_that("isocurrency_historic codes are well-formed and match isocountry", {
  expect_match(isocurrency_historic$currency_code, "^[A-Z]{3}$")
  expect_in(na.omit(isocurrency_historic$country_code), isocountry$alpha_2)
  expect_contains(isocurrency_historic$currency_code, c("DEM", "FRF", "ITL"))
  expect_all_true(!is.na(isocurrency_historic$withdrawal_date))
})

test_that("isomic codes are well-formed and match isocountry", {
  expect_match(isomic$mic, "^[A-Z0-9]{4}$")
  expect_identical(anyDuplicated(isomic$mic), 0L)
  expect_in(isomic$operating_mic, isomic$mic)
  expect_in(isomic$type, c("OPRT", "SGMT"))
  expect_in(isomic$status, c("ACTIVE", "UPDATED", "EXPIRED"))
  expect_in(isomic$country_code, c(isocountry$alpha_2, "ZZ"))
  expect_s3_class(isomic$creation_date, "Date")
})
