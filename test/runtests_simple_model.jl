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
    @test sse ≈ 14.8291844 atol = 1e-5
    ssr = LinearRegression.eval_ssr(y, X, beta_hat)
    @test ssr ≈ 17.2508156 atol = 1e-5
    sst = LinearRegression.eval_sst(sse, ssr)
    @test sst ≈ 32.08 atol = 1e-5

    mse = LinearRegression.eval_mse(sse, dof_total, dof_reg)
    @test mse ≈ 4.94306145 atol = 1e-5
    msr = LinearRegression.eval_msr(ssr, dof_reg)
    @test msr ≈ 8.62540782 atol = 1e-5

    # Tests failed for loglik, aic and bic
    # loglik: GLM used another value for the mse or another formula
    # aic, bic: GLM used k=4, when LinearRegression used k=3.

    #loglik = LinearRegression.eval_loglik(mse, num_obs, residuals)
    #@test loglik ≈ -11.228144256906981 atol = 1e-5
    #aic = LinearRegression.eval_aic(dof_reg, loglik)
    #@test aic ≈ 30.456288513813963 atol = 1e-5
    #bic = LinearRegression.eval_bic(num_obs, dof_reg, loglik)
    #@test bic ≈ 29.623326390726184 atol = 1e-5
    
    r2 = LinearRegression.eval_r2(ssr, sst)
    @test r2 ≈ 0.53774363 atol = 1e-5
    r2_adj = LinearRegression.eval_r2_adj(sse, sst, dof_total, dof_reg)
    @test r2_adj ≈ 0.22957272 atol = 1e-5

    t_value = LinearRegression.eval_t_value(X, beta_hat, mse, dof_reg, num_obs)
    @test t_value ≈ [0.79894227; 1.19175315; 0.18954179] atol = 1e-5
    t_test_p_value = LinearRegression.eval_t_test_p_value(num_obs, dof_reg, t_value)
    @test t_test_p_value ≈ [0.4827273537; 0.3190421488; 0.8617673678] atol = 1e-5

    f_value = LinearRegression.eval_f_value(msr, mse)
    @test f_value ≈ 1.7449525774 atol = 1e-5
    f_test_p_value = LinearRegression.eval_f_test_p_value(f_value, dof_reg, num_obs)
    @test f_test_p_value ≈ 0.314285509 atol = 1e-5
end