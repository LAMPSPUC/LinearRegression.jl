module LinearRegression

using Distributions
using LinearAlgebra

export linreg

include("structures.jl")
include("estimation.jl")
include("hypothesis_tests.jl")
include("prints.jl")

end # module
