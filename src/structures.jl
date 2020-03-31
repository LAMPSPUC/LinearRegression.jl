mutable struct Model{T <: Real}
    y::Vector{T}
    X::Matrix{T}
    num_obs::Int
    beta_hat::Vector{T}
    dof_reg::Int
    dof_resid::Int
    dof_total::Int
    rmse::T
    llk::T
    aic::T
    bic::T
    r2::T
    r2_adj::T
    residuals::Vector{T}
    mse::T
    msr::T
    mst::T
    sse::T
    ssr::T
    sst::T
    t_value::Vector{T}
    t_test_p_value::Vector{T}
    f_value::T
    f_test_p_value::T
end

X = rand(100, 4)
y = rand(100)

lm(X, y)