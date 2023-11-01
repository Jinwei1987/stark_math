using FFTW

using Plots
# 1. Sampling Parameters
Fs = 1000;  # Sampling frequency
T = 1/Fs;   # Sampling period
L = 1500;   # Length of the signal
t = (0:L-1)*T;  # Time vector
# 2. Signal Creation: Sum of a 50 Hz sinusoid and a 120 Hz sinusoid
f1 = 50;  # First frequency
f2 = 120;  # Second frequency
S = 0.7*sin.(2*pi*f1*t) + sin.(2*pi*f2*t);
plot(t, S)
# 3. FFT of the Signal
Y = fft(S);
# 4. Frequency Spectrum
P2 = abs.(Y/L);
P1 = P2[1:floor(Int, L/2+1)];
P1[2:end-1] .= 2*P1[2:end-1];
F = Fs*(0:(L/2))/L;

# 1. Sampling Parameters
Fs = 80;  # Sampling frequency
T = 1/Fs;   # Sampling period
L = 320;   # Length of the signal
t = (0:L-1)*T;  # Time vector
# 2. Signal Creation: Sum of a 50 Hz sinusoid and a 120 Hz sinusoid
f1 = 0.5;  # First frequency
f2 = 1;  # Second frequency
S = 0.7*cos.(2*pi*f1*t) + cos.(2*pi*f2*t);
# 3. FFT of the Signal
Y = fft(S);
# 4. Frequency Spectrum
P2 = abs.(Y/L);
P1 = P2[1:floor(Int, L/2+1)];
P1[2:end-1] .= 2*P1[2:end-1];
F = Fs*(0:(L/2))/L;
# 5. Filter and Reconstruct Signal
Z = ifft(Y)
Ŷ = copy(Y);
freqs = fftfreq(L, Fs)
Ŷ[findall(x -> abs(x) == 0.5, freqs)] .= 0
Ẑ = ifft(Ŷ)
# Plotting
plot(t, S)
plot(F, P1)
scatter(angle.(Y), abs.(Y), proj=:polar)
plot(t, real.(Z))
scatter(angle.(Ŷ), abs.(Ŷ), proj=:polar)
plot(t, real.(Ẑ))

using GLMakie
set_theme!(resolution = (2000, 1500), fontsize=30, linewidth=2)
lines(F, P1)
f = Figure()
ax = PolarAxis(f[1, 1], rticklabelsize=30, thetaticklabelsize=30)
scatter!(abs.(Y), angle.(Y), markersize=30)
lines(t, real.(Ẑ))


f(x) = x^2 + 1.5x + 1
g(x) = x^3 + x^2 + x + 1
ifft(fft([1, 1.5, 1, 0, 0, 0]) .* fft([1, 1, 1, 1, 0, 0]))
