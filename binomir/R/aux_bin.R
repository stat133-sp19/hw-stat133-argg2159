#aux_mean:
#
#computes the mean of a binomial
#with given number of trials and
#probability
#
aux_mean <- function(p = .5, trials = 1){
  x <- trials*p
  return(x)
}

#aux_variance:
#
#computes the variance of a
#binomial with the given number
#of trials and probability
#
aux_variance <- function(p = .5, trials = 1){
  x <- trials*p*(1 - p)
  return(x)
}

#aux_mode:
#
#computes the mode of a binomial
#with the given number of trials
#and probability
#
aux_mode <- function(p = .5, trials = 1){
  m <- (trials + 1)*p
  if (p == 0){
    return(1)
  } else if (p == 1){
    return(trials)
  } else if (m == as.integer(m)){
    x <- c(m - 1, m)
    return(x)
  } else {
    x <- floor(m)
    return(x)
  }
}

#aux_skewness:
#
#computes the skewness of
#a binomial with the given
#probability and trials.
#
aux_skewness <- function(p = .5, trials = 1){
  x <- (1 - 2*p)/sqrt(trials*p*(1 - p))
  return(x)
}

#aux_kurtosis:
#
#computes the kurtosis of
#a binomial with the given
#probability and trials
#
aux_kurtosis <- function(p = .5, trials = 1){
  x <- (1 - 6*p*(1  - p))/(trials*p*(1 - p))
  return(x)
}
