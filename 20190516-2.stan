data {
  int<lower=0> N;
  vector[N] x1;
  vector[N] x2;
  vector[N] y;
}

parameters {
  real alpha;
  real beta;
  real gamma;
  real<lower=0> sigma;
}

model {
  y ~ normal(alpha + beta * x1 + gamma * x2, sigma);
}
