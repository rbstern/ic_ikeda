library(rstan)
library(tidyverse)

n = 30
theta = c(100, 150)
N = matrix(data = NA, nrow = n, ncol = 2)
for (i in 1:n)
{
  N[i,1] <- rpois (1, theta[1])
  N[i,2] <- rpois(1, theta[2])
}

amostra = stan(file = "ex-7.31-matriz.stan", 
               data = c("n", "N"),
               iter = 10^5, chains = 1)

plot(amostra)
