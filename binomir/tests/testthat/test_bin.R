context("test bin_choose")

test_that("bin_choose works", {
  expect_equal(bin_choose(5,1), 5)
  expect_equal(bin_choose(5,3), 10)
  expect_equal(bin_choose(5,1:2), c(5,10))
  expect_length(bin_choose(5,1), 1)
  expect_length(bin_choose(5,1:2), 2)
  expect_error(bin_choose(6,7))
  expect_error(bin_choose(6,c(5,7)))
})

context("test bin_probability")

test_that("bin_probability works", {
  expect_equal(bin_probability(), .5)
  expect_equal(bin_probability(.5, trials = 4, success = 0:1), c(1/16, .25))
  expect_length(bin_probability(success = 0:1), 2)
})

test_that("check functions implemented in bin_probability", {
  expect_error(bin_probability(p = 2))
  expect_error(bin_probability(trials = .1))
  expect_error(bin_probability(trials = 2, success = 3))
  expect_error(bin_probability(trials = 2, success = .5))
  expect_error(bin_probability(trials = 2, success = c(1,3)))
})

context("test bin_distribution")

test_that("bin_distribution works", {
  expect_length(bin_distribution(), 2)
  expect_named(bin_distribution(), c("success", "probability"))
  expect_type(bin_distribution(), "list")
  expect_s3_class(bin_distribution(), c("bindis", "data.frame"))
})

context("test bin_cumulative")

test_that("bin_cumulative works", {
  expect_length(bin_cumulative(), 3)
  expect_named(bin_cumulative(), c("success", "probability", "cumulative"))
  expect_type(bin_cumulative(), "list")
  expect_s3_class(bin_cumulative(), c("bincum", "data.frame"))
})
