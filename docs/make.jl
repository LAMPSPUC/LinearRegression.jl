using Documenter, LinearRegression

makedocs(
    modules = [LinearRegression],
    doctest  = false,
    clean    = true,
    format   = Documenter.HTML(),
    sitename = "LinearRegression.jl",
    authors  = "",
    pages   = [
        "Home" => "index.md",
        "manual.md",
        "examples.md"
    ]
)

# deploydocs(
#     repo = "github.com/LAMPSPUC/ScoreDrivenModels.jl.git",
# )