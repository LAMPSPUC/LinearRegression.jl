# Examples

## Iris Species

Example of a multiple regression on Iris species characteristics.

```julia
using CSV

# Load the dataset of the iris species
PATH = pwd()
data = CSV.read(joinpath(PATH, "LinearRegression.jl/examples/Iris.csv"))

# Convert data to an matrix in which the first column contains ones
r, c = size(data)
X = Matrix(data[:, 3:(c-1)])
X = [ones(size(X, 1)) X]

# Select the column that contains the observations
y = Vector(data[:, 2])

# Estimate a multiple linear regression model
reg = linreg(y, X)
```
