#' @title bin_mean
#' @description computes the mean of a given binomial distribution
#' @param trials number of trials. Must be a positive integer
#' @param prob probability of success on each trial. Must be
#' between 0 and 1
#' @return the expected value of the given binomial distribution
#' @export
#' @examples
#' bin_mean()
#' bin_mean(5)
#' bin_mean(100, .3)
bin_mean <- function(trials = 1, prob = .5){
  check_trials(trials)
  check_prob(prob)
  aux_mean(p = prob, trials = trials)
}

#' @title bin_variance
#' @description computes the variance of the given binomial distribution.
#' Variance is a representation of the average spread about the mean.
#' @param trials number of trials. Must be a positive integer.
#' @param prob probability of success on each trial. must be
#' between 0 and 1
#' @return the variance of the binomial distribution
#' @export
#' @examples
#' bin_variance()
#' bin_variance(5)
#' bin_variance(100, .3)
bin_variance <- function(trials = 1, prob = .5){
  check_trials(trials)
  check_prob(prob)
  aux_variance(p = prob, trials = trials)
}

#' @title bin_mode
#' @description computes the most likeley value(s) of the given
#' binomial distribution. i.e. the mode(s) of the distribution.
#' @param trials number of trials. Must be a positive integer.
#' @param prob probability of success in each trial. Must be
#' between 0 and 1
#' @return the mode of the binomial distribution
#' @export
#' @examples
#' bin_mode()
#' bin_mode(5)
#' bin_mode(100, .3)
bin_mode <- function(trials = 1, prob = .5){
  check_trials(trials)
  check_prob(prob)
  aux_mode(p = prob, trials = trials)
}

#' @title bin_skewness
#' @description computes the skewness of the given binomial distribution.
#' skewness is a measure of the assymetry of the distribution about its mean.
#' @param trials number of trials. Must be a positive integer.
#' @param prob probability of success on each trial. Must be between 0 and 1.
#' @return a measure of the skewness of the binomial distribution
#' @export
#' @examples
#' bin_skewness()
#' bin_skewness(5)
#' bin_skewness(100, .3)
bin_skewness <- function(trials = 1, prob = .5){
  check_trials(trials)
  check_prob(prob)
  aux_skewness(p = prob, trials = trials)
}

#' @title bin_kurtosis
#' @description computes the kurtosis of the given binomial distribution.
#' The kurtosis is a descriptor for the "tailness" of a distribution
#' @param trials number of trials. Must be a positive integer.
#' @param prob probability of success on each trial. Must be
#' between 0 and 1.
#' @return a measure of the kurtosis of the given distribution.
#' @export
#' @examples
#' bin_kurtosis()
#' bin_kurtosis(5)
#' bin_kurtosis(100, .3)
bin_kurtosis <- function(trials = 1, prob = .5){
  check_trials(trials)
  check_prob(prob)
  aux_kurtosis(p = prob, trials = trials)
}
