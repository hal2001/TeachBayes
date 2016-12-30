## ----global_options, include=FALSE---------------------------------------
knitr::opts_chunk$set(fig.width=6, 
                      fig.height=4, fig.path='Figs/',
                      echo=TRUE, warning=FALSE, message=FALSE)

## ------------------------------------------------------------------------
library(TeachBayes)

## ------------------------------------------------------------------------
sp_regions <- c(2, 1, 1, 2)

## ------------------------------------------------------------------------
spinner_plot(sp_regions)

## ------------------------------------------------------------------------
spinner_probs(sp_regions)

## ------------------------------------------------------------------------
spinner_data(sp_regions, nsim=20)

## ------------------------------------------------------------------------
sp1 <- c(1, 1, 1)
sp2 <- c(1, 2, 2, 1)
sp3 <- c(1, 1, 1, 1)
sp4 <- c(2, 2, 3, 3, 4)

## ------------------------------------------------------------------------
many_spinner_plots(list(sp1, sp2, sp3, sp4))

## ------------------------------------------------------------------------
(LIKE <- spinner_likelihoods(list(sp1, sp2, sp3, sp4)))

## ------------------------------------------------------------------------
dspinner(c(1, 3, 4, 1, 2), LIKE)

## ------------------------------------------------------------------------
bayes_df <- data.frame(Model=paste("Spinner", 1:4),
                       Prior=rep(1/4, 4), 
                       Likelihood=dspinner(c(1, 2, 1), LIKE))
(bayes_df <- bayesian_crank(bayes_df))

## ------------------------------------------------------------------------
prior_post_plot(bayes_df)

## ------------------------------------------------------------------------
beta_draw(c(10, 5))

## ------------------------------------------------------------------------
beta_area(.4, .6, c(10, 5))

## ------------------------------------------------------------------------
beta_quantile(.7, c(10, 5))

## ------------------------------------------------------------------------
beta_interval(.8, c(10, 5))

## ------------------------------------------------------------------------
beta_data(c(10, 5), nsim=20)

## ------------------------------------------------------------------------
beta_prior_post(c(4, 4), c(20, 10))

## ------------------------------------------------------------------------
bar_plot(spinner_data(c(1, 2, 3)))

## ------------------------------------------------------------------------
prob_plot(data.frame(x=1:5, prob=c(.2, .3, .4, .1, .1)))
