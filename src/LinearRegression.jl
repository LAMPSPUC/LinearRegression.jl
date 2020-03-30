module LinearRegression

# Function that estimates the coefficients for a multiple linear regression model.
# It receives the data, y as a vector and X as a matrix.

"""
function add_column(x::Matrix{Float64})
    # function thar adds a column of ones in the matrix
    lin,col = size(x)
    X = ones(lin,(col+1))
    for i in 1:col
        X[:,i+1] = x[:,i]
    end
    return X
end
"""

function beta_hat(X::Matrix{Float64}, y::Vector{Float64})
    # Book implementation for estimation of parameters using the mathod of ordinary least squares method
    return ((X'*X)^-1)*(X'y)
end


function residuals(X::Matrix{Float64}, y::Vector{Float64}, beta_hat::Vector{Float64})
    # Book implementation for calculating residuals (y = Xβ + ϵ)
    return y-(X*beta_hat)
end


function SSe(X::Matrix{Float64}, y::Vector{Float64}, beta_hat::Vector{Float64})
    # Sum of squares of errors (or residuals) formula
    return y'*y - beta_hat'*X'*y
end


function R2(X::Matrix{Float64}, y::Vector{Float64}, beta_hat::Vector{Float64})
    # calculates the R² (coefficient of determination) of a estimation based on the book implementation
    SSE = SSe(X, y, beta_hat)
    Syy = y'*y - ((sum(y))^2)/(length(y))
    return 1 - SSE/Syy
end


function MSE(X::Matrix{Float64}, y::Vector{Float64}, beta_hat::Vector{Float64}) #σ²
    # calculates the MSE (mean square error) of a estimation based on the book implementation
    SSE = SSe(X, y, beta_hat)
    p = length(beta_hat) - 1
    return SSE/(length(y) - p)
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

function linreg(X::Matrix{Float64}, y::Vector{Float64})
    #X = add_column(X)
    # finding beta_hat
    betahat = beta_hat(X, y)
    # calculating the residuals
    ϵ = residuals(X, y, betahat)
    # calculating R²
    R² = R2(X, y, betahat)
    # calculating MSE (σ²)
    MSe = MSE(X, y, betahat)
    # calculating p-value
    #p_value = calulate_p_value(X, beta_hat, MSE)
    results = Dict("beta_hat" => betahat, "R²" => R², "MSE (σ²)" => MSe) #, "p-value" => p_value )
    return results
end


X = rand(100, 3)
y = rand(100)

"""
Xn = add_column(X)
betahat = beta_hat(X, y)
MSE = calculateMSE(Xn, y, beta_hat)

calulate_p_value(Xn, beta_hat, MSE)
"""

linreg(X, y)

end # module
