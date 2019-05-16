library(rstan)

#########################################
# Regressao linear para dados simulados #
#########################################
alpha = 5
beta = 8
sigma = 2
N = 1000
x <- rnorm(n)
y <- rnorm(n, alpha + beta*x, 2)

amostra = stan(file = "20190516.stan", 
               data = c("N", "x", "y"),
               iter = 10^5, chains = 1)

# Estimacao
alpha_amostra = extract(amostra, "alpha")[["alpha"]]
beta_amostra = extract(amostra, "beta")[["beta"]]
mean(alpha_amostra)
mean(beta_amostra)

# Intervalos de credibilidade
plot(amostra, ci_level = 0.8, outer_level = 0.95)

# Teste de hipotese
mean(alpha_amostra < beta_amostra)

#########################
# Regressao para mtcars #
#########################
N = dim(mtcars)[1]
x1 = mtcars$disp
x2 = x1^2
y = mtcars$mpg

amostra = stan(file = "20190516-2.stan", 
               data = c("N", "x1", "x2", "y"),
               iter = 10^5, chains = 1)

# Estimacao
alpha_amostra = extract(amostra, "alpha")[["alpha"]]
beta_amostra = extract(amostra, "beta")[["beta"]]
gamma_amostra = extract(amostra, "gamma")[["gamma"]]
alpha_m = mean(alpha_amostra)
beta_m = mean(beta_amostra)
gamma_m = mean(gamma_amostra)

plot(x1, y)
x = sort(x1)
lines(x, alpha_m + beta_m * x + gamma_m * x^2)

# Intervalos de credibilidade
plot(amostra, ci_level = 0.8, outer_level = 0.95)
