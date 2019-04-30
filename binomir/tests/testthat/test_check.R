context("test checker functions")

test_that("check_prob works", {
  expect_equal(check_prob(1), TRUE)
  expect_equal(check_prob(0), TRUE)
  expect_equal(check_prob(.5), TRUE)
  expect_length(check_prob(.5), 1)
  expect_error(check_prob(2))
  expect_error(check_prob(-1))
  expect_error(check_prob(c(.1,.5)))
})

test_that("check_trials works", {
  expect_equal(check_trials(4), TRUE)
  expect_equal(check_trials(1), TRUE)
  expect_length(check_trials(4), 1)
  expect_error(check_trials(0))
  expect_error(check_trials(-1))
  expect_error(check_trials(c(1,4)))
})

test_that("testing check_success works" ,{
  expect_equal(check_success(1, 1), TRUE)
  expect_equal(check_success(4), TRUE)
  expect_equal(check_success(4,1:4), TRUE)
  expect_length(check_success(4,1:4), 1)
  expect_error(check_success(0))
  expect_error(check_success(1,-1))
  expect_error(check_prob(c(1,.5)))
})
