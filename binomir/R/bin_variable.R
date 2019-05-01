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
  invisible(x)
}

#' @export
summary.binvar <- function(x, ...){
  prob <- x$probability
  trials <- x$trials
  y <- list(trials = trials,
            probability = prob,
            mean = aux_mean(p = prob, trials = trials),
            variance = aux_variance(p = prob, trials = trials),
            mode = aux_mode(p = prob, trials = trials),
            skewness = aux_skewness(p = prob, trials = trials),
            kurtosis = aux_kurtosis(p = prob, trials = trials)
            )
  class(y) <- "summary.binvar"
  return(y)
}

#' @export
print.summary.binvar <- function(x, ...){
  cat("Summary Binomial\n\n")
  cat("Parameters:\n")
  cat("- number of trials      :", x$trials, "\n")
  cat("- probability of success:", x$probability, "\n\n")
  cat("Measures:\n")
  cat("- mean    :", x$mean, "\n")
  cat("- variance:", x$variance, "\n")
  cat("- mode(s) :", x$mode, "\n")
  cat("- skewness:", x$skewness, "\n")
  cat("- kurtosis:", x$kurtosis, "\n")
  invisible(x)
}
