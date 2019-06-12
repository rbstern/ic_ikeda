library(rstan)

###########################
# Dados criados da cabeça #
###########################

N = 12
#o que esses dados representam?
y <- c(6, 8, 7,5, 98, 56, 24, 74, 2, 84, 51, 35)

amostra = stan(file = "timeseries.stan", 
               data = c("N", "y"),
               iter = 10^5, chains = 1)

# Estimacao
alpha_amostra = extract(amostra, "alpha")[["alpha"]]
beta_amostra = extract(amostra, "beta")[["beta"]]
mean(alpha_amostra)
mean(beta_amostra)

# Intervalos de credibilidade
plot(amostra, ci_level = 0.8, outer_level = 0.95)

###################
# Dados simulados #
###################

# Parametros
alpha = 50
beta = 0.3
sigma = 0.1

# Geração dos dados
N = 10^3
y = rep(NA, N)
y[1] = sum(alpha*beta^c(0:100))
for(i in 2:N)
{
  y[i] <- rnorm(1, alpha + beta*y[i-1], sigma)
}  
# Visualização dos dados
plot(as.ts(y))

# Uso do stan
amostra = stan(file = "timeseries.stan", 
               data = c("N", "y"),
               iter = 10^4, chains = 1)

# Estimacao
alpha_amostra = extract(amostra, "alpha")[["alpha"]]
beta_amostra = extract(amostra, "beta")[["beta"]]
mean(alpha_amostra)
mean(beta_amostra)

# Intervalos de credibilidade
plot(amostra, ci_level = 0.8, outer_level = 0.95)
