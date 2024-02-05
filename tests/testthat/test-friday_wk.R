test_that("friday_wk works for saturday", {
  expect_equal(lubridate::ymd('2024-02-09'), friday_wk(lubridate::ymd('2024-02-03')))
})

test_that("friday_wk works for sunday", {
  expect_equal(lubridate::ymd('2024-02-09'), friday_wk(lubridate::ymd('2024-02-04')))
})

test_that("friday_wk works for monday", {
  expect_equal(lubridate::ymd('2024-02-09'), friday_wk(lubridate::ymd('2024-02-05')))
})

test_that("friday_wk works for tuesday", {
  expect_equal(lubridate::ymd('2024-02-09'), friday_wk(lubridate::ymd('2024-02-06')))
})

test_that("friday_wk works for wednesday", {
  expect_equal(lubridate::ymd('2024-02-09'), friday_wk(lubridate::ymd('2024-02-07')))
})

test_that("friday_wk works for thursday", {
  expect_equal(lubridate::ymd('2024-02-09'), friday_wk(lubridate::ymd('2024-02-08')))
})

test_that("friday_wk works for friday", {
  expect_equal(lubridate::ymd('2024-02-09'), friday_wk(lubridate::ymd('2024-02-09')))
})

