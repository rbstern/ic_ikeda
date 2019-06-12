library(rstan)

n = 12
alpha = 7
beta = 3

#o que esses dados representam?
myvector <- c(6,8,7,5,98,56,24,74,2,84,51,35)
myts <- ts(myvector, start=c(2009, 1), end=c(2014, 12), frequency=12) 

amostra = stan(file = "timeseries.stan", 
               data = c("n", "myts"),
               iter = 10^5, chains = 1)

# Estimacao
alpha_amostra = extract(amostra, "alpha")[["alpha"]]
beta_amostra = extract(amostra, "beta")[["beta"]]
mean(alpha_amostra)
mean(beta_amostra)

# Intervalos de credibilidade
plot(amostra, ci_level = 0.8, outer_level = 0.95)
