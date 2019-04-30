#' @title bin_variable
#' @description creates an object of class binvar. A vector with names
#' trials and probability.
#' @param trials number of trials
#' @param prob probability must be between 0 and 1 inclusive
#' @return a named containg the two parameters of the binomial random variable
#' @export
#' @examples
#' bin_variable()
#' bin_variable(10, .3)
#' bin_variable(100, .75)
bin_variable <- function(trials = 1, prob = .5){
  x <- c(trials = trials, probability = prob)
  class(x) <- "binvar"
  return(x)
}
