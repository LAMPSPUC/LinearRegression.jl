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

function eval_mse()
    return
end

function eval_msr()
    return
end

function eval_mst() where T
    return     
end

function eval_loglik()
    return
end

function eval_aic()
    return
end

function eval_bic()
    return
end

function eval_r2()
    return
end

function eval_r2_adj()
    return
end

function linreg(y::Vector{T}, X::Matrix{T}) where T <: Real
    
    # Completar essa função a medida que formos avançando

    return Model(y, X, beta_hat, num_obs, dof_reg, dof_resid, 
                dof_total, rmse, llk, aic, bic, r2, r2_adj, residuals,
                mse, msr, mst, sse, ssr, sst, t_value, t_test_p_value, 
                f_value, f_test_p_value)
end



