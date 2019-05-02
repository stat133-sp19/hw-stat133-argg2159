#' @title bin_probability
#' @description computes the probability density for a given
#' number of trials and successes, and a given probability.
#' @param trials (integer) number of trials. Must be a positive integer
#' @param success (integer) number of desired successes, must be less than n
#' default 1
#' @param prob (real) probability, 0 <= p <= 1. default .5
#' @return the computed density of the binomial distribution for k
#' @export
#' @examples
#' bin_probability(2, 5, .5)
#' bin_probability(success = 0:2, trials = 5, prob = .45)
bin_probability <- function(prob = .5, trials = 1, success = 1){
  check_prob(prob)
  check_trials(trials)
  check_success(trials, success)
  x <- bin_choose(n = trials, k = success)*(prob^success)*((1 -prob)^(trials - success))
  return(x)
}
