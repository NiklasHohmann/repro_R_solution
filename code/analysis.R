# this code performs only the analyses, plotting is in a separate file for simplicity

# styled using the `styler` package (https://www.tidyverse.org/blog/2017/12/styler-1.0.0/)
# using tidyverse style

# load basic packages - could also be resolved by directly accessing their namespace via
# admtools::function_name

# note that there are no commands
# install.package("package_name")
# because the renv package takes care of installation
library(admtools)
library(StratPal)

# constants
# set seed for reproducibility
set.seed(42)
n_rep <- 10000 # no of bootstrap repetitions - removed magic numbers from analysis
# allows to easily & globally modify bootstrap settings

# read data
data <- read.csv("data/raw/dummy_data.csv") # read data from "raw" folder
# indicates that this file should not be overwritten
# file location is given relative to the location of the Rproj file ('solution.Rproj')

## helper functions
# introducted for simplicity and reusability
bootstrap_mean <- function(x, rep) {
  #' docstrings based on the roxygen2 package: https://roxygen2.r-lib.org/
  #' @description bootstraps mean values from a sample
  #' @param x sample
  #' @param rep no of bootstrap repetitions
  y <- rep(NA, rep) # initialize storage
  for (i in seq_len(rep)) {
    sam <- sample(x, replace = TRUE)
    y[i] <- mean(sam)
  }
  return(y)
}

bootstrap_sd <- function(x, rep) {
  #' @description bootstraps standard deviation values from a sample
  #' @param x sample
  #' @param rep no of bootstrap repetitions
  y <- rep(NA, rep)
  for (i in seq_len(rep)) {
    sam <- sample(x, replace = TRUE)
    y[i] <- sd(sam)
  }
  return(y)
}

conf_interval <- function(x) {
  #' @description determines 95 % confidence interval from bootstrap samples
  #' @param x bootstrap sample
  low_bound <- quantile(x, 0.025)
  up_bound <- quantile(x, 0.975)
  interval <- c(low_bound, up_bound)
  return(interval)
}

# bootstrap means from sample
# usage for the defined functions makes code more robust and is more explicit about the intentions
x1_bs_mean <- bootstrap_mean(
  x = data$x1,
  rep = n_rep
)
x2_bs_mean <- bootstrap_mean(
  x = data$x2,
  rep = n_rep
)
x3_bs_mean <- bootstrap_mean(
  x = data$x3,
  rep = n_rep
)
# determine and store confidence intervals
# store in aptly named variable
conf_intervals_mean <- list(
  "x1" = conf_interval(x1_bs_mean),
  "x2" = conf_interval(x2_bs_mean),
  "x3" = conf_interval(x3_bs_mean)
)

## bootstrap standard deviation from samples
x1_bs_sd <- bootstrap_sd(
  x = data$x1,
  rep = n_rep
)
x2_bs_sd <- bootstrap_sd(
  x = data$x2,
  rep = n_rep
)
x3_bs_sd <- bootstrap_sd(
  x = data$x3,
  rep = n_rep
)
# determine and store confidence intervals
conf_intervals_sd <- list(
  "x1" = conf_interval(x1_bs_sd),
  "x2" = conf_interval(x2_bs_sd),
  "x3" = conf_interval(x3_bs_sd)
)

# save variables that need some computation and are re-used for plotting
save(x1_bs_sd,
  x2_bs_sd,
  x3_bs_sd,
  file = "data/bootstrap_sd.RData"
)
# note that the storage location is now only data/ and not data/raw bc the data can be newly generated
# save under meaningful file name