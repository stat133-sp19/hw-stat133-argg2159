context("test auxilliary private functions")

test_that("aux_mean works",{
  expect_equal(aux_mean(.5,6), 3)
  expect_length(aux_mean(.5,6), 1)
  expect_type(aux_mean(), "double")
})

test_that("aux_variance works", {
  expect_equal(aux_variance(.5,8), 2)
  expect_length(aux_variance(.5,8), 1)
  expect_type(aux_variance(), "double")
})

test_that("aux_mode works", {
  expect_type(aux_mode(), "double")
  expect_length(aux_mode(), 2)
  expect_equal(aux_mode(.3, 10), 3)
  expect_length(aux_mode(.5,10), 1)
})

test_that("aux_skewness works", {
  expect_type(aux_skewness(), "double")
  expect_length(aux_skewness(), 1)
  expect_equivalent(aux_skewness(.5, 4), 0)
})

test_that("aux_kurtosis works", {
  expect_type(aux_kurtosis(), "double")
  expect_length(aux_kurtosis(), 1)
  expect_equivalent(aux_kurtosis(.5, 4), -.5)
})
