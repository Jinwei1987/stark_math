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
Fs = 10;  # Sampling frequency
T = 1/Fs;   # Sampling period
L = 40;   # Length of the signal
t = (0:L-1)*T;  # Time vector

# 2. Signal Creation: Sum of a 50 Hz sinusoid and a 120 Hz sinusoid
f1 = 0.5;  # First frequency
f2 = 1;  # Second frequency
S = 0.7*sin.(2*pi*f1*t) + sin.(2*pi*f2*t);

# 3. FFT of the Signal
Y = fft(S);

# 4. Frequency Spectrum
P2 = abs.(Y/L);
P1 = P2[1:floor(Int, L/2+1)];
P1[2:end-1] .= 2*P1[2:end-1];
F = Fs*(0:(L/2))/L;

# Plotting
plot(F, P1)
title!("Single-Sided Amplitude Spectrum")
xlabel!("Frequency (Hz)")
ylabel!("Amplitude")

X = 0:0.01:5;
f(x) = cos(π*x) + cos(2*π*x)
g(x) = cos(4*π*x) + cos(2*π*x)
plot(X, g)
S = f.(X);
Y = fft(S);
P2 = abs.(Y/L);
P1 = P2[1:floor(Int, 21/2+1)];
P1[2:end-1] .= 2*P1[2:end-1];
plot(0.0:0.5:5.0, P1)

f(x) = x^2 + 1.5x + 1
g(x) = x^3 + x^2 + x + 1
ifft(fft([1, 1.5, 1, 0, 0, 0]) .* fft([1, 1, 1, 1, 0, 0]))
