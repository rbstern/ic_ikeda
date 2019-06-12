data {
 int<lower=0> N;
 vector[N] y;
}

parameters {
 real alpha;
 real <lower = -1, upper = 1> beta;
 real <lower=0> sigma;
}

model {
 alpha ~ normal(0, 1);
 beta ~ normal(0, 0.1);
 for (n in 2:N)
  y[n] ~ normal(alpha + beta * y[n-1], sigma);
}
