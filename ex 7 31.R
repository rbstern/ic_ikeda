library(rstan)

# Geracao dos dados
theta1 = 100
theta2 = 150
n = 30
i_1 <- rpois(n, theta1)
i_2 <- rpois(n, theta2)

amostra = stan(file = "ex-7.31.stan", 
               data = c("n", "i_1", "i_2"),
               iter = 10^5, chains = 1)

# Estimacao
theta1_amostra = extract(amostra, "theta1")[["theta1"]]
theta2_amostra = extract(amostra, "theta2")[["theta2"]]
mean(theta1_amostra)
mean(theta2_amostra)

# Intervalos de credibilidade
plot(amostra, ci_level = 0.8, outer_level = 0.95)

# Teste de hipotese
mean(theta1_amostra < theta2_amostra)

##########################################################
# Para a proxima reuniao,                                #
# refazer o codigo .stan usando                          #
# matrizes e lacos.                                      #
# para isso ler a parte II do 1o link em                 #
# http://mc-stan.org/users/documentation/                #
##########################################################
