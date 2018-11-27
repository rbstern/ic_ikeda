data {
  int<lower = 1> n;        // numero de dias
  matrix <lower = 0>[n,2] N;  // numero de vizualizacoes, 1 coluna = propaganda 1, coluna 2 = propaganda 2
}
parameters {
  real theta  // parametro das propagandas
}

model {
  theta ~ gamma(1,1)
  {
    for (i in range [0,n]) // nas linhas
      {
        for (j in range [0,2]) // nas colunas
          N[i,j] ~ poisson(theta)
      }
    }
  
  }
