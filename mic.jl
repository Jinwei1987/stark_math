using SpecialFunctions;

using GLMakie
set_theme!(fontsize=30, linewidth=2)
lines(-3:0.01:3, easy_gamma, axis=(; limits=(-3, 3, -100, 100)))

using Plots
plot(-3:0.01:3, easy_gamma)

function easy_gamma(x)
    try
        gamma(x)
    catch e
        if isa(e, DomainError)
            Inf
        else
            throw(e)
        end
    end
end