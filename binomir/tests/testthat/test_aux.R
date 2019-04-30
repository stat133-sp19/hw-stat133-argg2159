context("test auxilliary private functions")

test_that("aux_mean works",{
  expect_equal(aux_mean(.5,6), 3)
  expect_length(aux_mean(.5,6), 1)
})

test_that("aux_variance works", {
  expect_equal(aux_variance(.5,8), 2)
  expect_length(aux_variance(.5,8), 1)
})

test_that("aux_mode works", {

})

test_that("aux_skewness works", {

})

test_that("aux_kurtosis works", {

})
