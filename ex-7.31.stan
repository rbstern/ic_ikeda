data {
  int<lower = 0> i_1;   // numero de vizualizações que a propaganda 1 teve
  int<lower = 0> i_2;   // numero de vizualizações que a propaganda 2 teve
  real x[i];            // vetor das vizualizações que as propagandas tiveram
  
}
parameters {
  real theta1;  // parametro da propaganda 1
  real theta2;  // parametro dapropaganda 2
}
model {
  theta1 ~ gamma(a1,b1)
  theta2 ~ gamma(a2,b2)
  x ~ poisson(theta)
}