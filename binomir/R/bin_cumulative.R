#' @title bin_cumulative
#' @description computes and tabulates the cumulative density for the given
#' binomial distribution. Also gives the density.
#' @param trials (integer) the total number of trials
#' @param prob (numeric) the probability of success on each trial. Must be between
#' 0 and 1 inclusive.
#' @return a data frame of class c("bincum", "data.frame") containing three columns:
#' success, probability, cumulative.
#' @export
#' @examples
#' bin_cumulative()
#' bin_distribution(trails = 2, prob = .1)
#' bin_distribution(trials = 6, prob = .3)
bin_cumulative <- function(trials = 2, prob = .5){
  x <- bin_distribution(trials = trials, prob = prob)
  df <- data.frame(x,
                   cumulative = cumsum(x$probability)
                   )
  class(df) <- c("bincum", "data.frame")
  return(df)
}

#' @export
plot.bincum <- function(x, ...){
  ggplot2::ggplot(x, ggplot2::aes(x = success, y = cumulative)) +
    ggplot2::geom_point() +
    ggplot2::theme_classic()
}
