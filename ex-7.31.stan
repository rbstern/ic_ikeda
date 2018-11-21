data {
  int<lower = 1> n;        // numero de dias
  int<lower = 0> i_1[n];   // numero de vizualizacoes por dia para a propaganda 1
  int<lower = 0> i_2[n];   // numero de vizualizacoes por dia para a propaganda 2
}

parameters {
  real theta1;  // parametro da propaganda 1
  real theta2;  // parametro da propaganda 2
}

model {
  theta1 ~ gamma(1, 1);
  theta2 ~ gamma(1, 1);
  i_1 ~ poisson(theta1);
  i_2 ~ poisson(theta2);
}
