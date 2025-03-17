# this code loads analysis data and generates figures from it

# styled using the `styler` package (https://www.tidyverse.org/blog/2017/12/styler-1.0.0/)
# using tidyverse style

# constants and seed
set.seed(42) # set seed bc some of the plots depend on the random number generator
# e.g., StratPal::random_walk

# load data from bootstrap analysis
load("data/bootstrap_sd.RData")
# load data from analyses

pdf("figs/sd_x1.pdf") # save figures in `figs` folder
hist(x1_bs_sd,
  xlab = "sd",
  main = "bootstrap standard deviation of x1"
)
dev.off()

pdf("figs/sd_x2.pdf")
hist(x2_bs_sd,
  xlab = "sd",
  main = "bootstrap standard deviation of x2"
)
dev.off()

pdf("figs/sd_x3.pdf")
hist(x3_bs_sd,
  xlab = "sd",
  main = "bootstrap standard deviation of x3"
)
dev.off()

## plot a random walk
t <- seq(0, 2, by = 0.01)
rw <- StratPal::random_walk(t, sigma = 2)

pdf("figs/random_walk.pdf")
plot(rw,
  type = "l",
  xlab = "Time [Myr]",
  ylab = "y",
  main = "Random Walk"
)
dev.off()

## plot age-depth model
adm <- admtools::tp_to_adm(
  t = scenarioA$t_myr,
  h = scenarioA$h_m[, "2km"],
  T_unit = "Myr",
  L_unit = "m"
)

pdf("figs/age-depth model.pdf")
plot(adm,
  col_destr = NA,
  lwd_acc = 3
)
T_axis_lab()
L_axis_lab()
title(main = "Age-depth model")
dev.off()
