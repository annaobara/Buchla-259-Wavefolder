function plotWaveform(Vout)
    % Plots the final output waveform
    plot(Vout);
    xlabel('Time (s)');
    ylabel('Amplitude (V)');
    title('Buchla 259 Wavefolder Output');
end
