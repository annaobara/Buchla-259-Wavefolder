function Vin = generateInput(A, f0, fs)
    % Generates a sinusoidal input signal
    T = 1 / fs;
    T_total = 2 / f0;
    t = 0:T:T_total;
    Vin = A * sin(2 * pi * f0 * (0:length(t)-1) * T);
end
