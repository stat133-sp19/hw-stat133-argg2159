#' @title bin_variable
#' @description creates an object of class binvar. A list with two named elements
#' trials and probability.
#' @param trials number of trials. Must be a positive integer.
#' @param prob probability must be between 0 and 1 inclusive
#' @return a named list containg the two parameters of the binomial random variable
#' @export
#' @examples
#' bin_variable()
#' bin_variable(10, .3)
#' bin_variable(100, .75)
bin_variable <- function(trials = 1, prob = .5){
  check_trials(trials)
  check_prob(prob)
  x <- list(trials = trials, probability = prob)
  class(x) <- "binvar"
  return(x)
}

#' @export
print.binvar <- function(x, ...){
  cat("Binomial Variable\n\n")
  cat("Parameters:\n")
  cat("- number of trials:", x$trials, "\n")
  cat("- probability of success:", x$probability, "\n")
}

#' @export
summary.binvar <- function(x, ...){

}
