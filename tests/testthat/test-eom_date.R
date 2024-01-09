test_that("eom_date works", {
  expect_equal(eom_date(lubridate::ymd('2022-04-19'), 13), lubridate::ymd('2021-03-31'))
})
