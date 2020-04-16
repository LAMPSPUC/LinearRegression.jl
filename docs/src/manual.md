# Manual

## Introduction

In this package, we consider a multiple linear regression.

```math
y = X*beta + epsilon
```
where y is a vector (n x 1) of the observations;

X is a matrix (n x p) of the independent variables;

beta is a vector (p x 1) of the regression coefficients;

and epsilon is a vector (n x 1) of the errors.

## About it

It estimates the values of each beta by minimizing the squared error of the multiple linear regression model, as in the following calculation.

```math
beta_hat = ((X'*X)^-1)*X'*y
```

It also returns the standard deviation and the standard error of each beta_hat:

```math
mse = sse/(dof_total - dof_reg)

C = (X'*X)^-1
std_error = sqrt(mse*C[j,j])
```

where dof_total is the total degrees of freedom (n-1);

dof_reg is the degrees of freedom of the regression (k);

sse is the sum of squares of the erros;

Cjj is the jjth element of matrix C.

Furthermore, it calculates the Coefficient of Multiple Determination (R2) and its adjusted value (R2_adjusted).

```math
R2 = ssr/sst
R2_adjusted = 1 - (sse/(dof_total-dof_reg))/(sst/dof_total)
```

where ssr is the sum of squares of the regression;

sst is the total sum of squares.

In addiction, it gives both t-value and p-value for each estimative of beta_hat, as follows:

```math
to = beta_hat[j]/sqrt(mse*C[j,j])

p_value = (1 - cdf(TDist(num_obs-dof_reg-1), abs(t_value[j]))) * 2
```

## Linear Regression

It receives the vector with the observed values, y, and the matrix X, with the independent variables, as arguments and evaluates the multiple linear regression.

```julia
linreg(y,X)
```