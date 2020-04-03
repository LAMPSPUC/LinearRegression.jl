# Resultados do teste de hipótese

function eval_t_value(X::Matrix{T}, beta_hat::Vector{T}, mse::T, dof_reg::Int, num_obs::Int) where T
    C = (X'*X)^-1
    t_value = []
    for j in 1:(dof_reg+1)
        to = beta_hat[j]/sqrt(mse*C[j,j])
        push!(t_value, to)
    end
    return t_value
end

function eval_t_test_p_value(num_obs::Int, dof_reg::Int, t_value::Vector{T}) where T
    t_test_p_value = []
    for j in 1:(dof_reg+1)
        p_value = (1 - cdf(TDist(num_obs-dof_reg-1), t_value[j])) * 2
        push!(t_test_p_value, p_value)
    end
    return t_test_p_value
end

function eval_f_value(msr::T, mse::T) where T
    return msr/mse
end

function eval_f_test_p_value(f_value::T, dof_reg::Int, num_obs::Int) where T
    return 1 - cdf(FDist(dof_reg, num_obs-dof_reg-1), f_value)
end
