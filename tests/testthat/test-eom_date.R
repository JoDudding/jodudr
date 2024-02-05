test_that("eom_date works first day of month", {
  expect_equal(eom_date(lubridate::ymd('2022-04-01'), 0), lubridate::ymd('2022-04-30'))
})

test_that("eom_date works last day of month", {
  expect_equal(eom_date(lubridate::ymd('2022-04-30'), 0), lubridate::ymd('2022-04-30'))
})

test_that("eom_date works leap year", {
  expect_equal(eom_date(lubridate::ymd('2024-02-29'), 0), lubridate::ymd('2024-02-29'))
})

test_that("eom_date works to go back n months", {
  expect_equal(eom_date(lubridate::ymd('2022-04-19'), 13), lubridate::ymd('2021-03-31'))
})
