data {
  int<lower = 1> n;        // numero de dias
  matrix <lower = 0>[n,2] N;  // numero de vizualizacoes, 1 coluna = propaganda 1, coluna 2 = propaganda 2
}
parameters {
  real theta;  // parametro das propagandas
}

model {
  theta ~ gamma (1,1);
  for (i in 1:n) // linhas
  {
    for (j in 1:2) // colunas
    {
      N[i,j] ~ poisson(theta);
      
    }
  }
}


