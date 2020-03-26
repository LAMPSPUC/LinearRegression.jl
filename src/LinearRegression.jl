module LinearRegression

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

function find_beta_hat(x, y)
    X = add_column(x)
    beta_hat = ((X'*X)^-1)*(X'y)
    return beta_hat
end

function calculate_residual(X, y, beta_hat)
    ϵ = y-(X*beta_hat)
    return ϵ
end

function calculateR2(X, y, beta_hat)
    SSr = beta_hat'*X'*y - ((sum(y))^2)/(length(y))
    #SSe = y'*y - beta_hat'*X'*y
    Syy = y'*y - ((sum(y))^2)/(length(y))
    R2 = SSr/Syy
    #R2 = 1 - SSe/Syy
    return R2
end

function calculateMSE(X, y, beta_hat) #σ²
    SSe = y'*y - beta_hat'*X'*y
    p = length(beta_hat) - 1
    print(length(beta_hat))
    MSE = SSe/(length(y) - p)
    return MSE
end
"""
function calulate_p_value(X, beta_hat, MSE)
    #p_value = []
    row, col = size(beta_hat)
    C = (X'*X)^-1
    for j in 1:row
        print(j)
        p_value = beta_hat[j]/sqrt(MSE*C[j,j])
        print(p_value)
    end
    #return p_value
end
"""
function linear_regression(x, y)
    X = add_column(x)
    # finding beta_hat
    beta_hat = find_beta_hat(x, y)
    # calculating the residuals
    ϵ = calculate_residual(X, y, beta_hat)
    # calculating R²
    R² = calculateR2(X, y, beta_hat)
    # calculating MSE (σ²)
    MSE = calculateMSE(X, y, beta_hat)
    # calculating p-value
    #p_value = calulate_p_value(X, beta_hat, MSE)
    results = Dict("beta_hat" => beta_hat, "R²" => R², "MSE (σ²)" => MSE) #, "p-value" => p_value )
    return results
end

X = rand(100, 3)
y = rand(100)
"""
Xn = add_column(X)
beta_hat = find_beta_hat(X, y)
MSE = calculateMSE(Xn, y, beta_hat)

calulate_p_value(Xn, beta_hat, MSE)
"""
linear_regression(X, y)

end # module
