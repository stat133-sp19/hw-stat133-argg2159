#check_prob:
#
#determines if the input is a valid probability
#and stops if the input is not
#
check_prob <- function(prob = .5){
  if (length(prob) != 1){
    stop("prob must be of length 1")
  } else if(prob > 1 | prob < 0){
    stop("prob is not a valid probability")
  } else {
    return(TRUE)
  }
}
