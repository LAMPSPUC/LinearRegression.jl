# Resultados da estimação
function fit(y::Vector{T}, X::Matrix{T}) where T
    return # Calcula o beta_hat
end

function resid(y::Vector{T}, X::Matrix{T}, beta_hat::Vector{T}) where T
    return # Calcula os residuos
end

function eval_dof_reg(beta_hat::Vector{T}) where T
    return length(beta_hat) - 1
end

function eval_dof_total(y::Vector{T}) where T
    return length(y) - 1
end

function eval_dof_resid(dof_total::Int, dof_reg::Int)
    return dof_total - dof_reg
end

function eval_rmse(resid::Vector{T}) where T
    return # Calcula o root mean square error
end

function eval_sse()
    return
end

function eval_ssr()
    return
end

function eval_sst(sse::T, ssr::T) where T
    return
end

function eval_mse(sse::T, dof_total::Int, dof_reg::Int) where T
    p = dof_reg + 1
    n = dof_total + 1
    mse = sse/(n-p)
    return mse
end

function eval_msr(ssr::T, dof_reg::Int) where T
    k = dof_reg
    msr = ssr/k
    return  msr
end

function eval_mst(sst::T, dof_total::Int) where T
    n = dof_total + 1
    mst = sst/(n-1)     #checar
    return  mst
end

function eval_loglik(mse::T, dof_total::Int, y::Vector{T}, X::Matrix{T}, beta_hat::Vector{T}) where T
    n = dof_total + 1
    loglik = -n/2 * (log(2*pi) + log(mse)) - ((y - X*beta_hat)'*(y - X*beta_hat))/(2*mse) #checar
    return
end

function eval_aic(dof_reg::Int, loglik::T) where T
    k = dof_reg
    aic = 2*k - 2*loglik
    return
end

function eval_bic(dof_total::Int, dof_reg::Int, loglik::T)
    n = dof_total + 1
    k = dof_reg
    bic = log(n)*k - 2*loglik
    return
end

function eval_r2(ssr::T, sst::T) where T
    r2 = ssr/sst
    return r2
end

function eval_r2_adj(sse::T, sst::T, dof_total::Int, dof_reg::Int) where T
    n = dof_total + 1
    p = dof_reg + 1
    r2_adj = 1 - (sse/(n-p))/(sst/n-1)
    return r2_adj
end

function linreg(y::Vector{T}, X::Matrix{T}) where T <: Real
    
    # Completar essa função a medida que formos avançando

    return Model(y, X, beta_hat, num_obs, dof_reg, dof_resid, 
                dof_total, rmse, llk, aic, bic, r2, r2_adj, residuals,
                mse, msr, mst, sse, ssr, sst, t_value, t_test_p_value, 
                f_value, f_test_p_value)
end



