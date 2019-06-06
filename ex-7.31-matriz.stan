data {
  int<lower = 1> n;        // numero de dias
  int <lower = 0> N[n,2];  // numero de vizualizacoes, 1 coluna = propaganda 1, coluna 2 = propaganda 2
}
parameters {
  real <lower = 0> theta[2];  // parametro das propagandas
}

model {
  theta ~ gamma (1,1);
  N[,1] ~ poisson(theta[1]);
  N[,2] ~ poisson(theta[2]);
}
