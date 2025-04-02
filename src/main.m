% Main Simulation Script
clear; clc;

% Set parameters
A = 6;
f0 = 890;
fs = 8 * 44100;
Vs = 6;

% Generate input
Vin = generateInput(A, f0, fs);

% Get resistor matrix
R = getResistorMatrix();

% Compute thresholds and clipping points
[thresholds, t1, t2, t3, t4] = computeThresholds(R, Vs, A, f0);

% Apply wavefolding
Vout = wavefolder(Vin, R, thresholds, t1, t2, t3, t4, f0, fs, Vs);

% Plot
plotWaveform(Vout);

