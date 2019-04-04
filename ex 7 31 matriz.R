library(rstan)


n = 30
N = matrix(data = NA, nrow = n, ncol = 2)
for (i in 1:n)
{
  N[i,1] <- rpois (1,100)
  N[i,2] <- rpois(1,150)
}


amostra = stan(file = "ex-7.31-matriz.stan", 
               data = c("n", "N"),
               iter = 10^5, chains = 1)

