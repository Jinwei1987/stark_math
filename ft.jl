using Plots;
using FFTW;

# Compute the Fourier transform by approximated integral
using QuadGK;
function continuous_fourier_transform(f, ω)
    real_part, _ = quadgk(t -> real(f(t) * exp(-1im * ω * t)), -20, 20)
    imag_part, _ = quadgk(t -> imag(f(t) * exp(-1im * ω * t)), -20, 20)
    return real_part + 1im * imag_part
end
ω_range = 0:0.1:5
F_ω = [continuous_fourier_transform(f, ω) for ω in ω_range]
plot(ω_range, abs.(F_ω), label="Magnitude", xlabel="ω", ylabel="|F(ω)|", title="Approximated Continuous Fourier Transform")


# Compute the Fourier transform by sympy
using SymPy
f(x) = cos(2x);
f(x) = cos(x) + cos(2x) + cos(3x);
f(x) = sign(cos(x))
f(x) = sign(sin(x))
f(x) = (x > -1) & (x < 1) ? 1 : 0
f(x) = Heaviside(x + 1) - Heaviside(x - 1)
f(x) = Heaviside(x)

plot(-3:0.01:3, f)
plot(f(t), -3, 3)
@vars t ω real=true
F_ω = integrate(f(t) * exp(-IM * ω * t), (t, 0, 200))
ω_values = -3:0.01:3;
F_values = [N(F_ω.subs(ω, val)) for val in ω_values];
plot(ω_values, abs.(F_values), xlabel="ω", ylabel="|F(ω)|", title="Magnitude Spectrum")
plot(2π ./ Array(ω_values), abs.(F_values), xlabel="ω", ylabel="|F(ω)|", title="Magnitude Spectrum")

