
using CSV

# Let X be a matrix and y a vector as in the following example

PATH = pwd()
data = CSV.read(joinpath(PATH, "LinearRegression.jl/examples/Iris.csv"))

r, c = size(data)
X = Matrix(data[:, 3:(c-1)])
X = [ones(size(X, 1)) X]

y = Vector(data[:, 2])

# Estimate a multiple linear regression model

reg = linreg(y, X)
