testing_prior <- function(lo=.1, hi=.9, np=9, pequal=0.5){
  p1 <- seq(lo, hi, length = np)
  p2 <- p1
  n_diagonal <- np
  n_off_diag <- np ^ 2 - np
  prior <- matrix(0, np, np) + (1 - pequal) / n_off_diag
  diag(prior) <-  pequal / np
  dimnames(prior)[[1]] <- p1
  dimnames(prior)[[2]] <- p2
  prior
}