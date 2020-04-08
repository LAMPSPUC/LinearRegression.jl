
using CSV

# Let X be a matrix and y a vector as in the following example

PATH = pwd()
data = CSV.read(joinpath(PATH, "LinearRegression.jl/examples/example.csv"); delim=';', decimal=',')

r, c = size(data)
x = data[:, 2:c]

function add_column(x)
    row,col = size(x)
    X = ones(row,(col+1))
    for i in 1:col
        X[:,i+1] = x[:,i]
    end
    return X
end

X = add_column(x)

df = data[:, 1:2]
y = df[!, 1]

# Estimate a multiple linear regression model

reg = linreg(y, X)






