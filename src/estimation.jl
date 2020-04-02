# Resultados da estimação

function fit(y::Vector{T}, X::Matrix{T}) where T
    return ((X'*X)^-1)*(X'*y) # Calcula o beta_hat
end

function resid(y::Vector{T}, X::Matrix{T}, beta_hat::Vector{T}) where T
    return y-(X*beta_hat) # Calcula os residuos
end

function eval_dof_reg(beta_hat::Vector{T}) where T
    return length(beta_hat) - 1
end

function eval_num_obs(y::Vector{T}) where T
    return length(y)
end

function eval_dof_total(y::Vector{T}) where T
    return length(y) - 1
end

function eval_dof_resid(dof_total::Int, dof_reg::Int)
    return dof_total - dof_reg
end

function eval_rmse(resid::Vector{T}) where T
    return sqrt(sum(resid.^2)/length(resid)) # Calcula o root mean square error
end

function eval_sse(y::Vector{T}, X::Matrix{T}, beta_hat::Vector{T}) where T
    return y'*y - beta_hat'*X'*y # Calcula o error or residual sum of squares
end

function eval_ssr(y::Vector{T}, X::Matrix{T}, beta_hat::Vector{T}) where T
    return beta_hat'*X'*y - ((sum(y)^2)/length(y)) # Calcula o regression sum of squares
end

function eval_sst(sse::T, ssr::T) where T
    return sse + ssr # Calcula o total sum of squares
end

function eval_mse(sse::T, dof_total::Int, dof_reg::Int) where T
    return sse/(dof_total - dof_reg)
end

function eval_msr(ssr::T, dof_reg::Int) where T
    return  ssr/dof_reg
end

function eval_mst(sst::T, dof_total::Int) where T
    return  sst/dof_total
end

function eval_loglik(mse::T, num_obs::Int, resid::Vector{T}) where T
    return -num_obs/2 * (log(2*pi) + log(mse)) - ((resid)'*(resid))/(2*mse)
end

function eval_aic(dof_reg::Int, loglik::T) where T
    return 2 * dof_reg - 2 * loglik
end

function eval_bic(num_obs::Int, dof_reg::Int, loglik::T) where T
    return log(num_obs) * dof_reg - 2 * loglik
end

function eval_r2(ssr::T, sst::T) where T
    return ssr/sst
end

function eval_r2_adj(sse::T, sst::T, dof_total::Int, dof_reg::Int) where T
    return 1 - (sse/(dof_total-dof_reg))/(sst/dof_total)
end

function linreg(y::Vector{T}, X::Matrix{T}) where T <: Real
    
    beta_hat = fit(y, X)
    resid = resid(y, X, beta_hat)
    num_obs = eval_num_obs(y)
    dof_reg = eval_dof_reg(beta_hat)
    dof_total = eval_dof_total(y)
    dof_resid = eval_dof_resid(dof_total, dof_reg)
    rmse = eval_rmse(resid)
    sse = eval_sse(y, X, beta_hat)
    ssr = eval_ssr(y, X, beta_hat)
    sst = eval_sst(sse, ssr)
    mse = eval_mse(sse, dof_total, dof_reg)
    msr = eval_msr(ssr, dof_reg)
    mst = eval_mst(sst, dof_total)
    llk = eval_loglik(mse, num_obs, resid)
    aic = eval_aic(dof_reg, llk)
    bic = eval_bic(num_obs, dof_reg, llk)
    r2 = eval_r2(ssr, sst)
    r2_adj = eval_r2_adj(sse, sst, dof_total, dof_reg)
    t_value = LinearRegression.eval_t_value(X, beta_hat, mse, dof_reg, num_obs)
    t_test_p_value = LinearRegression.eval_t_test_p_value(dof_reg, t_value)
    f_value = LinearRegression.eval_f_value(msr, mse)
    f_test_p_value = LinearRegression.eval_f_test_p_value(f_value, dof_reg, num_obs)

    return Model(y, X, beta_hat, num_obs, dof_reg, dof_resid, 
                dof_total, rmse, llk, aic, bic, r2, r2_adj, resid,
                mse, msr, mst, sse, ssr, sst, t_value, t_test_p_value, 
                f_value, f_test_p_value)
end