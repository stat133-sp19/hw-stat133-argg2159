#' @title bin_probability
#' @description computes the probability density for a given
#' number of trials and successes, and a given probability.
#' @param trials (integer) number of trials. default 1
#' @param success (integer) number of desired successes, must be less than n
#' default 1
#' @param p (real) probability, 0 <= p <= 1. default .5
#' @return the computed density of the binomial distribution for k
#' @export
#' @examples
#' bin_probability(2, 5, .5)
#' bin_probability(success = 0:2, trials = 5, p = .45)
bin_probability <- function(p = .5, trials = 1, success = 1){
  check_prob(p)
  check_trials(trials)
  check_success(trials, success)
  x <- bin_choose(n = trials, k = success)*(p^success)*((1 -p)^(trials - success))
  return(x)
}
