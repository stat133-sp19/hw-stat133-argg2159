#' @title bin_choose
#' @description computes the choose factor of the binomial probability density
#' @param n positive integer
#' @param k positive integer less than or equal to n
#' @return n choose k
#' @export
#' @examples
#' bin_choose(5,3)
#' bin_choose(6,1)
#' bin_choose(6,1:3)
bin_choose <- function(n = 1, k = 1){
  if (any(k > n)){
    stop("k must be at most n")
  }
  x <- factorial(n)/(factorial(k)*factorial(n - k))
  return(x)
}
