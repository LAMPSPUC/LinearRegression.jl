@testset "simple model" begin
    X = [
        1 1 0.12
        1 2 0.103
        1 3 0.1928
        1 4 0.1982347
        1 4 0.12348
        1 5 0.5083
    ]
    y = [
        4.5
        4.3
        2.3
        6.7
        8.0
        9.0
    ]

    beta_hat = LinearRegression.fit(y, X)
    @test beta_hat ≈ [1.863790848; 1.129398321; 1.732751124] atol = 1e-5 
    residuals = LinearRegression.resid(y, X, beta_hat)
    @test residuals ≈ [1.2988806964635216; -0.001060854941782985; -3.286060226342731; 
                        -0.02487552937964832; 1.4046557610363477; 0.6084601531642857] atol = 1e-5
    @test LinearRegression.rmse(residuals) ≈ 1.5721102780007534 atol = 1e-5

    # e continua
end
