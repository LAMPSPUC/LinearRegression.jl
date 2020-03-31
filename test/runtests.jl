using LinearRegression
Pkg.add("LinearRegression")
using Test

LinearRegression.linreg(X, y)

@testset "LinearRegression.jl" begin
    X = [1 100;
    1 110;
    1 120;
    1 130;
    1 140;
    1 150;
    1 160;
    1 170;
    1 180;
    1 190]
    y = [45, 51, 54, 61, 66, 70, 74, 78, 85, 89]

end

check()