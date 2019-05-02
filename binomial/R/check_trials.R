#check_trials:
#
#tests if the input is a valid number
#of trials for the binomial distribution
#returns an error if input is invalid and
#TRUE otherwise.
#
check_trials <- function(trials = 1){
  if (length(trials) != 1){
    stop("trials must be of length 1")
  }else if(trials != as.integer(trials)){
    stop("trials must be an integer")
  }else if(trials <= 0){
    stop("trials must be positive")
  }else {
    return(TRUE)
  }
}
