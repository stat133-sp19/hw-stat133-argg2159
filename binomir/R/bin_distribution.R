#' @title bin_distribution
#' @description Computes the probability distribution of a binomial with a given
#' number of trials and probability. It tabulates the probability of each number of
#' successes.
#' @param trials (integer) the number of trials. Must be a positive integer
#' @param prob (real) the probability of success on each trial. Must be between 0 and 1.
#' @return a data frame of class c("bindis", "dataframe") containing the probability distribution
#' @export
#' @examples
#' bin_distribution()
#' bin_distribution(trails = 2, prob = .1)
#' bin_distribution(trials = 6, prob = .3)
bin_distribution <- function(trials = 2, prob = .5){
  df <- data.frame(success = as.integer(0:trials),
                   probability = bin_probability(p = prob,
                                                 trials = trials,
                                                 success = 0:trials
                                                 )
  )
  class(df) <- c("bindis", "data.frame")
  return(df)
}


#' @export
plot.bindis <- function(x, ...){
  ggplot2::ggplot(x, ggplot2::aes(x = success, y = probability)) +
    ggplot2::geom_col() +
    ggplot2::theme_classic() +
    ggplot2::labs(x = "Successes", y = "Probability")
}

