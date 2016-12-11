## ----global_options, include=FALSE---------------------------------------
knitr::opts_chunk$set(fig.width=12, fig.height=8, fig.path='Figs/',
                      echo=TRUE, warning=FALSE, message=FALSE)

## ------------------------------------------------------------------------
s_reg_A <- c(2, 2, 2, 2)
s_reg_B <- c(4, 1, 1, 2)
s_reg_C <- c(2, 4, 2)
s_reg_D <- c(1, 3, 3, 1)

## ------------------------------------------------------------------------
library(TeachBayes)
library(gridExtra)
p1 <- spinner_plot(s_reg_A, "Spinner A")
p2 <- spinner_plot(s_reg_B, "Spinner B")
p3 <- spinner_plot(s_reg_C, "Spinner C")
p4 <- spinner_plot(s_reg_D, "Spinner D")
grid.arrange(p1, p2, p3, p4, nrow=2, ncol=2)

## ------------------------------------------------------------------------
(Prob <- spinner_likelihoods(list(s_reg_A, s_reg_B, s_reg_C, s_reg_D)))

## ------------------------------------------------------------------------
(spins <- spinner_data(s_reg_B, nsim=10))

## ------------------------------------------------------------------------
likelihoods <- dspinner(spins, Prob)

## ------------------------------------------------------------------------
models <- c("Spinner A", "Spinner B", "Spinner C", "Spinner D")
prior <- rep(1/4, 4)
bayes_table <- data.frame(Model=models,
                          Prior=prior,
                          Likelihood=likelihoods)
(bayesian_crank(bayes_table) -> bayes_table)

## ------------------------------------------------------------------------
prior_post_plot(bayes_table)
