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
    dof_reg = LinearRegression.eval_dof_reg(beta_hat)
    @test dof_reg == 2
    num_obs = LinearRegression.eval_num_obs(y)
    @test num_obs == 6
    dof_total = LinearRegression.eval_dof_total(y)
    @test  dof_total == 5
    dof_resid = LinearRegression.eval_dof_resid(dof_total, dof_reg)
    @test dof_resid == 3
    rmse = LinearRegression.eval_rmse(residuals)
    @test rmse ≈ 1.5721102780007534 atol = 1e-5
    sse = LinearRegression.eval_sse(y, X, beta_hat)
    @test sse ≈ 17.2508156 atol = 1e-5
    ssr = LinearRegression.eval_ssr(y, X, beta_hat)
    @test ssr ≈ 14.8291844 atol = 1e-5
    sst = LinearRegression.eval_sst(y, X, beta_hat)
    @test ssr ≈ 32.08 atol = 1e-5
    mse = LinearRegression.eval_mse(sse, dof_total, dof_reg)
    @test mse ≈ 8.62540782 atol = 1e-5
    msr = LinearRegression.eval_msr(ssr, dof_reg)
    @test msr ≈ 4.94306145 atol = 1e-5
    r2 = LinearRegression.eval_r2(ssr, sst)
    @test r2 ≈ 0.53774363 atol = 1e-5
    r2_adj = LinearRegression.eval_r2_adj(sse, sst, dof_total, dof_reg)
    @test r2_adj ≈ 0.22957272 atol = 1e-5
    t_value = LinearRegression.eval_t_value(X, beta_hat, mse, dof_reg, num_obs)
    @test t_value ≈ [0.79894227; 1.19175315; 0.18954179] atol = 1e-5
end
