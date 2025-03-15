% Buchla 259 Digital Wavefolder Simulation (Main)
clear; clc;

% Input signal
A = 6; f0 = 890; fs = 8*44100; Vs = 6; 
Vin = generateInput(A, f0, fs);

% Get resistor values
R = getResistorValues();

% Compute clipping points & thresholds
[thresholds, t1, t2, t3, t4] = computeClippingPoints(R, Vs, f0, A);

% Apply wavefolding & polyBLAMP
Vout = applyWavefolding(Vin, thresholds, R, f0, fs);

% Plot the result
figure;
plot(Vout);
xlabel('Time (s)');
ylabel('Amplitude (V)');
title('Buchla 259 Wavefolder Output');
