@testset "book example" begin

    X = [1 2 50.0;
    1 8 110.0;
    1 11 120.0;
    1 10 550.0;
    1 8 295.0;
    1 4 200.0;
    1 2 375.0;
    1 2 52.0;
    1 9 100.0;
    1 8 300.0;
    1 4 412.0;
    1 11 400.0;
    1 12 500.0;
    1 2 360.0;
    1 4 205.0;
    1 4 400.0;
    1 20 600.0;
    1 1 585.0;
    1 10 540.0;
    1 15 250.0;
    1 15 290.0;
    1 16 510.0;
    1 17 590.0;
    1 6 100.0;
    1 5 400.0]

    y = [9.95, 24.45, 31.75, 35.00, 25.02, 16.86, 14.38, 9.60,
    24.35, 27.50, 17.08, 37.00, 41.95, 11.66, 21.65, 17.89,
    69.00, 10.30, 34.92, 46.59, 44.88, 54.12, 56.63, 22.13, 21.15]

    beta_hat = LinearRegression.fit(y, X)
    @test beta_hat ≈ [2.26379143; 2.74426964; 0.01252781] atol = 1e-2

    residuals = LinearRegression.resid(y, X, beta_hat)
    # @test residuals ≈ [1.57, -1.15, -2.20, -1.60, -2.89, 1.11, 1.93, 1.20,
    # -3.86, -0.48, -1.32, -0.46, 0.49, -0.60, 5.84, -0.36, 44.33, -2.04,
    # -1.54, 0.03, -2.18, 1.56, 0.32, 2.15, 0.15] atol = 1e-1

    dof_reg = LinearRegression.eval_dof_reg(beta_hat)
    @test dof_reg == 2

    dof_total = LinearRegression.eval_dof_total(y)
    @test dof_total == 24
    
    dof_resid = LinearRegression.eval_dof_resid(dof_total, dof_reg)
    @test dof_resid == 22
    
    # @test LinearRegression.eval_rmse(residuals) ≈ 2.288055943 atol = 1e-2
    
    # sse = LinearRegression.eval_sse(y, X, beta_hat)
    # @test sse ≈ 115.1735 atol = 1e-2
    
    # ssr = LinearRegression.eval_ssr(y, X, beta_hat)
    # @test ssr ≈ 5990.7712 atol = 1e-2
    
    # @test LinearRegression.eval_sst(sse, ssr) ≈ 6105.9447 atol = 1e-2

end

