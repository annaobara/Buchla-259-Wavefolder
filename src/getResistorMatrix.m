function R = getResistorMatrix()
    % Returns the resistor values for each folding stage
    R = [
        10e3, 100e3, 100e3;
        49.9e3, 100e3, 43.2e3;
        91e3, 100e3, 56e3;
        30e3, 100e3, 68e3;
        68e3, 100e3, 33e3
    ];
end

