function Base.show(io::IO, regression::Model)
    println("------------------------------------------------------------")
    println("Linear Regression:")
    println("Number of observations:        ", Int(regression.num_obs))
    println("Number of regressor variables: ", Int(regression.dof_reg))
    println("R2:                            ", @sprintf("%.4f", regression.r2))
    println("R2 Adjusted:                   ", @sprintf("%.4f", regression.r2_adj))
    println("Standard Deviation:            ", @sprintf("%.4f", regression.mse))
    println("Standard Error:                ", @sprintf("%.4f", sqrt(regression.mse)))
    println("F stat:                        ", @sprintf("%.4f", regression.f_value))
    println("F test p-value :               ", @sprintf("%.4f", regression.f_test_p_value))
    #=
    println("Log-likelihood:                ", @sprintf("%.4f", regression.llk))
    println("AIC:                           ", @sprintf("%.4f", regression.aic))
    println("BIC:                           ", @sprintf("%.4f", regression.bic))
    =#
    print_table(regression)
    return nothing
end

function print_table(regression::Model)
    println("------------------------------------------------------------")
    println("Parameter    Estimate    t stat    p-value    Standard Error")

    num_param = regression.dof_reg + 1
    parameter = "Intercept"
    for i in 1:num_param
        if i!=1
            parameter = "X"*string(i-1)
        end
        print_table_row(parameter, regression.beta_hat[i], regression.t_value[i], regression.t_test_p_value[i], regression.std_error[i])
    end
end

function print_table_row(parameter::String, estimate::T, tstat::T, pvalue::T, std_error::T) where T
    estimate = @sprintf("%.4f", estimate)
    tstat = @sprintf("%.4f", tstat)
    pvalue = @sprintf("%.4f", pvalue)
    std_error = @sprintf("%.4f", std_error)
    spc = Vector{String}(undef, 4)
    spc[1] = " " ^ (15- length(parameter))
    spc[2] = " " ^ (10- length(estimate))
    spc[3] = " " ^ (10- length(tstat))
    spc[4] = " " ^ (11- length(std_error))
    tableRow = parameter * spc[1] * estimate * spc[2] * tstat * spc[3] * pvalue * spc[4] * std_error
    println(tableRow)
end