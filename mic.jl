using SpecialFunctions;

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