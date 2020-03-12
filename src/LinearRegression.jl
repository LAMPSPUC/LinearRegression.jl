module LinearRegression

greet() = print("Hello World!")

# Function that estimates the coefficients for a multiple linear regression module.
# It receives the data as DataFrame, the number of the column in that DataFrame where
# the y values are, and a vector that informs all the columns where the data of each 
# estimator is located.


#function add_column(df::DataFrame, col_y::Int64, cols_x::Vector)
function linear_regression(df, col_y, cols_x) #df, num, vector
    y_vec = [df[col_y]]
    X = ones(cols_x[1], cols_x[end])
    for i in 2:cols_x[end]
        X[:,i] = [df[cols_x[i-1]]]
    end
    #beta_hat = ((X'.*X).^(-1)).X'.*y
end

X = rand(100, 3)
y = rand(100)

end # module
