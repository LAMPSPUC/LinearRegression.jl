module LinearRegression

greet() = print("Hello World!")

# Function that estimates the coefficients for a multiple linear regression model.
# It receives the data, y as a vector and X as a matrix.


function add_column(x)
    lin,col = size(x)
    X = ones(lin,(col+1))
    for i in 1:col
        X[:,i+1] = x[:,i]
    end
    return X
end

function find_beta_hat(y, x) # vector, matrix
    X = add_column(x)
    beta_hat = ((X'*X)^-1)*(X'y)
    return beta_hat
end

function calculate_error(y, X, beta_hat)
    erro = y-(X*beta_hat)
    return erro
end

function calculateR2(beta_hat, X, y)
    SSr = beta_hat'*X'*y - ((sum(y))^2)/2
    #SSe = y'*y - beta_hat'*X'*y
    Syy = y'*y - ((sum(y))^2)/2
    R2 = SSr/Syy
    #R2 = 1 - SSe/Syy
    return R2
end

function linear_regression(y, x) # vector, matrix
    X = add_column(x)
    beta_hat = ((X'*X)^-1)*(X'y)

    erro = y-(X*beta_hat)
    return [beta_hat, erro]
end

X = rand(100, 3)
y = rand(100)

linear_regression(y, X)

end # module
