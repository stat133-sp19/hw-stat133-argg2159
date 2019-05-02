#check_success:
#
#checks if the inputted number of successes
#is valid for the specified number of trials
#stops if input is invalid and returns TRUE
#otherwise.
#
check_success <- function(trials = 1, success = 1){
  x <- (trials < success)
  y <- success != as.integer(success)
  z <- (success < 0)
  if (any(x)){
    stop("all number of successes should be less than the number of trials")
  } else if(any(y)){
    stop("all number of successes must be integers")
  } else if(any(z)){
    stop("all number of successes should be non negative")
  } else {
    return(TRUE)
  }
}
